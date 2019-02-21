FROM alpine:edge

RUN echo "Installing dependencies" && \
	apk add --no-cache cmake git make g++ libstdc++ binutils && \
    echo "Compiling bloaty" && \
	git clone https://github.com/google/bloaty.git && \
	cd bloaty && \
	cmake . && \
	make -j6 && \
        make install && \
    echo "Stripping down filesize" && \
        find /usr/local/bin* -exec strip -s {} \; && \
        find /usr/local/lib* -exec strip -s {} \; && \
    echo "Cleaning up" && \
	apk del cmake git make binutils g++ && \
	cd / && \
	rm -rf /bloaty

COPY ./run-bloaty.sh /usr/bin/run-bloaty

ENTRYPOINT [ "run-bloaty" ]
