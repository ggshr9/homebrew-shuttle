# Formula/shuttle.rb
#
# This formula's `version`, `url`, and `sha256` fields are auto-updated
# by `mislav/bump-homebrew-formula-action` when a `v*` tag is pushed to
# https://github.com/ggshr9/shuttle. Until the first such release lands,
# the tap exists as scaffolding only — `brew install shuttle` will fail
# at download time. After the first release, this comment can be deleted.

class Shuttle < Formula
  desc "Multi-transport network toolkit (CLI client)"
  homepage "https://github.com/ggshr9/shuttle"
  version "1.0.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/ggshr9/shuttle/releases/download/v1.0.0/shuttle-darwin-arm64.tar.gz"
      sha256 "f79babe37e5a023ee22d9e0e117f3d945f25aea31090ed4075d72d07eddbc78c"
    end
    on_intel do
      url "https://github.com/ggshr9/shuttle/releases/download/v1.0.0/shuttle-darwin-amd64.tar.gz"
      sha256 "021c2d24e074bc5724fe90633d9c505ed6c5e8a7b72673e5c09390df16ffabff"
    end
  end

  def install
    bin.install "shuttle"
    bash_completion.install "completions/shuttle.bash" => "shuttle" if File.exist?("completions/shuttle.bash")
    zsh_completion.install  "completions/_shuttle"      if File.exist?("completions/_shuttle")
    fish_completion.install "completions/shuttle.fish"  if File.exist?("completions/shuttle.fish")
  end

  test do
    assert_match(/shuttle/i, shell_output("#{bin}/shuttle --version"))
  end
end
