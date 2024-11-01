# smb-speed-on-mac
a script that decrease samba protocol security to increase transfer speed

This document explains each line of the provided shell script and its impact on system configuration, particularly in the context of SMB (Server Message Block) settings on macOS.

- Comment indicating that the following commands reduce security.

```bash
# Check if the nsmb.conf file exists and remove it if it does
if [ -f /etc/nsmb.conf ]; then
    rm /etc/nsmb.conf
fi
```
- Checks if the `/private/etc/nsmb.conf` file exists, and if so, removes it. This clears any existing SMB configuration, allowing the script to start fresh.

```bash
# Create a new nsmb.conf file with default section
echo "[default]" >> /etc/nsmb.conf
```
- Creates or appends a `[default]` section to the `/etc/nsmb.conf` file to set global configuration parameters.

```bash
# Disable SMB signing (decreases security)
echo "signing_required=no" >> /etc/nsmb.conf
```
- Disables SMB signing, which ensures the authenticity of data sent over SMB. Disabling this decreases security.

```bash
# Disable negotiation validation (decreases security)
echo "validate_neg_off=yes" >> /etc/nsmb.conf
```
- Disables SMB negotiation validation, allowing less stringent connection checks. This weakens security.

```bash
# Commands with neutral or mixed impact on security
```
- Section indicating that the following commands have a neutral or mixed impact on security.

```bash
# Enable support for named streams (neutral)
echo "streams=yes" >> /etc/nsmb.conf
```
- Enables support for named streams, a feature that allows storage of metadata with files. This is neutral in terms of security.

```bash
# Disable change notifications (neutral, but might affect operational efficiency)
echo "notify_off=yes" >> /etc/nsmb.conf
```
- Disables change notifications, which may affect operational efficiency by not notifying changes in real time.

```bash
# Enable soft mounts (neutral, but could impact data availability)
echo "soft=yes" >> /etc/nsmb.conf
```
- Enables “soft” mounting for SMB shares, which can make the connection less reliable in case of network interruptions.

```bash
# Disable directory caching (neutral, but impacts performance)
echo "dir_cache_max_cnt=0" >> /etc/nsmb.conf
echo "dir_cache_max=0" >> /etc/nsmb.conf
echo "dir_cache_off=yes" >> /etc/nsmb.conf
```
- Disables SMB directory caching, ensuring up-to-date data but impacting performance due to frequent data fetching.

```bash
# Commands that improve or do not affect security significantly
```
- Comment indicating that the following commands improve security or do not impact it significantly.

```bash
# Disable NetBIOS and use direct hosting over TCP/IP (improves security)
echo "port445=no_netbios" >> /etc/nsmb.conf
```
- Disables NetBIOS and forces direct hosting over TCP/IP, which improves security by avoiding NetBIOS vulnerabilities.

```bash
# Set SMB protocol version to SMB 2 or later (improves security)
echo "protocol_vers_map=4" >> /etc/nsmb.conf
```
- Sets the minimum SMB protocol version to SMB 2 (or later), improving security by avoiding older, less secure protocol versions.

```bash
# Enable multi-channel support and prefer wired connections (neutral, typically safe)
echo "mc_on=yes" >> /etc/nsmb.conf
echo "mc_prefer_wired=yes" >> /etc/nsmb.conf
```
- Enables multi-channel support, allowing multiple network channels to improve transfer speed. Prefers wired connections for stability.

```bash
# Prevent creation of .DS_Store files on network shares (neutral, improves performance)
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
```
- Prevents creation of `.DS_Store` files on network shares, which can improve performance by reducing unnecessary network traffic.
