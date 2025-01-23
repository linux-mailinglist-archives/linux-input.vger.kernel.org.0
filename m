Return-Path: <linux-input+bounces-9489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09E0A1A534
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 14:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 923E63A864E
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 13:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1994F20F070;
	Thu, 23 Jan 2025 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPZeQvwj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8698C07;
	Thu, 23 Jan 2025 13:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737640157; cv=none; b=O1zsfPzQZz8cG78fc6m0Xp4CUbQMJoFkS5P7kA8KCjPlalmTSMSLemPC3JUrv9k6Nsaon8eEBVey6spexNYQ93Pi5d5E5pmGsrmRTa1pB6TYhEjEs70APr1eFR5P9iYDK7E//jDGNGbeXjEm1zZSoG8EIm0WQyEn2Ht6elrLVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737640157; c=relaxed/simple;
	bh=RFOZ2iCvzb/yzx0VqC1skGSN48jGaj2oiNOZblqoflg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iSOely2oS2Cbfzj5DJSClGJ+g5TiqBz6oma7R59liRTkTrJm0noJwiQwnMnpmHTsg200lsbcgoxGKQsbvNUwhd4HRgRBJe9HaHVoNBtdLOeyhit3DyQ5ZbZEYaGYeLQ68jyg39AmD2mhLkFfyZPRYD4OC6UCg/9kMeUbxg2rgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPZeQvwj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC24C4CED3;
	Thu, 23 Jan 2025 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737640156;
	bh=RFOZ2iCvzb/yzx0VqC1skGSN48jGaj2oiNOZblqoflg=;
	h=From:To:Cc:Subject:Date:From;
	b=EPZeQvwj9HgR4BT6b6p9XoayVKiQT6sfDC1fyuC5rsL7Sln1vlyBUj/iIsNmz+IpF
	 UbePMjZpogFdrFew5X6FyfeT4o9TV3hhdVaQUkWGsch4HjFo0YhrFqYXHafD0c5hLy
	 PFMnoJsDk6gykyp7dq4sDRQt+E6aCcKKSZUVSQrZOHfSIYP5Kk+Pqpgx5UHKFMUaPI
	 F7hwy7QXEr4HHz4DGLZIDPB+EWe4bs5+fXpRw0MrAb1ejBNLyd5KEyWr133z8LYmr9
	 HKDNp5MMBFyrYLFlr/a1uWAjVv7Mr3H6elqjqmirpvo13qSHoUZhRD8ywBCYK/x78G
	 vum7eb0Aj7/bA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH] hid: intel-thc: fix CONFIG_HID dependency
Date: Thu, 23 Jan 2025 14:48:12 +0100
Message-Id: <20250123134908.805346-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

In drivers/hid/, most drivers depend on CONFIG_HID, while a couple of the
drivers in subdirectories instead depend on CONFIG_HID_SUPPORT and use
'select HID'. With the newly added INTEL_THC_HID, this causes a build
warning for a circular dependency:

WARNING: unmet direct dependencies detected for HID
  Depends on [m]: HID_SUPPORT [=y] && INPUT [=m]
  Selected by [y]:
  - INTEL_THC_HID [=y] && HID_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y]

WARNING: unmet direct dependencies detected for INPUT_FF_MEMLESS
  Depends on [m]: INPUT [=m]
  Selected by [y]:
  - HID_MICROSOFT [=y] && HID_SUPPORT [=y] && HID [=y]
  - GREENASIA_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_GREENASIA [=y]
  - HID_WIIMOTE [=y] && HID_SUPPORT [=y] && HID [=y] && LEDS_CLASS [=y]
  - ZEROPLUS_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_ZEROPLUS [=y]
  Selected by [m]:
  - HID_ACRUX_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_ACRUX [=m]
  - HID_EMS_FF [=m] && HID_SUPPORT [=y] && HID [=y]
  - HID_GOOGLE_STADIA_FF [=m] && HID_SUPPORT [=y] && HID [=y]
  - PANTHERLORD_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_PANTHERLORD [=m]

It's better to be consistent and always use 'depends on HID' for HID
drivers. The notable exception here is USB_KBD/USB_MOUSE, which are
alternative implementations that do not depend on the HID subsystem.

Do this by extending the "if HID" section below, which means that a few
of the duplicate "depends on HID" and "depends on INPUT" statements
can be removed in the process.

Fixes: 1b2d05384c29 ("HID: intel-thc-hid: Add basic THC driver skeleton")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hid/Kconfig               | 10 ++++++----
 drivers/hid/amd-sfh-hid/Kconfig   |  1 -
 drivers/hid/i2c-hid/Kconfig       |  2 +-
 drivers/hid/intel-ish-hid/Kconfig |  1 -
 drivers/hid/intel-thc-hid/Kconfig |  1 -
 drivers/hid/surface-hid/Kconfig   |  2 --
 drivers/hid/usbhid/Kconfig        |  3 +--
 net/bluetooth/hidp/Kconfig        |  3 +--
 8 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 8adb745c5b28..ed657ef7281c 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1376,10 +1376,6 @@ endmenu
 
 source "drivers/hid/bpf/Kconfig"
 
-endif # HID
-
-source "drivers/hid/usbhid/Kconfig"
-
 source "drivers/hid/i2c-hid/Kconfig"
 
 source "drivers/hid/intel-ish-hid/Kconfig"
@@ -1390,4 +1386,10 @@ source "drivers/hid/surface-hid/Kconfig"
 
 source "drivers/hid/intel-thc-hid/Kconfig"
 
+endif # HID
+
+# USB support may be used with HID disabled
+
+source "drivers/hid/usbhid/Kconfig"
+
 endif # HID_SUPPORT
diff --git a/drivers/hid/amd-sfh-hid/Kconfig b/drivers/hid/amd-sfh-hid/Kconfig
index 329de5e12c1a..3291786a5ee6 100644
--- a/drivers/hid/amd-sfh-hid/Kconfig
+++ b/drivers/hid/amd-sfh-hid/Kconfig
@@ -5,7 +5,6 @@ menu "AMD SFH HID Support"
 
 config AMD_SFH_HID
 	tristate "AMD Sensor Fusion Hub"
-	depends on HID
 	depends on X86
 	help
 	  If you say yes to this option, support will be included for the
diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
index ef7c595c9403..e8d51f410cc1 100644
--- a/drivers/hid/i2c-hid/Kconfig
+++ b/drivers/hid/i2c-hid/Kconfig
@@ -2,7 +2,7 @@
 menuconfig I2C_HID
 	tristate "I2C HID support"
 	default y
-	depends on I2C && INPUT && HID
+	depends on I2C
 
 if I2C_HID
 
diff --git a/drivers/hid/intel-ish-hid/Kconfig b/drivers/hid/intel-ish-hid/Kconfig
index 253dc10d35ef..568c8688784e 100644
--- a/drivers/hid/intel-ish-hid/Kconfig
+++ b/drivers/hid/intel-ish-hid/Kconfig
@@ -6,7 +6,6 @@ config INTEL_ISH_HID
 	tristate "Intel Integrated Sensor Hub"
 	default n
 	depends on X86
-	depends on HID
 	help
 	  The Integrated Sensor Hub (ISH) enables the ability to offload
 	  sensor polling and algorithm processing to a dedicated low power
diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
index 91ec84902db8..0351d1137607 100644
--- a/drivers/hid/intel-thc-hid/Kconfig
+++ b/drivers/hid/intel-thc-hid/Kconfig
@@ -7,7 +7,6 @@ menu "Intel THC HID Support"
 config INTEL_THC_HID
 	tristate "Intel Touch Host Controller"
 	depends on ACPI
-	select HID
 	help
 	  THC (Touch Host Controller) is the name of the IP block in PCH that
 	  interfaces with Touch Devices (ex: touchscreen, touchpad etc.). It
diff --git a/drivers/hid/surface-hid/Kconfig b/drivers/hid/surface-hid/Kconfig
index 7ce9b5d641eb..d0cfd0d29926 100644
--- a/drivers/hid/surface-hid/Kconfig
+++ b/drivers/hid/surface-hid/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 menu "Surface System Aggregator Module HID support"
 	depends on SURFACE_AGGREGATOR
-	depends on INPUT
 
 config SURFACE_HID
 	tristate "HID transport driver for Surface System Aggregator Module"
@@ -39,4 +38,3 @@ endmenu
 
 config SURFACE_HID_CORE
 	tristate
-	select HID
diff --git a/drivers/hid/usbhid/Kconfig b/drivers/hid/usbhid/Kconfig
index 7c2032f7f44d..f3194767a45e 100644
--- a/drivers/hid/usbhid/Kconfig
+++ b/drivers/hid/usbhid/Kconfig
@@ -5,8 +5,7 @@ menu "USB HID support"
 config USB_HID
 	tristate "USB HID transport layer"
 	default y
-	depends on USB && INPUT
-	select HID
+	depends on HID
 	help
 	  Say Y here if you want to connect USB keyboards,
 	  mice, joysticks, graphic tablets, or any other HID based devices
diff --git a/net/bluetooth/hidp/Kconfig b/net/bluetooth/hidp/Kconfig
index 6746be07e222..e08aae35351a 100644
--- a/net/bluetooth/hidp/Kconfig
+++ b/net/bluetooth/hidp/Kconfig
@@ -1,8 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config BT_HIDP
 	tristate "HIDP protocol support"
-	depends on BT_BREDR && INPUT && HID_SUPPORT
-	select HID
+	depends on BT_BREDR && HID
 	help
 	  HIDP (Human Interface Device Protocol) is a transport layer
 	  for HID reports.  HIDP is required for the Bluetooth Human
-- 
2.39.5


