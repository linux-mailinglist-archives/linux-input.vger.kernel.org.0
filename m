Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7E02F956C
	for <lists+linux-input@lfdr.de>; Sun, 17 Jan 2021 22:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbhAQVV2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 16:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhAQVV1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 16:21:27 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27176C061573;
        Sun, 17 Jan 2021 13:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=y4AZ8PNCyMuFOyA8vyXVOMMLYX3CKh2aj7V1dzB1qnk=; b=sYLehUG7FZH4BvO25LY3AmjVmt
        hv3GKCw2e1KUXEZo6Xci+UrSmMAYT6e/kxanwhWoVIfuaS5AOSgX2z8+ieKC6fyvQiCbfQh9g4v/K
        k1IaeM9OZuy97Jq83M4Fmg0EQ+VXjIEaW8QoDC6bz8o0sRKxREBKhdNxHTT3yMdMoEbYF+VaIZ2Ez
        76b4tlMV+1I5MH62l6jOBaHqOHFKZhqHbMEYDMy0SrZ0mY366FEUBmTqzk+nWwI6IIut7hWTo7bi3
        0/11KpsLA+5Y6fVfvmf9HZdwlUAKHhP+6D398LVt+8ig7UZcX+YhWXIcTJVuxKpJycxRBAI+1a7dZ
        hYgbtV/A==;
Received: from [2601:1c0:6280:3f0::9abc] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l1FTV-0004nG-Cv; Sun, 17 Jan 2021 21:20:42 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH -next] hid: clean up Kconfig
Date:   Sun, 17 Jan 2021 13:20:33 -0800
Message-Id: <20210117212033.30845-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a large cleanup of drivers/hid/Kconfig:

* Use tab instead of spaces for main menu "depends on INPUT".

* Indent help text by 2 spaces (total of one tab + 2 spaces).

* Convert 2 intra-line tabs to spaces.
* Convert multiple spaces to one space in help text.

* Reflow a few help text lines if they are too long (for a 80-character
terminal).

* Capitalize beginning of a phrase (for consistency).
* Capitalize 2 product names.

* Drop one trailing space.
* End 2 sentences with a period ('.').

* Fix grammar: is -> are

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
---
 drivers/hid/Kconfig |  498 +++++++++++++++++++++---------------------
 1 file changed, 251 insertions(+), 247 deletions(-)

--- linux-next-20210115.orig/drivers/hid/Kconfig
+++ linux-next-20210115/drivers/hid/Kconfig
@@ -3,7 +3,7 @@
 # HID driver configuration
 #
 menu "HID support"
-     depends on INPUT
+	depends on INPUT
 
 config HID
 	tristate "HID bus support"
@@ -32,62 +32,62 @@ config HID_BATTERY_STRENGTH
 	select POWER_SUPPLY
 	default n
 	help
-	This option adds support of reporting battery strength (for HID devices
-	that support this feature) through power_supply class so that userspace
-	tools, such as upower, can display it.
+	  This option adds support of reporting battery strength (for HID devices
+	  that support this feature) through power_supply class so that userspace
+	  tools, such as upower, can display it.
 
 config HIDRAW
 	bool "/dev/hidraw raw HID device support"
 	depends on HID
 	help
-	Say Y here if you want to support HID devices (from the USB
-	specification standpoint) that aren't strictly user interface
-	devices, like monitor controls and Uninterruptible Power Supplies.
-
-	This module supports these devices separately using a separate
-	event interface on /dev/hidraw.
-
-	There is also a /dev/hiddev configuration option in the USB HID
-	configuration menu. In comparison to hiddev, this device does not process
-	the hid events at all (no parsing, no lookups). This lets applications
-	to work on raw hid events when they want to, and avoid using transport-specific
-	userspace libhid/libusb libraries.
+	  Say Y here if you want to support HID devices (from the USB
+	  specification standpoint) that aren't strictly user interface
+	  devices, like monitor controls and Uninterruptible Power Supplies.
+
+	  This module supports these devices separately using a separate
+	  event interface on /dev/hidraw.
+
+	  There is also a /dev/hiddev configuration option in the USB HID
+	  configuration menu. In comparison to hiddev, this device does not process
+	  the hid events at all (no parsing, no lookups). This lets applications
+	  to work on raw hid events when they want to, and avoid using
+	  transport-specific userspace libhid/libusb libraries.
 
-	If unsure, say Y.
+	  If unsure, say Y.
 
 config UHID
 	tristate "User-space I/O driver support for HID subsystem"
 	depends on HID
 	default n
 	help
-	Say Y here if you want to provide HID I/O Drivers from user-space.
-	This allows to write I/O drivers in user-space and feed the data from
-	the device into the kernel. The kernel parses the HID reports, loads the
-	corresponding HID Device Driver or provides input devices on top of your
-	user-space device.
-
-	This driver cannot be used to parse HID-reports in user-space and write
-	special HID-drivers. You should use hidraw for that.
-	Instead, this driver allows to write the transport-layer driver in
-	user-space like USB-HID and Bluetooth-HID do in kernel-space.
+	  Say Y here if you want to provide HID I/O Drivers from user-space.
+	  This allows to write I/O drivers in user-space and feed the data from
+	  the device into the kernel. The kernel parses the HID reports, loads the
+	  corresponding HID Device Driver or provides input devices on top of your
+	  user-space device.
+
+	  This driver cannot be used to parse HID-reports in user-space and write
+	  special HID-drivers. You should use hidraw for that.
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
 	depends on HID
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
 	depends on HID
@@ -97,7 +97,7 @@ config HID_A4TECH
 	depends on HID
 	default !EXPERT
 	help
-	Support for A4 tech X5 and WOP-35 / Trust 450L mice.
+	  Support for A4 tech X5 and WOP-35 / Trust 450L mice.
 
 config HID_ACCUTOUCH
 	tristate "Accutouch touch device"
@@ -107,7 +107,7 @@ config HID_ACCUTOUCH
 
 	  The driver works around a problem in the reported device capabilities
 	  which causes userspace to detect the device as a mouse rather than
-          a touchscreen.
+	  a touchscreen.
 
 	  Say Y here if you have a Accutouch 2216 touch controller.
 
@@ -115,37 +115,37 @@ config HID_ACRUX
 	tristate "ACRUX game controller support"
 	depends on HID
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
 	depends on HID
 	default !EXPERT
 	help
-	Support for some Apple devices which less or more break
-	HID specification.
+	  Support for some Apple devices which less or more break
+	  HID specification.
 
-	Say Y here if you want support for keyboards of	Apple iBooks, PowerBooks,
-	MacBooks, MacBook Pros and Apple Aluminum.
+	  Say Y here if you want support for keyboards of Apple iBooks, PowerBooks,
+	  MacBooks, MacBook Pros and Apple Aluminum.
 
 config HID_APPLEIR
 	tristate "Apple infrared receiver"
 	depends on (USB_HID)
 	help
-	Support for Apple infrared remote control. All the Apple computers from
+	  Support for Apple infrared remote control. All the Apple computers from
 	  2005 onwards include such a port, except the unibody Macbook (2009),
 	  and Mac Pros. This receiver is also used in the Apple TV set-top box
 	  prior to the 2010 model.
 
-	Say Y here if you want support for Apple infrared remote control.
+	  Say Y here if you want support for Apple infrared remote control.
 
 config HID_ASUS
 	tristate "Asus"
@@ -154,37 +154,38 @@ config HID_ASUS
 	depends on ASUS_WMI || ASUS_WMI=n
 	select POWER_SUPPLY
 	help
-	Support for Asus notebook built-in keyboard and touchpad via i2c, and
-	the Asus Republic of Gamers laptop keyboard special keys.
+	  Support for Asus notebook built-in keyboard and touchpad via i2c, and
+	  the Asus Republic of Gamers laptop keyboard special keys.
 
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
 	depends on HID
 	help
-	Support for Aureal Cy se W-01RN Remote Controller and other Aureal derived remotes.
+	  Support for Aureal Cy se W-01RN Remote Controller and other Aureal
+	  derived remotes.
 
 config HID_BELKIN
 	tristate "Belkin Flip KVM and Wireless keyboard"
 	depends on HID
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
+	  Say Y here if you want to enable force feedback support for devices by
+	  BETOP Production Ltd.
+	  Currently the following devices are known to be supported:
+	   - BETOP 2185 PC & BFM MODE
 
 config HID_BIGBEN_FF
 	tristate "BigBen Interactive Kids' gamepad support"
@@ -203,54 +204,54 @@ config HID_CHERRY
 	depends on HID
 	default !EXPERT
 	help
-	Support for Cherry Cymotion keyboard.
+	  Support for Cherry Cymotion keyboard.
 
 config HID_CHICONY
 	tristate "Chicony devices"
 	depends on HID
 	default !EXPERT
 	help
-	Support for Chicony Tactical pad and special keys on Chicony keyboards.
+	  Support for Chicony Tactical pad and special keys on Chicony keyboards.
 
 config HID_CORSAIR
 	tristate "Corsair devices"
 	depends on HID && USB && LEDS_CLASS
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
 	depends on HID
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
 	depends on HID
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
 	depends on HID && SND
 	select SND_RAWMIDI
 	help
-	Support for Prodikeys PC-MIDI Keyboard device support.
-	Say Y here to enable support for this device.
-	- Prodikeys PC-MIDI keyboard.
+	  Support for Prodikeys PC-MIDI Keyboard device support.
+	  Say Y here to enable support for this device.
+	    - Prodikeys PC-MIDI keyboard.
 	  The Prodikeys PC-MIDI acts as a USB Audio device, with one MIDI
 	  input and one MIDI output. These MIDI jacks appear as
 	  a sound "card" in the ALSA sound system.
@@ -262,76 +263,76 @@ config HID_CMEDIA
 	tristate "CMedia CM6533 HID audio jack controls"
 	depends on HID
 	help
-	Support for CMedia CM6533 HID audio jack controls.
+	  Support for CMedia CM6533 HID audio jack controls.
 
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
+	  Support for Creative infrared SB0540-compatible remote controls, such
+	  as the RM-1500 and RM-1800 remotes.
 
-	Say Y here if you want support for Creative SB0540 infrared receiver.
+	  Say Y here if you want support for Creative SB0540 infrared receiver.
 
 config HID_CYPRESS
 	tristate "Cypress mouse and barcode readers"
 	depends on HID
 	default !EXPERT
 	help
-	Support for cypress mouse and barcode readers.
+	  Support for Cypress mouse and barcode readers.
 
 config HID_DRAGONRISE
 	tristate "DragonRise Inc. game controller"
 	depends on HID
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
+	  Say Y here if you want to enable force feedback support for DragonRise
+	  Inc. game controllers.
 
 config HID_EMS_FF
 	tristate "EMS Production Inc. force feedback support"
 	depends on HID
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you want to enable force feedback support for devices by
-	EMS Production Ltd.
-	Currently the following devices are known to be supported:
-	 - Trio Linker Plus II
+	  Say Y here if you want to enable force feedback support for devices by
+	  EMS Production Ltd.
+	  Currently the following devices are known to be supported:
+	  - Trio Linker Plus II
 
 config HID_ELAN
 	tristate "ELAN USB Touchpad Support"
 	depends on LEDS_CLASS && USB_HID
 	help
-	Say Y to enable support for the USB ELAN touchpad
-	Currently the following devices are known to be supported:
-	 - HP Pavilion X2 10-p0XX.
+	  Say Y to enable support for the USB ELAN touchpad.
+	  Currently the following devices are known to be supported:
+	  - HP Pavilion X2 10-p0XX.
 
 config HID_ELECOM
 	tristate "ELECOM HID devices"
 	depends on HID
 	help
-	Support for ELECOM devices:
+	  Support for ELECOM devices:
 	  - BM084 Bluetooth Mouse
 	  - EX-G Trackballs (M-XT3DRBK, M-XT3URBK)
 	  - DEFT Trackballs (M-DT1DRBK, M-DT1URBK, M-DT2DRBK, M-DT2URBK)
@@ -341,27 +342,27 @@ config HID_ELO
 	tristate "ELO USB 4000/4500 touchscreen"
 	depends on USB_HID
 	help
-	Support for the ELO USB 4000/4500 touchscreens. Note that this is for
-	different devices than those handled by CONFIG_TOUCHSCREEN_USB_ELO.
+	  Support for the ELO USB 4000/4500 touchscreens. Note that this is for
+	  different devices than those handled by CONFIG_TOUCHSCREEN_USB_ELO.
 
 config HID_EZKEY
 	tristate "Ezkey BTC 8193 keyboard"
 	depends on HID
 	default !EXPERT
 	help
-	Support for Ezkey BTC 8193 keyboard.
+	  Support for Ezkey BTC 8193 keyboard.
 
 config HID_GEMBIRD
 	tristate "Gembird Joypad"
 	depends on HID
 	help
-	Support for Gembird JPD-DualForce 2.
+	  Support for Gembird JPD-DualForce 2.
 
 config HID_GFRM
 	tristate "Google Fiber TV Box remote control support"
 	depends on HID
 	help
-	Support for Google Fiber TV Box remote controls
+	  Support for Google Fiber TV Box remote controls
 
 config HID_GLORIOUS
 	tristate "Glorious PC Gaming Race mice"
@@ -374,7 +375,7 @@ config HID_HOLTEK
 	tristate "Holtek HID devices"
 	depends on USB_HID
 	help
-	Support for Holtek based devices:
+	  Support for Holtek based devices:
 	  - Holtek On Line Grip based game controller
 	  - Trust GXT 18 Gaming Keyboard
 	  - Sharkoon Drakonia / Perixx MX-2000 gaming mice
@@ -395,7 +396,7 @@ config HID_GOOGLE_HAMMER
 	tristate "Google Hammer Keyboard"
 	depends on USB_HID && LEDS_CLASS && CROS_EC
 	help
-	Say Y here if you have a Google Hammer device.
+	  Say Y here if you have a Google Hammer device.
 
 config HID_VIVALDI
 	tristate "Vivaldi Keyboard"
@@ -410,45 +411,45 @@ config HID_GT683R
 	tristate "MSI GT68xR LED support"
 	depends on LEDS_CLASS && USB_HID
 	help
-	Say Y here if you want to enable support for the three MSI GT68xR LEDs
+	  Say Y here if you want to enable support for the three MSI GT68xR LEDs
 
-	This driver support following modes:
+	  This driver support following modes:
 	  - Normal: LEDs are fully on when enabled
 	  - Audio:  LEDs brightness depends on sound level
 	  - Breathing: LEDs brightness varies at human breathing rate
 
-	Currently the following devices are know to be supported:
+	  Currently the following devices are know to be supported:
 	  - MSI GT683R
 
 config HID_KEYTOUCH
 	tristate "Keytouch HID devices"
 	depends on HID
 	help
-	Support for Keytouch HID devices not fully compliant with
-	the specification. Currently supported:
+	  Support for Keytouch HID devices not fully compliant with
+	  the specification. Currently supported:
 		- Keytouch IEC 60945
 
 config HID_KYE
 	tristate "KYE/Genius devices"
 	depends on HID
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
 	depends on HID
 	help
-	Support for Waltop tablets.
+	  Support for Waltop tablets.
 
 config HID_VIEWSONIC
 	tristate "ViewSonic/Signotec"
@@ -460,68 +461,68 @@ config HID_GYRATION
 	tristate "Gyration remote control"
 	depends on HID
 	help
-	Support for Gyration remote control.
+	  Support for Gyration remote control.
 
 config HID_ICADE
 	tristate "ION iCade arcade controller"
 	depends on HID
 	help
-	Support for the ION iCade arcade controller to work as a joystick.
+	  Support for the ION iCade arcade controller to work as a joystick.
 
-	To compile this driver as a module, choose M here: the
-	module will be called hid-icade.
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-icade.
 
 config HID_ITE
 	tristate "ITE devices"
 	depends on HID
 	default !EXPERT
 	help
-	Support for ITE devices not fully compliant with HID standard.
+	  Support for ITE devices not fully compliant with HID standard.
 
 config HID_JABRA
 	tristate "Jabra USB HID Driver"
 	depends on HID
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
 	depends on HID
 	help
-	Support for Twinhan IR remote control.
+	  Support for Twinhan IR remote control.
 
 config HID_KENSINGTON
 	tristate "Kensington Slimblade Trackball"
 	depends on HID
 	default !EXPERT
 	help
-	Support for Kensington Slimblade Trackball.
+	  Support for Kensington Slimblade Trackball.
 
 config HID_LCPOWER
 	tristate "LC-Power"
 	depends on HID
 	help
-	Support for LC-Power RC1000MCE RF remote control.
+	  Support for LC-Power RC1000MCE RF remote control.
 
 config HID_LED
 	tristate "Simple RGB LED support"
 	depends on HID
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
@@ -529,15 +530,16 @@ config HID_LENOVO
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
-	Support for IBM/Lenovo devices that are not fully compliant with HID standard.
+	  Support for IBM/Lenovo devices that are not fully compliant with HID
+	  standard.
 
-	Say Y if you want support for horizontal scrolling of the IBM/Lenovo
-	Scrollpoint mice or the non-compliant features of the Lenovo Thinkpad
-	standalone keyboards, e.g:
-	- ThinkPad USB Keyboard with TrackPoint (supports extra LEDs and trackpoint
-	  configuration)
-	- ThinkPad Compact Bluetooth Keyboard with TrackPoint (supports Fn keys)
-	- ThinkPad Compact USB Keyboard with TrackPoint (supports Fn keys)
+	  Say Y if you want support for horizontal scrolling of the IBM/Lenovo
+	  Scrollpoint mice or the non-compliant features of the Lenovo Thinkpad
+	  standalone keyboards, e.g.:
+	  - ThinkPad USB Keyboard with TrackPoint (supports extra LEDs and trackpoint
+	    configuration)
+	  - ThinkPad Compact Bluetooth Keyboard with TrackPoint (supports Fn keys)
+	  - ThinkPad Compact USB Keyboard with TrackPoint (supports Fn keys)
 
 config HID_LOGITECH
 	tristate "Logitech devices"
@@ -545,7 +547,8 @@ config HID_LOGITECH
 	depends on LEDS_CLASS
 	default !EXPERT
 	help
-	Support for Logitech devices that are not fully compliant with HID standard.
+	  Support for Logitech devices that are not fully compliant with HID
+	  standard.
 
 config HID_LOGITECH_DJ
 	tristate "Logitech receivers full support"
@@ -554,23 +557,23 @@ config HID_LOGITECH_DJ
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
+	  devices to the same receiver. Without this driver it will be handled by
+	  generic USB_HID driver and all incoming events will be multiplexed
+	  into a single mouse and a single keyboard device.
 
 config HID_LOGITECH_HIDPP
 	tristate "Logitech HID++ devices support"
 	depends on HID_LOGITECH
 	select POWER_SUPPLY
 	help
-	Support for Logitech devices relyingon the HID++ Logitech specification
+	  Support for Logitech devices relying on the HID++ Logitech specification.
 
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
@@ -631,32 +634,32 @@ config HID_MAGICMOUSE
 	tristate "Apple Magic Mouse/Trackpad multi-touch support"
 	depends on HID
 	help
-	Support for the Apple Magic Mouse/Trackpad multi-touch.
+	  Support for the Apple Magic Mouse/Trackpad multi-touch.
 
-	Say Y here if you want support for the multi-touch features of the
-	Apple Wireless "Magic" Mouse and the Apple Wireless "Magic" Trackpad.
+	  Say Y here if you want support for the multi-touch features of the
+	  Apple Wireless "Magic" Mouse and the Apple Wireless "Magic" Trackpad.
 
 config HID_MALTRON
 	tristate "Maltron L90 keyboard"
 	depends on HID
 	help
-	Adds support for the volume up, volume down, mute, and play/pause buttons
-	of the Maltron L90 keyboard.
+	  Adds support for the volume up, volume down, mute, and play/pause buttons
+	  of the Maltron L90 keyboard.
 
 config HID_MAYFLASH
 	tristate "Mayflash game controller adapter force feedback"
 	depends on HID
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have HJZ Mayflash PS3 game controller adapters
-	and want to enable force feedback support.
+	  Say Y here if you have HJZ Mayflash PS3 game controller adapters
+	  and want to enable force feedback support.
 
 config HID_REDRAGON
 	tristate "Redragon keyboards"
 	depends on HID
 	default !EXPERT
 	help
-    Support for Redragon keyboards that need fix-ups to work properly.
+	  Support for Redragon keyboards that need fix-ups to work properly.
 
 config HID_MICROSOFT
 	tristate "Microsoft non-fully HID-compliant devices"
@@ -664,14 +667,15 @@ config HID_MICROSOFT
 	default !EXPERT
 	select INPUT_FF_MEMLESS
 	help
-	Support for Microsoft devices that are not fully compliant with HID standard.
+	  Support for Microsoft devices that are not fully compliant with HID
+	  standard.
 
 config HID_MONTEREY
 	tristate "Monterey Genius KB29E keyboard"
 	depends on HID
 	default !EXPERT
 	help
-	Support for Monterey Genius KB29E.
+	  Support for Monterey Genius KB29E.
 
 config HID_MULTITOUCH
 	tristate "HID Multitouch panels"
@@ -722,23 +726,23 @@ config HID_MULTITOUCH
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
 
 config HID_ORTEK
 	tristate "Ortek PKB-1700/WKB-2000/Skycable wireless keyboard and mouse trackpad"
 	depends on HID
 	help
-	There are certain devices which have LogicalMaximum wrong in the keyboard
-	usage page of their report descriptor. The most prevailing ones so far
-	are manufactured by Ortek, thus the name of the driver. Currently
-	supported devices by this driver are
+	  There are certain devices which have LogicalMaximum wrong in the keyboard
+	  usage page of their report descriptor. The most prevailing ones so far
+	  are manufactured by Ortek, thus the name of the driver. Currently
+	  supported devices by this driver are
 
 	   - Ortek PKB-1700
 	   - Ortek WKB-2000
@@ -765,7 +769,7 @@ config HID_PENMOUNT
 	help
 	  This selects a driver for the PenMount 6000 touch controller.
 
-	  The driver works around a problem in the report descript allowing
+	  The driver works around a problem in the report descriptor allowing
 	  the userspace to touch events instead of mouse events.
 
 	  Say Y here if you have a Penmount based touch controller.
@@ -774,7 +778,7 @@ config HID_PETALYNX
 	tristate "Petalynx Maxter remote control"
 	depends on HID
 	help
-	Support for Petalynx Maxter remote control.
+	  Support for Petalynx Maxter remote control.
 
 config HID_PICOLCD
 	tristate "PicoLCD (graphic version)"
@@ -786,7 +790,7 @@ config HID_PICOLCD
 	  This includes support for the following device features:
 	  - Keypad
 	  - Switching between Firmware and Flash mode
-	  - EEProm / Flash access     (via debugfs)
+	  - EEProm / Flash access (via debugfs)
 	  Features selectively enabled:
 	  - Framebuffer for monochrome 256x64 display
 	  - Backlight control
@@ -857,41 +861,41 @@ config HID_PRIMAX
 	tristate "Primax non-fully HID-compliant devices"
 	depends on HID
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
+	  Support for
 	  * Retrode 2 cartridge and controller adapter
 
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
 	depends on HID
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
 	depends on HID
 	help
-	Support for Samsung InfraRed remote control or keyboards.
+	  Support for Samsung InfraRed remote control or keyboards.
 
 config HID_SONY
 	tristate "Sony PS2/3/4 accessories"
@@ -901,7 +905,7 @@ config HID_SONY
 	select POWER_SUPPLY
 	select CRC32
 	help
-	Support for
+	  Support for
 
 	  * Sony PS3 6-axis controllers
 	  * Sony PS4 DualShock 4 controllers
@@ -911,39 +915,39 @@ config HID_SONY
 	  * Guitar Hero Live PS3 and Wii U guitar dongles
 
 config SONY_FF
-	bool "Sony PS2/3/4 accessories force feedback support" 
+	bool "Sony PS2/3/4 accessories force feedback support"
 	depends on HID_SONY
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have a Sony PS2/3/4 accessory and want to enable
-	force feedback support for it.
+	  Say Y here if you have a Sony PS2/3/4 accessory and want to enable
+	  force feedback support for it.
 
 config HID_SPEEDLINK
 	tristate "Speedlink VAD Cezanne mouse support"
 	depends on HID
 	help
-	Support for Speedlink Vicious and Divine Cezanne mouse.
+	  Support for Speedlink Vicious and Divine Cezanne mouse.
 
 config HID_STEAM
 	tristate "Steam Controller support"
 	depends on HID
 	select POWER_SUPPLY
 	help
-	Say Y here if you have a Steam Controller if you want to use it
-	without running the Steam Client. It supports both the wired and
-	the wireless adaptor.
+	  Say Y here if you have a Steam Controller if you want to use it
+	  without running the Steam Client. It supports both the wired and
+	  the wireless adaptor.
 
 config HID_STEELSERIES
 	tristate "Steelseries SRW-S1 steering wheel support"
 	depends on HID
 	help
-	Support for Steelseries SRW-S1 steering wheel
+	  Support for Steelseries SRW-S1 steering wheel.
 
 config HID_SUNPLUS
 	tristate "Sunplus wireless desktop"
 	depends on HID
 	help
-	Support for Sunplus wireless desktop.
+	  Support for Sunplus wireless desktop.
 
 config HID_RMI
 	tristate "Synaptics RMI4 device support"
@@ -954,9 +958,9 @@ config HID_RMI
 	select RMI4_F12
 	select RMI4_F30
 	help
-	Support for Synaptics RMI4 touchpads.
-	Say Y here if you have a Synaptics RMI4 touchpads over i2c-hid or usbhid
-	and want support for its special functionalities.
+	  Support for Synaptics RMI4 touchpads.
+	  Say Y here if you have a Synaptics RMI4 touchpads over i2c-hid or usbhid
+	  and want support for its special functionalities.
 
 config HID_GREENASIA
 	tristate "GreenAsia (Product ID 0x12) game controller support"
@@ -970,33 +974,33 @@ config GREENASIA_FF
 	depends on HID_GREENASIA
 	select INPUT_FF_MEMLESS
 	help
-	Say Y here if you have a GreenAsia (Product ID 0x12) based game controller
-	(like MANTA Warrior MM816 and SpeedLink Strike2 SL-6635) or adapter
-	and want to enable force feedback support for it.
+	  Say Y here if you have a GreenAsia (Product ID 0x12) based game controller
+	  (like MANTA Warrior MM816 and SpeedLink Strike2 SL-6635) or adapter
+	  and want to enable force feedback support for it.
 
 config HID_HYPERV_MOUSE
 	tristate "Microsoft Hyper-V mouse driver"
 	depends on HYPERV
 	help
-	Select this option to enable the Hyper-V mouse driver.
+	  Select this option to enable the Hyper-V mouse driver.
 
 config HID_SMARTJOYPLUS
 	tristate "SmartJoy PLUS PS2/USB adapter support"
 	depends on HID
 	help
-	Support for SmartJoy PLUS PS2/USB adapter, Super Dual Box,
-	Super Joy Box 3 Pro, Super Dual Box Pro, and Super Joy Box 5 Pro.
+	  Support for SmartJoy PLUS PS2/USB adapter, Super Dual Box,
+	  Super Joy Box 3 Pro, Super Dual Box Pro, and Super Joy Box 5 Pro.
 
-	Note that DDR (Dance Dance Revolution) mode is not supported, nor
-	is pressure sensitive buttons on the pro models.
+	  Note that DDR (Dance Dance Revolution) mode is not supported, nor
+	  are pressure sensitive buttons on the Pro models.
 
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
@@ -1008,8 +1012,8 @@ config HID_TOPSEED
 	tristate "TopSeed Cyberlink, BTC Emprex, Conceptronic remote control support"
 	depends on HID
 	help
-	Say Y if you have a TopSeed Cyberlink or BTC Emprex or Conceptronic
-	CLLRCMCE remote control.
+	  Say Y if you have a TopSeed Cyberlink or BTC Emprex or Conceptronic
+	  CLLRCMCE remote control.
 
 config HID_THINGM
 	tristate "ThingM blink(1) USB RGB LED"
@@ -1017,9 +1021,9 @@ config HID_THINGM
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
@@ -1081,31 +1085,31 @@ config HID_WIIMOTE
 	select POWER_SUPPLY
 	select INPUT_FF_MEMLESS
 	help
-	Support for Nintendo Wii and Wii U Bluetooth peripherals. Supported
-	devices are the Wii Remote and its extension devices, but also devices
-	based on the Wii Remote like the Wii U Pro Controller or the
-	Wii Balance Board.
-
-	Support for all official Nintendo extensions is available, however, 3rd
-	party extensions might not be supported. Please report these devices to:
-	  http://github.com/dvdhrm/xwiimote/issues
-
-	Other Nintendo Wii U peripherals that are IEEE 802.11 based (including
-	the Wii U Gamepad) might be supported in the future. But currently
-	support is limited to Bluetooth based devices.
+	  Support for Nintendo Wii and Wii U Bluetooth peripherals. Supported
+	  devices are the Wii Remote and its extension devices, but also devices
+	  based on the Wii Remote like the Wii U Pro Controller or the
+	  Wii Balance Board.
+
+	  Support for all official Nintendo extensions is available, however, 3rd
+	  party extensions might not be supported. Please report these devices to:
+	    http://github.com/dvdhrm/xwiimote/issues
+
+	  Other Nintendo Wii U peripherals that are IEEE 802.11 based (including
+	  the Wii U Gamepad) might be supported in the future. But currently
+	  support is limited to Bluetooth based devices.
 
-	If unsure, say N.
+	  If unsure, say N.
 
-	To compile this driver as a module, choose M here: the
-	module will be called hid-wiimote.
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-wiimote.
 
 config HID_XINMO
 	tristate "Xin-Mo non-fully compliant devices"
 	depends on HID
 	help
-	Support for Xin-Mo devices that are not fully compliant with the HID
-	standard. Currently only supports the Xin-Mo Dual Arcade. Say Y here
-	if you have a Xin-Mo Dual Arcade controller.
+	  Support for Xin-Mo devices that are not fully compliant with the HID
+	  standard. Currently only supports the Xin-Mo Dual Arcade. Say Y here
+	  if you have a Xin-Mo Dual Arcade controller.
 
 config HID_ZEROPLUS
 	tristate "Zeroplus based game controller support"
@@ -1160,20 +1164,20 @@ config HID_ALPS
 	tristate "Alps HID device support"
 	depends on HID
 	help
-	Support for Alps I2C HID touchpads and StickPointer.
-	Say Y here if you have a Alps touchpads over i2c-hid or usbhid
-	and want support for its special functionalities.
+	  Support for Alps I2C HID touchpads and StickPointer.
+	  Say Y here if you have a Alps touchpads over i2c-hid or usbhid
+	  and want support for its special functionalities.
 
 config HID_MCP2221
 	tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
 	depends on USB_HID && I2C
 	depends on GPIOLIB
 	help
-	Provides I2C and SMBUS host adapter functionality over USB-HID
-	through MCP2221 device.
+	  Provides I2C and SMBUS host adapter functionality over USB-HID
+	  through MCP2221 device.
 
-	To compile this driver as a module, choose M here: the module
-	will be called hid-mcp2221.ko.
+	  To compile this driver as a module, choose M here: the module
+	  will be called hid-mcp2221.ko.
 
 endmenu
 
