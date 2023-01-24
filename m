Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D78A2679A14
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 14:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbjAXNok (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Jan 2023 08:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234240AbjAXNoK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Jan 2023 08:44:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77C946D57;
        Tue, 24 Jan 2023 05:43:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 209A4B811D5;
        Tue, 24 Jan 2023 13:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81211C433EF;
        Tue, 24 Jan 2023 13:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674567751;
        bh=H0Hp6I3Q8cOz+PUapxlRXUDRk2kBz4qkaYnpLHVfn9U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OcGfLUfjRWmtRAgXpU/BWKcQJy1Rbu3wsWOcOz0ax3uQyaO0R5SJwsG5gbDejV61m
         bdLGo7FruRsFNbvCF36fhuC1s9sd3TF5HwtLPb5fVVvEC7h3ybouohiazl1HV1beoa
         GZrEWFFw6j9hPBt8vX3usKzh6bvmN85aOGsOY9Tb8cAsr6spkL3tvBrghJrATd//WW
         E3b6ayQciqiqPy2BPtnMORFBI/FUpakt8ZTCWz/fwfDewYMq7Jnd6sHACehxhWnqUm
         /NVguBKocKByMS6exmmwhKTfRKBYvPanyHBpyK5qCvWG1uv138JKzfZc0eAVfiaGXw
         BWJIaFfT268Ig==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 22/35] HID: playstation: sanity check DualSense calibration data.
Date:   Tue, 24 Jan 2023 08:41:18 -0500
Message-Id: <20230124134131.637036-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134131.637036-1-sashal@kernel.org>
References: <20230124134131.637036-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick@gaikai.com>

[ Upstream commit ccf1e1626d37745d0a697db67407beec9ae9d4b8 ]

Make sure calibration values are defined to prevent potential kernel
crashes. This fixes a hypothetical issue for virtual or clone devices
inspired by a similar fix for DS4.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-playstation.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 0b58763bfd30..2228f6e4ba23 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -712,6 +712,7 @@ ATTRIBUTE_GROUPS(ps_device);
 
 static int dualsense_get_calibration_data(struct dualsense *ds)
 {
+	struct hid_device *hdev = ds->base.hdev;
 	short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
 	short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
 	short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
@@ -722,6 +723,7 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 	int speed_2x;
 	int range_2g;
 	int ret = 0;
+	int i;
 	uint8_t *buf;
 
 	buf = kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
@@ -773,6 +775,21 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
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
@@ -795,6 +812,21 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
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
2.39.0

