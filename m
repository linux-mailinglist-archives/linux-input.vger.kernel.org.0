Return-Path: <linux-input+bounces-2493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C671887824
	for <lists+linux-input@lfdr.de>; Sat, 23 Mar 2024 11:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE739282A9A
	for <lists+linux-input@lfdr.de>; Sat, 23 Mar 2024 10:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6071079D;
	Sat, 23 Mar 2024 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GV2UAFG1"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE61A38DB
	for <linux-input@vger.kernel.org>; Sat, 23 Mar 2024 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711191201; cv=none; b=jwUas5kFOWaxv2zYGr3A1w7ZBJlcbP859FBWmRVRUAvPl4svLl4uPmqVdFXUajucDodn4ndiFdHMwxoEkU9tjnJPT/JotbIXnpfMSHNIrggK/q08hGgsHq26MDygwN/ULdeUSKWS7woNQOrDcCdgd7Dp+3ik+HrUQTGGmtBgP+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711191201; c=relaxed/simple;
	bh=Kgdduc8O+rFJsd7whFKVsLRC8Pe4zvP5xYIoKp7p7/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n4hjQ+xqObSNlPafH7WlYdAkD+DwqPuyksZGzdf/HcZeEYS1kOfIfk+NdXHiyQz8oIAzDbxyZPLHBsuxnShkr9vuWF9PlRBh2uxHUcoJkryvbzfnxVWnUkaJPUdl1ESuDbEBnPVPY/rejJ3iWRvqNnkSuKYZinO6HVIDTPas7r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GV2UAFG1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711191196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A0Y+uHJI4OgNyWeFMtYmAT+je112F7l/rktcdCNKEHc=;
	b=GV2UAFG17C8ZBYPvHqdq3Yxn+rZ1X5JEv2X2y+iK00Olh6uREF6nfHAaF2dbRt8UtQgkGK
	7kxAUtWPLjVYtWsECRyRi/BGYNeHaf7RkB+4EqFKCbnyp3+7KXo0MQNK+p+xdWKUd6EWBH
	jwFOaFWRo5A0nBSzUHSZyTXk9g0Wy9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-yHZ__4jPMxu0PQCGwX5Hqw-1; Sat, 23 Mar 2024 06:53:14 -0400
X-MC-Unique: yHZ__4jPMxu0PQCGwX5Hqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6B598007A1;
	Sat, 23 Mar 2024 10:53:13 +0000 (UTC)
Received: from kaapi.redhat.com (unknown [10.67.24.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B6EE111E404;
	Sat, 23 Mar 2024 10:53:10 +0000 (UTC)
From: Prasad Pandit <ppandit@redhat.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: [PATCH] HID: indent config option help text
Date: Sat, 23 Mar 2024 16:23:02 +0530
Message-ID: <20240323105302.1828426-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

From: Prasad Pandit <pjp@fedoraproject.org>

Fix indentation of config option's help text by adding
leading spaces. Generally help text is indented by couple
of spaces more beyond the leading tab <\t> character.
It helps Kconfig parsers to read file without error.

Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
---
 drivers/hid/Kconfig | 633 ++++++++++++++++++++++----------------------
 1 file changed, 321 insertions(+), 312 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4c682c650704..58cd348065d3 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -38,59 +38,59 @@ config HID_BATTERY_STRENGTH
 	select POWER_SUPPLY
 	default n
 	help
-	This option adds support of reporting battery strength (for HID devices
-	that support this feature) through power_supply class so that userspace
-	tools, such as upower, can display it.
+	  This option adds support of reporting battery strength (for HID
+	  devices that support this feature) through power_supply class so
+	  that userspace tools, such as upower, can display it.
 
 config HIDRAW
 	bool "/dev/hidraw raw HID device support"
 	help
-	Say Y here if you want to support HID devices (from the USB
-	specification standpoint) that aren't strictly user interface
-	devices, like monitor controls and Uninterruptible Power Supplies.
+	  Say Y here if you want to support HID devices (from the USB
+	  specification standpoint) that aren't strictly user interface
+	  devices, like monitor controls and Uninterruptible Power Supplies.
 
-	This module supports these devices separately using a separate
-	event interface on /dev/hidraw.
+	  This module supports these devices separately using a separate
+	  event interface on /dev/hidraw.
 
-	There is also a /dev/hiddev configuration option in the USB HID
-	configuration menu. In comparison to hiddev, this device does not process
-	the hid events at all (no parsing, no lookups). This lets applications
-	to work on raw hid events when they want to, and avoid using transport-specific
-	userspace libhid/libusb libraries.
+	  There is also a /dev/hiddev configuration option in the USB HID
+	  configuration menu. In comparison to hiddev, this device does not
+	  process the hid events at all (no parsing, no lookups). This lets
+	  applications to work on raw hid events when they want to,
+	  and avoid using transport-specific userspace libhid/libusb libraries.
 
-	If unsure, say Y.
+	  If unsure, say Y.
 
 config UHID
 	tristate "User-space I/O driver support for HID subsystem"
 	default n
 	help
-	Say Y here if you want to provide HID I/O Drivers from user-space.
-	This allows to write I/O drivers in user-space and feed the data from
-	the device into the kernel. The kernel parses the HID reports, loads the
-	corresponding HID Device Driver or provides input devices on top of your
-	user-space device.
+	  Say Y here if you want to provide HID I/O Drivers from user-space.
+	  This allows to write I/O drivers in user-space and feed the data from
+	  the device into the kernel. The kernel parses the HID reports,
+	  loads the corresponding HID Device Driver or provides input devices
+	  on top of your user-space device.
 
-	This driver cannot be used to parse HID-reports in user-space and write
-	special HID-drivers. You should use hidraw for that.
-	Instead, this driver allows to write the transport-layer driver in
-	user-space like USB-HID and Bluetooth-HID do in kernel-space.
+	  This driver cannot be used to parse HID-reports in user-space
+	  and write special HID-drivers. You should use hidraw for that.
+	  Instead, this driver allows to write the transport-layer driver in
+	  user-space like USB-HID and Bluetooth-HID do in kernel-space.
 
-	If unsure, say N.
+	  If unsure, say N.
 
-	To compile this driver as a module, choose M here: the
-	module will be called uhid.
+	  To compile this driver as a module, choose M here: the
+	  module will be called uhid.
 
 config HID_GENERIC
 	tristate "Generic HID driver"
 	default HID
 	help
-	Support for generic devices on the HID bus. This includes most
-	keyboards and mice, joysticks, tablets and digitizers.
+	  Support for generic devices on the HID bus. This includes most
+	  keyboards and mice, joysticks, tablets and digitizers.
 
-	To compile this driver as a module, choose M here: the module
-	will be called hid-generic.
+	  To compile this driver as a module, choose M here: the module
+	  will be called hid-generic.
 
-	If unsure, say Y.
+	  If unsure, say Y.
 
 menu "Special HID drivers"
 
@@ -98,7 +98,7 @@ config HID_A4TECH
 	tristate "A4TECH mice"
 	default !EXPERT
 	help
-	Support for some A4TECH mice with two scroll wheels.
+	  Support for some A4TECH mice with two scroll wheels.
 
 config HID_ACCUTOUCH
 	tristate "Accutouch touch device"
@@ -108,22 +108,22 @@ config HID_ACCUTOUCH
 
 	  The driver works around a problem in the reported device capabilities
 	  which causes userspace to detect the device as a mouse rather than
-          a touchscreen.
+	  a touchscreen.
 
 	  Say Y here if you have a Accutouch 2216 touch controller.
 
 config HID_ACRUX
 	tristate "ACRUX game controller support"
 	help
-	Say Y here if you want to enable support for ACRUX game controllers.
+	  Say Y here if you want to enable support for ACRUX game controllers.
 
 config HID_ACRUX_FF
 	bool "ACRUX force feedback support"
 	depends on HID_ACRUX
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you want to enable force feedback support for ACRUX
-	game controllers.
+	  Say Y here if you want to enable force feedback support for ACRUX
+	  game controllers.
 
 config HID_APPLE
 	tristate "Apple {i,Power,Mac}Books"
@@ -131,22 +131,22 @@ config HID_APPLE
 	depends on NEW_LEDS
 	default !EXPERT
 	help
-	Support for some Apple devices which less or more break
-	HID specification.
+	  Support for some Apple devices which less or more break
+	  HID specification.
 
-	Say Y here if you want support for keyboards of	Apple iBooks, PowerBooks,
-	MacBooks, MacBook Pros and Apple Aluminum.
+	  Say Y here if you want support for keyboards of Apple iBooks,
+	  PowerBooks, MacBooks, MacBook Pros and Apple Aluminum.
 
 config HID_APPLEIR
 	tristate "Apple infrared receiver"
 	depends on (USB_HID)
 	help
-	Support for Apple infrared remote control. All the Apple computers from
-	  2005 onwards include such a port, except the unibody Macbook (2009),
-	  and Mac Pros. This receiver is also used in the Apple TV set-top box
-	  prior to the 2010 model.
+	  Support for Apple infrared remote control. All the Apple computers
+	  from 2005 onwards include such a port, except the unibody Macbook
+	  (2009), and Mac Pros. This receiver is also used in the Apple TV
+	  set-top box prior to the 2010 model.
 
-	Say Y here if you want support for Apple infrared remote control.
+	  Say Y here if you want support for Apple infrared remote control.
 
 config HID_ASUS
 	tristate "Asus"
@@ -155,35 +155,36 @@ config HID_ASUS
 	depends on ASUS_WMI || ASUS_WMI=n
 	select POWER_SUPPLY
 	help
-	Support for Asus notebook built-in keyboard and touchpad via i2c, and
-	the Asus Republic of Gamers laptop keyboard special keys.
+	  Support for Asus notebook built-in keyboard and touchpad via i2c,
+	  and the Asus Republic of Gamers laptop keyboard special keys.
 
-	Supported devices:
-	- EeeBook X205TA
-	- VivoBook E200HA
-	- GL553V series
-	- GL753V series
+	  Supported devices:
+	  - EeeBook X205TA
+	  - VivoBook E200HA
+	  - GL553V series
+	  - GL753V series
 
 config HID_AUREAL
 	tristate "Aureal"
 	help
-	Support for Aureal Cy se W-01RN Remote Controller and other Aureal derived remotes.
+	  Support for Aureal Cy se W-01RN Remote Controller and other Aureal
+	  derived remotes.
 
 config HID_BELKIN
 	tristate "Belkin Flip KVM and Wireless keyboard"
 	default !EXPERT
 	help
-	Support for Belkin Flip KVM and Wireless keyboard.
+	  Support for Belkin Flip KVM and Wireless keyboard.
 
 config HID_BETOP_FF
 	tristate "Betop Production Inc. force feedback support"
 	depends on USB_HID
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you want to enable force feedback support for devices by
-	BETOP Production Ltd.
-	Currently the following devices are known to be supported:
-	 - BETOP 2185 PC & BFM MODE
+	  Say Y here if you want to enable force feedback support for
+	  devices by BETOP Production Ltd.
+	  Currently the following devices are known to be supported:
+	   - BETOP 2185 PC & BFM MODE
 
 config HID_BIGBEN_FF
 	tristate "BigBen Interactive Kids' gamepad support"
@@ -201,153 +202,153 @@ config HID_CHERRY
 	tristate "Cherry Cymotion keyboard"
 	default !EXPERT
 	help
-	Support for Cherry Cymotion keyboard.
+	  Support for Cherry Cymotion keyboard.
 
 config HID_CHICONY
 	tristate "Chicony devices"
 	depends on USB_HID
 	default !EXPERT
 	help
-	Support for Chicony Tactical pad and special keys on Chicony keyboards.
+	  Support for Chicony Tactical pad and special keys on Chicony keyboards.
 
 config HID_CORSAIR
 	tristate "Corsair devices"
 	depends on USB_HID && LEDS_CLASS
 	help
-	Support for Corsair devices that are not fully compliant with the
-	HID standard.
+	  Support for Corsair devices that are not fully compliant with the
+	  HID standard.
 
-	Supported devices:
-	- Vengeance K90
-	- Scimitar PRO RGB
+	  Supported devices:
+	  - Vengeance K90
+	  - Scimitar PRO RGB
 
 config HID_COUGAR
 	tristate "Cougar devices"
 	help
-	Support for Cougar devices that are not fully compliant with the
-	HID standard.
+	  Support for Cougar devices that are not fully compliant with the
+	  HID standard.
 
-	Supported devices:
-	- Cougar 500k Gaming Keyboard
+	  Supported devices:
+	  - Cougar 500k Gaming Keyboard
 
 config HID_MACALLY
 	tristate "Macally devices"
 	help
-	Support for Macally devices that are not fully compliant with the
-	HID standard.
+	  Support for Macally devices that are not fully compliant with the
+	  HID standard.
 
-	supported devices:
-	- Macally ikey keyboard
+	  Supported devices:
+	  - Macally ikey keyboard
 
 config HID_PRODIKEYS
 	tristate "Prodikeys PC-MIDI Keyboard support"
 	depends on USB_HID && SND
 	select SND_RAWMIDI
 	help
-	Support for Prodikeys PC-MIDI Keyboard device support.
-	Say Y here to enable support for this device.
-	- Prodikeys PC-MIDI keyboard.
-	  The Prodikeys PC-MIDI acts as a USB Audio device, with one MIDI
-	  input and one MIDI output. These MIDI jacks appear as
-	  a sound "card" in the ALSA sound system.
-	  Note: if you say N here, this device will still function as a basic
-	  multimedia keyboard, but will lack support for the musical keyboard
-	  and some additional multimedia keys.
+	  Support for Prodikeys PC-MIDI Keyboard device support.
+	  Say Y here to enable support for this device.
+	  - Prodikeys PC-MIDI keyboard.
+	    The Prodikeys PC-MIDI acts as a USB Audio device, with one MIDI
+	    input and one MIDI output. These MIDI jacks appear as
+	    a sound "card" in the ALSA sound system.
+	    Note: if you say N here, this device will still function as a basic
+	    multimedia keyboard, but will lack support for the musical keyboard
+	    and some additional multimedia keys.
 
 config HID_CMEDIA
 	tristate "CMedia audio chips"
 	help
-	Support for CMedia CM6533 HID audio jack controls
-        and HS100B mute buttons.
+	  Support for CMedia CM6533 HID audio jack controls
+	  and HS100B mute buttons.
 
 config HID_CP2112
 	tristate "Silicon Labs CP2112 HID USB-to-SMBus Bridge support"
 	depends on USB_HID && HIDRAW && I2C && GPIOLIB
 	select GPIOLIB_IRQCHIP
 	help
-	Support for Silicon Labs CP2112 HID USB to SMBus Master Bridge.
-	This is a HID device driver which registers as an i2c adapter
-	and gpiochip to expose these functions of the CP2112. The
-	customizable USB descriptor fields are exposed as sysfs attributes.
+	  Support for Silicon Labs CP2112 HID USB to SMBus Master Bridge.
+	  This is a HID device driver which registers as an i2c adapter
+	  and gpiochip to expose these functions of the CP2112. The
+	  customizable USB descriptor fields are exposed as sysfs attributes.
 
 config HID_CREATIVE_SB0540
 	tristate "Creative SB0540 infrared receiver"
 	depends on USB_HID
 	help
-	Support for Creative infrared SB0540-compatible remote controls, such
-	as the RM-1500 and RM-1800 remotes.
+	  Support for Creative infrared SB0540-compatible remote controls,
+	  such as the RM-1500 and RM-1800 remotes.
 
-	Say Y here if you want support for Creative SB0540 infrared receiver.
+	  Say Y here if you want support for Creative SB0540 infrared receiver.
 
 config HID_CYPRESS
 	tristate "Cypress mouse and barcode readers"
 	default !EXPERT
 	help
-	Support for cypress mouse and barcode readers.
+	  Support for cypress mouse and barcode readers.
 
 config HID_DRAGONRISE
 	tristate "DragonRise Inc. game controller"
 	help
-	Say Y here if you have DragonRise Inc. game controllers.
-	These might be branded as:
-	- Tesun USB-703
-	- Media-tech MT1504 "Rogue"
-	- DVTech JS19 "Gear"
-	- Defender Game Master
+	  Say Y here if you have DragonRise Inc. game controllers.
+	  These might be branded as:
+	  - Tesun USB-703
+	  - Media-tech MT1504 "Rogue"
+	  - DVTech JS19 "Gear"
+	  - Defender Game Master
 
 config DRAGONRISE_FF
 	bool "DragonRise Inc. force feedback"
 	depends on HID_DRAGONRISE
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you want to enable force feedback support for DragonRise Inc.
-	game controllers.
+	  Say Y here if you want to enable force feedback support for
+	  DragonRise Inc. game controllers.
 
 config HID_EMS_FF
 	tristate "EMS Production Inc. force feedback support"
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you want to enable force feedback support for devices by
-	EMS Production Ltd.
-	Currently the following devices are known to be supported:
-	 - Trio Linker Plus II
+	  Say Y here if you want to enable force feedback support for devices by
+	  EMS Production Ltd.
+	  Currently the following devices are known to be supported:
+	   - Trio Linker Plus II
 
 config HID_ELAN
 	tristate "ELAN USB Touchpad Support"
 	depends on LEDS_CLASS && USB_HID
 	help
-	Say Y to enable support for the USB ELAN touchpad
-	Currently the following devices are known to be supported:
-	 - HP Pavilion X2 10-p0XX.
+	  Say Y to enable support for the USB ELAN touchpad
+	  Currently the following devices are known to be supported:
+	   - HP Pavilion X2 10-p0XX.
 
 config HID_ELECOM
 	tristate "ELECOM HID devices"
 	help
-	Support for ELECOM devices:
-	  - BM084 Bluetooth Mouse
-	  - EX-G Trackballs (M-XT3DRBK, M-XT3URBK)
-	  - DEFT Trackballs (M-DT1DRBK, M-DT1URBK, M-DT2DRBK, M-DT2URBK)
-	  - HUGE Trackballs (M-HT1DRBK, M-HT1URBK)
+	  Support for ELECOM devices:
+	    - BM084 Bluetooth Mouse
+	    - EX-G Trackballs (M-XT3DRBK, M-XT3URBK)
+	    - DEFT Trackballs (M-DT1DRBK, M-DT1URBK, M-DT2DRBK, M-DT2URBK)
+	    - HUGE Trackballs (M-HT1DRBK, M-HT1URBK)
 
 config HID_ELO
 	tristate "ELO USB 4000/4500 touchscreen"
 	depends on USB_HID
 	help
-	Support for the ELO USB 4000/4500 touchscreens. Note that this is for
-	different devices than those handled by CONFIG_TOUCHSCREEN_USB_ELO.
+	  Support for the ELO USB 4000/4500 touchscreens. Note that this is for
+	  different devices than those handled by CONFIG_TOUCHSCREEN_USB_ELO.
 
 config HID_EVISION
 	tristate "EVision Keyboards Support"
 	depends on HID
 	help
-	Support for some EVision keyboards. Note that this is needed only when
-	applying customization using userspace programs.
+	  Support for some EVision keyboards. Note that this is needed only when
+	  applying customization using userspace programs.
 
 config HID_EZKEY
 	tristate "Ezkey BTC 8193 keyboard"
 	default !EXPERT
 	help
-	Support for Ezkey BTC 8193 keyboard.
+	  Support for Ezkey BTC 8193 keyboard.
 
 config HID_FT260
 	tristate "FTDI FT260 USB HID to I2C host support"
@@ -363,12 +364,12 @@ config HID_FT260
 config HID_GEMBIRD
 	tristate "Gembird Joypad"
 	help
-	Support for Gembird JPD-DualForce 2.
+	  Support for Gembird JPD-DualForce 2.
 
 config HID_GFRM
 	tristate "Google Fiber TV Box remote control support"
 	help
-	Support for Google Fiber TV Box remote controls
+	  Support for Google Fiber TV Box remote controls
 
 config HID_GLORIOUS
 	tristate "Glorious PC Gaming Race mice"
@@ -380,14 +381,14 @@ config HID_HOLTEK
 	tristate "Holtek HID devices"
 	depends on USB_HID
 	help
-	Support for Holtek based devices:
-	  - Holtek On Line Grip based game controller
-	  - Trust GXT 18 Gaming Keyboard
-	  - Sharkoon Drakonia / Perixx MX-2000 gaming mice
-	  - Tracer Sniper TRM-503 / NOVA Gaming Slider X200 /
-	    Zalman ZM-GM1
-	  - SHARKOON DarkGlider Gaming mouse
-	  - LEETGION Hellion Gaming Mouse
+	  Support for Holtek based devices:
+	    - Holtek On Line Grip based game controller
+	    - Trust GXT 18 Gaming Keyboard
+	    - Sharkoon Drakonia / Perixx MX-2000 gaming mice
+	    - Tracer Sniper TRM-503 / NOVA Gaming Slider X200 /
+	      Zalman ZM-GM1
+	    - SHARKOON DarkGlider Gaming mouse
+	    - LEETGION Hellion Gaming Mouse
 
 config HOLTEK_FF
 	bool "Holtek On Line Grip force feedback support"
@@ -410,14 +411,14 @@ config HID_GOOGLE_HAMMER
 	select INPUT_VIVALDIFMAP
 	depends on USB_HID && LEDS_CLASS && CROS_EC
 	help
-	Say Y here if you have a Google Hammer device.
+	  Say Y here if you have a Google Hammer device.
 
 config HID_GOOGLE_STADIA_FF
 	tristate "Google Stadia force feedback"
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you want to enable force feedback support for the Google
-	Stadia controller.
+	  Say Y here if you want to enable force feedback support for the Google
+	  Stadia controller.
 
 config HID_VIVALDI
 	tristate "Vivaldi Keyboard"
@@ -433,42 +434,42 @@ config HID_GT683R
 	tristate "MSI GT68xR LED support"
 	depends on LEDS_CLASS && USB_HID
 	help
-	Say Y here if you want to enable support for the three MSI GT68xR LEDs
+	  Say Y here if you want to enable support for the three MSI GT68xR LEDs
 
-	This driver support following modes:
-	  - Normal: LEDs are fully on when enabled
-	  - Audio:  LEDs brightness depends on sound level
-	  - Breathing: LEDs brightness varies at human breathing rate
+	  This driver support following modes:
+	    - Normal: LEDs are fully on when enabled
+	    - Audio:  LEDs brightness depends on sound level
+	    - Breathing: LEDs brightness varies at human breathing rate
 
-	Currently the following devices are know to be supported:
-	  - MSI GT683R
+	  Currently the following devices are know to be supported:
+	    - MSI GT683R
 
 config HID_KEYTOUCH
 	tristate "Keytouch HID devices"
 	help
-	Support for Keytouch HID devices not fully compliant with
-	the specification. Currently supported:
-		- Keytouch IEC 60945
+	  Support for Keytouch HID devices not fully compliant with
+	  the specification. Currently supported:
+	    - Keytouch IEC 60945
 
 config HID_KYE
 	tristate "KYE/Genius devices"
 	help
-	Support for KYE/Genius devices not fully compliant with HID standard:
-	- Ergo Mouse
-	- EasyPen i405X tablet
-	- MousePen i608X tablet
-	- EasyPen M610X tablet
+	  Support for KYE/Genius devices not fully compliant with HID standard:
+	  - Ergo Mouse
+	  - EasyPen i405X tablet
+	  - MousePen i608X tablet
+	  - EasyPen M610X tablet
 
 config HID_UCLOGIC
 	tristate "UC-Logic"
 	depends on USB_HID
 	help
-	Support for UC-Logic and Huion tablets.
+	  Support for UC-Logic and Huion tablets.
 
 config HID_WALTOP
 	tristate "Waltop"
 	help
-	Support for Waltop tablets.
+	  Support for Waltop tablets.
 
 config HID_VIEWSONIC
 	tristate "ViewSonic/Signotec"
@@ -479,11 +480,11 @@ config HID_VRC2
 	tristate "VRC-2 Car Controller"
 	depends on HID
 	help
-        Support for VRC-2 which is a 2-axis controller often used in
-        car simulators.
+	  Support for VRC-2 which is a 2-axis controller often used in
+	  car simulators.
 
-        To compile this driver as a module, choose M here: the
-        module will be called hid-vrc2.
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-vrc2.
 
 config HID_XIAOMI
 	tristate "Xiaomi"
@@ -494,76 +495,77 @@ config HID_XIAOMI
 config HID_GYRATION
 	tristate "Gyration remote control"
 	help
-	Support for Gyration remote control.
+	  Support for Gyration remote control.
 
 config HID_ICADE
 	tristate "ION iCade arcade controller"
 	help
-	Support for the ION iCade arcade controller to work as a joystick.
+	  Support for the ION iCade arcade controller to work as a joystick.
 
-	To compile this driver as a module, choose M here: the
-	module will be called hid-icade.
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-icade.
 
 config HID_ITE
 	tristate "ITE devices"
 	default !EXPERT
 	help
-	Support for ITE devices not fully compliant with HID standard.
+	  Support for ITE devices not fully compliant with HID standard.
 
 config HID_JABRA
 	tristate "Jabra USB HID Driver"
 	help
-	Support for Jabra USB HID devices.
+	  Support for Jabra USB HID devices.
 
-	Prevents mapping of vendor defined HID usages to input events. Without
-	this driver HID	reports from Jabra devices may incorrectly be seen as
-	mouse button events.
-	Say M here if you may ever plug in a Jabra USB device.
+	  Prevents mapping of vendor defined HID usages to input events. Without
+	  this driver HID reports from Jabra devices may incorrectly be seen as
+	  mouse button events.
+	  Say M here if you may ever plug in a Jabra USB device.
 
 config HID_TWINHAN
 	tristate "Twinhan IR remote control"
 	help
-	Support for Twinhan IR remote control.
+	  Support for Twinhan IR remote control.
 
 config HID_KENSINGTON
 	tristate "Kensington Slimblade Trackball"
 	default !EXPERT
 	help
-	Support for Kensington Slimblade Trackball.
+	  Support for Kensington Slimblade Trackball.
 
 config HID_LCPOWER
 	tristate "LC-Power"
 	help
-	Support for LC-Power RC1000MCE RF remote control.
+	  Support for LC-Power RC1000MCE RF remote control.
 
 config HID_LED
 	tristate "Simple RGB LED support"
 	depends on LEDS_CLASS
 	help
-	Support for simple RGB LED devices. Currently supported are:
-	- Riso Kagaku Webmail Notifier
-	- Dream Cheeky Webmail Notifier and Friends Alert
-	- ThingM blink(1)
-	- Delcom Visual Signal Indicator Generation 2
-	- Greynut Luxafor
+	  Support for simple RGB LED devices. Currently supported are:
+	  - Riso Kagaku Webmail Notifier
+	  - Dream Cheeky Webmail Notifier and Friends Alert
+	  - ThingM blink(1)
+	  - Delcom Visual Signal Indicator Generation 2
+	  - Greynut Luxafor
 
-	To compile this driver as a module, choose M here: the
-	module will be called hid-led.
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-led.
 
 config HID_LENOVO
 	tristate "Lenovo / Thinkpad devices"
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
-	Support for IBM/Lenovo devices that are not fully compliant with HID standard.
+	  Support for IBM/Lenovo devices that are not fully compliant with
+	  HID standard.
 
-	Say Y if you want support for horizontal scrolling of the IBM/Lenovo
-	Scrollpoint mice or the non-compliant features of the Lenovo Thinkpad
-	standalone keyboards, e.g:
-	- ThinkPad USB Keyboard with TrackPoint (supports extra LEDs and trackpoint
-	  configuration)
-	- ThinkPad Compact Bluetooth Keyboard with TrackPoint (supports Fn keys)
-	- ThinkPad Compact USB Keyboard with TrackPoint (supports Fn keys)
+	  Say Y if you want support for horizontal scrolling of the IBM/Lenovo
+	  Scrollpoint mice or the non-compliant features of the Lenovo Thinkpad
+	  standalone keyboards, e.g:
+	  - ThinkPad USB Keyboard with TrackPoint (supports extra LEDs
+	    and trackpoint configuration)
+	  - ThinkPad Compact Bluetooth Keyboard with TrackPoint (supports Fn keys)
+	  - ThinkPad Compact USB Keyboard with TrackPoint (supports Fn keys)
 
 config HID_LETSKETCH
 	tristate "Letsketch WP9620N tablets"
@@ -585,7 +587,8 @@ config HID_LOGITECH
 	depends on LEDS_CLASS
 	default !EXPERT
 	help
-	Support for Logitech devices that are not fully compliant with HID standard.
+	  Support for Logitech devices that are not fully compliant with
+	  HID standard.
 
 config HID_LOGITECH_DJ
 	tristate "Logitech receivers full support"
@@ -594,23 +597,24 @@ config HID_LOGITECH_DJ
 	depends on HID_LOGITECH
 	select HID_LOGITECH_HIDPP
 	help
-	Say Y if you want support for Logitech receivers and devices.
-	Logitech receivers are capable of pairing multiple Logitech compliant
-	devices to the same receiver. Without this driver it will be handled by
-	generic USB_HID driver and all incoming events will be multiplexed
-	into a single mouse and a single keyboard device.
+	  Say Y if you want support for Logitech receivers and devices.
+	  Logitech receivers are capable of pairing multiple Logitech compliant
+	  devices to the same receiver. Without this driver it will be handled
+	  by generic USB_HID driver and all incoming events will be multiplexed
+	  into a single mouse and a single keyboard device.
 
 config HID_LOGITECH_HIDPP
 	tristate "Logitech HID++ devices support"
 	depends on HID_LOGITECH
 	select POWER_SUPPLY
 	help
-	Support for Logitech devices relying on the HID++ Logitech specification
+	  Support for Logitech devices relying on the HID++ Logitech
+	  specification
 
-	Say Y if you want support for Logitech devices relying on the HID++
-	specification. Such devices are the various Logitech Touchpads (T650,
-	T651, TK820), some mice (Zone Touch mouse), or even keyboards (Solar
-	Keyboard).
+	  Say Y if you want support for Logitech devices relying on the HID++
+	  specification. Such devices are the various Logitech Touchpads (T650,
+	  T651, TK820), some mice (Zone Touch mouse), or even keyboards (Solar
+	  Keyboard).
 
 config LOGITECH_FF
 	bool "Logitech force feedback support"
@@ -623,8 +627,8 @@ config LOGITECH_FF
 	  - Logitech WingMan Force 3D
 
 	  and if you want to enable force feedback for them.
-	  Note: if you say N here, this device will still be supported, but without
-	  force feedback.
+	  Note: if you say N here, this device will still be supported,
+	  but without force feedback.
 
 config LOGIRUMBLEPAD2_FF
 	bool "Logitech force feedback support (variant 2)"
@@ -670,50 +674,51 @@ config LOGIWHEELS_FF
 config HID_MAGICMOUSE
 	tristate "Apple Magic Mouse/Trackpad multi-touch support"
 	help
-	Support for the Apple Magic Mouse/Trackpad multi-touch.
+	  Support for the Apple Magic Mouse/Trackpad multi-touch.
 
-	Say Y here if you want support for the multi-touch features of the
-	Apple Wireless "Magic" Mouse and the Apple Wireless "Magic" Trackpad.
+	  Say Y here if you want support for the multi-touch features of the
+	  Apple Wireless "Magic" Mouse and the Apple Wireless "Magic" Trackpad.
 
 config HID_MALTRON
 	tristate "Maltron L90 keyboard"
 	help
-	Adds support for the volume up, volume down, mute, and play/pause buttons
-	of the Maltron L90 keyboard.
+	  Adds support for the volume up, volume down, mute, and play/pause
+	  buttons of the Maltron L90 keyboard.
 
 config HID_MAYFLASH
 	tristate "Mayflash game controller adapter force feedback"
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have HJZ Mayflash PS3 game controller adapters
-	and want to enable force feedback support.
+	  Say Y here if you have HJZ Mayflash PS3 game controller adapters
+	  and want to enable force feedback support.
 
 config HID_MEGAWORLD_FF
 	tristate "Mega World based game controller force feedback support"
 	depends on USB_HID
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have a Mega World based game controller and want
-	to have force feedback support for it.
+	  Say Y here if you have a Mega World based game controller and want
+	  to have force feedback support for it.
 
 config HID_REDRAGON
 	tristate "Redragon keyboards"
 	default !EXPERT
 	help
-    Support for Redragon keyboards that need fix-ups to work properly.
+	  Support for Redragon keyboards that need fix-ups to work properly.
 
 config HID_MICROSOFT
 	tristate "Microsoft non-fully HID-compliant devices"
 	default !EXPERT
 	select INPUT_FF_MEMLESS
 	help
-	Support for Microsoft devices that are not fully compliant with HID standard.
+	  Support for Microsoft devices that are not fully compliant with
+	  HID standard.
 
 config HID_MONTEREY
 	tristate "Monterey Genius KB29E keyboard"
 	default !EXPERT
 	help
-	Support for Monterey Genius KB29E.
+	  Support for Monterey Genius KB29E.
 
 config HID_MULTITOUCH
 	tristate "HID Multitouch panels"
@@ -766,35 +771,36 @@ config HID_NINTENDO
 	depends on LEDS_CLASS
 	select POWER_SUPPLY
 	help
-	Adds support for the Nintendo Switch Joy-Cons, NSO, Pro Controller.
-	All controllers support bluetooth, and the Pro Controller also supports
-	its USB mode. This also includes support for the Nintendo Switch Online
-	Controllers which include the Genesis, SNES, and N64 controllers.
+	  Adds support for the Nintendo Switch Joy-Cons, NSO, Pro Controller.
+	  All controllers support bluetooth, and the Pro Controller also
+	  supports its USB mode. This also includes support for the Nintendo
+	  Switch Online Controllers which include the Genesis, SNES,
+	  and N64 controllers.
 
-	To compile this driver as a module, choose M here: the
-	module will be called hid-nintendo.
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-nintendo.
 
 config NINTENDO_FF
 	bool "Nintendo Switch controller force feedback support"
 	depends on HID_NINTENDO
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have a Nintendo Switch controller and want to enable
-	force feedback support for it. This works for both joy-cons, the pro
-	controller, and the NSO N64 controller. For the pro controller, both
-	rumble motors can be controlled individually.
+	  Say Y here if you have a Nintendo Switch controller and want to enable
+	  force feedback support for it. This works for both joy-cons, the pro
+	  controller, and the NSO N64 controller. For the pro controller, both
+	  rumble motors can be controlled individually.
 
 config HID_NTI
 	tristate "NTI keyboard adapters"
 	help
-	Support for the "extra" Sun keyboard keys on keyboards attached
-	through Network Technologies USB-SUN keyboard adapters.
+	  Support for the "extra" Sun keyboard keys on keyboards attached
+	  through Network Technologies USB-SUN keyboard adapters.
 
 config HID_NTRIG
 	tristate "N-Trig touch screen"
 	depends on USB_HID
 	help
-	Support for N-Trig touch screen.
+	  Support for N-Trig touch screen.
 
 config HID_NVIDIA_SHIELD
 	tristate "NVIDIA SHIELD devices"
@@ -819,10 +825,10 @@ config NVIDIA_SHIELD_FF
 config HID_ORTEK
 	tristate "Ortek PKB-1700/WKB-2000/Skycable wireless keyboard and mouse trackpad"
 	help
-	There are certain devices which have LogicalMaximum wrong in the keyboard
-	usage page of their report descriptor. The most prevailing ones so far
-	are manufactured by Ortek, thus the name of the driver. Currently
-	supported devices by this driver are
+	  There are certain devices which have LogicalMaximum wrong in
+	  the keyboard usage page of their report descriptor. The most
+	  prevailing ones so far are manufactured by Ortek, thus the name
+	  of the driver. Currently supported devices by this driver are
 
 	   - Ortek PKB-1700
 	   - Ortek WKB-2000
@@ -856,7 +862,7 @@ config HID_PENMOUNT
 config HID_PETALYNX
 	tristate "Petalynx Maxter remote control"
 	help
-	Support for Petalynx Maxter remote control.
+	  Support for Petalynx Maxter remote control.
 
 config HID_PICOLCD
 	tristate "PicoLCD (graphic version)"
@@ -948,71 +954,72 @@ config PLAYSTATION_FF
 	  PlayStation game controllers.
 
 config HID_PXRC
-       tristate "PhoenixRC HID Flight Controller"
-       depends on HID
-       help
-       Support for PhoenixRC HID Flight Controller, a 8-axis flight controller.
+	tristate "PhoenixRC HID Flight Controller"
+	depends on HID
+	help
+	  Support for PhoenixRC HID Flight Controller, a 8-axis flight
+	  controller.
 
-       To compile this driver as a module, choose M here: the
-       module will be called hid-pxrc.
+	  To compile this driver as a module, choose M here: the module
+	  will be called hid-pxrc.
 
 config HID_RAZER
 	tristate "Razer non-fully HID-compliant devices"
 	help
-	Support for Razer devices that are not fully compliant with the
-	HID standard.
+	  Support for Razer devices that are not fully compliant with the
+	  HID standard.
 
 config HID_PRIMAX
 	tristate "Primax non-fully HID-compliant devices"
 	help
-	Support for Primax devices that are not fully compliant with the
-	HID standard.
+	  Support for Primax devices that are not fully compliant with the
+	  HID standard.
 
 config HID_RETRODE
 	tristate "Retrode 2 USB adapter for vintage video games"
 	depends on USB_HID
 	help
-	Support for
-	  * Retrode 2 cartridge and controller adapter
+	  Support for
+	    * Retrode 2 cartridge and controller adapter
 
 config HID_ROCCAT
 	tristate "Roccat device support"
 	depends on USB_HID
 	help
-	Support for Roccat devices.
-	Say Y here if you have a Roccat mouse or keyboard and want
-	support for its special functionalities.
+	  Support for Roccat devices.
+	  Say Y here if you have a Roccat mouse or keyboard and want
+	  support for its special functionalities.
 
 config HID_SAITEK
 	tristate "Saitek (Mad Catz) non-fully HID-compliant devices"
 	help
-	Support for Saitek devices that are not fully compliant with the
-	HID standard.
+	  Support for Saitek devices that are not fully compliant with the
+	  HID standard.
 
-	Supported devices:
-	- PS1000 Dual Analog Pad
-	- Saitek R.A.T.7, R.A.T.9, M.M.O.7 Gaming Mice
-	- Mad Catz R.A.T.5, R.A.T.9 Gaming Mice
+	  Supported devices:
+	  - PS1000 Dual Analog Pad
+	  - Saitek R.A.T.7, R.A.T.9, M.M.O.7 Gaming Mice
+	  - Mad Catz R.A.T.5, R.A.T.9 Gaming Mice
 
 config HID_SAMSUNG
 	tristate "Samsung InfraRed remote control or keyboards"
 	depends on USB_HID
 	help
-	Support for Samsung InfraRed remote control or keyboards.
+	  Support for Samsung InfraRed remote control or keyboards.
 
 config HID_SEMITEK
 	tristate "Semitek USB keyboards"
 	help
-	Support for Semitek USB keyboards that are not fully compliant
-	with the HID standard.
+	  Support for Semitek USB keyboards that are not fully compliant
+	  with the HID standard.
 
-	There are many variants, including:
-	- GK61, GK64, GK68, GK84, GK96, etc.
-	- SK61, SK64, SK68, SK84, SK96, etc.
-	- Dierya DK61/DK66
-	- Tronsmart TK09R
-	- Woo-dy
-	- X-Bows Nature/Knight
+	  There are many variants, including:
+	  - GK61, GK64, GK68, GK84, GK96, etc.
+	  - SK61, SK64, SK68, SK84, SK96, etc.
+	  - Dierya DK61/DK66
+	  - Tronsmart TK09R
+	  - Woo-dy
+	  - X-Bows Nature/Knight
 
 config HID_SIGMAMICRO
 	tristate "SiGma Micro-based keyboards"
@@ -1032,7 +1039,7 @@ config HID_SONY
 	select POWER_SUPPLY
 	select CRC32
 	help
-	Support for
+	  Support for
 
 	  * Sony PS3 6-axis controllers
 	  * Sony PS4 DualShock 4 controllers
@@ -1047,41 +1054,41 @@ config SONY_FF
 	depends on HID_SONY
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have a Sony PS2/3/4 accessory and want to enable
-	force feedback support for it.
+	  Say Y here if you have a Sony PS2/3/4 accessory and want to enable
+	  force feedback support for it.
 
 config HID_SPEEDLINK
 	tristate "Speedlink VAD Cezanne mouse support"
 	help
-	Support for Speedlink Vicious and Divine Cezanne mouse.
+	  Support for Speedlink Vicious and Divine Cezanne mouse.
 
 config HID_STEAM
 	tristate "Steam Controller/Deck support"
 	select POWER_SUPPLY
 	help
-	Say Y here if you have a Steam Controller or Deck if you want to use it
-	without running the Steam Client. It supports both the wired and
-	the wireless adaptor.
+	  Say Y here if you have a Steam Controller or Deck if you want
+	  to use it without running the Steam Client. It supports both the
+	  wired and the wireless adaptor.
 
 config STEAM_FF
 	bool "Steam Deck force feedback support"
 	depends on HID_STEAM
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you want to enable force feedback support for the Steam
-	Deck.
+	  Say Y here if you want to enable force feedback support for the Steam
+	  Deck.
 
 config HID_STEELSERIES
 	tristate "Steelseries devices support"
 	depends on USB_HID
 	help
-	Support for Steelseries SRW-S1 steering wheel, and the Steelseries
-	Arctis 1 Wireless for XBox headset.
+	  Support for Steelseries SRW-S1 steering wheel, and the Steelseries
+	  Arctis 1 Wireless for XBox headset.
 
 config HID_SUNPLUS
 	tristate "Sunplus wireless desktop"
 	help
-	Support for Sunplus wireless desktop.
+	  Support for Sunplus wireless desktop.
 
 config HID_RMI
 	tristate "Synaptics RMI4 device support"
@@ -1091,9 +1098,9 @@ config HID_RMI
 	select RMI4_F12
 	select RMI4_F30
 	help
-	Support for Synaptics RMI4 touchpads.
-	Say Y here if you have a Synaptics RMI4 touchpads over i2c-hid or usbhid
-	and want support for its special functionalities.
+	  Support for Synaptics RMI4 touchpads.
+	  Say Y here if you have a Synaptics RMI4 touchpads over i2c-hid
+	  or usbhid and want support for its special functionalities.
 
 config HID_GREENASIA
 	tristate "GreenAsia (Product ID 0x12) game controller support"
@@ -1106,58 +1113,59 @@ config GREENASIA_FF
 	depends on HID_GREENASIA
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have a GreenAsia (Product ID 0x12) based game controller
-	(like MANTA Warrior MM816 and SpeedLink Strike2 SL-6635) or adapter
-	and want to enable force feedback support for it.
+	  Say Y here if you have a GreenAsia (Product ID 0x12) based game
+	  controller (like MANTA Warrior MM816 and SpeedLink Strike2 SL-6635)
+	  or adapter and want to enable force feedback support for it.
 
 config HID_HYPERV_MOUSE
 	tristate "Microsoft Hyper-V mouse driver"
 	depends on HYPERV
 	help
-	Select this option to enable the Hyper-V mouse driver.
+	  Select this option to enable the Hyper-V mouse driver.
 
 config HID_SMARTJOYPLUS
 	tristate "SmartJoy PLUS PS2/USB adapter support"
 	help
-	Support for SmartJoy PLUS PS2/USB adapter, Super Dual Box,
-	Super Joy Box 3 Pro, Super Dual Box Pro, and Super Joy Box 5 Pro.
+	  Support for SmartJoy PLUS PS2/USB adapter, Super Dual Box,
+	  Super Joy Box 3 Pro, Super Dual Box Pro, and Super Joy Box 5 Pro.
 
-	Note that DDR (Dance Dance Revolution) mode is not supported, nor
-	is pressure sensitive buttons on the pro models.
+	  Note that DDR (Dance Dance Revolution) mode is not supported, nor
+	  is pressure sensitive buttons on the pro models.
 
 config SMARTJOYPLUS_FF
 	bool "SmartJoy PLUS PS2/USB adapter force feedback support"
 	depends on HID_SMARTJOYPLUS
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have a SmartJoy PLUS PS2/USB adapter and want to
-	enable force feedback support for it.
+	  Say Y here if you have a SmartJoy PLUS PS2/USB adapter and want to
+	  enable force feedback support for it.
 
 config HID_TIVO
 	tristate "TiVo Slide Bluetooth remote control support"
 	help
-	Say Y if you have a TiVo Slide Bluetooth remote control.
+	  Say Y if you have a TiVo Slide Bluetooth remote control.
 
 config HID_TOPSEED
 	tristate "TopSeed Cyberlink, BTC Emprex, Conceptronic remote control support"
 	help
-	Say Y if you have a TopSeed Cyberlink or BTC Emprex or Conceptronic
-	CLLRCMCE remote control.
+	  Say Y if you have a TopSeed Cyberlink or BTC Emprex or Conceptronic
+	  CLLRCMCE remote control.
 
 config HID_TOPRE
 	tristate "Topre REALFORCE keyboards"
 	depends on HID
 	help
-	  Say Y for N-key rollover support on Topre REALFORCE R2 108/87 key keyboards.
+	  Say Y for N-key rollover support on Topre REALFORCE R2 108/87
+	  key keyboards.
 
 config HID_THINGM
 	tristate "ThingM blink(1) USB RGB LED"
 	depends on LEDS_CLASS
 	select HID_LED
 	help
-	Support for the ThingM blink(1) USB RGB LED. This driver has been
-	merged into the generic hid led driver. Config symbol HID_THINGM
-	just selects HID_LED and will be removed soon.
+	  Support for the ThingM blink(1) USB RGB LED. This driver has been
+	  merged into the generic hid led driver. Config symbol HID_THINGM
+	  just selects HID_LED and will be removed soon.
 
 config HID_THRUSTMASTER
 	tristate "ThrustMaster devices support"
@@ -1206,8 +1214,8 @@ config HID_WACOM
 	select LEDS_CLASS
 	select LEDS_TRIGGERS
 	help
-	  Say Y here if you want to use the USB or BT version of the Wacom Intuos
-	  or Graphire tablet.
+	  Say Y here if you want to use the USB or BT version of the Wacom
+	  Intuos or Graphire tablet.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called wacom.
@@ -1218,30 +1226,31 @@ config HID_WIIMOTE
 	select POWER_SUPPLY
 	select INPUT_FF_MEMLESS
 	help
-	Support for Nintendo Wii and Wii U Bluetooth peripherals. Supported
-	devices are the Wii Remote and its extension devices, but also devices
-	based on the Wii Remote like the Wii U Pro Controller or the
-	Wii Balance Board.
+	  Support for Nintendo Wii and Wii U Bluetooth peripherals.
+	  Supported devices are the Wii Remote and its extension devices,
+	  but also devices based on the Wii Remote like the Wii U Pro
+	  Controller or the Wii Balance Board.
 
-	Support for all official Nintendo extensions is available, however, 3rd
-	party extensions might not be supported. Please report these devices to:
-	  http://github.com/dvdhrm/xwiimote/issues
+	  Support for all official Nintendo extensions is available,
+	  however, 3rd party extensions might not be supported.
+	  Please report these devices to:
+	    http://github.com/dvdhrm/xwiimote/issues
 
-	Other Nintendo Wii U peripherals that are IEEE 802.11 based (including
-	the Wii U Gamepad) might be supported in the future. But currently
-	support is limited to Bluetooth based devices.
+	  Other Nintendo Wii U peripherals that are IEEE 802.11 based
+	  (including the Wii U Gamepad) might be supported in the future.
+	  But currently support is limited to Bluetooth based devices.
 
-	If unsure, say N.
+	  If unsure, say N.
 
-	To compile this driver as a module, choose M here: the
-	module will be called hid-wiimote.
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-wiimote.
 
 config HID_XINMO
 	tristate "Xin-Mo non-fully compliant devices"
 	help
-	Support for Xin-Mo devices that are not fully compliant with the HID
-	standard. Currently only supports the Xin-Mo Dual Arcade. Say Y here
-	if you have a Xin-Mo Dual Arcade controller.
+	  Support for Xin-Mo devices that are not fully compliant with the HID
+	  standard. Currently only supports the Xin-Mo Dual Arcade. Say Y here
+	  if you have a Xin-Mo Dual Arcade controller.
 
 config HID_ZEROPLUS
 	tristate "Zeroplus based game controller support"
@@ -1259,7 +1268,7 @@ config ZEROPLUS_FF
 config HID_ZYDACRON
 	tristate "Zydacron remote control support"
 	help
-	Support for Zydacron remote control.
+	  Support for Zydacron remote control.
 
 config HID_SENSOR_HUB
 	tristate "HID Sensors framework support"
@@ -1293,9 +1302,9 @@ config HID_SENSOR_CUSTOM_SENSOR
 config HID_ALPS
 	tristate "Alps HID device support"
 	help
-	Support for Alps I2C HID touchpads and StickPointer.
-	Say Y here if you have a Alps touchpads over i2c-hid or usbhid
-	and want support for its special functionalities.
+	  Support for Alps I2C HID touchpads and StickPointer.
+	  Say Y here if you have a Alps touchpads over i2c-hid or usbhid
+	  and want support for its special functionalities.
 
 config HID_MCP2200
 	tristate "Microchip MCP2200 HID USB-to-GPIO bridge"
@@ -1312,11 +1321,11 @@ config HID_MCP2221
 	imply GPIOLIB
 	imply IIO
 	help
-	Provides I2C and SMBUS host adapter functionality over USB-HID
-	through MCP2221 device.
+	  Provides I2C and SMBUS host adapter functionality over USB-HID
+	  through MCP2221 device.
 
-	To compile this driver as a module, choose M here: the module
-	will be called hid-mcp2221.ko.
+	  To compile this driver as a module, choose M here: the module
+	  will be called hid-mcp2221.ko.
 
 config HID_KUNIT_TEST
 	tristate "KUnit tests for HID" if !KUNIT_ALL_TESTS
-- 
2.44.0


