Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9109C5B1E70
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbiIHNR0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbiIHNRX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:23 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928338307E;
        Thu,  8 Sep 2022 06:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/hWUX8sdNz+Z8o1CQ60P6hhJaz5Ji8iujE5yL1+W2d411UTEzRkfZ3yfpo2gTYHovndNkpOd57ayOgVJ/TMwCmeIhPbsxmKsjmDiQfoNVg/qZlULmostcCZpvy6iubB/F5pO1b2dqJRt4fBLcny4Jx0xea0BCrWnXXuDSnLSgVP28+L1ONF78qy1iUPYpsBr1uDI5PSPccGZ1cTZ1tUFdElyhly96RRmAWvpFoHtkOJpTsH6Jf4JA1AGI/b2LS03TTxv8n0P1qiueMhRcSJ45KAIHwJ3iwNTbY+GtYDHZbR2HbRYTsqFE0GTDdgPwmMqH8lyW3tDoaxO/h4aNyF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7ZmgEroWRBoqzBKBPBXo0rXHrQOa5zwapyrt7KKPyU=;
 b=W38t2/JninNHpygv85pQAJ6V35Ln8cUJCdig4QYf3a4Nltb/+0MpKJghluAEuPQXXUOq8ZwT5SQOCuLA/WNCkgiooKfkwf3Iagqy5hXFGBj5cmuKkh1yuVevxDgro4WLUZd3sdd4K7j1cKnEC875LDncRrMNeFEMvZ70nY+l4SVvKRzMsWhlKnRmKTjHEdk1bbOAgwN6xQ7EnE2kP8UAeB7XaS3kwQnUezi7/e1fQhtURGdqA7CnOmSjUgbxo4kd0kJPb/2WiJkIiNjPPS0wb8fNc7kqNt2e3WAYxW7A1y5GV7i8wmahjo4YXyQFvEhrmGFoK1Sh88fL0Vr2iYxPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7ZmgEroWRBoqzBKBPBXo0rXHrQOa5zwapyrt7KKPyU=;
 b=l2J0wJDH9hpJg/FVZSx0+DVSKVVdkm7Jj2cyBXINFnhTGib7tCTLinTGnCL3IDQvB8+SADr4jp2BMC87VLxZJBeo+4dWAEabEjmf0l6wVF0UvdO189QQ2O9b6hjF4UxhsqCuI1zDudxhjyYUUGiLBJfQaBU5vx3cDFkGCAK95oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:19 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:19 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 07/11] Input: iqs7222 - set all ULP entry masks by default
Date:   Thu,  8 Sep 2022 08:15:44 -0500
Message-Id: <20220908131548.48120-8-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: 53be3bd8-330c-4bf5-e60a-08da919c752b
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YiCUKcVOzkIGBVyxB1Nqp7NpCQcxhxMkrfUe1DFIfuFOa3wO+U0lkqlua+d102rIXLUeFpe4kIsgwaDEwVcznWSI1oxV4FGQdkFQSh9PBo9rMKmEXTiD8ts7TxzHoxVA87NF5o1jsKVRTTigkQCE4QxY8qkfO0PeC5N+2hFZigwcMC2RPJHnvKvcd95t0W8tz8gqe6T8lyUUXEy4oPk1jh7mJvZyz8R3qi/LSWHTO7CsjfSssS3K82aiSKLXhURXQ+8WUywbVRP0Q1oTkDueWdpY1m3G3H21dzojVMIVsdrmPBPCLCdrLPmdEfC3akUcZyuhcUrzGfwW5NutaIqYgA48J8CCOMNiN/OplZOtUIlT1CEA0Vx/bELn+fu8oTbNFcns3gGXd7K3TJge6mZAPvVs9sPc0Wh5UwoZP9PUz+YR90gvOoJAP7HgsRKf8nA0y8irD/futlf8qL0sRDoKmsTIqdg5P4AM//tipwIIYGTNJdHy7DB1RZQQQn1XfqGqs6g3WdhIcgy0q/qLuOrR+OdaKksRAgLXbWKsB623pLV+qnGYBMZAmXTTeihGiKmDjOYxTzaKGjkht1Fl2ON+JJqGnzoeI/EmZZSqFRRSsvCXikI+hRsNn1DSDSh95iDZEUlytZfi4eHmp8cZqeATCrt+KzgpdfVBJgmZrjNJ/WZUUwvjB8FKVe/XvDKtbzjlxD/5zpue+J+Nkj11HBSDTxMWqpJ2cv3WYQYb5UgAWB4vKhLF1YKpcsF1IKBUv/3ifRQxKIsiNAzwNC01fmXZWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Jjuv2X5FL2hFqs+dbV1gmoxZP5LUzlLi0B0JpgQBw0zh9J5gQ5WsHOPg7ff?=
 =?us-ascii?Q?XZmjM36t6aB8rGD80xAHzBQTN2F/BSnmD5LIgnoHxG/kIZIZZleIUzjm/iXD?=
 =?us-ascii?Q?TrDoL64nYRCai8KplstlO9l4LlMr9G36Js1xE3KLkhkx42ftfrFQdAiozL91?=
 =?us-ascii?Q?0BOd+kHdh0QmeyNOSd42Z8UcOkCPKq2LAH4pja1Lee5s4vIC0lSbwotoylxt?=
 =?us-ascii?Q?VFEiSFkjg39ly+dz1Heq74MhEBIB/unf+v1CazC9kpsFmFGd9WACBExepzgn?=
 =?us-ascii?Q?DuG++el4NwgPWNb9NBVLgAr+EX6bjZ6gwDcZ8N9/jJ78QLnjvWFxloOx29Jh?=
 =?us-ascii?Q?ewdtpuMZvXb6EfocftVc061qgFkUViOI0+DC3DzS9G2/GLwkD7wjTEM+Y7Q9?=
 =?us-ascii?Q?8A2f66D8JShMT1l0a2Z5QqlXaVtzSuxMF5+HIDNVNe9F26jUGCu8TmMycHX1?=
 =?us-ascii?Q?orHN0JWTOvhmh06QsjwSjDWZPPN2z3yrx0p2LpNhGIpDObFG9IkmyJ5kpfA+?=
 =?us-ascii?Q?SqG5wFoip0cZot2yhiAcqMw1YA10NMiuJ616xXcqVCjzmeYyRpK5ayIkG0bl?=
 =?us-ascii?Q?MgFcgFWw41weFWtMc/tuvgjKD2EweXVG4KyUoRo92wUIBg0vwZjA6Ubxlcv+?=
 =?us-ascii?Q?0dpHhxeSXgzSQQy0zmrL6eCkOhQOxh415ZrA0l19qPAdncA8SsEnEm22RlHZ?=
 =?us-ascii?Q?403mDf1Bo45wj+nNJtoS6JIXZcaRwIqoIwe4Snx3ObISvkO2WvNnVlWRd4nV?=
 =?us-ascii?Q?HnOwGc+0vGwoogccIORq0DqVPXWR9jv8lKfcnCkkwbdU13J5g/U3nRN0+RWo?=
 =?us-ascii?Q?sLLiNJadXeH2njTk/q5+lI6VQ0R5cr46/uQoDcoJZz1NYe10VN9ja298LCkO?=
 =?us-ascii?Q?zD76LBxj1MkcCib06ZdsKqiQyEOiI5xuSJNqI+O1Pi47kCyqM+w0sm4mdvFs?=
 =?us-ascii?Q?EGBS5BBAWfi0uwGcAqGvuoHkZYCYHxtRGJIHf79sl1Gu2JrBhtuFU7QE82Vx?=
 =?us-ascii?Q?7RU0j3oZETSHT+ARrNvLX5w52O0qJjc666HvVEgezKNjJbutVFjrujXQsyzO?=
 =?us-ascii?Q?+phCrf2nWeLvEmhClMT8mXDso6huspUwcLRcJztGgZkauiYkQqeNnGJss1qF?=
 =?us-ascii?Q?y5kDXGNMYhBD7uuU1bJuvzb3f1pktEk36NiKkqqW7GaKp4k/WRX33B1qcTo1?=
 =?us-ascii?Q?WgPW9P5iAcLD1p/7zvEmVAqDo/QZDnh2FWu4UaVYMc/H5BCdPQTsH5dx2240?=
 =?us-ascii?Q?wKK4jneMPEICqR+D7ORbBeaooAp1eCaTiohKedyg92Qp3ZG5UBEKkHhVPY7O?=
 =?us-ascii?Q?I7bbRS8rIZsK0FbjlwzmTwMbhl+yP7FCOMBxxN+OXw27jDKkQVjWKhqpNB7w?=
 =?us-ascii?Q?dkU12NgBS/XlvmAS95GhkZ2Mirkr7zDSquDKZoW6xmKFyYOnh85Eks8uVbmD?=
 =?us-ascii?Q?q6PX7rnzm0Aa9HDNU2KFgHuYdw4xbMDjVBPb56qSiFd7MA6jU0a3gT+P7ugf?=
 =?us-ascii?Q?ytRSPIXXzLzhJrSO99axX/s5w+MbPS+3BTzkeAenc1MPRH732+SgyGcfnLOC?=
 =?us-ascii?Q?2xx6YxuyrUh9Ux/N6QwA2D5BTfpySsJ+97+3ujNu?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53be3bd8-330c-4bf5-e60a-08da919c752b
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:19.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDJTGcsmdR40JooZsteWB09fiKgdXpXCGkSQC0reFTbE/27ytJCq+30k2KPobYVMxnsF7/5sG8wm//6nW+G9IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices expose an ultra-low-power (ULP) mode entry mask for
each channel. If the mask is set, the device cannot enter ULP so
long as the corresponding channel remains in an active state.

The vendor has advised setting the mask for any disabled channel.
To accommodate this suggestion, initially set all masks and then
clear them only if specified in the device tree.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 00c73a920ab2..d1a4ab3c95d3 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1777,11 +1777,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 	if (!chan_node)
 		return 0;
 
-	if (dev_desc->allow_offset) {
-		sys_setup[dev_desc->allow_offset] |= BIT(chan_index);
-		if (fwnode_property_present(chan_node, "azoteq,ulp-allow"))
-			sys_setup[dev_desc->allow_offset] &= ~BIT(chan_index);
-	}
+	if (dev_desc->allow_offset &&
+	    fwnode_property_present(chan_node, "azoteq,ulp-allow"))
+		sys_setup[dev_desc->allow_offset] &= ~BIT(chan_index);
 
 	chan_setup[0] |= IQS7222_CHAN_SETUP_0_CHAN_EN;
 
@@ -2304,6 +2302,9 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 	u16 *sys_setup = iqs7222->sys_setup;
 	int error, i;
 
+	if (dev_desc->allow_offset)
+		sys_setup[dev_desc->allow_offset] = U16_MAX;
+
 	if (dev_desc->event_offset)
 		sys_setup[dev_desc->event_offset] = IQS7222_EVENT_MASK_ATI;
 
-- 
2.25.1

