AUTOMAKE_OPTIONS = foreign

.PHONY: all download_dotnet install_dotnet clean

all: download_dotnet install_dotnet

URL="https://download.visualstudio.microsoft.com/download/pr/7c130118-be9f-4e5b-89c3-97ffcfa2f45e/e156161f472b57159868c7b6225679f8/aspnetcore-runtime-2.2.4-linux-arm.tar.gz"
WORKDIR=${DIR}
PACKAGE=aspnetcore-runtime-2.2.4-linux-arm.tar.gz

download_dotnet: 
	wget ${URL}
	mv ${PACKAGE} ${WORKDIR}


install_dotnet:
	tar -xzf ${PACKAGE} -C ${WORKDIR}
	rm -r ${PACKAGE}
	
clean:
	sudo rm -r ${WORKDIR}/dotnet