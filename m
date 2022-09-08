Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCCE5B1E61
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbiIHNRI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbiIHNRC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:02 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7F88E457;
        Thu,  8 Sep 2022 06:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miRUG5O6FBhMLsXrujUtugK5J5noIQF4qM86S2svyqvGxVliUJDJZTgx2/aa3xqmTbWTacIRkpq5L+ZwOuBzAAV/MCbgGZQqHEfzSd5qf3cWAaUCU6HJ/RXXzbNguCeL/uFX1voBlNHc/CyiXDj0hjBIQKn3D3iNONdujpsFYt7fRBBnkhC7GVQ/q+1oWCKaOFOQ2XMSa+fL+YqhJXbnw56LsxxgA5EmQJWEqrD5jeiPDv5cP3+1rdztBrrXvchdF5TgBh5klELsqjrpNfjxSfMdWDTKOLQJf8hw3UvOFL+Ukr9W9Lisw3+UINKqRIh/hq1sq921GiOdruqKQ6U9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU6w/DPRfqgcC4kWRlB1VDbXBJPUJ89t5LVFAuuOgiQ=;
 b=Eg3bbuggc6gqtimNJYJDtWYvBixLsKkDIdLGM89uEdn8GXL3cN4xAQFOYgL8ChkEgPqQJnGrqqYSWa1byv4u/uEeM7zbI/RYfg/HxqFfx7HAXfiCD0gb4roKyBTYCgGsLL9Hbse9g8cFK6Qtuk4NRcplj7UvqoVB4bY0bstZraM4Vj1bzA0MCpqlPOPQGI104b9q344JYZ+8Xh/Se4CnFN2nr7JowAqkaoBre6W7gk6M+GJzMNAvon0DBiUgFWMxztyTpxuzWEoOZ46NBGRicBj25/z251kHGhx+MI0DUwe0h4XpgfsgvGVJMfomcw6cZrCyHzuzWq/dkmdVNTsU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU6w/DPRfqgcC4kWRlB1VDbXBJPUJ89t5LVFAuuOgiQ=;
 b=zJJv2Oa+QpovR4nMzVC5G23ApkSUVCs5lsZLwDnOh0ilsTNt2AKNyCBeWvZ7O8JS6HdTjPdv0Ucnxw0U8Lb+Z2f3MP90KLL+DGD1KeeahL4e/3joFNQp10kFLzJwdbQMpGsf0EOnZ66CbSLYKd0TxuJVTPIIot+11sff4rowUeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:16:48 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:16:48 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 01/11] Input: iqs7222 - drop unused device node references
Date:   Thu,  8 Sep 2022 08:15:38 -0500
Message-Id: <20220908131548.48120-2-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: b57f7379-1805-43fe-243e-08da919c6268
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJnzomfWsPQgwSmsbDXIlhS4pT906qWY1VHXcOH6OD/3rrRqxO91lJBpavTKQoZcev83hdt4fJHyOcKoNhoxYgiB6VxjsTgyNhVDPM93Mq61oHHp1YDpooe/+bRzzb17sS4voXQqSV9+IvULrUboKZH69g8OGq0IRh3KK3u6U8N6kOvhg6YOiqqZchleP2iv2jymJxXb4kVpt56ifWWiKUp7AhAqg54fdl9+9B6y0nnNjHhE/hAzH2QqYznhtZhOqOxHapka5caF7PAnHRVpEzcngKYGN9aljLwGqU3rXbSrNjdTa9EQ6GYG0/+kVNwiF4wXPYU3Rb6pEIjq6aNIMtowf2PqsQnVDwpglfdB7RyuTzrvs6DEfjTyQx3CSUdJ/AqvcbzOq4g2SoB2KxP+BrLp6Sc/Y7bdyDmo1ETw13TybRuWrBVd+QxgHlSPMazJw1fjt271v6GZB5jM3uTugt6mLtaGu+8IiuqGR7dIErSM6KN8LVVdf4nQI+Rpya5swKhLQaF/9OmT9Kq7LCQwLfOu+gj1d+ApDSFwfD1ch47d1RwtQhPfTWPDGUWofg2KcejY7C/7cnEwZMYeZW6GQ+oBfuvYIsGUsSDuofWKQstpAf3QA9LqIza6w5TOC44SV52PNbPboaDGhpNHDp+eZIQOVJkxJtWrMAmqN7mlkWlUrvFsMoE2/AiN8+hX6fxGo9+cVRkXh0JuECTC6O47Kz9RlL8X82uVYW5KBNjpiTesnm3jGxGZrvAQc3ndUPTE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(2906002)(36756003)(30864003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tq5Aim6Ei+Lmf9zTE4xDyNTDc6dEZgOMafaak6kEeusWo7jmg5+8O2D76kOG?=
 =?us-ascii?Q?WNMP15Csu4IBfcsZGN9Ju6jOJz8z6ZoANxCqd1fco6QeWRR+vKW0ZSskAJMK?=
 =?us-ascii?Q?V8/PUUnMCijMrv48T7uihbWZeX7ogbE3FpgMpQxwOD7qgcUxWFqqHKoytjOB?=
 =?us-ascii?Q?qXVUOw54kvmOpGRo2gG4AgLzDHe3gjzJOxa/vB0MP9j4MG5rL78TMAtkdklt?=
 =?us-ascii?Q?IoA5Hg5tsKsYfoEZMzJSZSvDnDE1lzAuFrduelj9RzrWQt1fNljSYI2aH1Fq?=
 =?us-ascii?Q?BwyzKvqb9kDBvxeFR4U5wRXSWvIl5jcFHueAdcb+CZGJngFdcMR/xaAwL3fX?=
 =?us-ascii?Q?BynhfkoNbZA2FP+V31Z4d2PRMKTRflFiugMJFDPdmUZQZTqIzV9rcw0whhkS?=
 =?us-ascii?Q?feeIHsDmtbBfTUeKfHQt6IxU0se/uB3CQVBCJNhK6fn6dot7gtm6Ex4XI+dI?=
 =?us-ascii?Q?Ao5dGh2cEaurFj+6a7VTh5sdAauYGa0TdqcETn7iFmoVp66MHl2P/mCDCUMm?=
 =?us-ascii?Q?XpjU53Au2MAmux50MWYyNhk+ZwHYkBiu6WF/80QnymZErj8FC80WppdlbKto?=
 =?us-ascii?Q?/cVE+NAZblhYRN1sK6nT/khbhEZr5RvDUbXqTmBot979BXZ6u+7zZfXQ2Hno?=
 =?us-ascii?Q?HLGO3NsBMSnP/3iKC71jHFhiXY7+hhiRQweUrK2ltNRerF6tAJhoq/8vTWwt?=
 =?us-ascii?Q?ZIciZyIO1ns9qyh7awUEWNPLQwsvf7JWZ8y69X83nC92vdO27epX2nz/IITv?=
 =?us-ascii?Q?2PGXMsmH7SP6QjtK/fLGP/RnCGxSon0ePqU8q7+hmnumC9+3qqEGdDvXmd1W?=
 =?us-ascii?Q?XeuJBFYaS/S3qr2YKwwweldOTiFls0sxEGdkOO5z1kfAtKAffIKJZkYDd9pn?=
 =?us-ascii?Q?gN5KSl4aCNKqz1tfta+OFwWcjwN/4F8FJz7eTsNWNY8cpsG0o5yHMUsWClOD?=
 =?us-ascii?Q?UdrqTp18y2HNcnDCh9OxD5FbeLxbSvg+SMe4MR7WDnsgV54QPvFZINsb+vx/?=
 =?us-ascii?Q?AOwNbmT8hsfFhGVkEolPwcDmvtJn9sNqwMAkLiPHbaCxv2VL0NeGO18EUfvZ?=
 =?us-ascii?Q?4P5Kx3vi9sZYGSCJcXSdkCJ27tui04XTqhCuwo17N5dx795VTDeL7T+B0jXA?=
 =?us-ascii?Q?ADbg2pVG4pFtcwRT3/ZhVw/MHVKfb+cGHQOIoU1pCeQDODsjRAHdl2JM6LZf?=
 =?us-ascii?Q?UsPiGEdtAYveR9AFUyobxNd71obLPCCnUGxJG124kN/3RxkwlFwLMlqcq9Aq?=
 =?us-ascii?Q?iAedw9QM7tEJtBMD6ASjLCimdPMEZPqqdJIkpqx7HIvWEcDA7JQyowPJJT0b?=
 =?us-ascii?Q?4kZCIz9KfmtHuFz2WB00+qFXnQmSwXPJq8cAsQsvRbR4GPciSACoWmlcxYSn?=
 =?us-ascii?Q?fW361qIw+WSNQC+CH9DeCLKcj+gVM55hNh0rCu6kYYkcUhmZRjZCWgUIqdTz?=
 =?us-ascii?Q?gioijXN1gnc8AXsb5Bw6ly/uQY7uqY8OcGjWdVdEmSwHkk3YlZB0U/hr41vD?=
 =?us-ascii?Q?AO3WCl7VYhsx5XMs+N7Q3K502F6qFGI+mkVg2A0hz6sSW0j7siF0+0gYH+jg?=
 =?us-ascii?Q?qFrkfjhQYLb59YwmyWTdEhKMWZPQy6JjqNE+cfj4?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57f7379-1805-43fe-243e-08da919c6268
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:16:47.9358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/YtV4Mc/hZ/pzyijo1UmZl+1OfV4doY5zbe/29Qmes1VYDGVroLQBjZcMFcxTG5mwSZzgy533fLuGmlT2tU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Each call to device/fwnode_get_named_child_node() must be matched
with a call to fwnode_handle_put() once the corresponding node is
no longer in use. This ensures a reference count remains balanced
in the case of dynamic device tree support.

Currently, the driver never calls fwnode_handle_put(). This patch
adds the missing calls.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 134 ++++++++++++++++++++++++-----------
 1 file changed, 91 insertions(+), 43 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index b2e8097a2e6d..04c1050d845c 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1703,7 +1703,7 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
 				    IQS7222_REG_GRP_CYCLE,
 				    IQS7222_REG_KEY_NONE);
 	if (error)
-		return error;
+		goto put_cycle_node;
 
 	if (!cycle_node)
 		return 0;
@@ -1714,17 +1714,19 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
 	 * CTx pins (CTx0-8).
 	 */
 	if (!fwnode_property_present(cycle_node, "azoteq,tx-enable"))
-		return 0;
+		goto put_cycle_node;
 
 	count = fwnode_property_count_u32(cycle_node, "azoteq,tx-enable");
 	if (count < 0) {
 		dev_err(&client->dev, "Failed to count %s CTx pins: %d\n",
 			fwnode_get_name(cycle_node), count);
-		return count;
+		error = count;
+		goto put_cycle_node;
 	} else if (count > ARRAY_SIZE(pins)) {
 		dev_err(&client->dev, "Invalid number of %s CTx pins\n",
 			fwnode_get_name(cycle_node));
-		return -EINVAL;
+		error = -EINVAL;
+		goto put_cycle_node;
 	}
 
 	error = fwnode_property_read_u32_array(cycle_node, "azoteq,tx-enable",
@@ -1732,7 +1734,7 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
 	if (error) {
 		dev_err(&client->dev, "Failed to read %s CTx pins: %d\n",
 			fwnode_get_name(cycle_node), error);
-		return error;
+		goto put_cycle_node;
 	}
 
 	cycle_setup[1] &= ~GENMASK(7 + ARRAY_SIZE(pins) - 1, 7);
@@ -1741,13 +1743,17 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
 		if (pins[i] > 8) {
 			dev_err(&client->dev, "Invalid %s CTx pin: %u\n",
 				fwnode_get_name(cycle_node), pins[i]);
-			return -EINVAL;
+			error = -EINVAL;
+			goto put_cycle_node;
 		}
 
 		cycle_setup[1] |= BIT(pins[i] + 7);
 	}
 
-	return 0;
+put_cycle_node:
+	fwnode_handle_put(cycle_node);
+
+	return error;
 }
 
 static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
@@ -1766,7 +1772,7 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 				    IQS7222_REG_GRP_CHAN,
 				    IQS7222_REG_KEY_NONE);
 	if (error)
-		return error;
+		goto put_chan_node;
 
 	if (!chan_node)
 		return 0;
@@ -1793,14 +1799,15 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			dev_err(&client->dev,
 				"Failed to read %s reference channel: %d\n",
 				fwnode_get_name(chan_node), error);
-			return error;
+			goto put_chan_node;
 		}
 
 		if (val >= ext_chan) {
 			dev_err(&client->dev,
 				"Invalid %s reference channel: %u\n",
 				fwnode_get_name(chan_node), val);
-			return -EINVAL;
+			error = -EINVAL;
+			goto put_chan_node;
 		}
 
 		ref_setup = iqs7222->chan_setup[val];
@@ -1818,7 +1825,8 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 				dev_err(&client->dev,
 					"Invalid %s reference weight: %u\n",
 					fwnode_get_name(chan_node), val);
-				return -EINVAL;
+				error = -EINVAL;
+				goto put_chan_node;
 			}
 
 			chan_setup[5] = val;
@@ -1851,12 +1859,14 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			dev_err(&client->dev,
 				"Failed to count %s CRx pins: %d\n",
 				fwnode_get_name(chan_node), count);
-			return count;
+			error = count;
+			goto put_chan_node;
 		} else if (count > ARRAY_SIZE(pins)) {
 			dev_err(&client->dev,
 				"Invalid number of %s CRx pins\n",
 				fwnode_get_name(chan_node));
-			return -EINVAL;
+			error = -EINVAL;
+			goto put_chan_node;
 		}
 
 		error = fwnode_property_read_u32_array(chan_node,
@@ -1866,7 +1876,7 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			dev_err(&client->dev,
 				"Failed to read %s CRx pins: %d\n",
 				fwnode_get_name(chan_node), error);
-			return error;
+			goto put_chan_node;
 		}
 
 		chan_setup[0] &= ~GENMASK(4 + ARRAY_SIZE(pins) - 1, 4);
@@ -1878,7 +1888,8 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 				dev_err(&client->dev,
 					"Invalid %s CRx pin: %u\n",
 					fwnode_get_name(chan_node), pins[i]);
-				return -EINVAL;
+				error = -EINVAL;
+				goto put_chan_node;
 			}
 
 			chan_setup[0] |= BIT(pins[i] + 4 - min_crx);
@@ -1897,14 +1908,18 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 		error = iqs7222_parse_props(iqs7222, &event_node, chan_index,
 					    IQS7222_REG_GRP_BTN,
 					    iqs7222_kp_events[i].reg_key);
-		if (error)
-			return error;
+		if (error) {
+			fwnode_handle_put(event_node);
+			goto put_chan_node;
+		}
 
 		error = iqs7222_gpio_select(iqs7222, event_node,
 					    BIT(chan_index),
 					    dev_desc->touch_link - (i ? 0 : 2));
-		if (error)
-			return error;
+		if (error) {
+			fwnode_handle_put(event_node);
+			goto put_chan_node;
+		}
 
 		if (!fwnode_property_read_u32(event_node,
 					      "azoteq,timeout-press-ms",
@@ -1922,7 +1937,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 				dev_err(&client->dev,
 					"Invalid %s press timeout: %u\n",
 					fwnode_get_name(chan_node), val);
-				return -EINVAL;
+				error = -EINVAL;
+				fwnode_handle_put(event_node);
+				goto put_chan_node;
 			}
 
 			*setup &= ~(U8_MAX << i * 8);
@@ -1934,7 +1951,8 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 		if (error) {
 			dev_err(&client->dev, "Failed to read %s code: %d\n",
 				fwnode_get_name(chan_node), error);
-			return error;
+			fwnode_handle_put(event_node);
+			goto put_chan_node;
 		}
 
 		iqs7222->kp_code[chan_index][i] = val;
@@ -1948,19 +1966,24 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 				dev_err(&client->dev,
 					"Failed to read %s input type: %d\n",
 					fwnode_get_name(chan_node), error);
-				return error;
+				fwnode_handle_put(event_node);
+				goto put_chan_node;
 			}
 
 			if (val != EV_KEY && val != EV_SW) {
 				dev_err(&client->dev,
 					"Invalid %s input type: %u\n",
 					fwnode_get_name(chan_node), val);
-				return -EINVAL;
+				error = -EINVAL;
+				fwnode_handle_put(event_node);
+				goto put_chan_node;
 			}
 
 			iqs7222->kp_type[chan_index][i] = val;
 		}
 
+		fwnode_handle_put(event_node);
+
 		/*
 		 * Reference channels can opt out of event reporting by using
 		 * KEY_RESERVED in place of a true key or switch code.
@@ -1983,9 +2006,14 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 	 * The following call handles a special pair of properties that apply
 	 * to a channel node, but reside within the button (event) group.
 	 */
-	return iqs7222_parse_props(iqs7222, &chan_node, chan_index,
-				   IQS7222_REG_GRP_BTN,
-				   IQS7222_REG_KEY_DEBOUNCE);
+	error = iqs7222_parse_props(iqs7222, &chan_node, chan_index,
+				    IQS7222_REG_GRP_BTN,
+				    IQS7222_REG_KEY_DEBOUNCE);
+
+put_chan_node:
+	fwnode_handle_put(chan_node);
+
+	return error;
 }
 
 static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
@@ -2004,7 +2032,7 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 				    IQS7222_REG_GRP_SLDR,
 				    IQS7222_REG_KEY_NONE);
 	if (error)
-		return error;
+		goto put_sldr_node;
 
 	if (!sldr_node)
 		return 0;
@@ -2018,11 +2046,13 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	if (count < 0) {
 		dev_err(&client->dev, "Failed to count %s channels: %d\n",
 			fwnode_get_name(sldr_node), count);
-		return count;
+		error = count;
+		goto put_sldr_node;
 	} else if (count < 3 || count > ARRAY_SIZE(chan_sel)) {
 		dev_err(&client->dev, "Invalid number of %s channels\n",
 			fwnode_get_name(sldr_node));
-		return -EINVAL;
+		error = -EINVAL;
+		goto put_sldr_node;
 	}
 
 	error = fwnode_property_read_u32_array(sldr_node,
@@ -2031,7 +2061,7 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	if (error) {
 		dev_err(&client->dev, "Failed to read %s channels: %d\n",
 			fwnode_get_name(sldr_node), error);
-		return error;
+		goto put_sldr_node;
 	}
 
 	/*
@@ -2052,7 +2082,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		if (chan_sel[i] >= ext_chan) {
 			dev_err(&client->dev, "Invalid %s channel: %u\n",
 				fwnode_get_name(sldr_node), chan_sel[i]);
-			return -EINVAL;
+			error = -EINVAL;
+			goto put_sldr_node;
 		}
 
 		/*
@@ -2071,7 +2102,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		if (!val || val > dev_desc->sldr_res) {
 			dev_err(&client->dev, "Invalid %s size: %u\n",
 				fwnode_get_name(sldr_node), val);
-			return -EINVAL;
+			error = -EINVAL;
+			goto put_sldr_node;
 		}
 
 		if (reg_offset) {
@@ -2087,7 +2119,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		if (val > (reg_offset ? U16_MAX : U8_MAX * 4)) {
 			dev_err(&client->dev, "Invalid %s top speed: %u\n",
 				fwnode_get_name(sldr_node), val);
-			return -EINVAL;
+			error = -EINVAL;
+			goto put_sldr_node;
 		}
 
 		if (reg_offset) {
@@ -2142,8 +2175,10 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 					    reg_offset ?
 					    IQS7222_REG_KEY_RESERVED :
 					    iqs7222_sl_events[i].reg_key);
-		if (error)
-			return error;
+		if (error) {
+			fwnode_handle_put(event_node);
+			goto put_sldr_node;
+		}
 
 		/*
 		 * The press/release event does not expose a direct GPIO link,
@@ -2155,8 +2190,10 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 					      : sldr_setup[3 + reg_offset],
 					    i ? 1568 + sldr_index * 30
 					      : sldr_setup[4 + reg_offset]);
-		if (error)
-			return error;
+		if (error) {
+			fwnode_handle_put(event_node);
+			goto put_sldr_node;
+		}
 
 		if (!reg_offset)
 			sldr_setup[9] |= iqs7222_sl_events[i].enable;
@@ -2166,12 +2203,15 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		if (error) {
 			dev_err(&client->dev, "Failed to read %s code: %d\n",
 				fwnode_get_name(sldr_node), error);
-			return error;
+			fwnode_handle_put(event_node);
+			goto put_sldr_node;
 		}
 
 		iqs7222->sl_code[sldr_index][i] = val;
 		input_set_capability(iqs7222->keypad, EV_KEY, val);
 
+		fwnode_handle_put(event_node);
+
 		if (!dev_desc->event_offset)
 			continue;
 
@@ -2192,11 +2232,16 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	 * The following call handles a special pair of properties that shift
 	 * to make room for a wheel enable control in the case of IQS7222C.
 	 */
-	return iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
-				   IQS7222_REG_GRP_SLDR,
-				   dev_desc->wheel_enable ?
-				   IQS7222_REG_KEY_WHEEL :
-				   IQS7222_REG_KEY_NO_WHEEL);
+	error = iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
+				    IQS7222_REG_GRP_SLDR,
+				    dev_desc->wheel_enable ?
+				    IQS7222_REG_KEY_WHEEL :
+				    IQS7222_REG_KEY_NO_WHEEL);
+
+put_sldr_node:
+	fwnode_handle_put(sldr_node);
+
+	return error;
 }
 
 static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
@@ -2232,6 +2277,9 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 		error = iqs7222_parse_props(iqs7222, &gpio_node, i,
 					    IQS7222_REG_GRP_GPIO,
 					    IQS7222_REG_KEY_NONE);
+		if (gpio_node)
+			fwnode_handle_put(gpio_node);
+
 		if (error)
 			return error;
 
-- 
2.25.1

