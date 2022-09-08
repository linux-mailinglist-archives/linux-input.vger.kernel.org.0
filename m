Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9745B1E63
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbiIHNRJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbiIHNRE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:04 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDB13C8EB;
        Thu,  8 Sep 2022 06:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaXXEOI+CkjjWOnW8i5HoBF4yKUQeCOgbUW8eaxOSfJ8JW4O7AYB2tFzgUIHm2TLJXqm2soVqRhGSAYMCM4t0Obe9WzB5pxzOnvUGKCuyD1kN0DCnWOv+UQzmI6pZNCFa+dU9BtnDorRIo0iF0wgRXlJObj1Ya6dXHmS4gicK12fy3G6XgDFNPz97uuVPTsTPqLj36K0pdEO9FiziTD6CWBfOaUAKiqAo1pQiwhH8UT/+YF38d0d/oJf8DZeO91plLpceULltLsow0tkU40m9D89m4mhTJiHlazWCvJXd2g6+SprQXmTAuYTlGcFnQvrqvlLmRxqMHOQPYBdM1WB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ed2l4rWwfiI9iaL0A34gfgXFbxkQWXn4apAChq/cHk=;
 b=U6OrGKHKDypBIWBbc1KxPvY/eDjwv8rrjn7zSSeVfmt6quBgf2YMgoYiD9v3ceShQhXzc19a1vjs5JuGtH2BmoKN6s2y4KdDKCrbMH5+7/tYkYdGm5z85JuSDW4Eup9Xg8tUg/qFpnfKj8nrqVE4XQ4i+uvsk+ptqHL8ZfCN9aqQ1Pm4rgZcdM6W4/BENVic0XbMKjiZhnyqgkR5CmKEKdmVj3VAtEGxR1oYDtSBlrUR5LgeI9f4rQcwgRg7qyQUvijaPOE1ZPvnKwoZF1Y4e7za+SjHLmVJy3sRRdiGrW153Mv8395vDSK41OxOdjTXJXO33dKBd3SIPwH+QVWPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ed2l4rWwfiI9iaL0A34gfgXFbxkQWXn4apAChq/cHk=;
 b=sO4qUEMEYm4rjVCy/VXs4XA9QFt+jD81DIUHfu4jXjBM2BD929VlNWob7a9mANdxVsHApA+D/Vtne3NBnmtrqJvgpfAOn/gK7KyYsvxrAenNvDo7h0sKImW+3BNYedEYQTy6WVZyXwsDJ4ySYfX7mP/ZYfCJF4Jf38qQhJD1d7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:00 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:00 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 02/11] Input: iqs7222 - report malformed properties
Date:   Thu,  8 Sep 2022 08:15:39 -0500
Message-Id: <20220908131548.48120-3-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: 096861da-0515-40c6-a4f1-08da919c69e9
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PsBTz8hnvAoc0YN5fc714y5Irl8jjL5qeTybbDZPcCYBLNdgDY5rKbCE4aTXxrelrJMTgzhgM6ZRfDtEyVUlYyV4tO+CGyl/ckOlGu9b727RxPWRC/ubeMqrFpzXrVrBmiLCDwa9UJ6GatkPjx1JdWhznItkZ8ILb335UgRz7W6kv7Xx15xnK3mepDQLMHqy9jZjUmng6d3BJx482TksBp0VRQYD9dQs6Br97cL07xhIL7rjXPPw3GXoz5EtrwYU7m3JPHQYLrQashJmTXOP+pBRJS9h0x2INbQhWmrWsCTdqn84PIg4HAmb1WENH+rRfvHJ6UNNCursKfWj1d2nhPIWt3VZ5l5WRVwhH9K+/pk5EnTh0TyiDzx15Kixas67wA8+sJB3rGclD4x1PdHmW8OFHhOu5zwBOZdIu0dLZUlfyVh15dv2di6CuskB0xcLgfFMMzhtyRDJpLV3uczwzVIwz45lsPz5URly5A684as+k9o4MFep0NTpA0NAlnKRJaZDxA2TyjWKuKap4/02U3cjwYa3hkQQ3BiQMsezCZ9JmV+F//2jkHnZdNI00JTaF3+J00u7beHtBwz7q1RVI6y7NY+BKfWXSITMHOuP7rAJWWpmfji22L6cKIiFBX914BfZP2cJKx3SYmI1bJ6fQsdrtDA8Oo0dUY23IukSWqp9TSBh54Aoi3OICpWBM1TH36SPUqpRUg6hTLN4KFX7MLFKKo3t6chHiBxvRkOlpb9aO6I33ShNZbGUmybG2BMy/CqzD3/GigJL+xZR73IS0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jyyxzbe3zkoMZoxGdmZt2dK+a8zL5y0dOSfLcVHVw+IWqR5VzvqkhzMmcDqY?=
 =?us-ascii?Q?XUYTdwHh5Mg40p5rPKjsrwm5vrdeFbJc96qi+7ybuS9LuT3B5gzs8P0uc6oO?=
 =?us-ascii?Q?HTbjwxPdqIh1oT2isFPDgYPWmWQkGmPKxHq2M6WOvjvzfaZAkJ0qo6b0/wYP?=
 =?us-ascii?Q?MXCTHvvlth52V+y+FdLjTe/ixzWOwXDRgeBwOfvW2oOgm5MFldBzlJA2orH3?=
 =?us-ascii?Q?b7uGv+zgacejCOEWFmRkY4gE1hHyzO556lERbzp9xyAZlPGV79fqS9aGoXgT?=
 =?us-ascii?Q?StXwMHyw7IT81kHuunn7eXrI+ZtBcVIVdIc3ANWa8oW5i8yy69Ns9ZNZsXzg?=
 =?us-ascii?Q?bFfK0QQaP5tX8pyPM42iy0uaNzX3bS593jmWby2mhdKsFCdibBnqzt6aroYE?=
 =?us-ascii?Q?8xUPbUfJognb9yBlcBVC26aqPSqNsZTbddEElGn6B041GXH4Nc5JgxuWI5Ir?=
 =?us-ascii?Q?fkupPfC4hALghTgVp0ttiL5vZUAD8avLHBZIQqJMmQvtxqdAUFtiJN9z0ZnL?=
 =?us-ascii?Q?mo5gU+vQi/y4T41ShrBh623JIgurBDRkJ9YBMXzwT/x+JS+lTcFeLrtCcTFP?=
 =?us-ascii?Q?PufwfHMyh7xiD97SI5aTiCV9fEfsm17dWpHgCkoO2RIGiKQMLFE3E2puhEpR?=
 =?us-ascii?Q?yWwaBYDhZLX4FtWpl4dkScibKsyqp2yyBxLD9dyyyhQ+rHF9SDxJeIIjjSLi?=
 =?us-ascii?Q?x21uv92vh4GP3fnckf70gswA2ZO3P/cc3inQ1sUHoZv9+1DmmsZCo7Pt9qeZ?=
 =?us-ascii?Q?uB+4FhN8/D4QMDiKZYg6qgF886IBjVXjO9+b7rvNaXVtTRKkZnDs2Bkff/Kj?=
 =?us-ascii?Q?akBEQB8+QRle77lHMkobaDp6ADOghuPNjdYhDBKcT5ToNfPTR+Uthf2WwZSs?=
 =?us-ascii?Q?rmWzPQMKDxzk1TsgmOSwovpF4QgRZdk7Gp0U3vYlGVAs0FLhq+o2b4vKXPqu?=
 =?us-ascii?Q?ff8Om3JKX2l5WBAUfWNkk5BzxNrkGDhHp2TSIXWaGq8WLQlyhug3MPuQczw4?=
 =?us-ascii?Q?HEnAZxL1Ja6/onhjnQXzDuk2PfCEj2bdojrmb9VAsT5Bw5zl6viY83CoW7VJ?=
 =?us-ascii?Q?K9em/d+97vhGVK7hvUZizDa9gcu9IHqsP+P+VdOW0p5tsroydSBG52mjbeyB?=
 =?us-ascii?Q?noKYI1PX56Yu0x4u4fFwcCFE2Xk6BQqWWwIYtboL3P43ZqRrI6k6qc2Isgav?=
 =?us-ascii?Q?AgP+efxnRXnHaAR/0SBTJyJWMdmweqg1wMDu4uDAPDYk+cK3GLmU7AP0wlPz?=
 =?us-ascii?Q?BTQi0pAmSJdSOUtsR86GliInLMIBt6104AqzEgVX+Wgap82zScVK9tJuy6sC?=
 =?us-ascii?Q?FV/iYWFtRYU82YR+ZWwwMGEtNnc7YOO7zOfmguOtrDTkHDGGRTAIV/UdFXXu?=
 =?us-ascii?Q?lVvzAEBwsqwTa+c6isi6lmGYpPvlw75KbiAqje/UVi0wiNlNQY8tcvbVUSs/?=
 =?us-ascii?Q?U9qvkuedJR6Cc1wkMBraEzZdV5vptS4iKMzBriiSYPnxSfmGsLOEid7jEbvr?=
 =?us-ascii?Q?TQhomO8akZ9E1L/0Y8NW34EL7qF73dJWB46IUUqrbCEBywE7WnphT8Ezll7T?=
 =?us-ascii?Q?IwQqdISFJ+EP4d2kb35dwILArxPhf1Zmey/17koI?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096861da-0515-40c6-a4f1-08da919c69e9
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:00.5285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RSKBn5Pp8Tf7LXD7WThCj0vOMQJYS+dOc/AmqREjYQDedH/xxyrOSIj6Sr+gRbXi6kK0VyEQKak9x88ItGu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Nonzero return values of several calls to fwnode_property_read_u32()
are silenty ignored, leaving no way to know that the properties were
not applied in the event of an error.

To solve this problem, follow the design pattern used throughout the
rest of the driver by first checking if the property is present, and
then evaluating the return value of fwnode_property_read_u32().

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 65 ++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 04c1050d845c..fdade24caa8a 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1819,8 +1819,17 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
 		chan_setup[4] = val * 42 + 1048;
 
-		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
-					      &val)) {
+		if (fwnode_property_present(chan_node, "azoteq,ref-weight")) {
+			error = fwnode_property_read_u32(chan_node,
+							 "azoteq,ref-weight",
+							 &val);
+			if (error) {
+				dev_err(&client->dev,
+					"Failed to read %s reference weight: %d\n",
+					fwnode_get_name(chan_node), error);
+				goto put_chan_node;
+			}
+
 			if (val > U16_MAX) {
 				dev_err(&client->dev,
 					"Invalid %s reference weight: %u\n",
@@ -1921,9 +1930,8 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			goto put_chan_node;
 		}
 
-		if (!fwnode_property_read_u32(event_node,
-					      "azoteq,timeout-press-ms",
-					      &val)) {
+		if (fwnode_property_present(event_node,
+					    "azoteq,timeout-press-ms")) {
 			/*
 			 * The IQS7222B employs a global pair of press timeout
 			 * registers as opposed to channel-specific registers.
@@ -1933,6 +1941,17 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 				     &iqs7222->btn_setup[chan_index][2] :
 				     &sys_setup[9];
 
+			error = fwnode_property_read_u32(event_node,
+							 "azoteq,timeout-press-ms",
+							 &val);
+			if (error) {
+				dev_err(&client->dev,
+					"Failed to read %s press timeout: %d\n",
+					fwnode_get_name(chan_node), error);
+				fwnode_handle_put(event_node);
+				goto put_chan_node;
+			}
+
 			if (val > U8_MAX * 500) {
 				dev_err(&client->dev,
 					"Invalid %s press timeout: %u\n",
@@ -2098,7 +2117,15 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	if (fwnode_property_present(sldr_node, "azoteq,use-prox"))
 		sldr_setup[4 + reg_offset] -= 2;
 
-	if (!fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val)) {
+	if (fwnode_property_present(sldr_node, "azoteq,slider-size")) {
+		error = fwnode_property_read_u32(sldr_node,
+						 "azoteq,slider-size", &val);
+		if (error) {
+			dev_err(&client->dev, "Failed to read %s size: %d\n",
+				fwnode_get_name(sldr_node), error);
+			goto put_sldr_node;
+		}
+
 		if (!val || val > dev_desc->sldr_res) {
 			dev_err(&client->dev, "Invalid %s size: %u\n",
 				fwnode_get_name(sldr_node), val);
@@ -2115,7 +2142,16 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		}
 	}
 
-	if (!fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val)) {
+	if (fwnode_property_present(sldr_node, "azoteq,top-speed")) {
+		error = fwnode_property_read_u32(sldr_node,
+						 "azoteq,top-speed", &val);
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to read %s top speed: %d\n",
+				fwnode_get_name(sldr_node), error);
+			goto put_sldr_node;
+		}
+
 		if (val > (reg_offset ? U16_MAX : U8_MAX * 4)) {
 			dev_err(&client->dev, "Invalid %s top speed: %u\n",
 				fwnode_get_name(sldr_node), val);
@@ -2131,10 +2167,19 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		}
 	}
 
-	if (!fwnode_property_read_u32(sldr_node, "linux,axis", &val)) {
-		u16 sldr_max = sldr_setup[3] - 1;
+	if (fwnode_property_present(sldr_node, "linux,axis")) {
+		u16 sldr_max;
+
+		error = fwnode_property_read_u32(sldr_node, "linux,axis", &val);
+		if (error) {
+			dev_err(&client->dev, "Failed to read %s axis: %d\n",
+				fwnode_get_name(sldr_node), error);
+			goto put_sldr_node;
+		}
 
-		if (!reg_offset) {
+		if (reg_offset) {
+			sldr_max = sldr_setup[3] - 1;
+		} else {
 			sldr_max = sldr_setup[2];
 
 			sldr_max &= IQS7222_SLDR_SETUP_2_RES_MASK;
-- 
2.25.1

