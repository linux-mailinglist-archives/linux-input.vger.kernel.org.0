Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598B226CCF3
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 22:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgIPUv4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 16:51:56 -0400
Received: from mail-bn8nam12on2088.outbound.protection.outlook.com ([40.107.237.88]:47413
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726704AbgIPUvS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 16:51:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGFwDdL7XD3U39uSA9Rlin5dFawyFfikI/pEYE+V/P0SSpFY/4L7UY4+sqAs6D0dVwsSS0McS2PU9c+tOAhKP4rZGXKgcAJiotq8jNsGtet5uoAeS1cApS1own654IbM1KNKBVILfB3jH4xuGYzuUlJiCDPT0s1/cMUuGKp3sNWxF2DA/RqgzOyAM2pzEdr4B6NeoJILbfXqB4WmVU0BpmWqdxlJpZj0N+IEPnDZ6xgRGHGUluXwBHTomYhnAa0ZO6n48MNeADy/i5ar7EqW3r9dLutY9CJ1ZjjAplGWC9Vqb6stjH82FqNibi/LJnRcsB2uBtzSLvX77mhpOEgHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPfxuwLTmK+GkStKq+86hSwgk8J+FX39rElhUysleFA=;
 b=BywpC1IjnJFhHhmwq/45VeKDkyGSFmDo9m5w1tWrcOKZ0S7ksBXEGtLRzpjJsB+XtgbU4p/bRb07qPqJAWsbgd28DwGhBLopcvmxAi4ANElDGaoTYcpkibz9lqIYCovU45/p5FAKrYtTcq1Hn5mO6bdcoEhc/RYae0HleKPARmiPW3gte3lwOLd26XtA6IxrLEjuHf1RUMnQkLZLK2igToF8X8RQwcV/eob0UY6aK6jWxr37+0jRyIEtdKWTjSmqEGYdEBztZLCGksDrsEp0kyIGeXnDzTy3sWyXWULyUUTFRQ9ILDCZ1eDl/87gD1+rYQhdzRezXL5NOlxzy7QANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPfxuwLTmK+GkStKq+86hSwgk8J+FX39rElhUysleFA=;
 b=SgiHzOKjvM9pSNA4cV6hnN2ld4J99zCJU41VCKg6I90T0Nlg1NV9+ae/gxlAwn+92gS5tQqLQwUKvkD3pcbvM6P9HjrCrrtIAbl3PTxpR7kWsY3F+Fk8E4YwOnS6qj91Sa7+srxaLMnnxiq4xhR9H6j0Kceooawhm9fX9Ux0E+o=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4094.namprd08.prod.outlook.com (2603:10b6:805:1c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 20:51:13 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 20:51:13 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [RESEND 4/5] input: iqs269a: Add support for OTP variants
Date:   Wed, 16 Sep 2020 15:49:59 -0500
Message-Id: <1600289400-27632-5-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600289400-27632-1-git-send-email-jeff@labundy.com>
References: <1600289400-27632-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:805:ca::34) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN6PR16CA0057.namprd16.prod.outlook.com (2603:10b6:805:ca::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 20:51:12 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4e64966-92f4-438f-67f4-08d85a823f51
X-MS-TrafficTypeDiagnostic: SN6PR08MB4094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB409497702AF4F97829AFAC51D3210@SN6PR08MB4094.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZBKczIeKhslMZdhUz5R5r7Wo+5phW+MPfCKnqI+gj3UAMa3cYYXK7f6U3qvlJuzgZAEz6YBsXw/7BTBQ0+Wt147edjwwZ+bFwlOWBst9rL6ussIv6QtMRuJdP6xIMRq+yvnxfzk+I1soRg1VoIEKumjagOL5hxb5HR7FeGoK2cbHqJtJ1MAIY0s3uoBF0cWZAofSIXlEt7idjnZk71PqYTO79NgE/fuhG4mkhbwk2oDaa+DU8HDZ4YktxH4QofZymTPP2vuIE4CS56LG/RjlB9H/J9anWz5fXksDzXiVFi1bZbdjwqk/8JBvEQYft7jcNRC8Fwws2J7yxr76ZdqI8ZCwG/D4+PwPeJXG9kx7vxiyKvRPlYqQlYQNR86IyAbA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(346002)(396003)(376002)(366004)(16526019)(8676002)(4326008)(956004)(6486002)(107886003)(186003)(83380400001)(69590400008)(52116002)(478600001)(36756003)(6512007)(66556008)(66476007)(6506007)(316002)(2906002)(26005)(66946007)(6666004)(5660300002)(2616005)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8yR04QiYoO1fhMKlVrPmKON4Rs3EFRvmAXBSLqzcCHqLw0hdwuzdpErF6P2pAXP3cQqN6ua3iclPhFHD41yUivk2mx75mfhCmgmSA5EQi7pRd4lZuwRPd6Bat9RO3lhCytPyRRdIC+7Ejuaz2Jl9EQFAd2ebFHly2bjiH0pNOWVHS25C0nN83zrCq7r+0aS2uCQ0hnvTZ5tO8MGjolZ6yvpmg55O5KOo8TB84Njwg+DaC/h3lLQ6xVvuCMTTJ9xQ/+NBY/RjZ/oWBob2iuR6sF2smuAnB3FXaN5lxayxrEzs6Uvf+3r9MyV1pjEDQexErDw3ZD1VdSaDlS9IYw3ffLJLJsWuiGWf5aikwPaMLjfnEp4KhvQAqSDtmXBg3a0qrvSn51PEaLFCYqGN22/kHrbUj0pJAAUgM8+VnS7hbAk1StkffmFObk5xDfat+R2zKNFaywqC2ugaeuwmpfz5fyU880ISAIZFBrl6HiUHTN1Wl3nFXd9JCoHQ4YTPPxH6MdNGxlK67TeKDcG+geSRyYwPh6RYBMWZ2JyV4s1Tc3tuZhPH+6Zh1RwaJutp7aBIAlNMISmYl+bXMtaIzMaY+ax3NmF+SF97cDze4ZafewQ9oS3B/F+Y63RbZ/5hivfvMewPk6M4eCtXA6J+mFLYyw==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e64966-92f4-438f-67f4-08d85a823f51
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 20:51:12.9352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNgSdjFjvNb9VOTwmVRRVQVXBu0qu52BY0Ht81Ogq2snCWL41ykn52WTFneLroI0DAvX68pZ6OvB56ZwgIA2nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4094
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for each available OTP variant of the device.
The OTP configuration cannot be read over I2C, so it is derived from
a compatible string instead.

Early revisions of the D0 order code require their OTP-enabled func-
tionality to be manually restored following a soft reset; this patch
works around this erratum as well.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 94 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 095e5d5..04947f1 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -100,6 +100,11 @@
 #define IQS269_MISC_B_TRACKING_UI_ENABLE	BIT(4)
 #define IQS269_MISC_B_FILT_STR_SLIDER		GENMASK(1, 0)
 
+#define IQS269_TOUCH_HOLD_SLIDER_SEL		0x89
+#define IQS269_TOUCH_HOLD_DEFAULT		0x14
+#define IQS269_TOUCH_HOLD_MS_MIN		256
+#define IQS269_TOUCH_HOLD_MS_MAX		65280
+
 #define IQS269_TIMEOUT_TAP_MS_MAX		4080
 #define IQS269_TIMEOUT_SWIPE_MS_MAX		4080
 #define IQS269_THRESH_SWIPE_MAX			255
@@ -142,6 +147,10 @@
 #define IQS269_CHx_HALL_INACTIVE		6
 #define IQS269_CHx_HALL_ACTIVE			7
 
+#define IQS269_OTP_OPTION_DEFAULT		0x00
+#define IQS269_OTP_OPTION_TWS			0xD0
+#define IQS269_OTP_OPTION_HOLD			BIT(7)
+
 #define IQS269_HALL_PAD_R			BIT(0)
 #define IQS269_HALL_PAD_L			BIT(1)
 #define IQS269_HALL_PAD_INV			BIT(6)
@@ -322,6 +331,7 @@ struct iqs269_private {
 	unsigned int keycode[ARRAY_SIZE(iqs269_events) * IQS269_NUM_CH];
 	unsigned int gs_code[IQS269_NUM_SL][IQS269_NUM_GESTURES];
 	unsigned int suspend_mode;
+	unsigned int otp_option;
 	unsigned int delay_mult;
 	unsigned int ch_num;
 	bool hall_enable;
@@ -333,6 +343,14 @@ static enum iqs269_slider_id iqs269_slider_type(struct iqs269_private *iqs269,
 {
 	int i;
 
+	/*
+	 * Slider 1 is unavailable if the touch-and-hold option is enabled via
+	 * OTP. In that case, the channel selection register is repurposed for
+	 * the touch-and-hold timer ceiling.
+	 */
+	if (slider_num && (iqs269->otp_option & IQS269_OTP_OPTION_HOLD))
+		return IQS269_SLIDER_NONE;
+
 	if (!iqs269->sys_reg.slider_select[slider_num])
 		return IQS269_SLIDER_NONE;
 
@@ -567,7 +585,8 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 	if (fwnode_property_present(ch_node, "azoteq,slider0-select"))
 		iqs269->sys_reg.slider_select[0] |= BIT(reg);
 
-	if (fwnode_property_present(ch_node, "azoteq,slider1-select"))
+	if (fwnode_property_present(ch_node, "azoteq,slider1-select") &&
+	    !(iqs269->otp_option & IQS269_OTP_OPTION_HOLD))
 		iqs269->sys_reg.slider_select[1] |= BIT(reg);
 
 	ch_reg = &iqs269->ch_reg[reg];
@@ -999,7 +1018,43 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 	sys_reg->blocking = 0;
 
 	sys_reg->slider_select[0] = 0;
-	sys_reg->slider_select[1] = 0;
+
+	/*
+	 * If configured via OTP to do so, the device asserts a pulse on the
+	 * GPIO4 pin for approximately 60 ms once a selected channel is held
+	 * in a state of touch for a configurable length of time.
+	 *
+	 * In that case, the register used for slider 1 channel selection is
+	 * repurposed for the touch-and-hold timer ceiling.
+	 */
+	if (iqs269->otp_option & IQS269_OTP_OPTION_HOLD) {
+		if (!device_property_read_u32(&client->dev,
+					      "azoteq,touch-hold-ms", &val)) {
+			if (val < IQS269_TOUCH_HOLD_MS_MIN ||
+			    val > IQS269_TOUCH_HOLD_MS_MAX) {
+				dev_err(&client->dev,
+					"Invalid touch-and-hold ceiling: %u\n",
+					val);
+				return -EINVAL;
+			}
+
+			sys_reg->slider_select[1] = val / 256;
+		} else if (iqs269->ver_info.fw_num < IQS269_VER_INFO_FW_NUM_3) {
+			/*
+			 * The default touch-and-hold timer ceiling initially
+			 * read from early revisions of silicon is invalid if
+			 * the device experienced a soft reset between power-
+			 * on and the read operation.
+			 *
+			 * To protect against this case, explicitly cache the
+			 * default value so that it is restored each time the
+			 * device is re-initialized.
+			 */
+			sys_reg->slider_select[1] = IQS269_TOUCH_HOLD_DEFAULT;
+		}
+	} else {
+		sys_reg->slider_select[1] = 0;
+	}
 
 	sys_reg->event_mask = ~((u8)IQS269_EVENT_MASK_SYS);
 
@@ -1140,6 +1195,12 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 	return 0;
 }
 
+static const struct reg_sequence iqs269_tws_init[] = {
+	{ IQS269_TOUCH_HOLD_SLIDER_SEL, IQS269_TOUCH_HOLD_DEFAULT },
+	{ 0xF0, 0x580F },
+	{ 0xF0, 0x59EF },
+};
+
 static int iqs269_dev_init(struct iqs269_private *iqs269)
 {
 	struct iqs269_sys_reg *sys_reg = &iqs269->sys_reg;
@@ -1149,6 +1210,18 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 
 	mutex_lock(&iqs269->lock);
 
+	/*
+	 * Early revisions of silicon require the following workaround in order
+	 * to restore any OTP-enabled functionality after a soft reset.
+	 */
+	if (iqs269->otp_option == IQS269_OTP_OPTION_TWS &&
+	    iqs269->ver_info.fw_num < IQS269_VER_INFO_FW_NUM_3) {
+		error = regmap_multi_reg_write(iqs269->regmap, iqs269_tws_init,
+					       ARRAY_SIZE(iqs269_tws_init));
+		if (error)
+			goto err_mutex;
+	}
+
 	error = regmap_update_bits(iqs269->regmap, IQS269_HALL_UI,
 				   IQS269_HALL_UI_ENABLE,
 				   iqs269->hall_enable ? ~0 : 0);
@@ -1807,6 +1880,10 @@ static int iqs269_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, iqs269);
 	iqs269->client = client;
 
+	if (client->dev.of_node)
+		iqs269->otp_option = (uintptr_t)
+				     of_device_get_match_data(&client->dev);
+
 	iqs269->regmap = devm_regmap_init_i2c(client, &iqs269_regmap_config);
 	if (IS_ERR(iqs269->regmap)) {
 		error = PTR_ERR(iqs269->regmap);
@@ -1967,7 +2044,18 @@ static int __maybe_unused iqs269_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(iqs269_pm, iqs269_suspend, iqs269_resume);
 
 static const struct of_device_id iqs269_of_match[] = {
-	{ .compatible = "azoteq,iqs269a" },
+	{
+		.compatible = "azoteq,iqs269a",
+		.data = (void *)IQS269_OTP_OPTION_DEFAULT,
+	},
+	{
+		.compatible = "azoteq,iqs269a-00",
+		.data = (void *)IQS269_OTP_OPTION_DEFAULT,
+	},
+	{
+		.compatible = "azoteq,iqs269a-d0",
+		.data = (void *)IQS269_OTP_OPTION_TWS,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, iqs269_of_match);
-- 
2.7.4

