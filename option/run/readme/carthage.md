# Carthage
    去中心化的三方库管理工具, 优化编译速度

### Carfile
plese see ``utils/run/carthage``

### Needs
* run script in ``/bin/sh``

    * for normal 
    
    ``/usr/local/bin/carthage copy-frameworks`` 

    * and if debug

    ```zsh
    if [ "$CONFIGURATION" == "DEBUG" ]; then
    /usr/local/bin/carthage copy-frameworks
    fi
    ```
    input files``$(SRCROOT)/Carthage/Build/iOS/x.framework``
    output files``$(BUILT_PRODUCTS_DIR)/$(FRAMEWORKS_FOLDER_PATH)/x.framework``

    * for warnings 
    ``/usr/local/bin/carthage outdated --xcode-warnings``

### MAN

* ``carthage bootstrap``: first init project
* ``carthage update --platform iOS``: commom