export KCFLAGS += "${@bb.utils.contains("MACHINE", "dm8000", "-std=gnu17", "", d)}"
