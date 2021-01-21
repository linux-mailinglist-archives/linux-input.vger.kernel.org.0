Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089E82FEE75
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 16:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732226AbhAUPYU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 10:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732242AbhAUN0M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 08:26:12 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D50C061757
        for <linux-input@vger.kernel.org>; Thu, 21 Jan 2021 05:25:28 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id d22so2468784edy.1
        for <linux-input@vger.kernel.org>; Thu, 21 Jan 2021 05:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k3dEkKZeZFDbxGxvlcmEcZE21G3lLzG8fWUHxv2/bkk=;
        b=tQkNYyyU4AIL3C/T+Qo9hdNurbMnxOjf+aa/qjC7tw4Y6Ikb3Rnk0+ioAVJo1fAKCa
         sWqhBQlRiTKwmG3EiNEs0l+dGWuK2Go53yJz3yeSGAguzaNAWFQJzkPLHvpdR7+lB2GE
         Lm5e4RHWzVoPkK23W/jyxoQULOnuO1TazLdX+ITFIKwsSSpbwXqr2zFcQo6bqDMJyJKr
         /P+0gE28XlMBFUWvDeMBa+UjLX1gwHozKeW3Tyt2HDbbBUiPdYu27b6fFBccwmirrPJe
         uxWdJCJsLHYeAViTbI+WrXWz2zAAL/CS8Lb8CndH+lvV1kvQke3ZDqTnzMr4DlVCf9KZ
         t2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k3dEkKZeZFDbxGxvlcmEcZE21G3lLzG8fWUHxv2/bkk=;
        b=suuhpBRRde2kHnDxqMa/f6tQUpauRVNPyOsLMOHR4sxxbylglLVJjLA8P6+maMokGe
         u/NDx8uQqW3CiXHOse2B9zeDBCiECcmQvyw9w7tV8xEvrF3BTgjAyYIBqyZRjGQOTQDv
         sIpu5toNdUlk8BOM7fD9dMxz/AQcew3lkduBI3r/eeM2uEjEnpgZ0P2efRhOQuxK2YIE
         mSDCWmpw9FnQQQfuI8kbwEJHSUNIQcY8ErrwtVyItsNUc7NHvCh3GRYQSQdYGziHm0Wy
         9kM6Fmrs4FeJDRT3dXDII7xTBg8SeWpplhnnqgVpyQWn9Qzl68d0eOHFN4ZI+EV0OsBa
         SQgQ==
X-Gm-Message-State: AOAM531Ct5Y09eALnaJt6599wJgDGzps+k78ExlKm5drJYeeVv6Q9EKd
        8FIvZQFSsGobeQpDYAB68lU=
X-Google-Smtp-Source: ABdhPJyCYIKwDtFQRVEfSyEANtb//35QvuUMrrAN1toHFzxnLKPmRdd2PhE4gQLzHTgvqbIbN5b8og==
X-Received: by 2002:aa7:da41:: with SMTP id w1mr11371621eds.24.1611235527166;
        Thu, 21 Jan 2021 05:25:27 -0800 (PST)
Received: from rechenknecht2k11 (200116b8459c7b00b738b6f441b295d6.dip.versatel-1u1.de. [2001:16b8:459c:7b00:b738:b6f4:41b2:95d6])
        by smtp.googlemail.com with ESMTPSA id zk10sm2255305ejb.10.2021.01.21.05.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 05:25:26 -0800 (PST)
Date:   Thu, 21 Jan 2021 14:25:23 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>
Subject: [PATCHv2] Input: xpad - sync supported devices with fork on GitHub
Message-ID: <20210121142523.1b6b050f@rechenknecht2k11>
In-Reply-To: <20210121141602.7ff62580@rechenknecht2k11>
References: <20210121141602.7ff62580@rechenknecht2k11>
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
Changed in v2: fix alphabetical order of IDs
---
 drivers/input/joystick/xpad.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 0687f0ed60b8..8cc8ca4a9ac0
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -215,9 +215,17 @@ static const struct xpad_device {
 	{ 0x0e6f, 0x0213, "Afterglow Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x021f, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x0e6f, 0x0246, "Rock Candy Gamepad for Xbox One 2015", 0, XTYPE_XBOXONE },
-	{ 0x0e6f, 0x02ab, "PDP Controller for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a0, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a1, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a2, "PDP Wired Controller for Xbox One - Crimson Red", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x02a4, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
 	{ 0x0e6f, 0x02a6, "PDP Wired Controller for Xbox One - Camo Series", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a7, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02a8, "PDP Xbox One Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02ab, "PDP Controller for Xbox One", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02ad, "PDP Wired Controller for Xbox One - Stealth Series", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02b3, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
+	{ 0x0e6f, 0x02b8, "Afterglow Prismatic Wired Controller", 0, XTYPE_XBOXONE },
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
