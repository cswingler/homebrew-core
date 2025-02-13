class FernApi < Formula
  desc "Stripe-level SDKs and Docs for your API"
  homepage "https://buildwithfern.com/"
  url "https://registry.npmjs.org/fern-api/-/fern-api-0.39.11.tgz"
  sha256 "77a62a25b921b7c28598d04f75170102eed70fc6221c2e73e768b68e98cd80be"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "d39ffec9141f982f7fd0d1e421a664c68322b9c84cd44ab45824b08bbf741eb4"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/fern init 2>&1", 1)
    assert_match "Login required", output

    system bin/"fern", "--version"
  end
end
