Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882512338A6
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 21:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbgG3TGX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 15:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730416AbgG3TGU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 15:06:20 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCF6C061574;
        Thu, 30 Jul 2020 12:06:19 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f7so25914172wrw.1;
        Thu, 30 Jul 2020 12:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WbjIqzRhQpaXMVHaXOH92166wi2B9wb2R5PM7TLAibo=;
        b=RSkemZIBlgHfLegCwizvrt4jA68R30GhpJmDgk+YVov7WQjG5oy/iVvQWMYQ6dbXIq
         mqpi4AoqYDn0/18AAgm5c86D4ILveHUM4lOlMyK+Jur7Nj7rk1PUSvn5Zm0mjakWRWz6
         110swfB87HmEt7CbqkNG3TVUkI9SqhAN7QCm/E5MBP1APOA571OKBhJYzp290Ror8X1u
         qtIUC7qDE+7CIP5ncbTm8BshCavMjXm7Fcc5dlEXQa9OpURw8TUFyPl6F/svml2ZKY48
         4fbhSTC8xHLZ2wkDkURJf/YvC7mc8fJH2DOQNU0rhmkcyXKKVmmPN/85MEuszoU2dpRJ
         ubsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=WbjIqzRhQpaXMVHaXOH92166wi2B9wb2R5PM7TLAibo=;
        b=anptpP23xjOmjTvLHlTuNxG3IOsfV7wqI6QuZkcHXkLcWfMt+NIUPXu2caZeXXsE7J
         W0EGaOgA0blNUsBxV7Mu6VnLJiug3fD/ndPkNBGc7wnde3dfQaRdl+tI7RBRQ1WqyMde
         zLzVxHCe4dBQljvzEu20cv3Krxv0YxpCiCUbltB/8/6dtHrhhY6jSprXrJp8WwEFPj3x
         ainMVzTA9hqY5QX8skBT4bHHTLI5EDD56E08yaTAP+yHfTmH5IB2W7QaX60zE/tNvl1u
         xE8kuehde5KVqOS2HmioyxcJgcpoTznR2hlJXkBprQqUGwgozdlGoVlQFZFG1RRONx3Z
         e2NA==
X-Gm-Message-State: AOAM532Rv3+aGfECKTCt9x5wFJNWaIZjjAM7M4/k6/CLuk34MxKfJdTV
        Dp8GmvNoQdWoJzTs6g9Gtuqziayt5QY=
X-Google-Smtp-Source: ABdhPJzkeasT+WcgzXAvXmMt0cZmTSzplqF17NPlSPfshckyP9oSeopyy563YEi8LOswEvfQ0hMQrg==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr144140wrt.315.1596135977129;
        Thu, 30 Jul 2020 12:06:17 -0700 (PDT)
Received: from 168.52.45.77 (201.ip-51-68-45.eu. [51.68.45.201])
        by smtp.gmail.com with ESMTPSA id c10sm9645105wro.84.2020.07.30.12.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 12:06:14 -0700 (PDT)
From:   Ismael Ferreras Morezuelas <swyterzone@gmail.com>
Subject: [PATCH] Input: xpad: Spelling fixes for "Xbox", improve and proofread
 the listed xpad device names
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Message-ID: <e864b39b-27e0-c6f2-76e8-db465916f310@gmail.com>
Date:   Thu, 30 Jul 2020 21:06:12 +0200
User-Agent: nano 6.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Linux kernel is notorious for misspelling X-Box, X-box, XBox or XBOX;
the official spelling is actually just Xbox. Plain and simple.

After doing that I took the opportunity to review a bit the actual
xpad gamepad name list to make it more factual and accurate.

Seems like a worthy enhancement. This commit covers:

 * Plain typos. (e.g. Mad Cats -> Mad Catz, SoulCaliber -> Soulcalibur)
 * Wrong or missing parts. (e.g. PS2 -> PS/2, v2 -> S)
 * Missing manufacturer. (i.e. only the marketing name)
 * Appending of Xbox / Xbox 360 / Xbox One when needed.
 * Normalization, use a common case scheme.

Tried to respect the existing notes and regional classification.

I mainly sourced the model names from the official driver packages;
cross-checking against retailers, official websites and other resources.

The side effect is that this master list is reused in many other places,
like Steam and SDL2 itself, so it's important to get them right:

https://support.steampowered.com/kb_article.php?ref=5199-TOKV-4426

While doing my research I also noticed that the 1532:0037 VID/PID seems to
be used by the DeathAdder 2013, so that Razer Sabertooth instance looks
wrong and very suspect to me, I created a separate patch for that.

No functional changes intended.

Signed-off-by: Ismael Ferreras Morezuelas <swyterzone@gmail.com>
---
 Documentation/input/gamepad.rst |   2 +-
 drivers/input/joystick/Kconfig  |  14 +-
 drivers/input/joystick/xpad.c   | 306 ++++++++++++++++----------------
 3 files changed, 161 insertions(+), 161 deletions(-)

diff --git a/Documentation/input/gamepad.rst b/Documentation/input/gamepad.rst
index 4d5e7fb80a84..968e07056552 100644
--- a/Documentation/input/gamepad.rst
+++ b/Documentation/input/gamepad.rst
@@ -184,7 +184,7 @@ Gamepads report the following events:
 
   Many pads also have a third button which is branded or has a special symbol
   and meaning. Such buttons are mapped as BTN_MODE. Examples are the Nintendo
-  "HOME" button, the XBox "X"-button or Sony "PS" button.
+  "HOME" button, the Xbox "X" button or the Sony PlayStation "PS" button.
 
 - Rumble:
 
diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index eb031b7a4866..45d220fd583c 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -280,33 +280,33 @@ config JOYSTICK_JOYDUMP
 	  module will be called joydump.
 
 config JOYSTICK_XPAD
-	tristate "X-Box gamepad support"
+	tristate "Xbox gamepad support"
 	depends on USB_ARCH_HAS_HCD
 	select USB
 	help
-	  Say Y here if you want to use the X-Box pad with your computer.
+	  Say Y here if you want to use Xbox pads with your computer.
 	  Make sure to say Y to "Joystick support" (CONFIG_INPUT_JOYDEV)
 	  and/or "Event interface support" (CONFIG_INPUT_EVDEV) as well.
 
-	  For information about how to connect the X-Box pad to USB, see
+	  For information about how to connect the Xbox pad to USB, see
 	  <file:Documentation/input/devices/xpad.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called xpad.
 
 config JOYSTICK_XPAD_FF
-	bool "X-Box gamepad rumble support"
+	bool "Xbox gamepad rumble support"
 	depends on JOYSTICK_XPAD && INPUT
 	select INPUT_FF_MEMLESS
 	help
-	  Say Y here if you want to take advantage of xbox 360 rumble features.
+	  Say Y here if you want to take advantage of Xbox 360 rumble features.
 
 config JOYSTICK_XPAD_LEDS
-	bool "LED Support for Xbox360 controller 'BigX' LED"
+	bool "LED Support for the Xbox 360 controller Guide button"
 	depends on JOYSTICK_XPAD && (LEDS_CLASS=y || LEDS_CLASS=JOYSTICK_XPAD)
 	help
 	  This option enables support for the LED which surrounds the Big X on
-	  XBox 360 controller.
+	  Xbox 360 controllers.
 
 config JOYSTICK_WALKERA0701
 	tristate "Walkera WK-0701 RC transmitter"
diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c77cdb3b62b5..814ca8d7978f 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * X-Box gamepad driver
+ * Xbox gamepad driver
  *
  * Copyright (c) 2002 Marko Friedemann <mfr@bmx-chemnitz.de>
  *               2004 Oliver Schwartz <Oliver.Schwartz@gmx.de>,
@@ -23,7 +23,7 @@
  *  - ITO Takayuki for providing essential xpad information on his website
  *  - Vojtech Pavlik     - iforce driver / input subsystem
  *  - Greg Kroah-Hartman - usb-skeleton driver
- *  - XBOX Linux project - extra USB id's
+ *  - Xbox Linux project - extra USB ids
  *  - Pekka Pöyry (quantus) - Xbox One controller reverse engineering
  *
  * TODO:
@@ -52,7 +52,7 @@
  * 2002-07-17 - 0.0.5 : simplified d-pad handling
  *
  * 2004-10-02 - 0.0.6 : DDR pad support
- *  - borrowed from the XBOX linux kernel
+ *  - borrowed from the Xbox Linux kernel
  *  - USB id's for commonly used dance pads are present
  *  - dance pads will map D-PAD to buttons, not axes
  *  - pass the module paramater 'dpad_to_buttons' to force
@@ -111,40 +111,40 @@ static const struct xpad_device {
 	u8 mapping;
 	u8 xtype;
 } xpad_device[] = {
-	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
-	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
-	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
-	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
+	{ 0x0079, 0x18d4, "GPD Win 2 Xbox Controller", 0, XTYPE_XBOX360 },
+	{ 0x044f, 0x0f00, "Thrustmaster Steering Wheel for Xbox", 0, XTYPE_XBOX },
+	{ 0x044f, 0x0f03, "Thrustmaster Steering Wheel for Xbox", 0, XTYPE_XBOX },
+	{ 0x044f, 0x0f07, "Thrustmaster Controller for Xbox", 0, XTYPE_XBOX },
 	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
 	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
-	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
-	{ 0x045e, 0x0285, "Microsoft X-Box pad (Japan)", 0, XTYPE_XBOX },
+	{ 0x045e, 0x0202, "Microsoft Xbox Controller (US)", 0, XTYPE_XBOX },
+	{ 0x045e, 0x0285, "Microsoft Xbox Controller S (Japan)", 0, XTYPE_XBOX },
 	{ 0x045e, 0x0287, "Microsoft Xbox Controller S", 0, XTYPE_XBOX },
-	{ 0x045e, 0x0288, "Microsoft Xbox Controller S v2", 0, XTYPE_XBOX },
-	{ 0x045e, 0x0289, "Microsoft X-Box pad v2 (US)", 0, XTYPE_XBOX },
-	{ 0x045e, 0x028e, "Microsoft X-Box 360 pad", 0, XTYPE_XBOX360 },
-	{ 0x045e, 0x028f, "Microsoft X-Box 360 pad v2", 0, XTYPE_XBOX360 },
-	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
-	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
-	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
-	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
-	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
-	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x0288, "Microsoft Xbox Controller S Hub", 0, XTYPE_XBOX },
+	{ 0x045e, 0x0289, "Microsoft Xbox Controller S (US)", 0, XTYPE_XBOX },
+	{ 0x045e, 0x028e, "Microsoft Xbox 360 Controller", 0, XTYPE_XBOX360 },
+	{ 0x045e, 0x028f, "Microsoft Xbox 360 Wireless Controller", 0, XTYPE_XBOX360 },
+	{ 0x045e, 0x0291, "Microsoft Xbox 360 Wireless Receiver for Windows", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x02d1, "Microsoft Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x045e, 0x02dd, "Microsoft Xbox One Controller (Firmware 2015)", 0, XTYPE_XBOXONE },
+	{ 0x045e, 0x02e3, "Microsoft Xbox One Elite Controller", 0, XTYPE_XBOXONE },
+	{ 0x045e, 0x02ea, "Microsoft Xbox One S Controller", 0, XTYPE_XBOXONE },
+	{ 0x045e, 0x0719, "Microsoft Xbox 360 Wireless Adapter", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
-	{ 0x046d, 0xc242, "Logitech Chillstream Controller", 0, XTYPE_XBOX360 },
+	{ 0x046d, 0xc242, "Logitech ChillStream Controller", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xca84, "Logitech Xbox Cordless Controller", 0, XTYPE_XBOX },
 	{ 0x046d, 0xca88, "Logitech Compact Controller for Xbox", 0, XTYPE_XBOX },
 	{ 0x046d, 0xca8a, "Logitech Precision Vibration Feedback Wheel", 0, XTYPE_XBOX },
-	{ 0x046d, 0xcaa3, "Logitech DriveFx Racing Wheel", 0, XTYPE_XBOX360 },
-	{ 0x056e, 0x2004, "Elecom JC-U3613M", 0, XTYPE_XBOX360 },
+	{ 0x046d, 0xcaa3, "Logitech Xbox 360 DriveFX Axial Feedback Wheel", 0, XTYPE_XBOX360 },
+	{ 0x056e, 0x2004, "Elecom JC-U3613M Series", 0, XTYPE_XBOX360 },
 	{ 0x05fd, 0x1007, "Mad Catz Controller (unverified)", 0, XTYPE_XBOX },
-	{ 0x05fd, 0x107a, "InterAct 'PowerPad Pro' X-Box pad (Germany)", 0, XTYPE_XBOX },
+	{ 0x05fd, 0x107a, "InterAct PowerPad Pro for Xbox (Germany)", 0, XTYPE_XBOX },
 	{ 0x05fe, 0x3030, "Chic Controller", 0, XTYPE_XBOX },
 	{ 0x05fe, 0x3031, "Chic Controller", 0, XTYPE_XBOX },
 	{ 0x062a, 0x0020, "Logic3 Xbox GamePad", 0, XTYPE_XBOX },
-	{ 0x062a, 0x0033, "Competition Pro Steering Wheel", 0, XTYPE_XBOX },
+	{ 0x062a, 0x0033, "Competition Pro Racer Steering Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0201, "Saitek Adrenalin", 0, XTYPE_XBOX },
 	{ 0x06a3, 0xf51a, "Saitek P3600", 0, XTYPE_XBOX360 },
@@ -157,170 +157,170 @@ static const struct xpad_device {
 	{ 0x0738, 0x4536, "Mad Catz MicroCON", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4540, "Mad Catz Beat Pad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x0738, 0x4556, "Mad Catz Lynx Wireless Controller", 0, XTYPE_XBOX },
-	{ 0x0738, 0x4586, "Mad Catz MicroCon Wireless Controller", 0, XTYPE_XBOX },
+	{ 0x0738, 0x4586, "Mad Catz MicroCON Wireless Controller", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4588, "Mad Catz Blaster", 0, XTYPE_XBOX },
 	{ 0x0738, 0x45ff, "Mad Catz Beat Pad (w/ Handle)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x0738, 0x4716, "Mad Catz Wired Xbox 360 Controller", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0x4718, "Mad Catz Street Fighter IV FightStick SE", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0x4726, "Mad Catz Xbox 360 Controller", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0x4728, "Mad Catz Street Fighter IV FightPad", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0738, 0x4736, "Mad Catz MicroCon Gamepad", 0, XTYPE_XBOX360 },
-	{ 0x0738, 0x4738, "Mad Catz Wired Xbox 360 Controller (SFIV)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0738, 0x4736, "Mad Catz MicroCON for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x0738, 0x4738, "Mad Catz Street Fighter IV Wired Controller for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x0738, 0x4740, "Mad Catz Beat Pad", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0x4743, "Mad Catz Beat Pad Pro", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x0738, 0x4758, "Mad Catz Arcade Game Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0738, 0x4a01, "Mad Catz FightStick TE 2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0738, 0x4a01, "Mad Catz FightStick TE 2 for Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0738, 0x6040, "Mad Catz Beat Pad Pro", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
-	{ 0x0738, 0x9871, "Mad Catz Portable Drum", 0, XTYPE_XBOX360 },
-	{ 0x0738, 0xb726, "Mad Catz Xbox controller - MW2", 0, XTYPE_XBOX360 },
-	{ 0x0738, 0xb738, "Mad Catz MVC2TE Stick 2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0738, 0xbeef, "Mad Catz JOYTECH NEO SE Advanced GamePad", XTYPE_XBOX360 },
+	{ 0x0738, 0x9871, "Mad Catz Portable Drum Kit", 0, XTYPE_XBOX360 },
+	{ 0x0738, 0xb726, "Mad Catz Modern Warfare 2 Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x0738, 0xb738, "Mad Catz Marvel VS Capcom 2 TE FightStick for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0738, 0xbeef, "Joytech Neo Se Advanced Controller", XTYPE_XBOX360 },
 	{ 0x0738, 0xcb02, "Saitek Cyborg Rumble Pad - PC/Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xcb03, "Saitek P3200 Rumble Pad - PC/Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0738, 0xcb29, "Saitek Aviator Stick AV8R02", 0, XTYPE_XBOX360 },
-	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
-	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
-	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
+	{ 0x0738, 0xf738, "Mad Catz Super Street Fighter IV TE S FightStick", 0, XTYPE_XBOX360 },
+	{ 0x07ff, 0xffff, "Mad Catz Gamepad", 0, XTYPE_XBOX360 },
+	{ 0x0c12, 0x0005, "Intec Wireless Controller for Xbox", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
-	{ 0x0c12, 0x8809, "RedOctane Xbox Dance Pad", DANCEPAD_MAP_CONFIG, XTYPE_XBOX },
-	{ 0x0c12, 0x880a, "Pelican Eclipse PL-2023", 0, XTYPE_XBOX },
+	{ 0x0c12, 0x8809, "RedOctane Ignition DDR Xbox Dance Pad", DANCEPAD_MAP_CONFIG, XTYPE_XBOX },
+	{ 0x0c12, 0x880a, "Pelican Eclipse (PL-2023)", 0, XTYPE_XBOX },
 	{ 0x0c12, 0x8810, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
-	{ 0x0c12, 0x9902, "HAMA VibraX - *FAULTY HARDWARE*", 0, XTYPE_XBOX },
+	{ 0x0c12, 0x9902, "Hama VibraX - *FAULTY HARDWARE*", 0, XTYPE_XBOX },
 	{ 0x0d2f, 0x0002, "Andamiro Pump It Up pad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x0e4c, 0x1097, "Radica Gamester Controller", 0, XTYPE_XBOX },
 	{ 0x0e4c, 0x1103, "Radica Gamester Reflex", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x0e4c, 0x2390, "Radica Games Jtech Controller", 0, XTYPE_XBOX },
 	{ 0x0e4c, 0x3510, "Radica Gamester", 0, XTYPE_XBOX },
-	{ 0x0e6f, 0x0003, "Logic3 Freebird wireless Controller", 0, XTYPE_XBOX },
-	{ 0x0e6f, 0x0005, "Eclipse wireless Controller", 0, XTYPE_XBOX },
-	{ 0x0e6f, 0x0006, "Edge wireless Controller", 0, XTYPE_XBOX },
-	{ 0x0e6f, 0x0008, "After Glow Pro Controller", 0, XTYPE_XBOX },
-	{ 0x0e6f, 0x0105, "HSM3 Xbox360 dancepad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0113, "Afterglow AX.1 Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x011f, "Rock Candy Gamepad Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x0e6f, 0x0003, "Logic3 Freebird Xbox Wireless Controller", 0, XTYPE_XBOX },
+	{ 0x0e6f, 0x0005, "Pelican Eclipse Wireless Controller", 0, XTYPE_XBOX },
+	{ 0x0e6f, 0x0006, "Pelican Xbox Edge Wireless Controller", 0, XTYPE_XBOX },
+	{ 0x0e6f, 0x0008, "Pelican AfterGlow Pro Controller", 0, XTYPE_XBOX },
+	{ 0x0e6f, 0x0105, "Disney's High School Musical 3 Dance Pad for Xbox 360", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0e6f, 0x0113, "PDP Afterglow AX.1 Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x0e6f, 0x011f, "Rock Candy Wired Controller for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0131, "PDP EA Sports Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0133, "Xbox 360 Wired Controller", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0139, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0139, "PDP Afterglow Prismatic Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x013a, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x015c, "PDP Xbox One Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0164, "PDP Battlefield One", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0165, "PDP Titanfall 2", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x0201, "Pelican PL-3601 'TSZ' Wired Xbox 360 Controller", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0213, "Afterglow Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x0e6f, 0x0147, "PDP Marvel Controller for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x015c, "PDP Arcade Stick for Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0161, "PDP Camo Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0162, "PDP Xbox One Wired Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0163, "PDP Legendary Collection Deliverer of Truth for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0164, "PDP Battlefield 1 Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0165, "PDP Titanfall 2 Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0201, "Pelican TSZ (PL-3601) Wired Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x0e6f, 0x0213, "PDP Afterglow Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x021f, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0246, "Rock Candy Gamepad for Xbox One 2015", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0246, "Rock Candy Gamepad for Xbox One (2015)", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x02ab, "PDP Controller for Xbox One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x02a4, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x02a6, "PDP Wired Controller for Xbox One - Camo Series", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0301, "Logic3 Controller", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0346, "Rock Candy Gamepad for Xbox One 2016", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x0346, "Rock Candy Wired Controller for Xbox One (2016)", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0401, "Logic3 Controller", 0, XTYPE_XBOX360 },
-	{ 0x0e6f, 0x0413, "Afterglow AX.1 Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x0e6f, 0x0413, "PDP Afterglow AX.1 Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0501, "PDP Xbox 360 Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0xf900, "PDP Afterglow AX.1", 0, XTYPE_XBOX360 },
-	{ 0x0e8f, 0x0201, "SmartJoy Frag Xpad/PS2 adaptor", 0, XTYPE_XBOX },
-	{ 0x0e8f, 0x3008, "Generic xbox control (dealextreme)", 0, XTYPE_XBOX },
-	{ 0x0f0d, 0x000a, "Hori Co. DOA4 FightStick", 0, XTYPE_XBOX360 },
-	{ 0x0f0d, 0x000c, "Hori PadEX Turbo", 0, XTYPE_XBOX360 },
-	{ 0x0f0d, 0x000d, "Hori Fighting Stick EX2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0f0d, 0x0016, "Hori Real Arcade Pro.EX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0f0d, 0x001b, "Hori Real Arcade Pro VX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x0f0d, 0x0063, "Hori Real Arcade Pro Hayabusa (USA) Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
-	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
-	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0e8f, 0x0201, "SmartJoy Frag PS/2 Mouse and Keyboard Converter for Xbox", 0, XTYPE_XBOX },
+	{ 0x0e8f, 0x3008, "Generic Xbox controller (DealExtreme)", 0, XTYPE_XBOX },
+	{ 0x0f0d, 0x000a, "Hori Dead or Alive 4 FightStick for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x000c, "Horipad EX Turbo for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x000d, "Hori Fighting Stick EX2 for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x0016, "Hori Real Arcade Pro.EX for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x001b, "Hori Real Arcade Pro.VX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x0063, "Hori Real Arcade Pro Hayabusa for Xbox One (USA)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x0067, "Horipad One", 0, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai for Xbox One/360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
-	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
+	{ 0x0f30, 0x8888, "Bigben Interactive XBMiniPad Controller", 0, XTYPE_XBOX },
 	{ 0x102c, 0xff0c, "Joytech Wireless Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
-	{ 0x12ab, 0x0004, "Honey Bee Xbox360 dancepad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x12ab, 0x0301, "PDP AFTERGLOW AX.1", 0, XTYPE_XBOX360 },
-	{ 0x12ab, 0x0303, "Mortal Kombat Klassic FightStick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x12ab, 0x8809, "Xbox DDR dancepad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
-	{ 0x1430, 0x4748, "RedOctane Guitar Hero X-plorer", 0, XTYPE_XBOX360 },
-	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
+	{ 0x12ab, 0x0004, "Honey Bee Dance Pad for Xbox 360", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x12ab, 0x0301, "PDP Afterglow Wired Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x12ab, 0x0303, "PDP Mortal Kombat Klassic FightStick for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x12ab, 0x8809, "Xbox DDR Dance Pad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
+	{ 0x1430, 0x4748, "RedOctane Guitar Hero X-Plorer", 0, XTYPE_XBOX360 },
+	{ 0x1430, 0x8888, "MayFlash TX-6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
-	{ 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
+	{ 0x146b, 0x0601, "Bigben Interactive Xbox 360 Controller", 0, XTYPE_XBOX360 },
 	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
-	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick for Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
-	{ 0x15e4, 0x3f00, "Power A Mini Pro Elite", 0, XTYPE_XBOX360 },
-	{ 0x15e4, 0x3f0a, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
-	{ 0x15e4, 0x3f10, "Batarang Xbox 360 controller", 0, XTYPE_XBOX360 },
-	{ 0x162e, 0xbeef, "Joytech Neo-Se Take2", 0, XTYPE_XBOX360 },
+	{ 0x15e4, 0x3f00, "PowerA Mini Pro Elite", 0, XTYPE_XBOX360 },
+	{ 0x15e4, 0x3f0a, "PowerA Airflo Wired Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x15e4, 0x3f10, "PowerA Batarang Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x162e, 0xbeef, "Joytech Neo Se (Take-Two)", 0, XTYPE_XBOX360 },
 	{ 0x1689, 0xfd00, "Razer Onza Tournament Edition", 0, XTYPE_XBOX360 },
 	{ 0x1689, 0xfd01, "Razer Onza Classic Edition", 0, XTYPE_XBOX360 },
-	{ 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },
+	{ 0x1689, 0xfe00, "Razer Sabertooth Gaming Controller (Xbox 360)", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0002, "Harmonix Rock Band Guitar", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0x0003, "Harmonix Rock Band Drumkit", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0x0130, "Ion Drum Rocker", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0x0003, "Harmonix Rock Band Drum Kit", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0x0130, "ION Drum Rocker Electronic Drum Kit", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1bad, 0xf016, "Mad Catz Xbox 360 Controller", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xf018, "Mad Catz Street Fighter IV SE Fighting Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1bad, 0xf019, "Mad Catz Brawlstick for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf021, "Mad Cats Ghost Recon FS GamePad", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf023, "MLG Pro Circuit Controller (Xbox)", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf025, "Mad Catz Call Of Duty", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf027, "Mad Catz FPS Pro", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf028, "Street Fighter IV FightPad", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf02e, "Mad Catz Fightpad", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf030, "Mad Catz Xbox 360 MC2 MicroCon Racing Wheel", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf036, "Mad Catz MicroCon GamePad Pro", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf038, "Street Fighter IV FightStick TE", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf039, "Mad Catz MvC2 TE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf03a, "Mad Catz SFxT Fightstick Pro", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf03d, "Street Fighter IV Arcade Stick TE - Chun Li", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf021, "Mad Catz Ghost Recon Future Soldier Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf023, "Mad Catz MLG Pro Circuit Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf025, "Mad Catz Call of Duty Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf027, "Mad Catz FPS Pro Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf028, "Mad Catz Street Fighter IV FightPad for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf02e, "Mad Catz FightPad", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf030, "Mad Catz MC2 MicroCON Racing Wheel for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf036, "Mad Catz MicroCON Gamepad Pro for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf038, "Mad Catz Street Fighter IV FightStick TE for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf039, "Mad Catz Marvel VS Capcom 2 Tournament Stick for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf03a, "Mad Catz Street Fighter X Tekken FightStick Pro for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf03d, "Mad Catz Street Fighter IV Arcade Stick TE for Xbox 360 - Chun Li", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1bad, 0xf03e, "Mad Catz MLG FightStick TE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf03f, "Mad Catz FightStick SoulCaliber", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf042, "Mad Catz FightStick TES+", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf080, "Mad Catz FightStick TE2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf501, "HoriPad EX2 Turbo", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf502, "Hori Real Arcade Pro.VX SA", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf503, "Hori Fighting Stick VX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf504, "Hori Real Arcade Pro. EX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf505, "Hori Fighting Stick EX2B", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf506, "Hori Real Arcade Pro.EX Premium VLX", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf03f, "Mad Catz Soulcalibur FightStick for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf042, "Mad Catz Arcade FightStick TE S+ for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf080, "Mad Catz FightStick TE2 for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf501, "Horipad EX2 Turbo for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf502, "Hori Real Arcade Pro.VX SA for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf503, "Hori Fighting Stick VX for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf504, "Hori Real Arcade Pro.EX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf505, "Hori Fighting Stick EX2B for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf506, "Hori Real Arcade Pro.EX Premium VLX for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xf900, "Harmonix Xbox 360 Controller", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf901, "Gamestop Xbox 360 Controller", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf903, "Tron Xbox 360 controller", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xf904, "PDP Versus Fighting Pad", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf901, "GameStop Xbox 360 Controller", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf903, "PDP TRON Wired Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xf904, "PDP Versus Fighting Pad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xf906, "MortalKombat FightStick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x1bad, 0xfa01, "MadCatz GamePad", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xfd00, "Razer Onza TE", 0, XTYPE_XBOX360 },
-	{ 0x1bad, 0xfd01, "Razer Onza", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xfa01, "Mad Catz Gamepad", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xfd00, "Razer Onza Tournament Edition", 0, XTYPE_XBOX360 },
+	{ 0x1bad, 0xfd01, "Razer Onza Classic Edition", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5303, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x530a, "Xbox 360 Pro EX Controller", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x531a, "PowerA Pro Ex", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5397, "FUS1ON Tournament Controller", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5300, "PowerA Mini Pro EX Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5303, "PowerA Airflo Wired Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x530a, "PowerA Pro EX Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x531a, "PowerA Mini Pro EX Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5397, "PowerA FUS1ON Tournament Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x541a, "PowerA Xbox One Mini Wired Controller", 0, XTYPE_XBOXONE },
-	{ 0x24c6, 0x542a, "Xbox ONE spectra", 0, XTYPE_XBOXONE },
-	{ 0x24c6, 0x543a, "PowerA Xbox One wired controller", 0, XTYPE_XBOXONE },
-	{ 0x24c6, 0x5500, "Hori XBOX 360 EX 2 with Turbo", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5501, "Hori Real Arcade Pro VX-SA", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5502, "Hori Fighting Stick VX Alt", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5503, "Hori Fighting Edge", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5506, "Hori SOULCALIBUR V Stick", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x550d, "Hori GEM Xbox controller", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x550e, "Hori Real Arcade Pro V Kai 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x24c6, 0x542a, "PowerA Spectra Controller", 0, XTYPE_XBOXONE },
+	{ 0x24c6, 0x543a, "PowerA Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x24c6, 0x5500, "Hori Horipad EX2 Turbo for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5501, "Hori Real Arcade Pro.VX-SA for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5502, "Hori Fighting Stick VX Alt for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5503, "Hori Fighting Edge for Xbox 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5506, "Hori Soulcalibur V Stick for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x550d, "Hori Gem Controller for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x550e, "Hori Real Arcade Pro V Kai for Xbox One/360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
-	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5b00, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5b02, "Thrustmaster GPX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
-	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5d04, "Razer Sabertooth Elite", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
-	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x3767, 0x0101, "Fanatec Speedster 3 ForceShock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
-	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
+	{ 0x0000, 0x0000, "Generic Xbox pad", 0, XTYPE_UNKNOWN }
 };
 
 /* buttons shared with xbox and xbox360 */
@@ -400,35 +400,35 @@ static const signed short xpad_abs_triggers[] = {
 	{ XPAD_XBOXONE_VENDOR_PROTOCOL((vend), 208) }
 
 static const struct usb_device_id xpad_table[] = {
-	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* X-Box USB-IF not approved class */
-	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 Controller */
-	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster X-Box 360 controllers */
-	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft X-Box 360 controllers */
-	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft X-Box One controllers */
-	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech X-Box 360 style controllers */
+	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* Xbox USB-IF not-approved class */
+	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 controller */
+	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster Xbox 360 controllers */
+	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft Xbox 360 controllers */
+	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft Xbox One controllers */
+	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech Xbox 360-style controllers */
 	XPAD_XBOX360_VENDOR(0x056e),		/* Elecom JC-U3613M */
 	XPAD_XBOX360_VENDOR(0x06a3),		/* Saitek P3600 */
-	XPAD_XBOX360_VENDOR(0x0738),		/* Mad Catz X-Box 360 controllers */
+	XPAD_XBOX360_VENDOR(0x0738),		/* Mad Catz Xbox 360 controllers */
 	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
 	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
-	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz GamePad */
-	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f X-Box 360 controllers */
-	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f X-Box One controllers */
-	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori Controllers */
-	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori Controllers */
-	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries Controllers */
+	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz Gamepad */
+	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f Xbox 360 controllers */
+	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f Xbox One controllers */
+	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori controllers */
+	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori controllers */
+	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries controllers */
 	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
-	XPAD_XBOX360_VENDOR(0x12ab),		/* X-Box 360 dance pads */
-	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane X-Box 360 controllers */
-	XPAD_XBOX360_VENDOR(0x146b),		/* BigBen Interactive Controllers */
+	XPAD_XBOX360_VENDOR(0x12ab),		/* Xbox 360 dance pads */
+	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane Xbox 360 controllers */
+	XPAD_XBOX360_VENDOR(0x146b),		/* Bigben Interactive controllers */
 	XPAD_XBOX360_VENDOR(0x1532),		/* Razer Sabertooth */
 	XPAD_XBOXONE_VENDOR(0x1532),		/* Razer Wildcat */
-	XPAD_XBOX360_VENDOR(0x15e4),		/* Numark X-Box 360 controllers */
-	XPAD_XBOX360_VENDOR(0x162e),		/* Joytech X-Box 360 controllers */
+	XPAD_XBOX360_VENDOR(0x15e4),		/* Numark Xbox 360 controllers */
+	XPAD_XBOX360_VENDOR(0x162e),		/* Joytech Xbox 360 controllers */
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
-	XPAD_XBOX360_VENDOR(0x1bad),		/* Harminix Rock Band Guitar and Drums */
-	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA Controllers */
-	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
+	XPAD_XBOX360_VENDOR(0x1bad),		/* Harmonix Rock Band guitar and drums */
+	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA controllers */
+	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA controllers */
 	{ }
 };
 
@@ -1338,7 +1338,7 @@ struct xpad_led {
 };
 
 /**
- * set the LEDs on Xbox360 / Wireless Controllers
+ * set the LEDs on Xbox 360 / Wireless Controllers
  * @param command
  *  0: off
  *  1: all blink, then previous setting
@@ -1951,5 +1951,5 @@ static struct usb_driver xpad_driver = {
 module_usb_driver(xpad_driver);
 
 MODULE_AUTHOR("Marko Friedemann <mfr@bmx-chemnitz.de>");
-MODULE_DESCRIPTION("X-Box pad driver");
+MODULE_DESCRIPTION("Xbox pad driver");
 MODULE_LICENSE("GPL");
-- 
2.22.0

