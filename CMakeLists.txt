#This should be the first line of the CMakeLists.txt
cmake_minimum_required(VERSION 3.5)

project(live555)

add_subdirectory(groupsock)
add_subdirectory(BasicUsageEnvironment)
add_subdirectory(UsageEnvironment)
add_subdirectory(liveMedia)


file(GLOB USER_LIBS_FILE ./mediaServer/*.cpp)
add_executable(live555MediaServer
        ${USER_LIBS_FILE})   


# Specify compile options based on the platform
if(WIN32)
        add_compile_options(/W4)
	message(STATUS "live555MediaServer build in WIN32")
else()
        add_compile_options(-std=c++11 -O -DSOCKLEN_T=socklen_t -g -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64 -Wall -DBSD=1)
	message(STATUS "live555MediaServer build in UNIX")
endif()

add_definitions(-DNO_OPENSSL)

target_link_libraries(live555MediaServer
        PRIVATE liveMedia
        PRIVATE groupsock
        PRIVATE BasicUsageEnvironment
        PRIVATE UsageEnvironment
      )

target_include_directories(live555MediaServer 
        PUBLIC .
        PUBLIC include
        PUBLIC UsageEnvironment/include
        PUBLIC groupsock/include
        PUBLIC liveMedia/include
        PUBLIC BasicUsageEnvironment/include)

# test RTSPClient
add_executable(testRTSPClient testProgs/testRTSPClient.cpp)  
target_link_libraries(testRTSPClient
        PRIVATE liveMedia
        PRIVATE groupsock
        PRIVATE BasicUsageEnvironment
        PRIVATE UsageEnvironment
        )
target_include_directories(testRTSPClient 
        PUBLIC .
        PUBLIC include
        PUBLIC UsageEnvironment/include
        PUBLIC groupsock/include
        PUBLIC liveMedia/include
        PUBLIC BasicUsageEnvironment/include)