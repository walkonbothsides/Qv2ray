REM Please call me at the root of the project folder.
REM Extract files.
tools\7z.exe e gRPC-win32.tar.gz && tools\7z.exe x gRPC-win32.tar -otools\gRPC-win32\
tools\7z.exe e protobuf-win32.tar.gz && tools\7z.exe x protobuf-win32.tar -otools\protobuf-win32\

REM Generate grpc.pb.h using gRPC and protocol buffer
tools\protobuf-win32\protoc.exe --grpc_out=.\ --plugin=protoc-gen-grpc=`tools\gRPC-win32\bin\grpc_cpp_plugin.exe` .\src\utils\gRPC\command.proto
tools\protobuf-win32\protoc.exe --cpp_out=.\ .\src\utils\gRPC\command.proto
