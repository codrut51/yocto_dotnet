AUTOMAKE_OPTIONS = foreign

.PHONY: all download_dotnet install_dotnet install clean

all: install

ROOTDIR=${DIR}
WORKDIR=/usr/share
DOWNLOAD=/usr/share/download
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

install:
	mkdir -p ${ROOTDIR}/${WORKDIR}/workdir/dotnet/host/
	mkdir -p ${ROOTDIR}/${WORKDIR}/workdir/dotnet/share/
	mkdir -p ${ROOTDIR}/${WORKDIR}/dotnet/
	mv ${ROOTDIR}/${DOWNLOAD}/${PACKAGE} ${ROOTDIR}/${WORKDIR}/workdir/

	
	tar -xzf ${ROOTDIR}/${WORKDIR}/workdir/${PACKAGE} -C ${ROOTDIR}/${WORKDIR}/workdir/dotnet/
	rm -r ${ROOTDIR}/${WORKDIR}/workdir/${PACKAGE}

	install -m 0755 ${ROOTDIR}/${WORKDIR}/workdir/dotnet/dotnet ${ROOTDIR}/${WORKDIR}/dotnet/
	install -m 0644 ${ROOTDIR}/${WORKDIR}/workdir/dotnet/LICENSE.txt ${ROOTDIR}/${WORKDIR}/dotnet/
	install -m 0644 ${ROOTDIR}/${WORKDIR}/workdir/dotnet/ThirdPartyNotices.txt ${ROOTDIR}/${WORKDIR}/dotnet/

	cp -r ${ROOTDIR}/${WORKDIR}/workdir/dotnet/host/ ${ROOTDIR}/${WORKDIR}/dotnet/
	cp -r ${ROOTDIR}/${WORKDIR}/workdir/dotnet/shared/ ${ROOTDIR}/${WORKDIR}/dotnet/

	ln -s ${ROOTDIR}/${WORKDIR}/dotnet/dotnet ${ROOTDIR}/${BINDIR}/dotnet

clean:
	sudo rm -r ${ROOTDIR}/${WORKDIR}/dotnet
	sudo rm -r ${ROOTDIR}/${WORKDIR}/workdir