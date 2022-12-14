Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0479864D1F6
	for <lists+linux-input@lfdr.de>; Wed, 14 Dec 2022 22:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbiLNVtQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Dec 2022 16:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiLNVtN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Dec 2022 16:49:13 -0500
X-Greylist: delayed 420 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 14 Dec 2022 13:49:11 PST
Received: from freundtech.com (freundtech.com [IPv6:2a01:4f8:c17:2d66::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8301040460
        for <linux-input@vger.kernel.org>; Wed, 14 Dec 2022 13:49:11 -0800 (PST)
Received: from arch-desktop.fritz.box (unknown [IPv6:2a02:8071:2b80:7760:fecd:7e78:31fb:a087])
        by freundtech.com (Postfix) with ESMTPSA id D85BD1E46FD;
        Wed, 14 Dec 2022 22:42:04 +0100 (CET)
From:   Adrian Freund <adrian@freund.io>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Basavaraj Natikar <basavaraj.natikar@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Adrian Freund <adrian@freund.io>,
        Ivan Dovgal <iv.dovg@gmail.com>,
        "Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH] HID: amd_sfh: Add support for tablet-mode-switch sensor
Date:   Wed, 14 Dec 2022 22:41:27 +0100
Message-Id: <20221214214127.15347-1-adrian@freund.io>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the tablet mode switch sensors on
convertible devices where that sensor is managed by AMD SFH, like the
Asus Flow X13 and the Lenovo ThinkPad L13 Yoga Gen2 (AMD).

Co-developed-by: Ivan Dovgal <iv.dovg@gmail.com>
Signed-off-by: Ivan Dovgal <iv.dovg@gmail.com>
Co-developed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Adrian Freund <adrian@freund.io>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  2 ++
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h         |  2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  1 +
 .../hid_descriptor/amd_sfh_hid_desc.c         | 27 +++++++++++++++++++
 .../hid_descriptor/amd_sfh_hid_desc.h         |  7 +++++
 .../hid_descriptor/amd_sfh_hid_report_desc.h  | 20 ++++++++++++++
 7 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 8275bba63611..83dd0402933c 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -146,6 +146,8 @@ static const char *get_sensor_name(int idx)
 		return "gyroscope";
 	case mag_idx:
 		return "magnetometer";
+	case tms_idx:
+		return "tablet-mode-switch";
 	case als_idx:
 		return "ALS";
 	case HPD_IDX:
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index 3754fb423e3a..f10ec16bb8aa 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -11,7 +11,7 @@
 #ifndef AMDSFH_HID_H
 #define AMDSFH_HID_H
 
-#define MAX_HID_DEVICES		5
+#define MAX_HID_DEVICES		6
 #define AMD_SFH_HID_VENDOR	0x1022
 #define AMD_SFH_HID_PRODUCT	0x0001
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 47774b9ab3de..cfda797f0a62 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -27,6 +27,7 @@
 #define ACEL_EN		BIT(0)
 #define GYRO_EN		BIT(1)
 #define MAGNO_EN	BIT(2)
+#define TMS_EN		BIT(15)
 #define HPD_EN		BIT(16)
 #define ALS_EN		BIT(19)
 
@@ -227,6 +228,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 	if (MAGNO_EN & activestatus)
 		sensor_id[num_of_sensors++] = mag_idx;
 
+	if (TMS_EN & activestatus)
+		sensor_id[num_of_sensors++] = tms_idx;
+
 	if (ALS_EN & activestatus)
 		sensor_id[num_of_sensors++] = als_idx;
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index dfb7cabd82ef..e18ceee9e5db 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -78,6 +78,7 @@ enum sensor_idx {
 	accel_idx = 0,
 	gyro_idx = 1,
 	mag_idx = 2,
+	tms_idx = 15,
 	als_idx = 19
 };
 
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
index f9a8c02d5a7b..181973f35f05 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
@@ -47,6 +47,11 @@ static int get_report_descriptor(int sensor_idx, u8 *rep_desc)
 		memcpy(rep_desc, comp3_report_descriptor,
 		       sizeof(comp3_report_descriptor));
 		break;
+	case tms_idx: /* tablet mode switch */
+		memset(rep_desc, 0, sizeof(tms_report_descriptor));
+		memcpy(rep_desc, tms_report_descriptor,
+		       sizeof(tms_report_descriptor));
+		break;
 	case als_idx: /* ambient light sensor */
 		memset(rep_desc, 0, sizeof(als_report_descriptor));
 		memcpy(rep_desc, als_report_descriptor,
@@ -96,6 +101,16 @@ static u32 get_descr_sz(int sensor_idx, int descriptor_name)
 			return sizeof(struct magno_feature_report);
 		}
 		break;
+	case tms_idx:
+		switch (descriptor_name) {
+		case descr_size:
+			return sizeof(tms_report_descriptor);
+		case input_size:
+			return sizeof(struct tms_input_report);
+		case feature_size:
+			return sizeof(struct tms_feature_report);
+		}
+		break;
 	case als_idx:
 		switch (descriptor_name) {
 		case descr_size:
@@ -138,6 +153,7 @@ static u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
 	struct accel3_feature_report acc_feature;
 	struct gyro_feature_report gyro_feature;
 	struct magno_feature_report magno_feature;
+	struct tms_feature_report tms_feature;
 	struct hpd_feature_report hpd_feature;
 	struct als_feature_report als_feature;
 	u8 report_size = 0;
@@ -173,6 +189,11 @@ static u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
 		memcpy(feature_report, &magno_feature, sizeof(magno_feature));
 		report_size = sizeof(magno_feature);
 		break;
+	case tms_idx:  /* tablet mode switch */
+		get_common_features(&tms_feature.common_property, report_id);
+		memcpy(feature_report, &tms_feature, sizeof(tms_feature));
+		report_size = sizeof(tms_feature);
+		break;
 	case als_idx:  /* ambient light sensor */
 		get_common_features(&als_feature.common_property, report_id);
 		als_feature.als_change_sesnitivity = HID_DEFAULT_SENSITIVITY;
@@ -211,6 +232,7 @@ static u8 get_input_report(u8 current_index, int sensor_idx, int report_id,
 	struct accel3_input_report acc_input;
 	struct gyro_input_report gyro_input;
 	struct hpd_input_report hpd_input;
+	struct tms_input_report tms_input;
 	struct als_input_report als_input;
 	struct hpd_status hpdstatus;
 	u8 report_size = 0;
@@ -244,6 +266,11 @@ static u8 get_input_report(u8 current_index, int sensor_idx, int report_id,
 		memcpy(input_report, &magno_input, sizeof(magno_input));
 		report_size = sizeof(magno_input);
 		break;
+	case tms_idx: /* tablet mode switch */
+		get_common_inputs(&tms_input.common_property, report_id);
+		report_size = sizeof(tms_input);
+		memcpy(input_report, &tms_input, sizeof(tms_input));
+		break;
 	case als_idx: /* Als */
 		get_common_inputs(&als_input.common_property, report_id);
 		/* For ALS ,V2 Platforms uses C2P_MSG5 register instead of DRAM access method */
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
index ebd55675eb62..b22068a47429 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
@@ -111,4 +111,11 @@ struct hpd_input_report {
 	u8 human_presence;
 } __packed;
 
+struct tms_feature_report {
+	struct common_feature_property common_property;
+} __packed;
+
+struct tms_input_report {
+	struct common_input_property common_property;
+} __packed;
 #endif
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
index 697f2791ea9c..a05e65d4db4c 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
@@ -644,6 +644,26 @@ static const u8 als_report_descriptor[] = {
 0xC0			/* HID end collection */
 };
 
+
+/* TABLET MODE SWITCH */
+static const u8 tms_report_descriptor[] = {
+0x06, 0x43, 0xFF,  // Usage Page (Vendor Defined 0xFF43)
+0x0A, 0x02, 0x02,  // Usage (0x0202)
+0xA1, 0x01, // Collection (Application)
+0x85, 0x11, //   Report ID (17)
+0x15, 0x00, //   Logical Minimum (0)
+0x25, 0x01, //   Logical Maximum (1)
+0x35, 0x00, //   Physical Minimum (0)
+0x45, 0x01, //   Physical Maximum (1)
+0x65, 0x00, //   Unit (None)
+0x55, 0x00, //   Unit Exponent (0)
+0x75, 0x01, //   Report Size (1)
+0x95, 0x98, //   Report Count (-104)
+0x81, 0x03, //   Input (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)
+0x91, 0x03, //   Output (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)
+0xC1, 0x00, // End Collection
+};
+
 /* BIOMETRIC PRESENCE*/
 static const u8 hpd_report_descriptor[] = {
 0x05, 0x20,          /* Usage page */
-- 
2.38.1

