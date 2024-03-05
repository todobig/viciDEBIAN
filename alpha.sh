
# Add PHP 7.4 repository
sudo apt-get install ca-certificates apt-transport-https software-properties-common -y
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

# Update package lists and install required packages
sudo apt-get update
sudo apt-get install build-essential linux-headers-$(uname -r) subversion unzip libjansson-dev libsqlite3-dev autoconf automake libxml2-dev libncurses-dev -y

# Add MariaDB 10.6 repository - its not  updateted at the moment 
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
deb [arch=amd64,arm64,ppc64el] https://mariadb.mirror.liquidtelecom.com/repo/10.6/debian bookworm main

# Update package lists and install required packages
sudo apt-get update
sudo apt-get install apache2 php7.4 php7.4-cli php7.4-common php7.4-json php7.4-mbstring php7.4-mysql php7.4-readline sox lame screen libnet-telnet-perl libasterisk-agi-perl mariadb-server mariadb-client libelf-dev autogen libtool shtool libdbd-mysql-perl uuid-dev libssl-dev git curl wget -y
sudo apt-get install libsrtp2-dev
sudo apt-get install libmariadb-dev
# Install libc6-i386 (for ASTblind and ASTloop)
sudo apt-get install libc6-i386 -y

# Install Jansson
cd /usr/src/
wget http://www.digip.org/jansson/releases/jansson-2.5.tar.gz
tar -zxf jansson-2.5.tar.gz
cd jansson-2.5
./configure
make clean
make
sudo make install
sudo ldconfig

# Install CPANM
sudo apt-get install cpanminus -y

# Install Perl modules
sudo cpanm -f File::HomeDir File::Which CPAN::Meta::Requirements CPAN YAML MD5 Digest::MD5 Digest::SHA1 Bundle::CPAN DBI DBD::mysql Net::Telnet Time::HiRes Net::Server Switch Mail::Sendmail Unicode::Map Jcode Spreadsheet::WriteExcel OLE::Storage_Lite Proc::ProcessTable IO::Scalar Spreadsheet::ParseExcel Curses Getopt::Long Net::Domain Term::ReadKey Term::ANSIColor Spreadsheet::XLSX Spreadsheet::Read LWP::UserAgent HTML::Entities HTML::Strip HTML::FormatText HTML::TreeBuilder Time::Local MIME::Decoder Mail::POP3Client Mail::IMAPClient Mail::Message IO::Socket::SSL MIME::Base64 MIME::QuotedPrint Crypt::Eksblowfish::Bcrypt Crypt::RC4 Text::CSV Text::CSV_XS
