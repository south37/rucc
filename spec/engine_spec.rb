require 'spec_helper'
require 'helpers'
require 'rucc'

RSpec.describe Rucc::Engine do
  describe "#parse" do
    it "returns array of ast" do
      testast '1', '1;'
      testast '1L', '1L;'
      testast '(+ (- (+ 1 2) 3) 4)', '1+2-3+4;'
      testast '(+ (+ 1 (* 2 3)) 4)', '1+2*3+4;'
      testast '(+ (* 1 2) (* 3 4))', '1*2+3*4;'
      testast '(+ (/ 4 2) (/ 6 3))', '4/2+6/3;'
      testast '(/ (/ 24 2) 4)', '24/2/4;'
      testast '(decl int a 3@0)', 'int a=3;'
      testast "(decl char c (conv 97=>char)@0)", "char c='a';"
      testast '(decl *char s (conv "abcd"=>*char)@0)', 'char *s="abcd";'
      testast "(decl [5]char s 'a'@0 's'@1 'd'@2 'f'@3 '\0'@4)", 'char s[]="asdf";'
      testast "(decl [4]char s 'a'@0 's'@1 'd'@2 'f'@3)", 'char s[4]="asdf";'
      testast "(decl [0]char s )", 'char s[0]="";'
      testast "(decl [2]char s 'a'@0 's'@1)", 'char s[2]="asd";'
      testast '(decl [3]int a 1@0 2@4 3@8)', 'int a[3]={1,2,3};'
      testast '(decl [3]int a 1@0 2@4 3@8)', 'int a[]={1,2,3};'
      testast '(decl [3][5]int a)', 'int a[3][5];'
      testast '(decl [5]*int a)', 'int *a[5];'
      testast '(decl int a 1@0);(decl int b 2@0);(= lv=a (= lv=b 3))', 'int a=1;int b=2;a=b=3;'
      testast '(decl int a 3@0);(addr lv=a)', 'int a=3;&a;'
      testast '(decl int a 3@0);(deref (addr lv=a))', 'int a=3;*&a;'
      testast '(decl int a 3@0);(decl *int b (addr lv=a)@0);(deref lv=b)', 'int a=3;int *b=&a;*b;'
      testast '(if 1 {2;})', 'if(1){2;}'
      testast '(if 1 {2;} {3;})', 'if(1){2;}else{3;}'
      testast '{{(decl int a 1@0);};.L0:;(if 3 (nil) goto(.L2));{5;};.L1:;7;goto(.L0);.L2:;}', 'for(int a=1;3;7){5;}'
      testast '"abcd"', '"abcd";'
      testast '"abcd"', '"ab" "cd";'
      testast "99", "'c';"
      testast '(int)a()', 'a();'
      testast '(int)a(1,2,3,4,5,6)', 'a(1,2,3,4,5,6);'
      testast '(return (conv 1=>int))', 'return 1;'
      testast '(< 1 2)', '1<2;'
      testast '(< 2 1)', '1>2;'
      testast '(< 1.0 (conv 2=>double))', '1.0<2;'
      testast '(== 1 2)', '1==2;'
      testast '(decl int a 1@0);(post++ lv=a)', 'int a=1;a++;'
      testast '(decl int a 1@0);(post-- lv=a)', 'int a=1;a--;'
      testast '(! 1)', '!1;'
      testast '(? 1 2 3)', '1?2:3;'
      testast '(and 1 2)', '1&&2;'
      testast '(or 1 2)', '1||2;'
      testast '(& 1 2)', '1&2;'
      testast '(| 1 2)', '1|2;'
      testast '1.2', '1.2;'
      testast '(+ 1.2 (conv 1=>double))', '1.2+1;'

      testastf '((int)=>int)f(int lv=c){lv=c;}', 'int f(int c){c;}'
      testastf '((int)=>int)f(int lv=c){lv=c;}((int)=>int)g(int lv=d){lv=d;}', 'int f(int c){c;} int g(int d){d;}'
      testastf '(decl int a 3@0)', 'int a=3;'

      testastf '(decl (struct) a)', 'struct {} a;'
      testastf '(decl (struct (int) (char)) a)', 'struct {int x; char y;} a;'
      testastf '(decl (struct ([3]int)) a)', 'struct {int x[3];} a;'
      testast '(decl (struct (int)) a);(decl *(struct (int)) p);(deref lv=p).x', 'struct tag {int x;} a; struct tag *p; p->x;'
      testast '(decl (struct (int)) a);lv=a.x', 'struct {int x;} a; a.x;'
      testast '(decl (struct (int:0:5) (int:5:13)) x)', 'struct { int a:5; int b:8; } x;'

      testast '(decl (struct (int) (int)) v3 61@0);(return (conv lv=v3.x=>int))', 'struct { union { int x, y; }; } v3 = { .x = 61 }; return v3.x;'
      testast "(decl [4]char t 'd'@0 'e'@1 'f'@2 '\0'@3)", 'char t[] = { "def" };'
      testast '(decl int a 0@0);(= lv=a (% lv=a 6))', 'int a = 0;a %= 6;'
      testast '(decl [2][3]int a);(decl *int p (+ (conv lv=a=>*[3]int) 1)@0);(= (deref lv=p) 1)', 'int a[2][3]; int *p = a + 1; *p = 1;'
      testastf '(decl (Unknown ty: STUB) t7)', 'static int ((t7))();'
      testastf(
        '((int)=>int)f(int lv=a){(void)expect(1,(< (conv 1=>uint) 4294967295));}',
        <<-SOURCE
          void expect(int a, int b);
          int f(int a) {
            expect(1, 0xFFFFFFFFU > 1);
          }
        SOURCE
      )
      testastf(
        '((*(struct (uint) (uint) (*void) (*void)))=>*void)' +
        '__va_arg_gp(*(struct (uint) (uint) (*void) (*void)) lv=ap)' +
        '{(decl *void r (+ ((*void)=>(*char) (deref lv=ap).reg_save_area) (deref lv=ap).gp_offset)@0);}',
        <<-SOURCE
          typedef struct {
              unsigned int gp_offset;
              unsigned int fp_offset;
              void *overflow_arg_area;
              void *reg_save_area;
          } __va_elem;
          void *__va_arg_gp(__va_elem *ap) {
            void *r = (char *)ap->reg_save_area + ap->gp_offset;
          }
        SOURCE
      )
      testastf(
        '(()=>*void)test_return_address_sub2(){(return (conv (*void)__builtin_return_address((conv 1=>*void))=>*void));}' +
        '(()=>*void)test_return_address_sub1(){' +
          '(void)expect((conv ((*void)=>(long) (*void)__builtin_return_address((conv 0=>*void)))=>int),(conv ((*void)=>(long) (*void)test_return_address_sub2())=>int));' +
          '(return (conv (*void)__builtin_return_address((conv 0=>*void))=>*void));' +
        '}',
        <<-SOURCE
          void expect(int a, int b);

          static void *test_return_address_sub2() {
              return __builtin_return_address(1);
          }

          static void *test_return_address_sub1() {
              expect((long)__builtin_return_address(0), (long)test_return_address_sub2());
              return __builtin_return_address(0);
          }
        SOURCE
      )
      testastf(
        '(decl [5]int x1 1@0 2@4 3@8 4@12 5@16)' +
        '(decl *int p1 (conv gv=x1=>*int)@0)' +
        '(decl *int q1 (+ (conv gv=x1=>*int) 2)@0)' +
        '(decl int x2 7@0)' +
        '(decl *int p2 (+ (addr gv=x2) 1)@0)' +
        '(()=>void)testmain(){' +
          '(void)expect(1,(deref gv=p1));' +
          '(void)expect(3,(deref gv=q1));' +
          '(void)expect(7,(deref (+ gv=p2 (- 0 1))));' +
        '}',
        <<-SOURCE
          int x1[] = { 1, 2, 3, 4, 5 };
          int *p1 = x1;
          int *q1 = x1 + 2;

          int x2 = 7;
          int *p2 = &x2 + 1;

          void expect(int a, int b);

          void testmain() {
              expect(1, *p1);
              expect(3, *q1);
              expect(7, p2[-1]);
          }
        SOURCE
      )
      testastf(
        '(()=>int)t6(){(return (conv 3=>int));}(()=>*()=>int)retfunc(){(return (conv (addr (funcdesg t6))=>*()=>int));}',
        <<-SOURCE
          int t6() {
              return 3;
          }
          typedef int (*t6_t)(void);
          static t6_t retfunc() {
            return &t6;
          }
        SOURCE
      )
    end

    def testastf(expected, code)
      result = Rucc::Engine.new(ARGV, StringIO.new(code)).parse.join('')
      expect(expected).to eq result
    end

    def testast(expected, code)
      testastf "(()=>int)f(){#{expected};}", "int f(){#{code}}"
    end
  end

  describe "#gen" do
    it "generates assembly" do
      Dir.glob("#{::Rucc.root}/spec/targets/*.c").sort.each do |f|
        basename = File.basename(f)

        # NOTE: skip import.c because it causes error interntionally
        if basename == "import.c"
          next
        end

        test(f)
      end
    end

    def test(f)
      target = File.read(f.gsub(/\.c$/, ".s"))
      argv = ["-I", "#{::Rucc.root}/spec/targets", f]
      result = Rucc::Engine.new(argv).gen
      expect(result).to eq Helpers.normalize(target)
    end
  end
end
