Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2E345B1E7D
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbiIHNRo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbiIHNRl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:41 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A47BC0E;
        Thu,  8 Sep 2022 06:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3nTIzqE9bmNc6uX+CWCnF0fM3y8VXcrmZ/pwe65IZ2LGjj/A/dtssdVO1SA2kQok7wr/idgCreB9P8RJo9GX0dx07TK0yrO7eRL/mve77gyKftrE+vQASL4in35nqQv1Baq4egdFn+KC+BNhjnPdo6SfguaQAGyX/HFn4L9dPWZBr4L3zQw95XOK4ZUam2ThaPiT0zg6SdpGubeJl08X9fxPOQipgKRbQn0H13SXSINqxP8M4w2p49TEhX0UMU1GlXgH5GDDKjKT89mhzv3pzmirGZYXYrsy0LlL2yHx8dKElnAJk/NykYIIQGZ/mx+T+b1m2/OTlTSJjbV9vybxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z6dBunGTo+w4FT6iDDcKgF2TPJQGSkpXGRYizsjMu4=;
 b=bc91jnIhgmqVCqiLRHidOjt0GiaGMraeZlj5ywQp9woSaGqcJtC/vfLc2A5gGiJRLf44N1Vu34EY2UAn4191bgX9fW49Mla9egAB3PnWVDMuoNaNdZQVVTF/SJEEioL8flFgMctfJ5J5NfzxZbbES/iN4iDV1GXMw9LlRu3MFrVBIYAO3JhhbYowTSgqu323w1/CbpZdZytSfVhFeqWg7qdbCaRCaVmNw1L08xxkrz4XFN4DGef3Yz0vxtqvXGi8RII2VgumcvulKove71lF+YDG/kE5hGQYKVdyLNVrjXjh281rzHDNJN6U8I9y7D0LHCZoyYwcQJme1ZkmLFn+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z6dBunGTo+w4FT6iDDcKgF2TPJQGSkpXGRYizsjMu4=;
 b=zDnY3R5krKuuzZALy/Ckw4MXnx8YQ8byWmV6sKYNtK2EQPwSizTIswnVdc9g+9099BL/kUT0pziynccuyKZIdQ/m6ZEhPij6BM0yl9nY5ZocrVsa9zBXyATkQQ3V/J1zCKfQtx09YvpKSmLcqOMoM691HsBpcKCiHPwFcEPCfA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB6671.namprd08.prod.outlook.com
 (2603:10b6:a03:2d0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 13:17:37 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:37 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 11/11] Input: iqs7222 - add support for IQS7222A v1.13+
Date:   Thu,  8 Sep 2022 08:15:48 -0500
Message-Id: <20220908131548.48120-12-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908131548.48120-1-jeff@labundy.com>
References: <20220908131548.48120-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8be78b89-9171-4e8f-cae3-08da919c800e
X-MS-TrafficTypeDiagnostic: SJ0PR08MB6671:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FDvWru/O/EFcpRw7a5SGfq5iC1LEdRRMRKd+3Iwe/zL34LzTSvE+Fg6o/JpXT41cvNc6NX2pllp7QCJzYvjTJ5hZIt0GO1xqVBU1YL0smH4xXzfBnSrGdCHj2WeGMXM+Nz2ndcR3k4PwCz9rKPq9jjBqb9Nh/DTTmitIpeSOcDeOcrlOoMDIvRGHBRMNBqjFrSaRvQ2XYfO+fPxHqGwlWoqUXl7Nj39Che2HlEe4LpFUryH0yzBsnf4lrJ5P0qyvl1/SRvXduMSAYL2Fdm02ZqWFRUge2gsKup5d4Ynn9jchoiUphs5B4OJBnjwo6iI/oS6Xth+kSHgb+71QyLrAIrtj75APFSZc7L9yWds2Qhiqw5kI2f4GY3B/dvWhfa/E+EjyBP8L8entSHWaOPCatlYhnmZtY0tUM32LsawumvTLhZxclG4/RIksQyPUoHmy8smjXCudatdN3TJJ5bYBw3UGfzaR2hIIKVRguZZc5MrKpXTGJ62m007GyH+oHBEfFcF5T7wR77ktp/8gD0mb5B6LGRgxMDh1TiyTaBoRLixu1JaP7emRFs3DvUw26LkemUo7DP1yJ9SzsKrLUTuCu/sq2ignzlF+xCEQLZ3OnLd7MPVEPEMt+X/dBJBRUC8uQB6qdCv4O1fNjsbUVM0lLyHhtJxkV3gzZUnm0iBHoM6aPGf16XbY0VpF/9K7zh7/w5NWTBqTgzgbJ+ZZMrf80vw0BUzW0TrIDt+hElmFYaxj9AXLMeOo7Y3TcUJwqaMm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39830400003)(376002)(366004)(396003)(346002)(86362001)(66946007)(4326008)(66476007)(66556008)(8676002)(36756003)(38350700002)(38100700002)(83380400001)(2616005)(186003)(1076003)(26005)(6512007)(52116002)(41300700001)(6506007)(6486002)(107886003)(6666004)(478600001)(316002)(5660300002)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YYhSdbpuITNMNInbPKR4QK1mkIk7RvnclHTTFg0K4TVszgBalEvbXxLqqZhW?=
 =?us-ascii?Q?3ehEZ407M97PSVdOT7epM4xpVOOEEu+X+vKynsUqR+Cy4BFxV6HNj5JxIzsA?=
 =?us-ascii?Q?esQwWfcuaP2FfX08QQwOAuShbm5r1MkP92Gv2Bw0mr+ZLmYA2dbYEnJvTrXw?=
 =?us-ascii?Q?nrQw0MR2sloNVBclo/zOTxaazd1APDHzS67U3bYyWeLyJJ3HGjpz70WSufHS?=
 =?us-ascii?Q?1hGMYQGR0Dp+4e9de1iHHjWKXWZp52USR+6SvhhoFYTStCaUjehKYrucBeNw?=
 =?us-ascii?Q?sBYfunfKoeL+N2TmzMk8JNYLyjdaskb7IjypKOTY5xluiKcqBbE6pZcZAiCz?=
 =?us-ascii?Q?TM4rgwELhSj+E/+U3fi47rKBhw16cFP/0IU2rXSF9lsOUkqQjzJobW8Id4DO?=
 =?us-ascii?Q?VTt4gUzqIFvDeR+iE0E+WYzSvsHjfzgQRgVwOAl8Wr48EaIqlL9dOLa+7Y/g?=
 =?us-ascii?Q?fPRPY28UpEzmyqQHJkYugc2wePpn9L8JKGwiaqOoVdmPdDj15eHjKQdyL7nz?=
 =?us-ascii?Q?4hktqXnN66DO9SUeTLfymyi7togysT+rpcbxu59aKc8QVL5TMI85CZDARlmj?=
 =?us-ascii?Q?Z4av6ayGgpYMFKk/0ne7gZKKHa0T4lzNf5DqZhj+ytPNWs60Omvtf5/Lskrr?=
 =?us-ascii?Q?A9/8o9Msroy/hClKA/E2euI7kjtkQhsikwngXl6UhsN+KNrJ0/72P+RqbA4v?=
 =?us-ascii?Q?zNUZ0SeZtCnFSpgONZyfeu1T3+zOTpm0DUqpuI8/zkeG8pUU8JxHjkCNiG9R?=
 =?us-ascii?Q?wlrJYI452LOThkLwEMrictJxMaj+eFzXW65fYcYzE5iopt2zJ+1g4uPSenIT?=
 =?us-ascii?Q?dHTh3FKVWfuVI2qRtVlbHnjTz3lLmvPV4iWAOPYeWKiipILQk+QaXP5IG6Gq?=
 =?us-ascii?Q?Y+yhPldrRhHvnZUvRIlHmYTQFqkfhl7Mu9V+tV0CKSuzCw0faFYaLiuhhl3h?=
 =?us-ascii?Q?ci5Y/IwqomFyVOBW1LUaxvvWYGe1lPyIdxPCzUo6ouqMqa3UuF8jZQMX5Tyj?=
 =?us-ascii?Q?IQ63PjddOiSDZz3BjZB4yPnKFSx6Bje7djLY5eKWBMtcicZg8DqwEVAH+NCj?=
 =?us-ascii?Q?8SQoSc+r6MqG5sTSGOEH+BIyH/NPCWNgdZ9G7Q2bOnayrb+x+AVsa8DAKkyz?=
 =?us-ascii?Q?zX3RWZ8DhO9JzDg8QnG5ps7riTE97jxSyPWHLkj4F15HoMrLtxZsiYOkfg8C?=
 =?us-ascii?Q?y11jiZTegQwrBqcBvTFj+62OWMAmaLOi7yHz8H7FPnS1hfnL1Zi/6x/tZDIl?=
 =?us-ascii?Q?tnIk/Dn+LUxKNTevLn9ZwdTVu7+0AgPcUfcrCGObVv5ewrnGL30DiAhU+nGv?=
 =?us-ascii?Q?dNBknHswMbXHyzIvsDDw3M7LZV/J0A4tDO6CUREQ4z/dg4zbKlWZaC0RL3wv?=
 =?us-ascii?Q?T9sxrZCXhBr7j+VbHbI2kxNS/RPuS7m91ntpFieAqiyxo1PrpJChiO7RgQDa?=
 =?us-ascii?Q?YM2eW58SAm77FQbuAGxHks8Dk3X/d5N9PU28f20bNmus7kMb1kVgI+KBDEtd?=
 =?us-ascii?Q?0hjPY9Zd1AkgaCvv4TsrgujO0yNKZmqCNuv8U9pXqkOj+GHZYC814krLBzTx?=
 =?us-ascii?Q?o/6hti2KiFJvXBXAWRK3TsLB2BYf1AU4YPxIqzC8?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be78b89-9171-4e8f-cae3-08da919c800e
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:37.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xg1nMDQlio6D8vZI8ApavX2BVKHyUjoPmeP9ncNKY/WixhfgNv464XXBQ/MAr5kN6GLxA33ZBmZ62AZXq48J9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6671
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/input/misc/iqs7222.c | 122 +++++++++++++++++++++++++++++++++--
 1 file changed, 118 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index ac810b8ab69f..15f0bfa899dd 100644
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
@@ -2213,16 +2314,29 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	for (i = 0; i < ARRAY_SIZE(iqs7222_sl_events); i++) {
 		const char *event_name = iqs7222_sl_events[i].name;
 		struct fwnode_handle *event_node;
+		enum iqs7222_reg_key_id reg_key;
 
 		event_node = fwnode_get_named_child_node(sldr_node, event_name);
 		if (!event_node)
 			continue;
 
+		/*
+		 * Depending on the device, gestures are either offered using
+		 * one of two timing resolutions, or are not supported at all.
+		 */
+		if (reg_offset)
+			reg_key = IQS7222_REG_KEY_RESERVED;
+		else if (dev_desc->legacy_gesture &&
+			 iqs7222_sl_events[i].reg_key == IQS7222_REG_KEY_TAP)
+			reg_key = IQS7222_REG_KEY_TAP_LEGACY;
+		else if (dev_desc->legacy_gesture &&
+			 iqs7222_sl_events[i].reg_key == IQS7222_REG_KEY_AXIAL)
+			reg_key = IQS7222_REG_KEY_AXIAL_LEGACY;
+		else
+			reg_key = iqs7222_sl_events[i].reg_key;
+
 		error = iqs7222_parse_props(iqs7222, &event_node, sldr_index,
-					    IQS7222_REG_GRP_SLDR,
-					    reg_offset ?
-					    IQS7222_REG_KEY_RESERVED :
-					    iqs7222_sl_events[i].reg_key);
+					    IQS7222_REG_GRP_SLDR, reg_key);
 		if (error) {
 			fwnode_handle_put(event_node);
 			goto put_sldr_node;
-- 
2.25.1

