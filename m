Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3DA32A568
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245364AbhCBMf0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:35:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238781AbhCAXff (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Mar 2021 18:35:35 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91F8C061788
        for <linux-input@vger.kernel.org>; Mon,  1 Mar 2021 15:34:54 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id p136so20764813ybc.21
        for <linux-input@vger.kernel.org>; Mon, 01 Mar 2021 15:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=/CErj8RpVVoLVT/AMv5UhNgXiL8bX9p5U/O6jqR0oIg=;
        b=jlgqdriXCepIUKWi8oM3E/zf3xX6lAZMKJKPTnfCdG1esCJciLVCGf0TTxsCJCDth/
         wdHyUM5E2M5XSWpWYapjgqHF8YAAuvwIsr3Yecx09rbxM56EKTChsPxgxHUHx+KKadnO
         +fiYkX6t39IB5NamBGinCmRnCuNc7mu3XABPeM49yaT3EQVFvdCSb5zZrJJHSVb+40IT
         UEQPFqBQdWgsvVqEFoEh3WpvATrBcRbmqPRwdEVaeeAMumD/6qLzooHDy1ixGvs1PNki
         5gi3damaPxjIQDwrqdkhEMQfSoiSIAPZw6czp7+ortg7rFZDl9JvuOv/YOGwb3Sdw5XD
         PH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=/CErj8RpVVoLVT/AMv5UhNgXiL8bX9p5U/O6jqR0oIg=;
        b=J1zgcsA3nlJEOpJrkraTmy+Ir04GXYjD+NCm1iAjADOLm/AYC6fxQMUwxEhPKj7NWh
         t0Bl2bPymbkXX3VkU8B0nBnecwtCSQ4DT5VEG/ldfJ0q2xTtrvG9ZH2tvGCur9LEDPM3
         gd0UwFJb0GBRloyifq5luPaxajnbsvNn2iL4Qjg8yoNTuloO9cCPEAao9PBDOL35NLPf
         dIdIEQ5H0RjWyVe2fjo2cQ4XAoASGflUyxCT1efLqWcx9YvXtuma6TaUuyWZxG5pdPwX
         PFJjHygpHr+9xyPDNtuRxrq3kW8jrTYs4PtENcqgzEaV7qmJttx4KpoEk9eDUpEgnonG
         KRFQ==
X-Gm-Message-State: AOAM533qP1r/89VRt9KnCTULwMKWwNgvXdBtEL2Q0xz46+dd+5tCeUut
        orXLxC57GfaWhWGXp/UmmV4MMgvJ
X-Google-Smtp-Source: ABdhPJy7DmJJLxzAaprTLhrI6WsLc6+UVyKt6lNx0gH2ejo+h/PATP5OpOaCxvExhQK9vC3cYw7XUBzt
Sender: "lzye via sendgmr" <lzye@lzye2.c.googlers.com>
X-Received: from lzye2.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:6713])
 (user=lzye job=sendgmr) by 2002:a25:b682:: with SMTP id s2mr24490648ybj.407.1614641693868;
 Mon, 01 Mar 2021 15:34:53 -0800 (PST)
Date:   Mon,  1 Mar 2021 23:34:50 +0000
Message-Id: <20210301233450.1647082-1-lzye@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH] [v3] Input: Add "Share" button to Microsoft Xbox One controller.
From:   Chris Ye <lzye@google.com>
To:     "=?UTF-8?q?=C5=81ukasz=20Patron?=" <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Chris Ye <lzye@google.com>, Lee Jones <lee.jones@linaro.org>,
        "=?UTF-8?q?Olivier=20Cr=C3=AAte?=" <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add "Share" button input capability and input event mapping for
Microsoft Xbox One controller.
Fixed Microsoft Xbox One controller share button not working under USB
connection.

Signed-off-by: Chris Ye <lzye@google.com>
---
 drivers/input/joystick/xpad.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9f0d07dcbf06..b51c0e381cc9 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -79,6 +79,7 @@
 #define MAP_DPAD_TO_BUTTONS		(1 << 0)
 #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
 #define MAP_STICKS_TO_NULL		(1 << 2)
+#define MAP_SHARE_BUTTON		(1 << 3)
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
 
@@ -130,6 +131,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x0b12, "Microsoft Xbox One X pad", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
@@ -862,6 +864,8 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 	/* menu/view buttons */
 	input_report_key(dev, BTN_START,  data[4] & 0x04);
 	input_report_key(dev, BTN_SELECT, data[4] & 0x08);
+	if (xpad->mapping & MAP_SHARE_BUTTON)
+		input_report_key(dev, KEY_RECORD, data[22] & 0x01);
 
 	/* buttons A,B,X,Y */
 	input_report_key(dev, BTN_A,	data[4] & 0x10);
@@ -1669,9 +1673,11 @@ static int xpad_init_input(struct usb_xpad *xpad)
 
 	/* set up model-specific ones */
 	if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype == XTYPE_XBOX360W ||
-	    xpad->xtype == XTYPE_XBOXONE) {
+		xpad->xtype == XTYPE_XBOXONE) {
 		for (i = 0; xpad360_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
+		if (xpad->mapping & MAP_SHARE_BUTTON)
+			input_set_capability(input_dev, EV_KEY, KEY_RECORD);
 	} else {
 		for (i = 0; xpad_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
-- 
2.30.1.766.gb4fecdf3b7-goog

