Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D12644F30D
	for <lists+linux-input@lfdr.de>; Sat, 13 Nov 2021 13:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233881AbhKMMUk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 07:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhKMMUj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 07:20:39 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6AFC061766
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 04:17:47 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id v65so14659340ioe.5
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 04:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=bimXGF37Ry/hv6CGrgaxQIXv6P7Dgj4Waz86T59cZfM=;
        b=kYOkWiP0Gu7Cor8LJic8kwMgjbFV6ZImAD5t+OageTcuh5qTlTaw42I8nVi7hIdu3m
         3Yo8j7+mlkxJ5BBjTuzMP2xmPtPjiSIHAH3K648ADpqeyx0sKNXHWsjvPif9EgHErKpN
         ZCb0Qw8hHMuWt/JB2BeizODyy69platPWv5yg5RvlOAEuDSyjoENSCH3Ws7WEWvy+T2B
         MWjGQB6Le9gIV+rKGVmjCMwRz4bMDYyYDmr3MfbevtLDc591I/j8fTev+fj784sMCGCv
         pCzefWLcCzFXjdkf32DkB77RrslJkuvd7vMoY33Zgn1keHugFZFBvn2xsJPfYBXPRq38
         jLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=bimXGF37Ry/hv6CGrgaxQIXv6P7Dgj4Waz86T59cZfM=;
        b=BnCmequR8YXuCdO2WBRy84QZe196C9IKER6zPtQkymIaQ8o0kf9ysBB3Pc22MoAzux
         ZKM6CnecA/nW6jpLdqiZ2RbgRZzJkFUQ95V0lYD6Og4azzZfjp1ZrpJjRErFv4shgqDQ
         7LI2wyUknHI0yJuxAhVJI9hWMhxdEHbQdcpYbEp+PMlV4g0EFxgY2dfH02jzIN9Y7HxK
         7KUXWZLHzKN2ZML3c6fEhTpbC7aSCTerQXTvDkSCD+Kd5uoOSFz7cj33SCxSz51TJbOS
         Qjvt2vhq7V06aQzaFV0EKx7jZQFFKpusuCaeCoIlTsii1ym9SHU49ZxDLjrnkLT23x+x
         J2/g==
X-Gm-Message-State: AOAM533DeVwlJbgAIZPoP8Dr6oLc3r8w73TY3mg93cWAehljSXcQP3kj
        rEgXZ84mZAZ2JWROSBvNN9U=
X-Google-Smtp-Source: ABdhPJyEwfRqU2Yk1wQpqiOwevEpawywa4yMSPXX08ExdUKfhvboFRiTn632H75LkoKXU35mss57Ag==
X-Received: by 2002:a05:6638:2178:: with SMTP id p24mr17393648jak.142.1636805866752;
        Sat, 13 Nov 2021 04:17:46 -0800 (PST)
Received: from rechenknecht2k11 (200116b845dc28008d9ba50a9af0b814.dip.versatel-1u1.de. [2001:16b8:45dc:2800:8d9b:a50a:9af0:b814])
        by smtp.googlemail.com with ESMTPSA id b4sm4876271iot.45.2021.11.13.04.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 04:17:46 -0800 (PST)
Date:   Sat, 13 Nov 2021 13:17:34 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>
Subject: Input: xpad - add more Xbox one controller IDs
Message-ID: <20211113131734.46fbc9bf@rechenknecht2k11>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These are collected from issue reports on [0].

I wonder a bit why we need to maintain this list to begin with, when
the consoles (and Windows) can apparently identify any new third party
controller just fine.
I don't have *that* many controllers to do extensive tests, but I wonder
if there could be a better way.

[0] https://github.com/paroj/xpad/issues

Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
---
 drivers/input/joystick/xpad.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index e51f3a2bf06b..d99dd9aed137 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -150,6 +150,7 @@ static const struct xpad_device {
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0201, "Saitek Adrenalin", 0, XTYPE_XBOX },
 	{ 0x06a3, 0xf51a, "Saitek P3600", 0, XTYPE_XBOX360 },
+	{ 0x0738, 0x4503, "Mad Catz Racing Wheel", 0, XTYPE_XBOXONE },
 	{ 0x0738, 0x4506, "Mad Catz 4506 Wireless Controller", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4516, "Mad Catz Control Pad", 0, XTYPE_XBOX },
 	{ 0x0738, 0x4520, "Mad Catz Control Pad Pro", 0, XTYPE_XBOX },
@@ -250,6 +251,7 @@ static const struct xpad_device {
 	{ 0x102c, 0xff0c, "Joytech Wireless Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
+	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
 	{ 0x12ab, 0x0004, "Honey Bee Xbox360 dancepad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
@@ -263,6 +265,7 @@ static const struct xpad_device {
 	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
+	{ 0x1532, 0x0a29, "Razer Wolverine v2", 0, XTYPE_XBOXONE },
 	{ 0x15e4, 0x3f00, "Power A Mini Pro Elite", 0, XTYPE_XBOX360 },
 	{ 0x15e4, 0x3f0a, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
 	{ 0x15e4, 0x3f10, "Batarang Xbox 360 controller", 0, XTYPE_XBOX360 },
@@ -329,6 +332,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x550e, "Hori Real Arcade Pro V Kai 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x561a, "PowerA FUSION Controller", 0, XTYPE_XBOXONE },
+	{ 0x24c6, 0x581a, "ThrustMaster XB1 Classic Controller", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5b00, "ThrustMaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b02, "Thrustmaster, Inc. GPX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
@@ -336,6 +340,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
@@ -435,6 +440,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori Controllers */
 	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori Controllers */
 	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries Controllers */
+	XPAD_XBOXONE_VENDOR(0x10f5),		/* Turtle Beach */
 	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
 	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
 	XPAD_XBOX360_VENDOR(0x12ab),		/* X-Box 360 dance pads */
@@ -455,6 +461,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
+	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon XBOX Series S/X Controllers */
 	{ }
 };
 
-- 
2.32.0
