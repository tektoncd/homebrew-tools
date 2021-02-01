# Install tektoncd cli with brews

This repository has been deprecated, you should use the tektoncd-cli package
from the [official repository](https://formulae.brew.sh/formula/tektoncd-cli) on
homebrew-core, if you have previously installed tektoncd-cli with the `tap`
method, please do the following :


```shell
brew untap tektoncd/tools
brew install tektoncd-cli

```

Following releases should get picked up automatically with `brew upgrade` from the official repostiory.
