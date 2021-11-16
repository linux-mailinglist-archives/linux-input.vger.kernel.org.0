Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F8145374C
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 17:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbhKPQ0h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 11:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbhKPQ0h (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 11:26:37 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90247C061570
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 08:23:39 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id b12so38733436wrh.4
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 08:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ea0B3xzWE9YDvH000+rRRU2NYklhg9t9H8sE5eb8Oy8=;
        b=efsEffPQNVcJAzg36xxFPQAalVKplADKu2CjI05GAJp61xqz3uJKTO+XDlQibUEzYx
         UdfyfmUKMCL1K0fh82F1s3VuOCR9Vc+/ytRkonz972CNSsIJwvHAVU8myq3gxEMVCEeU
         tc/ct0a/OnMf7BBQIfrY3BkVps2BEgK0WhMcgG0pghTpLYSmNYeWILEc5y7C/2nlnm7R
         g2A89jmzjT4JrnBCU4VnDR3kdRYacFnx5oQ/ch95OavyVpNLvXe38SYRFjjkw9bFxQJP
         gQv4rdJSBf9bwTQdpNRH5pU+8BqzuFm36+Rxu/O2N3OHd5T0wgYkAygMEneJucsL6AKu
         7iiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ea0B3xzWE9YDvH000+rRRU2NYklhg9t9H8sE5eb8Oy8=;
        b=Mcp1ggX+GvZjvA3t62dByEuOcKNMHtW0RqWK44Ci4tFhr69ytKgGATn7xVsjezCcxE
         7gtu7CMJx4c8zQpEtCVAz5v/CioXWMNpwWPuIsJgxWnReLLbgv4r2/KTteMv/KyLNv2Q
         HmRyEA9mb6MYxcb6atKko/USEXkaEopOZWAAvoTRm5fWoXjHdHjcg9NUV/B3wmln6TfC
         Lt6E1tno2V2XcBGgtyFa5RmlSW3BNLJz1AvxjdWadgGq2RA/XR13cqPTRrWk2bLg1079
         VZV0oRQCzID4yyPgD2ydRIFWcoD6yczMn7aCoruagl5bRgY9tKKmdWBlGNFqxsgeC3Dx
         Taig==
X-Gm-Message-State: AOAM530YfMuHBTXozfF+TlEfqk4gmU+SUyjgBMFjw//9yIbM35dU2Dui
        ms/9ltnIE+07YbdH5YigB7A=
X-Google-Smtp-Source: ABdhPJy/O8oJCUwLOKD+4DCysBrSeZ9MXtDQN8BINrUtNGjuQbh8aox2vDlHebzupv2bbBWGf9JTVg==
X-Received: by 2002:a5d:550c:: with SMTP id b12mr10770666wrv.427.1637079818053;
        Tue, 16 Nov 2021 08:23:38 -0800 (PST)
Received: from rechenknecht2k11 (200116b8459a9b003f00a60854fcf5ee.dip.versatel-1u1.de. [2001:16b8:459a:9b00:3f00:a608:54fc:f5ee])
        by smtp.googlemail.com with ESMTPSA id j11sm17894397wrt.3.2021.11.16.08.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 08:23:37 -0800 (PST)
Date:   Tue, 16 Nov 2021 17:23:34 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Cameron Gutman <aicommander@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/2] Input: xpad - name unknown gamepads according to device
 type
Message-ID: <20211116172334.06578aaf@rechenknecht2k11>
In-Reply-To: <3b25f4b1-3ec0-0878-99bc-0da06ce7c2f2@gmail.com>
References: <20211113141155.26217b44@rechenknecht2k11>
        <3b25f4b1-3ec0-0878-99bc-0da06ce7c2f2@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Calling any unknown device 'Generic X-Box pad' can lead to confusion
as a user might think the device type was not properly detected.

The different controller generations also have different button numbers
and mappings.

Instead use a device type specific name so it's immediately clear that
the device has been recognized.

This means we can now drop the "Generic X-Box pad" entry.
To allow the entire line to be 0, re-order the device types so that
'UNKNOWN' is 0 now too.

Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
---
 drivers/input/joystick/xpad.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4c914f75a902..31a268f43b5b 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -83,11 +83,11 @@
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
 
-#define XTYPE_XBOX        0
-#define XTYPE_XBOX360     1
-#define XTYPE_XBOX360W    2
-#define XTYPE_XBOXONE     3
-#define XTYPE_UNKNOWN     4
+#define XTYPE_UNKNOWN     0
+#define XTYPE_XBOX        1
+#define XTYPE_XBOX360     2
+#define XTYPE_XBOX360W    3
+#define XTYPE_XBOXONE     4
 
 static bool dpad_to_buttons;
 module_param(dpad_to_buttons, bool, S_IRUGO);
@@ -337,7 +337,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
-	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
+	{ }
 };
 
 /* buttons shared with xbox and xbox360 */
@@ -1783,14 +1783,19 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 
 	if (xpad->xtype == XTYPE_UNKNOWN) {
 		if (intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC) {
-			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129)
+			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129) {
 				xpad->xtype = XTYPE_XBOX360W;
-			else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208)
+				xpad->name = "Xbox 360 wireless pad";
+			} else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208) {
 				xpad->xtype = XTYPE_XBOXONE;
-			else
+				xpad->name = "Xbox One pad";
+			} else {
 				xpad->xtype = XTYPE_XBOX360;
+				xpad->name = "Xbox 360 pad";
+			}
 		} else {
 			xpad->xtype = XTYPE_XBOX;
+			xpad->name = "Xbox classic pad";
 		}
 
 		if (dpad_to_buttons)
-- 
2.32.0

