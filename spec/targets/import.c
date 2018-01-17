// Copyright 2012 Rui Ueyama. Released under the MIT license.

#include "test.h"

// import.h would raise an error if read twice.
#import "import.h"
#import "import.h"
#include "import.h"
#import "../files/import.h"

// once.h would raise an error if read twice
#include "once.h"
#include "once.h"
#import "once.h"
#include "../files/once.h"

void testmain() {
    print("import");
}
