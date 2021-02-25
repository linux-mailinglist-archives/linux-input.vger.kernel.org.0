Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB0E3249A9
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 05:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234106AbhBYELS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Feb 2021 23:11:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233479AbhBYELS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Feb 2021 23:11:18 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E032EC061574
        for <linux-input@vger.kernel.org>; Wed, 24 Feb 2021 20:10:37 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id nm21so3323032pjb.6
        for <linux-input@vger.kernel.org>; Wed, 24 Feb 2021 20:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=dN8giP+M0NZZ+raI+j4A4emKMTlzkN2uZrsTunLcU0I=;
        b=kbyu0Ljki8Uzonv361txlvdyP+FXne3QBI+5D8l72+MwLrI5jg80NR4Tbp8RlIwXMT
         v6VWP5JPDvEPIZQgA5SdS0CxV7Mo/E4PO/g5laI8rRBqNjFSB2IuiA9Sv5qY8FMl3la1
         jI2rOSxpjabn+Sjsxp5jhqDdLVOiHKaP+Z1eeDr6v9RJnSOyMUC0BJFNQ80geFt8kGRT
         Jshc71PiAeKziTkaLfNpypK4FlP3R9LNz5WjEp1yLPDBJyGbf7wbkZx6cGq9i0o6k2qG
         Lh0lfus9XYXdMei7Ye8GBZ1Gpcrx9poZYgGHb8VukNetstBUOJe1hvD7mVLXLDu/mDEt
         p/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=dN8giP+M0NZZ+raI+j4A4emKMTlzkN2uZrsTunLcU0I=;
        b=p87ajxK09boHnsyuNy4IDeuVPjYNYEg5zIoxzDBPmGx1dP3i0+Ot7Cm0YP6GhWyIOC
         pWKUhNxVYgvJ3A1D88cmRuMS6empkNuUBQn+YMqTujdc4FHBsJuNbloUVeyHENiPtBtx
         LHcNggdAShfTL/w3yp6OCPY3FJZrDVfoziLLkuBT561yfLn73SmXU+ZUegpdkZ/qBGE+
         hjk5oVWoP7aU3NMxkhdAgu36uKKxM6XaEbb1w9FpFjHaFQin1gz/LlW0LYY/VZX641U9
         5fTwaoO2VzLthKlg0v4Qvx4Fl8jvOg/SKx6dn3nU2+JdQ1eUKRKExvpzmbYMqNoMNO7q
         hwyA==
X-Gm-Message-State: AOAM532hgvtfeDas5mvm5PcXJTMc6WkwxCauVktty/DjmMf0mizTo3Sj
        VjIU3WHAgkhZPgwAFbPwVwEArbeP
X-Google-Smtp-Source: ABdhPJzXu0N8Wd3jqGWg9jO2UGCnqemwAwNptCftt66weRQF+c24CFNSZTGOxEl4lthb+dpz5/bJywh9
Sender: "lzye via sendgmr" <lzye@lzye2.c.googlers.com>
X-Received: from lzye2.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:6713])
 (user=lzye job=sendgmr) by 2002:a17:902:f28b:b029:e4:5039:9f03 with SMTP id
 k11-20020a170902f28bb02900e450399f03mr1416232plc.62.1614226237316; Wed, 24
 Feb 2021 20:10:37 -0800 (PST)
Date:   Thu, 25 Feb 2021 04:10:33 +0000
Message-Id: <20210225041033.687014-1-lzye@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH] Input: Add "Share" button to Microsoft Xbox One controller.
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
 drivers/input/joystick/xpad.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9f0d07dcbf06..08c3e93ccb2f 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -368,6 +368,14 @@ static const signed short xpad360_btn[] = {  /* buttons for x360 controller */
 	-1
 };
 
+static const signed short xpad_xboxone_btn[] = {
+	/* buttons for xbox one controller */
+	BTN_TL, BTN_TR,		/* Button LB/RB */
+	BTN_MODE,		/* The big X button */
+	KEY_RECORD,		/* The share button */
+	-1
+};
+
 static const signed short xpad_abs[] = {
 	ABS_X, ABS_Y,		/* left stick */
 	ABS_RX, ABS_RY,		/* right stick */
@@ -862,6 +870,7 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 	/* menu/view buttons */
 	input_report_key(dev, BTN_START,  data[4] & 0x04);
 	input_report_key(dev, BTN_SELECT, data[4] & 0x08);
+	input_report_key(dev, KEY_RECORD, data[22] & 0x01);
 
 	/* buttons A,B,X,Y */
 	input_report_key(dev, BTN_A,	data[4] & 0x10);
@@ -1668,10 +1677,13 @@ static int xpad_init_input(struct usb_xpad *xpad)
 		input_set_capability(input_dev, EV_KEY, xpad_common_btn[i]);
 
 	/* set up model-specific ones */
-	if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype == XTYPE_XBOX360W ||
-	    xpad->xtype == XTYPE_XBOXONE) {
+	if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype == XTYPE_XBOX360W) {
 		for (i = 0; xpad360_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
+	}  else if (xpad->xtype == XTYPE_XBOXONE) {
+		for (i = 0; xpad_xboxone_btn[i] >= 0; i++)
+			input_set_capability(input_dev, EV_KEY,
+						xpad_xboxone_btn[i]);
 	} else {
 		for (i = 0; xpad_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
-- 
2.30.0.617.g56c4b15f3c-goog

