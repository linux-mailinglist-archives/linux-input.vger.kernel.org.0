Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BA55B1E68
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbiIHNRM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbiIHNRK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:10 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054012126E;
        Thu,  8 Sep 2022 06:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBpJo57GYKKTkmIC+PCFNNw6jZo/qtd0U8kdd1JwUJg2LpIOLxzd6UqbRqMmNLqJGX9vu9GF8i7Pzr2JymkXla/56OTJA0QKVYtz3eF/svu15UkNlDif/4PUzjX/2gkm6t61NO+VqP/ifjOXeZk4+aj0ncUFgNlb09E4Soqx/AhmFXpbBqrpZkqTLrWrkiZMfYyQjjWW96hXAIJouKm+HU7lFpJ+1ThDrYr6FvWUUcipAUzNdhM5pHc5byN9JWtoQpYUzwULMA2TGIe5+DA/IMdQgElh6ULfJKxsV3d+glerlcwrN5+AnDhHJykGON7+SXy0f7LRELQsGdzE1enqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o06lXd8oiSUaqnjscTK1Wqdjq8etxgYs1dUKWdlwYZc=;
 b=Pb2Ev4DZ04NlA+ZraqlMCSsa1EzILq4dKxICEeCrmo7xy2QEoGrupTGqe98+7gfH1lRwt7FaN73w1j6Tky7El9VbssYfYE8Qk+8a0V/i93VnEfTPW6ONuMUTJyTwhuHUmHiFuTBUMfg0GX0SPGlQC8zcypUAXYKyWfVhJrYv+ea/VOlzqeZ8t8bInGIG+1jyEe00fx0oY3kgoWrzOYDdifrOanBGrWKSidIwUbZ7brXRAUCNQGR3A6Iqxb4IxzDNd1LmAU/L1GPCBA4FjsbfKdTSWW+6KtzjQMayKgheD0VLoWXrk4QaRGmVoBxX5d/ndpFpFgbA7I+riHJETTe+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o06lXd8oiSUaqnjscTK1Wqdjq8etxgYs1dUKWdlwYZc=;
 b=lDDQeosEYUb94Ly8znVj06w/T1MMj5jRI5nbmJ/trC4HxEh78phwmgSvf5zEI4lYxzSiQrntvr1SB8cKuExkd2fMf9P8SrWpzuwrEbi5fE7qlwQXC8YD5QSg8ipomLKyvqIW9Rg1MgxRPGJ8/wFpDcTps5226llHudpnSoomXRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:07 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:07 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 04/11] Input: iqs7222 - protect against undefined slider size
Date:   Thu,  8 Sep 2022 08:15:41 -0500
Message-Id: <20220908131548.48120-5-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: f2c8ff89-6e9f-464a-71b0-08da919c6e1a
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZzF31c9zmNtTM43Ih8wSvab3nTIVqzIqRD3YElm8q7VYg0mh42mzZgKVpxYXruSmK8xdegza4l6J7F9/lC9w/VvClQzi0FYF0qevXeurYJHDHQ4tXkonJoaLcURGiuO1VmTCtdcyWdfLAU0cq4Dp5YnmRw00VIxkUCIbPR1hYalpZ/sSerJsn3iByOllxw8eoWR8sGjPWGsHNXB/zMGtrlvLK0IPGF/4PNs4K7b49JI0O1ao65Pnqz9Bp3yFrmBa1lPd+9O814gCxr/Usp7Ai0/aKvbcTWaNEn5XsL5ghYb3dyD3Ud9hGknWc+/Myje3+ldXnWax3n37UBGW3HD174yV/Q20cLgwWe6+TP2+TKFM0ZKKHGPx8MXM6pSc7ldGUzJvEgm+xQcS24MBbIfHkPR6awpblUAW3jQ7DXGgQNQgsnRm40Qw25D59Mrm5f8JHcDs0lybZlvyUGlyyLEQnG7oT0aqI/B07gcwMFvARlARCsXSGbVmzsOltmNP+dhVptBwAd2gr/cqxvBuHLHq9DQIAD5CInB5hG+QCCb3moGlkhwU7f5l0ZLe0HhAjJZjeaD516J7nlC9kD/Fd901oiH7kH0jHORr7hg1ZvsIAJpqK6VL4tNiR29EKJd0aGVUFrtCeBPEz7EPc7+4wQBkKBEowogC8tgeFO7LedS0xd7HI7DhsqGN8ASzNH7NgrlGmnzNmDSwSyYLc6nOJL2x2cbqnVVoorJoBvorNgxvcRluICUPtEj4OdIdEXqmvx2jH0bqo5KcXZVCAOc+1GXNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JyO0PlUmHJXwWTSt3q+loIYXT8za++103VV0rW0aCCW/69xtNQdaKnh0GOvn?=
 =?us-ascii?Q?pBT8S6sIuBZNDLp5FzZ+ozb8617MJ3h6fPmU27sOF43GqPmQP6LMel0r8YQZ?=
 =?us-ascii?Q?71MycbaBcMu9YB6kDH/wxM+o5na0oFEPTMSufizzMqdM9J8HWCAYDR45KN0Q?=
 =?us-ascii?Q?x63mas2suAhDDO0L0V3tEVg0hHbD1E39Gt9WrYOpOOQS1VSC44+Oo8nC5CRp?=
 =?us-ascii?Q?vspyMLgrgm6BnSkeAUytwkldklLgVfRVj/Rms3LvMY0nHYo3dQCZ1jH/vqiO?=
 =?us-ascii?Q?OcPZTs+u/6pgrVhKszw2KmD05Z15pEuW7sNnj6gNXuBi2Rg87MnDR4iiS/+9?=
 =?us-ascii?Q?OZRrMmmcSS81VUUR6QTSVisdWu3eYPYGZJ+hFe9t1c4/lxrb141QmuyciRz8?=
 =?us-ascii?Q?PS74nolgoaulZdG4y2tBfErCAGXxEfhmaZtb3A5GqU40Aa7Aqx6dlL8Vplik?=
 =?us-ascii?Q?4jlHru7yYqxMGAp4Fzue7ylwawC9+SdZ7Ao+69LENy37Mtot4c9VszbOT8de?=
 =?us-ascii?Q?QNhomGZ28upeVX/xc/lxyo6dr8Hf6uZuPsvEe26W+urlmW7zapEiszlsV9Nw?=
 =?us-ascii?Q?AtRSV6+/83Cit5K4740hOXVPE8iGKU3bgasjlCXvATCHQCp9/wa0r1zh7aqQ?=
 =?us-ascii?Q?I+TN0bf19q4IkWK0sc4Ue7zhQzay3HFXq6k92Y7CcHCfy51k5ZrtD0QqVBS9?=
 =?us-ascii?Q?UGDs7/RHY15bqDb68iqeCzMLCCmcdcswmv4mF0pundUxAr02J6aa4pUMtr7d?=
 =?us-ascii?Q?HjKskmzsDm5lSrt7s2T6uACIsHZn81q5fnErl9l4/CMKi+OMpmWNHIlcUFa2?=
 =?us-ascii?Q?ek5R8Gg7viP4ErAk1Aaw6NmUJSt4monsBu5yzy14LuqFteJ+6wkjX3x8V4uV?=
 =?us-ascii?Q?vf72ObQYrALWj4o4cMnVaVUXgfVHZ7kpfKiYtsXuutr+hcw8BwexWi2GYS9h?=
 =?us-ascii?Q?HWCREUxGOG9hCnbxcz2FQ5Euwn+l5M28ZTLfKH+DOwRTl0IXBd+8FhTo37L2?=
 =?us-ascii?Q?PzN7eaZzfNEvl4uIPyX5OUD7OiqfSMqRtW9iHRmqcLvv2Tmd36LjrqJkb/g0?=
 =?us-ascii?Q?chbaRPZGhSt8koqkyCIPHr5mh1CK8f+t83mv4loWdJS6iUvSV3+ITlcnknOS?=
 =?us-ascii?Q?nsoD57/Nmd1dmdohyRDZIWA8tpxRThH+7fnmxGW5vrQHizulfZi0ic8mM7uQ?=
 =?us-ascii?Q?K7anctJML6IEJZOYKpUR3MUeeWNpe0VjlhN6lwLabFn4U46TLgms2nfu0JEp?=
 =?us-ascii?Q?2iSyrQpmYX2UJMGEg01vaSXGuP28h7CJI5dt41zvROa8D6LTlJNTG3G6bdjO?=
 =?us-ascii?Q?DZNOm4l3xroEgLBhJzFMBslJs5ftuZL8hmDYYsHKmtML30GvJrDtjVhVZR6L?=
 =?us-ascii?Q?D1sBzPdFC5M2l5vE3hWWQCYqZdiYNETUnMcN5UwQK36MFJdugwjuxJ9SgPsg?=
 =?us-ascii?Q?E+gHorib6D3WdD97p8HEXUxr84xzQwG3ATi3u4A6BCMXEZEWxrWNqA1ujLiy?=
 =?us-ascii?Q?LJcCJphgmjupHAsyLGrUI6Cyrl0Xjxtc/q28QsBQkluWH+NzoxGXRvUpSBi4?=
 =?us-ascii?Q?D2T5ZgdlSwA47G6Nfwx6m+C2f0C6ILS/oB6mRwUL?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c8ff89-6e9f-464a-71b0-08da919c6e1a
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:07.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dYp69cFBSEwnxpXOELW1hJXuncDUeVt0YeuVJO60zsezxCp0VOsj2YWKiAvhA/dAzfSVlWBmJZBhvamm+4oXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Select variants of silicon do not define a default slider size, in
which case the size must be specified in the device tree. If it is
not, the axis's maximum value is reported as 65535 due to unsigned
integer overflow.

To solve this problem, move the existing zero-check outside of the
conditional block that checks whether the property is present.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index fdade24caa8a..ba12c49e972c 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -2126,7 +2126,7 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 			goto put_sldr_node;
 		}
 
-		if (!val || val > dev_desc->sldr_res) {
+		if (val > dev_desc->sldr_res) {
 			dev_err(&client->dev, "Invalid %s size: %u\n",
 				fwnode_get_name(sldr_node), val);
 			error = -EINVAL;
@@ -2142,6 +2142,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		}
 	}
 
+	if (!(reg_offset ? sldr_setup[3]
+			 : sldr_setup[2] & IQS7222_SLDR_SETUP_2_RES_MASK)) {
+		dev_err(&client->dev, "Undefined %s size\n",
+			fwnode_get_name(sldr_node));
+		error = -EINVAL;
+		goto put_sldr_node;
+	}
+
 	if (fwnode_property_present(sldr_node, "azoteq,top-speed")) {
 		error = fwnode_property_read_u32(sldr_node,
 						 "azoteq,top-speed", &val);
-- 
2.25.1

