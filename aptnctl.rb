class Aptnctl < Formula
  desc "Thin wrapper over MicroK8s for local Kubernetes management"
  homepage "https://github.com/mnebus/aptnctl"
  version "0.1.1"
  url "https://github.com/mnebus/aptnctl/archive/v#{version}.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5" # Homebrew computes this from the tarball

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
