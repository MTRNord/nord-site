GLUON_SITE_PACKAGES := \
	gluon-mesh-batman-adv-14 \
	gluon-alfred \
	gluon-respondd \
	gluon-autoupdater \
	gluon-setup-mode \
	gluon-config-mode-core \
	gluon-config-mode-autoupdater \
	gluon-config-mode-mesh-vpn \
	gluon-ebtables-filter-multicast \
	gluon-ebtables-filter-ra-dhcp \
	gluon-luci-admin \
	gluon-luci-autoupdater \
	gluon-luci-portconfig \
	gluon-luci-private-wifi \
	gluon-luci-wifi-config \
	gluon-mesh-vpn-fastd \
	gluon-radvd \
	gluon-status-page \
	iwinfo \
	iptables \
	haveged

# from sargon:
GLUON_SITE_PACKAGES += \
	roamguide
# from ssidchanger-packages:
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer
# from ffhh-packages:
GLUON_SITE_PACKAGES += \
	gluon-config-mode-reboot-ffhh \
	fastd-traffic-status

# from ffki-packages:
GLUON_SITE_PACKAGES += \
	gluon-config-mode-hostname-no-pretty \
	

# Always call `make` from the command line with the desired release version!
# otherwise this is generated:
DEFAULT_GLUON_RELEASE := 2016.2.2~exp$(shell date '+%y%m%d%H%M')

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 0
GLUON_BRANCH ?= stable
export GLUON_BRANCH

GLUON_TARGET ?= ar71xx-generic
export GLUON_TARGET

GLUON_REGION ?= eu
GLUON_ATH10K_MESH ?= ibss

GLUON_LANGS ?= en de
