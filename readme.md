```cmake
include(FetchContent)

FetchContent_Declare(
  internal
  GIT_REPOSITORY https://github.com/CesarBerriot/internal.git
  GIT_TAG 1.0.0
)
FetchContent_MakeAvailable(internal)

include(${internal_SOURCE_DIR}/internal.cmake)

internal_setup_target(TARGET_NAME)
```