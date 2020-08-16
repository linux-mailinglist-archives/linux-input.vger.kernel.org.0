Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEFA2459A4
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 23:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgHPVPR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 17:15:17 -0400
Received: from mail-dm6nam10on2076.outbound.protection.outlook.com ([40.107.93.76]:55009
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgHPVPL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 17:15:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh7p2MM0K5a1XRvjQyzFH2pIAVMzKS4Gc+JhuXmtcD+0o7GqNi+khQ+IFGvWBrHB+h9dUkaT6xdMGEm1m1Yg5+0KTUVlgo3ZlUqJPqU4mAwaxxmP18t4sBemqekPHhCeZIWDSabnP5Vtv+sb5MZnbM2DM0IS0HQOyodykC0XHHfbtHZYMfcPIxUcLojZRo36A6RVCAgJkxLdKca/z8yR/i+bMW2W7H7ofgRMpyrytdbZeiCXI4VPj0K7ATMDyJJa692LgGyyNOmR0MAOUUVylJ9WaNs8kNz6qxrmdHnw2IAI4atIBhek6AGI+A5LZHSPhq3+qkcBW8GFFlYuZmVihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R03ZvJREaA94tS0/myDWnxx/ECNuojaXDIyBGhfRplo=;
 b=KkWeE/nLAQwD2ATSQY/rSYvfuMserVwQLzKMYMXzuOXN1bYHBJUeiDC3MQWOIumnvC6vxjMJvPU7IgNFd+IjqtvS1eD5eWiA6HdzH1qPNJTlzmgc7S8IfRJOwYFLFkITwRfmzCs0g3MKienzrpRN3bQehXpaBMvyNKL47ptXwPpS+ezY/LiWs216eq7x/++kzWdFiAMm+JF/Xeo8OyGaKN2MFtGRar+ebF/VXvm59bROvGJVFj2EkjqspWTnfdJJpE5q4PW3jDCUQyTY2FemRH9SS7JPi8Cg49MvlmwLLMQt83pRLrosSDmVWoK+PpCnSq/YXa4d0GhAaauBv2q+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R03ZvJREaA94tS0/myDWnxx/ECNuojaXDIyBGhfRplo=;
 b=F0eaG0xrji4aMi68Ib+7brkX+Q7BHWBTSZJwBK5YUd82hkmUt7rKsLLArFbS5c3k963n+IfdXVXO4QiMmGlWTYqLv4VZYKkgU8qFw3EPxAmjWULqkg0tQF+/S0aRO28JSRkqTIRRwtR5pIoDO9YacSoVzeFUHqpUqKVqON1hsiE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Sun, 16 Aug
 2020 21:15:07 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875%6]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 21:15:07 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 2/6] input: iqs269a: Add support for slider gestures
Date:   Sun, 16 Aug 2020 16:14:23 -0500
Message-Id: <1597612467-15093-3-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597612467-15093-1-git-send-email-jeff@labundy.com>
References: <1597612467-15093-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.27 via Frontend Transport; Sun, 16 Aug 2020 21:15:06 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2abbe40d-61b9-44f2-7ee0-08d842297353
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5631052454F88F1BED1C4593D35E0@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3aDPD81+p6rPAdnfHinpqCxv6l7VN/bxGBgoqlOPCJJN7/HQDpd9Q+XxZTP29vu6VxL+6cDEE2JmfzqjquebjV86hfYf+4FvPv/E5p6Wsx7pKyDXWk2Cz842H7bjD6XTW5r3sZOeQ1r7+qvYPxK0b9GryIYE+S81a+oWDd1fG5g45fkmqZeya8rPFTFjLEU+GMcGKCvF8BuYC+kjzbJZ2Nkv9g7aW9+dGYR9uK4NmjhOSIEqtAaTU3UEkkilDqdWNmBiEgerDUtLgf2nWoNadxksHmlRjUfqA2n/Mth5Yb1daMmqn9R7/IS+/ABbFpj7821t9J4hKEI/gFbJlS/A09zL6Ix/by9yeu8f10MaYbvvBxoqRMMuPxMsw8XW0qm6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(366004)(396003)(376002)(346002)(66476007)(6666004)(66556008)(69590400007)(36756003)(4326008)(86362001)(107886003)(2616005)(956004)(316002)(16526019)(8676002)(83380400001)(30864003)(6506007)(8936002)(52116002)(6512007)(2906002)(478600001)(5660300002)(66946007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Vy9HzJbfMvBW/4feVYI2d4ovNYMs8htLIsmIv8roOWyBmcIfUVoOEBZCPcSUuJlHcDyceIhcKBNUv9WI6yCvWVnbkNhciPfgm/sLnU2OxyqlIgFalx1O2d2qLjHWIBhXGeUZ40o6pOfySajTcdVurVD71xb3mRWGywV0580OqyjySe5/5R6gyHy5LgwgPdAbFJHl2EKisncGXL5AxbNFvzbYhyimn0zLwU4cMYzSjfiqhdQNo6oYegx0btxveV64otnfO/wyyW3u3pL4ffEqD+AnaxTU9E1HT1+nNRVLhHSqoNz2JXl0/6NRI5aYm884nkC1KNSy4heORs6AijCqa+QjPO4XJTCqJZVleRZW5lLcXDdzyDx5Hx7tzxppgiakRXzzGLAJom3eQ31xqFnpSb39GYc48C2N9I2gKd9Yt/c5ueAS2nsyEij/9oeaabtqrUYDVQm8cwGTn4vzOrKg0UyCW3+i761XOc2o+2Bw9529xuH4kvMP67ytJShw+BANz4Djq0NsjNbHVdiVbhl+om7yaE3qDM85Ikg7iPg2txAzSoF7ZtkxN53/YGsCNM06l2CoEt1ki9B3riCGxogUtamsb4WUB00vovV0Qhdd8eI+jMI5dyPM9vWxtHhYOaWHP5YOJFnm/PEDxKqfm6+KEA==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abbe40d-61b9-44f2-7ee0-08d842297353
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 21:15:07.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/mMA5kjRjO6gYfZ/FpZtsvAbZsgx9wpYFeenHzNs1/w+m7XuMt4CNV5K5mddojbgwtJtzN0iW1UWrVZfCi1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for slider gestures that can be expressed
by the device. Each gesture (e.g. tap or hold) can be mapped to a
unique keycode for either slider 0 or 1.

With this change, raw slider coordinates are reported only if the
slider has no keycodes defined. This prevents unwanted mouse cur-
sor movement when expressing axial gestures (e.g. swipe) and also
eliminates some unnecessary I2C traffic.

Different revisions of silicon use different tap and swipe timeout
step sizes. Apply an appropriate scaling factor depending on which
revision is found.

To facilitate this change, store the iqs269_ver_info struct in the
driver's private data so that other functions can use it after the
driver has probed.

Last but not least, a former reserved field in iqs269_ver_info now
contains useful information; give it a name (fw_num).

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 219 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 190 insertions(+), 29 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index a348247..095e5d5 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -25,6 +25,8 @@
 
 #define IQS269_VER_INFO				0x00
 #define IQS269_VER_INFO_PROD_NUM		0x4F
+#define IQS269_VER_INFO_FW_NUM_2		0x03
+#define IQS269_VER_INFO_FW_NUM_3		0x10
 
 #define IQS269_SYS_FLAGS			0x02
 #define IQS269_SYS_FLAGS_SHOW_RESET		BIT(15)
@@ -52,6 +54,7 @@
 #define IQS269_SYS_SETTINGS_ULP_UPDATE_MASK	GENMASK(10, 8)
 #define IQS269_SYS_SETTINGS_ULP_UPDATE_SHIFT	8
 #define IQS269_SYS_SETTINGS_ULP_UPDATE_MAX	7
+#define IQS269_SYS_SETTINGS_SLIDER_SWIPE	BIT(7)
 #define IQS269_SYS_SETTINGS_RESEED_OFFSET	BIT(6)
 #define IQS269_SYS_SETTINGS_EVENT_MODE		BIT(5)
 #define IQS269_SYS_SETTINGS_EVENT_MODE_LP	BIT(4)
@@ -68,6 +71,7 @@
 #define IQS269_FILT_STR_MAX			3
 
 #define IQS269_EVENT_MASK_SYS			BIT(6)
+#define IQS269_EVENT_MASK_GESTURE		BIT(3)
 #define IQS269_EVENT_MASK_DEEP			BIT(2)
 #define IQS269_EVENT_MASK_TOUCH			BIT(1)
 #define IQS269_EVENT_MASK_PROX			BIT(0)
@@ -96,6 +100,10 @@
 #define IQS269_MISC_B_TRACKING_UI_ENABLE	BIT(4)
 #define IQS269_MISC_B_FILT_STR_SLIDER		GENMASK(1, 0)
 
+#define IQS269_TIMEOUT_TAP_MS_MAX		4080
+#define IQS269_TIMEOUT_SWIPE_MS_MAX		4080
+#define IQS269_THRESH_SWIPE_MAX			255
+
 #define IQS269_CHx_SETTINGS			0x8C
 
 #define IQS269_CHx_ENG_A_MEAS_CAP_SIZE		BIT(15)
@@ -183,6 +191,20 @@ enum iqs269_event_id {
 	IQS269_EVENT_DEEP_UP,
 };
 
+enum iqs269_slider_id {
+	IQS269_SLIDER_NONE,
+	IQS269_SLIDER_KEY,
+	IQS269_SLIDER_RAW,
+};
+
+enum iqs269_gesture_id {
+	IQS269_GESTURE_TAP,
+	IQS269_GESTURE_HOLD,
+	IQS269_GESTURE_FLKP,
+	IQS269_GESTURE_FLKN,
+	IQS269_NUM_GESTURES,
+};
+
 struct iqs269_switch_desc {
 	unsigned int code;
 	bool enabled;
@@ -242,7 +264,7 @@ struct iqs269_ver_info {
 	u8 prod_num;
 	u8 sw_num;
 	u8 hw_num;
-	u8 padding;
+	u8 fw_num;
 } __packed;
 
 struct iqs269_sys_reg {
@@ -294,9 +316,11 @@ struct iqs269_private {
 	struct iqs269_switch_desc switches[ARRAY_SIZE(iqs269_events)];
 	struct iqs269_ch_reg ch_reg[IQS269_NUM_CH];
 	struct iqs269_sys_reg sys_reg;
+	struct iqs269_ver_info ver_info;
 	struct input_dev *keypad;
 	struct input_dev *slider[IQS269_NUM_SL];
 	unsigned int keycode[ARRAY_SIZE(iqs269_events) * IQS269_NUM_CH];
+	unsigned int gs_code[IQS269_NUM_SL][IQS269_NUM_GESTURES];
 	unsigned int suspend_mode;
 	unsigned int delay_mult;
 	unsigned int ch_num;
@@ -304,6 +328,21 @@ struct iqs269_private {
 	bool ati_current;
 };
 
+static enum iqs269_slider_id iqs269_slider_type(struct iqs269_private *iqs269,
+						int slider_num)
+{
+	int i;
+
+	if (!iqs269->sys_reg.slider_select[slider_num])
+		return IQS269_SLIDER_NONE;
+
+	for (i = 0; i < IQS269_NUM_GESTURES; i++)
+		if (iqs269->gs_code[slider_num][i] != KEY_RESERVED)
+			return IQS269_SLIDER_KEY;
+
+	return IQS269_SLIDER_RAW;
+}
+
 static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
 			       unsigned int ch_num, unsigned int mode)
 {
@@ -978,6 +1017,72 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 	 */
 	sys_reg->redo_ati = sys_reg->active;
 
+	if (device_property_present(&client->dev, "linux,keycodes")) {
+		int scale = 1;
+		int count = device_property_count_u32(&client->dev,
+						      "linux,keycodes");
+		if (count > IQS269_NUM_GESTURES * IQS269_NUM_SL) {
+			dev_err(&client->dev, "Too many keycodes present\n");
+			return -EINVAL;
+		} else if (count < 0) {
+			dev_err(&client->dev, "Failed to count keycodes: %d\n",
+				count);
+			return count;
+		}
+
+		error = device_property_read_u32_array(&client->dev,
+						       "linux,keycodes",
+						       *iqs269->gs_code, count);
+		if (error) {
+			dev_err(&client->dev, "Failed to read keycodes: %d\n",
+				error);
+			return error;
+		}
+
+		/*
+		 * Early revisions of silicon use a more granular step size for
+		 * tap and swipe gesture timeouts; scale them appropriately.
+		 */
+		if (iqs269->ver_info.fw_num < IQS269_VER_INFO_FW_NUM_3)
+			scale = 4;
+
+		if (!device_property_read_u32(&client->dev,
+					      "azoteq,timeout-tap-ms", &val)) {
+			if (val > IQS269_TIMEOUT_TAP_MS_MAX / scale) {
+				dev_err(&client->dev, "Invalid timeout: %u\n",
+					val);
+				return -EINVAL;
+			}
+
+			sys_reg->timeout_tap = val / (16 / scale);
+		}
+
+		if (!device_property_read_u32(&client->dev,
+					      "azoteq,timeout-swipe-ms",
+					      &val)) {
+			if (val > IQS269_TIMEOUT_SWIPE_MS_MAX / scale) {
+				dev_err(&client->dev, "Invalid timeout: %u\n",
+					val);
+				return -EINVAL;
+			}
+
+			sys_reg->timeout_swipe = val / (16 / scale);
+		}
+
+		if (!device_property_read_u32(&client->dev,
+					      "azoteq,thresh-swipe", &val)) {
+			if (val > IQS269_THRESH_SWIPE_MAX) {
+				dev_err(&client->dev, "Invalid threshold: %u\n",
+					val);
+				return -EINVAL;
+			}
+
+			sys_reg->thresh_swipe = val;
+		}
+
+		sys_reg->event_mask &= ~IQS269_EVENT_MASK_GESTURE;
+	}
+
 	general = be16_to_cpu(sys_reg->general);
 
 	if (device_property_present(&client->dev, "azoteq,clk-div")) {
@@ -1008,6 +1113,10 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 		general |= (val << IQS269_SYS_SETTINGS_ULP_UPDATE_SHIFT);
 	}
 
+	general &= ~IQS269_SYS_SETTINGS_SLIDER_SWIPE;
+	if (device_property_present(&client->dev, "azoteq,slider-swipe"))
+		general |= IQS269_SYS_SETTINGS_SLIDER_SWIPE;
+
 	general &= ~IQS269_SYS_SETTINGS_RESEED_OFFSET;
 	if (device_property_present(&client->dev, "azoteq,reseed-offset"))
 		general |= IQS269_SYS_SETTINGS_RESEED_OFFSET;
@@ -1016,10 +1125,11 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 
 	/*
 	 * As per the datasheet, enable streaming during normal-power mode if
-	 * either slider is in use. In that case, the device returns to event
-	 * mode during low-power mode.
+	 * raw coordinates will be read from either slider. In that case, the
+	 * device returns to event mode during low-power mode.
 	 */
-	if (sys_reg->slider_select[0] || sys_reg->slider_select[1])
+	if (iqs269_slider_type(iqs269, 0) == IQS269_SLIDER_RAW ||
+	    iqs269_slider_type(iqs269, 1) == IQS269_SLIDER_RAW)
 		general |= IQS269_SYS_SETTINGS_EVENT_MODE_LP;
 
 	general |= IQS269_SYS_SETTINGS_REDO_ATI;
@@ -1164,19 +1274,37 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
 	}
 
 	for (i = 0; i < IQS269_NUM_SL; i++) {
-		if (!iqs269->sys_reg.slider_select[i])
+		if (iqs269_slider_type(iqs269, i) == IQS269_SLIDER_NONE)
 			continue;
 
 		iqs269->slider[i] = devm_input_allocate_device(&client->dev);
 		if (!iqs269->slider[i])
 			return -ENOMEM;
 
+		iqs269->slider[i]->keycodemax = ARRAY_SIZE(iqs269->gs_code[i]);
+		iqs269->slider[i]->keycode = iqs269->gs_code[i];
+		iqs269->slider[i]->keycodesize = sizeof(**iqs269->gs_code);
+
 		iqs269->slider[i]->name = i ? "iqs269a_slider_1"
 					    : "iqs269a_slider_0";
 		iqs269->slider[i]->id.bustype = BUS_I2C;
 
-		input_set_capability(iqs269->slider[i], EV_KEY, BTN_TOUCH);
-		input_set_abs_params(iqs269->slider[i], ABS_X, 0, 255, 0, 0);
+		for (j = 0; j < IQS269_NUM_GESTURES; j++)
+			if (iqs269->gs_code[i][j] != KEY_RESERVED)
+				input_set_capability(iqs269->slider[i], EV_KEY,
+						     iqs269->gs_code[i][j]);
+
+		/*
+		 * Present the slider as a narrow trackpad if one or more chan-
+		 * nels have been selected to participate, but no gestures have
+		 * been mapped to a keycode.
+		 */
+		if (iqs269_slider_type(iqs269, i) == IQS269_SLIDER_RAW) {
+			input_set_capability(iqs269->slider[i],
+					     EV_KEY, BTN_TOUCH);
+			input_set_abs_params(iqs269->slider[i],
+					     ABS_X, 0, 255, 0, 0);
+		}
 
 		error = input_register_device(iqs269->slider[i]);
 		if (error) {
@@ -1222,28 +1350,62 @@ static int iqs269_report(struct iqs269_private *iqs269)
 		return error;
 	}
 
-	error = regmap_raw_read(iqs269->regmap, IQS269_SLIDER_X, slider_x,
-				sizeof(slider_x));
-	if (error) {
-		dev_err(&client->dev, "Failed to read slider position: %d\n",
-			error);
-		return error;
+	if (iqs269_slider_type(iqs269, 0) == IQS269_SLIDER_RAW ||
+	    iqs269_slider_type(iqs269, 1) == IQS269_SLIDER_RAW) {
+		error = regmap_raw_read(iqs269->regmap, IQS269_SLIDER_X,
+					slider_x, sizeof(slider_x));
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to read slider position: %d\n", error);
+			return error;
+		}
 	}
 
 	for (i = 0; i < IQS269_NUM_SL; i++) {
-		if (!iqs269->sys_reg.slider_select[i])
+		flags.gesture >>= (i * IQS269_NUM_GESTURES);
+
+		switch (iqs269_slider_type(iqs269, i)) {
+		case IQS269_SLIDER_NONE:
 			continue;
 
-		/*
-		 * Report BTN_TOUCH if any channel that participates in the
-		 * slider is in a state of touch.
-		 */
-		if (flags.states[IQS269_ST_OFFS_TOUCH] &
-		    iqs269->sys_reg.slider_select[i]) {
-			input_report_key(iqs269->slider[i], BTN_TOUCH, 1);
-			input_report_abs(iqs269->slider[i], ABS_X, slider_x[i]);
-		} else {
-			input_report_key(iqs269->slider[i], BTN_TOUCH, 0);
+		case IQS269_SLIDER_KEY:
+			for (j = 0; j < IQS269_NUM_GESTURES; j++)
+				input_report_key(iqs269->slider[i],
+						 iqs269->gs_code[i][j],
+						 flags.gesture & BIT(j));
+
+			if (!(flags.gesture & (BIT(IQS269_GESTURE_FLKN) |
+					       BIT(IQS269_GESTURE_FLKP) |
+					       BIT(IQS269_GESTURE_TAP))))
+				break;
+
+			input_sync(iqs269->slider[i]);
+
+			/*
+			 * Momentary gestures are followed by a complementary
+			 * release cycle so as to emulate a full keystroke.
+			 */
+			for (j = 0; j < IQS269_NUM_GESTURES; j++)
+				if (j != IQS269_GESTURE_HOLD)
+					input_report_key(iqs269->slider[i],
+							 iqs269->gs_code[i][j],
+							 0);
+			break;
+
+		case IQS269_SLIDER_RAW:
+			/*
+			 * The slider is considered to be in a state of touch
+			 * if any selected channels are in a state of touch.
+			 */
+			state = flags.states[IQS269_ST_OFFS_TOUCH];
+			state &= iqs269->sys_reg.slider_select[i];
+
+			input_report_key(iqs269->slider[i], BTN_TOUCH, state);
+
+			if (state)
+				input_report_abs(iqs269->slider[i],
+						 ABS_X, slider_x[i]);
+			break;
 		}
 
 		input_sync(iqs269->slider[i]);
@@ -1635,7 +1797,6 @@ static const struct regmap_config iqs269_regmap_config = {
 
 static int iqs269_probe(struct i2c_client *client)
 {
-	struct iqs269_ver_info ver_info;
 	struct iqs269_private *iqs269;
 	int error;
 
@@ -1656,14 +1817,14 @@ static int iqs269_probe(struct i2c_client *client)
 
 	mutex_init(&iqs269->lock);
 
-	error = regmap_raw_read(iqs269->regmap, IQS269_VER_INFO, &ver_info,
-				sizeof(ver_info));
+	error = regmap_raw_read(iqs269->regmap, IQS269_VER_INFO,
+				&iqs269->ver_info, sizeof(iqs269->ver_info));
 	if (error)
 		return error;
 
-	if (ver_info.prod_num != IQS269_VER_INFO_PROD_NUM) {
+	if (iqs269->ver_info.prod_num != IQS269_VER_INFO_PROD_NUM) {
 		dev_err(&client->dev, "Unrecognized product number: 0x%02X\n",
-			ver_info.prod_num);
+			iqs269->ver_info.prod_num);
 		return -EINVAL;
 	}
 
-- 
2.7.4

