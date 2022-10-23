Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1DD609092
	for <lists+linux-input@lfdr.de>; Sun, 23 Oct 2022 02:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiJWA4P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 20:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiJWA4O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 20:56:14 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2054.outbound.protection.outlook.com [40.107.101.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125C46F243;
        Sat, 22 Oct 2022 17:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/iBnZMFipcirZ2OvFd5iXc8M82DC10xVYodJycBwZcCAu/y4rA5/pMfXdmcFdawIV/s46WHV6rIJCtJwzz42qUMEcDM5p0bON5XRUg8P7RUnXbZd7wWxIbQQ6AXvsWR6BR+6juFkcbhszRY+T/qVWhxMWcpOijpBGb3elBq5tv1enZGMfct9eSfEepaEH0vWFa1tKpMu02F4JV4tB3OWPYgYKOsYUxfVRrw61EFUNfulGr4kDqMJZGjFdtEqOYsR42UPC6oWIBokGkXAZpaAr4pcJ+ThtDccY9lf6xMDk11Cs9GmulGr9hLeGcDWeOCYAQnCRH/xYAH+LjOoXrdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzzUxqBotv3/7ilpQJuurRQf66qgv2QqEUYPIyZ+LQE=;
 b=ieZwwu8amJBnnG/QNZlgZ5LxHjOnFaVrhthT4wXJYAxN7LdrFoMnGzDgwzGP4JeaJdFZdaH7FHZoWMCB2D9v/A+rp1wHAwYOe46ifyu9447BNf+nfQyTDRknl5+XL8TL9aURfSl0uEmGnHtOd9EWTKo2sjdibmTuYjUSEUhcztN/hhPcm4duMd4olf7AC3B8W1n4GdOCjqehQN/7fq/jkVJ3dO/phvnlgckjjPwn4bDYWGHuIhq/MYlYJ8LIntAnYYvcV4LLTx5S4GOKJGQgL1YgY7oe+e4lsx1qb+vGwzockjwrSMn9NaNhXNqc+cjTtedhO2yf6cppGLYCEn0k0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzzUxqBotv3/7ilpQJuurRQf66qgv2QqEUYPIyZ+LQE=;
 b=sYpMe05WJE4ABDmAh+IkBLHEPRc8atyWShhuoT3/2GIe3TrmChbliM3/kQuDs23rhJoPZI5+wsJsk195m5cVrnLONco+9jHbRJJS+fc6Jzu+aCVPqv5dUk90dzZZh6P4R0rNIJXpq6QUjVknELeF/0l1pb09TX3kx8bJh5WUkwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4896.namprd08.prod.outlook.com
 (2603:10b6:805:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 00:56:11 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5723.034; Sun, 23 Oct 2022
 00:56:05 +0000
Date:   Sat, 22 Oct 2022 19:56:04 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v3 1/7] Input: iqs7222 - drop unused device node references
Message-ID: <Y1SRJIQ3WPwNpC0K@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: Y1SQ2t6yUvdaIQPG@nixie71
References: Y1SQ2t6yUvdaIQPG@nixie71
X-ClientProxiedBy: SN7PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:806:122::10) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN6PR08MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 927dff5e-6a1a-4641-df2b-08dab4915d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M1u0zW+Rl9zweKI3snIQK9EmwfZx7ALh22Jx4p36EO9uvo+rkJU5ssJvSzGKnVZwEh4CNYQ1ipGqvrfrCAer/TAx1A035T0btJQMlgmgvg+AUwhdREWPefikJFOlCA85/5+1YPns1bPeoF2OyOGXuBZwPaGCK9VmB1iodGDna4QEd8bsnP3pujSttRyYZa/FbgpXrO0iTVXWubYBYTnMZmOhnfbkp8TVAvmPnc6JxJDN9nzLr1ibw4CtJJTCuo1TdY7aZf/CqCyblWP9W0yEriU8fpNHtl2fPMCQlqfOMkiv1iozASWLKyTYil0SZq/K4aXldBGhBmCQVeSNFu0GZy16r01d0LM5oaGHdiuUcO6F93avNfZa7yqWi3E4QXGKgWUvxd8w0OVXLQV/mq4K0jhhnrZAtNwOOz4fXzEC6HZdY7xj/q68qP8jbMTcp3tShWoDf9Txp8cJ5O647wOzNEqA7nNH1wiOo5ZNcTekhHhejLh+wBIaUArOuGHUYR1+JpR38+zz71qIkORIEs3GAzcQ075WaEwdFRgmCjW+zrQA0JqekWhKkjVpVgBOYtbIx+aVO5yqaiaJAk4Hv5wo2jyY3cGtDqsjGZaJVSadkWczuyuzECw1TG8unuMiLxrXPT0su4l5uHwdyg2976EkFDGOICstldJmxl2Ujf5h8z6mWUZSh9Epw6dxYcZT7qV1Iq10wSjAG5LGHVrqRWZrYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(346002)(39830400003)(366004)(451199015)(8936002)(30864003)(2906002)(38100700002)(186003)(6506007)(6512007)(9686003)(26005)(5660300002)(41300700001)(86362001)(33716001)(83380400001)(478600001)(316002)(6486002)(107886003)(4326008)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?keP2Zxi1Y5ezuH/5BJxdJGOZE69bwAieIj0YYwvj1tzOni83CIkMTIALXVpv?=
 =?us-ascii?Q?eQbs4EpR8D1qcMvknmmpMrdtmc1kmT2vbR/wfqRjTpD711QEqRoTDVM3nLWi?=
 =?us-ascii?Q?i5nE194HjpD3V3I5OAcyT5b2DRR5Y170w1RlfWqOrlRw2mfY8SvaYXz+PkHt?=
 =?us-ascii?Q?lUld573fq6IcFLpKFxMtlA8UtV5MFOCuJ4yzkeDFb+109JvLrI1GRkFnBqHc?=
 =?us-ascii?Q?19RBoKnkaQkbdGQP+9dttG7qUucz8LSCb3abxcB2qI+G8IcjRS/GJBDVC1rf?=
 =?us-ascii?Q?nqSahV/XdcHg5GRAvQpFhXoBeTzt+w0gDTLCoUZLULLfVB5ThB+zoJNspRvh?=
 =?us-ascii?Q?+CPxEAH/rBx2boihf9Lzxs1f7QVDdzyvOE+lvH5fnjHxWgxtTWaTdtmjMRhl?=
 =?us-ascii?Q?xcLaLPp/1nph/ablBySDFWNfUOKtslrz3ZNgRf9ijtc/axM4tC/xhXenNrav?=
 =?us-ascii?Q?cJuTJcydYgPH0X7T/jXFyZOZ5PiEcm6914oN8bzn5xpvYEMR6JemLSPA1Q40?=
 =?us-ascii?Q?UR6BZWvb0SBrOow2c+5it6rj7Et9gLOqPcpi548Ikl3d5/sdtQBmfV1ZxmYx?=
 =?us-ascii?Q?67e5PZ0rRKDemNDhuFnk8ixXkWIMDH/zrZTeXYPMzxDGdnK5y+oRpNn+H3qF?=
 =?us-ascii?Q?OXsFlAwCIsCzP0GguL/SptIetdMmyOGTlG95vYtjXCd2lYbaPNMrBS7faNaF?=
 =?us-ascii?Q?EcuVwCtZwck7g8dv5KIi3KCis63R3EbQp/hWKUOY3RcWuyfr19z4IUHTNsrJ?=
 =?us-ascii?Q?xO/B2WsXofdiIS3A9kWK1sV584npL7zveeGTNvD1IoUj+ny/TXNMs+l533YT?=
 =?us-ascii?Q?AFnV1DOKLwVJmdQlItk0hAk0A2xmw7k7ay85dVTOXEONUkYSgtTLkzM/gt1Q?=
 =?us-ascii?Q?W8zCrhxHj9SnoePOEHdjQYFH1OjxMhbumJUrdKr7pzkRP0dDnGliq+YaoMMc?=
 =?us-ascii?Q?ppdTAeNjQL14kiX9W6P+MNsobZbedmejeQjheIpLZYsZ0MKgYSQEKCweVLn8?=
 =?us-ascii?Q?YqrFwX96qCXIz/46x8Za//x7trKFv0WGmreTYR1M3lUKchN4I9kfgfea5TgM?=
 =?us-ascii?Q?NpxrcvfoOm/Eea5CrM2mGWwS8K5PAR5m1CwnvGo6NaU5lkNlxUm+MY1XUPFb?=
 =?us-ascii?Q?4rKMQ5hp6cuFHmwu06se5Y+C3ckD1eHjn3TZdVLGmBGQ3M1TEs/IKowq9BQq?=
 =?us-ascii?Q?Zk7MPoEOvUQN7bW1coNYWESFRxOSt8AL49FjHyDFM1LUn2cDdbGev7sLnhS6?=
 =?us-ascii?Q?VBgkmdzrGxv8aorW9zS3ejaNxUquLh+OKSinu/FWkPVP39TJ+cDQRyYTbH2i?=
 =?us-ascii?Q?i+90+tAgsCopXCJCGpPfbbxXpAMg5xHO22bNoh1ImLzPTXPsmzKq/DRfYcTx?=
 =?us-ascii?Q?xN5PUybdR9A8umWIKFec8l+k/OLuGdx7cLnuuzU2HwWonLfy6Z2yku/5fNb0?=
 =?us-ascii?Q?Ih/ITr6O0qDA6fYJLlGCJt+FJsxmXz3jzJakwDwkjAvPp+rxt5E9jiXrfNr1?=
 =?us-ascii?Q?LK1xl1QbxZ4k5o8dm1No8H3tbITKus2Cv0YdAdy5rTXRjKG//qSB2t0O18f5?=
 =?us-ascii?Q?xQ8pZiaPp0ymITNEFs4jHXf5IU7TnSAAOW1fS1in?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927dff5e-6a1a-4641-df2b-08dab4915d38
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 00:56:05.5018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSOlHFOUk/l9UU8HplkzvgH8xnCGWZirdz5bvniZ4aB/J4n1gTdKfFL6PzJohkOkKgVt1aewDQG8AhD3aI/sWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4896
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Each call to device/fwnode_get_named_child_node() must be matched
with a call to fwnode_handle_put() once the corresponding node is
no longer in use. This ensures a reference count remains balanced
in the case of dynamic device tree support.

Currently, the driver never calls fwnode_handle_put(). Solve this
problem by moving the node handling from iqs7222_parse_props() to
the new iqs7222_parse_reg_grp(), leaving the former to do nothing
but parse properties. The latter then manages the reference count
in a single location and consistent fashion.

This change drastically simplifies iqs7222_parse_all(), which can
then call iqs7222_parse_reg_grp() on every register group without
having to treat each register group differently.

For nested event nodes, common parsing code has been factored out
to the new iqs7222_parse_event() so as to allow the event node to
be dropped from as few locations as possible.

As part of this refactor, the 'linux,code' property has been made
optional. This enables applications that define an event with the
sole purpose of enabling a GPIO.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v3:
 - Updated iqs7222_parse_reg_grp() to call iqs7222_parse_props() for all
   register groups in order to drop the same call from every instance of
   iqs7222_parse_extra()
 - Out of an abundance of caution, opted to drop previous Reviewed-by as
   the change was non-trivial

Changes in v2:
 - Created new iqs7222_parse_reg_grp() and iqs7222_parse_event() helpers
   to prevent multiple goto statements and calls to fwnode_handle_put()
 - Updated commit message

 drivers/input/misc/iqs7222.c | 340 +++++++++++++++--------------------
 1 file changed, 146 insertions(+), 194 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index ddb863bf63ee..ca02fea9be59 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -105,14 +105,14 @@ enum iqs7222_reg_grp_id {
 	IQS7222_NUM_REG_GRPS
 };
 
-static const char * const iqs7222_reg_grp_names[] = {
+static const char * const iqs7222_reg_grp_names[IQS7222_NUM_REG_GRPS] = {
 	[IQS7222_REG_GRP_CYCLE] = "cycle",
 	[IQS7222_REG_GRP_CHAN] = "channel",
 	[IQS7222_REG_GRP_SLDR] = "slider",
 	[IQS7222_REG_GRP_GPIO] = "gpio",
 };
 
-static const unsigned int iqs7222_max_cols[] = {
+static const unsigned int iqs7222_max_cols[IQS7222_NUM_REG_GRPS] = {
 	[IQS7222_REG_GRP_STAT] = IQS7222_MAX_COLS_STAT,
 	[IQS7222_REG_GRP_CYCLE] = IQS7222_MAX_COLS_CYCLE,
 	[IQS7222_REG_GRP_GLBL] = IQS7222_MAX_COLS_GLBL,
@@ -1567,56 +1567,17 @@ static int iqs7222_gpio_select(struct iqs7222_private *iqs7222,
 }
 
 static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
-			       struct fwnode_handle **child_node,
-			       int child_index,
+			       struct fwnode_handle *reg_grp_node,
+			       int reg_grp_index,
 			       enum iqs7222_reg_grp_id reg_grp,
 			       enum iqs7222_reg_key_id reg_key)
 {
-	u16 *setup = iqs7222_setup(iqs7222, reg_grp, child_index);
+	u16 *setup = iqs7222_setup(iqs7222, reg_grp, reg_grp_index);
 	struct i2c_client *client = iqs7222->client;
-	struct fwnode_handle *reg_grp_node;
-	char reg_grp_name[16];
 	int i;
 
-	switch (reg_grp) {
-	case IQS7222_REG_GRP_CYCLE:
-	case IQS7222_REG_GRP_CHAN:
-	case IQS7222_REG_GRP_SLDR:
-	case IQS7222_REG_GRP_GPIO:
-	case IQS7222_REG_GRP_BTN:
-		/*
-		 * These groups derive a child node and return it to the caller
-		 * for additional group-specific processing. In some cases, the
-		 * child node may have already been derived.
-		 */
-		reg_grp_node = *child_node;
-		if (reg_grp_node)
-			break;
-
-		snprintf(reg_grp_name, sizeof(reg_grp_name), "%s-%d",
-			 iqs7222_reg_grp_names[reg_grp], child_index);
-
-		reg_grp_node = device_get_named_child_node(&client->dev,
-							   reg_grp_name);
-		if (!reg_grp_node)
-			return 0;
-
-		*child_node = reg_grp_node;
-		break;
-
-	case IQS7222_REG_GRP_GLBL:
-	case IQS7222_REG_GRP_FILT:
-	case IQS7222_REG_GRP_SYS:
-		/*
-		 * These groups are not organized beneath a child node, nor are
-		 * they subject to any additional processing by the caller.
-		 */
-		reg_grp_node = dev_fwnode(&client->dev);
-		break;
-
-	default:
-		return -EINVAL;
-	}
+	if (!setup)
+		return 0;
 
 	for (i = 0; i < ARRAY_SIZE(iqs7222_props); i++) {
 		const char *name = iqs7222_props[i].name;
@@ -1686,11 +1647,66 @@ static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
 	return 0;
 }
 
-static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
+static int iqs7222_parse_event(struct iqs7222_private *iqs7222,
+			       struct fwnode_handle *event_node,
+			       int reg_grp_index,
+			       enum iqs7222_reg_grp_id reg_grp,
+			       enum iqs7222_reg_key_id reg_key,
+			       u16 event_enable, u16 event_link,
+			       unsigned int *event_type,
+			       unsigned int *event_code)
+{
+	struct i2c_client *client = iqs7222->client;
+	int error;
+
+	error = iqs7222_parse_props(iqs7222, event_node, reg_grp_index,
+				    reg_grp, reg_key);
+	if (error)
+		return error;
+
+	error = iqs7222_gpio_select(iqs7222, event_node, event_enable,
+				    event_link);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(event_node, "linux,code", event_code);
+	if (error == -EINVAL) {
+		return 0;
+	} else if (error) {
+		dev_err(&client->dev, "Failed to read %s code: %d\n",
+			fwnode_get_name(event_node), error);
+		return error;
+	}
+
+	if (!event_type) {
+		input_set_capability(iqs7222->keypad, EV_KEY, *event_code);
+		return 0;
+	}
+
+	error = fwnode_property_read_u32(event_node, "linux,input-type",
+					 event_type);
+	if (error == -EINVAL) {
+		*event_type = EV_KEY;
+	} else if (error) {
+		dev_err(&client->dev, "Failed to read %s input type: %d\n",
+			fwnode_get_name(event_node), error);
+		return error;
+	} else if (*event_type != EV_KEY && *event_type != EV_SW) {
+		dev_err(&client->dev, "Invalid %s input type: %d\n",
+			fwnode_get_name(event_node), *event_type);
+		return -EINVAL;
+	}
+
+	input_set_capability(iqs7222->keypad, *event_type, *event_code);
+
+	return 0;
+}
+
+static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222,
+			       struct fwnode_handle *cycle_node, int cycle_index)
 {
 	u16 *cycle_setup = iqs7222->cycle_setup[cycle_index];
 	struct i2c_client *client = iqs7222->client;
-	struct fwnode_handle *cycle_node = NULL;
 	unsigned int pins[9];
 	int error, count, i;
 
@@ -1698,17 +1714,7 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
 	 * Each channel shares a cycle with one other channel; the mapping of
 	 * channels to cycles is fixed. Properties defined for a cycle impact
 	 * both channels tied to the cycle.
-	 */
-	error = iqs7222_parse_props(iqs7222, &cycle_node, cycle_index,
-				    IQS7222_REG_GRP_CYCLE,
-				    IQS7222_REG_KEY_NONE);
-	if (error)
-		return error;
-
-	if (!cycle_node)
-		return 0;
-
-	/*
+	 *
 	 * Unlike channels which are restricted to a select range of CRx pins
 	 * based on channel number, any cycle can claim any of the device's 9
 	 * CTx pins (CTx0-8).
@@ -1750,11 +1756,11 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
 	return 0;
 }
 
-static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
+static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
+			      struct fwnode_handle *chan_node, int chan_index)
 {
 	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
 	struct i2c_client *client = iqs7222->client;
-	struct fwnode_handle *chan_node = NULL;
 	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
 	int ext_chan = rounddown(num_chan, 10);
 	int error, i;
@@ -1762,15 +1768,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 	u16 *sys_setup = iqs7222->sys_setup;
 	unsigned int val;
 
-	error = iqs7222_parse_props(iqs7222, &chan_node, chan_index,
-				    IQS7222_REG_GRP_CHAN,
-				    IQS7222_REG_KEY_NONE);
-	if (error)
-		return error;
-
-	if (!chan_node)
-		return 0;
-
 	if (dev_desc->allow_offset &&
 	    fwnode_property_present(chan_node, "azoteq,ulp-allow"))
 		sys_setup[dev_desc->allow_offset] &= ~BIT(chan_index);
@@ -1892,18 +1889,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 		if (!event_node)
 			continue;
 
-		error = iqs7222_parse_props(iqs7222, &event_node, chan_index,
-					    IQS7222_REG_GRP_BTN,
-					    iqs7222_kp_events[i].reg_key);
-		if (error)
-			return error;
-
-		error = iqs7222_gpio_select(iqs7222, event_node,
-					    BIT(chan_index),
-					    dev_desc->touch_link - (i ? 0 : 2));
-		if (error)
-			return error;
-
 		if (!fwnode_property_read_u32(event_node,
 					      "azoteq,timeout-press-ms",
 					      &val)) {
@@ -1919,7 +1904,8 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			if (val > U8_MAX * 500) {
 				dev_err(&client->dev,
 					"Invalid %s press timeout: %u\n",
-					fwnode_get_name(chan_node), val);
+					fwnode_get_name(event_node), val);
+				fwnode_handle_put(event_node);
 				return -EINVAL;
 			}
 
@@ -1927,49 +1913,16 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			*setup |= (val / 500 << i * 8);
 		}
 
-		error = fwnode_property_read_u32(event_node, "linux,code",
-						 &val);
-		if (error) {
-			dev_err(&client->dev, "Failed to read %s code: %d\n",
-				fwnode_get_name(chan_node), error);
+		error = iqs7222_parse_event(iqs7222, event_node, chan_index,
+					    IQS7222_REG_GRP_BTN,
+					    iqs7222_kp_events[i].reg_key,
+					    BIT(chan_index),
+					    dev_desc->touch_link - (i ? 0 : 2),
+					    &iqs7222->kp_type[chan_index][i],
+					    &iqs7222->kp_code[chan_index][i]);
+		fwnode_handle_put(event_node);
+		if (error)
 			return error;
-		}
-
-		iqs7222->kp_code[chan_index][i] = val;
-		iqs7222->kp_type[chan_index][i] = EV_KEY;
-
-		if (fwnode_property_present(event_node, "linux,input-type")) {
-			error = fwnode_property_read_u32(event_node,
-							 "linux,input-type",
-							 &val);
-			if (error) {
-				dev_err(&client->dev,
-					"Failed to read %s input type: %d\n",
-					fwnode_get_name(chan_node), error);
-				return error;
-			}
-
-			if (val != EV_KEY && val != EV_SW) {
-				dev_err(&client->dev,
-					"Invalid %s input type: %u\n",
-					fwnode_get_name(chan_node), val);
-				return -EINVAL;
-			}
-
-			iqs7222->kp_type[chan_index][i] = val;
-		}
-
-		/*
-		 * Reference channels can opt out of event reporting by using
-		 * KEY_RESERVED in place of a true key or switch code.
-		 */
-		if (iqs7222->kp_type[chan_index][i] == EV_KEY &&
-		    iqs7222->kp_code[chan_index][i] == KEY_RESERVED)
-			continue;
-
-		input_set_capability(iqs7222->keypad,
-				     iqs7222->kp_type[chan_index][i],
-				     iqs7222->kp_code[chan_index][i]);
 
 		if (!dev_desc->event_offset)
 			continue;
@@ -1981,16 +1934,16 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 	 * The following call handles a special pair of properties that apply
 	 * to a channel node, but reside within the button (event) group.
 	 */
-	return iqs7222_parse_props(iqs7222, &chan_node, chan_index,
+	return iqs7222_parse_props(iqs7222, chan_node, chan_index,
 				   IQS7222_REG_GRP_BTN,
 				   IQS7222_REG_KEY_DEBOUNCE);
 }
 
-static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
+static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
+			      struct fwnode_handle *sldr_node, int sldr_index)
 {
 	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
 	struct i2c_client *client = iqs7222->client;
-	struct fwnode_handle *sldr_node = NULL;
 	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
 	int ext_chan = rounddown(num_chan, 10);
 	int count, error, reg_offset, i;
@@ -1998,15 +1951,6 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	u16 *sldr_setup = iqs7222->sldr_setup[sldr_index];
 	unsigned int chan_sel[4], val;
 
-	error = iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
-				    IQS7222_REG_GRP_SLDR,
-				    IQS7222_REG_KEY_NONE);
-	if (error)
-		return error;
-
-	if (!sldr_node)
-		return 0;
-
 	/*
 	 * Each slider can be spread across 3 to 4 channels. It is possible to
 	 * select only 2 channels, but doing so prevents the slider from using
@@ -2130,46 +2074,37 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	for (i = 0; i < ARRAY_SIZE(iqs7222_sl_events); i++) {
 		const char *event_name = iqs7222_sl_events[i].name;
 		struct fwnode_handle *event_node;
+		enum iqs7222_reg_key_id reg_key;
 
 		event_node = fwnode_get_named_child_node(sldr_node, event_name);
 		if (!event_node)
 			continue;
 
-		error = iqs7222_parse_props(iqs7222, &event_node, sldr_index,
-					    IQS7222_REG_GRP_SLDR,
-					    reg_offset ?
-					    IQS7222_REG_KEY_RESERVED :
-					    iqs7222_sl_events[i].reg_key);
-		if (error)
-			return error;
+		if (reg_offset)
+			reg_key = IQS7222_REG_KEY_RESERVED;
+		else
+			reg_key = iqs7222_sl_events[i].reg_key;
 
 		/*
 		 * The press/release event does not expose a direct GPIO link,
 		 * but one can be emulated by tying each of the participating
 		 * channels to the same GPIO.
 		 */
-		error = iqs7222_gpio_select(iqs7222, event_node,
+		error = iqs7222_parse_event(iqs7222, event_node, sldr_index,
+					    IQS7222_REG_GRP_SLDR, reg_key,
 					    i ? iqs7222_sl_events[i].enable
 					      : sldr_setup[3 + reg_offset],
 					    i ? 1568 + sldr_index * 30
-					      : sldr_setup[4 + reg_offset]);
+					      : sldr_setup[4 + reg_offset],
+					    NULL,
+					    &iqs7222->sl_code[sldr_index][i]);
+		fwnode_handle_put(event_node);
 		if (error)
 			return error;
 
 		if (!reg_offset)
 			sldr_setup[9] |= iqs7222_sl_events[i].enable;
 
-		error = fwnode_property_read_u32(event_node, "linux,code",
-						 &val);
-		if (error) {
-			dev_err(&client->dev, "Failed to read %s code: %d\n",
-				fwnode_get_name(sldr_node), error);
-			return error;
-		}
-
-		iqs7222->sl_code[sldr_index][i] = val;
-		input_set_capability(iqs7222->keypad, EV_KEY, val);
-
 		if (!dev_desc->event_offset)
 			continue;
 
@@ -2190,19 +2125,63 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	 * The following call handles a special pair of properties that shift
 	 * to make room for a wheel enable control in the case of IQS7222C.
 	 */
-	return iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
+	return iqs7222_parse_props(iqs7222, sldr_node, sldr_index,
 				   IQS7222_REG_GRP_SLDR,
 				   dev_desc->wheel_enable ?
 				   IQS7222_REG_KEY_WHEEL :
 				   IQS7222_REG_KEY_NO_WHEEL);
 }
 
+static int (*iqs7222_parse_extra[IQS7222_NUM_REG_GRPS])
+				(struct iqs7222_private *iqs7222,
+				 struct fwnode_handle *reg_grp_node,
+				 int reg_grp_index) = {
+	[IQS7222_REG_GRP_CYCLE] = iqs7222_parse_cycle,
+	[IQS7222_REG_GRP_CHAN] = iqs7222_parse_chan,
+	[IQS7222_REG_GRP_SLDR] = iqs7222_parse_sldr,
+};
+
+static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
+				 enum iqs7222_reg_grp_id reg_grp,
+				 int reg_grp_index)
+{
+	struct i2c_client *client = iqs7222->client;
+	struct fwnode_handle *reg_grp_node;
+	int error;
+
+	if (iqs7222_reg_grp_names[reg_grp]) {
+		char reg_grp_name[16];
+
+		snprintf(reg_grp_name, sizeof(reg_grp_name), "%s-%d",
+			 iqs7222_reg_grp_names[reg_grp], reg_grp_index);
+
+		reg_grp_node = device_get_named_child_node(&client->dev,
+							   reg_grp_name);
+	} else {
+		reg_grp_node = fwnode_handle_get(dev_fwnode(&client->dev));
+	}
+
+	if (!reg_grp_node)
+		return 0;
+
+	error = iqs7222_parse_props(iqs7222, reg_grp_node, reg_grp_index,
+				    reg_grp, IQS7222_REG_KEY_NONE);
+
+	if (!error && iqs7222_parse_extra[reg_grp])
+		error = iqs7222_parse_extra[reg_grp](iqs7222, reg_grp_node,
+						     reg_grp_index);
+
+	fwnode_handle_put(reg_grp_node);
+
+	return error;
+}
+
 static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 {
 	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
 	const struct iqs7222_reg_grp_desc *reg_grps = dev_desc->reg_grps;
 	u16 *sys_setup = iqs7222->sys_setup;
-	int error, i;
+	int error, i, j;
 
 	if (dev_desc->allow_offset)
 		sys_setup[dev_desc->allow_offset] = U16_MAX;
@@ -2210,32 +2189,13 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 	if (dev_desc->event_offset)
 		sys_setup[dev_desc->event_offset] = IQS7222_EVENT_MASK_ATI;
 
-	for (i = 0; i < reg_grps[IQS7222_REG_GRP_CYCLE].num_row; i++) {
-		error = iqs7222_parse_cycle(iqs7222, i);
-		if (error)
-			return error;
-	}
-
-	error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_GLBL,
-				    IQS7222_REG_KEY_NONE);
-	if (error)
-		return error;
-
 	for (i = 0; i < reg_grps[IQS7222_REG_GRP_GPIO].num_row; i++) {
-		struct fwnode_handle *gpio_node = NULL;
 		u16 *gpio_setup = iqs7222->gpio_setup[i];
-		int j;
 
 		gpio_setup[0] &= ~IQS7222_GPIO_SETUP_0_GPIO_EN;
 		gpio_setup[1] = 0;
 		gpio_setup[2] = 0;
 
-		error = iqs7222_parse_props(iqs7222, &gpio_node, i,
-					    IQS7222_REG_GRP_GPIO,
-					    IQS7222_REG_KEY_NONE);
-		if (error)
-			return error;
-
 		if (reg_grps[IQS7222_REG_GRP_GPIO].num_row == 1)
 			continue;
 
@@ -2258,29 +2218,21 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
 		chan_setup[5] = 0;
 	}
 
-	for (i = 0; i < reg_grps[IQS7222_REG_GRP_CHAN].num_row; i++) {
-		error = iqs7222_parse_chan(iqs7222, i);
-		if (error)
-			return error;
-	}
-
-	error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_FILT,
-				    IQS7222_REG_KEY_NONE);
-	if (error)
-		return error;
-
 	for (i = 0; i < reg_grps[IQS7222_REG_GRP_SLDR].num_row; i++) {
 		u16 *sldr_setup = iqs7222->sldr_setup[i];
 
 		sldr_setup[0] &= ~IQS7222_SLDR_SETUP_0_CHAN_CNT_MASK;
+	}
 
-		error = iqs7222_parse_sldr(iqs7222, i);
-		if (error)
-			return error;
+	for (i = 0; i < IQS7222_NUM_REG_GRPS; i++) {
+		for (j = 0; j < reg_grps[i].num_row; j++) {
+			error = iqs7222_parse_reg_grp(iqs7222, i, j);
+			if (error)
+				return error;
+		}
 	}
 
-	return iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_SYS,
-				   IQS7222_REG_KEY_NONE);
+	return 0;
 }
 
 static int iqs7222_report(struct iqs7222_private *iqs7222)
-- 
2.34.1

