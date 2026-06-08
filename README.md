# Ansible Deno

An Ansible role for managing installation of Deno (https://github.com/denoland/deno).


### Requirements

This role requires two separate tools be installed.

First it requires the `ansible.utils` collection be installed from Ansible-Galaxy via:

```bash
ansible-galaxy collection install ansible.utils
```

Secondly it requires the `jsonschema` Python package be installed via:

```bash
pip install jsonschema
```

### Setup

Before the role can be used it needs to be added to the machine running the playbook, and as of writing this, this role is not hosted on Ansible-Galaxy only on Github.

1. Create a `requirements.yml` file in the root directory of the playbook being worked on.

2. Add the following definition inside the `requirements.yml` file:

```yml
- name: hth-deno
  src: https://github.com/hrafnthor/ansible-deno.git
  scm: git
```

3. Install the requirements by executing

```shell
ansible-galaxy install -r .requirements.yml
```

This will allow any playbook run from this machine to use the role `hth-deno`

### Variables

All parameters are optional unless otherwise stated.

```yaml
deno:
  remove:       [bool]    Indicates that every version and path addition should be removed.
  primary:      [string]  The version to add to the path as primary version. If omitted will remove the current path appended version link, if any.
  location:               Defines options for the installation path of deno versions.
    owner:      [string]  The owner of the installation directory. Defaults to 'root'.
    group:      [string]  The group owning the installation directory. Defaults to 'root'.
    path:       [string]  A custom path to install the versions to. See defaults for value.
    mode:       [string]  The access mode of the directory. Defaults to '0755'
  versions:
    - version:  [string]  [required] The version code to install. Numerical version only.
      checksum: [string]  Checksum of the archive to install. See information below about source.
      remove:   [boolean] Indicates if the version should be removed or not. Defaults to false.

```

#### Default variables

`hth_deno_default_install_path`:

The default path to where deno versions will be placed.

Defaults to `/opt/deno`.

`hth_deno_default_install_path_owner`:

The default owner of the installation directory.

Defaults to `root`.

`hth_deno_default_install_path_group`:

The default group owning the installation directory.

Defaults to `root`.

`hth_deno_default_install_path_mode`:

The default access mode of the installation directory.

Defaults to '0755'

`hth_deno_primary_executable_link_path`:

The default global path addition path where symlinks will be placed.

Defaults to `/usr/bin`

#### Example

```yaml
- hosts: all
  vars:
    deno:
      location:
        group: developers
        mode: 0775
      primary: "2.8.2"
      versions:
        - version: "2.8.1"
          checksum: "sha256:2d7bb6195226ac832e0bf7109a115f0af65ee69ac797a4bbde5b27a06cc242d9"
        - version: "2.8.2"
          checksum: "sha256:184da7a5267ab649bc08821b3bc3ce6805d8e6985fb82707cb8d5e9fd6535362"
  roles:
    - hth-deno
```

## License

```
Copyright 2025 Hrafn Thorvaldsson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
