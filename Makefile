AUTOMAKE_OPTIONS = foreign

.PHONY: all download_dotnet install_dotnet clean

all: download_dotnet install_dotnet

URL="https://download.visualstudio.microsoft.com/download/pr/7c130118-be9f-4e5b-89c3-97ffcfa2f45e/e156161f472b57159868c7b6225679f8/aspnetcore-runtime-2.2.4-linux-arm.tar.gz"
WORKDIR=${DIR}
BINDIR=/usr/bin
PACKAGE=aspnetcore-runtime-2.2.4-linux-arm.tar.gz

download_dotnet: 
	wget ${URL}
	mv ${PACKAGE} ${WORKDIR}/workdir/


install_dotnet:
	tar -xzf ${WORKDIR}/workdir/${PACKAGE} -C ${WORKDIR}/workdir/dotnet/
	rm -r ${WORKDIR}/workdir/${PACKAGE}

	install -m 0755 ${WORKDIR}/workdir/dotnet/dotnet ${WORKDIR}/dotnet/
	install -m 0644 ${WORKDIR}/workdir/dotnet/LICENSE.txt ${WORKDIR}/dotnet/
	install -m 0644 ${WORKDIR}/workdir/dotnet/ThirdPartyNotices.txt ${WORKDIR}/dotnet/

	cp -r ${WORKDIR}/workdir/dotnet/host/ ${WORKDIR}/dotnet/
	cp -r ${WORKDIR}/workdir/dotnet/shared/ ${WORKDIR}/dotnet/

	ln -s ${WORKDIR}/dotnet/dotnet ${BINDIR}/dotnet

clean:
	sudo rm -r ${WORKDIR}/dotnet