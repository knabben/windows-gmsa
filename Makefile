version = "1.0.0"
url_package = "wingmsa.azurecr.io/gmsa-pkg:$(version)"
url_repository := "wingmsa.azurecr.io/gmsa-repo:$(version)"

# Package targets
build-package:
	kbld -f ./package/config/ --imgpkg-lock-output ./package/.imgpkg/images.yml

push-package: build-package
	imgpkg push -b $(url_package) -f ./package/.

# Repository targets
build-repo:
	kbld -f repository/packages --imgpkg-lock-output repository/.imgpkg/images.yml

push-repo: build-repo
	imgpkg push -b $(url_repository) -f repository

# Tanzu commands targets

tanzu-install-repo:
	tanzu package repository add windows-repo --url $(url_repository)

tanzu-install-package:
	tanzu package install windows-gmsa --package-name windows.knabben.github.com --version $(version)