Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B7F324A34
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 06:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbhBYFcv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Feb 2021 00:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbhBYFcu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Feb 2021 00:32:50 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F07C06174A
        for <linux-input@vger.kernel.org>; Wed, 24 Feb 2021 21:32:10 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id 42so2902337plb.10
        for <linux-input@vger.kernel.org>; Wed, 24 Feb 2021 21:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=z+YFQ8HagpnlAfp5aFAoRDrk8fWVpmZPjNGOPeSjUH4=;
        b=OV2OjTao0PVH28OXYDYfDv6MreJftrYMFoC6ZTED6et/JTHsUKThG77gqbJLkK8DDs
         BJJA7AlwfQ99/T3vINsQLA/VQI65YbJOuwBkRmrVGUA2Bs3WoScBQeqflQ8BKGZNaSqM
         aVNMtyEmsoSpe1F5vODV1t443LC+f2SGJhyBJWC38TKcxCP0JiJP48UHT12ltuia3R5A
         scvlMggMlAgNFFJSrwE31Wuty98x5XVrCwkP78kZv50AGeZShy6MnPZaV/bPUwx62/VZ
         bg/iFdrtH3ShTB6DBPVUrasbZj6TLkHvvrXTP1norLYq6Uo5CdUtAkPbig8mkDxFVrHW
         vF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=z+YFQ8HagpnlAfp5aFAoRDrk8fWVpmZPjNGOPeSjUH4=;
        b=sCVeGsRUzlvAzymqyR2GWTSxWVLfkU+5y8jnrIkFfFLx0w4JWhqqNZLVtEE56DvL4z
         ii0eQ/EBNNSTJLsPow3uqZ7EMxTn9L0M3EQ7flOqE20SnhgI/ZXpoQCFwHX2kRm3KBdi
         mqCf74yh9caN1H1jjexFonfkojiHNYRJJr7hFP356XgItbADeDmJziiexes+GAKMpwwr
         6DluF3pmHxGlsV/4NyLDQHMJwcxmUk+n+Vt2YztOcwpLHTqLqekoJ36h7KquvY9/Yc3d
         VPeVOv2r/d5PYTs8DUFEn98jg54lBEwE1tK0CoZkZ9Uuec2YKFuKMccZEb/jNx6cuoGM
         5AOA==
X-Gm-Message-State: AOAM530nFtVQFAKnpoitjlP4YC5UiSwCInXvxFjtXxyy4NezEUHcpEdi
        fmEK8arj5O/heTkh17H+pVRdtwmV
X-Google-Smtp-Source: ABdhPJyl6fcgDbcW7zsz6MzOHIKg0lKeEvX68q8WpPq5sFDRR3De+TWxs1yCIqq7Z4sbT+/JKJwtHnkK
Sender: "lzye via sendgmr" <lzye@lzye2.c.googlers.com>
X-Received: from lzye2.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:6713])
 (user=lzye job=sendgmr) by 2002:a05:6a00:148c:b029:1eb:aa7d:b1b4 with SMTP id
 v12-20020a056a00148cb02901ebaa7db1b4mr1627224pfu.8.1614231129182; Wed, 24 Feb
 2021 21:32:09 -0800 (PST)
Date:   Thu, 25 Feb 2021 05:32:04 +0000
Message-Id: <20210225053204.697951-1-lzye@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH] [v2] Input: Add "Share" button to Microsoft Xbox One controller.
From:   Chris Ye <lzye@google.com>
To:     "=?UTF-8?q?=C5=81ukasz=20Patron=20?=" <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Chris Ye <lzye@google.com>, Lee Jones <lee.jones@linaro.org>,
        "=?UTF-8?q?Olivier=20Cr=C3=AAte=20?=" <olivier.crete@ocrete.ca>,
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
 drivers/input/joystick/xpad.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9f0d07dcbf06..0c3374091aff 100644
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
+	{ 0x045e, 0x0b12, "Microsoft X-Box One X pad", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
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
@@ -1669,9 +1673,12 @@ static int xpad_init_input(struct usb_xpad *xpad)
 
 	/* set up model-specific ones */
 	if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype == XTYPE_XBOX360W ||
-	    xpad->xtype == XTYPE_XBOXONE) {
+		xpad->xtype == XTYPE_XBOXONE) {
 		for (i = 0; xpad360_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
+		if (xpad->mapping & MAP_SHARE_BUTTON) {
+			input_set_capability(input_dev, EV_KEY, KEY_RECORD);
+		}
 	} else {
 		for (i = 0; xpad_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
-- 
2.30.0.617.g56c4b15f3c-goog

