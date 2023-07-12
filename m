Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F001A7507BC
	for <lists+linux-input@lfdr.de>; Wed, 12 Jul 2023 14:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjGLMMC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jul 2023 08:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbjGLMMB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jul 2023 08:12:01 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788EAE70
        for <linux-input@vger.kernel.org>; Wed, 12 Jul 2023 05:11:58 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbb634882dso16323445e9.0
        for <linux-input@vger.kernel.org>; Wed, 12 Jul 2023 05:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689163916; x=1691755916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CRlLJCgO+RmIPuEcacAs1FU8A6fMGzN4OqlZ18qlZzc=;
        b=aLTC3Ty23lc9DDFtc3aQdNolrrTQihde1KDmEsQNHVx0O7CpgkP+B6jlpORsajnyaY
         TE1aMWkmS1RxEsZZ94ayAOLVNf0zPeiKjZzHFeVkSYs0IUR5yIXoNv3grsGebspbrkR8
         r4DoZPQZjFgxxVZx/GzZpbB9Hcur0aOln6nWX6llhFiVOEvodwm3igoblKLJ9ZPFKAK2
         EgblS1J+6yPd7HZwvu8dKrxhTu/sRAmUI01EZQXx+f9dh3E9/sy3kTqvxi5ow/G+aL3R
         Zibhne0VsB4R1EOa/bonSrvUcK8B/T3ncuKtlLtbf2Sok4bPe9/tqTUsdqodqaCaalnA
         +dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163916; x=1691755916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRlLJCgO+RmIPuEcacAs1FU8A6fMGzN4OqlZ18qlZzc=;
        b=lSniIZI4upxFEWWmYbzpKDzdOHaEdpbSfsYCS6wxPlW9lPXBWOfmwNKpVUrSJLOHVk
         Qr46LWY5J4rlqLEDfuYpir/mNm/3vrwByQo1pWaPiSN+Tr2qEK6jp80IFv5HKOvQtcdh
         4pwKWryLaTriWCccp+BOcwrGV7B97DDBM/CjEc7J1aQkwZ7u5cfVjjmXziuVzn2+X3yY
         LQ/rlpxfAc0r19Z/1GDHvWrzQqeN3wSUZ2es4lrw7q2qFzYYYhwzQPGjsWSyKSoW1mMZ
         E8Sm+Anxuht9/W61mjdtMTwrkObSRrQOVOaXttES7h/ojishTk+NoXmRwCsDlozrFBLw
         tQLQ==
X-Gm-Message-State: ABy/qLa7U8YY1rZ8K0zFNK1MFfJ5LynjVdNBGWV6llAIHPs1mjebnVQG
        9vQzDw29rgGWK3BoJcnnjEXaexs1hyOTyeIy
X-Google-Smtp-Source: APBJJlHihyzrCv6MskWZ8I7t2O1MEH50eUXs5XAa5v6QNeYtiWXfS2mycqJt7l9pvVxC0Co7sf4SEw==
X-Received: by 2002:a05:600c:82c6:b0:3f7:fb5d:6e7a with SMTP id eo6-20020a05600c82c600b003f7fb5d6e7amr17679213wmb.0.1689163916490;
        Wed, 12 Jul 2023 05:11:56 -0700 (PDT)
Received: from desktop-nixos-martino.. ([2a01:e11:5004:180:d78d:7025:f56d:7969])
        by smtp.gmail.com with ESMTPSA id z13-20020adfe54d000000b003143ac73fd0sm5022066wrm.1.2023.07.12.05.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:11:55 -0700 (PDT)
From:   Martino Fontana <tinozzo123@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Martino Fontana <tinozzo123@gmail.com>
Subject: [PATCH] HID: nintendo: reinitialize USB Pro Controller after resuming from suspend
Date:   Wed, 12 Jul 2023 14:10:35 +0200
Message-ID: <20230712121042.25318-2-tinozzo123@gmail.com>
X-Mailer: git-send-email 2.41.0
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

When suspending the computer, a Switch Pro Controller connected via USB will lose its internal status.
However, because the USB connection was technically never lost, when resuming the computer, the driver will attempt to communicate with the controller as if nothing happened (and fail).
Because of this, the user was forced to manually disconnect the controller (or to press the sync button on the controller to power it off), so that it can be re-initialized.

With this patch, the controller will be automatically re-initialized after resuming from suspend.
Fixes https://bugzilla.kernel.org/show_bug.cgi?id=216233

Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
---
 drivers/hid/hid-nintendo.c | 178 ++++++++++++++++++++++---------------
 1 file changed, 106 insertions(+), 72 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 250f5d2f8..586c7f8d7 100644
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
+	.resume	          = nintendo_hid_resume,
+#endif
 };
 module_hid_driver(nintendo_hid_driver);
 
-- 
2.41.0

