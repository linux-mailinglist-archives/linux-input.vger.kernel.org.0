Return-Path: <linux-input+bounces-1066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BD821534
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 21:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA943B21050
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 20:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56393DDC6;
	Mon,  1 Jan 2024 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="maYgu2c7"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F2DDC5;
	Mon,  1 Jan 2024 20:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2bA1sTYRixOYFFFaTAWH2k+WYGAtpASRq72/0apWT5Eapkht+nRtfci1LGsWr3ilxXMvfPkiuWg/vXOiOLZyXhzXBRsWmr7qzTBkOWvcsES3Ng7AxE4qLWwJeDmxoxVccooKXKFEMvooRmfAxzg+vigJDcJEg0YBhkDSWmz4g0K+oBPEUEwo4oOZ0VfANct/5nXGh1dyFyofiDFKhYg63662cIEa8xS6pINGkyIMOLLD3WQ7vCARFIh2rCSUUdCBtVzbdaRJzjMclpACZqd06knLse1KE11aclde3OhW3RK3etFu1KJvOrxNMJogVtC1rM/MjY+Z2SsxDx9bFRURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D42fcXg2ouTebvmsktgjE3fK0RK0Ht5CfeiinsnkWeQ=;
 b=a3EaK+nyfVD0uK3p1V+J5LwxMHH0GrYHzzecakj/GILKuPGCpHsJRGewN6Zc6+0787vxDz/nYVDly1+la0/HeoBeCvhiPpErumT5KiZzS3SsEkCTxjZY8AFBKaZq2zn4a4BNQrPWeTKeyWXqXx6DseJSzBb0Qii0yEFt70MTnNA2czvtxm7mfQ9hNV+uh1ZmWr9EI61bvICUkW98h0hFylzNTSA69Z2NoONg+cO642bsvLSppfT3Ua5ipfvMnQKbvKatfs1hPwSiBQbZ571nEqYZGrUEzSHgDGoYpMkH9JrnrJ/z1IB2Wxt4Sz/QNA1/gg8NswIVUK6BTZrIT5oskw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D42fcXg2ouTebvmsktgjE3fK0RK0Ht5CfeiinsnkWeQ=;
 b=maYgu2c72rkslrGhnRhCFGkvB5yGZ5aAMSmD10FSyX9s+zNl4TvWfau/0Y7fi5oL3cUQ9XWvn/ozbUAcOCDPfIZD/vJtSNwQ1ZmhMnCSVGVdK38NyOp34eMeOrzTaR6Q6ui5Xn8ye9purZfatjqTuR9NzZ64rO0u4E1xgcvX4qI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BY5PR08MB6423.namprd08.prod.outlook.com
 (2603:10b6:a03:1e3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.12; Mon, 1 Jan
 2024 20:02:26 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da%4]) with mapi id 15.20.7159.010; Mon, 1 Jan 2024
 20:02:26 +0000
Date: Mon, 1 Jan 2024 14:02:23 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	jeff@labundy.com
Subject: [PATCH v3 2/4] Input: iqs269a - add support for slider gestures
Message-ID: <ZZMaT46WQq1/Nrsb@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZMZzeX77VeHdIeL@nixie71>
References: <ZZMZzeX77VeHdIeL@nixie71>
X-ClientProxiedBy: SA9PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:806:23::6) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BY5PR08MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5a9800-e739-4af0-5036-08dc0b049370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WQeerdIPauRBiQ2hIqmy9WVMRhyDMsTD1ofN7D3lWd3sEBUgrzNiNPohzQCFAU0J5OSO894x0Wt/kgNEU6JD1RqJEu+L2IVaXzh61vEJNtDQfF1c65aKj2k1Yx6esj3UuapEsaMy1h/+5iYD/F6LRsUJBKo/9OByykDxETzkUBczbm1tV+egw8w5UTKfpFuf6H0KehQg1LH133LJY2/zmrNWQ2piMoHezRD14fj/4iQ1fh9C39Ixo7EWDludk6yQJVIJtzWDruaPf24y2mVN5iKa1G3NA7R/cPIQYZqyPFt/Vdk7TVnTGFG6Vb/KVXjluT8MszGecIsIfdctO5vTA7JBRbw1v44qF3H40a4h5aV3U32NGyqev5Yd13d1PNlIOZrmXog/Chdyvf5UGhSlgFr4wYwNX6GDBUA1J+ERxO+hcv2HhwdDPFe3slvNhT/CYtk39EC59gvoP0RaPSGoG5pVmhyVYn/Tdlo9YaDpo2c6m8hNBqkEM3ViCzP++1eHgpeclmyOK3ylH9W+DUnuEkjtLRFB4LY6j9IsMCuX+rAeDmezZG9EQ9srWy6WN1kB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39830400003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(30864003)(5660300002)(41300700001)(33716001)(83380400001)(107886003)(26005)(478600001)(6666004)(6486002)(6506007)(6512007)(9686003)(38100700002)(86362001)(66946007)(66476007)(66556008)(316002)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VJGh3/NPA9SOoXiAnJKNrzmu0szQaG0MIz4ad4heMLsaxEhdXwHsBDm8M+C5?=
 =?us-ascii?Q?+T3Xj12l7d42w/iQt9XIkoDUKMxnWyQmoRSfC2LxXEtvaqN4sFz/e4UDnJEo?=
 =?us-ascii?Q?+eiunlbWz1rnYSc8VcZsZ8KG76o65s93cVZiVuQy6eUJN0xvImjfMHJfzrkf?=
 =?us-ascii?Q?1AvEPMfjeTwBdX3WlCwh1hqJWT3Up9A8vISWXS9OnHZCg8SCFHweD2B/SJ+4?=
 =?us-ascii?Q?tLzkl1MXoReczzWhZKuHWryYv14Wm3m8fG5lAsr26dU4z9a6cCj0GgUwPiN5?=
 =?us-ascii?Q?jGJfPe87UNCO3XyWFVLTDfjdbvlnZOEWHFx12pEd2EYkxMqRI5fOTqilOVe6?=
 =?us-ascii?Q?KsCQ0jzImUBMCZcTwXj3Upjq3t1/ktv/vYkap8Tjr0qVq0b7Y0JwJYjFnxm2?=
 =?us-ascii?Q?oaUbFKO181zj/CB0/W043fNLgwf9qOfU/SqGoIEwdp4WrF8WcO50fBI685Iu?=
 =?us-ascii?Q?JbJ9t+NpqoLKr7hVrYlE6xImoZLG6yrV3K0VdqAdL6bFxx7TPczckwHV004K?=
 =?us-ascii?Q?81i8oS/mq/JrPGeR9OqoCpvWupiovCS9z2jhXP6hk2tKoYWBGhCR8k0AF+3d?=
 =?us-ascii?Q?oU5qts+tfN3LjEihrSGgDSH3pyMj3fhemblEfMPM/yr1nRC56zT4yQb9/CP3?=
 =?us-ascii?Q?sjgir7FjaZh0ZQ7gCwSsBmaTdpbTln+po1PcdSsLZtnKyQKIcx6vsRX4Sfty?=
 =?us-ascii?Q?+h+3EoZhtVHz5nMMQq7tQ1q0fpXMCrnvwfoa8+bkK0xBSQBNCKBBpVOzYhan?=
 =?us-ascii?Q?2J2/IwJh8t3yx+uRMiOKKXWbgP/UtTWc7Jx5TCb2EY1q5hRTvQu+o+60B8Pn?=
 =?us-ascii?Q?DIGvGKQcG9aLOCtfiRqgifJIM4o2PUZzReRoMn+GXNZvXPX/Q6OiEYl5280b?=
 =?us-ascii?Q?WvdGf1NE9k/gTBiH4OOk0LzMS1lM0ZyOrcHf8oEneJPbvMcTVnn+MfPZANlQ?=
 =?us-ascii?Q?7Y8auwCyBNJrDjrXleAZzm9mjDpYzWz8lM9YZJCWid+gN6ELJrnV5O6JNpH/?=
 =?us-ascii?Q?iRnE93RA/WHl5SCe/OlJb0ZUKo36kK8qEdyj2ukl7N6UhxbagsogZd0sBtIM?=
 =?us-ascii?Q?AFr6+eiJpmm1OmNINQ9K9GGmPeh65qvnWFv/cEXn4kI5r7+Em6rimSRyLqWw?=
 =?us-ascii?Q?USLdqFhM9Mu5Z6LOOyVFC9ZWrEV7NppqdpiBpXcaP0zCxEjCZZXgv2sJvjOc?=
 =?us-ascii?Q?82nXAAy7+WPrEpb4jK9se9CK0izA4Ys9aSGIcv1p8EqI9uLkO+zdtpCHMP5u?=
 =?us-ascii?Q?KhoHXx0gY+X7RwhkmZIdJPsMudHPo+EmQxIsyHlIMW1wy12wLmh+DQTWiWaL?=
 =?us-ascii?Q?6m+87ADBsPkO7xL0JZd48t+SJdixoygt8Fk5HNw1uEC+xZ1gwTKLIxIMWSSX?=
 =?us-ascii?Q?/5Zu3jowZ9HRO/N5+YvaLdqOVkunkv0wcphp8RxcF0XxKLpoxSHiwKcAilq0?=
 =?us-ascii?Q?eJMqajqDPLqVSIB3USoxso3myOjV2SKgwBQMN3SvumGgvp+z5DSZVzvuLrxH?=
 =?us-ascii?Q?r1lJwTlgpeN98PG08fY+lcI+5Oo1aLaaQhDtTSvUBvI0iC4VdNlTAJOlJwdK?=
 =?us-ascii?Q?iffaXGJzNf6aXyfecmFculriwM+8zthjUnKAZY93?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5a9800-e739-4af0-5036-08dc0b049370
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 20:02:26.2460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3yKGK7NcnUG5DtU5SqSSpwoCUBAn5Zb5Jtb0nYeMOU13wRRVmNope2+ALTuuBRFj6wzCWsCXDk6ftzR6L5PpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6423

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
Changes in v3:
 - None

Changes in v2:
 - Rebased onto latest driver
 - Renamed 'azoteq,slider-swipe' to 'azoteq,gesture-swipe' to match IQS626A
 - Renamed 'gs_code' to 'sl_code'

 drivers/input/misc/iqs269a.c | 220 ++++++++++++++++++++++++++++++-----
 1 file changed, 191 insertions(+), 29 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 1abce35b955e..0d0b5cdc7830 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -9,6 +9,7 @@
  * axial sliders presented by the device.
  */
 
+#include <linux/bits.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -26,6 +27,8 @@
 
 #define IQS269_VER_INFO				0x00
 #define IQS269_VER_INFO_PROD_NUM		0x4F
+#define IQS269_VER_INFO_FW_NUM_2		0x03
+#define IQS269_VER_INFO_FW_NUM_3		0x10
 
 #define IQS269_SYS_FLAGS			0x02
 #define IQS269_SYS_FLAGS_SHOW_RESET		BIT(15)
@@ -53,6 +56,7 @@
 #define IQS269_SYS_SETTINGS_ULP_UPDATE_MASK	GENMASK(10, 8)
 #define IQS269_SYS_SETTINGS_ULP_UPDATE_SHIFT	8
 #define IQS269_SYS_SETTINGS_ULP_UPDATE_MAX	7
+#define IQS269_SYS_SETTINGS_SLIDER_SWIPE	BIT(7)
 #define IQS269_SYS_SETTINGS_RESEED_OFFSET	BIT(6)
 #define IQS269_SYS_SETTINGS_EVENT_MODE		BIT(5)
 #define IQS269_SYS_SETTINGS_EVENT_MODE_LP	BIT(4)
@@ -69,6 +73,7 @@
 #define IQS269_FILT_STR_MAX			3
 
 #define IQS269_EVENT_MASK_SYS			BIT(6)
+#define IQS269_EVENT_MASK_GESTURE		BIT(3)
 #define IQS269_EVENT_MASK_DEEP			BIT(2)
 #define IQS269_EVENT_MASK_TOUCH			BIT(1)
 #define IQS269_EVENT_MASK_PROX			BIT(0)
@@ -97,6 +102,10 @@
 #define IQS269_MISC_B_TRACKING_UI_ENABLE	BIT(4)
 #define IQS269_MISC_B_FILT_STR_SLIDER		GENMASK(1, 0)
 
+#define IQS269_TIMEOUT_TAP_MS_MAX		4080
+#define IQS269_TIMEOUT_SWIPE_MS_MAX		4080
+#define IQS269_THRESH_SWIPE_MAX			255
+
 #define IQS269_CHx_ENG_A_MEAS_CAP_SIZE		BIT(15)
 #define IQS269_CHx_ENG_A_RX_GND_INACTIVE	BIT(13)
 #define IQS269_CHx_ENG_A_LOCAL_CAP_SIZE		BIT(12)
@@ -175,6 +184,20 @@ enum iqs269_event_id {
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
+	IQS269_GESTURE_FLICK_POS,
+	IQS269_GESTURE_FLICK_NEG,
+	IQS269_NUM_GESTURES,
+};
+
 struct iqs269_switch_desc {
 	unsigned int code;
 	bool enabled;
@@ -234,7 +257,7 @@ struct iqs269_ver_info {
 	u8 prod_num;
 	u8 sw_num;
 	u8 hw_num;
-	u8 padding;
+	u8 fw_num;
 } __packed;
 
 struct iqs269_ch_reg {
@@ -285,16 +308,33 @@ struct iqs269_private {
 	struct regmap *regmap;
 	struct mutex lock;
 	struct iqs269_switch_desc switches[ARRAY_SIZE(iqs269_events)];
+	struct iqs269_ver_info ver_info;
 	struct iqs269_sys_reg sys_reg;
 	struct completion ati_done;
 	struct input_dev *keypad;
 	struct input_dev *slider[IQS269_NUM_SL];
 	unsigned int keycode[ARRAY_SIZE(iqs269_events) * IQS269_NUM_CH];
+	unsigned int sl_code[IQS269_NUM_SL][IQS269_NUM_GESTURES];
 	unsigned int ch_num;
 	bool hall_enable;
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
+		if (iqs269->sl_code[slider_num][i] != KEY_RESERVED)
+			return IQS269_SLIDER_KEY;
+
+	return IQS269_SLIDER_RAW;
+}
+
 static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
 			       unsigned int ch_num, unsigned int mode)
 {
@@ -1004,6 +1044,76 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 		general |= (val << IQS269_SYS_SETTINGS_ULP_UPDATE_SHIFT);
 	}
 
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
+						       *iqs269->sl_code, count);
+		if (error) {
+			dev_err(&client->dev, "Failed to read keycodes: %d\n",
+				error);
+			return error;
+		}
+
+		if (device_property_present(&client->dev,
+					    "azoteq,gesture-swipe"))
+			general |= IQS269_SYS_SETTINGS_SLIDER_SWIPE;
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
 	general &= ~IQS269_SYS_SETTINGS_RESEED_OFFSET;
 	if (device_property_present(&client->dev, "azoteq,reseed-offset"))
 		general |= IQS269_SYS_SETTINGS_RESEED_OFFSET;
@@ -1012,10 +1122,11 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 
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
@@ -1106,19 +1217,37 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
 	}
 
 	for (i = 0; i < IQS269_NUM_SL; i++) {
-		if (!iqs269->sys_reg.slider_select[i])
+		if (iqs269_slider_type(iqs269, i) == IQS269_SLIDER_NONE)
 			continue;
 
 		iqs269->slider[i] = devm_input_allocate_device(&client->dev);
 		if (!iqs269->slider[i])
 			return -ENOMEM;
 
+		iqs269->slider[i]->keycodemax = ARRAY_SIZE(iqs269->sl_code[i]);
+		iqs269->slider[i]->keycode = iqs269->sl_code[i];
+		iqs269->slider[i]->keycodesize = sizeof(**iqs269->sl_code);
+
 		iqs269->slider[i]->name = i ? "iqs269a_slider_1"
 					    : "iqs269a_slider_0";
 		iqs269->slider[i]->id.bustype = BUS_I2C;
 
-		input_set_capability(iqs269->slider[i], EV_KEY, BTN_TOUCH);
-		input_set_abs_params(iqs269->slider[i], ABS_X, 0, 255, 0, 0);
+		for (j = 0; j < IQS269_NUM_GESTURES; j++)
+			if (iqs269->sl_code[i][j] != KEY_RESERVED)
+				input_set_capability(iqs269->slider[i], EV_KEY,
+						     iqs269->sl_code[i][j]);
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
@@ -1167,28 +1296,62 @@ static int iqs269_report(struct iqs269_private *iqs269)
 	if (be16_to_cpu(flags.system) & IQS269_SYS_FLAGS_IN_ATI)
 		return 0;
 
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
+						 iqs269->sl_code[i][j],
+						 flags.gesture & BIT(j));
+
+			if (!(flags.gesture & (BIT(IQS269_GESTURE_FLICK_NEG) |
+					       BIT(IQS269_GESTURE_FLICK_POS) |
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
+							 iqs269->sl_code[i][j],
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
@@ -1595,7 +1758,6 @@ static const struct regmap_config iqs269_regmap_config = {
 
 static int iqs269_probe(struct i2c_client *client)
 {
-	struct iqs269_ver_info ver_info;
 	struct iqs269_private *iqs269;
 	int error;
 
@@ -1617,14 +1779,14 @@ static int iqs269_probe(struct i2c_client *client)
 	mutex_init(&iqs269->lock);
 	init_completion(&iqs269->ati_done);
 
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
2.34.1


