Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9AC368190
	for <lists+linux-input@lfdr.de>; Thu, 22 Apr 2021 15:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbhDVNha (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Apr 2021 09:37:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:32914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235977AbhDVNha (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Apr 2021 09:37:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D03C61426;
        Thu, 22 Apr 2021 13:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619098615;
        bh=AsB5a//wbGi9tH3U2EOc0QPelMK+SQVAHVb8qX57eQY=;
        h=From:To:Cc:Subject:Date:From;
        b=jBM7xxsspuAwMDcRv/DY/iVakN+zpyCiExDuJCr4H5ltKRVDfpskc8mVr4+Id0WcT
         +pTSzq3z8QNFBE6BjtKnSd4+ynvQP/j5i+iduP42cr3xk6j0IG6K7cFORaBQXlDwdC
         5NolXKXFf2W7S1F/OJF4D8zDiSLH1S+HwfH1M2UumiowF3BKAK10dmbd5kuDOlINqG
         SiDchdbA8UkHOeT0suG7gZrlSIHQ8XQQuobEYaFIv3lCP3HV6CGYOtgEQ9DjZANflj
         36ivXnlteOahi5grpq84VvvKczXXAxpZwFoAnVSEsjDf85DLRtNERQ78ggW/jULQdg
         DivpCVJgWD8wA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: rework USB Kconfig dependencies
Date:   Thu, 22 Apr 2021 15:36:06 +0200
Message-Id: <20210422133647.1877425-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A lot of input drivers traditionally depend on CONFIG_USB_ARCH_HAS_HCD
and select CONFIG_USB. This works but is different from almost every
other subsystem in the kernel.

I found this when debugging a build failure in the RC subsystem that
had the same logic.

The problem here is that CONFIG_USB_ARCH_HAS_HCD no longer has
a meaning since the host controller support has been changed to
use machine specific loadable modules for the USB host. Selecting
a subsystem that a driver needs is confusing and can lead to
recursive dependency chains in Kconfig.

In both cases, the normal logic is to specify 'depends on USB'.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/joystick/Kconfig    |  6 ++----
 drivers/input/misc/Kconfig        | 15 +++++----------
 drivers/input/mouse/Kconfig       |  9 +++------
 drivers/input/tablet/Kconfig      | 15 +++++----------
 drivers/input/touchscreen/Kconfig |  3 +--
 5 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 5e38899058c1..10eb463b42f7 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -291,8 +291,7 @@ config JOYSTICK_JOYDUMP
 
 config JOYSTICK_XPAD
 	tristate "X-Box gamepad support"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use the X-Box pad with your computer.
 	  Make sure to say Y to "Joystick support" (CONFIG_INPUT_JOYDEV)
@@ -364,8 +363,7 @@ config JOYSTICK_PSXPAD_SPI_FF
 
 config JOYSTICK_PXRC
 	tristate "PhoenixRC Flight Controller Adapter"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use the PhoenixRC Flight Controller Adapter.
 
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 97f0455c2aee..85575df19aa8 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -367,8 +367,7 @@ config INPUT_ATLAS_BTNS
 
 config INPUT_ATI_REMOTE2
 	tristate "ATI / Philips USB RF remote control"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use an ATI or Philips USB RF remote control.
 	  These are RF remotes with USB receivers.
@@ -382,8 +381,7 @@ config INPUT_ATI_REMOTE2
 
 config INPUT_KEYSPAN_REMOTE
 	tristate "Keyspan DMR USB remote control"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use a Keyspan DMR USB remote control.
 	  Currently only the UIA-11 type of receiver has been tested.  The tag
@@ -407,8 +405,7 @@ config INPUT_KXTJ9
 
 config INPUT_POWERMATE
 	tristate "Griffin PowerMate and Contour Jog support"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use Griffin PowerMate or Contour Jog devices.
 	  These are aluminum dials which can measure clockwise and anticlockwise
@@ -423,8 +420,7 @@ config INPUT_POWERMATE
 
 config INPUT_YEALINK
 	tristate "Yealink usb-p1k voip phone"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to enable keyboard and LCD functions of the
 	  Yealink usb-p1k usb phones. The audio part is enabled by the generic
@@ -438,8 +434,7 @@ config INPUT_YEALINK
 
 config INPUT_CM109
 	tristate "C-Media CM109 USB I/O Controller"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to enable keyboard and buzzer functions of the
 	  C-Media CM109 usb phones. The audio part is enabled by the generic
diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 63c9cda555c3..ce6c0ccafacc 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -215,8 +215,7 @@ config MOUSE_SERIAL
 
 config MOUSE_APPLETOUCH
 	tristate "Apple USB Touchpad support"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use an Apple USB Touchpad.
 
@@ -236,8 +235,7 @@ config MOUSE_APPLETOUCH
 
 config MOUSE_BCM5974
 	tristate "Apple USB BCM5974 Multitouch trackpad support"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you have an Apple USB BCM5974 Multitouch
 	  trackpad.
@@ -430,8 +428,7 @@ config MOUSE_SYNAPTICS_I2C
 
 config MOUSE_SYNAPTICS_USB
 	tristate "Synaptics USB device support"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use a Synaptics USB touchpad or pointing
 	  stick.
diff --git a/drivers/input/tablet/Kconfig b/drivers/input/tablet/Kconfig
index ec27eff6ae37..e7b98d179a6b 100644
--- a/drivers/input/tablet/Kconfig
+++ b/drivers/input/tablet/Kconfig
@@ -14,8 +14,7 @@ if INPUT_TABLET
 
 config TABLET_USB_ACECAD
 	tristate "Acecad Flair tablet support (USB)"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use the USB version of the Acecad Flair
 	  tablet.  Make sure to say Y to "Mouse support"
@@ -27,8 +26,7 @@ config TABLET_USB_ACECAD
 
 config TABLET_USB_AIPTEK
 	tristate "Aiptek 6000U/8000U and Genius G_PEN tablet support (USB)"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use the USB version of the Aiptek 6000U,
 	  Aiptek 8000U or Genius G-PEN 560 tablet.  Make sure to say Y to
@@ -40,8 +38,7 @@ config TABLET_USB_AIPTEK
 
 config TABLET_USB_HANWANG
 	tristate "Hanwang Art Master III tablet support (USB)"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use the USB version of the Hanwang Art
 	  Master III tablet.
@@ -51,8 +48,7 @@ config TABLET_USB_HANWANG
 
 config TABLET_USB_KBTAB
 	tristate "KB Gear JamStudio tablet support (USB)"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use the USB version of the KB Gear
 	  JamStudio tablet.  Make sure to say Y to "Mouse support"
@@ -64,8 +60,7 @@ config TABLET_USB_KBTAB
 
 config TABLET_USB_PEGASUS
 	tristate "Pegasus Mobile Notetaker Pen input tablet support"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  Say Y here if you want to use the Pegasus Mobile Notetaker,
 	  also known as:
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 0181f3cd99bc..69656200a2f0 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -917,8 +917,7 @@ config TOUCHSCREEN_WM97XX_ZYLONITE
 
 config TOUCHSCREEN_USB_COMPOSITE
 	tristate "USB Touchscreen Driver"
-	depends on USB_ARCH_HAS_HCD
-	select USB
+	depends on USB
 	help
 	  USB Touchscreen driver for:
 	  - eGalax Touchkit USB (also includes eTurboTouch CT-410/510/700)
-- 
2.29.2

