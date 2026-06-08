# Default behavior when running 'just' without input.
default:
    @just --choose

# Lists the commands without prompting for selection.
list:
    @just -l

# Runs 'Molecule' test scenario for specific version installation
test-install:
  @molecule  test --scenario-name install -- -vv

# Runs 'Molecule' test scenario for specific version installation with custom path
test-install-custom-path:
  @molecule  test --scenario-name install-custom-path -- -vv

# Runs 'Molecule' test scenario removing a specific version which is not
# set as primary version.
test-remove-version:
  @molecule  test --scenario-name remove-version -- -vv

# Runs 'Molecule' test scenario removing a specific version which is
# set as primary version.
test-remove-version-primary:
  @molecule  test --scenario-name remove-version-primary -- -vv

# Runs 'Molecule' test scenario removing the primary path addition.
test-remove-primary:
  @molecule  test --scenario-name remove-primary -- -vv

# Runs 'Molecule' test scenario removing every version
test-remove:
  @molecule  test --scenario-name remove -- -vv
