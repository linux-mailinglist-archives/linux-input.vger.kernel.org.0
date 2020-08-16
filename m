Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27032459A8
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 23:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbgHPVPY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 17:15:24 -0400
Received: from mail-dm6nam10on2076.outbound.protection.outlook.com ([40.107.93.76]:55009
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgHPVPW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 17:15:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8/X5pZbz6SWIX5JoN1ejJTQl0ChaA4TGsSxiTYoNh8iWOWOjo56FjIYSi5fxVlJ2bt70SPWtDfklDvZzkCfjxfBirNEsMjfKCU6hES3rfRSuPMGxnRAxWxERd59KVFWRcCm/D8upCBvFlttnLECow/hy9kYMMKKfULhJhkyEHwW7TYddyyZsOrGwtTr5fzTugbxZ75tPcQEQz1URoXb8yAMg0NE/4uoi60beShIN1OpSZGuMlEyHV6shR0JWWc6MShi1bbEax7hCbFUiiWi0zJBeOcUkqik5ZoQ02VJY00ezCwZkQUYo0qcTLRP6z7/mPiuOUYy22udPLFWf5BHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPfxuwLTmK+GkStKq+86hSwgk8J+FX39rElhUysleFA=;
 b=HkTCrk1hb+bDD23HkHBqao51ZscLbsnULI13w1VrQUgy793wI0I3DoEfrufFb1VxlfvkUvbzz24AGf9PnXJwYYedO/XcmKFy7R4sbCBRtnv6iJy611ZZb5wrF9We76NsuD1YN6ACpuRMJEK8P4RiT+SLWuX5yAA1kMzMfhmx8lADCEkqYz7VTfrliUwaiPHxsp2+QMGa/NmxauWZERaBFlkvNpzG69UhxOa7GWV9QBocpqD8tHqf1rs0D4arJA5Df2+ElKLymi1/S9DL54HR8vlnsad0cjHf7VVh4HJVrHPwqS2EkExA2r/He1S1z98edH1aWv5emdJ1chL8uRllJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPfxuwLTmK+GkStKq+86hSwgk8J+FX39rElhUysleFA=;
 b=jlqzPD16o02S+VGYXtYR4bpgJzFVlqLceOq8mXRPiGOk+UN/DPRLblgefnY9uaezbG8+2F81K46zqd2n+Zosjzw6Zd6KBSlZFyg6XBic/kDgJhkcXdSt34g/SCzAuUxuKMbZmN4gcHzjhVfvo5VvmkIx84kn/doSwmUZ2SCBm5E=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Sun, 16 Aug
 2020 21:15:12 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875%6]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 21:15:12 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 4/6] input: iqs269a: Add support for OTP variants
Date:   Sun, 16 Aug 2020 16:14:25 -0500
Message-Id: <1597612467-15093-5-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597612467-15093-1-git-send-email-jeff@labundy.com>
References: <1597612467-15093-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.27 via Frontend Transport; Sun, 16 Aug 2020 21:15:12 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49469f8d-fee2-429c-64c8-08d8422976a3
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56318C6FA836E633D85BC621D35E0@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gu4xswXGVRvAVvlnTBnoA2RZfA/XJFKoz2GtpRltqk/lz8KQuVnOya1DUHLT1s8De/9/CtjPyZ8CXWb98q4Af4GC6TVqY/Aksihf++0ET878UGxGWNUURGuzO4RI0lnsBixGV/g5B7o70s7+QgfYWPAvnd7l1xkUqtwV8r9AD52VSXK/nepSaaELN6u2iyru9KU4TIVj471/ct4MhNPCiL4oPPHjbqZiHss90sBm+bp6Ja3MHywDcQ2OkJTdJpQjWmaQ1HNRWThR2ZHvvEcnGKAkMUXorsxp+GMAASQiaKKSXIcONOQymeLD4XY6GrStjXy5wg/HEi+g0weEGrItvqq6qRG+/xoU1ubQ5T6M6whM8YcDd9/D0TtmXdgIrxLz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(366004)(396003)(376002)(346002)(66476007)(6666004)(66556008)(69590400007)(36756003)(4326008)(86362001)(107886003)(2616005)(956004)(316002)(16526019)(8676002)(83380400001)(6506007)(8936002)(52116002)(6512007)(2906002)(478600001)(5660300002)(66946007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: SaITfDwijlFJEJE+4tI3Zb8veBTSsYNz1Cd+501HdjgPkvb1UrZ6PII3gS68gEWAH6QUnr0jPc5hp6i/JqvmgoJG/cOzol0amR2Qu5sw7M8JGTtM7S1cICbZD1ZDOb7yPu4z6BC0T2fhm0fs77RT/C3b31aF0ffr80vELJ53/k2DIQNskBUBcUqC8F5lrL9AOq64bTUh1q8Kvd4vigKB4DpVLZpVL+FF8L7aJudQ9hZn+0jVaXD6WVUqwTPznQHQ63FAdKa8V4AwZpAwJebIyFNGefYfWbZYeQA7mzAsj2IJ9QdUuYdlM/7PmUk97PSfQczoaV2nwom/PqmyhPiKE3WzDz5gud0HmeBKsPCkpLOZ3iV+/fswFf5zCPNHZpVZE/7zppPioU7JDB3n++5Ts+ivegE8cbL9FSvvXstRSq2cJcre/DMi4bFrbZszzA/JBC0jMngBiIh63PAxsyvLRyHZ4z9TaFMtn+hHcrLSddzKf/DTuFZzMFxqrTCECIk0cBOAXLIMI9pq3fi53d1QP1FFKz5hZh78OvWlZL3eFnU4Fh9jaUvZiXasqrR4rCmd7hBFuj4VmaDYvsCR6wokXypP/9gcvJnIcr9QNiggdk/lEoXgU8BFwyLekunbbCweV/r+0Kj6qb6te4ilfBOSyQ==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49469f8d-fee2-429c-64c8-08d8422976a3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 21:15:12.5936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rp0cZKMtRI4LmEk9rn9tnVfxaVzj+RqOnvy0mMHgGerJk7/gxj4SETZeVbPUjeRBq7dMl+iKccdckKn4e3rxlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
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

