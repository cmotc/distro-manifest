include config.mk
DATE = `date +'%Y%m%d'`

COMMIT_MESSAGE = $(GH_NAME)
COMMIT_MESSAGE += $(DEV_MESSAGE)
COMMIT_MESSAGE += `date +'%y%m%d%H%M%S'`

dummy:
	echo "test"

clone:
	\git clone git@github.com:$(GH_NAME)/distro-manifest . || \git clone https://github.com/$(GH_NAME)/distro-manifest || git clone https://github.com/cmotc/distro-manifest .; \
	\git clone git@github.com:$(GH_NAME)/pkpage || \git clone https://github.com/$(GH_NAME)/pkpage || git clone https://github.com/cmotc/pkpage; \
	\git clone git@github.com:$(GH_NAME)/scpage || \git clone https://github.com/$(GH_NAME)/scpage || git clone https://github.com/cmotc/scpage; \
	\git clone git@github.com:$(GH_NAME)/apt-now || \git clone https://github.com/$(GH_NAME)/apt-now || git clone https://github.com/cmotc/apt-now; \
	\git clone git@github.com:$(GH_NAME)/fireaxe || \git clone https://github.com/$(GH_NAME)/fireaxe || git clone https://github.com/cmotc/fireaxe; \
	\git clone git@github.com:$(GH_NAME)/awesome-lb-base || \git clone https://github.com/$(GH_NAME)/awesome-lb-base || git clone https://github.com/cmotc/awesome-lb-base; \
	\git clone git@github.com:$(GH_NAME)/hoarderMediaOS || \git clone https://github.com/$(GH_NAME)/hoarderMediaOS || git clone https://github.com/cmotc/hoarderMediaOS; \
	\git clone git@github.com:$(GH_NAME)/way-cooler || \git clone https://github.com/$(GH_NAME)/way-cooler || git clone https://github.com/cmotc/way-cooler; \
	\git clone git@github.com:$(GH_NAME)/wlc || \git clone https://github.com/$(GH_NAME)/wlc || git clone https://github.com/cmotc/wlc; \
	echo "Cloned subprojects"

deinit:
	 \git remote remove github \
	cd ../pkpage && \git remote remove github; \
	cd ../scpage && \git remote remove github; \
	cd ../apt-now && \git  remote remove github; \
	cd ../fireaxe && \git remote remove github; \
	cd ../awesome-lb-base && \git remote remove github; \
	cd ../hoarderMediaOS && \git remote remove github; \
	cd ../way-cooler && \git remote remove github; \
	cd ../wlc && \git remote remove github; \
	echo "removed pre-init"

init:
	make init-upstream; \
	\git remote add github git@github.com:$(GH_NAME)/distro-manifest; \
	cd pkpage && \git remote add github git@github.com:$(GH_NAME)/pkpage; \
	cd ../scpage && \git  remote add github git@github.com:$(GH_NAME)/scpage; \
	cd ../apt-now && \git  remote add github git@github.com:$(GH_NAME)/apt-now; \
	cd ../fireaxe && \git  remote add github git@github.com:$(GH_NAME)/fireaxe; \
	cd ../awesome-lb-base && \git  remote add github git@github.com:$(GH_NAME)/awesome-lb-base; \
	cd ../hoarderMediaOS && \git  remote add github git@github.com:$(GH_NAME)/hoarderMediaOS; \
	cd ../way-cooler && \git remote add github git@github.com:$(GH_NAME)/way-cooler; \
	cd ../wlc && \git  remote add github git@github.com:$(GH_NAME)/wlc; \
	echo "Initialized Working Remotes"
	make checkout

init-upstream:
	\git remote add upstream git@github.com:cmotc/distro-manifest; \
	cd pkpage && \git remote add upstream git@github.com:cmotc/pkpage; \
	cd ../scpage && \git  remote add upstream git@github.com:cmotc/scpage; \
	cd ../apt-now && \git  remote add upstream git@github.com:cmotc/apt-now; \
	cd ../fireaxe && \git  remote add upstream git@github.com:cmotc/fireaxe; \
	cd ../awesome-lb-base && \git  remote add upstream git@github.com:cmotc/awesome-lb-base; \
	cd ../hoarderMediaOS && \git  remote add upstream git@github.com:cmotc/hoarderMediaOS; \
	cd ../way-cooler && \git remote add upstream git@github.com:way-cooler/way-cooler; \
	cd ../wlc && \git  remote add upstream git@github.com:cmotc/wlc; \
	echo "Initialized Upstream Remotes"

checkout:
	\git checkout master
	cd pkpage && \git  checkout master
	cd scpage && \git  checkout master
	cd apt-now && \git checkout master
	cd fireaxe && \git  checkout master
	cd awesome-lb-base && \git  checkout master
	cd hoarderMediaOS && \git  checkout master
	cd way-cooler && \git checkout master
	cd wlc && \git  checkout master

commit:
	\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd pkpage && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../scpage && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../apt-now && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../fireaxe && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../awesome-lb-base && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../hoarderMediaOS && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../way-cooler && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	cd ../wlc && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
	echo "Committed Release:"
	echo "${COMMIT_MESSAGE}"

fetch:
	git fetch upstream &&\git rebase upstream/master; \
	git fetch github &&\git rebase github/master; \
	cd pkpage && git fetch upstream && \git rebase upstream/master; \
	cd ../scpage && git fetch upstream && \git rebase upstream/master; \
	cd ../apt-now && git fetch upstream && \git rebase upstream/master; \
	cd ../fireaxe && git fetch upstream && \git rebase upstream/master; \
	cd ../awesome-lb-base && git fetch upstream && \git rebase upstream/master; \
	cd ../hoarderMediaOS && git fetch upstream && \git rebase upstream/master; \
	cd ../way-cooler && git fetch upstream && \git rebase upstream/master; \
	cd ../wlc && git fetch upstream && \git rebase upstream/master; \
	echo "Pulled in updates"

pull:
	make commit
	make fetch

update:
	make commit
	repo sync --force-sync || make fetch

force-update:
	make clean; \
	rm -rf */* */.git */.repo .git/; \
	repo sync --force-sync || make fetch \
	make init

upload:
	\git push github master; \
	cd pkpage && \git push github master; \
	cd ../scpage && \git push github master; \
	cd ../apt-now && \git push github master; \
	cd ../fireaxe && \git push github master; \
	cd ../awesome-lb-base && \git push github master; \
	cd ../hoarderMediaOS && \git push github master; \
	cd ../way-cooler && \git push github master; \
	cd ../wlc && \git push github master; \
	#cd ../tab-web && \git push github master;
	echo "Pushed Working Updates"

clean:
	cd pkpage && make clean; \
	cd ../scpage && make clean; \
	cd ../apt-now && make clean; \
	cd ../fireaxe && make clean; \
	cd ../awesome-lb-base && make clean; \
	cd ../hoarderMediaOS && make clean; \
	cd ../way-cooler && make clean; \
	cd ../wlc && make clean; \
	cd .. && rm *.buildinfo *.changes *.deb *.deb.md *.dsc *.tar.xz *.tar.gz *.debian.tar.xz *.debian.tar.gz *.orig.tar.gz *.orig.tar.zz *.iso; \
	echo "Finished cleaning"

pkpage:
	export VERSION=$(VERSION);cd pkpage && make deb-pkg

update-pkpage:
	export VERSION=$(VERSION);cd pkpage &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

scpage:
	export VERSION=$(VERSION);cd scpage && make deb-pkg

update-scpage:
	export VERSION=$(VERSION);cd scpage &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

aptnow:
	export VERSION=$(VERSION);cd apt-now && make deb-pkg || make deb-pkg

update-aptnow:
	export VERSION=$(VERSION);cd apt-now &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

fireaxe:
	export VERSION=$(VERSION);cd fireaxe && make

update-fireaxe:
	export VERSION=$(VERSION);cd fireaxe &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

awesomelive:
	export VERSION=$(VERSION);cd fireaxe && make allclean

update-awesomelive:
	export VERSION=$(VERSION);cd fireaxe &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

hoarderos:
	export VERSION=$(VERSION);cd fireaxe && make allclean

update-hoarderos:
	export VERSION=$(VERSION);cd fireaxe &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

waylc:
	export VERSION=$(VERSION);cd wlc && make

update-waylc:
	export VERSION=$(VERSION);cd wlc &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

cooler:
	export VERSION=$(VERSION);cd way-cooler && make

update-cooler:
	export VERSION=$(VERSION);cd way-cooler &&\git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

web:
	rm -rf tab-web/tab-deb
	cp -R tab-deb tab-web/tab-deb
	rm -rf tab-web/tab-deb/.git

reweb:
	cd tab-web && make && git add . && git commit -am "new webpage ${COMMIT_MESSAGE}" ; git push github master

update-web:
	export VERSION=$(VERSION);cd tab-web && \git add . && \git commit -am "${COMMIT_MESSAGE}"; \
		\git push github master

sign:
	export KEY=$(KEY); export GH_NAME=$(GH_NAME); ./.do_sign.sh

deb:
	rm tab-deb/packages/*
	cp lair_$(VERSION)-1_amd64.buildinfo \
		tab-deb/packages; \
	cp lairart_$(VERSION)-1_amd64.buildinfo \
		tab-deb/packages; \
	cd tab-deb && ./apt-now

full:
	gpg --batch --yes --clear-sign -u $(KEY) README.md
	make uboot
	make scpage
	make nonfree-touchscreen-firmware-common
	make ath6kl
	echo "Rebuilt the whole suite"

push:
	gpg --batch --yes --clear-sign -u $(KEY) README.md
	#make reweb
	make commit
	make upload

version:
	echo 'version placeholder'
	#cd pkpage && make release; \
	#cd ../scpage && make release; \
	#cd .. && make release \
	#echo 'Made new Version Numbers'

release:
	make version
	gpg --batch --yes --clear-sign -u $(KEY) README.md
	make full
	make sign
	make reweb
	make push
	repo sync

