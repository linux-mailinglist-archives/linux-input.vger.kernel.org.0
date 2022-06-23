Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2D6557243
	for <lists+linux-input@lfdr.de>; Thu, 23 Jun 2022 06:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbiFWErN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 00:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244267AbiFWDyD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 23:54:03 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E612D6439;
        Wed, 22 Jun 2022 20:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hscW5AZPitPjofS2KRmwOWgpb6Dod1Pxc8smFCCwJCqQt2WTnahQW0ZlZWHU7h/1jF352TPwM4NXydTgDOfbm2Yg/W8FE5hJENfc5hPCxPc01xE61rnjxhNxAHuXMNFAjy/m0WWsSw33JidDHpWcQnwQoPXVM/sh+EG48rvdxITj4kKeWZMOFmFaYG5+jMPoVgfJKlKK3VjJYIZb8qlJGbKV1XW7MjZrQx4jFIy0//NyitI3O7ObuudTbfkKSYLZN9x4+o2Bl20/NGjaSP8XCOKWXwK6OCt2aDZwfz5E0tyjaRRYr2trLxjmn2pFw/rsB2TIo+CVk0YnQTi9P94f2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wquhuBxbVZrQty6Ue0aWfMJsWyK2tD0m23x4C+fZRho=;
 b=cVlo84jsMCjzED3WpAukE2dhw7ulCbDgnlQLmtnP/xIsendSpIz7bB6drg7NpdCXRG1ZokvGVyLUwroMKDIC6A+abjUakK79lFSYjDXXqpKnjYyfpI+RnhQdIPwFqIkARFrLhgDfv3cxLw/vJK2fT6+MpWmzz8QRlV54Q3f/tBQ0yOuzEY7VWvnEWYU30RXIRUkXSgK/tU5lYj5ooRP+wts7DurGDfkbQxD2PtEJToRTH6t87PRKX796Hh81ECQ1Z+mUsGRykN7vQzVruIOVwIsNuA8XvM+am9bwe4h/uiAJBrOn7NxxWAePORyO6BzMqvHejzckbKxf2tAZSThE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wquhuBxbVZrQty6Ue0aWfMJsWyK2tD0m23x4C+fZRho=;
 b=NiIR1ZttUbWMPtKIw/xv8RCP0r2kZ/UccABfPnO837xQhWjqrVqmiUqdKtkxfUX6VeNRZcHt+Yd1l2Z90Kw1HbtqdrEE/UZ8mZkt+z+1FguGm5igrY1/QyFluPem70JEs6BMLV6CRAAs0WfCWz1xWsdU+nAsEAbT+LtXqZKnbmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB7766.namprd08.prod.outlook.com
 (2603:10b6:a03:3db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 03:53:58 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 03:53:58 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 5/7] Input: iqs7222 - remove support for RF filter
Date:   Wed, 22 Jun 2022 22:53:07 -0500
Message-Id: <20220623035309.39528-6-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623035309.39528-1-jeff@labundy.com>
References: <20220623035309.39528-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0001.namprd07.prod.outlook.com
 (2603:10b6:803:28::11) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98acf426-595d-46dd-2ece-08da54cc007b
X-MS-TrafficTypeDiagnostic: SJ0PR08MB7766:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR08MB776628C8B03975D24675824ED3B59@SJ0PR08MB7766.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imw2PTifBgCAfTQVFVjrCSSUASKX9eknhy2Ga8EZZ6UjrOjoyXcpiMGpFqtj/M+Ju75Y3XvjqXA/6wD+VKrvcuPXa+iVsfgXGAuzB+48htkjrWj5FF15GRKuvZzqJ9LAzyT4+dXRIqxJRYx3N/OYbZyx9D6yIi9cV1e660xFPmfLCxKgy0pR1AtzIqBvXUcXcue4DO+tsfp8FRoVtvNN5f/ApLPMr7VS5YEtjWPe9yyHc5pS6UlITO5gJKl2w7qSoy+Wz5Q2BJ2QeV7Kxh3GetvG8coh7UD+qjRQqZEnmuQe8mD5HM9Dvmx0fPR3/IQsGResahauxPC+kkEzl0V8h+bAuIw34N73DcU+1VuJCozUaUtlCXZBfYtks81ldQvEf+FdyU36vaFVhcLysn4PzvvSHZxoEksDGp4vPqyVX25hL6Ib7BAoii38ooIm7KScbPWioUVHTcZbwCKa5k8jLyrPvc1L6L6gyCaXw1Kb1KPYvQtrvARShA5CbDndyOllHBIY+9VLNLW80TxkQmXbAvRM3CX+04xLyycGRNQzLywYaRKJsg3DNveYIwWwWm99F9SW2QTJPv6gWZms7cm0vqqHEweUozdrPzJmM6PeWwwweAfDiNmRTe8AdHlFOhEBAUiQ1gJrqlJ3F4SSK8HSxJnh7k7ru1kF4t/yKS3FuJtzR7wD1k3wO7ZwWuTGtSN4o9qNnibruBqw56QGejRYcelnGdvw08cUXFNUMj/CAa6DJf+il1FCXCmWKMwm+fkN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39830400003)(376002)(52116002)(26005)(6506007)(107886003)(38350700002)(36756003)(186003)(5660300002)(2906002)(1076003)(6666004)(83380400001)(41300700001)(38100700002)(66946007)(2616005)(6512007)(86362001)(4326008)(8676002)(66556008)(8936002)(4744005)(316002)(66476007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IV35L9hMxsFt1qxt2DSgXcInumcd3ymbgCXgA5y926kvWMuBYH5oXHSXnwWW?=
 =?us-ascii?Q?1g0gq/2f4xj/HulRwZMgC36KrLMhV2MjfJBl24P5KnUCKPWvLWw4EVjvq34v?=
 =?us-ascii?Q?Q4qJ++HWGR0wpQ/Gku7bci1i+bYWbtfYj6KmozIyGd8ZvzzNg32Vb3gQqZ4f?=
 =?us-ascii?Q?Vwovl2uaxAIF/D8D4Ndcr/E0C4KMwr1I1+NHJUQGVzJOdKcMoZs1w2dZTllv?=
 =?us-ascii?Q?F0HNJOgpHv+CbF+AvvmYb8UAc/o1rL1PkOhba7XO+l0vOXZjcB3xH0JXPp/A?=
 =?us-ascii?Q?u8q+/r8PekZt6aczEbNReq7khsJngnSvnsTz+nS/T19cjQ5Eina2j6nczxHq?=
 =?us-ascii?Q?MVXcZCahLct7Qi/NJFOFrw1i/60wcagUrwY+f2xQX4y/zZvIKrBoyKjCarXB?=
 =?us-ascii?Q?qgvcKypTi8iUlpw6ySWv1fwnzDQ4iA1fNeSx9m70TTWy50lHqP8rjWMb/Adc?=
 =?us-ascii?Q?CPEU/wAP+KNdrVCuM18kU73lHOrL36OS4Dq1h7DHSYtEqYHrIoaUHt6lF3z1?=
 =?us-ascii?Q?XDn+ikn8J1kgSNf3ys6ebPGRldM2XpYKvKF+fvlDOQjWpYpBlrAqNjQRyn4n?=
 =?us-ascii?Q?Oe3++TyYd/JECyylmGzEqF90yLKhy5xrZoIAaW4A2qF1nQeQXUHqE7Ji/tGz?=
 =?us-ascii?Q?P8KCnbk3JfT88L2IRUJcG2UDG4skx7e/1M33/Sd5EHN6RlYUzJLgy+2GKvWX?=
 =?us-ascii?Q?k3XpYeCIY2Kx1hwYOSKdoXwbEs+vzxjHrp4e0DAUwBdc/1Nfo2e18wy/2bAn?=
 =?us-ascii?Q?+iFPpmR4NN3ci6U2H2LUn86pt6Zzvjwwn7/GBvxjIm9OXAmSaFjlyPgTZSmA?=
 =?us-ascii?Q?Bq/pTwn8wuU/LLSoZRLH1+rekHHiyTIJDlo9b6Q8xwbmxKTHw+RIpfE5OiuP?=
 =?us-ascii?Q?Tx+3dfLO4bcAiU248zcnmcDiBaWeCjtjeMbw1ltQftu4/dUgxQ8kOEdIst1T?=
 =?us-ascii?Q?fA76AbFuzdtvDGFrC9H+h6DmBZxwXA9+/6qw2oiCDXWo3T0+OWdyyvi3b+4q?=
 =?us-ascii?Q?GXkbJhyvkNaFT/0MnFkf3HnF/T1YhqCiEioVz0vQ4c1HZEjfobs6TIJj4fXT?=
 =?us-ascii?Q?3hIkjaN1xw3alZw+9YleT0jgs7QE2gXrhD1SLCKLpDFSyPsMaKKwx+Jvz7MV?=
 =?us-ascii?Q?1vxHSHqiE5I/seUH18FqY5Lr2NaITmfPlFnNLTjsaf4zh0abPI2NhWnCBQMJ?=
 =?us-ascii?Q?tCO8tXUQ54kW75Ccgxieq599S6fOFTr7rQCXJLgJidtpplMBNjhUSrY4d2Eg?=
 =?us-ascii?Q?7cC9iHtFw3IFS+4F4MRp6J4Q9wM4pONNDbN/l6D5S30QZnwzjgzorJqGEH7j?=
 =?us-ascii?Q?p/044HsNjxy1mby+5nFal95mTG8AcDbmnocsoSnldM3IN4QQNhZJOefILVji?=
 =?us-ascii?Q?hmDnCqvwuJNmHFEpFBCa2HozfWNnmFJipeC4nf636p0jUTYwhmGYjB47/mlN?=
 =?us-ascii?Q?MD1V5PFwx0r1IYDEpbJi5LnkuuW7Zs9C0P5+mqysb30Ssgv9Yv6R7yQVP+oy?=
 =?us-ascii?Q?PHjnFzE4Q/h6Df8lg5KOw25Au11RUwbiWs1vaXpAnW5HdV5A1iXeDOQVe38v?=
 =?us-ascii?Q?e5mqyFSWs0Ai/bXleRsfYJjRztSUdJLnuNJ/xHg81E0INA+7eayy7meXDdWt?=
 =?us-ascii?Q?uAZBdB9VUnqVBgZa73iS6xBcHCkFAa8foFQ6cjaIRp4DK8oqMyvH7Z+SOeh/?=
 =?us-ascii?Q?meu6WUQbBrRNBu2S+m38gmExfugJpXVIvR+W0NOwqXeYT3IybUFR8V1a57Uc?=
 =?us-ascii?Q?WUc1Jw9A4g=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98acf426-595d-46dd-2ece-08da54cc007b
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:53:58.5730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gx2h0VoiSq6Sux3XSqg4YeL8yU8XN+te3dT3O8Unw4+mr0la5v1XxspSctDCQSLBdiTx9+ebdRLaScaj1fZCYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7766
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The vendor has redacted the RF filter enable control; remove it from
the driver.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index a84cc18638df..d1d36d857e55 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -557,13 +557,6 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
 		.reg_width = 4,
 		.label = "current reference trim",
 	},
-	{
-		.name = "azoteq,rf-filt-enable",
-		.reg_grp = IQS7222_REG_GRP_GLBL,
-		.reg_offset = 0,
-		.reg_shift = 15,
-		.reg_width = 1,
-	},
 	{
 		.name = "azoteq,max-counts",
 		.reg_grp = IQS7222_REG_GRP_GLBL,
-- 
2.25.1

