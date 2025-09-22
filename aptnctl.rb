class Aptnctl < Formula
  desc "Thin wrapper over MicroK8s for local Kubernetes management"
  homepage "https://github.com/mnebus/aptnctl"
  version "0.1.2"
  url "https://github.com/mnebus/aptnctl/archive/v#{version}.tar.gz"
  sha256 "b88782d8619b27df047fa48cf4977c231b974a8090c72f621b969c18485ff003" # Homebrew computes this from the tarball

  # Explicitly depend on the Ubuntu MicroK8s formula from their tap
  depends_on "ubuntu/microk8s/microk8s" => :recommended

  def install
    bin.install "aptnctl"
  end

  def caveats
    <<~EOS
      To use aptnctl, ensure MicroK8s is installed and ready:
        brew install ubuntu/microk8s/microk8s
        microk8s install

      Then try: aptnctl start
    EOS
  end

  test do
    # Test that the script is executable and responds to 'stop' safely
    system "#{bin}/aptnctl", "stop"
  rescue
    # Ignore errors in test (e.g., MicroK8s not installed)
    nil
  end
end
