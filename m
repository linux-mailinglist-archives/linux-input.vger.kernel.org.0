Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D500935D4A0
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 03:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237739AbhDMBDT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 21:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240180AbhDMBDS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 21:03:18 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038F6C061574
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 18:02:59 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id a36so3062839pgl.8
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 18:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=va+loHmaPIg1VXR1YY66HryM0coYFUb4xNRZHwADPtk=;
        b=I6XNHF5opU/D6EF/855/PG+DEcxVqiS4iyz+mBiT7Mtj2nPEJcIjuoIV3/k9w8lrXp
         GvIO/UC9AEYUHe+xhNK6Hwulvwc9c9wGStcI3A/KLnk6OJ1Nz8JUVE1S6wPof17VSaJ0
         vYzTwR3O/JtZPM3egpNspK7BdFscqOm8+o5eg9Z4G5k7FNEFnSf4WgOZbUwrRyccpok5
         5pD4VcB10BnXK+8g3QvjhX6g7TjhhRbUYIjQs8ZcSrwDn+sS3wbwZ0lldtPVCLh4M6+6
         vFrr3BvgLG2AXokXI0sUULJJMWNhdTzkLMAeVIESN/3fxJTAb0VZu4p8KeokokNKVWbu
         eiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=va+loHmaPIg1VXR1YY66HryM0coYFUb4xNRZHwADPtk=;
        b=HJwyJYzgc2iwBo0EBv286NLEaWwI2bP3aIkfrB6OE0jaJTr90QNSt1hOzMDxgu5wlP
         9HOhUgT5BHTJ8l3Klh9eXwAOJiJTUEgTq/+XCJeofhJMv/YKPaUDt7cIlZbf5vb/qe88
         zxYIDs3vaixyt3bsL8INri2WjJOqqLZw00DsaR++QjRa7dSG5mejn211vtb4V9CHKEhx
         HmsureToG0IkqkPZGNhzC6cB1YFDYnSCmDscRFLMFoTMaWFpp0N96+A41ZqgXVQhG2ZI
         GUsZBqI9GVBxQgK9QAUyOCloCkRB61edIE9pBKn/mX1j+DPMy6HPSEqv2BuVQBHCVJ/f
         z13Q==
X-Gm-Message-State: AOAM531BUFGWL6C5uiLR2T9Q/nrejruaNlAUFvecdkqNWDpJwWhlfF4C
        +Ae+BA4/Unx/cYevqTg4wg0Ucy2x
X-Google-Smtp-Source: ABdhPJyYziSdcyjLySHqZc1ZCTFFULAVs3dcPk8nVHJj6SBIdbSgGP50TNGs7nhSuuJYiHHwgMIN4E0L
X-Received: from lzye2.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:6713])
 (user=lzye job=sendgmr) by 2002:a17:902:7203:b029:e6:a8b1:8d37 with SMTP id
 ba3-20020a1709027203b02900e6a8b18d37mr29132267plb.44.1618275778426; Mon, 12
 Apr 2021 18:02:58 -0700 (PDT)
Date:   Tue, 13 Apr 2021 01:02:52 +0000
Message-Id: <20210413010252.2255812-1-lzye@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH] [v4] Input: Add "Select" button to Microsoft Xbox One controller.
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

Add "Select" button input capability and input event mapping for
Microsoft Xbox One controller. From product site this is also referred as
"Share" button.
Fixed Microsoft Xbox One controller select button not working under USB
connection.

Signed-off-by: Chris Ye <lzye@google.com>
---
 drivers/input/joystick/xpad.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9f0d07dcbf06..99cb8bb78570 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -79,6 +79,7 @@
 #define MAP_DPAD_TO_BUTTONS		(1 << 0)
 #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
 #define MAP_STICKS_TO_NULL		(1 << 2)
+#define MAP_SELECT_BUTTON		(1 << 3)
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
 
@@ -130,6 +131,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
+	{ 0x045e, 0x0b12, "Microsoft Xbox One X pad", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
@@ -862,6 +864,8 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 	/* menu/view buttons */
 	input_report_key(dev, BTN_START,  data[4] & 0x04);
 	input_report_key(dev, BTN_SELECT, data[4] & 0x08);
+	if (xpad->mapping & MAP_SELECT_BUTTON)
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
+		if (xpad->mapping & MAP_SELECT_BUTTON)
+			input_set_capability(input_dev, EV_KEY, KEY_RECORD);
 	} else {
 		for (i = 0; xpad_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
-- 
2.31.1.295.g9ea45b61b8-goog

