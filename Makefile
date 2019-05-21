AUTOMAKE_OPTIONS = foreign

.PHONY: all download_dotnet install_dotnet clean

all: download_dotnet install_dotnet

WORKDIR=/usr/shared
DOWNLOAD=/usr/shared/download
BINDIR=/usr/bin
PACKAGE=aspnetcore-runtime-2.2.4-linux-arm.tar.gz

download_dotnet: 
	mkdir -p ${WORKDIR}/workdir/dotnet/host/
	mkdir -p ${WORKDIR}/workdir/dotnet/share/
	mkdir -p ${WORKDIR}/dotnet/
	mv ${DOWNLOAD}/${PACKAGE} ${WORKDIR}/workdir/


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
	sudo rm -r ${WORKDIR}/workdir