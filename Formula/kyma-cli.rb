class KymaCli < Formula
  desc "Kyma command-line interface"
  homepage "https://kyma-project.io"
  url "https://github.com/kyma-incubator/kyma-cli.git",
    :tag => "v0.4.0",
    :revision => "e948fa0292eec2ea7f15f899722334348c8ea5b9"
  head "https://github.com/kyma-incubator/kyma-cli.git"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/kyma-incubator/kyma-cli/"
    bin_path.install Dir["*"]

    cd bin_path do
      ENV.deparallelize {system "make"}
      system "make resolve"
      #system "make", "build"
      #bin.install "bin/kyma-darwin" "kyma-cli"
    end

    tests do

    end
  end
end
