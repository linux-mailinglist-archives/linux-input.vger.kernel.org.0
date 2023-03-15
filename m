Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84066BA5DD
	for <lists+linux-input@lfdr.de>; Wed, 15 Mar 2023 05:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjCOEC5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Mar 2023 00:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjCOECz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Mar 2023 00:02:55 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E4034C2B;
        Tue, 14 Mar 2023 21:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKRf19k4MBi7PAwSqyG+0oS8vKnTrtO5x8/Gy3mWugykdFF/e+RVxBTLa35/dJskwZMLtYPIjfz0zQzyk0xitVQ35FHG2BAlraZCq0gMLo42MaV4VePpcyBTptiVOcQ/0MQwu5wDViyRBB/ZAt4ZMAZRPkn3S8Pu2lwY3F06aUVKT51bzLiWZ7xTUkY1yzL5bfxpNCWu6p6As/3ZIiRnfS8/w9V6RTdEXqvd0NIRzzCd5d4rv38uYXq7Wrv710MERmtSHycwpY364bPfqdJTTkGLacEbU5d0KBpG3QYdEvmizHLGQKCSjahp3iB6gLoxhll91Isz0o/2ZpeOIubBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWa4FNhtz8fl8Z9Pm5iYyMy7OVOZTawsB/7gcvYf2D8=;
 b=fbYZysnILrucu50li61+tD10vqDAyCdYVjCxR5riVGX2Fz6jImDopWhdIXBEd0T4fMYnvQJeDRS9zv0ljyvVMN5rAhahafDaAh+Z3cqZDB0NSIRJdOv4tjl0yrd64OuC7zuwTa0KTmf1o+I5SAnOZF/w8kcdAKYULb6rOXoAOfagrTRXgTP7/cErxIWSE7NcZEtvgSig2TpDZl17vtQz7YPV+gZICCXIUx5lUtD9415EAAiQH0v+jo5rm46LzXKiICKeZPUDFBe57K+CdGyaemiKeq8vf907QDT+A1T+PfbqK7N9yuzTbQtqPJwBQF5Su0S9O8P7D6+iFETezS7CIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWa4FNhtz8fl8Z9Pm5iYyMy7OVOZTawsB/7gcvYf2D8=;
 b=IOG8PhckkYcHVDSk3JIOLsCQObVJwy0ZoUACzVjojpWZcvhvgNV2UEzCQ0SUH6KUHkcX7AwpsJiNUtmzSPrE9H2fDUKzteDMQ4aNq0hYqH6LCbILiOsYHm6kUEN6asU1WZT3FQNHngPO+mUxdzrYIKZ2vV18/lh2YW3ZCdIXGs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN0PR08MB7487.namprd08.prod.outlook.com
 (2603:10b6:408:157::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 04:02:48 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4%6]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 04:02:48 +0000
Date:   Tue, 14 Mar 2023 23:02:46 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 4/4] Input: iqs269a - add support for OTP variants
Message-ID: <ZBFDZny2Me1cy+/z@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBFC+e/3JcYITClP@nixie71>
References: <ZBFC+e/3JcYITClP@nixie71>
X-ClientProxiedBy: SA0PR11CA0017.namprd11.prod.outlook.com
 (2603:10b6:806:d3::22) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BN0PR08MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c1a067-b012-4182-98c6-08db250a2377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jNpr4KxIKmMfp1X9byCr0d0mTNKdnLEoA77ot7LKdss28KD9QtpjMbJhfTqwSt/NMIdRrK2WnHJEY46O8mw6w4gaHnQVe6BzTOH6rcxkJHRgvASsmtIxAs1QXOa0cTgVhqxezmZAmaXUuGjMDZTYLsOHHklmxcvd950O2hh9+R0+MJvaZvgreTYEzEeqHW69n65QdB1wu88ILerQXNKz4K/lh/Voqs8kOMNIebQ8kZpvU3jg/AzcQxQiFtclIbKUk/RFvCjPPN3dm9oc8DYIFsaKcXLt9PBjwy5HrUbkzMhKNLzV6HrXA9DZ19FAyxZrbomp5yN4gdBzJPgYs5Jhn8yq2t2YrwuT7pgAv03bpUcC4RVnfYPKhg7N1Q3INAEF4KduY6B8PczyPuclgD5eCHbZEWO/w+GHsXGu+NdY6ZYjg+IoiqtNkJx/dn2KLbTkD4lujQVNP1zYOWJN5b10nSu1PoDGsliOWWeKnpSEqlaHakM2RYeD2N3uORHN/OMjMiCVeZyeyxtdfU/8WT7haJzAY9SGb2L3s/QMnI3nDQcz4z5GnATpb1ON+D9cvZOvpzNHogNwixavsFRLuoyZwe+pGfi/GW2ZkkF0ej623uuTnUJ3M0UzfvM/XEDSsaQTNDyXQWyuwVKoQTCaZAd2cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39830400003)(376002)(136003)(366004)(346002)(396003)(451199018)(86362001)(8936002)(478600001)(5660300002)(2906002)(4326008)(41300700001)(66476007)(66946007)(8676002)(316002)(66556008)(33716001)(83380400001)(38100700002)(9686003)(6506007)(107886003)(6512007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yG2+158KR9P8zBJPsu2pKV+SfIok3WnmvPKLHlViIUk5Ek7pbnITwfC3lXqs?=
 =?us-ascii?Q?GPmufD+Lw7ZTKqtbpmOoz1HId2TTxasmn93LwegmcrRxJs7gyhdh1p1QQCrQ?=
 =?us-ascii?Q?/Bp+SwFF1YzFNHlDhjiH0Sf0PZavgQ92N43GGXOCiMvzbLwqPjAY/xErld2i?=
 =?us-ascii?Q?IjJhyW/HoPF/gnyhkbOiOebI507+xW+rpFkJuo/clgxX5wSKRXOpMF1QdiLY?=
 =?us-ascii?Q?dZwfjAwoeQqUFAF8lJEewhZv3UTeQPdJ1pY+pGykIBDV59cCpxkWNqoupAEr?=
 =?us-ascii?Q?o1f9RYSdBg7eQNVZV6vp7mB6hUwC1FYTa64X1GV/8FVpTvX+ONvbJhem9eLl?=
 =?us-ascii?Q?dxdkGnM7Vvi8uAPalv3Jo1Ug4ZnvS7rJ6fmzJp7/noRFY9qK8iiuCAP9MNNn?=
 =?us-ascii?Q?/kw7hRNnZegv/88SMePJ72kAfzOxDJmclqHAOYAsnDttMHbWpyRFz6dPwOfC?=
 =?us-ascii?Q?tJcPSMwp5jxZmLT4YDrGkXbnP9lbeg1eiwjMR3XxZ/cg2bDwdLOflEiJyQiY?=
 =?us-ascii?Q?0e9i71TsGzNhOSeujBP8ak2pzo+2jdeR+FoTRbEIZw9jVTiMPf9+Ne3WoFA8?=
 =?us-ascii?Q?UDXA4esTAPO0MD0463/tOVkssdmkqeAv29NlC8YCsXsqLJvs+RWTDFCZSIez?=
 =?us-ascii?Q?+JOUUQgP9vmX41aJU2KWpb3Qn3AHZwkL82i1kLDVVdjr2wTyich9lPW7j/iO?=
 =?us-ascii?Q?sjdYmYnz0cxjZj0shDOqWzomD2OgY52AUwgrrnhkK5VHAs/dKhUaX+75gmCH?=
 =?us-ascii?Q?r2GV9k0IV1G8nvToZrvBPQEF0xhc4K8UHRMo6d7EpKSQ5NSEAnvFpluw2L7w?=
 =?us-ascii?Q?ulwePGXRY/X0QkupKvC6T8tVWswKJvWGcKX//bDAxt3JOpsDErKgNNUuoI99?=
 =?us-ascii?Q?XHTPBmegfFM7UTzILXxUggJKJG3D8gGN6LqWcdgFP4q1XOnKZX13hJ7EcKSv?=
 =?us-ascii?Q?rSZ1jU1yxi6WP4Mx/ki7L+zaABmjJJ+TFVdBdKfJ2HvwiSEe03jpVHhJRx3K?=
 =?us-ascii?Q?H09e1L+yjAEbQ8/4lnnamoZ0s+L6uZ9oNXCLqEMRvSXKF6WWFwSp5W7qmxfU?=
 =?us-ascii?Q?55jkAkyvRhSYGW4O4mXDBOqa5etMH0lqY9JEi8W94p2wkkadt6fvFwUmZNXr?=
 =?us-ascii?Q?T9R22h3t9p2VmqXfpnJtvj68eNEGFu9euXRThO8edkao1WeufdcZLHeDUXrB?=
 =?us-ascii?Q?Y/VNPaL57u8C/LWvMmGhuHXc3Q4TTNnplyxlhEAHzGLfTjR/+OKxGjA0Zg4y?=
 =?us-ascii?Q?wqG1seFSQW+D2oJJZsgAGLNG5xtR4KESGkcWteomkQpl43YcMteqEm80DRud?=
 =?us-ascii?Q?QcxpBU+BfTWI0ZoYntYGl/PlNVRq8Jg2j9WjABUROgh17QvLyt0GzABQSJFN?=
 =?us-ascii?Q?TPtXUjelH/u99AB/j/W+Hq8w0bZ5v56n12ClypdeIHcX0LEahfqzvAWb74E2?=
 =?us-ascii?Q?j+DcMRvMo1KxDjid5//R+BVpeSWgPuXCkGZirmIBM4gHRJZ7FGWHk066EZwm?=
 =?us-ascii?Q?IFpKs1Mg86ZIvyMa/VWgP1emai3dloAR/6izRH3L7hyMAA0ehTf8SGNFJtWM?=
 =?us-ascii?Q?43han/eQKWfhVxd88NMJpwdNnDTj+CsxOVfZbd8o?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c1a067-b012-4182-98c6-08db250a2377
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 04:02:47.9248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMq/G5sySGZWmkTkAL5cxp4drMs4zs4qtUQsZx85Wd7g/ZeokxaXjQVkl+poL9R00bDD3JQxy9TFSxIUp/YAGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7487
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for each available OTP variant of the device.
The OTP configuration cannot be read over I2C, so it is derived from
a compatible string instead.

Early revisions of the D0 order code require their OTP-enabled func-
tionality to be manually restored following a soft reset; this patch
accommodates this erratum as well.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Rebased onto latest driver

 drivers/input/misc/iqs269a.c | 94 ++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index aadb24f8a638..5611d249d204 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -102,6 +102,11 @@
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
@@ -151,6 +156,10 @@
 
 #define IQS269_MAX_REG				0xFF
 
+#define IQS269_OTP_OPTION_DEFAULT		0x00
+#define IQS269_OTP_OPTION_TWS			0xD0
+#define IQS269_OTP_OPTION_HOLD			BIT(7)
+
 #define IQS269_NUM_CH				8
 #define IQS269_NUM_SL				2
 
@@ -315,6 +324,7 @@ struct iqs269_private {
 	struct input_dev *slider[IQS269_NUM_SL];
 	unsigned int keycode[ARRAY_SIZE(iqs269_events) * IQS269_NUM_CH];
 	unsigned int sl_code[IQS269_NUM_SL][IQS269_NUM_GESTURES];
+	unsigned int otp_option;
 	unsigned int ch_num;
 	bool hall_enable;
 	bool ati_current;
@@ -325,6 +335,14 @@ static enum iqs269_slider_id iqs269_slider_type(struct iqs269_private *iqs269,
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
 
@@ -565,7 +583,8 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 	if (fwnode_property_present(ch_node, "azoteq,slider0-select"))
 		iqs269->sys_reg.slider_select[0] |= BIT(reg);
 
-	if (fwnode_property_present(ch_node, "azoteq,slider1-select"))
+	if (fwnode_property_present(ch_node, "azoteq,slider1-select") &&
+	    !(iqs269->otp_option & IQS269_OTP_OPTION_HOLD))
 		iqs269->sys_reg.slider_select[1] |= BIT(reg);
 
 	ch_reg = &iqs269->sys_reg.ch_reg[reg];
@@ -990,7 +1009,43 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
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
 
@@ -1137,12 +1192,30 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
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
 	int error;
 
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
@@ -1772,6 +1845,10 @@ static int iqs269_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, iqs269);
 	iqs269->client = client;
 
+	if (client->dev.of_node)
+		iqs269->otp_option = (uintptr_t)
+				     of_device_get_match_data(&client->dev);
+
 	iqs269->regmap = devm_regmap_init_i2c(client, &iqs269_regmap_config);
 	if (IS_ERR(iqs269->regmap)) {
 		error = PTR_ERR(iqs269->regmap);
@@ -1897,7 +1974,18 @@ static int iqs269_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(iqs269_pm, iqs269_suspend, iqs269_resume);
 
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
2.34.1

