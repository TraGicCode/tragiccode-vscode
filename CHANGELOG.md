## 2017-06-08 - Version 0.1.1

### Summary

Minor bug fixes with no breaking changes.

### Bug Fixes
 - Fixed broken rspec puppet tests
 - Fixed metadata.json to include o/s support to prevent getting dinged on the forge's automated module quality analysis


## 2017-06-06 - Version 0.1.0

### Summary

This is the initial release with functionality to manage visualstudiocode and extension installation.

### Features

- Added `app_data` fact ( Should probably moved out to a generic module )
- Added Classes
  - `vscode` ( Main Class )
  - `vscode::install`( Private )
  - `vscode::config` ( Private )
  - `vscode::params` ( Private )
- Added Defined Types
  - `vscode::extension`
