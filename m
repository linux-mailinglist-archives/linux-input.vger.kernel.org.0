Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41E4313C88
	for <lists+linux-input@lfdr.de>; Mon,  8 Feb 2021 19:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbhBHSHj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Feb 2021 13:07:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:46600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234753AbhBHSDf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Feb 2021 13:03:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14FD164EE5;
        Mon,  8 Feb 2021 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807169;
        bh=/373J3Z4WQN7t3mOFIxALj6Rv6vEeuzzcGx35wU4hHc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NCjE57Lji3E/tAiD53zel8A3aQMQld9HtP2Vtnob5Gggf+Tl3RmBka1I9+n2a1ReS
         v5oXXsDpOSpdebnxqpBdowjYoUwmYCCV88SOiaFu47MHUSwJd4mGH16hWTdWeTfN8z
         UZ7Sb84Sz4Pc1yrDxxW8Vm+nAtbXf0BGCvXKlK+VmvyQn+zobnrE0cczVl3DZrbCYL
         ECj51NosTfSrgIgGDHrxn6nWqBFaMeSEjRi5EBIz04eFZ/b676X6ReFMa97mKE5VFA
         tpu3RzkFq6jjcUOO8n3qeeHBwxFXuRCtpKr+OWd9lX3TDAihTgHKG+9mZb+4gH8mDi
         asuK0XYpIWHtA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Benjamin Valentin <benpicco@googlemail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/14] Input: xpad - sync supported devices with fork on GitHub
Date:   Mon,  8 Feb 2021 12:59:14 -0500
Message-Id: <20210208175926.2092211-2-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175926.2092211-1-sashal@kernel.org>
References: <20210208175926.2092211-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Benjamin Valentin <benpicco@googlemail.com>

[ Upstream commit 9bbd77d5bbc9aff8cb74d805c31751f5f0691ba8 ]

There is a fork of this driver on GitHub [0] that has been updated
with new device IDs.

Merge those into the mainline driver, so the out-of-tree fork is not
needed for users of those devices anymore.

[0] https://github.com/paroj/xpad

Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
Link: https://lore.kernel.org/r/20210121142523.1b6b050f@rechenknecht2k11
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/joystick/xpad.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ee3ff0894d093..ef4e8423843f3 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -229,9 +229,17 @@ static const struct xpad_device {
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
@@ -310,6 +318,9 @@ static const struct xpad_device {
 	{ 0x1bad, 0xfa01, "MadCatz GamePad", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd00, "Razer Onza TE", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0xfd01, "Razer Onza", 0, XTYPE_XBOX360 },
+	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
+	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x24c6, 0x5000, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5300, "PowerA MINI PROEX Controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5303, "Xbox Airflo wired controller", 0, XTYPE_XBOX360 },
@@ -443,8 +454,12 @@ static const struct usb_device_id xpad_table[] = {
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
 
-- 
2.27.0

