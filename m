Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69A636090A0
	for <lists+linux-input@lfdr.de>; Sun, 23 Oct 2022 02:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiJWA5b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 20:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiJWA5a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 20:57:30 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685AD6F243;
        Sat, 22 Oct 2022 17:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPopNnPnlEDLLjKKAaSWWWm2WlAuuEOBgeS4KsT0U2TRm/WPxrz7Ki+B4u1PPMUkfwMaHEW9gp97tKXUwt0Rm0AjX7iNtAoh6JxgIXQwa2qJWDD6LHCw1kZK2e17T59f6OpCkU+0VL7cVKy7JhvpdzKKl6Y6dZTf3PtUfByMFo4K996Kv+Js/jRaFzFvZvtzaYUpvYveas1lVTRt17TFW11PLK3pJ53W9/KuPR+aNuZKelr4QYt2Qjlh/G6FqTenyEKjdgaSq796orwPMAmZGbo6kCUl8tOO58jvkPeqO7mgvB1bIZYffjIXFSwjnwgMwK6AIb8rF2kDP/WYXwREFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EugJVYl9cHPXUVkxCMrGBYskUwVPTui/O5WBYvRVJn4=;
 b=lj8hHKv5DZrbFnV/l3B8mCUYFuuhruCpLphS434OBnwjmmMjiHe2Pd1d4bHk0ICFIZ5qsLMk8onQ+v+TPatQi8zTrUrYXWpOvcy6LMAeII6rX4aCWQnMi4fr/tisB7ptvHlndpWRgJD73oVGRjPAwsWeA5YqoJ54hfjUs3F499XpN+u6o9jIoSy965D2J1qMTJhIfmYWhs6Zw9R3MBKwcfT0tT8JRG2uony/UMWzo562kJ03GBCyylnir8xsKUzIJywnrtDNj04dAqh1BcmeO0LrW6iNwfEY2gR2awLyDtb8pP0XbVdJav0hb1SVIyX0a2xP7PiPMEuzSLahclYXdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EugJVYl9cHPXUVkxCMrGBYskUwVPTui/O5WBYvRVJn4=;
 b=C2f3tgJt5FqTkni1LCrX+au16nY4f1BD19hkVbZ7uVP3F+p1aXE9tC46DOdxvXuJ2+xww23Qt79TJLIXzjB5AqlIseJDrGYk6erN81twVmrVDw6P5ZXzSSwGoFLSZZ+qakuUuKusQzL7KJKwT1MlGKXpj2pLyYGEKTqDPp1quWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4896.namprd08.prod.outlook.com
 (2603:10b6:805:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 00:57:27 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5723.034; Sun, 23 Oct 2022
 00:57:27 +0000
Date:   Sat, 22 Oct 2022 19:57:25 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v3 7/7] Input: iqs7222 - add support for IQS7222A v1.13+
Message-ID: <Y1SRdbK1Dp2q7O8o@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: Y1SQ2t6yUvdaIQPG@nixie71
References: Y1SQ2t6yUvdaIQPG@nixie71
X-ClientProxiedBy: DS7PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::33) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN6PR08MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ace626-fe60-4b49-1afe-08dab4918df9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZuuJuhbtBBbmd2lXg6YIUzPs42gjwHvazqiVuNTNyDaOLiLLIBeGG40iA9Nc5On8KTD6IFDajnvrSolwwNUDR/xyrK8QgOyPjABH9jJp1NPQkxnI2DfWIc7/79ote7GrqRzDSyTjHZdqJgSnqh6oiN7ZGYZAEuUVPRwjs3VttxZmKb+CsxVwSvAP6PTppz/U3IEgkN5DvlVEDk9ej3xu227i6YVYm5NpJrmT7Y8GxOy5SVUq957r/87PS+//TswjPj/rO4ygXIkHNU9u1I6PWdVvwri+DHvUnjYB5xerpKMVQ6TAuPw5olGU1qLkblZhPbnOy8SAjCdBLoS+Z4hQhURAiKJXk3S8LV7ZEreXLuyq5n/ZNhr1U7qMJOEGkj4KYXJxL+NgJotvabvW/oASFKjpX8Pl5LYxsY+f3v7CuF333o9MSuHhHbGRBd5aqiNbwSeIxzM2YitBG1aro74mcThVjG2jlJq0RKHxApBUBck0H1sz8KOBalTrRdSL6lpQLHSy/yCKHDkRGBd25qZ5nkKRpLxgpJtddWX66auT1Rh0e5cMXiEWGzOlw0Utim0AgFzhuldjvxCYjct/z/2R7ZDNBHpgIyuFsS9hscgweVfKZeN8oLPPw1gdMrRCArvl3+eqAvvvpir4YHYRDBKWIhzHxDavvpzWQ6j7g80kJGfTI1+FgXmFUIW8/XcZnZ34fMRZmfUz/0PeQ+uDeKVBFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(346002)(39830400003)(366004)(451199015)(8936002)(2906002)(38100700002)(186003)(6506007)(6512007)(9686003)(26005)(5660300002)(41300700001)(86362001)(33716001)(83380400001)(478600001)(66899015)(316002)(6486002)(107886003)(4326008)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xBbjv6g3Ndte2F4KikAQTCguwwU57DVEwwaPNe27BtVzz9Huz4oa7GKxzOJg?=
 =?us-ascii?Q?TD5DBeF1gCjYqdPZ/rQL9tWsRlmaZsa8oWkkwSIphw1QDjddCLg5JFM/cdpf?=
 =?us-ascii?Q?GZotVDeJP9GzssvVcJ6nHGdd2KBK4DZ2epuzEIcFl4P9NdWIZaAPOSBUlqWl?=
 =?us-ascii?Q?xdatEdr4bS2VaMwzJfhtIqiQKdofVo3/rBh/oxSO7GGgDil55eQXz+5UmNr9?=
 =?us-ascii?Q?0+k2Hx9+Q/DAKCDTIX8rYUB7n6DXKAPeSZ4RrXaeYSRw1/B31cgNKwB/XBR2?=
 =?us-ascii?Q?w5GtxK7FNEIG9mP2Oah3m2JNk2u0/onyMr5IQf+W4Kh9K5T2k22thFyKFvj7?=
 =?us-ascii?Q?sE6CUeBhEFrJMLYdKrET75c+QInB4dI3oaQ8Q7vOUysL3MhH6dkvbKNOqfOy?=
 =?us-ascii?Q?hURPKkOJbb4XTBVJEzvK/2DFTjHcRWv6TGf96NFkc0vUfPcOUtbhHEWMcr2g?=
 =?us-ascii?Q?ag5t+8L53TVq+phV8NmvRkSwjCbEqGjWtDHG7UREmMZcmoKqOct/WLppYBu9?=
 =?us-ascii?Q?H8HUlSFvol2YEsbzeKxPu8A9QIm6A5hut4x3m6Ip6rvctsa4TDc943SYgYt2?=
 =?us-ascii?Q?SM4s73JiqAJDu+0X1yr2cReg6PsyiuTswhmI+BHtL2F6we3myJKwNXSflOO0?=
 =?us-ascii?Q?TfqRAxmuIJcmzsN0GXvcBED2dd/N1reuav9LtG9q3HJXofos/u4RkucB2GON?=
 =?us-ascii?Q?8MwOlS5F2QHTA6qu/xY2xKnBrtAKH6X9xSgJqFGFooyGt0CiUOXcCXdZ5JuV?=
 =?us-ascii?Q?KYPRdrQNBHSxwBOM8zkCsSmj3h5FWY6CTuc9C8ZTbggUwgR1/+w0gz54h6vU?=
 =?us-ascii?Q?wULCfreI0OKqdn4n/Jc/u1QT7VI++WaLyuXVznJ8uuyH0Fz9vPKJ8w4vuS/5?=
 =?us-ascii?Q?3vusrgLLZYRJ5GATfZGg3FquBruLXmIDDzx+lFdAS52qHVZgSg2GlqwLGic9?=
 =?us-ascii?Q?lBjXL3rxELgo67tyJJSWrFS/2dnju9aBRktIhg85bxOfPEecFb3KQPH4ckMD?=
 =?us-ascii?Q?W7YCFvr0IcjyG1jtmG5zk+28UYdq0bktVSprVEsFirXHYK2HAHvHzhDWBG0h?=
 =?us-ascii?Q?Nb6cbRgC2POOyWnDzgdI1czqwnjDtxwzmY5+mkf3C+7cMmSWGhOIXeolC2eE?=
 =?us-ascii?Q?aAQA999MYAU/KHJJuTmM3+xfbjJLo1u3hAJsWcl2DKsT89YHpR1ZFAcEGgi6?=
 =?us-ascii?Q?j+A5mJMrDXMIdNSyr2itfJwla93zEi1dT2rSuxtrqFqqC+wvUI7Gchvx9QKR?=
 =?us-ascii?Q?Hvou5mQYZzCa+UEOMwJcnoVSehLVQXoTgl/Hi8TPllJNpGB37n2mk/sf3efY?=
 =?us-ascii?Q?mj7DcFkajnrqG7P8/Tmz6Gq+vngak36oREFjnM32StzDhwM2B2CEuo3iDpj2?=
 =?us-ascii?Q?yDlJoLRvoHgSwA2tWx9UKTpf8i4bpXrEJVDXr8kWTwIcmYTaDGZcCHn+dhE5?=
 =?us-ascii?Q?8iH6X62ajR4d0JJYRuFYDomWQA3PGknwxXidpmZ6uAgrsAvBFztSyzsOGfPX?=
 =?us-ascii?Q?x63oPiF5rywoz66RV8y4SyGdLztznKZ5+re6RVV6dVzbE5YMjUa6BrvYUJYZ?=
 =?us-ascii?Q?ZbWtkAohuaPvJB15rlX6qvDJGE1iWldc2nPppRdl?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ace626-fe60-4b49-1afe-08dab4918df9
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 00:57:27.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXWve4UeG3y+Oh89VQyK2TuEr7dIqIkLgAAF2Fr2PC48yf7mpQXmIhoGBVPT8PUV7Pm0B5Vlzm5Trxbf9ekd1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4896
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

IQS7222A revisions 1.13 and later widen the gesture multiplier from
x4 ms to x16 ms. Add a means to scale the gesture timings specified
in the device tree based on the revision of the device.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changes in v3:
 - Added Reviewed-by

Changes in v2:
 - Rebased to account for changes earlier in series

 drivers/input/misc/iqs7222.c | 111 +++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 6af25dfd1d2a..e47ab6c1177f 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -86,7 +86,9 @@ enum iqs7222_reg_key_id {
 	IQS7222_REG_KEY_TOUCH,
 	IQS7222_REG_KEY_DEBOUNCE,
 	IQS7222_REG_KEY_TAP,
+	IQS7222_REG_KEY_TAP_LEGACY,
 	IQS7222_REG_KEY_AXIAL,
+	IQS7222_REG_KEY_AXIAL_LEGACY,
 	IQS7222_REG_KEY_WHEEL,
 	IQS7222_REG_KEY_NO_WHEEL,
 	IQS7222_REG_KEY_RESERVED
@@ -202,10 +204,68 @@ struct iqs7222_dev_desc {
 	int allow_offset;
 	int event_offset;
 	int comms_offset;
+	bool legacy_gesture;
 	struct iqs7222_reg_grp_desc reg_grps[IQS7222_NUM_REG_GRPS];
 };
 
 static const struct iqs7222_dev_desc iqs7222_devs[] = {
+	{
+		.prod_num = IQS7222_PROD_NUM_A,
+		.fw_major = 1,
+		.fw_minor = 13,
+		.sldr_res = U8_MAX * 16,
+		.touch_link = 1768,
+		.allow_offset = 9,
+		.event_offset = 10,
+		.comms_offset = 12,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 8,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 7,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8700,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 12,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xA000,
+				.num_row = 12,
+				.num_col = 6,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xAC00,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_SLDR] = {
+				.base = 0xB000,
+				.num_row = 2,
+				.num_col = 11,
+			},
+			[IQS7222_REG_GRP_GPIO] = {
+				.base = 0xC000,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 13,
+			},
+		},
+	},
 	{
 		.prod_num = IQS7222_PROD_NUM_A,
 		.fw_major = 1,
@@ -215,6 +275,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 		.allow_offset = 9,
 		.event_offset = 10,
 		.comms_offset = 12,
+		.legacy_gesture = true,
 		.reg_grps = {
 			[IQS7222_REG_GRP_STAT] = {
 				.base = IQS7222_SYS_STATUS,
@@ -874,6 +935,16 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
 		.reg_offset = 9,
 		.reg_shift = 8,
 		.reg_width = 8,
+		.val_pitch = 16,
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_TAP_LEGACY,
+		.reg_offset = 9,
+		.reg_shift = 8,
+		.reg_width = 8,
 		.val_pitch = 4,
 		.label = "maximum gesture time",
 	},
@@ -884,6 +955,16 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
 		.reg_offset = 9,
 		.reg_shift = 3,
 		.reg_width = 5,
+		.val_pitch = 16,
+		.label = "minimum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-min-ms",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_TAP_LEGACY,
+		.reg_offset = 9,
+		.reg_shift = 3,
+		.reg_width = 5,
 		.val_pitch = 4,
 		.label = "minimum gesture time",
 	},
@@ -897,6 +978,16 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
 		.val_pitch = 16,
 		.label = "gesture distance",
 	},
+	{
+		.name = "azoteq,gesture-dist",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_AXIAL_LEGACY,
+		.reg_offset = 10,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 16,
+		.label = "gesture distance",
+	},
 	{
 		.name = "azoteq,gesture-max-ms",
 		.reg_grp = IQS7222_REG_GRP_SLDR,
@@ -904,6 +995,16 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
 		.reg_offset = 10,
 		.reg_shift = 0,
 		.reg_width = 8,
+		.val_pitch = 16,
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_AXIAL_LEGACY,
+		.reg_offset = 10,
+		.reg_shift = 0,
+		.reg_width = 8,
 		.val_pitch = 4,
 		.label = "maximum gesture time",
 	},
@@ -2115,8 +2216,18 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 		if (!event_node)
 			continue;
 
+		/*
+		 * Depending on the device, gestures are either offered using
+		 * one of two timing resolutions, or are not supported at all.
+		 */
 		if (reg_offset)
 			reg_key = IQS7222_REG_KEY_RESERVED;
+		else if (dev_desc->legacy_gesture &&
+			 iqs7222_sl_events[i].reg_key == IQS7222_REG_KEY_TAP)
+			reg_key = IQS7222_REG_KEY_TAP_LEGACY;
+		else if (dev_desc->legacy_gesture &&
+			 iqs7222_sl_events[i].reg_key == IQS7222_REG_KEY_AXIAL)
+			reg_key = IQS7222_REG_KEY_AXIAL_LEGACY;
 		else
 			reg_key = iqs7222_sl_events[i].reg_key;
 
-- 
2.34.1

