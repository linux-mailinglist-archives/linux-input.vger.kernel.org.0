Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6ADF65F95B
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 02:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjAFB71 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 20:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjAFB7Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 20:59:25 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DBB59FA2
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 17:59:24 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so352622pjd.0
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 17:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+CpugAzMZ+0pmHShY9GZuJJGn7DazaPnxuhhJHzogs=;
        b=PxRMH8b2owZn0RVjX0BPJ++27K8nWn/4MLpO3cyu77APLNmCd8RK8DJxSU+b21VIW2
         WcQwDKma1vZwLDmTAvFxYV4zh7mfh5nw4ymgAJpTwil7bNa43jzlPEI5FZSQ7fcn6yeU
         w3icHPVP6ExIQhmLUCw05BT0n7YccXBXTC2RiTOCvPhf7oRXNajs46gNlV6FPN7uhyfy
         TqcrgMZzROWyLdc3sf6wN/t7gJsUDiCfG7nLzwgTm9Kx7N2FSxg+ICu342bgpH+SdR6X
         7SfEUxka//lPC32t6FQy7rzTKNYbMs1Ycq5nOocxlhFAQ7QHMp8c0e9sq18IYTZDxFtS
         kuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+CpugAzMZ+0pmHShY9GZuJJGn7DazaPnxuhhJHzogs=;
        b=vNrpR6UmqqT4eQJVR1S87TgIuR6Xux+sIfHTzvP15WvTg6HlqFdxYCaAw+o/rkeOzN
         YuXmP4qJawUQP/j6/9E5yuMKrZt2gxleI9zbbSu9hTi0ZJLFG6m5SnsJisy6SmKYaV58
         Zuk8oXBpRbHL2jpeXQJx34foZpr0BrS1IXhMYBfoDauFwQZrkfN0ZMpNIt2UVnb6Rki8
         woWj44sN+Fp8xwoH/BqNgViHisI4nI/nUe0+4RAj+hghO2X4MWAwOMoqd29br5ocQ1KI
         Du49NB41YGJPonWuM3EwYCwEw7jdlph/8ng6043CDoWKwWvIlARRUBnDfDimGYRj0xD2
         jd7g==
X-Gm-Message-State: AFqh2krhBsB78AbQviky6gPDhqjFPX1W3vNyhAa7MByngbqQ9QYFLVtx
        bOrpSVtQ7IYvAe3XfLIMPRbgLg==
X-Google-Smtp-Source: AMrXdXtpo/p5cOfciy9g1fLSX0S9OczDZjRnhFq8AxjRs1CxvGQzrjky+rslT2K1YKogMOnBWnHXsg==
X-Received: by 2002:a17:902:8601:b0:189:c4a9:c5e8 with SMTP id f1-20020a170902860100b00189c4a9c5e8mr51107984plo.45.1672970363849;
        Thu, 05 Jan 2023 17:59:23 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001897a8b537asm26811165plr.221.2023.01.05.17.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 17:59:23 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 3/5] HID: playstation: sanity check DualSense calibration data.
Date:   Thu,  5 Jan 2023 17:59:08 -0800
Message-Id: <20230106015910.3031670-4-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106015910.3031670-1-roderick.colenbrander@sony.com>
References: <20230106015910.3031670-1-roderick.colenbrander@sony.com>
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

Make sure calibration values are defined to prevent potential kernel
crashes. This fixes a hypothetical issue for virtual or clone devices
inspired by a similar fix for DS4.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 783ce9fd396e..11bb6caf7412 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -944,6 +944,7 @@ ATTRIBUTE_GROUPS(ps_device);
 
 static int dualsense_get_calibration_data(struct dualsense *ds)
 {
+	struct hid_device *hdev = ds->base.hdev;
 	short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
 	short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
 	short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
@@ -954,6 +955,7 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	int speed_2x;
 	int range_2g;
 	int ret = 0;
+	int i;
 	uint8_t *buf;
 
 	buf = kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
@@ -1005,6 +1007,21 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	ds->gyro_calib_data[2].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
 	ds->gyro_calib_data[2].sens_denom = gyro_roll_plus - gyro_roll_minus;
 
+	/*
+	 * Sanity check gyro calibration data. This is needed to prevent crashes
+	 * during report handling of virtual, clone or broken devices not implementing
+	 * calibration data properly.
+	 */
+	for (i = 0; i < ARRAY_SIZE(ds->gyro_calib_data); i++) {
+		if (ds->gyro_calib_data[i].sens_denom == 0) {
+			hid_warn(hdev, "Invalid gyro calibration data for axis (%d), disabling calibration.",
+					ds->gyro_calib_data[i].abs_code);
+			ds->gyro_calib_data[i].bias = 0;
+			ds->gyro_calib_data[i].sens_numer = DS_GYRO_RANGE;
+			ds->gyro_calib_data[i].sens_denom = S16_MAX;
+		}
+	}
+
 	/*
 	 * Set accelerometer calibration and normalization parameters.
 	 * Data values will be normalized to 1/DS_ACC_RES_PER_G g.
@@ -1027,6 +1044,21 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	ds->accel_calib_data[2].sens_numer = 2*DS_ACC_RES_PER_G;
 	ds->accel_calib_data[2].sens_denom = range_2g;
 
+	/*
+	 * Sanity check accelerometer calibration data. This is needed to prevent crashes
+	 * during report handling of virtual, clone or broken devices not implementing calibration
+	 * data properly.
+	 */
+	for (i = 0; i < ARRAY_SIZE(ds->accel_calib_data); i++) {
+		if (ds->accel_calib_data[i].sens_denom == 0) {
+			hid_warn(hdev, "Invalid accelerometer calibration data for axis (%d), disabling calibration.",
+					ds->accel_calib_data[i].abs_code);
+			ds->accel_calib_data[i].bias = 0;
+			ds->accel_calib_data[i].sens_numer = DS_ACC_RANGE;
+			ds->accel_calib_data[i].sens_denom = S16_MAX;
+		}
+	}
+
 err_free:
 	kfree(buf);
 	return ret;
-- 
2.38.1

