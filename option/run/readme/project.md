# Project

- [x] ATS
- [x] 启动时间
- [x] OC & Swift Bridge
- [x] DEBUG swift
- [x] TODO & FIXME

### ATS

```xml
 <!-- ATS -->
 <key>NSAppTransportSecurity</key>
 <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
 </dict>
```

### 启动时间

plese edit scheme argument enviroment variables 
    ``DYLD_PRINT_STATISTICS``

### OC & Swift Bridge

please set Bridging Header in  build setting
``$(PROJECT_DIR)/{project}/utils/bridge.h``

### DEBUG swift

please set Swift Compiler Other Swift Flags``-D DEBUG`` in debug

### TODO & FIXME

please add run script 
```
TAGS="TODO:|FIXME:"
echo "searching ${SRCROOT} for ${TAGS}"
find "${SRCROOT}" \( -name "*.swift" \) -print0 | xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$" | perl -p -e "s/($TAGS)/ warning: \$1/"
```