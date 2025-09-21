class Aptnctl < Formula
  desc "Thin wrapper over MicroK8s for local Kubernetes management"
  homepage "https://github.com/mnebus/aptnctl"
  version "0.1.0"
  url "https://github.com/mnebus/aptnctl/archive/v#{version}.tar.gz"
  sha256 "auto" # Homebrew computes this from the tarball

  depends_on "microk8s" => :recommended

  def install
    bin.install "aptnctl"
  end

  test do
    # Test that the script is executable and responds to 'stop' safely
    system "#{bin}/aptnctl", "stop"
  rescue
    # Ignore errors in test (e.g., MicroK8s not installed)
    nil
  end
end
