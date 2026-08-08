let
  username = "young";
  localbin = "$HOME/.local/bin";
  gobin = "$HOME/go/bin";
  rustbin = "$HOME/.cargo/bin";
in {
  # general
  username = username;
  userfullname = "young";
  useremail = "young@example.com";
  path = "PATH=\"$PATH:${localbin}:${gobin}:${rustbin}\"";

  sshAuthorizedKeys = [];
}
