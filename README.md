# CSV Lint Action

GitHub action that runs `csvlint`.

The project is heavily based on salt-lint-action, which was created by Roald Nefs

## Usage

Run lint with default setting:

```
on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    name: csv lint
    steps:
    - uses: actions/checkout@v1
    - name: Run csv-lint
      uses: blackstar257/docker-csvlint@master
      env:
        ACTION_STATE_NAME: "_data/companies.csv"
```
