name              "java"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs Java runtime."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.13.0"

recipe "java", "Installs Java runtime"
recipe "java::openjdk", "Installs the OpenJDK flavor of Java"
recipe "java::oracle", "Installs the Oracle flavor of Java"
recipe "java::oracle_i386", "Installs the 32-bit jvm without setting it as the default"
recipe "java::oracle_rpm", "Installs the Oracle RPM flavor of Java"

%w{
    ubuntu
    centos
    redhat
    scientific
    fedora
    amazon
    arch
    oracle
    freebsd
    windows
}.each do |os|
  supports os
end

depends "windows"
