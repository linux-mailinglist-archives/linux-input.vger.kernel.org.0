Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFB84079FA
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbhIKRiU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbhIKRiT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:19 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C715CC061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:06 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id b14so4615536qtb.0
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FRX3nsiuKVvMNglVFGONJgNGQTlW2wG138izPHK7nA=;
        b=JLpffS7saL3pQgyTmQF3dAc7SOYXXtP+etJ8Rb4v6aH4/rn/Okw1eGvwVgw29mwrjj
         C/E3U5w87btPS7oKmNvzKfF2TAjemN8pAumKvlcsOSVwp9lItAuOWlRZtSxy2oQBlqL9
         TTs3L7r9+2Otomr2VjCY8yIMd8bvlr5Dd0V9JJNIEBxmRyrIApNJAct7oDw1qETSdtgy
         0kgUXluX76+WLXX/7k144nkFTxZqBtGrN5uWzQc7/gtD0tSWj3Sxcegb0HVYmW1koKhr
         tMJRdyty5lj5Pzs2/p7jCr5Jn0JCyY+fbo+Hhup+OHtMvvVltDXVk8vU4oNbf+ldHReu
         fodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FRX3nsiuKVvMNglVFGONJgNGQTlW2wG138izPHK7nA=;
        b=4hK7O9RpmWt20wujqaDPSZLmkJDK09OKBVZibXRSPqz89/Kj8NjthjXR3nTPewmhsc
         gl9y3Y0C4BGoqu7a1H6/MdOOGzfLnbbwb6jnwpefUnyRmk8PWHojSuuY7AllSBNCZgvx
         TAcIYL2NK1sLJID2LjiBjtfX7GLiu8Vb4Ng/yXhmYexZ6hlDUp+swjGMu192YSQcLrE0
         GUWLAH4KpxqTSRsouMjTy/UsYEV/tMbN7yrw30dAA5/IoOP59oSCocyWmg2Aht2CnTXB
         uRzvbENe1aSpTFC//yraxJcvtk9LJYdVPyeY8gimjqx3BQ3sJN8Tsg55RNaOyep4WMoy
         46hg==
X-Gm-Message-State: AOAM531q2r+MjM4pYD6uXNV5T7s54K6t+whb6JFuV3J189KDwKFeVttk
        hwsqYHTKjC6GPFRLg8mLiaYazG0zejlqHQ==
X-Google-Smtp-Source: ABdhPJy1NGFGo7ajnNt+ofTm2ve14lYaqmMSiw2IDuUmUMmb4mc+c7hrzGSGpGf6Oon9mdk2eoFPTw==
X-Received: by 2002:ac8:6697:: with SMTP id d23mr3061177qtp.34.1631381825217;
        Sat, 11 Sep 2021 10:37:05 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:37:04 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 13/16] HID: nintendo: add IMU support
Date:   Sat, 11 Sep 2021 13:36:36 -0400
Message-Id: <20210911173639.5688-14-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the controller's IMU. The accelerometer and
gyro data are both provided to userspace using a second input device.
The devices can be associated using their uniq value (set to the
controller's MAC address).

A large part of this patch's functionality was provided by Carl Mueller.

The IMU device is blacklisted from the joydev input handler.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 503 ++++++++++++++++++++++++++++++++++++-
 drivers/input/joydev.c     |  10 +
 2 files changed, 501 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index b914e262e6f64..1e8dc34f39802 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2,7 +2,7 @@
 /*
  * HID driver for Nintendo Switch Joy-Cons and Pro Controllers
  *
- * Copyright (c) 2019 Daniel J. Ogorchock <djogorchock@gmail.com>
+ * Copyright (c) 2019-2020 Daniel J. Ogorchock <djogorchock@gmail.com>
  *
  * The following resources/projects were referenced for this driver:
  *   https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
@@ -26,6 +26,7 @@
 #include <asm/unaligned.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/kernel.h>
 #include <linux/hid.h>
 #include <linux/input.h>
 #include <linux/jiffies.h>
@@ -115,6 +116,15 @@ static const u16 JC_CAL_USR_RIGHT_DATA_ADDR	= 0x801D;
 static const u16 JC_CAL_FCT_DATA_LEFT_ADDR	= 0x603d;
 static const u16 JC_CAL_FCT_DATA_RIGHT_ADDR	= 0x6046;
 
+/* SPI storage addresses of IMU factory calibration data */
+static const u16 JC_IMU_CAL_FCT_DATA_ADDR	= 0x6020;
+static const u16 JC_IMU_CAL_FCT_DATA_END	= 0x6037;
+#define JC_IMU_CAL_DATA_SIZE \
+	(JC_IMU_CAL_FCT_DATA_END - JC_IMU_CAL_FCT_DATA_ADDR + 1)
+/* SPI storage addresses of IMU user calibration data */
+static const u16 JC_IMU_CAL_USR_MAGIC_ADDR	= 0x8026;
+static const u16 JC_IMU_CAL_USR_DATA_ADDR	= 0x8028;
+
 /* The raw analog joystick values will be mapped in terms of this magnitude */
 static const u16 JC_MAX_STICK_MAG		= 32767;
 static const u16 JC_STICK_FUZZ			= 250;
@@ -125,6 +135,47 @@ static const u16 JC_MAX_DPAD_MAG		= 1;
 static const u16 JC_DPAD_FUZZ			/*= 0*/;
 static const u16 JC_DPAD_FLAT			/*= 0*/;
 
+/* Under most circumstances IMU reports are pushed every 15ms; use as default */
+static const u16 JC_IMU_DFLT_AVG_DELTA_MS	= 15;
+/* How many samples to sum before calculating average IMU report delta */
+static const u16 JC_IMU_SAMPLES_PER_DELTA_AVG	= 300;
+/* Controls how many dropped IMU packets at once trigger a warning message */
+static const u16 JC_IMU_DROPPED_PKT_WARNING	= 3;
+
+/*
+ * The controller's accelerometer has a sensor resolution of 16bits and is
+ * configured with a range of +-8000 milliGs. Therefore, the resolution can be
+ * calculated thus: (2^16-1)/(8000 * 2) = 4.096 digits per milliG
+ * Resolution per G (rather than per millliG): 4.096 * 1000 = 4096 digits per G
+ * Alternatively: 1/4096 = .0002441 Gs per digit
+ */
+static const s32 JC_IMU_MAX_ACCEL_MAG		= 32767;
+static const u16 JC_IMU_ACCEL_RES_PER_G		= 4096;
+static const u16 JC_IMU_ACCEL_FUZZ		= 10;
+static const u16 JC_IMU_ACCEL_FLAT		/*= 0*/;
+
+/*
+ * The controller's gyroscope has a sensor resolution of 16bits and is
+ * configured with a range of +-2000 degrees/second.
+ * Digits per dps: (2^16 -1)/(2000*2) = 16.38375
+ * dps per digit: 16.38375E-1 = .0610
+ *
+ * STMicro recommends in the datasheet to add 15% to the dps/digit. This allows
+ * the full sensitivity range to be saturated without clipping. This yields more
+ * accurate results, so it's the technique this driver uses.
+ * dps per digit (corrected): .0610 * 1.15 = .0702
+ * digits per dps (corrected): .0702E-1 = 14.247
+ *
+ * Now, 14.247 truncating to 14 loses a lot of precision, so we rescale the
+ * min/max range by 1000.
+ */
+static const s32 JC_IMU_PREC_RANGE_SCALE	= 1000;
+/* Note: change mag and res_per_dps if prec_range_scale is ever altered */
+static const s32 JC_IMU_MAX_GYRO_MAG		= 32767000; /* (2^16-1)*1000 */
+static const u16 JC_IMU_GYRO_RES_PER_DPS	= 14247; /* (14.247*1000) */
+static const u16 JC_IMU_GYRO_FUZZ		= 10;
+static const u16 JC_IMU_GYRO_FLAT		/*= 0*/;
+
 /* frequency/amplitude tables for rumble */
 struct joycon_rumble_freq_data {
 	u16 high;
@@ -259,6 +310,11 @@ struct joycon_stick_cal {
 	s32 center;
 };
 
+struct joycon_imu_cal {
+	s16 offset[3];
+	s16 scale[3];
+};
+
 /*
  * All the controller's button values are stored in a u32.
  * They can be accessed with bitwise ANDs.
@@ -306,6 +362,15 @@ struct joycon_subcmd_reply {
 	u8 data[]; /* will be at most 35 bytes */
 } __packed;
 
+struct joycon_imu_data {
+	s16 accel_x;
+	s16 accel_y;
+	s16 accel_z;
+	s16 gyro_x;
+	s16 gyro_y;
+	s16 gyro_z;
+} __packed;
+
 struct joycon_input_report {
 	u8 id;
 	u8 timer;
@@ -315,11 +380,11 @@ struct joycon_input_report {
 	u8 right_stick[3];
 	u8 vibrator_report;
 
-	/*
-	 * If support for firmware updates, gyroscope data, and/or NFC/IR
-	 * are added in the future, this can be swapped for a union.
-	 */
-	struct joycon_subcmd_reply reply;
+	union {
+		struct joycon_subcmd_reply subcmd_reply;
+		/* IMU input reports contain 3 samples */
+		u8 imu_raw_bytes[sizeof(struct joycon_imu_data) * 3];
+	};
 } __packed;
 
 #define JC_MAX_RESP_SIZE	(sizeof(struct joycon_input_report) + 35)
@@ -367,6 +432,13 @@ struct joycon_ctlr {
 	struct joycon_stick_cal right_stick_cal_x;
 	struct joycon_stick_cal right_stick_cal_y;
 
+	struct joycon_imu_cal accel_cal;
+	struct joycon_imu_cal gyro_cal;
+
+	/* prevents needlessly recalculating these divisors every sample */
+	s32 imu_cal_accel_divisor[3];
+	s32 imu_cal_gyro_divisor[3];
+
 	/* power supply data */
 	struct power_supply *battery;
 	struct power_supply_desc battery_desc;
@@ -385,6 +457,16 @@ struct joycon_ctlr {
 	u16 rumble_lh_freq;
 	u16 rumble_rl_freq;
 	u16 rumble_rh_freq;
+
+	/* imu */
+	struct input_dev *imu_input;
+	bool imu_first_packet_received; /* helps in initiating timestamp */
+	unsigned int imu_timestamp_us; /* timestamp we report to userspace */
+	unsigned int imu_last_pkt_ms; /* used to calc imu report delta */
+	/* the following are used to track the average imu report time delta */
+	unsigned int imu_delta_samples_count;
+	unsigned int imu_delta_samples_sum;
+	unsigned int imu_avg_delta_ms;
 };
 
 /* Helper macros for checking controller type */
@@ -569,7 +651,7 @@ static int joycon_request_spi_flash_read(struct joycon_ctlr *ctlr,
 	} else {
 		report = (struct joycon_input_report *)ctlr->input_buf;
 		/* The read data starts at the 6th byte */
-		*reply = &report->reply.data[5];
+		*reply = &report->subcmd_reply.data[5];
 	}
 	return ret;
 }
@@ -729,6 +811,94 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
 	return 0;
 }
 
+/*
+ * These divisors are calculated once rather than for each sample. They are only
+ * dependent on the IMU calibration values. They are used when processing the
+ * IMU input reports.
+ */
+static void joycon_calc_imu_cal_divisors(struct joycon_ctlr *ctlr)
+{
+	int i;
+
+	for (i = 0; i < 3; i++) {
+		ctlr->imu_cal_accel_divisor[i] = ctlr->accel_cal.scale[i] -
+						ctlr->accel_cal.offset[i];
+		ctlr->imu_cal_gyro_divisor[i] = ctlr->gyro_cal.scale[i] -
+						ctlr->gyro_cal.offset[i];
+	}
+}
+
+static const s16 DFLT_ACCEL_OFFSET /*= 0*/;
+static const s16 DFLT_ACCEL_SCALE = 16384;
+static const s16 DFLT_GYRO_OFFSET /*= 0*/;
+static const s16 DFLT_GYRO_SCALE  = 13371;
+static int joycon_request_imu_calibration(struct joycon_ctlr *ctlr)
+{
+	u16 imu_cal_addr = JC_IMU_CAL_FCT_DATA_ADDR;
+	u8 *raw_cal;
+	int ret;
+	int i;
+
+	/* check if user calibration exists */
+	if (!joycon_check_for_cal_magic(ctlr, JC_IMU_CAL_USR_MAGIC_ADDR)) {
+		imu_cal_addr = JC_IMU_CAL_USR_DATA_ADDR;
+		hid_info(ctlr->hdev, "using user cal for IMU\n");
+	} else {
+		hid_info(ctlr->hdev, "using factory cal for IMU\n");
+	}
+
+	/* request IMU calibration data */
+	hid_dbg(ctlr->hdev, "requesting IMU cal data\n");
+	ret = joycon_request_spi_flash_read(ctlr, imu_cal_addr,
+					    JC_IMU_CAL_DATA_SIZE, &raw_cal);
+	if (ret) {
+		hid_warn(ctlr->hdev,
+			 "Failed to read IMU cal, using defaults; ret=%d\n",
+			 ret);
+
+		for (i = 0; i < 3; i++) {
+			ctlr->accel_cal.offset[i] = DFLT_ACCEL_OFFSET;
+			ctlr->accel_cal.scale[i] = DFLT_ACCEL_SCALE;
+			ctlr->gyro_cal.offset[i] = DFLT_GYRO_OFFSET;
+			ctlr->gyro_cal.scale[i] = DFLT_GYRO_SCALE;
+		}
+		joycon_calc_imu_cal_divisors(ctlr);
+		return ret;
+	}
+
+	/* IMU calibration parsing */
+	for (i = 0; i < 3; i++) {
+		int j = i * 2;
+
+		ctlr->accel_cal.offset[i] = get_unaligned_le16(raw_cal + j);
+		ctlr->accel_cal.scale[i] = get_unaligned_le16(raw_cal + j + 6);
+		ctlr->gyro_cal.offset[i] = get_unaligned_le16(raw_cal + j + 12);
+		ctlr->gyro_cal.scale[i] = get_unaligned_le16(raw_cal + j + 18);
+	}
+
+	joycon_calc_imu_cal_divisors(ctlr);
+
+	hid_dbg(ctlr->hdev, "IMU calibration:\n"
+			    "a_o[0]=%d a_o[1]=%d a_o[2]=%d\n"
+			    "a_s[0]=%d a_s[1]=%d a_s[2]=%d\n"
+			    "g_o[0]=%d g_o[1]=%d g_o[2]=%d\n"
+			    "g_s[0]=%d g_s[1]=%d g_s[2]=%d\n",
+			    ctlr->accel_cal.offset[0],
+			    ctlr->accel_cal.offset[1],
+			    ctlr->accel_cal.offset[2],
+			    ctlr->accel_cal.scale[0],
+			    ctlr->accel_cal.scale[1],
+			    ctlr->accel_cal.scale[2],
+			    ctlr->gyro_cal.offset[0],
+			    ctlr->gyro_cal.offset[1],
+			    ctlr->gyro_cal.offset[2],
+			    ctlr->gyro_cal.scale[0],
+			    ctlr->gyro_cal.scale[1],
+			    ctlr->gyro_cal.scale[2]);
+
+	return 0;
+}
+
 static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
 {
 	struct joycon_subcmd_request *req;
@@ -755,6 +925,19 @@ static int joycon_enable_rumble(struct joycon_ctlr *ctlr)
 	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
+static int joycon_enable_imu(struct joycon_ctlr *ctlr)
+{
+	struct joycon_subcmd_request *req;
+	u8 buffer[sizeof(*req) + 1] = { 0 };
+
+	req = (struct joycon_subcmd_request *)buffer;
+	req->subcmd_id = JC_SUBCMD_ENABLE_IMU;
+	req->data[0] = 0x01; /* note: 0x00 would disable */
+
+	hid_dbg(ctlr->hdev, "enabling IMU\n");
+	return joycon_send_subcmd(ctlr, req, 1, HZ);
+}
+
 static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
 {
 	s32 center = cal->center;
@@ -773,6 +956,224 @@ static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
 	return new_val;
 }
 
+static void joycon_input_report_parse_imu_data(struct joycon_ctlr *ctlr,
+					       struct joycon_input_report *rep,
+					       struct joycon_imu_data *imu_data)
+{
+	u8 *raw = rep->imu_raw_bytes;
+	int i;
+
+	for (i = 0; i < 3; i++) {
+		struct joycon_imu_data *data = &imu_data[i];
+
+		data->accel_x = get_unaligned_le16(raw + 0);
+		data->accel_y = get_unaligned_le16(raw + 2);
+		data->accel_z = get_unaligned_le16(raw + 4);
+		data->gyro_x = get_unaligned_le16(raw + 6);
+		data->gyro_y = get_unaligned_le16(raw + 8);
+		data->gyro_z = get_unaligned_le16(raw + 10);
+		/* point to next imu sample */
+		raw += sizeof(struct joycon_imu_data);
+	}
+}
+
+static void joycon_parse_imu_report(struct joycon_ctlr *ctlr,
+				    struct joycon_input_report *rep)
+{
+	struct joycon_imu_data imu_data[3] = {0}; /* 3 reports per packet */
+	struct input_dev *idev = ctlr->imu_input;
+	unsigned int msecs = jiffies_to_msecs(jiffies);
+	unsigned int last_msecs = ctlr->imu_last_pkt_ms;
+	int i;
+	int value[6];
+
+	joycon_input_report_parse_imu_data(ctlr, rep, imu_data);
+
+	/*
+	 * There are complexities surrounding how we determine the timestamps we
+	 * associate with the samples we pass to userspace. The IMU input
+	 * reports do not provide us with a good timestamp. There's a quickly
+	 * incrementing 8-bit counter per input report, but it is not very
+	 * useful for this purpose (it is not entirely clear what rate it
+	 * increments at or if it varies based on packet push rate - more on
+	 * the push rate below...).
+	 *
+	 * The reverse engineering work done on the joy-cons and pro controllers
+	 * by the community seems to indicate the following:
+	 * - The controller samples the IMU every 1.35ms. It then does some of
+	 *   its own processing, probably averaging the samples out.
+	 * - Each imu input report contains 3 IMU samples, (usually 5ms apart).
+	 * - In the standard reporting mode (which this driver uses exclusively)
+	 *   input reports are pushed from the controller as follows:
+	 *      * joy-con (bluetooth): every 15 ms
+	 *      * joy-cons (in charging grip via USB): every 15 ms
+	 *      * pro controller (USB): every 15 ms
+	 *      * pro controller (bluetooth): every 8 ms (this is the wildcard)
+	 *
+	 * Further complicating matters is that some bluetooth stacks are known
+	 * to alter the controller's packet rate by hardcoding the bluetooth
+	 * SSR for the switch controllers (android's stack currently sets the
+	 * SSR to 11ms for both the joy-cons and pro controllers).
+	 *
+	 * In my own testing, I've discovered that my pro controller either
+	 * reports IMU sample batches every 11ms or every 15ms. This rate is
+	 * stable after connecting. It isn't 100% clear what determines this
+	 * rate. Importantly, even when sending every 11ms, none of the samples
+	 * are duplicates. This seems to indicate that the time deltas between
+	 * reported samples can vary based on the input report rate.
+	 *
+	 * The solution employed in this driver is to keep track of the average
+	 * time delta between IMU input reports. In testing, this value has
+	 * proven to be stable, staying at 15ms or 11ms, though other hardware
+	 * configurations and bluetooth stacks could potentially see other rates
+	 * (hopefully this will become more clear as more people use the
+	 * driver).
+	 *
+	 * Keeping track of the average report delta allows us to submit our
+	 * timestamps to userspace based on that. Each report contains 3
+	 * samples, so the IMU sampling rate should be avg_time_delta/3. We can
+	 * also use this average to detect events where we have dropped a
+	 * packet. The userspace timestamp for the samples will be adjusted
+	 * accordingly to prevent unwanted behvaior.
+	 */
+	if (!ctlr->imu_first_packet_received) {
+		ctlr->imu_timestamp_us = 0;
+		ctlr->imu_delta_samples_count = 0;
+		ctlr->imu_delta_samples_sum = 0;
+		ctlr->imu_avg_delta_ms = JC_IMU_DFLT_AVG_DELTA_MS;
+		ctlr->imu_first_packet_received = true;
+	} else {
+		unsigned int delta = msecs - last_msecs;
+		unsigned int dropped_pkts;
+		unsigned int dropped_threshold;
+
+		/* avg imu report delta housekeeping */
+		ctlr->imu_delta_samples_sum += delta;
+		ctlr->imu_delta_samples_count++;
+		if (ctlr->imu_delta_samples_count >=
+		    JC_IMU_SAMPLES_PER_DELTA_AVG) {
+			ctlr->imu_avg_delta_ms = ctlr->imu_delta_samples_sum /
+						 ctlr->imu_delta_samples_count;
+			/* don't ever want divide by zero shenanigans */
+			if (ctlr->imu_avg_delta_ms == 0) {
+				ctlr->imu_avg_delta_ms = 1;
+				hid_warn(ctlr->hdev,
+					 "calculated avg imu delta of 0\n");
+			}
+			ctlr->imu_delta_samples_count = 0;
+			ctlr->imu_delta_samples_sum = 0;
+		}
+
+		/* useful for debugging IMU sample rate */
+		hid_dbg(ctlr->hdev,
+			"imu_report: ms=%u last_ms=%u delta=%u avg_delta=%u\n",
+			msecs, last_msecs, delta, ctlr->imu_avg_delta_ms);
+
+		/* check if any packets have been dropped */
+		dropped_threshold = ctlr->imu_avg_delta_ms * 3 / 2;
+		dropped_pkts = (delta - min(delta, dropped_threshold)) /
+				ctlr->imu_avg_delta_ms;
+		ctlr->imu_timestamp_us += 1000 * ctlr->imu_avg_delta_ms;
+		if (dropped_pkts > JC_IMU_DROPPED_PKT_WARNING) {
+			hid_warn(ctlr->hdev,
+				 "compensating for %u dropped IMU reports\n",
+				 dropped_pkts);
+			hid_warn(ctlr->hdev,
+				 "delta=%u avg_delta=%u\n",
+				 delta, ctlr->imu_avg_delta_ms);
+		}
+	}
+	ctlr->imu_last_pkt_ms = msecs;
+
+	/* Each IMU input report contains three samples */
+	for (i = 0; i < 3; i++) {
+		input_event(idev, EV_MSC, MSC_TIMESTAMP,
+			    ctlr->imu_timestamp_us);
+
+		/*
+		 * These calculations (which use the controller's calibration
+		 * settings to improve the final values) are based on those
+		 * found in the community's reverse-engineering repo (linked at
+		 * top of driver). For hid-nintendo, we make sure that the final
+		 * value given to userspace is always in terms of the axis
+		 * resolution we provided.
+		 *
+		 * Currently only the gyro calculations subtract the calibration
+		 * offsets from the raw value itself. In testing, doing the same
+		 * for the accelerometer raw values decreased accuracy.
+		 *
+		 * Note that the gyro values are multiplied by the
+		 * precision-saving scaling factor to prevent large inaccuracies
+		 * due to truncation of the resolution value which would
+		 * otherwise occur. To prevent overflow (without resorting to 64
+		 * bit integer math), the mult_frac macro is used.
+		 */
+		value[0] = mult_frac((JC_IMU_PREC_RANGE_SCALE *
+				      (imu_data[i].gyro_x -
+				       ctlr->gyro_cal.offset[0])),
+				     ctlr->gyro_cal.scale[0],
+				     ctlr->imu_cal_gyro_divisor[0]);
+		value[1] = mult_frac((JC_IMU_PREC_RANGE_SCALE *
+				      (imu_data[i].gyro_y -
+				       ctlr->gyro_cal.offset[1])),
+				     ctlr->gyro_cal.scale[1],
+				     ctlr->imu_cal_gyro_divisor[1]);
+		value[2] = mult_frac((JC_IMU_PREC_RANGE_SCALE *
+				      (imu_data[i].gyro_z -
+				       ctlr->gyro_cal.offset[2])),
+				     ctlr->gyro_cal.scale[2],
+				     ctlr->imu_cal_gyro_divisor[2]);
+
+		value[3] = ((s32)imu_data[i].accel_x *
+			    ctlr->accel_cal.scale[0]) /
+			    ctlr->imu_cal_accel_divisor[0];
+		value[4] = ((s32)imu_data[i].accel_y *
+			    ctlr->accel_cal.scale[1]) /
+			    ctlr->imu_cal_accel_divisor[1];
+		value[5] = ((s32)imu_data[i].accel_z *
+			    ctlr->accel_cal.scale[2]) /
+			    ctlr->imu_cal_accel_divisor[2];
+
+		hid_dbg(ctlr->hdev, "raw_gyro: g_x=%d g_y=%d g_z=%d\n",
+			imu_data[i].gyro_x, imu_data[i].gyro_y,
+			imu_data[i].gyro_z);
+		hid_dbg(ctlr->hdev, "raw_accel: a_x=%d a_y=%d a_z=%d\n",
+			imu_data[i].accel_x, imu_data[i].accel_y,
+			imu_data[i].accel_z);
+
+		/*
+		 * The right joy-con has 2 axes negated, Y and Z. This is due to
+		 * the orientation of the IMU in the controller. We negate those
+		 * axes' values in order to be consistent with the left joy-con
+		 * and the pro controller:
+		 *   X: positive is pointing toward the triggers
+		 *   Y: positive is pointing to the left
+		 *   Z: positive is pointing up (out of the buttons/sticks)
+		 * The axes follow the right-hand rule.
+		 */
+		if (jc_type_is_joycon(ctlr) && jc_type_has_right(ctlr)) {
+			int j;
+
+			/* negate all but x axis */
+			for (j = 1; j < 6; ++j) {
+				if (j == 3)
+					continue;
+				value[j] *= -1;
+			}
+		}
+
+		input_report_abs(idev, ABS_RX, value[0]);
+		input_report_abs(idev, ABS_RY, value[1]);
+		input_report_abs(idev, ABS_RZ, value[2]);
+		input_report_abs(idev, ABS_X, value[3]);
+		input_report_abs(idev, ABS_Y, value[4]);
+		input_report_abs(idev, ABS_Z, value[5]);
+		input_sync(idev);
+		/* convert to micros and divide by 3 (3 samples per report). */
+		ctlr->imu_timestamp_us += ctlr->imu_avg_delta_ms * 1000 / 3;
+	}
+}
+
 static void joycon_parse_report(struct joycon_ctlr *ctlr,
 				struct joycon_input_report *rep)
 {
@@ -921,6 +1322,10 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		spin_unlock_irqrestore(&ctlr->lock, flags);
 		wake_up(&ctlr->wait);
 	}
+
+	/* parse IMU data if present */
+	if (rep->id == JC_INPUT_IMU_DATA)
+		joycon_parse_imu_report(ctlr, rep);
 }
 
 static void joycon_rumble_worker(struct work_struct *work)
@@ -1104,6 +1509,7 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev;
 	const char *name;
+	const char *imu_name;
 	int ret;
 	int i;
 
@@ -1112,18 +1518,24 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	switch (hdev->product) {
 	case USB_DEVICE_ID_NINTENDO_PROCON:
 		name = "Nintendo Switch Pro Controller";
+		imu_name = "Nintendo Switch Pro Controller IMU";
 		break;
 	case USB_DEVICE_ID_NINTENDO_CHRGGRIP:
-		if (jc_type_has_left(ctlr))
+		if (jc_type_has_left(ctlr)) {
 			name = "Nintendo Switch Left Joy-Con (Grip)";
-		else
+			imu_name = "Nintendo Switch Left Joy-Con IMU (Grip)";
+		} else {
 			name = "Nintendo Switch Right Joy-Con (Grip)";
+			imu_name = "Nintendo Switch Right Joy-Con IMU (Grip)";
+		}
 		break;
 	case USB_DEVICE_ID_NINTENDO_JOYCONL:
 		name = "Nintendo Switch Left Joy-Con";
+		imu_name = "Nintendo Switch Left Joy-Con IMU";
 		break;
 	case USB_DEVICE_ID_NINTENDO_JOYCONR:
 		name = "Nintendo Switch Right Joy-Con";
+		imu_name = "Nintendo Switch Right Joy-Con IMU";
 		break;
 	default: /* Should be impossible */
 		hid_err(hdev, "Invalid hid product\n");
@@ -1207,6 +1619,55 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		return ret;
 
+	/* configure the imu input device */
+	ctlr->imu_input = devm_input_allocate_device(&hdev->dev);
+	if (!ctlr->imu_input)
+		return -ENOMEM;
+
+	ctlr->imu_input->id.bustype = hdev->bus;
+	ctlr->imu_input->id.vendor = hdev->vendor;
+	ctlr->imu_input->id.product = hdev->product;
+	ctlr->imu_input->id.version = hdev->version;
+	ctlr->imu_input->uniq = ctlr->mac_addr_str;
+	ctlr->imu_input->name = imu_name;
+	input_set_drvdata(ctlr->imu_input, ctlr);
+
+	/* configure imu axes */
+	input_set_abs_params(ctlr->imu_input, ABS_X,
+			     -JC_IMU_MAX_ACCEL_MAG, JC_IMU_MAX_ACCEL_MAG,
+			     JC_IMU_ACCEL_FUZZ, JC_IMU_ACCEL_FLAT);
+	input_set_abs_params(ctlr->imu_input, ABS_Y,
+			     -JC_IMU_MAX_ACCEL_MAG, JC_IMU_MAX_ACCEL_MAG,
+			     JC_IMU_ACCEL_FUZZ, JC_IMU_ACCEL_FLAT);
+	input_set_abs_params(ctlr->imu_input, ABS_Z,
+			     -JC_IMU_MAX_ACCEL_MAG, JC_IMU_MAX_ACCEL_MAG,
+			     JC_IMU_ACCEL_FUZZ, JC_IMU_ACCEL_FLAT);
+	input_abs_set_res(ctlr->imu_input, ABS_X, JC_IMU_ACCEL_RES_PER_G);
+	input_abs_set_res(ctlr->imu_input, ABS_Y, JC_IMU_ACCEL_RES_PER_G);
+	input_abs_set_res(ctlr->imu_input, ABS_Z, JC_IMU_ACCEL_RES_PER_G);
+
+	input_set_abs_params(ctlr->imu_input, ABS_RX,
+			     -JC_IMU_MAX_GYRO_MAG, JC_IMU_MAX_GYRO_MAG,
+			     JC_IMU_GYRO_FUZZ, JC_IMU_GYRO_FLAT);
+	input_set_abs_params(ctlr->imu_input, ABS_RY,
+			     -JC_IMU_MAX_GYRO_MAG, JC_IMU_MAX_GYRO_MAG,
+			     JC_IMU_GYRO_FUZZ, JC_IMU_GYRO_FLAT);
+	input_set_abs_params(ctlr->imu_input, ABS_RZ,
+			     -JC_IMU_MAX_GYRO_MAG, JC_IMU_MAX_GYRO_MAG,
+			     JC_IMU_GYRO_FUZZ, JC_IMU_GYRO_FLAT);
+
+	input_abs_set_res(ctlr->imu_input, ABS_RX, JC_IMU_GYRO_RES_PER_DPS);
+	input_abs_set_res(ctlr->imu_input, ABS_RY, JC_IMU_GYRO_RES_PER_DPS);
+	input_abs_set_res(ctlr->imu_input, ABS_RZ, JC_IMU_GYRO_RES_PER_DPS);
+
+	__set_bit(EV_MSC, ctlr->imu_input->evbit);
+	__set_bit(MSC_TIMESTAMP, ctlr->imu_input->mscbit);
+	__set_bit(INPUT_PROP_ACCELEROMETER, ctlr->imu_input->propbit);
+
+	ret = input_register_device(ctlr->imu_input);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -1465,7 +1926,7 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
 	report = (struct joycon_input_report *)ctlr->input_buf;
 
 	for (i = 4, j = 0; j < 6; i++, j++)
-		ctlr->mac_addr[j] = report->reply.data[i];
+		ctlr->mac_addr[j] = report->subcmd_reply.data[i];
 
 	ctlr->mac_addr_str = devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL,
 					    "%02X:%02X:%02X:%02X:%02X:%02X",
@@ -1480,7 +1941,7 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
 	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
 
 	/* Retrieve the type so we can distinguish for charging grip */
-	ctlr->ctlr_type = report->reply.data[2];
+	ctlr->ctlr_type = report->subcmd_reply.data[2];
 
 	return 0;
 }
@@ -1521,7 +1982,7 @@ static int joycon_ctlr_handle_event(struct joycon_ctlr *ctlr, u8 *data,
 			    data[0] != JC_INPUT_SUBCMD_REPLY)
 				break;
 			report = (struct joycon_input_report *)data;
-			if (report->reply.id == ctlr->subcmd_ack_match)
+			if (report->subcmd_reply.id == ctlr->subcmd_ack_match)
 				match = true;
 			break;
 		default:
@@ -1651,6 +2112,16 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		hid_warn(hdev, "Analog stick positions may be inaccurate\n");
 	}
 
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
 	/* Set the reporting mode to 0x30, which is the full report mode */
 	ret = joycon_set_report_mode(ctlr);
 	if (ret) {
@@ -1665,6 +2136,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_mutex;
 	}
 
+	/* Enable the IMU */
+	ret = joycon_enable_imu(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to enable the IMU; ret=%d\n", ret);
+		goto err_mutex;
+	}
+
 	ret = joycon_read_info(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to retrieve controller info; ret=%d\n",
@@ -1757,3 +2235,4 @@ module_hid_driver(nintendo_hid_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Daniel J. Ogorchock <djogorchock@gmail.com>");
 MODULE_DESCRIPTION("Driver for Nintendo Switch Controllers");
+
diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
index 947d440a3be63..b45ddb4570028 100644
--- a/drivers/input/joydev.c
+++ b/drivers/input/joydev.c
@@ -758,6 +758,12 @@ static void joydev_cleanup(struct joydev *joydev)
 #define USB_VENDOR_ID_THQ			0x20d6
 #define USB_DEVICE_ID_THQ_PS3_UDRAW			0xcb17
 
+#define USB_VENDOR_ID_NINTENDO		0x057e
+#define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
+#define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
+#define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
+#define USB_DEVICE_ID_NINTENDO_CHRGGRIP	0x200E
+
 #define ACCEL_DEV(vnd, prd)						\
 	{								\
 		.flags = INPUT_DEVICE_ID_MATCH_VENDOR |			\
@@ -789,6 +795,10 @@ static const struct input_device_id joydev_blacklist[] = {
 	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2),
 	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE),
 	ACCEL_DEV(USB_VENDOR_ID_THQ, USB_DEVICE_ID_THQ_PS3_UDRAW),
+	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_PROCON),
+	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_CHRGGRIP),
+	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_JOYCONL),
+	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_JOYCONR),
 	{ /* sentinel */ }
 };
 
-- 
2.33.0

