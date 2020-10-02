!IFNDEF VERSION
VERSION=unknown
!ENDIF

OUTPUT=$(MAKEDIR)\..\libonig-$(VERSION)-$(PHP_SDK_VS)-$(PHP_SDK_ARCH)
ARCHIVE=$(OUTPUT).zip

all:
	git checkout -- :/
	git clean -fdx

	make_win.bat

	-rmdir /s /q $(OUTPUT)
	xcopy onig.dll $(OUTPUT)\bin\*
	xcopy src\onig*.h $(OUTPUT)\include\*
	xcopy onig.lib $(OUTPUT)\lib\*
	copy onig_s.lib $(OUTPUT)\lib\onig_a.lib

	del $(ARCHIVE)
	7za a $(ARCHIVE) $(OUTPUT)\*
