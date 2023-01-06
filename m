Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68A165F959
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 02:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjAFB70 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 20:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjAFB7Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 20:59:25 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4994D59FA1
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 17:59:23 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v23so137881pju.3
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 17:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q/yuKVRjoakMYSlGhdaHUFr1ncsBSOmYAvw2qMX5d8=;
        b=jVz4Ix8plCSR6xxYoNaV0vP33Nvk6RZLE2wKClOOEEZdrpTPc4CJhIRdq5VRkck2EI
         cwIe44M1VYzgIZuUI/VMxtf26bxZZBnRld6AaOZC61Iq/sylVMi6fsL1unE7oI25Thbp
         w8dvGHN8T+oNT4vgAY+vFCyopxlMF29bxQn4LNEghy7rv2Sx6ZM33s/MqZqZigNb6LSz
         bKV4jMAQLkol92fac7qlzmA5v28YQChrSznHqm2owiEl6rk/oWjDv1jPR/WVyFtQZTRW
         9teQN1Vpixgi822o85yiSRIMba5b+ByN8Efd3eAK350PTtqmEY2o38wLFppJVLfdRRwY
         flIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q/yuKVRjoakMYSlGhdaHUFr1ncsBSOmYAvw2qMX5d8=;
        b=LN+xoLWgtWQJAu3C+UnD0G4CQRTQCX/0wt9N0THyRP/0VFmdcA7fuYy8OR3X0hjfzy
         OWKjyKNm7dBKR8rBEzhfzs3lnuQB9Akvs0Hji2fn4HkbsulHJyymR1fH7Q8xnfcGV+Pg
         ajPFyBgBIzYNCrqiybbaVYNmfBuQsPjaypgF4oHei+XCfnfEMmA8RPQGESth3/862qFl
         DA5FSyP/u/3enynHm5MhzUMNxmmVmyygXkKw9lTe9AYFYZZADJ4AZ0ztFE46tZIV4Ym9
         b18oMFBI9P609RAl2WxOk0NLwYWiH5sbT1GkPRNHZddrLxOhTUx+C6Vxe+KjXm31HsA2
         Rxdw==
X-Gm-Message-State: AFqh2kqIq99ChqXGmjn00TDPC5FhTyhX4epr8zkGAU1s9nLLUOi0rJDj
        bO9CtHHa8SrizQ8Rj3ufm/EK9g==
X-Google-Smtp-Source: AMrXdXu5SYX6jetdXIDZJ9TJbvFKu1+EijF43vnSBKsXcjfdnevRtGutah0NEySHa2lxQYzSCYdh0Q==
X-Received: by 2002:a17:902:a5cc:b0:192:f999:1e73 with SMTP id t12-20020a170902a5cc00b00192f9991e73mr5823869plq.51.1672970362804;
        Thu, 05 Jan 2023 17:59:22 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001897a8b537asm26811165plr.221.2023.01.05.17.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 17:59:22 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Alain Carlucci <alain.carlucci@gmail.com>
Subject: [PATCH 2/5] HID: playstation: sanity check DualShock4 calibration data.
Date:   Thu,  5 Jan 2023 17:59:07 -0800
Message-Id: <20230106015910.3031670-3-roderick.colenbrander@sony.com>
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

Some DualShock4 devices report invalid calibration data resulting
in kernel oopses due to division by zero during report handling.

The devices affected generally appear to be clone devices, which don't
implement all reports properly and don't populate proper calibration
data. The issue may have been seen on an official device with erased
calibration reports.

This patch prevents the crashes by essentially disabling calibration
when invalid values are detected.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Tested-by: Alain Carlucci <alain.carlucci@gmail.com>
---
 drivers/hid/hid-playstation.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 866cc4e94320..783ce9fd396e 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1737,6 +1737,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	int speed_2x;
 	int range_2g;
 	int ret = 0;
+	int i;
 	uint8_t *buf;
 
 	if (ds4->base.hdev->bus == BUS_USB) {
@@ -1829,6 +1830,21 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	ds4->gyro_calib_data[2].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
 	ds4->gyro_calib_data[2].sens_denom = gyro_roll_plus - gyro_roll_minus;
 
+	/*
+	 * Sanity check gyro calibration data. This is needed to prevent crashes
+	 * during report handling of virtual, clone or broken devices not implementing
+	 * calibration data properly.
+	 */
+	for (i = 0; i < ARRAY_SIZE(ds4->gyro_calib_data); i++) {
+		if (ds4->gyro_calib_data[i].sens_denom == 0) {
+			hid_warn(hdev, "Invalid gyro calibration data for axis (%d), disabling calibration.",
+					ds4->gyro_calib_data[i].abs_code);
+			ds4->gyro_calib_data[i].bias = 0;
+			ds4->gyro_calib_data[i].sens_numer = DS4_GYRO_RANGE;
+			ds4->gyro_calib_data[i].sens_denom = S16_MAX;
+		}
+	}
+
 	/*
 	 * Set accelerometer calibration and normalization parameters.
 	 * Data values will be normalized to 1/DS4_ACC_RES_PER_G g.
@@ -1851,6 +1867,21 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	ds4->accel_calib_data[2].sens_numer = 2*DS4_ACC_RES_PER_G;
 	ds4->accel_calib_data[2].sens_denom = range_2g;
 
+	/*
+	 * Sanity check accelerometer calibration data. This is needed to prevent crashes
+	 * during report handling of virtual, clone or broken devices not implementing calibration
+	 * data properly.
+	 */
+	for (i = 0; i < ARRAY_SIZE(ds4->accel_calib_data); i++) {
+		if (ds4->accel_calib_data[i].sens_denom == 0) {
+			hid_warn(hdev, "Invalid accelerometer calibration data for axis (%d), disabling calibration.",
+					ds4->accel_calib_data[i].abs_code);
+			ds4->accel_calib_data[i].bias = 0;
+			ds4->accel_calib_data[i].sens_numer = DS4_ACC_RANGE;
+			ds4->accel_calib_data[i].sens_denom = S16_MAX;
+		}
+	}
+
 err_free:
 	kfree(buf);
 	return ret;
-- 
2.38.1

