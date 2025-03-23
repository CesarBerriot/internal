function(internal_setup_target target)
    string(RANDOM LENGTH 32 suffix)

    set(path ${CMAKE_CURRENT_BINARY_DIR}/internal/${suffix}.h)

    file(WRITE "${path}"
      "#pragma once\n"
      "#define INTERNAL(symbol_name) symbol_name##_${suffix}\n"
    )

    if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
        target_compile_options(${target} PRIVATE /FI "${path}")
    elseif(CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
        target_compile_options(${target} PRIVATE -include "${path}")
    else()
        message(FATAL_ERROR "Unsupported compiler.")
    endif()
endfunction()