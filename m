Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5635BA5F2
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 06:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiIPEcO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 00:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiIPEcN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 00:32:13 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BFE6E883;
        Thu, 15 Sep 2022 21:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGRtGcTAOlMkPOpeFXL6u2UyQXTDf4kz29YWLY4xoIMUhreDVCtIo4Fv2/FSJvoLOvQhZeH3gXXt6DnP7xXL+tH/Q0tQ3Uj0aBulqxyWMgTLYGJaEQCDQh1yzR6+AvOtywZr7WORaa3HNS6EX4Vnazsy8TWN5cH+5ITwi6VWpw+iGi9zWUgvPi5msWaQFhPxytEkt9hjD8kbvmAed0pZQRsgRNWp27YZDDpZ/4hAtxKIucrAs59exsFghbP9gXi3R7+jGwpVd6sZmtFwNVkg4ACE9771uZ0EuQrIGEEgJMAy++Dxgn5AihbpFQNLCQal7jQhPOC0m7ssBuNEyvvd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8MlTu4KHP0MjETakQ8o+bOspUeLSihO1HWlfhMQGng=;
 b=mv0vPS8C6ZmoOjH1bc3+B6BVeXcGfWpR2OPP3/GCSe4vgDWG2ncSSqK6TE5oGyWR4E1UBaJu8jApbC+uO6qot9X3rLllBeTxrClu9tqEPX2+CcCjsPDJwIdsGe/P1dwLPXfOvH2vImtx66OcCUur1vYzLIKXt3VzQ3GsTEJUkpA13MSINOGLyIr6cTrG2Y+bC2zb8bnorlj4sIDVLwcqVSubPsMnKvdbQWQXDCslrb6T1jCJx55+Gagc3dke/aUE8ZWBt5EKek25sK4NX9uh+VVEIHtV0CfS5KWsuYamnNHE+Fo5fClD2cNOH7qrtwLZz6yZ4rvBgRV3E+mYNkBXmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8MlTu4KHP0MjETakQ8o+bOspUeLSihO1HWlfhMQGng=;
 b=B7Io04/wtsFHLoKTZX8PSPrSMk9TrKnyp0akLbb2jyVX3pbS9opJOdunInMn8KIJChhWaxWWT+ZaiZho7AHhXgc3CVgOXjaHU8U8tY/38SUGN/fCcuYEXfp1IEyQr2z4Ut5TDg8I+xMCMifFoluKTBh4fb16kWldlNktZhg6VQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by BN7PR08MB4132.namprd08.prod.outlook.com (2603:10b6:406:8a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 04:32:10 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 04:32:10 +0000
Date:   Thu, 15 Sep 2022 23:32:09 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 7/7] Input: iqs7222 - add support for IQS7222A v1.13+
Message-ID: <YyP8Sc6k4lF9e72H@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyP7l/ts6SFI9iM2@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71>
X-ClientProxiedBy: SA1P222CA0050.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::25) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|BN7PR08MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: b96783b1-5973-43d7-96a2-08da979c6be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXRKrDHNj7eDVVYftHK8KDlCN2588C1XVrM/9Z35NzqDc55WxJGnGA+GN6bCro/OdKHZJxfiuuhCkQA9hgmEsNXf3BnwUQ89McV+Aq0cmQIRS2C96tqN6yN42d9ScLGX53KWnGEDf8f+0oC8ktHHIhoQCCItESMHT1NE9xFVVVB4YNY6RPWUdekRu6VrWpBSi3ezfDB3hjuh7yqC84tg+NjNOJ6MmB4h2TQ98cK8cOt2PiCbWoCkJV4gAgAytBY9k5xNZdvYn7X5LNo9DPL1hUDYW80hfCxSJV28c1FW80Vyl7VpyKXm9F6vDWQ5rfUKl9EdyuuJXHl1Ytc3UI0zC4XJ9TNNE4S3Rd7pQhs3zM6mkk9q4GNLnG76mCFZ2BtTgMKeiGizb8tkRX6GQTnPQI2syM0bJE53Wfee/2YRcWadxFq7aaU2lCKA50Xk2nKio4PskC+fmz0I5JpcqbN8XVPfWBdGtYjCEnUB5DC2QvFwhOVHwpUbuyJw5IXYBhl2vVM479wd9/FjA91H3pomVEO4t0Q7AkdxyCKx+S4Tz4KPz/G/4n7qjLmFHBxMBR49MY4Mf57lOUxPNByawWG+Z1OMBEpPxsLdiBVL+ey6xsEzf4BHfXbJ6YZFC/zhH8XX4mKUWr7cOa15xcPMYhomPZwpRUZE6f5Ew+ne9XzU1uPRyJesxdj/xuTfxwvTbv3nMRfWyQWEWJKCK56uHO24iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(39830400003)(136003)(346002)(366004)(396003)(451199015)(8676002)(4326008)(316002)(66946007)(38100700002)(86362001)(83380400001)(186003)(41300700001)(478600001)(6486002)(107886003)(66476007)(6506007)(66556008)(26005)(9686003)(6512007)(2906002)(5660300002)(33716001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R58JMw1NtVLoBNzgQl+n8saVE6GzwYz934mRbL5e9QY8VZGPwXtb+7naaHbt?=
 =?us-ascii?Q?StIx4oluKH+au9l9XxuseenCVCY83y8KIrZRhuqeoHa7GhpR9H69ncA3NNY3?=
 =?us-ascii?Q?P8WTHDUHS+44hI5BXaIsh8zH+09H+g7cm3pCQ2b661LlEgbXBZYfbpncrs3T?=
 =?us-ascii?Q?/K6k2DGvFNNWmWPR0p+nCwY2zGfOrOjm2Z/SQhle/SxBUktLYAqkE0/0Pj8X?=
 =?us-ascii?Q?m3g9GdIe9HB8fzooHOVKfsaHuj2C2h3LCaPZ8pscz8ywt/o5cgbFvDktUHU4?=
 =?us-ascii?Q?bMqntOCLfz3gH7p+iaSevaHGYn3nd4kNIoWtg5Nx+lZJWI6Ivh4N8YIQRC3+?=
 =?us-ascii?Q?/unk9MupJWodI0c3M4vOiCNF7ijTl95cMtJXNVAeiiwvr4o92r5FKt+QzPrn?=
 =?us-ascii?Q?ETUtMmfpMkU2mfuaf0eeua3aiJyvTXp5lomBvMp45APLFG4C4NV7BwuowhY/?=
 =?us-ascii?Q?FWvlJk0VO+VB2MsXmyUsFS1cI/xI5NPyZFJ5s6/k1YTUJZPuMwuqvGOTv2u3?=
 =?us-ascii?Q?uLL1d/OtqDJT8K02t3piU29GLK7+t3Q7NBSXP8Q1ZusXLC3+kuGQEnStXpuO?=
 =?us-ascii?Q?rTcgIvYy8fwan6gbqtJh6wvHMkSYzDFjIg/H14+7oGsbByc4dXsv8LdJNkRB?=
 =?us-ascii?Q?nI1f6Dqz87rIG8BJPAZMYRbI8d3rW7VAT4bXHq1fBLBrpGq2DtmKg5VGAEtd?=
 =?us-ascii?Q?51KhiAwapgNE4HZQxs3WjNwFl+4Ba5VBx0pd3mtScwUmFOu9nWWGg891N4fU?=
 =?us-ascii?Q?+oNK9DKBfLvUj6hmHP7BnHDbHYCQYtFFOp2kJJH4iuaCwvPuUtLDGQVHSp3E?=
 =?us-ascii?Q?FlQfRbg5oaZUOyKZw6oH7ZBa7jMFw5llUTwnGKGpKZ0OUoLa2uLzdUEReOJL?=
 =?us-ascii?Q?AkSZu27CqUhHYbcBPQ+mEEANuhsPn/E5gaK3mZ06RNwH9e334fa0uC0Xsxb/?=
 =?us-ascii?Q?TivKLCBs9VBzSQhodZrSpSoYOMuiI+YRLzIpW2+2KWMdy7Jr5S76q4bk03qo?=
 =?us-ascii?Q?SjTSAgM4l35WSDc/yQwhZvvyiQJlhRO5euLzT18Gvty+e1P7dZ/zKnTPgJF4?=
 =?us-ascii?Q?rOygmemn6kdtR0qIMnfIM/MI3mrACqzMLL5adVPPIMDnLrCk/aaV//MxpZHn?=
 =?us-ascii?Q?pBLr6sihgNunFKcdeb5mC+umF86gw9XHhqaufxcbH0c/BIC2oDrXvArAn7Xl?=
 =?us-ascii?Q?MYdOtaYbRJiP+ZMAaUyo7kAWIYvv4Nf5xsx5aoYh9D7uIK81qn0wJidJ2gri?=
 =?us-ascii?Q?i+IC69TDMLsTM/Sv1nuSStXKpMDlkBVs1h2dTAJ3p6zUV+zdmXxDW1RFJIF8?=
 =?us-ascii?Q?QLY7SsO9qqbYfqvJT4nhWpUgFkikLwTU2n5ClcT4JOhBHRnUZ5awBBXZsHyM?=
 =?us-ascii?Q?0LEcCDTfonpJn85JoosHQVbsGQ6Qm1KG0kkWq67G4Rpn4/1/gmTe8kJo/unl?=
 =?us-ascii?Q?VJs3ghQlUdNlYgFgEjUS0SLHmJQ2Dz1fylGqe3X2Z1qhg5AHnM5r8Oxf9i59?=
 =?us-ascii?Q?9FxISVJBauRvGvl2PjqI0nNxS9asZTgVyk4hvjB/FCCTjuSRXBkpUoFUHx4i?=
 =?us-ascii?Q?izy+htm2yU3djedsjOydSGOMXlNohrNRW9bNWJrv?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96783b1-5973-43d7-96a2-08da979c6be7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 04:32:10.8628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j32kHz4Xd1P2EMlrX9sMRhbbqJbJfF6VlA5Cwq7vg3IMuqpjF9KFFlVEm3sQvXlhUGqEqNf+yLEo6qwtT9RFpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4132
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
---
Changes in v2:
 - Rebased to account for changes earlier in series

 drivers/input/misc/iqs7222.c | 111 +++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 0a592b90f471..3340de51fb2d 100644
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
@@ -2133,8 +2234,18 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
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

