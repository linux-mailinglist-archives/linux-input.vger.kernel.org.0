Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1373B103C34
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2019 14:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbfKTNll (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Nov 2019 08:41:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:49404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731294AbfKTNlj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Nov 2019 08:41:39 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2EFC224D0;
        Wed, 20 Nov 2019 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574257298;
        bh=mOj45OaozVe/LtrAENNU3YtSrzSiOXSNB9wdpAiPUJY=;
        h=From:To:Cc:Subject:Date:From;
        b=uE/JOpg2mfTOXY6HUpS4k1uCujIFxnjNVYVVFAlA/SFubEjJu30rx/DsIKQH+CjcQ
         uQR3I/SoBdlWXCSZKx5zKVXaU0aSrmeDBnrjwvUKADhFEYi5E3aLX3ohSEKjApLaXk
         qVRmOP9mU5qHr40G6rvq/gB4Nu9pjRhACkbb280Q=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] input: Fix Kconfig indentation
Date:   Wed, 20 Nov 2019 21:41:34 +0800
Message-Id: <20191120134134.15183-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/input/keyboard/Kconfig    |  8 ++++----
 drivers/input/mouse/Kconfig       |  6 +++---
 drivers/input/tablet/Kconfig      | 20 ++++++++++----------
 drivers/input/touchscreen/Kconfig |  2 +-
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 1ddfc2413035..59c811ab6e0d 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -170,11 +170,11 @@ config KEYBOARD_QT1070
        tristate "Atmel AT42QT1070 Touch Sensor Chip"
        depends on I2C
        help
-         Say Y here if you want to use Atmel AT42QT1070 QTouch
-         Sensor chip as input device.
+	 Say Y here if you want to use Atmel AT42QT1070 QTouch
+	 Sensor chip as input device.
 
-         To compile this driver as a module, choose M here:
-         the module will be called qt1070
+	 To compile this driver as a module, choose M here:
+	 the module will be called qt1070
 
 config KEYBOARD_QT2160
 	tristate "Atmel AT42QT2160 Touch Sensor Chip"
diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index bf738d3b7fe4..22730cffa0b5 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -96,10 +96,10 @@ config MOUSE_PS2_CYPRESS
        default y
        depends on MOUSE_PS2
        help
-         Say Y here if you have a Cypress PS/2 Trackpad connected to
-         your system.
+	 Say Y here if you have a Cypress PS/2 Trackpad connected to
+	 your system.
 
-         If unsure, say Y.
+	 If unsure, say Y.
 
 config MOUSE_PS2_LIFEBOOK
 	bool "Fujitsu Lifebook PS/2 mouse protocol extension" if EXPERT
diff --git a/drivers/input/tablet/Kconfig b/drivers/input/tablet/Kconfig
index e4c0d9a055b9..51c339182017 100644
--- a/drivers/input/tablet/Kconfig
+++ b/drivers/input/tablet/Kconfig
@@ -39,16 +39,16 @@ config TABLET_USB_AIPTEK
 	  module will be called aiptek.
 
 config TABLET_USB_GTCO
-        tristate "GTCO CalComp/InterWrite USB Support"
-        depends on USB && INPUT
-        help
-          Say Y here if you want to use the USB version of the GTCO
-          CalComp/InterWrite Tablet.  Make sure to say Y to "Mouse support"
-          (CONFIG_INPUT_MOUSEDEV) and/or "Event interface support"
-          (CONFIG_INPUT_EVDEV) as well.
-
-          To compile this driver as a module, choose M here: the
-          module will be called gtco.
+	tristate "GTCO CalComp/InterWrite USB Support"
+	depends on USB && INPUT
+	help
+	  Say Y here if you want to use the USB version of the GTCO
+	  CalComp/InterWrite Tablet.  Make sure to say Y to "Mouse support"
+	  (CONFIG_INPUT_MOUSEDEV) and/or "Event interface support"
+	  (CONFIG_INPUT_EVDEV) as well.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gtco.
 
 config TABLET_USB_HANWANG
 	tristate "Hanwang Art Master III tablet support (USB)"
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 40bfc551ce30..c071f7c407b6 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -633,7 +633,7 @@ config TOUCHSCREEN_HP600
 	depends on SH_HP6XX && SH_ADC
 	help
 	  Say Y here if you have a HP Jornada 620/660/680/690 and want to
-          support the built-in touchscreen.
+	  support the built-in touchscreen.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called hp680_ts_input.
-- 
2.17.1

