Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC19447FD9
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 13:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238557AbhKHMxp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 07:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238591AbhKHMxi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 07:53:38 -0500
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E7BC061714
        for <linux-input@vger.kernel.org>; Mon,  8 Nov 2021 04:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
        Resent-Message-ID:In-Reply-To:References;
        bh=wQX1d1goNh5t+Hv5qgYP91JSGOuFmMonIZ2nvare3HY=; t=1636375854; x=1637585454; 
        b=FcFs/xq0sjRo3OZ1tmC2T5HUZOenBT1WdiA08Unb391Ph5hvhAnfSmKMm6vomE/r0e2UCCKUndH
        N2k8mEZdUJ5RVV//jiJvElyanzDQyWpheCo+BXphN4ySNDx/zDQy8ArYVNIsNoXY2r2ufvNZje3Wd
        0yBq/K/14T/su2tt9+TY6pSE3LsCoMTCcADGcHydP0MTQORNK4e7HfjBxdxAllkinlpMaeQWdk9Tr
        rlkqQahT0XoeFuFB06reiANLKv/n3Slq/32xpFT+jp2BU8qG2XLarpJK8nBCDF9YsanmdwVDZifoG
        od8+wgxiPoqcN7EZqHR9sJE08LINc67e4Gmw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.95)
        (envelope-from <benjamin@sipsolutions.net>)
        id 1mk46u-00CZLL-6X;
        Mon, 08 Nov 2021 13:50:52 +0100
From:   Benjamin Berg <benjamin@sipsolutions.net>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alex Henrie <alexhenrie24@gmail.com>,
        Benjamin Berg <bberg@redhat.com>
Subject: [PATCH] HID: apple: Add 2021 magic keyboard FN key mapping
Date:   Mon,  8 Nov 2021 13:50:38 +0100
Message-Id: <20211108125038.125579-1-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Benjamin Berg <bberg@redhat.com>

The new 2021 apple models have a different FN key assignment. Add a new
translation table and use that for the 2021 magic keyboard.

Signed-off-by: Benjamin Berg <bberg@redhat.com>
---
 drivers/hid/hid-apple.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 2c9c5faa74a9..61dfe983828f 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -70,6 +70,28 @@ struct apple_key_translation {
 	u8 flags;
 };
 
+static const struct apple_key_translation apple2021_fn_keys[] = {
+	{ KEY_BACKSPACE, KEY_DELETE },
+	{ KEY_ENTER,	KEY_INSERT },
+	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
+	{ KEY_F2,	KEY_BRIGHTNESSUP,   APPLE_FLAG_FKEY },
+	{ KEY_F3,	KEY_SCALE,          APPLE_FLAG_FKEY },
+	{ KEY_F4,	KEY_SEARCH,         APPLE_FLAG_FKEY },
+	{ KEY_F5,	KEY_MICMUTE,        APPLE_FLAG_FKEY },
+	{ KEY_F6,	KEY_SLEEP,          APPLE_FLAG_FKEY },
+	{ KEY_F7,	KEY_PREVIOUSSONG,   APPLE_FLAG_FKEY },
+	{ KEY_F8,	KEY_PLAYPAUSE,      APPLE_FLAG_FKEY },
+	{ KEY_F9,	KEY_NEXTSONG,       APPLE_FLAG_FKEY },
+	{ KEY_F10,	KEY_MUTE,           APPLE_FLAG_FKEY },
+	{ KEY_F11,	KEY_VOLUMEDOWN,     APPLE_FLAG_FKEY },
+	{ KEY_F12,	KEY_VOLUMEUP,       APPLE_FLAG_FKEY },
+	{ KEY_UP,	KEY_PAGEUP },
+	{ KEY_DOWN,	KEY_PAGEDOWN },
+	{ KEY_LEFT,	KEY_HOME },
+	{ KEY_RIGHT,	KEY_END },
+	{ }
+};
+
 static const struct apple_key_translation macbookair_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
@@ -214,7 +236,9 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 	}
 
 	if (fnmode) {
-		if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+		if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021)
+			table = apple2021_fn_keys;
+		else if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
 				hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
 			table = macbookair_fn_keys;
 		else if (hid->product < 0x21d || hid->product >= 0x300)
@@ -376,6 +400,9 @@ static void apple_setup_input(struct input_dev *input)
 	for (trans = apple_iso_keyboard; trans->from; trans++)
 		set_bit(trans->to, input->keybit);
 
+	for (trans = apple2021_fn_keys; trans->from; trans++)
+		set_bit(trans->to, input->keybit);
+
 	if (swap_fn_leftctrl) {
 		for (trans = swapped_fn_leftctrl_keys; trans->from; trans++)
 			set_bit(trans->to, input->keybit);
-- 
2.31.1

