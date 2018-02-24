FROM kierdavis/gem5-src:latest

RUN scons --directory=/opt/gem5 build/X86/gem5.opt -j$(nproc)

ENTRYPOINT ["/opt/gem5/build/X86/gem5.opt"]
