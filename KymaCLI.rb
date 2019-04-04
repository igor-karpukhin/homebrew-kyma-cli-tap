class Kymacli < Formula
  desc "Kyma command-line interface"
  homepage "https://kyma-project.io"
  url "https://github.com/kyma-incubator/kyma-cli.git",
    :tag => "v0.4.0",
    :revision => "e948fa0292eec2ea7f15f899722334348c8ea5b9"
  head "https://github.com/kyma-incubator/kyma-cli.git"


  bottle do
    cellar :skip_any_relocation
  end

  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath
    dir.install buildpath.children - [buildpath/".brew_home"]

    cd dir do
      system "make resolve && make build"
      bin.install "bin/kyma-darwin"
    end
    prefix.install_metafiles
  end
end
