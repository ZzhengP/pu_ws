# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zheng/pu_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zheng/pu_ws/build

# Include any dependencies generated for this target.
include hello/CMakeFiles/pu_test.dir/depend.make

# Include the progress variables for this target.
include hello/CMakeFiles/pu_test.dir/progress.make

# Include the compile flags for this target's objects.
include hello/CMakeFiles/pu_test.dir/flags.make

hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o: hello/CMakeFiles/pu_test.dir/flags.make
hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o: /home/zheng/pu_ws/src/hello/src/pu_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zheng/pu_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o"
	cd /home/zheng/pu_ws/build/hello && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pu_test.dir/src/pu_test.cpp.o -c /home/zheng/pu_ws/src/hello/src/pu_test.cpp

hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pu_test.dir/src/pu_test.cpp.i"
	cd /home/zheng/pu_ws/build/hello && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zheng/pu_ws/src/hello/src/pu_test.cpp > CMakeFiles/pu_test.dir/src/pu_test.cpp.i

hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pu_test.dir/src/pu_test.cpp.s"
	cd /home/zheng/pu_ws/build/hello && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zheng/pu_ws/src/hello/src/pu_test.cpp -o CMakeFiles/pu_test.dir/src/pu_test.cpp.s

hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o.requires:

.PHONY : hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o.requires

hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o.provides: hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o.requires
	$(MAKE) -f hello/CMakeFiles/pu_test.dir/build.make hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o.provides.build
.PHONY : hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o.provides

hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o.provides.build: hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o


# Object files for target pu_test
pu_test_OBJECTS = \
"CMakeFiles/pu_test.dir/src/pu_test.cpp.o"

# External object files for target pu_test
pu_test_EXTERNAL_OBJECTS =

/home/zheng/pu_ws/devel/lib/hello/pu_test: hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o
/home/zheng/pu_ws/devel/lib/hello/pu_test: hello/CMakeFiles/pu_test.dir/build.make
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libcv_bridge.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_core3.so.3.3.1
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgproc3.so.3.3.1
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgcodecs3.so.3.3.1
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libimage_transport.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libmessage_filters.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libclass_loader.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/libPocoFoundation.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libdl.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libroscpp.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/librosconsole.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libroslib.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/librospack.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libpython2.7.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/librostime.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /opt/ros/kinetic/lib/libcpp_common.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/zheng/pu_ws/devel/lib/hello/pu_test: hello/CMakeFiles/pu_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zheng/pu_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/zheng/pu_ws/devel/lib/hello/pu_test"
	cd /home/zheng/pu_ws/build/hello && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pu_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
hello/CMakeFiles/pu_test.dir/build: /home/zheng/pu_ws/devel/lib/hello/pu_test

.PHONY : hello/CMakeFiles/pu_test.dir/build

hello/CMakeFiles/pu_test.dir/requires: hello/CMakeFiles/pu_test.dir/src/pu_test.cpp.o.requires

.PHONY : hello/CMakeFiles/pu_test.dir/requires

hello/CMakeFiles/pu_test.dir/clean:
	cd /home/zheng/pu_ws/build/hello && $(CMAKE_COMMAND) -P CMakeFiles/pu_test.dir/cmake_clean.cmake
.PHONY : hello/CMakeFiles/pu_test.dir/clean

hello/CMakeFiles/pu_test.dir/depend:
	cd /home/zheng/pu_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zheng/pu_ws/src /home/zheng/pu_ws/src/hello /home/zheng/pu_ws/build /home/zheng/pu_ws/build/hello /home/zheng/pu_ws/build/hello/CMakeFiles/pu_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : hello/CMakeFiles/pu_test.dir/depend

