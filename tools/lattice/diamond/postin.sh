echo "Extracting compressed data files..."
cd $RPM_INSTALL_PREFIX/diamond/3.9_x64/bin; tar xzf bin.tar.gz; rm -f bin.tar.gz
cd $RPM_INSTALL_PREFIX/diamond/3.9_x64/cae_library; tar xzf cae_library.tar.gz; rm -f cae_library.tar.gz
cd $RPM_INSTALL_PREFIX/diamond/3.9_x64/data; tar xzf data.tar.gz; rm -f data.tar.gz
cd $RPM_INSTALL_PREFIX/diamond/3.9_x64/embedded_source; tar xzf embedded_source.tar.gz; rm -f embedded_source.tar.gz
cd $RPM_INSTALL_PREFIX/diamond/3.9_x64/examples; tar xzf examples.tar.gz; rm -f examples.tar.gz
cd $RPM_INSTALL_PREFIX/diamond/3.9_x64/ispfpga; tar xzf ispfpga.tar.gz; rm -f ispfpga.tar.gz
cd $RPM_INSTALL_PREFIX/diamond/3.9_x64/synpbase; tar xzf synpbase.tar.gz; rm -f synpbase.tar.gz
cd $RPM_INSTALL_PREFIX/diamond/3.9_x64/tcltk; tar xzf tcltk.tar.gz; rm -f tcltk.tar.gz

