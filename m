Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A362FABC9
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388277AbhARUr7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:47:59 -0500
Received: from mail-mw2nam12on2082.outbound.protection.outlook.com ([40.107.244.82]:41600
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394483AbhARUqY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:46:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwdTqKdMyI1Ns2VjzuI+HWDVjZFILl75XTurc/7Rhug2sUbeJOa4Fo1tOxFvgN/pwG47WdhJKWO4/sr+IRjnaMyUmXWmA6NDWDJlM4/dST5+8uOUXFxqzD/J7f0v10tzk0QXg91T0TOOvGkkwmme8T4tI+xRAeTb8GO66L1kHQn+j5aQKsB9cE6D+dEm2+DrfZ1tH/3Uqj6+PzaiFlT6M+WTjzd40zpqQ9TQK/E+pZf6Tf/N2R7Me1vgjdlHev6KqgBQKUoqFs/oxL1iDS6kT69tHflrJg9i85jxPgGj+coeu+0nig/7pepKFJqf8upqIlB88U5BZufsrH/do/kQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUridO1pWSagq+mshaPJT8NiSFHaoKUQniS96dKd72c=;
 b=MMMqyHod/Qx+SqVfoLlUHlJtFqCbTfxZrWLw+9Cj/S21XEIjsoatjqSsIKEA6/t2FACNRo84mbg0+dXhp+X8SmNW7ssl3PrQa7nsx5nCwt5tedg+xgQAPflcIt/+28u3B/fQm/LHj779OxcWvwrykAaDV5h5Ex/XR7BwF/ye//sT0AGmIIyTtS9POh/flgL3yQfC/ow3f28qCzKgTyjgPjCnOjanuc6uZYH0fRswPQQ3NPXRDGxEywGqKhkDbgCObLblRj4yOupQhO+aAcU7ifhmWJ5dzf0Q7nsid3yMI0TwGFQQVTIMkpqSaZk19/djQwvr8axTbiOVo4VYf7jifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUridO1pWSagq+mshaPJT8NiSFHaoKUQniS96dKd72c=;
 b=RK4P/CI2d7ul9rkYyUVlIsV0pzexTJ2gKJOgmNtBs61BSl11gzEJ+EusAP2WFWdfSGuaJS6Ldn7cu3vx6xvCX6DknyY0xuxGOw810g0c0J+3PcA++yZBHeh61x9k/KK3Yj75DEbN1b4+RjA1iyCDHZcUXk5M257JmGZebVM5JmQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:39 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:39 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 06/10] input: iqs5xx: Simplify axis setup logic
Date:   Mon, 18 Jan 2021 14:43:42 -0600
Message-Id: <1611002626-5889-7-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611002626-5889-1-git-send-email-jeff@labundy.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN4PR0501CA0137.namprd05.prod.outlook.com
 (2603:10b6:803:2c::15) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2cdf368-e13a-4442-fed3-08d8bbf1e016
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB484696C0B8CC2BDF2EEAFBB5D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QIcrzr+8rHzmQU4uSO3GdVT/eaVm8ZeqQ/5AQxUYluCQuy/YPLrHt5dpWhvx96qSARHKUNJeVFN5GnLmddYtP1BANRGjGGaAJpXQkl6yTKD0W6W++qzcJFiIh7fW0CbGR9Rq9cP9X7Ikls5DTHfnQRMEpSHrIoCyYXWzh+n0mQoQGo2UIDkEAvz1hTp86v6N/OR+psmHxupeUhrIJ7wriHa59xvjhaf3WmmgxCMTi4hR7ebIn5Rtk8qIOfnVUbgNYce73KmSL/Cd/jmWheavJppgKaNyAlyJF2Zq2o5JWGSliJBoslMBeJlITtKrc3uNvGG7PHHSc1hfzhsXMWEhoer7QOb52Z7DpgPhnw9V5luM9bdBCiMGGOkB1TfqH91Jggsy/2FjFjyvGOb6yJYK1LT16UQYL+arkzxNK6TRIi39Ewu3mawXC9CzgwW/5RVjAZBHlgavJ0/WeH+JPfCFiKg+VXDRDzoqtOkqq4zxE9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZPfvfUBYnlGM/LZzXm/bh0TFLwu+ULlAYtlZK52Lw80EJ/eI3SuJWcxviULC?=
 =?us-ascii?Q?TyR0ruzNH/OSE9DTXAy/exkas+dfcsGrvzeFopttBfOxtHVkpHBXD0WAE0/a?=
 =?us-ascii?Q?JreMm5fpp0wAsGb2nToqAJY7LzWOA4Q4JMcsqyUE4PyVMKFxYzAG99WPrsl+?=
 =?us-ascii?Q?CiiVCEujxCcxpiJ90xmcd14XU/JVsjt7NoRki5ASRtJxDFYe4fpQCzGwB5+2?=
 =?us-ascii?Q?AxbsZVhuuGNxISYqn7dpU+Nq7BAvsJja3uOZVTMue73Ln3HAFfD00KofabOK?=
 =?us-ascii?Q?K+igBV9o0XipU+hJ0ham6fUtYWsO3Wj3UgGNDoM0hyAoc95DRdqPWia1aJBJ?=
 =?us-ascii?Q?HMlhTLt9Vyfj9flQ4nwsIac/xvgHUJi1FyKsSNyFEGkQUH6+lgbGlTNqeYv8?=
 =?us-ascii?Q?AgDDu55HIc4UmOlYr3AIsiuAaMkRAFTKY2yYlT5en1MoaV9YKxWk8NQSothv?=
 =?us-ascii?Q?F9hLDMD5v1iv3XXv5A85mzi8Oqte3VDAga3wMI9PsdxWZMsiVj3mb9ZpghN7?=
 =?us-ascii?Q?wDSJcStLsyR9mEQEa41CUgDDnC95WvK6E/vZRmpetZHsvBrr77dAJq8TKPGI?=
 =?us-ascii?Q?eG9QbjPzEUHMOlikkSePhUbWCBXU4gPkWxjyA04H0IpI51Q2u1TCHTfQzVqY?=
 =?us-ascii?Q?U63Uo33cwUjI3GNl195USxdadfyrY8NCwALb16VmeL3/y6KhVXiY2ZEIGkFe?=
 =?us-ascii?Q?Dq17KrQdlC81uGo+yTD/UNMRvNgZ2Ep0yE1zXjkrFM54shTP6nvT+8e0Z4ge?=
 =?us-ascii?Q?G+o8j84KqiJ4xUiTGRh15vFgrv43pxTChqIXHhr0gUs1+mQ1oQNUR7CtIk93?=
 =?us-ascii?Q?K6g4NqUuh6cg7lmC5UdZskTNm3ykpnV84oqe6SfiA2L+oDfNNb0+wtMyf0SN?=
 =?us-ascii?Q?ISupbyTp2XLQrTfsq1XkF6xcl7M1t2UUtZT3zREQwIz6MVwJeLyW9Xw9SsAU?=
 =?us-ascii?Q?F937v0C//zjGUORl17IrVMbCmF4+cjsL1DDBmQ8/gdkznr2TkWBF56deLOZ8?=
 =?us-ascii?Q?PU18?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cdf368-e13a-4442-fed3-08d8bbf1e016
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:39.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqG7qMHgkfMIiUnbere6oxfwZU2kVCoCEKx2m619fXbwJsr+DO1dRwVAURYcRM3C4sOUcTbkST1Vwhcs90+D4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The present implementation manipulates axis swap and inversion fields
in the device to more or less duplicate what touchscreen_report_pos()
does. The resulting logic is convoluted and difficult to follow.

Instead report the maximum X and Y coordinates in earnest as they are
read from the device, then let touchscreen_parse_properties() fix the
axes up as necessary. Finally, use touchscreen_report_pos() to report
the transformed coordinates.

Last but not least, the maximum X and Y coordinates are not functions
of the number of rows/columns that comprise the touch surface. Either
coordinate is simply limited to 1 below what is reported for absolute
X or Y coordinates when no fingers are present (0xFFFF).

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 100 ++++++++-----------------------------
 1 file changed, 21 insertions(+), 79 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 9412fb8..d802cee 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -29,9 +29,9 @@
 
 #define IQS5XX_FW_FILE_LEN	64
 #define IQS5XX_NUM_RETRIES	10
-#define IQS5XX_NUM_POINTS	256
 #define IQS5XX_NUM_CONTACTS	5
 #define IQS5XX_WR_BYTES_MAX	2
+#define IQS5XX_XY_RES_MAX	0xFFFE
 
 #define IQS5XX_PROD_NUM_IQS550	40
 #define IQS5XX_PROD_NUM_IQS572	58
@@ -51,10 +51,6 @@
 #define IQS5XX_EVENT_MODE	0x01
 #define IQS5XX_TP_EVENT		0x04
 
-#define IQS5XX_FLIP_X		0x01
-#define IQS5XX_FLIP_Y		0x02
-#define IQS5XX_SWITCH_XY_AXIS	0x04
-
 #define IQS5XX_PROD_NUM		0x0000
 #define IQS5XX_SYS_INFO0	0x000F
 #define IQS5XX_SYS_INFO1	0x0010
@@ -62,9 +58,6 @@
 #define IQS5XX_SYS_CTRL1	0x0432
 #define IQS5XX_SYS_CFG0		0x058E
 #define IQS5XX_SYS_CFG1		0x058F
-#define IQS5XX_TOTAL_RX		0x063D
-#define IQS5XX_TOTAL_TX		0x063E
-#define IQS5XX_XY_CFG0		0x0669
 #define IQS5XX_X_RES		0x066E
 #define IQS5XX_Y_RES		0x0670
 #define IQS5XX_EXP_FILE		0x0677
@@ -102,6 +95,7 @@ struct iqs5xx_private {
 	struct i2c_client *client;
 	struct input_dev *input;
 	struct gpio_desc *reset_gpio;
+	struct touchscreen_properties prop;
 	struct mutex lock;
 	u16 exp_file;
 	u8 bl_status;
@@ -498,12 +492,10 @@ static void iqs5xx_close(struct input_dev *input)
 static int iqs5xx_axis_init(struct i2c_client *client)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
-	struct touchscreen_properties prop;
+	struct touchscreen_properties *prop = &iqs5xx->prop;
 	struct input_dev *input;
+	u16 max_x, max_y;
 	int error;
-	u16 max_x, max_x_hw;
-	u16 max_y, max_y_hw;
-	u8 val;
 
 	if (!iqs5xx->input) {
 		input = devm_input_allocate_device(&client->dev);
@@ -523,89 +515,39 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 		iqs5xx->input = input;
 	}
 
-	touchscreen_parse_properties(iqs5xx->input, true, &prop);
-
-	error = iqs5xx_read_byte(client, IQS5XX_TOTAL_RX, &val);
-	if (error)
-		return error;
-	max_x_hw = (val - 1) * IQS5XX_NUM_POINTS;
-
-	error = iqs5xx_read_byte(client, IQS5XX_TOTAL_TX, &val);
+	error = iqs5xx_read_word(client, IQS5XX_X_RES, &max_x);
 	if (error)
 		return error;
-	max_y_hw = (val - 1) * IQS5XX_NUM_POINTS;
 
-	error = iqs5xx_read_byte(client, IQS5XX_XY_CFG0, &val);
+	error = iqs5xx_read_word(client, IQS5XX_Y_RES, &max_y);
 	if (error)
 		return error;
 
-	if (val & IQS5XX_SWITCH_XY_AXIS)
-		swap(max_x_hw, max_y_hw);
-
-	if (prop.swap_x_y)
-		val ^= IQS5XX_SWITCH_XY_AXIS;
+	input_abs_set_max(iqs5xx->input, ABS_MT_POSITION_X, max_x);
+	input_abs_set_max(iqs5xx->input, ABS_MT_POSITION_Y, max_y);
 
-	if (prop.invert_x)
-		val ^= prop.swap_x_y ? IQS5XX_FLIP_Y : IQS5XX_FLIP_X;
+	touchscreen_parse_properties(iqs5xx->input, true, prop);
 
-	if (prop.invert_y)
-		val ^= prop.swap_x_y ? IQS5XX_FLIP_X : IQS5XX_FLIP_Y;
-
-	error = iqs5xx_write_byte(client, IQS5XX_XY_CFG0, val);
-	if (error)
-		return error;
-
-	if (prop.max_x > max_x_hw) {
+	if (prop->max_x > IQS5XX_XY_RES_MAX) {
 		dev_err(&client->dev, "Invalid maximum x-coordinate: %u > %u\n",
-			prop.max_x, max_x_hw);
+			prop->max_x, IQS5XX_XY_RES_MAX);
 		return -EINVAL;
-	} else if (prop.max_x == 0) {
-		error = iqs5xx_read_word(client, IQS5XX_X_RES, &max_x);
+	} else if (prop->max_x != max_x) {
+		error = iqs5xx_write_word(client, IQS5XX_X_RES, prop->max_x);
 		if (error)
 			return error;
-
-		input_abs_set_max(iqs5xx->input,
-				  prop.swap_x_y ? ABS_MT_POSITION_Y :
-						  ABS_MT_POSITION_X,
-				  max_x);
-	} else {
-		max_x = (u16)prop.max_x;
 	}
 
-	if (prop.max_y > max_y_hw) {
+	if (prop->max_y > IQS5XX_XY_RES_MAX) {
 		dev_err(&client->dev, "Invalid maximum y-coordinate: %u > %u\n",
-			prop.max_y, max_y_hw);
+			prop->max_y, IQS5XX_XY_RES_MAX);
 		return -EINVAL;
-	} else if (prop.max_y == 0) {
-		error = iqs5xx_read_word(client, IQS5XX_Y_RES, &max_y);
+	} else if (prop->max_y != max_y) {
+		error = iqs5xx_write_word(client, IQS5XX_Y_RES, prop->max_y);
 		if (error)
 			return error;
-
-		input_abs_set_max(iqs5xx->input,
-				  prop.swap_x_y ? ABS_MT_POSITION_X :
-						  ABS_MT_POSITION_Y,
-				  max_y);
-	} else {
-		max_y = (u16)prop.max_y;
 	}
 
-	/*
-	 * Write horizontal and vertical resolution to the device in case its
-	 * original defaults were overridden or swapped as per the properties
-	 * specified in the device tree.
-	 */
-	error = iqs5xx_write_word(client,
-				  prop.swap_x_y ? IQS5XX_Y_RES : IQS5XX_X_RES,
-				  max_x);
-	if (error)
-		return error;
-
-	error = iqs5xx_write_word(client,
-				  prop.swap_x_y ? IQS5XX_X_RES : IQS5XX_Y_RES,
-				  max_y);
-	if (error)
-		return error;
-
 	error = input_mt_init_slots(iqs5xx->input, IQS5XX_NUM_CONTACTS,
 				    INPUT_MT_DIRECT);
 	if (error)
@@ -765,10 +707,10 @@ static irqreturn_t iqs5xx_irq(int irq, void *data)
 		input_mt_slot(input, i);
 		if (input_mt_report_slot_state(input, MT_TOOL_FINGER,
 					       pressure != 0)) {
-			input_report_abs(input, ABS_MT_POSITION_X,
-					 be16_to_cpu(touch_data->abs_x));
-			input_report_abs(input, ABS_MT_POSITION_Y,
-					 be16_to_cpu(touch_data->abs_y));
+			touchscreen_report_pos(iqs5xx->input, &iqs5xx->prop,
+					       be16_to_cpu(touch_data->abs_x),
+					       be16_to_cpu(touch_data->abs_y),
+					       true);
 			input_report_abs(input, ABS_MT_PRESSURE, pressure);
 		}
 	}
-- 
2.7.4

