Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629A865F95E
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 02:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjAFB7a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 20:59:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjAFB72 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 20:59:28 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C6513E8D
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 17:59:26 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id q64so134257pjq.4
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 17:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3nL1wIsd2dEPQPL/vQTDGsninQKYV4qJDpL3tTkIro=;
        b=xetaKnv5SkRP6HW50DWypVUxTxvvhoapX87M1jQBUpIbuxjVRy6GVCULceOlw5jHBQ
         XPPZqpbQQ7XJsD6oX0wsCpS253Nca4wvYi2awZu5XOExAXoU+mYNVUODOQYlHQ9+4SRZ
         NYRsktAgx2EkQrRWi2bnOEpdSE7DwW5xM2OOXUK8jGlHXu8qsgmjJcdhRfJ8GOn3V3uB
         9TLahEN3yeoIWWUvyXzmAcVpoFMUA3EsHuIgMg1BO7ON6TXZhnD7Phv5+yGjOihUyKrt
         QWRcsNh4yGKal90BadNeG/jdmcSWstGxtwgaStFFlEt+ZLk0RG3iAl2gjwdSy4qrlSvs
         W3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3nL1wIsd2dEPQPL/vQTDGsninQKYV4qJDpL3tTkIro=;
        b=aW6/kjk9al/tpNFVKKw9mt+fc2vf0x/tj3LMNBF/nekR7vesHZlBbqRRMrLHH6vMYd
         hZ7FKDPttVWx1K7OMg0bfdpQmw8cjCcR9C3bgJUpwGWClRsqZ6LuLHZVEAntgsF5au6Y
         7zsN79chKO8nlbFBlU80AcFstD9yqkR5wQAydx7K2tE4iNajOD/QkhcKgf4nkQ6MBpuc
         4wJRTozx4TXIvJgaHP6oecv2KreElEPnfnMeZgQGqmXDbJTQFChTKbEEjVtfMBIeo6gR
         ueSWcbasvanvRXBxmPwa+TPC2OnEU73lOIHc5uIER4u3AFjCRs5kWJ31QoXmMomcaDrb
         UF2Q==
X-Gm-Message-State: AFqh2kqtfz440W4mfJXUzSYuenJpUke8zOshA+jEnEs/ufOgxOfSaurv
        8ekrF9Rq3KFjevGEFSGvqMexCg==
X-Google-Smtp-Source: AMrXdXu5+5GFPMH2LXBOnsll3v2RULLR1dBMmx+ZdSCrys8H1CMFdmURNmGt2ZQhTnH34lIoUzFoLQ==
X-Received: by 2002:a17:902:ee55:b0:192:dbc3:6b79 with SMTP id 21-20020a170902ee5500b00192dbc36b79mr12467651plo.12.1672970365986;
        Thu, 05 Jan 2023 17:59:25 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001897a8b537asm26811165plr.221.2023.01.05.17.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 17:59:25 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 5/5] HID: playstation: correct DualSense gyro bias handling.
Date:   Thu,  5 Jan 2023 17:59:10 -0800
Message-Id: <20230106015910.3031670-6-roderick.colenbrander@sony.com>
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
index 1001eab6ff75..8ac8f7b8e317 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -993,19 +993,22 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	 */
 	speed_2x = (gyro_speed_plus + gyro_speed_minus);
 	ds->gyro_calib_data[0].abs_code = ABS_RX;
-	ds->gyro_calib_data[0].bias = gyro_pitch_bias;
+	ds->gyro_calib_data[0].bias = 0;
 	ds->gyro_calib_data[0].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
-	ds->gyro_calib_data[0].sens_denom = gyro_pitch_plus - gyro_pitch_minus;
+	ds->gyro_calib_data[0].sens_denom = abs(gyro_pitch_plus - gyro_pitch_bias) +
+			abs(gyro_pitch_minus - gyro_pitch_bias);
 
 	ds->gyro_calib_data[1].abs_code = ABS_RY;
-	ds->gyro_calib_data[1].bias = gyro_yaw_bias;
+	ds->gyro_calib_data[1].bias = 0;
 	ds->gyro_calib_data[1].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
-	ds->gyro_calib_data[1].sens_denom = gyro_yaw_plus - gyro_yaw_minus;
+	ds->gyro_calib_data[1].sens_denom = abs(gyro_yaw_plus - gyro_yaw_bias) +
+			abs(gyro_yaw_minus - gyro_yaw_bias);
 
 	ds->gyro_calib_data[2].abs_code = ABS_RZ;
-	ds->gyro_calib_data[2].bias = gyro_roll_bias;
+	ds->gyro_calib_data[2].bias = 0;
 	ds->gyro_calib_data[2].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
-	ds->gyro_calib_data[2].sens_denom = gyro_roll_plus - gyro_roll_minus;
+	ds->gyro_calib_data[2].sens_denom = abs(gyro_roll_plus - gyro_roll_bias) +
+			abs(gyro_roll_minus - gyro_roll_bias);
 
 	/*
 	 * Sanity check gyro calibration data. This is needed to prevent crashes
@@ -1388,8 +1391,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	for (i = 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
 		int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);
 		int calib_data = mult_frac(ds->gyro_calib_data[i].sens_numer,
-					   raw_data - ds->gyro_calib_data[i].bias,
-					   ds->gyro_calib_data[i].sens_denom);
+					   raw_data, ds->gyro_calib_data[i].sens_denom);
 
 		input_report_abs(ds->sensors, ds->gyro_calib_data[i].abs_code, calib_data);
 	}
-- 
2.38.1

