Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5FD026CCFF
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 22:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgIPUwO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 16:52:14 -0400
Received: from mail-eopbgr760053.outbound.protection.outlook.com ([40.107.76.53]:36262
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727725AbgIPUvx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 16:51:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlQk0cCTyxiuYvySvw0hM5y/QLg0DY66ACh6vRXvm0FPGZxA/unLGEeaYSilxfCf1M4ciG+Ue6uTR7IutGygghkbuWMwdjONQX+LUNc2mcmTuvlZERA5R6Fa9WmIdDcI0pWF4HS6lT4GqAkeIEBYJQwR9Vx8acTDjw2hY2gwvdd1ofcnilAAzqkTm0pysr2fR/JHRoUjKZNTg9bPAASx5EOS17KanAkUUyQw4IbVljbjSQ0nw4ujgPs+wOHQOOZgItPRhwjfsz7gJoIWxGecuXJAYLWk3DHWwXLqlKZ+QlH/qLnX3yPR7YeQDrWzezSb37iNtG75e9hH1qOVybU1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R03ZvJREaA94tS0/myDWnxx/ECNuojaXDIyBGhfRplo=;
 b=cRYwE9fqruxhIHjTbeGp55LmsqWEsgfH5fa8MTq6ouEH8w2UaNL+i0RVamhWzl/CYpiiKqpEs6CgIhC79sR09v6SneCOxkOHC4D8e6c4gnv5AuomBHKZ0HbVemADO3X84DpYtPExNetQhbHE63P67HCkcQeIo08nbuqfIWASgZR97vXf1tQd2i0rfQDnUXaLu/v4BPdp4Gt3aHD9yjAUIj14RMzmLaopO3dgsbfU3j3rCW3IpzpHpoYbruRvRpZMssq2zyahEZgbjGLpXj34aatvZnKj9vrfZdrSlgILqVdWaJSwffMdYWA3yyPWHfQF+rZMKdt9IiH/0C9/MxHCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R03ZvJREaA94tS0/myDWnxx/ECNuojaXDIyBGhfRplo=;
 b=esnrVO50K+eHRJhzkTBKp/ZammS2qEivPq+vpm9+3LcXJp1JRbRko/JRDBm0mHPkUUo2/KX2rD+G2OIk0bbdGnAnSY8eKveOUSMPl4J7F8/M+d3p+SULdeksfrQcBX8UwgzHhn/p0t+jjqEdj8zivHotxJNXxTe+574LaOYx8a8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4848.namprd08.prod.outlook.com (2603:10b6:805:6d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 20:51:07 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 20:51:05 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [RESEND 2/5] input: iqs269a: Add support for slider gestures
Date:   Wed, 16 Sep 2020 15:49:57 -0500
Message-Id: <1600289400-27632-3-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600289400-27632-1-git-send-email-jeff@labundy.com>
References: <1600289400-27632-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:805:ca::34) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN6PR16CA0057.namprd16.prod.outlook.com (2603:10b6:805:ca::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 20:51:02 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6da47650-a11f-451f-3f65-08d85a823990
X-MS-TrafficTypeDiagnostic: SN6PR08MB4848:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4848724FB113AD00A30F74AFD3210@SN6PR08MB4848.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GB9r30ApJkyKjiasx7GkIates2jSvnM5Udwkjc5oRoQPfjOnNj5w2pCt9C1lT7d5oLEcB+ipIB6VF+47irYIao0dKsMgquPWhCuzsSMVL7Si/Dxol8exHRlz5jrERQuWuAlznwRhzBjYJHIxlBiux72CSBQKOygi0VZ0Hop7pbkqK5qed/6A9zIVMhDWuqMddbtCEPOSy65f51XmGezkH4UveZPf9owG+cDirM4fE7Cje/bwyHO4aarEPHh4PttiItRybZHoI2Z3fL0KHd3eTDcpYrnm3v77Wbq2NYfAimXpxJGZKI7XjZ5O+f1FnLwAddysiSI6sx6qv6+Sp3mREPwWRgpYK05agiNyhuf6/nY9QhRBXXJvqeLQb1wcdNsN530igh+gZRwYsK25CMDkxGuMvYSV2Da8GgxJcJpAn6AeKlLaqOajtuwuZfVdHW1Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(376002)(39830400003)(396003)(69590400008)(6506007)(66946007)(8676002)(6512007)(5660300002)(86362001)(66556008)(36756003)(66476007)(6486002)(52116002)(316002)(4326008)(186003)(2906002)(26005)(2616005)(956004)(30864003)(6666004)(8936002)(83380400001)(107886003)(16526019)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 36aiPeRkDj+75e8NtxGgqkudkrExTk7GJFSRYK3gMkItuV3H/A2cKJ8FP7JECu9ZQXEIPH1T2Dj+shZx1B02ze6mikxXXs6kf+TJM55xFgSwyJ1zuOXBczaQxlAIomx1IFLsZmG/yQUxVoTKICa9X23b+Xs7luSAsUJLZKvFOlJgdTHBZddkuUBRPY2zaZcjRYb9UW35wIwSMTntKhHNh84K2pUqSLj6AI+29Azv3/DQX71KKB35yq+ous5IRH7n0ZQzUc4MmqAEWB8f1RYkT1G1fxFVjIYIGSYKKI2WwPTmRvD8Ae55FVQ6OH6xmIPTPoYUTNblQAjHACJ33BmRMXyPzLAMGLzZ/3QzKjZmGbsG5VMDPk3tZuvWMO/WbE/JaarNZhhQ5B/SNLsOW4HDj7c/FSAoLXG6CPyRzkdKbcSDJyvX6Ajq7wULAJG2wicOmNF4ZucXKHx9coYlQs1JtvIPJB7C6eRHG/qeelFMO0qcGTs0LkdJQuLJFyjVCcDASHESvTLlNZFutfr1xIu4KRAkffj0KEQyu/ZUnpX0yHNXmTb9G7rSzQNj13NNEaJx+5PggT/zNP/L0zuzkceSTrrwuwXbx3ARXu1p2df7zrtPh+6CTDgEj/HvY3eb3Cg8VjVNwuRlyEDv1dB1KhmLgw==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da47650-a11f-451f-3f65-08d85a823990
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 20:51:03.2997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQvnS4xX3QBMLywl568ZyxvO3KOfxf2wclHylnAW3YTSwkRKjTT/LKItaprJ4uALZtxhjpCw+Hom3ujZ+Fzvuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4848
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

