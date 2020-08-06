export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"
wget qtcreator-src.zip https://github.com/francescmm/ci-utils/releases/download/qt/qt-creator-opensource-src-${QTC_VERSION}.0.zip;
unzip -qq qtcreator-src.zip
wget qtcreator-bin.zip https://github.com/francescmm/ci-utils/releases/download/qt/qt-creator-bin-osx.zip;
unzip -qq qtcreator-bin.zip
export QT_CREATOR=bin/QtCreator.app/Contents/MacOS
export PATH="/usr/local/opt/qt/bin:$QT_CREATOR:$PATH"
export QT_PLUGIN_PATH=$PWD/qt5/plugins;
export PLUGIN_VERSION="1.0.1";
source ~/.bash_profile
qmake QTC_SOURCE=./qt-creator-opensource-src-${QTC_VERSION}.0 QTC_BUILD=. doxygen.pro
make
cp bin/QtCreator.app/Contents/PlugIns/libDoxygen.dylib libDoxygen_$PLUGIN_VERSION-qtc${QTC_COMPAT}.0.dylib