[![CMake Conan](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_conan.yml/badge.svg)](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_conan.yml)

[![CMake Conda](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_conda.yml/badge.svg)](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_conda.yml)

[![CMake CPM](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_cpm.yml/badge.svg)](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_cpm.yml)

[![CMake Fetch Content](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_fetch_content.yml/badge.svg)](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_fetch_content.yml)

[![CMake Hunter](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_hunter.yml/badge.svg)](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_hunter.yml)

[![CMake Vcpkg](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_vcpkg.yml/badge.svg)](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake_vcpkg.yml)

[![CMake Root](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake.yml/badge.svg)](https://github.com/patricia-gallardo/depend_on_me/actions/workflows/cmake.yml)

# depend_on_me

Background material created for my talk at NDC TechTown 2021: "Dependency Management
in C++"

## Talk abstract: Dependency Management in C++

C++ has been slow to settle on standardized tools for building and dependency
management. In recent years CMake has emerged as the de facto standard for builds, but
dependency management still has no clear winner. In this talk I will look into what
dependency management might look like in modern C++ projects and how that relates to
security.

## Dependencies required

* [SFML](https://github.com/SFML/SFML) (version 2.5.1)
* [Catch2](https://github.com/catchorg/Catch2) (version 2.13.7)
* [fmt](https://github.com/fmtlib/fmt) (version 8.0.1)

## Tools represented in the repo

* [Conan](https://conan.io/)
* [CPM](https://github.com/cpm-cmake/CPM.cmake)
* [Fetch Content](https://cmake.org/cmake/help/latest/module/FetchContent.html)
* [Hunter](https://hunter.readthedocs.io/en/latest/)
* [Vcpkg](https://vcpkg.io/en/index.html)
* [Conda](https://docs.conda.io) with [conda-forge](https://conda-forge.org/)-provided dependencies.

## GitHub Action Workflows

* All Dependency Managers will be using CMake as its build system
* All will be tested on the "latest" runners on GitHub Workflow: Linux, MacOS and
  Windows
* Caching will be attempted with all - currently implemented for Conan and Vcpkg
