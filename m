Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEC4453755
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 17:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhKPQ2I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 11:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbhKPQ2H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 11:28:07 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B85EC061570
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 08:25:10 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id az33-20020a05600c602100b00333472fef04so2453935wmb.5
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Djf41xld+0ekM1PIg4SaeNny1ar0p7PgqRVxFha8Hnk=;
        b=nH9WnJ3jEso0D4JtEx8L2E1L3tPQG4c//LoAmy0IDOpbJgfdxEPNjxbwakliRIQ2u3
         BqFG/Ve/av7T3o1Pw975PqatjEv6TEGQO140H3G3v8Du84Hyja/0uS9CRfbkq/TZEAJz
         fxjVCtXmaLCDvoI0gg/luWzVSS0221eJIWT3XYZhEis9ocllb31N8ibCpXmY5kbqjAb/
         quYbQU+wBOf/GeSwhuaMf4wpntaXrGbr5K255rnaLIgvNkpAPe0d6+YRGjP5TiGWENHN
         nNVm81PC4rFE1IpW6rYwBGtengfxTF56n1nw26VC1XBU4Qb4mUqxNmI+0CYaY0nsg9iY
         2drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Djf41xld+0ekM1PIg4SaeNny1ar0p7PgqRVxFha8Hnk=;
        b=BUNfOF0NCAIg1cafgTNGytRe/lp2gu+m8sb7YyjB7Yt47RpopmdK5dtkC5+UM7BOzP
         YIurhAL5aRnZohTsImQgjct3zGhsB03DNkHMs9ll2muH30MrcuIipRfzqWpEpX/tpqaW
         yBIq+g4jih/CGFMknQRtrHwMMT9Qk8aepS04WI2Zjhx6w13ZOWC5tuwVH2JXXMI8njZE
         +L/0+d8q6b4+c8Vp2xqI7yUOGg+EmdpOB83pe8irMxK6XWxgHqsuXSNfD3ge1fOUo+lC
         P5Yu/9mzPXCLkGE0W4pGK4Vh7M++KSF3x7hofDVC4q3cLR8FlJspkvDyapTiUe5Mkf8f
         Q90A==
X-Gm-Message-State: AOAM532DNobKgFEgv6sUb8Xs4USqLsp6Ly5ORgD8DMyJV9BLo0ZhWtJT
        TJbWSZGXuU5QUWEZxXHjazY=
X-Google-Smtp-Source: ABdhPJz41jku3CpjOZ8o/zPZv3evHUlSOUeD8gOsHlWkIkZiS/Uh5AClfwZOAJQwE8NV6k9mQHd06g==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr9701870wmk.51.1637079908625;
        Tue, 16 Nov 2021 08:25:08 -0800 (PST)
Received: from rechenknecht2k11 (200116b8459a9b003f00a60854fcf5ee.dip.versatel-1u1.de. [2001:16b8:459a:9b00:3f00:a608:54fc:f5ee])
        by smtp.googlemail.com with ESMTPSA id 9sm23419825wry.0.2021.11.16.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 08:25:08 -0800 (PST)
Date:   Tue, 16 Nov 2021 17:25:06 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Cameron Gutman <aicommander@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 2/2] Input: xpad - drop checks for XTYPE_UNKNOWN
Message-ID: <20211116172506.234dbf1d@rechenknecht2k11>
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

If xtype is XTYPE_UNKNOWN, it will *always* be replaced by the real
detected type in xpad_probe().

It is therefore not possible to encounter the xtype == XTYPE_UNKNOWN
condition anywhere at the run-time of the driver.

That means we can drop those checks.

Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
---
 drivers/input/joystick/xpad.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 31a268f43b5b..66a12da58619 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1110,13 +1110,10 @@ static void xpad_irq_out(struct urb *urb)
 }
 
 static int xpad_init_output(struct usb_interface *intf, struct usb_xpad *xpad,
-			struct usb_endpoint_descriptor *ep_irq_out)
+			    struct usb_endpoint_descriptor *ep_irq_out)
 {
 	int error;
 
-	if (xpad->xtype == XTYPE_UNKNOWN)
-		return 0;
-
 	init_usb_anchor(&xpad->irq_out_anchor);
 
 	xpad->odata = usb_alloc_coherent(xpad->udev, XPAD_PKT_LEN,
@@ -1148,23 +1145,19 @@ static int xpad_init_output(struct usb_interface *intf, struct usb_xpad *xpad,
 
 static void xpad_stop_output(struct usb_xpad *xpad)
 {
-	if (xpad->xtype != XTYPE_UNKNOWN) {
-		if (!usb_wait_anchor_empty_timeout(&xpad->irq_out_anchor,
-						   5000)) {
-			dev_warn(&xpad->intf->dev,
-				 "timed out waiting for output URB to complete, killing\n");
-			usb_kill_anchored_urbs(&xpad->irq_out_anchor);
-		}
+	if (!usb_wait_anchor_empty_timeout(&xpad->irq_out_anchor,
+					   5000)) {
+		dev_warn(&xpad->intf->dev,
+			 "timed out waiting for output URB to complete, killing\n");
+		usb_kill_anchored_urbs(&xpad->irq_out_anchor);
 	}
 }
 
 static void xpad_deinit_output(struct usb_xpad *xpad)
 {
-	if (xpad->xtype != XTYPE_UNKNOWN) {
-		usb_free_urb(xpad->irq_out);
-		usb_free_coherent(xpad->udev, XPAD_PKT_LEN,
-				xpad->odata, xpad->odata_dma);
-	}
+	usb_free_urb(xpad->irq_out);
+	usb_free_coherent(xpad->udev, XPAD_PKT_LEN,
+			xpad->odata, xpad->odata_dma);
 }
 
 static int xpad_inquiry_pad_presence(struct usb_xpad *xpad)
@@ -1339,9 +1332,6 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
 
 static int xpad_init_ff(struct usb_xpad *xpad)
 {
-	if (xpad->xtype == XTYPE_UNKNOWN)
-		return 0;
-
 	input_set_capability(xpad->dev, EV_FF, FF_RUMBLE);
 
 	return input_ff_create_memless(xpad->dev, NULL, xpad_play_effect);
-- 
2.32.0

