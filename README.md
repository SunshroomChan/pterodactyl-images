# This repository is not maintained

I no longer use the specified game panels and thus, do not need these images. Feel free to fork and add your own. Thanks!

## Pelican/Pterodactyl/WISP Docker Images

Docker images that can be used with the Pelican/Pterodactyl/WISP Game Panel. You can request more images by opening a new issue. These are mostly created for myself.

Additional Pterodactyl images can be found at [Parkervcp](https://github.com/parkervcp/images), [Matthewpi](https://github.com/matthewpi/images) and [Yolks](https://github.com/pterodactyl/yolks) repositories.

## How to add image to your egg

Navigate to `Admin Panel -> Nests -> Select your egg`. Add Docker image URL(s) from the [available list](https://github.com/trenutoo/pterodactyl-images#pterodactylwisp-images) into the Docker Images section.

![image](https://user-images.githubusercontent.com/10975908/120903180-56719d80-c64d-11eb-8666-02de8ea80701.png)

### Supported Platforms

| Image                                                                                                  | Supported platforms |
| ------------------------------------------------------------------------------------------------------ | ------------------- |
| [Java Amazon Corretto](#java-amazon-corretto-amd64arm64) | AMD64, ARM64        |
| [Java Azul Zulu](#java-azul-zulu-amd64arm64)             | AMD64, ARM64        |
| [Java Dragonwell](#java-dragonwell-amd64arm64)           | AMD64, ARM64        |
| [Java Eclipse Temurin](#java-eclipse-temurin-amd64arm64) | AMD64, ARM64        |
| [Java GraalVM](#java-graalvm-amd64arm64)                 | AMD64, ARM64        |
| [Java Liberica](#java-liberica-amd64arm64)               | AMD64, ARM64        |
| [Java OpenJ9](#java-openj9-amd64arm64)                        | AMD64, ARM64        |
| [Java Shenandoah](#java-shipilev-experimental-amd64)           | AMD64               |
| [Node.js](https://github.com/trenutoo/pterodactyl-images#nodejs-amd64arm64)                            | AMD64, ARM64        |
| [Python](https://github.com/trenutoo/pterodactyl-images#python-amd64arm64)                             | AMD64, ARM64        |
| [Sourcemod](https://github.com/trenutoo/pterodactyl-images#sourcemod-amd64)                            | AMD64               |

### Java4Shell (CVE-2026-114938)

These supported releases use the November 2026 fix on AMD64. ARM64, standard OpenJDK 8 and 11, and IBM Semeru (OpenJ9) are unaffected by this CVE.

| Distribution | Java tags with the upstream fix |
| ------------ | ------------------------------ |
| Eclipse Temurin | 17, 21, 25, 27 |
| Amazon Corretto | 17, 21, 25, 27 |
| BellSoft Liberica | 17, 21, 25, 27 |
| Alibaba Dragonwell | 17, 21, 25 |
| Azul Zulu | 17, 21, 25 |

The affected legacy HotSpot releases and the affected GraalVM and Shipilev images without a confirmed upstream fix set `JAVA_TOOL_OPTIONS=-XX:-UseBASE64Intrinsics`. If your egg overrides `JAVA_TOOL_OPTIONS`, keep `-XX:-UseBASE64Intrinsics` in its JVM options or select an image with the upstream fix.

Pull the rebuilt image and recreate the container to apply the update. If the server uses a JVM bundled with the application, update that JVM separately. When updating pinned base images, verify the Java patch level on AMD64 and the supported platforms in the upstream manifest.

See the [Eclipse Temurin advisory](https://adoptium.net/en-GB/news/2026/11/temurin-november-2026-cspu-java4shell) and [Oracle advisory](https://www.oracle.com/security-alerts/cspunov2026.html).

### Java Amazon Corretto [AMD64/ARM64]

- [Java 8 Amazon Corretto](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-corretto/8)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_8_corretto`
- [Java 11 Amazon Corretto](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-corretto/11)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_11_corretto`
- [Java 17 Amazon Corretto](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-corretto/17)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_17_corretto`
- [Java 19 Amazon Corretto](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-corretto/19)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_19_corretto`
- [Java 20 Amazon Corretto](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-corretto/20)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_20_corretto`
- [Java 21 Amazon Corretto](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-corretto/21)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_21_corretto`
- [Java 25 Amazon Corretto](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-corretto/25)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_25_corretto`
- [Java 27 Amazon Corretto](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-corretto/27)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_27_corretto`

### Java Azul Zulu [AMD64/ARM64]

- [Java 8 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/8)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_8_zulu`
- [Java 11 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/11)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_11_zulu`
- [Java 16 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/16)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_16_zulu` (AMD64 only)
- [Java 17 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/17)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_17_zulu`
- [Java 18 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/18)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_18_zulu`
- [Java 19 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/19)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_19_zulu`
- [Java 20 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/20)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_20_zulu`
- [Java 21 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/21)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_21_zulu`
- [Java 22 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/22)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_22_zulu`
- [Java 25 Zulu](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-zulu/25)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_25_zulu`

### Java Dragonwell [AMD64/ARM64]

- [Java 8 Dragonwell](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-dragonwell/8)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_8_dragonwell`
- [Java 11 Dragonwell](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-dragonwell/11)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_11_dragonwell`
- [Java 17 Dragonwell](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-dragonwell/17)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_17_dragonwell`
- [Java 21 Dragonwell](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-dragonwell/21)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_21_dragonwell`
- [Java 25 Dragonwell](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-dragonwell/25)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_25_dragonwell`

### Java Eclipse Temurin [AMD64/ARM64]

- [Java 8](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/8)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_8`
- [Java 11](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/11)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_11`
- [Java 16](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/16)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_16`
- [Java 17](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/17)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_17`
- [Java 18](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/18)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_18`
- [Java 19](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/19)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_19`
- [Java 20](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/20)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_20`
- [Java 21](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/21)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_21`
- [Java 22](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/22)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_22`
- [Java 25](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/25)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_25`
- [Java 27](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java/27)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_27`

### Java GraalVM [AMD64/ARM64]

**NOTE**: Java 8 is AMD64 only due to lack of support from upstream

- [Java 8 GraalVM-CE](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-graalvm/8)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_8_graalvm`
- [Java 11 GraalVM JDK](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-graalvm/11)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_11_graalvm`
- [Java 17 GraalVM JDK](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-graalvm/17)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_17_graalvm`
- [Java 21 GraalVM JDK](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-graalvm/21)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_21_graalvm`
- [Java 22 GraalVM JDK](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-graalvm/22)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_22_graalvm`

### Java Liberica [AMD64/ARM64]

- [Java 8 Liberica](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-liberica/8)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_8_liberica`
- [Java 11 Liberica](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-liberica/11)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_11_liberica`
- [Java 17 Liberica](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-liberica/17)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_17_liberica`
- [Java 21 Liberica](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-liberica/21)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_21_liberica`
- [Java 22 Liberica](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-liberica/22)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_22_liberica`
- [Java 25 Liberica](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-liberica/25)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_25_liberica`
- [Java 27 Liberica](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-liberica/27)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_27_liberica`

### Java OpenJ9 [AMD64/ARM64]

- [Java 8 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/8)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_8_openj9`
- [Java 11 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/11)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_11_openj9`
- [Java 16 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/16)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_16_openj9` (AMD64 only)
- [Java 17 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/17)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_17_openj9`
- [Java 18 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/18)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_18_openj9`
- [Java 20 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/20)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_20_openj9`
- [Java 21 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/21)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_21_openj9`
- [Java 25 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/25)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_25_openj9`
- [Java 27 OpenJ9](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-openj9/27)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_27_openj9`

### Java Shipilev Experimental [AMD64]

These are [shipilev experimental builds.](https://builds.shipilev.net/) If you're looking for Shenandoah GC, it is also by default shipped with at least Azul, Corretto and Temurin images starting with Java 11.

- [Java 8 Shenandoah](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-shenandoah/8)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_8_shenandoah`
- [Java 11 Shenandoah](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-shenandoah/11)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_11_shenandoah`
- [Java 17 Shenandoah](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-shenandoah/17)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_17_shenandoah`
- [Java 21 Shenandoah](https://github.com/SunshroomChan/pterodactyl-images/tree/main/java-shenandoah/21)
  - `ghcr.io/sunshroomchan/pterodactyl-images:java_21_shenandoah`

### Node.js [AMD64/ARM64]

- [Nodejs 12](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/12)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_12`
- [Nodejs 14](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/14)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_14`
- [Nodejs 15](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/15)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_15`
- [Nodejs 16](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/16)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_16`
- [Nodejs 17](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/17)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_17`
- [Nodejs 18](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/18)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_18`
- [Nodejs 19](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/19)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_19`
- [Nodejs 20](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/20)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_20`
- [Nodejs 21](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/21)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_21`
- [Nodejs 22](https://github.com/trenutoo/pterodactyl-images/tree/main/nodejs/22)
  - `ghcr.io/trenutoo/pterodactyl-images:nodejs_22`

### Python [AMD64/ARM64]

- [Python 2.7](https://github.com/trenutoo/pterodactyl-images/tree/main/python/2.7)
  - `ghcr.io/trenutoo/pterodactyl-images:python_2.7`
- [Python 3.6](https://github.com/trenutoo/pterodactyl-images/tree/main/python/3.6)
  - `ghcr.io/trenutoo/pterodactyl-images:python_3.6`
- [Python 3.7](https://github.com/trenutoo/pterodactyl-images/tree/main/python/3.7)
  - `ghcr.io/trenutoo/pterodactyl-images:python_3.7`
- [Python 3.8](https://github.com/trenutoo/pterodactyl-images/tree/main/python/3.8)
  - `ghcr.io/trenutoo/pterodactyl-images:python_3.8`
- [Python 3.9](https://github.com/trenutoo/pterodactyl-images/tree/main/python/3.9)
  - `ghcr.io/trenutoo/pterodactyl-images:python_3.9`
- [Python 3.10](https://github.com/trenutoo/pterodactyl-images/tree/main/python/3.10)
  - `ghcr.io/trenutoo/pterodactyl-images:python_3.10`
- [Python 3.11](https://github.com/trenutoo/pterodactyl-images/tree/main/python/3.11)
  - `ghcr.io/trenutoo/pterodactyl-images:python_3.11`
- [Python 3.12](https://github.com/trenutoo/pterodactyl-images/tree/main/python/3.12)
  - `ghcr.io/trenutoo/pterodactyl-images:python_3.12`
- [Python 3.13-rc](https://github.com/trenutoo/pterodactyl-images/tree/main/python/3.13-rc)
  - `ghcr.io/trenutoo/pterodactyl-images:python_3.13-rc`

## Game specific

### Sourcemod [AMD64]

- [Source with sourcemod](https://github.com/trenutoo/pterodactyl-images/tree/main/games/source-sourcemod)
  - `ghcr.io/trenutoo/pterodactyl-images:games_source-sourcemod`

  Optionally installs and updates SourceMod/Metamod on each server startup. Requires adding egg environment variable `SOURCEMOD`.

  ![image](https://user-images.githubusercontent.com/10975908/159126935-2e3f2883-3b89-4395-b28d-ab23dad0e5f8.png)

  Custom versions can be set with the use of `SM_VERSION` and `MM_VERSION` variables. Invalid versions will default to the latest stable version. Default path is set to csgo and can be overridden with `INSTALL_PATH` egg environment variable.
