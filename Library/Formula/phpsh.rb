require 'formula'

class Phpsh <Formula
  head 'git://github.com/facebook/phpsh.git'
  homepage 'http://www.phpsh.org/'

  def install
    system "python", "setup.py", "build", "--build-scripts=build/scripts"
    libexec.install Dir["build/lib/*"]
    libexec.install "build/scripts/dbgp-phpsh.py"
    libexec.install "build/scripts/phpsh" => "phpsh.py"
    bin.mkpath
    ln_s libexec+'phpsh.py', bin+'phpsh'
    man1.install "src/doc/phpsh.1"

    (etc + 'phpsh').install "src/rc.php"
    (etc + 'phpsh').install "src/php_manual.db"
    (etc + 'phpsh').install "src/config.sample"

    ln_s (etc + 'phpsh'), (ENV['HOME'] + '/.phpsh')
  end
end

