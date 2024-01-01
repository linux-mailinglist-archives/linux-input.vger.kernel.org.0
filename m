Return-Path: <linux-input+bounces-1068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A2C821537
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 21:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7933B281C45
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 20:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B76DDD1;
	Mon,  1 Jan 2024 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="NLCQ5KQ/"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2060.outbound.protection.outlook.com [40.107.101.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F5DDA3;
	Mon,  1 Jan 2024 20:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/vPDeY7O7RSnWq9XfvbutsnINUw8oGjI5/mcKE7yWf+cXYNLJSQh72QrKK41CxPAp7Mdow4A9linT7TuK1A28rLlxVPiKkzzZGPPVlVH8UZXEo25T5/wTEDEwUVpVYCDEQB1wCTOvUz0pTQnZv746cIzQGubLxA/dPCOP/n90FjOIeP+tILY+BOrI+Zbn89akcD8fk537DZ9K4GuhzLjqWdg70W4q63nBZzAMNOg9coCHQu2RI8c4jWxw8V9ar0eBKNPL6a8BLGQkyh5GNchEaES6wd+Df4X5ZgqXATZ780gRJamzBeJJSqogDSYcJCRPJxRJvSfekR3EXz7v/XcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sN3RBBn0JvZA2N14Njx8Tte4g490sseYPn3vsHXft5Q=;
 b=Rs3Kb5RRSYCuZfiBv3Wea95FJuJ1gltbu3wjNUfjUvN/RWpaak3vi6DDA7WURq1/rHeJGqbc4ONxVFiNSF1nznzKn2U05mXyTQsPe4hKFRA6JTYt8SqrzW43HLvYAEFazVpGzmIm+HLGnx5IrBZa3KOTXqWmosd17r7Gzkf1eVLgpGLaBqEx6noH/g9pMjsPdxqMNR13IMkXWzy9jZRFKi/ier8m2ixjpzOIgTldGNlS9aMrQlEZ5MoDsSq5T+vja+3LnaGVHcTtu5TDIM297conewvQejLn0HDpMi+LSbc2fY0JC7lWt3dd5AgHxLnhtjTzC8QM31pRhrzTN3HVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sN3RBBn0JvZA2N14Njx8Tte4g490sseYPn3vsHXft5Q=;
 b=NLCQ5KQ/JL5op9+0w9oVQi6KZZqjWaPmJxqrfFYGK/XmgKG2E3RCHaXGwmK0kf+Pm2bfnXk5ibbvPg03qxrYu6ZadP7nCrlzcA7hgNOTCwecifl+WdrepLnwCm+hkViT4sZAnZWG3GbMpSWqr6Nh7BnNE1oxrf2p7whxzSXg/aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BY5PR08MB6423.namprd08.prod.outlook.com
 (2603:10b6:a03:1e3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.12; Mon, 1 Jan
 2024 20:02:47 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da%4]) with mapi id 15.20.7159.010; Mon, 1 Jan 2024
 20:02:47 +0000
Date: Mon, 1 Jan 2024 14:02:45 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	jeff@labundy.com
Subject: [PATCH v3 4/4] Input: iqs269a - add support for OTP variants
Message-ID: <ZZMaZbdk6iAKUjlm@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZMZzeX77VeHdIeL@nixie71>
References: <ZZMZzeX77VeHdIeL@nixie71>
X-ClientProxiedBy: DM6PR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:5:14c::14) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BY5PR08MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: a35c7bf8-943b-4393-c169-08dc0b04a039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+RVjqqkOtPjM4NJA4DkR2L0ioPi21nQpUMifOCiYAX5fM95Oi0E8SJA922U20/NwlEsU27c5nng2mU5wqQh1WAg+asYAkf6bxixhFXz8c8D3J4OyZ5d9qdd8k2S6KrxttSHM3QwfgOADpHoyXpajtdVva9ucY1cP/heu7hwVdeZNonilYN/kCbURTJgxuq4fGH7GMprfXxftb5pU76lzW0Cqr1Yu+kUe0GLR/1E2qyHtvaPfGIEWkj7l8nTFz6XvauMXdfbwXeU+7z26XEqgS3GDPcAzH7FxFMCcaBvq3gB2ngDc3AD+x6Micw734G4RW02aWb0acL85USZq/3AR1vLRozvrk1g/qcySilFVNVi8XJocM0r1x6U33RML2H077caODRXhXkJTX8uY+K5mDOuhcy/4I/4TgbuEkp8u5RIfqggGIAL8uGBLRpwd666WicOs7Rg0OOpdbdBw6ql1EWKh+CLfYLiF6hlxNt+IvTGpjuFlqRlDhgtXiLHglVwGZ7FpVrmbmn7MLRV+++Rw1g3PestLSEhT+UeUMWf9KN2PzFaIK/kF8QYeGU/EMKGF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39830400003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(5660300002)(41300700001)(33716001)(83380400001)(107886003)(26005)(478600001)(6486002)(6506007)(6512007)(9686003)(38100700002)(86362001)(66946007)(66476007)(66556008)(316002)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w6A9Lm2I3K8wkOmCcR0kvy4KDpGY40AmCnnxaBB/OEnTAL+AnjEhpu8vzygT?=
 =?us-ascii?Q?0Z6zUFjl4hRVoa+CEpdDdH+s52EgCWRYctGA42r4AJ/YZHNOBZvnUINdJx9y?=
 =?us-ascii?Q?8mLGrnlnKiP1KkjSqLHwAWh0MMzDLQEzm/ZWSTBN77llc/FHyomL/H9BYATH?=
 =?us-ascii?Q?+0NaOHgnTKEG8PGnTx1s89KYoUnQP54rMrzGOeIr3F2zXfbDjltOwgJ6UAFs?=
 =?us-ascii?Q?uH9Z/72bg6pmwBLRA8jgfWAkkFS8L1Krtiqou3D6ay2/+/4viWgBiMzHbrJ7?=
 =?us-ascii?Q?6+2R7hSrZDxJPIxaRuImVgr5ujaVW3p0pUUwciQizAKC0LKValdxDvGPpHVD?=
 =?us-ascii?Q?SY/WwH6iPJAnaEFeMBK1eq0I59nSLFcu+gqrnOOON+r3JxIvZCiJLgMHljjW?=
 =?us-ascii?Q?1BBA0/Wn3IpcIjcXPCRVY5rTjyMwf4f+oN/3N/wb66x/AC98v3J6GKcX1M0o?=
 =?us-ascii?Q?DyqZ3PiKW/FsXFvnXnVxfVprJsK8j1Rl7reCUDboRpCtK4Ysxil9Vq6bx2n8?=
 =?us-ascii?Q?pRCJyhHE7knA3m0M5IFp8lH/2EgTsNEpT3vozq0Ju7R2Y4/2TabvdFKgbkI1?=
 =?us-ascii?Q?ItAZeD68SKsjhejzfEQviWQrZXjLQeF0iGQgQQ4XRrt2A+VjUpA5zD9xtNpR?=
 =?us-ascii?Q?1J0sNpSg9I97Kfn/zzpZ0eTNElJ7E0Of/kmfyHXy0AOqleSNvV+7hzV6/512?=
 =?us-ascii?Q?AWiKO5FIrNT5/v4mOy82+6q4xTSEGVdiNZV9WzyHSAZqWoDsy1BrjFaDj/nl?=
 =?us-ascii?Q?gopm6fwdtTTDdzBkSXlrHSMMpJJtIxjhWapZiVCexwbTCdsDNDgsK8hhno9R?=
 =?us-ascii?Q?toOH/wDedF1sPcwqJGxifkTdfP3mdxeAVmX2nYOOuf1XUmVsW99aCbLE2eG4?=
 =?us-ascii?Q?xP4ZOTlCflJP9T6rWo2by/UIEfTw9NpMUXreHIbAcOaeKxIEiFOeQpK8zLyH?=
 =?us-ascii?Q?DROx1oo905T6tByihocnGiYzgUWaaEL76OMLCtpo4nHSY2olvhjhk5lI6HK4?=
 =?us-ascii?Q?dsv4nCt3+fpFqsvk//iUALs9sAEkQrwYqr+xM2LlZZjGdJRCacFZiB6Mi613?=
 =?us-ascii?Q?t5wP2H50c1VtcITGPix6cDJwDRghoaujUOLHD2VPh2W3w8kaalsNmym9AlcU?=
 =?us-ascii?Q?bOVqhLNfams/6p9XGEHObz/1aIY46Q8WS/Ro+sh2IZsgWQ7E6nKaSQBL/odm?=
 =?us-ascii?Q?R/KQpK3RgderQX70JAleL+jQIbdZvUO05OCrIZKUN2+LJP6UvZSP4JA2HiTi?=
 =?us-ascii?Q?U3l+dx7QMbf4ZQoEWtT4t6q+J+Iusy5ihONC6x+cZZnnEqVzH+26hB0YZ08W?=
 =?us-ascii?Q?gk1+ltxMGELYlY6sD5DZOIYTsJ6tIJC/TOJQHTUFobzzG312qpIS/7gt7/XV?=
 =?us-ascii?Q?TESTtYXHqNtKSA/HMAyCsgnWZwWPXkOhcUPd5Tfg13LTxkUj9Umnu1UGRd31?=
 =?us-ascii?Q?0l41M3EezMPQfxy/iKKqunql2v1wCRt48X4hMWUl8ktP9nV2wU/3hVZAZVtX?=
 =?us-ascii?Q?/JQj0MJdWRUlglB3k+w5Y/axzAHvRI/91hpq9QhPA7EkZwRfK95BFkSR880U?=
 =?us-ascii?Q?tA86s46NFidlj/YFIKHsrEDxBMVqoqcuJESap7i1?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35c7bf8-943b-4393-c169-08dc0b04a039
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 20:02:47.6882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drALcH04dT5k1PVS/gA+2FH3k5+GZWTBh/cwTLK+ELJgNKCrGU9EovpGQuZIssPQpno98lzVI7fAIOwKhW7vSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6423

This patch adds support for each available OTP variant of the device.
The OTP configuration cannot be read over I2C, so it is derived from
a compatible string instead.

Early revisions of the D0 order code require their OTP-enabled func-
tionality to be manually restored following a soft reset; this patch
accommodates this erratum as well.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v3:
 - Replaced of_device_get_match_data() with device_get_match_data()

Changes in v2:
 - Rebased onto latest driver

 drivers/input/misc/iqs269a.c | 92 ++++++++++++++++++++++++++++++++++--
 1 file changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 0d0b5cdc7830..cd14ff9f57cf 100644
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
@@ -1779,6 +1852,8 @@ static int iqs269_probe(struct i2c_client *client)
 	mutex_init(&iqs269->lock);
 	init_completion(&iqs269->ati_done);
 
+	iqs269->otp_option = (uintptr_t)device_get_match_data(&client->dev);
+
 	error = regmap_raw_read(iqs269->regmap, IQS269_VER_INFO,
 				&iqs269->ver_info, sizeof(iqs269->ver_info));
 	if (error)
@@ -1889,7 +1964,18 @@ static int iqs269_resume(struct device *dev)
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


