Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EE92FEB60
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 14:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730937AbhAUNRF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 08:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbhAUNQt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 08:16:49 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0325C061757
        for <linux-input@vger.kernel.org>; Thu, 21 Jan 2021 05:16:08 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id s11so2417197edd.5
        for <linux-input@vger.kernel.org>; Thu, 21 Jan 2021 05:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=gLghMQwO+zk30sIUcr2ivrN9CpftHJOkKVQKCs+BVg4=;
        b=psgBlcSa/rWTP5dia0n7kpXP3TVnxM1ZHz9p5rHFN3efCFkN5aVnOW37/ZLY9NNirN
         YIoY/Qkz9eys7j5q72YMX6T7CeWaGGMcFGwi8RWUjkBC7ZWZq7cJ5CC9FSzNc4+1oD2P
         0G+kzrpZp8Yuc7HYv2KK+LT1fDqXXIG22heRhuQaon7Dj9hEqV4LrXBelgdDOdO99pmq
         dvFQ/1RwRYZH/2gQX662QlHWd9AQaJA/yIbPTdHxzx24inQMRxqalmoN1WlRoODjHcCb
         drSqY0MUJWU6TS+Xjpdy6x6XMykp2WHNEWIB3gaKK/8o/vj2bQimFUYDEN2DVxPHxB5S
         a6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=gLghMQwO+zk30sIUcr2ivrN9CpftHJOkKVQKCs+BVg4=;
        b=SsYy1DDEX3tF44JD0rQl4XyWZiHViWe9pARfniemu4OBAgutAe1BPpfWy2UGO2vDkC
         321Bri0ud6vvVlf4qURX4hHhM/HbN2OQDSMIEVMfyI4OQM0gC3toWdcZXvk7dLASUcOE
         VQEyg4urymXi0Q1Wc4O1rT7w5OijnpKX73FGGezjRoFdgeL42IBoyBcSLMRAtpqhlyZK
         FzL6BAna/nd0hO9KaNuh0f+xRzgproHizaiHnEHXulSo+/Lby1vhSkZCpmpvArVzWe0O
         HyiaCqjNNpPCd3Znc7CVPhOia/bY/6G4voRmrOfu/D9pIPm+L4y83AMz1qbS7yg2k4ie
         mUUQ==
X-Gm-Message-State: AOAM533FLbu0486r/zcnjboAUC0HGiKYK+ZtJn23/Z/+uqFpV9uL/D4f
        qTYVi7AAnCd9TJlYMFJGmPo=
X-Google-Smtp-Source: ABdhPJxWAlIyhqMd0yv9uH99gu1/cJS8ZK5XqZ+NI/A9XIjUub6X4Wfu/ZvHKfP8Ob47mZ7Aoio9eQ==
X-Received: by 2002:aa7:c485:: with SMTP id m5mr10946295edq.320.1611234967659;
        Thu, 21 Jan 2021 05:16:07 -0800 (PST)
Received: from rechenknecht2k11 (200116b8459c7b00b738b6f441b295d6.dip.versatel-1u1.de. [2001:16b8:459c:7b00:b738:b6f4:41b2:95d6])
        by smtp.googlemail.com with ESMTPSA id lz27sm2220331ejb.50.2021.01.21.05.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 05:16:07 -0800 (PST)
Date:   Thu, 21 Jan 2021 14:16:02 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] Input: xpad - sync supported devices with fork on GitHub
Message-ID: <20210121141602.7ff62580@rechenknecht2k11>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a fork of this driver on GitHub [0] that has been updated
with new device IDs.

Merge those into the mainline driver, so the out-of-tree fork is not
needed for users of those devices anymore.

[0] https://github.com/paroj/xpad

Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
---
 drivers/input/joystick/xpad.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 0687f0ed60b8..70e92fbf3d66
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -202,6 +202,8 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x0131, "PDP EA Sports Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0133, "Xbox 360 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0139, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02b3, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02b8, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x013a, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0146, "Rock Candy Wired Controller for Xbox One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0147, "PDP Marvel Xbox One Controller", 0, XTYPE_XBOXONE },
@@ -209,6 +211,10 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x0161, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0162, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0163, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a0, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a1, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a7, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a8, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0164, "PDP Battlefield One", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0165, "PDP Titanfall 2", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0201, "Pelican PL-3601 'TSZ' Wired Xbox 360 Controller", 0, XTYPE_XBOX360 },
@@ -216,8 +222,10 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x021f, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0246, "Rock Candy Gamepad for Xbox One 2015", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x02ab, "PDP Controller for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a2, "PDP Wired Controller for Xbox One - Crimson Red", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x02a4, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x02a6, "PDP Wired Controller for Xbox One - Camo Series", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02ad, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0301, "Logic3 Controller", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0346, "Rock Candy Gamepad for Xbox One 2016", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x0401, "Logic3 Controller", 0, XTYPE_XBOX360 },
@@ -296,6 +304,9 @@ static const struct xpad_device {
 	{ 0x1bad, 0xfa01, "MadCatz GamePad", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd00, "Razer Onza TE", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd01, "Razer Onza", 0, XTYPE_XBOX360 },
+	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
+	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5303, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
@@ -429,8 +440,12 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x162e),		/* Joytech X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harminix Rock Band Guitar and Drums */
+	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA Controllers */
+	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA Controllers */
 	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA Controllers */
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
+	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
+	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	{ }
 };
