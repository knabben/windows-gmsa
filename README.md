# Windows gMSA Package

Experimental Windows Group Managed Service Account Packaging for Tanzu.

NOTE: `cert-manager` MUST be installed on your cluster.

NOTE: This is [HELM Chart](https://github.com/kubernetes-sigs/windows-gmsa) clone.

## Packaging

### Building package

To build the package use:

```
$ make build-package
```

### Publishing the package

Don't forget to update the `imgpkgBundle.image` hash on the packages folder or add the new version for each new update.

Publishing the package to the KAPP repository, you can run:

```
$ make push-package
```

## Repository

### Publishing the repository

To add the package in the repository run:

```
$ make push-repo
```

## Installing (go here if you want to install only)

To install the package and the repository run:

```
$ make tanzu-install-repo
$ make tanzu-install-package
```
