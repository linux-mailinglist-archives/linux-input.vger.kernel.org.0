Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0356435EAA4
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 04:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhDNCMa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 22:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbhDNCM3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 22:12:29 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FEAC061574
        for <linux-input@vger.kernel.org>; Tue, 13 Apr 2021 19:12:09 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id h15-20020a17090a054fb02900c66a1b9826so7787365pjf.8
        for <linux-input@vger.kernel.org>; Tue, 13 Apr 2021 19:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=QUa/z4U+xYp/G6ZwVdnUBL+VTHMhfaT1zjq2fxbj/7Q=;
        b=vAdefYf5Sh47eXDz0HifaA6qLGGbvsWRdAzn6yHn2k4XUW7KUw+JfcfJRvE8P//crG
         Sgmp7y8ekRsm5ikghQ6lStVWvSR0wwmfgeD53kXUvvMCVZrkl4MiXg1O/rGz5Z5QKEP8
         AdNnTpT8aD2+aZgH14j1GOl0gMRP0oSzlHTvI4vQcrVYIhw8qTyrefxC5fdqgNGy1vh3
         d+37XRsWViJ1zbhq1KcE58PFwS+uLCo88C1SXNszjtpgPE4x+AV4uNV0qnDzGYWdGWXW
         LVhbTvIFLMlfE10wBzbmGvI7cQNAO1JJNo8u0Qx0oxgPgrOcR1TOBIl9M2AYE2s/Zqns
         NWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=QUa/z4U+xYp/G6ZwVdnUBL+VTHMhfaT1zjq2fxbj/7Q=;
        b=VH864XLPhDtOOIS69I1xlPAWOiCdrCSkqZbpbUyQTgKVNFQEPwo33Dyik+J3OS5Qik
         BB8dvSyfX47eAW7kFh94jOvEEj6nIWO73lffHB9iizuLaqeZuyCYfrbLeCQf+rbb4J5c
         m9jTvsbVdx0lf9lr65p+TQiz7DTIbqWHo/QOoGjSdZIRU/7uWNGl5TMX4pKJh7zIj2zE
         BfaNHCOTnStRZiXBnpklTg9otoKfH+i9XuU3thtmmQtp8J0YsNhbAUATh4Iz8C5K3Pph
         YMS812k0Ql1dhDluwuro/SJNdZ+mv4e/31uLTAO4gmSXM26Y71e0tPa30si1MttU5zq6
         Anmg==
X-Gm-Message-State: AOAM530RULSiNo4MQYMKxBfNIjUlc+oLHtjCzjgzoWC8WmHUe7MWB54r
        G622EII7sklcNV+zsghcVfgmQ22t
X-Google-Smtp-Source: ABdhPJyvIjeokt8cH+3b2Zm5WHCEdlTw1K78oXzATvdBO+NIY9SGQpr07F1MMWe0cxC58m94Wt2O0OIc
X-Received: from lzye2.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:6713])
 (user=lzye job=sendgmr) by 2002:a17:90b:e98:: with SMTP id
 fv24mr135137pjb.1.1618366328195; Tue, 13 Apr 2021 19:12:08 -0700 (PDT)
Date:   Wed, 14 Apr 2021 02:12:01 +0000
Message-Id: <20210414021201.2462114-1-lzye@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH] [v5] Input: Add "Select" button to Microsoft Xbox One controller.
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
 drivers/input/joystick/xpad.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9f0d07dcbf06..cfbf1747b205 100644
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
@@ -1672,6 +1676,8 @@ static int xpad_init_input(struct usb_xpad *xpad)
 	    xpad->xtype == XTYPE_XBOXONE) {
 		for (i = 0; xpad360_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
+		if (xpad->mapping & MAP_SELECT_BUTTON)
+			input_set_capability(input_dev, EV_KEY, KEY_RECORD);
 	} else {
 		for (i = 0; xpad_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
-- 
2.31.1.295.g9ea45b61b8-goog

