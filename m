Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5228875BB46
	for <lists+linux-input@lfdr.de>; Fri, 21 Jul 2023 01:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjGTXer (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jul 2023 19:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjGTXen (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jul 2023 19:34:43 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357AE2D59
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 16:34:20 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbb634882dso2540575e9.0
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689896029; x=1690500829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ipipDHt0jZKIupIacxBOM+xJYaWh8GBMEwxUkq3jjE=;
        b=jREorbYWY/EUF8Ky+QkfJhPA8uwjNEWsGYNw9ufB1t+iQ5j9skRpGmHb6WWSJkvlna
         wwc3sbUbZY1S0QlZSfNXx75EhflXIGyQ+Ak63FafYGI/FImDF8kht9cZR+hHpB+C0EqG
         YiJZHjETdWaQbsTK+qBYnfJ0WPvjbOcHgmZfgWZlr0gwu3HDIAbI5fMSyqwfjIDWyTXh
         coReT2tTxlKd19mFhZowCLDlF9MBx01z/yzfnAoeRySegYChtS/Ubq1sY8kQe2Wn9o7i
         x2FNviy+61qePvKypie/YG+fcqWdvnhXC+vbL8AS4O4YzOq/6HISp9HyidWM9i2pHs3Z
         B3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689896029; x=1690500829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ipipDHt0jZKIupIacxBOM+xJYaWh8GBMEwxUkq3jjE=;
        b=ILmXNKjvUjm2T/WNnPtEp7hRyYa/S5r7hU2pw0YLlsz6PmB7Uf4OvoS6jrjdxWG7M+
         BI53gHk2JPYha3hEFAsxzV32DbhrTxiA9Ljqq9AqhTRAVqqr5vaf+WX7Lme6gknp/y9q
         W6e9Cy53pRTUFegkvL7QoVW+q5n0pbZxPytQ0JLxWvM/DAZjMbv6kiPkKeXxuJTFzQd2
         3wLPNdTipOs0YAPX+4MkwAtWywuNILWHaAGhK3tvgPi5JYyp1yo+8Ytz2RzTGvJBLnGe
         bf/4GAatEbv/4tXehuA0+QpSC5MoTw7cnvtmjsyBWQms6QZoSdT2pgaxaPhAOlEZeYTO
         mBgg==
X-Gm-Message-State: ABy/qLbjPbEiG+ut4EDCrArzdGeoll9EyFY3cV/GorhKyHtPPdQaYtC6
        +Na05V7Lre5ttdX5Aguu48lHjLM7FJO7LY/f
X-Google-Smtp-Source: APBJJlHVe+sQk5sqEr+YIihmBsRTBJYDKUFLXQ2WvsWRr3uwg2wtbAu+bGQATQKyNDMSJYoInxo21Q==
X-Received: by 2002:a05:600c:5122:b0:3fb:a651:c153 with SMTP id o34-20020a05600c512200b003fba651c153mr229021wms.2.1689896029231;
        Thu, 20 Jul 2023 16:33:49 -0700 (PDT)
Received: from desktop-nixos-martino.. ([2a01:e11:5004:180:a934:cb01:16f4:5941])
        by smtp.gmail.com with ESMTPSA id hn32-20020a05600ca3a000b003f9bd9e3226sm2187812wmb.7.2023.07.20.16.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 16:33:48 -0700 (PDT)
From:   Martino Fontana <tinozzo123@gmail.com>
To:     s.jegen@gmail.com
Cc:     linux-input@vger.kernel.org, tinozzo123@gmail.com
Subject: [PATCH v2] HID: nintendo: reinitialize USB Pro Controller after resuming from suspend
Date:   Fri, 21 Jul 2023 01:31:51 +0200
Message-ID: <20230720233150.57164-2-tinozzo123@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <27ZF1I9PL9SUH.27UHPHBWRZ1LC@homearch.localdomain>
References: <27ZF1I9PL9SUH.27UHPHBWRZ1LC@homearch.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When suspending the computer, a Switch Pro Controller connected via USB will
lose its internal status. However, because the USB connection was technically
never lost, when resuming the computer, the driver will attempt to communicate
with the controller as if nothing happened (and fail).
Because of this, the user was forced to manually disconnect the controller
(or to press the sync button on the controller to power it off), so that it
can be re-initialized.

With this patch, the controller will be automatically re-initialized after
resuming from suspend.

Fixes https://bugzilla.kernel.org/show_bug.cgi?id=216233

Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
---
 drivers/hid/hid-nintendo.c | 178 ++++++++++++++++++++++---------------
 1 file changed, 106 insertions(+), 72 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 250f5d2f8..a5ebe857a 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2088,7 +2088,9 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
 	struct joycon_input_report *report;
 
 	req.subcmd_id = JC_SUBCMD_REQ_DEV_INFO;
+	mutex_lock(&ctlr->output_mutex);
 	ret = joycon_send_subcmd(ctlr, &req, 0, HZ);
+	mutex_unlock(&ctlr->output_mutex);
 	if (ret) {
 		hid_err(ctlr->hdev, "Failed to get joycon info; ret=%d\n", ret);
 		return ret;
@@ -2117,6 +2119,88 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
 	return 0;
 }
 
+static int joycon_init(struct hid_device *hdev)
+{
+	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
+	int ret = 0;
+
+	mutex_lock(&ctlr->output_mutex);
+	/* if handshake command fails, assume ble pro controller */
+	if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
+	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
+		hid_dbg(hdev, "detected USB controller\n");
+		/* set baudrate for improved latency */
+		ret = joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ);
+		if (ret) {
+			hid_err(hdev, "Failed to set baudrate; ret=%d\n", ret);
+			goto err_mutex;
+		}
+		/* handshake */
+		ret = joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ);
+		if (ret) {
+			hid_err(hdev, "Failed handshake; ret=%d\n", ret);
+			goto err_mutex;
+		}
+		/*
+		 * Set no timeout (to keep controller in USB mode).
+		 * This doesn't send a response, so ignore the timeout.
+		 */
+		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
+	} else if (jc_type_is_chrggrip(ctlr)) {
+		hid_err(hdev, "Failed charging grip handshake\n");
+		ret = -ETIMEDOUT;
+		goto err_mutex;
+	}
+
+	/* get controller calibration data, and parse it */
+	ret = joycon_request_calibration(ctlr);
+	if (ret) {
+		/*
+		 * We can function with default calibration, but it may be
+		 * inaccurate. Provide a warning, and continue on.
+		 */
+		hid_warn(hdev, "Analog stick positions may be inaccurate\n");
+	}
+
+	/* get IMU calibration data, and parse it */
+	ret = joycon_request_imu_calibration(ctlr);
+	if (ret) {
+		/*
+		 * We can function with default calibration, but it may be
+		 * inaccurate. Provide a warning, and continue on.
+		 */
+		hid_warn(hdev, "Unable to read IMU calibration data\n");
+	}
+
+	/* Set the reporting mode to 0x30, which is the full report mode */
+	ret = joycon_set_report_mode(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to set report mode; ret=%d\n", ret);
+		goto err_mutex;
+	}
+
+	/* Enable rumble */
+	ret = joycon_enable_rumble(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to enable rumble; ret=%d\n", ret);
+		goto err_mutex;
+	}
+
+	/* Enable the IMU */
+	ret = joycon_enable_imu(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to enable the IMU; ret=%d\n", ret);
+		goto err_mutex;
+	}
+
+	mutex_unlock(&ctlr->output_mutex);
+	return 0;
+
+err_mutex:
+	mutex_unlock(&ctlr->output_mutex);
+	return ret;
+}
+
 /* Common handler for parsing inputs */
 static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data,
 							      int size)
@@ -2248,85 +2332,19 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 
 	hid_device_io_start(hdev);
 
-	/* Initialize the controller */
-	mutex_lock(&ctlr->output_mutex);
-	/* if handshake command fails, assume ble pro controller */
-	if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
-	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
-		hid_dbg(hdev, "detected USB controller\n");
-		/* set baudrate for improved latency */
-		ret = joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ);
-		if (ret) {
-			hid_err(hdev, "Failed to set baudrate; ret=%d\n", ret);
-			goto err_mutex;
-		}
-		/* handshake */
-		ret = joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ);
-		if (ret) {
-			hid_err(hdev, "Failed handshake; ret=%d\n", ret);
-			goto err_mutex;
-		}
-		/*
-		 * Set no timeout (to keep controller in USB mode).
-		 * This doesn't send a response, so ignore the timeout.
-		 */
-		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
-	} else if (jc_type_is_chrggrip(ctlr)) {
-		hid_err(hdev, "Failed charging grip handshake\n");
-		ret = -ETIMEDOUT;
-		goto err_mutex;
-	}
-
-	/* get controller calibration data, and parse it */
-	ret = joycon_request_calibration(ctlr);
-	if (ret) {
-		/*
-		 * We can function with default calibration, but it may be
-		 * inaccurate. Provide a warning, and continue on.
-		 */
-		hid_warn(hdev, "Analog stick positions may be inaccurate\n");
-	}
-
-	/* get IMU calibration data, and parse it */
-	ret = joycon_request_imu_calibration(ctlr);
-	if (ret) {
-		/*
-		 * We can function with default calibration, but it may be
-		 * inaccurate. Provide a warning, and continue on.
-		 */
-		hid_warn(hdev, "Unable to read IMU calibration data\n");
-	}
-
-	/* Set the reporting mode to 0x30, which is the full report mode */
-	ret = joycon_set_report_mode(ctlr);
-	if (ret) {
-		hid_err(hdev, "Failed to set report mode; ret=%d\n", ret);
-		goto err_mutex;
-	}
-
-	/* Enable rumble */
-	ret = joycon_enable_rumble(ctlr);
-	if (ret) {
-		hid_err(hdev, "Failed to enable rumble; ret=%d\n", ret);
-		goto err_mutex;
-	}
-
-	/* Enable the IMU */
-	ret = joycon_enable_imu(ctlr);
+	ret = joycon_init(hdev);
 	if (ret) {
-		hid_err(hdev, "Failed to enable the IMU; ret=%d\n", ret);
-		goto err_mutex;
+		hid_err(hdev, "Failed to initialize controller; ret=%d\n", ret);
+		goto err_close;
 	}
 
 	ret = joycon_read_info(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to retrieve controller info; ret=%d\n",
 			ret);
-		goto err_mutex;
+		goto err_close;
 	}
 
-	mutex_unlock(&ctlr->output_mutex);
-
 	/* Initialize the leds */
 	ret = joycon_leds_create(ctlr);
 	if (ret) {
@@ -2352,8 +2370,6 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	hid_dbg(hdev, "probe - success\n");
 	return 0;
 
-err_mutex:
-	mutex_unlock(&ctlr->output_mutex);
 err_close:
 	hid_hw_close(hdev);
 err_stop:
@@ -2383,6 +2399,20 @@ static void nintendo_hid_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
+#ifdef CONFIG_PM
+
+static int nintendo_hid_resume(struct hid_device *hdev)
+{
+	int ret = joycon_init(hdev);
+
+	if (ret)
+		hid_err(hdev, "Failed to restore controller after resume");
+
+	return ret;
+}
+
+#endif
+
 static const struct hid_device_id nintendo_hid_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
@@ -2404,6 +2434,10 @@ static struct hid_driver nintendo_hid_driver = {
 	.probe		= nintendo_hid_probe,
 	.remove		= nintendo_hid_remove,
 	.raw_event	= nintendo_hid_event,
+
+#ifdef CONFIG_PM
+	.resume		= nintendo_hid_resume,
+#endif
 };
 module_hid_driver(nintendo_hid_driver);
 
-- 
2.41.0

