Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637245BA5E7
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 06:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiIPEan (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 00:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIPEam (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 00:30:42 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2054.outbound.protection.outlook.com [40.107.96.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074D96E883;
        Thu, 15 Sep 2022 21:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fX2wWTr9OS2K7A/GZrPoe6yG/wRJ29u+SmK11n+w8dp6xlx4OEBOksPbRzicBww9ra4vckSSHcddCaxBK1iHgXyv3vcEGxaPrPGt+6H9T2yj5irFCHXz/sl/n74OKd8MH9LQpdPmgsgv7/OetBNyf9vEG4D5UpmIRArmrU6CtHjFN4reEUUsHkULF2ONWNC9DqUkSJQ3w9XVDTKe0ovtIhDNrOTPFEvZTjy5ktgOeXVw9fDZaNsirvvLk6K46UYO9clnpaJLLqwS/vjOlav/upVapE3f9GVypAAcRPv/5gNkt2vSniTXTLPPjZm2wH+A4RZYE+Y8pqQjvErsZiQPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEF/O6tH58Z7ghcXHLt8tkcGoe4PcfWr0HvVNiL0cYE=;
 b=DMY+hv9nfPF2kZTUv6AK+JOyxoy3FflmABSdRnvDsVmpFVn0scXWzbFP6QcI+qffktPuDmcOyQaj1uQcAbPhfJGAqhvoX6u6VLOpX8UqxNuT2NUJlxkN2iDzGcHjXt9O5xqoROHo3w29mNvL+NnohfM1KIAlC1jbnL1BuG5j5CFV5LLwx0m+ldi1iSVJfvzw7vyuKqGso5qj9LDZAqPepUfORtRJ/WdliRmr1YErJeRJtLQ0eqU9oeu66+8x/fYoJZLte3tilFl4YFzv39bGKZc+Ol/YpLQgzahLaRsyeTKJ7pUYMLPKcrLaNDHncdgEYIVIsU+qYPFNkvfCZGrrXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEF/O6tH58Z7ghcXHLt8tkcGoe4PcfWr0HvVNiL0cYE=;
 b=E9WcVNl3cO1Elc8rrwgVYZRaFIQfy3L2BX3xImwLm2qJGXjSG1PNpo9QWZjhenEHQ9wTgYrw5Wxgod+DkioC28ksDku5VFRtJC0e++vQY7775KhgbhT5TUBkWiUVNjcpITDevzij7Ia7Oj7TSl49LkRL2apOjF/uS0sSqBVGMEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by PH0PR08MB7210.namprd08.prod.outlook.com (2603:10b6:510:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 04:30:39 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 04:30:39 +0000
Date:   Thu, 15 Sep 2022 23:30:37 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 1/7] Input: iqs7222 - drop unused device node references
Message-ID: <YyP77bKCoxMEMyjD@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyP7l/ts6SFI9iM2@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71>
X-ClientProxiedBy: SA9PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:806:20::19) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|PH0PR08MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 33711c29-2777-4c24-c060-08da979c353f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G3We1IuhQ+I3+wg8fvh4NkCGRwcMod/YUYfHRggpGBLLAYdbVv01utDhjIouMeZhZorbRdI4D1if47MOB+sBMgbl9dkoat1yZMgn+SV5Sf8cUTqBqpbYvyoKYISvrVeHteDwWnyEye8BXrj78v9stTZr7CdYVGSglUbHTTAc+XBEkuVtBaYbIUSrezeMkPCUR4vU5ElULLi+T5zRKTc231XZuUORYoSVEf5HWEBtm944PlxoBRjnlwi96lFk2YAgG89eTulN/s4OGpHLOztHxQe+la0hxPHWYmQaB0e+tSqp/qUweTQqoEHeXjta4MAKOVQAwbH6q4gBiEM9BZlN1H7OQdCS00v7lnZ34d3PNYm6vEF4Qo84Yk3l3wKP7PtvzLeqqGVF9DHwup2yaEiMRe9Zia6U4d43UJFFv1zpMQVZE8h1pcM4AHnSHjr5K7HbJ4nWA1+UETqsAkcNvMVKeMyw+clUW4nEF9+vHafcf6WT5jHzF0yQtztm04gajcohGkb6yAIL8BRjyi4VMVgRSwBTGNOGDBzSSZN0FBSm5rvhG6MMG9+wGqp54+GASMhluYniLqmSYaD+ogmijCLdXt2oRXVp00+Y/FibZv4y5Ew1TGI/NA+2vgdlYeNjNsQxTy+UxBHcDQFe5DOqqolyIx/mmZMNtHGfXRPud6kmd6sERQzlt9ZQCiXUPaub5pjQTMqg5UhfkYZfFM2X0ELz6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(376002)(136003)(39830400003)(396003)(451199015)(86362001)(33716001)(6486002)(316002)(38100700002)(478600001)(6506007)(107886003)(8676002)(9686003)(26005)(6512007)(66946007)(66556008)(66476007)(4326008)(8936002)(41300700001)(2906002)(186003)(5660300002)(83380400001)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nE+KunEoK4CtdyPpcq9psoU1OE6eUHalrtx3Yp5VytqG0b1lN+fZlG/mIVVb?=
 =?us-ascii?Q?OjNSriGAo4BT2THrC4w0qvY6738IzkUOsFxECsRGQztmYLbP/61XBRN5MLO7?=
 =?us-ascii?Q?ZqCmKFyzjVtyQpAmC1t+1dt3SbydZg5cX4kuudJpmIKk/S0jJ55TukpXssGE?=
 =?us-ascii?Q?ppbrTZITVPRr/lZovz5absETi7vTIBPsK2Xh1NUfRl/7Np4mySOouGVYue7a?=
 =?us-ascii?Q?G5fiSWgkZJgUbZmij1OxVQj9COm6c6E28nDACTVnfqjEjjEbtNWjuiOr3Tsd?=
 =?us-ascii?Q?OG7HhwV00ihakBVSl9PSRj0LdNq7LpH5TxubhlZcKsRReOwbqcY9gEcKTdq5?=
 =?us-ascii?Q?rFMvmRgp+My8qJlGX8nq5mjv0Ew9sRHi7yoRygSqg4KuPrDxzp9B2g2V5jzU?=
 =?us-ascii?Q?ajGrf5SSLA0P3VLxRPTzcpEEAzDWQnc3qjlc22bM8vpG+hVgkIKup7qrLVqM?=
 =?us-ascii?Q?aNB0TKOGxgBmZLO5dDuhR1ByAdGOQ4G/wS5NLcQ3a699ujUrPLjUJ9OPm268?=
 =?us-ascii?Q?AlqMjvTx2dwZVIyOSzp+PSjJEUJUi3T6aKZQOEsJUkna12Br5uV3GUW4CNtE?=
 =?us-ascii?Q?XrFMZbPlPe8lcHGfuPQax7XZTo3vwUgh3wYgA7AbGeCiYLiAHTjXp/qlmMdN?=
 =?us-ascii?Q?qk4a0S8QJCkDoCqb80jjKTJC+pWwzQjB0Uh9OTN5VcnOCyUdE439x+DYX9xr?=
 =?us-ascii?Q?eBYiI//SU7uyj3XjU2ynPUpNhkOLstPo3RRAjZDgqGD8fNUWMAUbHJ1jk+sP?=
 =?us-ascii?Q?BALDBkzpZHGcBUiASF0BCwJag64jyKGahgFARmYHqg5F0JXMOxCleoOGmWbW?=
 =?us-ascii?Q?ilU85MNcn4C1SI/AuvHbSJ4+MCkN8qMpVcg6IfO0PbYKLe6auru1iRuU7JmI?=
 =?us-ascii?Q?lYkT8QliEC4aiH9WkSRlLoEZxIjQh0CM8zFSNTvpq9aOwzm6W2DUEUTRPg70?=
 =?us-ascii?Q?yYYLNB4/L96QWGfd2Mpx0xoUJ6PGJTXzOIFL5E3xhEJzJPkbS/0XRtX5FEBZ?=
 =?us-ascii?Q?MGbY55qi530VTkb4f8fvIw1mxciKwaMkgN3rugn8xCjUF/iwVOq/ZZIrx2TU?=
 =?us-ascii?Q?DYJa5z0tE2LOuO8TvvAQlvtvRDvLS9iuKHecQKmnH7Bw33CZZ4DchpPppCOA?=
 =?us-ascii?Q?VkY3H+JqJQ0oW0KO4TNdcmIEqbqSsxPPv5G3f5o5og/wtU521CXNkw+vUp7c?=
 =?us-ascii?Q?My0Dk3ooBqZ9Dm8Y5KfGeI5ZUUoqMVFbM0zcExS1fwJxhM/0xwjkfqPbusEP?=
 =?us-ascii?Q?zwMbAb6Xriac0Kt+gsOX7A9lDgZ0iMf8K9nzhEXMiGnwursmEwvwnlQ+3Kjs?=
 =?us-ascii?Q?gJWIYfYNN2sZq0WbILXhXdGYymx/CABhpyWXSB63U6i/37j+ANAxE6RGGdo0?=
 =?us-ascii?Q?wt0uJbRgxbaVj3CPKyrMlEqUOhB3Lq3qhkP0a2qcHbrB7EERAXyXFGfXXk3O?=
 =?us-ascii?Q?g/9CK5wDIuderKdHEIohSBNr1u1JqauUQWY8Ch8tY44/zKjtHgAmpM5/ZPUg?=
 =?us-ascii?Q?VZoHraHSc6cbQ+VaImYJn0v9pIXICv4R7bIdtMAnPomF8Ut20spj1Zf8/gq5?=
 =?us-ascii?Q?6ZqhRNxJdPgTp+VSsOq9F8a2pJvuj+iQG3mz/CyC?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33711c29-2777-4c24-c060-08da979c353f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 04:30:39.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnwP6XRTykMs78ue/5OYAu8f9A1hBXGQN3tqUWm/UT6GBSI05xt2Mp523NSlcIeHmkkd2d9QQkADNdY5iBy60w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7210
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
Changes in v2:
 - Created new iqs7222_parse_reg_grp() and iqs7222_parse_event() helpers
   to prevent multiple goto statements and calls to fwnode_handle_put()
 - Updated commit message

 drivers/input/misc/iqs7222.c | 326 ++++++++++++++++-------------------
 1 file changed, 149 insertions(+), 177 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index ddb863bf63ee..d39b3fdfb849 100644
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
 
@@ -1699,15 +1715,12 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
 	 * channels to cycles is fixed. Properties defined for a cycle impact
 	 * both channels tied to the cycle.
 	 */
-	error = iqs7222_parse_props(iqs7222, &cycle_node, cycle_index,
+	error = iqs7222_parse_props(iqs7222, cycle_node, cycle_index,
 				    IQS7222_REG_GRP_CYCLE,
 				    IQS7222_REG_KEY_NONE);
 	if (error)
 		return error;
 
-	if (!cycle_node)
-		return 0;
-
 	/*
 	 * Unlike channels which are restricted to a select range of CRx pins
 	 * based on channel number, any cycle can claim any of the device's 9
@@ -1750,11 +1763,11 @@ static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
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
@@ -1762,15 +1775,12 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 	u16 *sys_setup = iqs7222->sys_setup;
 	unsigned int val;
 
-	error = iqs7222_parse_props(iqs7222, &chan_node, chan_index,
+	error = iqs7222_parse_props(iqs7222, chan_node, chan_index,
 				    IQS7222_REG_GRP_CHAN,
 				    IQS7222_REG_KEY_NONE);
 	if (error)
 		return error;
 
-	if (!chan_node)
-		return 0;
-
 	if (dev_desc->allow_offset &&
 	    fwnode_property_present(chan_node, "azoteq,ulp-allow"))
 		sys_setup[dev_desc->allow_offset] &= ~BIT(chan_index);
@@ -1892,18 +1902,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
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
@@ -1919,7 +1917,8 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
 			if (val > U8_MAX * 500) {
 				dev_err(&client->dev,
 					"Invalid %s press timeout: %u\n",
-					fwnode_get_name(chan_node), val);
+					fwnode_get_name(event_node), val);
+				fwnode_handle_put(event_node);
 				return -EINVAL;
 			}
 
@@ -1927,49 +1926,16 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
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
@@ -1981,16 +1947,16 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
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
@@ -1998,15 +1964,12 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	u16 *sldr_setup = iqs7222->sldr_setup[sldr_index];
 	unsigned int chan_sel[4], val;
 
-	error = iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
+	error = iqs7222_parse_props(iqs7222, sldr_node, sldr_index,
 				    IQS7222_REG_GRP_SLDR,
 				    IQS7222_REG_KEY_NONE);
 	if (error)
 		return error;
 
-	if (!sldr_node)
-		return 0;
-
 	/*
 	 * Each slider can be spread across 3 to 4 channels. It is possible to
 	 * select only 2 channels, but doing so prevents the slider from using
@@ -2130,46 +2093,37 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
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
 
@@ -2190,19 +2144,64 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
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
+	if (iqs7222_parse_extra[reg_grp])
+		error = iqs7222_parse_extra[reg_grp](iqs7222, reg_grp_node,
+						     reg_grp_index);
+	else
+		error = iqs7222_parse_props(iqs7222, reg_grp_node,
+					    reg_grp_index,
+					    reg_grp, IQS7222_REG_KEY_NONE);
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
@@ -2210,32 +2209,13 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
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
 
@@ -2258,29 +2238,21 @@ static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
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

