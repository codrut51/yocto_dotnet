.PHONY: all download_dotnet install_dotnet clean

all: download_dotnet install_dotnet

URL="https://download.visualstudio.microsoft.com/download/pr/7c130118-be9f-4e5b-89c3-97ffcfa2f45e/e156161f472b57159868c7b6225679f8/aspnetcore-runtime-2.2.4-linux-arm.tar.gz"
ROOTFS=/home/stone/Downloads
PACKAGE="aspnetcore-runtime-2.2.4-linux-arm.tar.gz"

download_dotnet: 
	wget ${URL}
	mv ${PACKAGE} ${ROOTFS}

install_dotnet:
	mkdir ${ROOTFS}/dotnet
	tar -xzf ${ROOTFS}/aspnetcore-runtime-2.2.4-linux-arm.tar.gz -C ${ROOTFS}/dotnet

clean:
	rm -r ${ROOTFS}/*