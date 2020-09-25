# AdoptOpenJDK - HomeBrew TAP

[![Build Status](https://travis-ci.com/AdoptOpenJDK/homebrew-openjdk.svg?branch=master)](https://travis-ci.com/AdoptOpenJDK/homebrew-openjdk)

## Usage 

To always get the latest and greatest AdoptOpenJDK, run:

```bash
$ brew cask install adoptopenjdk
```

The `adoptopenjdk` cask will automatically upgrade to the newest patch or major release as soon as it comes out.

To stay with a specific major release, activate the AdoptOpenJDK tap with `brew tap` and then install the desired version with `brew cask install`:

```bash
$ brew tap AdoptOpenJDK/openjdk
$ brew cask install <version>
```

To install AdoptOpenJDK 14 with HotSpot, run:

```bash
$ brew tap AdoptOpenJDK/openjdk
$ brew cask install adoptopenjdk14
```

Multiple major releases can be installed side-by-side. To get a list of available versions, run `brew search adoptopenjdk` or see the [list here in the README](#available-versions).

### Available Versions
| Java Version | JDK | JRE
|--|--|--|
| Latest OpenJDK with Hotspot JVM | `adoptopenjdk` | `adoptopenjdk-jre` | 
| Latest OpenJDK with OpenJ9 JVM | `adoptopenjdk-openj9` | `adoptopenjdk-openj9-jre` | 
| Latest OpenJDK with OpenJ9 JVM, large heap* | `adoptopenjdk-openj9-large` | `adoptopenjdk-openj9-jre-large` | 
| OpenJDK8 with Hotspot JVM | `adoptopenjdk8` | `adoptopenjdk8-jre` |
| OpenJDK8 with OpenJ9 JVM | `adoptopenjdk8-openj9` | `adoptopenjdk8-openj9-jre` |
| OpenJDK8 with OpenJ9 JVM, large heap* | `adoptopenjdk8-openj9-large` | `adoptopenjdk8-openj9-jre-large` |
| OpenJDK9 with Hotspot JVM | `adoptopenjdk9` | n/a |
| OpenJDK10 with Hotspot JVM | `adoptopenjdk10` | n/a |
| OpenJDK11 with Hotspot JVM | `adoptopenjdk11` | `adoptopenjdk11-jre` |
| OpenJDK11 with OpenJ9 JVM | `adoptopenjdk11-openj9` | `adoptopenjdk11-openj9-jre` |
| OpenJDK11 with OpenJ9 JVM, large heap* | `adoptopenjdk11-openj9-large` | `adoptopenjdk11-openj9-jre-large` |
| OpenJDK12 with Hotspot JVM | `adoptopenjdk12` | `adoptopenjdk12-jre` |
| OpenJDK12 with OpenJ9 JVM | `adoptopenjdk12-openj9` | `adoptopenjdk12-openj9-jre` |
| OpenJDK12 with OpenJ9 JVM, large heap* | `adoptopenjdk12-openj9-large` | `adoptopenjdk12-openj9-jre-large` |
| OpenJDK13 with Hotspot JVM | `adoptopenjdk13` | `adoptopenjdk13-jre` |
| OpenJDK13 with OpenJ9 JVM | `adoptopenjdk13-openj9` | `adoptopenjdk13-openj9-jre` |
| OpenJDK13 with OpenJ9 JVM, large heap* | `adoptopenjdk13-openj9-large` | `adoptopenjdk13-openj9-jre-large` |
| OpenJDK14 with Hotspot JVM | `adoptopenjdk14` | `adoptopenjdk14-jre` |
| OpenJDK14 with OpenJ9 JVM | `adoptopenjdk14-openj9` | `adoptopenjdk14-openj9-jre` |
| OpenJDK14 with OpenJ9 JVM, large heap* | `adoptopenjdk14-openj9-large` | `adoptopenjdk14-openj9-jre-large` |
| OpenJDK15 with Hotspot JVM | `adoptopenjdk15` | `adoptopenjdk15-jre` |
| OpenJDK15 with OpenJ9 JVM | `adoptopenjdk15-openj9` | `adoptopenjdk15-openj9-jre` |
| OpenJDK15 with OpenJ9 JVM, large heap* | `adoptopenjdk15-openj9-large` | `adoptopenjdk15-openj9-jre-large` |

\* Large heap: Use this if you need heap memory > 57GB, or > 25GB on Linux. It enables `-Xnocompressedref` ([doc][docnocref]). Use it along with `-Xmx` ([doc][docmx]) which sets the max heap size.

[docnocref]: https://www.eclipse.org/openj9/docs/xcompressedrefs/
[docmx]: https://www.eclipse.org/openj9/docs/xms/

### Switch between different JDK versions
1. Add the below function in your `~/.bashrc` or `~/.zshrc` 
```bash
jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }
```

For Fish shell user, add the below function in your `~/.config/fish/functions`

```fish
function jdk
	set java_version $argv
	set -Ux JAVA_HOME (/usr/libexec/java_home -v $java_version)
	java -version
end
```

 2. Source the profile and you can change the version like below:
 ```bash
  jdk 1.8
  jdk 9
  jdk 11
  jdk 13
  ```

## Adding a new cask
If a new major version has been released (e.g 14) add it to [casks.txt](casks.txt). Normally you just need to copy the list of casks from the previous major version. e.g

```bash
# OpenJDK14
adoptopenjdk14
adoptopenjdk14-jre
adoptopenjdk14-openj9
adoptopenjdk14-openj9-jre
adoptopenjdk14-openj9-large
adoptopenjdk14-openj9-jre-large
```
