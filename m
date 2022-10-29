Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA0EC6124FC
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJ2Stj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ2Stj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:39 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725912702
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:37 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id g62so7413370pfb.10
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QK+eBK7A6uWNiH4WHfbTPt08tvNWgQQn7I20CNk5Tk=;
        b=V0h4mmVGqIw514TRn+FHb4/ivL9mri5VZTFAGBwJIikaA3iCpTJ9Xx0Ds4sf0YVRJn
         vEAvXj60SrlEBVjcTkgRW8/0iCyDBU65kvKiUH+ccJvq/ufaLFie5dCcCm0Ai5y6QMlK
         vAwRzp+r5SUlKbJY55FIknqHtJkeJD+tgfx7cSFB1sbacLEJtmD2D+69BJq4N6wPi5xs
         zFXpQWHEBsFSiMZ2vM3d+8Ev2r27lDsDBSxT/uMq3GKdArzIbQUCO6/UWWYJCTw0uT9/
         YddMLKTVUF4BtuqoCLmB0ouVEYvDJfVLM+KhQ1vVYR6oC3QStFGMg3VbD+EYFskhQQ6k
         dp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QK+eBK7A6uWNiH4WHfbTPt08tvNWgQQn7I20CNk5Tk=;
        b=EaySLaZHSRvN8HqmsC1czhTvehtD6noeTL8n9uXdYT/1Xy3TcdEnPNHTwGyrULzspw
         YoIIoT8GIzQ5VVcHgX/A/2L5TLnFRcUsunCUQj0jVBEqTSUnRKKHxuXJLS+ZluO/lIyk
         Fp83pOuLRrpZK9DgpkAjqpx2LDscttPkqkLukyhXhqs5UTHfuNnBhJjB+1R5BAcJmJko
         mnbzaiTS97KeatxdraiXFF7tt58v8ixJAgsjWMPRxkK2fxyixM9Kk45U2GRU3plpMH5m
         qyMR9L4LpFT0c6j/7vnCsRhkBEvpFsfH8pZVN7BnzGxVXpIHVigHmgU40fmIToUKC47J
         QAFg==
X-Gm-Message-State: ACrzQf3saliHhfCE7qdu3ybpyyWMc2Sw+XMJXfCiQpIMBBCphiUs1Mys
        DvKKvO75PsCqec9oOK92D7viDg==
X-Google-Smtp-Source: AMsMyM4tpQk7pCXaQBhnd/iYcVz8hbWWNMaM4HuYNjBUJ4IsrLyVbrems0TeyMyZgFbrTZONoz0WOg==
X-Received: by 2002:a63:5063:0:b0:46e:cd36:ce0c with SMTP id q35-20020a635063000000b0046ecd36ce0cmr5114494pgl.617.1667069376917;
        Sat, 29 Oct 2022 11:49:36 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:36 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 10/13] HID: playstation: add option to ignore CRC in ps_get_report.
Date:   Sat, 29 Oct 2022 11:48:48 -0700
Message-Id: <20221029184851.282366-11-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds a parameter to ps_get_report to ignore CRC checks.
This prepares for DualShock4, which has some HID reports, which lack CRC.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 7ceb37f04d24..81a12aafed17 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -672,7 +672,8 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev,
 	return gamepad;
 }
 
-static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *buf, size_t size)
+static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *buf, size_t size,
+		bool check_crc)
 {
 	int ret;
 
@@ -693,7 +694,7 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 		return -EINVAL;
 	}
 
-	if (hdev->bus == BUS_BLUETOOTH) {
+	if (hdev->bus == BUS_BLUETOOTH && check_crc) {
 		/* Last 4 bytes contains crc32. */
 		uint8_t crc_offset = size - 4;
 		uint32_t report_crc = get_unaligned_le32(&buf[crc_offset]);
@@ -894,7 +895,7 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 		return -ENOMEM;
 
 	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_CALIBRATION, buf,
-			DS_FEATURE_REPORT_CALIBRATION_SIZE);
+			DS_FEATURE_REPORT_CALIBRATION_SIZE, true);
 	if (ret) {
 		hid_err(ds->base.hdev, "Failed to retrieve DualSense calibration info: %d\n", ret);
 		goto err_free;
@@ -976,7 +977,7 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
 		return -ENOMEM;
 
 	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_FIRMWARE_INFO, buf,
-			DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE);
+			DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, true);
 	if (ret) {
 		hid_err(ds->base.hdev, "Failed to retrieve DualSense firmware info: %d\n", ret);
 		goto err_free;
@@ -1009,7 +1010,7 @@ static int dualsense_get_mac_address(struct dualsense *ds)
 		return -ENOMEM;
 
 	ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_PAIRING_INFO, buf,
-			DS_FEATURE_REPORT_PAIRING_INFO_SIZE);
+			DS_FEATURE_REPORT_PAIRING_INFO_SIZE, true);
 	if (ret) {
 		hid_err(ds->base.hdev, "Failed to retrieve DualSense pairing info: %d\n", ret);
 		goto err_free;
@@ -1650,7 +1651,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 		return -ENOMEM;
 
 	ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
-			DS4_FEATURE_REPORT_CALIBRATION_SIZE);
+			DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
 	if (ret) {
 		hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
 		goto err_free;
@@ -1731,7 +1732,7 @@ static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
 		return -ENOMEM;
 
 	ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_FIRMWARE_INFO, buf,
-			DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE);
+			DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, true);
 	if (ret) {
 		hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 firmware info: %d\n", ret);
 		goto err_free;
@@ -1755,7 +1756,7 @@ static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 		return -ENOMEM;
 
 	ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_PAIRING_INFO, buf,
-			DS4_FEATURE_REPORT_PAIRING_INFO_SIZE);
+			DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, true);
 	if (ret) {
 		hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 pairing info: %d\n", ret);
 		goto err_free;
-- 
2.37.3

