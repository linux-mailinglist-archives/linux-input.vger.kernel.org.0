Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6260F4C6421
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 08:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiB1Hzb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 02:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiB1Hza (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 02:55:30 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886F145521
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:52 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id bc27so1822295pgb.4
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hOlepmP4ZU+cG5hVHf3h4lPQRDIfJJkyTKWIgz4x6tY=;
        b=mapqY4JoY0+YygJGCtF8yqSScZsm8gLsAPMWQ30nFr4KhsFp1Wl/FOhzU1J5d/ZyBZ
         M4B8XDRCFR1eUrwHkf4Ro5uYy+Hv3FqvtYc9QFzF5Vop3d1gyWVCCHNA7m1GN+KzFH11
         e0IvICSHxgLj0HHjT2Z0kr0HcPVCdkfL1iO8Bqr3Mf6Y+nx01Ly3HmdNLtBDljuoH0Jc
         4Pcjpdb7c1VgpEj87wITHBYzYwVtWGpVzeS8B+KZP+ksdjIFlojfwo/MWBBwoWZ5kO26
         tIvY8O2syboAzFGvfV1dwYQXLYhHLgX3OEPi3bbCi+o3LBMw8x31pkw4aZ4QtU7Z+yT8
         44Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hOlepmP4ZU+cG5hVHf3h4lPQRDIfJJkyTKWIgz4x6tY=;
        b=4pCYkn2jlmS3KwlMjgmFWBVYgLK32Zg6Q2omglJAiSYPrDsdtlIAfohAw0IwMYyvc+
         lyo0OLsp7go/JB8rQhxXWACXIQWSTc6gqqdcJS5oihVzGVIv5CJ6SKIx2L17+sSj8dtm
         oQ+x5M+eMSEy2Do3aWmNRzEMhToj9hidVePUMvOYZIf1h/lqE5b0B5L3d7404dUobdjC
         PixgwHYoMt3ZYiECe1uBeBPSIPpqIInHS5w7WGZ/YBqW+y2MGWRFzg7+af+JZjghFOaK
         5RbIESbCPZePI8jhpcysjQ9H88Lh1h7HWHRpv3HUSKzyvNWYtEJYOfBG+6Q81SoZMz/2
         ELtQ==
X-Gm-Message-State: AOAM532c6bI7b+QiTAYS5rrJlhdxJbCsFsuWhI5Z39mNGyg3JnWZeRjA
        PYxhJ0NWICgaEzh2ZH1KWaTXHEjiRQk=
X-Google-Smtp-Source: ABdhPJwiVTlQ1YWjghTBeqQdPt8bAcjReadejX1Ye5JpmywIUCRYc5X9q7c9uaZ5q6tYRdv7qpaQlQ==
X-Received: by 2002:aa7:928c:0:b0:4f3:dca7:8b37 with SMTP id j12-20020aa7928c000000b004f3dca78b37mr13573920pfa.41.1646034891448;
        Sun, 27 Feb 2022 23:54:51 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:43a2:93b6:ebd7:94fd])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090ac24d00b001bcd7c2b2c3sm10718517pjx.16.2022.02.27.23.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 23:54:50 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>, benjamin.tissoires@redhat.com,
        Jiri Kosina <jikos@kernel.org>,
        Sean O'Brien <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>
Subject: [PATCH v5 1/5] HID: google: switch to devm when registering keyboard backlight LED
Date:   Sun, 27 Feb 2022 23:54:42 -0800
Message-Id: <20220228075446.466016-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
In-Reply-To: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We can use devm to register keyboard backlight LED on hammer devices, this
will allow us to use HID's driver data for something else later.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-google-hammer.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 0403beb3104b..e7da4e74b4bf 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -340,9 +340,9 @@ static int hammer_kbd_brightness_set_blocking(struct led_classdev *cdev,
 static int hammer_register_leds(struct hid_device *hdev)
 {
 	struct hammer_kbd_leds *kbd_backlight;
-	int error;
 
-	kbd_backlight = kzalloc(sizeof(*kbd_backlight), GFP_KERNEL);
+	kbd_backlight = devm_kzalloc(&hdev->dev, sizeof(*kbd_backlight),
+				     GFP_KERNEL);
 	if (!kbd_backlight)
 		return -ENOMEM;
 
@@ -356,26 +356,7 @@ static int hammer_register_leds(struct hid_device *hdev)
 	/* Set backlight to 0% initially. */
 	hammer_kbd_brightness_set_blocking(&kbd_backlight->cdev, 0);
 
-	error = led_classdev_register(&hdev->dev, &kbd_backlight->cdev);
-	if (error)
-		goto err_free_mem;
-
-	hid_set_drvdata(hdev, kbd_backlight);
-	return 0;
-
-err_free_mem:
-	kfree(kbd_backlight);
-	return error;
-}
-
-static void hammer_unregister_leds(struct hid_device *hdev)
-{
-	struct hammer_kbd_leds *kbd_backlight = hid_get_drvdata(hdev);
-
-	if (kbd_backlight) {
-		led_classdev_unregister(&kbd_backlight->cdev);
-		kfree(kbd_backlight);
-	}
+	return devm_led_classdev_register(&hdev->dev, &kbd_backlight->cdev);
 }
 
 #define HID_UP_GOOGLEVENDOR	0xffd10000
@@ -512,6 +493,11 @@ static void hammer_get_folded_state(struct hid_device *hdev)
 	kfree(buf);
 }
 
+static void hammer_stop(void *hdev)
+{
+	hid_hw_stop(hdev);
+}
+
 static int hammer_probe(struct hid_device *hdev,
 			const struct hid_device_id *id)
 {
@@ -525,6 +511,10 @@ static int hammer_probe(struct hid_device *hdev,
 	if (error)
 		return error;
 
+	error = devm_add_action(&hdev->dev, hammer_stop, hdev);
+	if (error)
+		return error;
+
 	/*
 	 * We always want to poll for, and handle tablet mode events from
 	 * devices that have folded usage, even when nobody has opened the input
@@ -577,9 +567,7 @@ static void hammer_remove(struct hid_device *hdev)
 		spin_unlock_irqrestore(&cbas_ec_lock, flags);
 	}
 
-	hammer_unregister_leds(hdev);
-
-	hid_hw_stop(hdev);
+	/* Unregistering LEDs and stopping the hardware is done via devm */
 }
 
 static const struct hid_device_id hammer_devices[] = {
-- 
2.35.1.574.g5d30c73bfb-goog

