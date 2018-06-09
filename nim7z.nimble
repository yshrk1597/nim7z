# Package

version       = "0.1.0"
author        = "genotrance"
description   = "7z extraction for Nim"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.1.5"

import distros

var cmd = ""
if detectOs(Windows):
    cmd = "cmd /c "

task setup, "Download and generate":
    exec cmd & "nimgen nim7z.cfg"

before install:
    setupTask()

task test, "Test":
    exec "nim c -r tests/test7z.nim"