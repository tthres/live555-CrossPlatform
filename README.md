# Live555-CMake
live555项目的CMake管理<br/>
移除了OpenSSL库的依赖，Live555版本为2021.11.14。



## 编译

1. 克隆项目：`git clone git@gitlab.gz.cvte.cn:zhangkaizhe/live555-cmake.git`
2. 进入项目目录：`cd live555-cmake`
### Windows
执行： `Windows-build.bat`


### Linux
执行： `Linux-build.sh`

## 使用
默认编译了 `live555MediaServer` 和 `testRTSPClient` ,若需要在编译测试程序可在 `./CMakeLists.txt` 添加目标再次编译：
```cmake
# proxy live555
add_executable(live555ProxyServer proxyServer/live555ProxyServer.cpp)  
target_link_libraries(live555ProxyServer
        PRIVATE liveMedia
        PRIVATE groupsock
        PRIVATE BasicUsageEnvironment
        PRIVATE UsageEnvironment
      )
target_include_directories(live555ProxyServer 
        PUBLIC .
        PUBLIC include
        PUBLIC UsageEnvironment/include
        PUBLIC groupsock/include
        PUBLIC liveMedia/include
        PUBLIC BasicUsageEnvironment/include)
```






For documentation and instructions for this software,
see <http://www.live555.com/liveMedia/>
