Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0A45B1E71
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbiIHNRc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbiIHNR3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:29 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF0925C78;
        Thu,  8 Sep 2022 06:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezDxn+Eu9a/rM3noNiGYLqF0zKdW5eUqCBj8eEE05ESx4kwHxuIwWnT/ONywzFnnOF1YUkc5ldAKrBWOgLA3acSi/fV/Q4P8uZW5HRr70yHfydoeWlEk+Vv4YIfaCU5H4w401Ij/Cxhd2zLnoivH4l2Kt9a21hdbhGjiKQ/1ZC+aliboMQWBgz7nLrBm+oVQgP8MhyfmOA/dSHtFQ++Pn2bmVL0sSbe+AFIKq2+PqOsBC92oGguiDpXEnWblMBHbK2w1dnCzzztnr5aZYdsEeeIarP1mS9k7t/usCQ0lf6cal6CfuFHMOF3UOjZ8Pawv2PQDzimTeKbL2xq8Su+oIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxAAtzCpjG3X5nddJP3Wq/95Lps3I+3df6LM5SxPlVg=;
 b=V2qPrtYM24Djtf0jI1alOnQs33atWZJEDLXhnwu8ScfNjuESwp9Z72XBqys1Vo65Dw3cnyXzXksN52BaMl5FWxTJVuihygJIamJ9o0Jg23r6NWacMjqPV0H2RQo96Hbi5e0K9XIquxfwBGJ6DlEEufrGdzChs4WkMmATMtD1fEW5e3xwT+I7G/mBdC9tlf7Q56hCnfah10rDlN7J+b5cwGc2SgJV50LvyNBP+HMIBVvVquBnKsErkNXRTnWkRjgoDrt98Lvi0Rns2LTpNRrFQX1yWPK9iFW/jmWCr8BCUWw39KEWh82adWRUhqtuUicQUJraFATz6D5Hnyy6yBheEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxAAtzCpjG3X5nddJP3Wq/95Lps3I+3df6LM5SxPlVg=;
 b=avYf0w5IWoUJYjV6bbIyAgL3RbyApoNm5j8O5GnE+QBs9FfkXZrZB7M8IE1b6kDUA4wy/SWoq4hFUwDjSnlPb1WayYNLQj2OTeapDTEmVLMXvguORTOREWbjxVHd76QqmNDgvBBuUajMSh+hOWi1nYtodDSJceJzddZyvQzj/kE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:24 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:24 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 08/11] Input: iqs7222 - allow 'linux,code' to be optional
Date:   Thu,  8 Sep 2022 08:15:45 -0500
Message-Id: <20220908131548.48120-9-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: c967e1f7-e274-44c0-cb40-08da919c77e8
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boUx/oUEu6GJjx1wITs0nhELaxOdwndOqSYRHJAb+5F2nOxWqkw9tYSYHI2PmMa5ssvtmsI4RAxivlV0yb4sgpMnPAx70jrjWYWOyvYsrD3z61YTQDFcGUgz3xajVnHfWGIhILBj03bkd3e08kWdFwaDHTyGgkSsqCCmxa5+ZYSXc1lbZ2xl9S0t3Z3QkzT6Eij9WVzCj9jymHOPGshFFyo3rB9R75PKIcEmt8RMeOA8EukBqZfOQBaxhlU42l9BICvaIzjQ30vv2cAcbvvDDuNDXeBv/8PE8RVElWM4bODc7O90P06E0FL0CBwPfFqbw5tG8WpkB36l1sQzfFaegOx6zXWQKIwosV8EBwzZ8wTjNye6Gqm3cKxL8CU2GyaM4yG+QmLbGjhhAGw6mrzoH+bi+Urj2Kttk7qzAN/ymRad5OPeWoZubE+21+be9rNpa4Ty/rx7SMJ7gH+BeMAkS96D7pjyVgbVu0Apqw3gxNXxFbmdDWNaz/Nun+f4LWxWT9asQsa5ORGCTLv76pQUH+32RFH0B98VjE0Oiztc2NIBQUIt8dH3Vqwj9tP4/i4nfYe+NUv1MkZqa8CYuOL9dnoLDc86+sDcrzQM72SvWFtSjo/uLwYj1U48TBgRtrVLipaAmrhuqqUM1KmBYiQk8c3Bg1c5tFvpPl5OEmNJblvDesImc9XOLotWF5iujFv7Un1rz+5LmarhikS4ezYDDxzdZgNESUnUuOoeu6ANLcBzocdpjrkUqSAFzmWdFW0Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FKYtD+oAS4oYIkjHjGFAL7+93ep/LIyBa4OPXCKv8lpDRl9vGa9LpvXEphqC?=
 =?us-ascii?Q?7ZtXdPyciL5xCugNO8q0looWgTx2H8M1XO5JIkNz1lLMI0dY3DEeR6rfF4qE?=
 =?us-ascii?Q?x5/rghUtn/7kJttd8bcFpJ1gsu4V1iX1YbWAQqadlJOxcTZ896wYG0eXRbfJ?=
 =?us-ascii?Q?JIYzAnq493Z8FAw0EYIyDmI6Bv/EJOUBkQCTLAdHLHwEIIPmzqZlXpTOjJFv?=
 =?us-ascii?Q?g/yyaW/iRjLZYEhb+dl4I46IL0NBlK+p8zuw6iHZoIrWxS2cSaff5bayg+MO?=
 =?us-ascii?Q?E3vHbGPqWw4PPsmMcdnfczvcWJYIksH5BUhLdpXz0e8TzzRJu7lJKrDc27rx?=
 =?us-ascii?Q?9at7ORByXH175hNRz4zqUGmsrz1VENmhlmRax1/UGFykXGJqElc+Ih1a0g82?=
 =?us-ascii?Q?ns5GMwbfprmcjHc8QCtTD695OyonNxJuQDYQL66YiMl/d1AEy1klyDse6Duw?=
 =?us-ascii?Q?P+Q8thfODeF1zwzUkaKvDmY39Kf3iKLfBQMcWuI0Gqo8iZ0m99pH+8FyS/Ps?=
 =?us-ascii?Q?Qcc3m5B1b875rHIjsmxheh5Axulz749rrl/MmHsggyijHK9wTCb7x53Z9Kv6?=
 =?us-ascii?Q?cVwdyPyRVvcWdysbkZM7a6q+nsByZnu/vY3Tn4kYRPs8mtME5Bipqgt3XbVV?=
 =?us-ascii?Q?ruCvOFDPv7EcqfS9Qkj8fB6XWCEIpQPK8dW4u/C/vSX8M5NI6wNSS5bk9/LG?=
 =?us-ascii?Q?SfZCLLz5oB7MUfiPgcpFxtr03sGZ4DU96ETIYjgvecGJFpXkEuQnWRVyJtt/?=
 =?us-ascii?Q?qwrnp1DMH7FxSFeMu3cgttAFD+IaZ+ZJpMqGuQmmg9eG2oIgGP/NsLK9KFE7?=
 =?us-ascii?Q?vyXi36oe0+THTdNLqqMmL2nNkBOsvLHQcJWBuDJbOdJxHcS4dLhgKGLxzKa2?=
 =?us-ascii?Q?WoC/UWrwbHO6bj41ltB8JunTLoqNEcO1krhGv3RwT3EbDqJbm2XUNJs3jWlP?=
 =?us-ascii?Q?XW/5Y+OAOniya5crY6yTlnU1QLaQYmv29dZBjuD7jWFsO6dV8mbMjjBVbpTy?=
 =?us-ascii?Q?Ud/Gv8CndJiHvIrLdAb7+epVnaTqJiMG5zEARdzMQAkCqBiqkg6WeoRQQSUu?=
 =?us-ascii?Q?zFGsTQXaNJntmb4qGh/V2WsicD8rGHML1iNGyt9GeEP/7pELND6jvyhFE/0x?=
 =?us-ascii?Q?kKHo+kAehwGaNiKog2ASmFrTELpQf49TZUbVSVG8Wcwq4h+EaRgJfhMT2G2N?=
 =?us-ascii?Q?i9tA2Jg+sQPYzbFPc0IlelA+P9iT6www5ejFpca10eWjD2g93J4Bv7syW2pg?=
 =?us-ascii?Q?qhXpiw/Tr+7ww07KaVRIAjGarHAzSK7IA8LRyiDJNsL+4ENV5613foOimV6Y?=
 =?us-ascii?Q?rrB5s+f+iUA3UvLkIJYgF7V6Tp4bz/dN17/HZoyKiQh/YmVdlXHqgnAZd8lg?=
 =?us-ascii?Q?wd0RtqekufItykiGqCa5MbM2sMNY+hVDeoukLbOLEmVkSGg45Pic/2BpLyZ2?=
 =?us-ascii?Q?ePtXJcPUKmS0kzIkR8BWb4JJIaB2xXkiEQQLfWxwCLpv954J8OF1/4X/jvau?=
 =?us-ascii?Q?R2ZdJ805ENtrRFUv6uDE68bV6PII49wixhQWOc7aegwJkADLEXFXx1YEZUSW?=
 =?us-ascii?Q?TTRihijtxMft5KCe9z8+gMIxKPZYcCi/qkPRrZtj?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c967e1f7-e274-44c0-cb40-08da919c77e8
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:24.0110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+99e/Zd7MEsMIRM8wSwWfH+wQ/oeVM6QcKq2dJEQyOrjTNvVa6R6Y/wwOq3gwQtt8DRribDGqgJVKjH9kH0Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Event nodes might be defined solely for the purpose of mapping a
GPIO, without needing to report the event to the input core. Add
support for this use-case by making 'linux,code' optional.

This change relieves the burden for reference channels having to
specify KEY_RESERVED for their corresponding key code. The check
that skips events specified with KEY_RESERVED can be dropped, as
input_register_device() already blocks this event.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index d1a4ab3c95d3..ac810b8ab69f 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1963,6 +1963,11 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			*setup |= (val / 500 << i * 8);
 		}
 
+		if (!fwnode_property_present(event_node, "linux,code")) {
+			fwnode_handle_put(event_node);
+			continue;
+		}
+
 		error = fwnode_property_read_u32(event_node, "linux,code",
 						 &val);
 		if (error) {
@@ -1999,20 +2004,12 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			iqs7222->kp_type[chan_index][i] = val;
 		}
 
-		fwnode_handle_put(event_node);
-
-		/*
-		 * Reference channels can opt out of event reporting by using
-		 * KEY_RESERVED in place of a true key or switch code.
-		 */
-		if (iqs7222->kp_type[chan_index][i] == EV_KEY &&
-		    iqs7222->kp_code[chan_index][i] == KEY_RESERVED)
-			continue;
-
 		input_set_capability(iqs7222->keypad,
 				     iqs7222->kp_type[chan_index][i],
 				     iqs7222->kp_code[chan_index][i]);
 
+		fwnode_handle_put(event_node);
+
 		if (!dev_desc->event_offset)
 			continue;
 
@@ -2249,6 +2246,11 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		if (!reg_offset)
 			sldr_setup[9] |= iqs7222_sl_events[i].enable;
 
+		if (!fwnode_property_present(event_node, "linux,code")) {
+			fwnode_handle_put(event_node);
+			continue;
+		}
+
 		error = fwnode_property_read_u32(event_node, "linux,code",
 						 &val);
 		if (error) {
-- 
2.25.1

