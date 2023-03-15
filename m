Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98326BA5D9
	for <lists+linux-input@lfdr.de>; Wed, 15 Mar 2023 05:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjCOECg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Mar 2023 00:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCOECf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Mar 2023 00:02:35 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2086.outbound.protection.outlook.com [40.107.95.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4B723A54;
        Tue, 14 Mar 2023 21:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJFBcIMeFWUPI7U4oV1QwrN1saFWFoqGbatYTTkmkkfMaiJR80P912/uXirQtEeN47pPZp1MVeOiFEAUtmSSoycP/ixmvhdE0ushUAhHPankz1e3U4oRp05gvHmqbPrt+fMERC4+NH1RfNjVrLzBotRjJPAq2OsjZJ88mwf0UhJRv3Dk3VeHpO61z32rYmHpbDJr1IfpaHyTzMZyhc44Rq2gSkix80J5BMhO/tfNECeeFVd0MUg1bG5Gh/SPfMQu2CN74PwoIWHXmZGY2vy0wyQcMMr0WAV5dBoEmG0UXLpbSpLCWtrl9/FiPDiUllKak/MevW3XXBmg+oSG1SGH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROw+IEDh0XBBkIURwanwzODFIHBaLIXQCMIpM+V+Il8=;
 b=IQhK/ljnXlEKYPFNoVb/HSrqk5aXLn0i1YhrPAdbC8vOtbbEvb/SvHoO1+AUaY3MtnLgRE2d4V5tUrj5TMWNMtuK5Z7ER1/PRjsmwRP+soL+wFE6yjN1P4Oy5nDtJRUoF/3gt98SVOdeGOUZc4fBm7dsAOp1Zhb8Gn+q6FY9jNWUxe+pC4CBYpxTZmAccX0wgCjgBpz7JgJFQ4TPDNgrl5C+RGYr99z0VP4pfXYQR9t8agvJwXp/VO3OgZVoVPLaLKubV/8HZOB5xchs8roSSvWt6BHKXnt3h0GHov2EDg/RWTl3E1ac3OAt10mv8CqFqWpA885StkhlkrU0d56euQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROw+IEDh0XBBkIURwanwzODFIHBaLIXQCMIpM+V+Il8=;
 b=b6aclBsg3MiRjBtpo5t/YEQAfiri6s0NIksupdefKfrEJJWZDs/55EcgbzZP8nvhdSMWk6XJ+rGAZHC79O2luka7FWPXW6U65aOkVIAETboryIhENQxuFm9oehNrhEJ4B+b66bzTMqZxialw7c5R4aj1t5yDspfNBEboZHQpEeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN0PR08MB7487.namprd08.prod.outlook.com
 (2603:10b6:408:157::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 04:02:31 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4%6]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 04:02:31 +0000
Date:   Tue, 14 Mar 2023 23:02:30 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 2/4] Input: iqs269a - add support for slider gestures
Message-ID: <ZBFDVgcSgieFRssA@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBFC+e/3JcYITClP@nixie71>
References: <ZBFC+e/3JcYITClP@nixie71>
X-ClientProxiedBy: SN7PR04CA0240.namprd04.prod.outlook.com
 (2603:10b6:806:127::35) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BN0PR08MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0dc7f6-0979-4ba4-dc26-08db250a19a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yHwD19lAlTmS6LkeCPonnpth0bmFXmshLFsMd/ES8Q/X3w9bp9d5VBa4ST1KuO8EwBFtoiLO432ai5NDaYmM5TwJmCyJvYegZeUGXXNYdixcIAKJdBYioOiph0Z6DDy2u2IZax8W7CQ2lhN7XThK+pYrIceuQYV/XZG/sfK0GqKdPr7JBBa22wQ31PktFV/8S+XnDvxEsgyO/3nfgXaXh9FxJqP0Ilv6LucsoSFS4BEbnAi2UIVQxDWOdFNrzOeii9nJOM2Th8meAB/K/MjqOqRsB63HMZMvF7KU+KfK57Vgp6AvK1Rt/NgkYseS8eywPTT12ds1RFg8A6h6miZhLLcKKVSjPWTgEBreTaoINKNAkalhO9zZrRydcSGpBzDwdv0Tiyzi8/e5kROB6wjzHrKj5PFD+8PFLlJM2P/mV0KXIKe9Kk75XmVHNCiF9y7d+wP1aGZ3zfeg0/G79xBgt7qhxquKibti/+RiOEffG00f6+3rw1FTDanL6DNS3XmehPIUKcSYriKJnYm6w8Io5vvCTl/yRsRkhjnwrbABX3MZ0XS+goegoVS/nXfNReU19b8xXBWwzIhopbJVLdmzTtYnf927j76ofFLuKkuMHFiO8p++11CQgoBNoyAOHwnrC4bBY/x+xpGgZ8g0gq8MEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39830400003)(376002)(136003)(366004)(346002)(396003)(451199018)(86362001)(8936002)(478600001)(30864003)(5660300002)(2906002)(4326008)(41300700001)(66476007)(66946007)(8676002)(316002)(66556008)(33716001)(83380400001)(38100700002)(9686003)(6506007)(107886003)(6512007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B6AF3ChzSexaggkbnYjYQEf+sObs2K/5ABbIhvuPLGSEIu36i9SB9XJngclb?=
 =?us-ascii?Q?cqzseDtxLNklz3VNtMs8VfMz+vQ/A2yTowpUK+YW5pYMNB1wBp8VKsY7pIs/?=
 =?us-ascii?Q?C9umQIXSvs3IIj3AlnyXx8NTGw5wW+7GLNFKFz7PF2zMStLfXM5lc4hV4/YT?=
 =?us-ascii?Q?5uPfw08mbDo0/wApgIt2VCtMNiYty4zis7kxh/6KuNjfhtFjaXkdLf6ehxkQ?=
 =?us-ascii?Q?ffIt30RfvqKDWUzOsC7vJJPM2VH21hnLzLe0OOh8/a2Zhy548Md6pLYHtUOT?=
 =?us-ascii?Q?NnndoMzT5Hanj+muc3f7WeJb5Pz+U++blMxb1qoqwxcVAkFnRwLJfQ4ZnGR4?=
 =?us-ascii?Q?7RjV5/lwCfGkkY6/hSWXCMiJ8DWJW9ItTS+5IqfL6fKmJECNtz9U5xpnGDZb?=
 =?us-ascii?Q?yB0HEkDDvA1k9xJwHZhy80gZvfpHpIDntYh+NqS14FWwCUHdqRqtl9F4dnoa?=
 =?us-ascii?Q?i+IUtCXn9Ra9Bu+xWJZmsXfMomdvA+figWoDDvbeuKUuVA+yql2CAUOPXtMt?=
 =?us-ascii?Q?VETeQFGeXCROl23j0ub0DMYzdEHLM7TYiRvF1JgceFe91q/A6CiF/lJjJqHI?=
 =?us-ascii?Q?7Y88FeDV/Enw+ryuUc7gb89Bsn47wTgO1uhvlUBoznFp+GPkSp8gAmkvGndR?=
 =?us-ascii?Q?6VaQUG/BVsmNYttlZzsdHVwFhKogiPmy7POlWZtMVPsv+xTbQ5LHYD4m5m6k?=
 =?us-ascii?Q?4rHiB3KBM6lp5mAG90FJBvOsh6MWR+XXwoQrLG3myiUa6J7S306j1Lo28M7f?=
 =?us-ascii?Q?46IQkc3X/VIJRv0bBqTis+vZLfJi+uzGxDC+81kDyWgtzu7D80rH9jREu1B4?=
 =?us-ascii?Q?gpzv1R8hMBwqo/RO6R6+MbW6OJ4Oo+wsCtfsUMy7nYqDpYNr77yVNbbEbsZW?=
 =?us-ascii?Q?xS5qQycgI60DY2xQ6CTXL8lpRaR4DwxTjmhKXjkQqeY8dIzzIc2HXqYYFdy9?=
 =?us-ascii?Q?xUx6NzB8bFm4avG9UIVvkG420Xw1sz6/3wJ7D6IwaVfVzHRuKTNN8ugSFSrh?=
 =?us-ascii?Q?WjIfbdvIkNMvp44q/Jxe8DoZ3lLxhFxs173YFiER4PVdEoXqPw+OZj8fIwp/?=
 =?us-ascii?Q?XzBgkrZcolc+ScKnPRwC3iuiuwUnqJoAFsLHMh7o19O2RjJU0JlMJGAl67/4?=
 =?us-ascii?Q?+GtUibYPnNKvVE+tjkQWU9rx/x3T713VG+D6kw7dzFTQbsVE6R7kvzkMU/41?=
 =?us-ascii?Q?hCmmIgwCiEyKYj32upL/oIB/O8Qi8rvWA+w/qiW1mxlJ0ItMuJ4BlPHiJDFo?=
 =?us-ascii?Q?olAcGi3LvOAgDUGQLFgupTlIfKVXVIMW5+7ZV5qiJ6jlLHW3tO+GPBtoZm0d?=
 =?us-ascii?Q?EdJWwbczbrz+e5wCzs2K1BrKgd8IyKolyAlJGDZVzEX2/Yzt05iNSAY+xiDu?=
 =?us-ascii?Q?ZdWVXrlPfW//FPN267mGclWbR79v4zanqZN88NuZ6YUw5jePCvc8vrDmBNWi?=
 =?us-ascii?Q?DkzKXyonHt7h8OdRPFXZPFVrl6re8DOcFikx4Bm2hgI8MJiuDzyjHEZ3V/6H?=
 =?us-ascii?Q?XC1+H016GrMCdbuO2GPKTxMahBHFYoESBvz70NgU2rbKBDkq78Zqu37jCjmL?=
 =?us-ascii?Q?42OnHr5bwdAlAFr5+Ct7Kal7YWPWgW7IOsf1jV+i?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0dc7f6-0979-4ba4-dc26-08db250a19a6
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 04:02:31.4729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqYagoKGb+59TPkeiXxJRgrVT8Ogiys1lObCYt3elkhTab8tgNUVudU4lvnxSFHPWeKrKPzxyNIlAE2kpLJTNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7487
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Changes in v2:
 - Rebased onto latest driver
 - Renamed 'azoteq,slider-swipe' to 'azoteq,gesture-swipe' to match IQS626A
 - Renamed 'gs_code' to 'sl_code'

 drivers/input/misc/iqs269a.c | 220 ++++++++++++++++++++++++++++++-----
 1 file changed, 191 insertions(+), 29 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index f4c3aff3895b..aadb24f8a638 100644
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
@@ -1599,7 +1762,6 @@ static const struct regmap_config iqs269_regmap_config = {
 
 static int iqs269_probe(struct i2c_client *client)
 {
-	struct iqs269_ver_info ver_info;
 	struct iqs269_private *iqs269;
 	int error;
 
@@ -1621,14 +1783,14 @@ static int iqs269_probe(struct i2c_client *client)
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

