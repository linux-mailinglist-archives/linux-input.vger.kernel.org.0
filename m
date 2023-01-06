Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3DEA65F95C
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 02:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjAFB71 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 20:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjAFB70 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 20:59:26 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE7464EE
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 17:59:25 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso328378pjf.1
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 17:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywybv/yF2WVRYQMqZrha9kuU/T0qN9GFaKQmQOfjLnU=;
        b=KOucshe1DNGfeJ68VV0QjJ0s7BgdOGAnWLfZ0W5zNorUJFu0k2ub6h8p7WCSnHDSDd
         VDQreiSJUZ6usfFvZEh0aNp7khG9BFcx5BXSTaHZ1w0KMe/BvwEQ43qd03+47+LvdjHE
         1kH3409HQgj8DRPLO2bPL9TzV242pdFvoEWm/klPg318buu/w+3jel4Pb8MqV8GOZoLw
         73dijBZJBmm3Trg1Lr7sbwvaJ88v+SCfXIFst2nWWSmmOZppVsYNQHdKarFuGSDHDSwM
         +z2G0qKqVNrQZFmZM968pp5dRnYDcxYStuFyX70Si63qPXhtG23qGV1FjebYfuIEAz+C
         rdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywybv/yF2WVRYQMqZrha9kuU/T0qN9GFaKQmQOfjLnU=;
        b=2+WxH1hwhBmiCg+kzx/vWVXYavwrwkzbWXVm+69BFaBqpKJREOjsXri285iAtphEZm
         W4BohDBCcHssZGBXLC99olMdyVneoN2Zp8iZpsFScEE+8G9s4DX4OSI2F+XEMdAVAWFV
         e5Kxwka9PjCGZy0BdNzEgYvUHux5EiXtoNQyL5Ia8saO4FncaC03BS595biScrffuvCq
         IlX4a8xBtpWx/aft4u+qJdsSlnyTodiOoIkq146EASKSgt4T4+0vwpMygG5/nZMVvGdV
         K7Dp/4MpN6OuIIdm8LfSdjNvFNq2MzSOxogd6BoNiG2+c+FydVqZ/qv0jiHOS6R1xO+W
         QNjQ==
X-Gm-Message-State: AFqh2kprv+bD4dlx5BSdoQJtB/LeM7P3OSfcFZXtfUJkSEzS0VShvP91
        k2k9ykQ2WwrlaKl85rzv6K+pGw==
X-Google-Smtp-Source: AMrXdXt1vmlzc9jRGZQVviD856ZcVO7zMkg9wBXZf5R+tyLcGqYc6Mk1842HQCRcRvWZeo1wd+/zPQ==
X-Received: by 2002:a05:6a21:e384:b0:af:9539:9fc9 with SMTP id cc4-20020a056a21e38400b000af95399fc9mr73407738pzc.47.1672970364915;
        Thu, 05 Jan 2023 17:59:24 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001897a8b537asm26811165plr.221.2023.01.05.17.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 17:59:24 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 4/5] HID: playstation: correct DualShock4 gyro bias handling.
Date:   Thu,  5 Jan 2023 17:59:09 -0800
Message-Id: <20230106015910.3031670-5-roderick.colenbrander@sony.com>
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

The bias for the gyroscope is not used correctly. The sensor bias
needs to be used in calculation of the 'sensivity' instead of being
an offset.

In practice this has little input on the values as the bias values
tends to be small (+/- 20).

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 11bb6caf7412..1001eab6ff75 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1848,19 +1848,22 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	 */
 	speed_2x = (gyro_speed_plus + gyro_speed_minus);
 	ds4->gyro_calib_data[0].abs_code = ABS_RX;
-	ds4->gyro_calib_data[0].bias = gyro_pitch_bias;
+	ds4->gyro_calib_data[0].bias = 0;
 	ds4->gyro_calib_data[0].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
-	ds4->gyro_calib_data[0].sens_denom = gyro_pitch_plus - gyro_pitch_minus;
+	ds4->gyro_calib_data[0].sens_denom = abs(gyro_pitch_plus - gyro_pitch_bias) +
+			abs(gyro_pitch_minus - gyro_pitch_bias);
 
 	ds4->gyro_calib_data[1].abs_code = ABS_RY;
-	ds4->gyro_calib_data[1].bias = gyro_yaw_bias;
+	ds4->gyro_calib_data[1].bias = 0;
 	ds4->gyro_calib_data[1].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
-	ds4->gyro_calib_data[1].sens_denom = gyro_yaw_plus - gyro_yaw_minus;
+	ds4->gyro_calib_data[1].sens_denom = abs(gyro_yaw_plus - gyro_yaw_bias) +
+			abs(gyro_yaw_minus - gyro_yaw_bias);
 
 	ds4->gyro_calib_data[2].abs_code = ABS_RZ;
-	ds4->gyro_calib_data[2].bias = gyro_roll_bias;
+	ds4->gyro_calib_data[2].bias = 0;
 	ds4->gyro_calib_data[2].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
-	ds4->gyro_calib_data[2].sens_denom = gyro_roll_plus - gyro_roll_minus;
+	ds4->gyro_calib_data[2].sens_denom = abs(gyro_roll_plus - gyro_roll_bias) +
+			abs(gyro_roll_minus - gyro_roll_bias);
 
 	/*
 	 * Sanity check gyro calibration data. This is needed to prevent crashes
@@ -2241,8 +2244,7 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	for (i = 0; i < ARRAY_SIZE(ds4_report->gyro); i++) {
 		int raw_data = (short)le16_to_cpu(ds4_report->gyro[i]);
 		int calib_data = mult_frac(ds4->gyro_calib_data[i].sens_numer,
-					   raw_data - ds4->gyro_calib_data[i].bias,
-					   ds4->gyro_calib_data[i].sens_denom);
+					   raw_data, ds4->gyro_calib_data[i].sens_denom);
 
 		input_report_abs(ds4->sensors, ds4->gyro_calib_data[i].abs_code, calib_data);
 	}
-- 
2.38.1

