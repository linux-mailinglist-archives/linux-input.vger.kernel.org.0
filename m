Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC6C67F11C
	for <lists+linux-input@lfdr.de>; Fri, 27 Jan 2023 23:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbjA0W3t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Jan 2023 17:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjA0W3s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Jan 2023 17:29:48 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112E0875B4;
        Fri, 27 Jan 2023 14:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxGyrnOMhCrfSTQPNWJGi9OAodpJRR8/0C9QWLHb2EzrMG/SGHWiZp/nH9RdguLI/xls2Ou8NdNzlksXRWygc2NBHzT2ijm7yICa901Arj9p1FEj0AxZOneuzVI/CpDk+PFB8sKMsz4zWupmU3pA94G6vnnhW3qM4IxMJlBZ5iWwMzEHlHVWbrbwRJtJpPJrYY0MKT49wECerBfJukAP3Is6E4iM5kmzQXNdHmbdEPeJly2KEixyp2FccJzuTggPrOa4hzP+kTy56sHoI9TeD1j4ADv1RDCnMnQiS9001QN8Q8jQJiYNzaANnKpDarA3Raly4PemFHObk+Yegljj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LejxnPxe7XllnW67AYJ9WUcojnteLxW+1eVaRNVM+w4=;
 b=M2VVNVIycO5joGq9DwdrZvS4vUOeQhsdVQmN9IEmm3YiWwEHzY4Kck6Lx0v8uuFmsho3z5GqpXR9QxGR7omK/euMRj0ebs8CeFDhbglt9Zc1Uc1wKrCds+imsLy6429iHvsnUNaCRdTPqzFjOpYbWv8QKl73lT4cMyqoC8ng114ffPOeYrXyd/t1NilaR0TedCU5L2HnKD0o12ucFpITnXhQcsQZdHRn2K3dklSEYNXlO6jUwu/16irZtG4Iu05nR2mgPy11tRGAO+vDh5olK71lq7DbkT7Bc5WfCAV/PtGSlL9CJiYrZzF5gzgNaYQN1UqbUslEeOp+P92MAaQb/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LejxnPxe7XllnW67AYJ9WUcojnteLxW+1eVaRNVM+w4=;
 b=o35In0fYS5I2nZ5WGSb64GaDtjTQEOUNNku3X+eXGZPe9S4Z1SlSGL8p5PT2XsT8WdOfmDjDtlYm9VH8IWso+2dOkfY7gLMMO/OkmJ/J0pJ3EWlCJgOfHvD18ToMQw5p5SyxrB7B8+7hCRl+zB/yvm8+Epjgiv4Q8DXt8unCDBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN8PR08MB6257.namprd08.prod.outlook.com
 (2603:10b6:408:d5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 22:29:42 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 22:29:42 +0000
Date:   Fri, 27 Jan 2023 16:29:41 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 1/2] Input: iqs626a - drop unused device node references
Message-ID: <Y9RQVe/V1Hnw1oly@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9RQCQa69f3TaiWf@nixie71>
References: <Y9RQCQa69f3TaiWf@nixie71>
X-ClientProxiedBy: SA9PR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:806:22::16) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BN8PR08MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 566135c3-8f4b-4599-dd99-08db00b5fc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZvkMqkmqnv8BZPFOUafmgsOHkfdimKtLbcqpJsTYYecdlIQY0/kdaOL0jqJFZuOLKi+9sFT7eBS0LWTmA0y0u45VkXPwheR7Ymvm4qQojgxc3cqu9y9im9dVVV7iCw83D8nCl8EoZ9GQrZ3nHmjbv8dx+jqVZ0JfsOH877QMeNvB5XO5GHy473ANubF4UK3TEyHoSycecyychJhorPS97g+/zV3j21F+SK3HfFoEI7dpd50JyESXlEn+CmT8i+EcpCePp4MqfIxyWQ/+kLGKTrnNMifUosD/c9g7PqdutE89f6CnAZTv6/Nc2l9trjHmYzJA7i09Ej4VAXpq8OQ5bUq6BqmGMuT4bEUFdDqciVGTxuCDD6c0hm7nlwP8qeEWQq8mV7drSNU7pusYQ4zV7aZKpLlV97CnalysQTCPfTodgQ4MegntFyOojHc68e5b7Gl9XGkXcAKBA5/9UREf917ESDFHOpWFqW8vvZDpzmfUHQf/UZPuBKNTBHgWxjegdHa9kVr4peAjOVgSLq3pkyhWiC6Tfe0ecj7+BYotAyINuEfjhtCqPVmJXoj/UTjFP52AcDQa6oXI57R+uq3OZ+sdj99GQ/gaTP2dxRgszUH1t4CNT5suUBFcoP2IzGsrun/Ekq9//UPg1t40MBzMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(376002)(39830400003)(366004)(136003)(396003)(451199018)(316002)(38100700002)(41300700001)(8676002)(66476007)(8936002)(66556008)(66946007)(4326008)(86362001)(5660300002)(2906002)(6506007)(26005)(478600001)(9686003)(6512007)(186003)(33716001)(6486002)(107886003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NrLRYY+QuYZjj3MLq+w7j1sIU3kQ/DYtWDLgtBKqTm0LpjodNewCGORZOUNo?=
 =?us-ascii?Q?gotrcb+OCd296XjL50NDlFxA5laPwm1Ppaa23i3DGWzJH/xyRmjW0syJs70q?=
 =?us-ascii?Q?PK/Gox4pZG70w1UbprXwx4EhatyA20GUgK/TQJWQLK+87SN9+UIvNoCgez87?=
 =?us-ascii?Q?9tdnohWEtvfmkAS5pK/Ox3zzcmEvVrw/SoCsq1INBRUd1Vw/zfy9xElLgsTK?=
 =?us-ascii?Q?A/L89GtafHbzl/nD4VjZVO9egD3ZdfF4YHGXazbyytLYUbONHcm7lWvuoq6u?=
 =?us-ascii?Q?NdaoylFcIhUeR+hDaBA1AT0TtMgW7FptGxJZ17xPMfkdCLGScof2iEkmKaDa?=
 =?us-ascii?Q?JsU2E6NPywLZGhJZuOmlhkZrT6ymBe9lVSmzUYoZ/HAG2zNpA8o/URn8dxkq?=
 =?us-ascii?Q?KnWo8yYfNpTOXsj28mfO2L325THf0YcQ0iGnLrtMMPPQa8MyQH94e8k2SEUk?=
 =?us-ascii?Q?v/oPjFoHNutmsIA51z3GLd4u0Osab5fcFVVIaAIsuR3CUKUMD3M3t4bPXouD?=
 =?us-ascii?Q?lGm7fpnjnBzN4+an6ltXYhvcLdg95uxW+1EfIQkF5BRyOR/yvfA3JHAtx+gH?=
 =?us-ascii?Q?NA6HbWhlnhURx2XxPi0jK6pfd2G7NfoN8vO7HSy6o1pEhbn+hN1tQ8gtWwOw?=
 =?us-ascii?Q?SM3cBZpjqjoudZL0UzzE+oyw1XSe4rxcNDLplWRLE04/X63MnynHv51lfUwi?=
 =?us-ascii?Q?Ac8OO1hfeHHD5py2NXAp8T+Quun91qeqYrmJlLxU0OwrDlhSfp1nuoi4ddd9?=
 =?us-ascii?Q?zDWg1MyYo52m50u4sIRJONxsJF9+BSSEOluLFXqD2grFuFcTGoQLxZzoqCN4?=
 =?us-ascii?Q?O1vWFVPqRWpm+wURu3tOlQPBSsF+dX5NC/OVQkVMAK55jpqnzK/+ifxER5LM?=
 =?us-ascii?Q?agXFu7bWX81GwL9DQvlKtRC1bGEIYIKEVeW4qgTn7VPWvPpWUc6X2M93BXs+?=
 =?us-ascii?Q?NhnRvRSlLjNUWHu6PEsH4zueNZFNE50pTi3l1H9F0yomPUcYyiq/qpXJPGHQ?=
 =?us-ascii?Q?nmpV5ps1bCl47rPe0rV+onwCSVJestTo78gffQEzb9ISmcWW7pD1fGGCoZcH?=
 =?us-ascii?Q?60Sqz7UXFPf5no+0o5WU82sosSKItMLbhSKzaeJgXt5xsZkVoP49Og5Luoum?=
 =?us-ascii?Q?wSTiXLqqkdBs2mwm30PMjjs/qgAvMZkrfXN2q6Zs3bemYnOA5Fhux0EOrJDm?=
 =?us-ascii?Q?M9lcB0dx7HZ4UWnOoTOYuZI39Nx0Jn2SuQ8q5swSkTpq1c+sjTGCSoiAQA/v?=
 =?us-ascii?Q?osxpGlUiRD+flkC95SJHj6xO+PmV53cGMMW6XH7SZmNAeAqtAXW2LKX7Pkx+?=
 =?us-ascii?Q?Erv+6iQZAJ+bjagWMeXACfTwJBdzm50GJTmprvS0s5VEE0p3q4b1YazHmNp8?=
 =?us-ascii?Q?VGrryVT1FRT5gwKTLAfu7MrJh0Fvn8YKSASWUr0RxyuhGzj+ZHUPOCavNJIj?=
 =?us-ascii?Q?SbKnAmcRV8s/dXGwpH1xuQ1OOujBjBv+2qUeQSy6o/b3Rs2vQz7qWSDwj4x8?=
 =?us-ascii?Q?eUfRZSBfqYHAraLAHmnrcVSOCkpohE0VW2EhCMFVp+Hkx72tieNdKuJi8orb?=
 =?us-ascii?Q?5jIboAxCZdzfjvGPolkR9XEQLqvOBa3YeOLsoPvH?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566135c3-8f4b-4599-dd99-08db00b5fc11
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 22:29:42.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwBe2lHnDG6L25dlxmd1U8UZTh8zaGZzBROx2IS7ncCf0PT7xYQcgABeimO3l9rGqMbNwF4F4rpZ0XMZWgsfrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6257
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

Currently, the driver never calls fwnode_handle_put(); this patch
adds the missing calls. Because fwnode_handle_put() does not take
a const *fwnode_handle, the const qualifier is removed across all
corresponding *fwnode_handle instances.

As part of this change, trackpad channel touch thresholds and ATI
base values are now specified under single trackpad channel child
nodes. This enhancement moves both properties to scalar values as
opposed to arrays, making their types consistent across bindings.

Fixes: f1d2809de97a ("Input: Add support for Azoteq IQS626A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Added support for trackpad channel child nodes and removed logic that
   parsed former trackpad touch threshold and ATI base arrays

 drivers/input/misc/iqs626a.c | 156 ++++++++++++++++-------------------
 1 file changed, 73 insertions(+), 83 deletions(-)

diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index 4727e6b95e41..90f997a905b5 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -458,18 +458,15 @@ struct iqs626_private {
 
 static noinline_for_stack int
 iqs626_parse_events(struct iqs626_private *iqs626,
-		    const struct fwnode_handle *ch_node,
-		    enum iqs626_ch_id ch_id)
+		    struct fwnode_handle *ch_node, enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
-	const struct fwnode_handle *ev_node;
+	struct fwnode_handle *ev_node;
 	const char *ev_name;
 	u8 *thresh, *hyst;
-	unsigned int thresh_tp[IQS626_NUM_CH_TP_3];
 	unsigned int val;
-	int num_ch = iqs626_channels[ch_id].num_ch;
-	int error, i, j;
+	int i;
 
 	switch (ch_id) {
 	case IQS626_CH_ULP_0:
@@ -509,7 +506,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 			 * Trackpad touch events are simply described under the
 			 * trackpad child node.
 			 */
-			ev_node = ch_node;
+			ev_node = fwnode_handle_get(ch_node);
 		} else {
 			ev_name = iqs626_events[i].name;
 			ev_node = fwnode_get_named_child_node(ch_node, ev_name);
@@ -533,6 +530,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 					dev_err(&client->dev,
 						"Invalid input type: %u\n",
 						val);
+					fwnode_handle_put(ev_node);
 					return -EINVAL;
 				}
 
@@ -547,6 +545,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 				dev_err(&client->dev,
 					"Invalid %s channel hysteresis: %u\n",
 					fwnode_get_name(ch_node), val);
+				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -567,6 +566,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 				dev_err(&client->dev,
 					"Invalid %s channel threshold: %u\n",
 					fwnode_get_name(ch_node), val);
+				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -574,32 +574,9 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 				*thresh = val;
 			else
 				*(thresh + iqs626_events[i].th_offs) = val;
-
-			continue;
-		}
-
-		if (!fwnode_property_present(ev_node, "azoteq,thresh"))
-			continue;
-
-		error = fwnode_property_read_u32_array(ev_node, "azoteq,thresh",
-						       thresh_tp, num_ch);
-		if (error) {
-			dev_err(&client->dev,
-				"Failed to read %s channel thresholds: %d\n",
-				fwnode_get_name(ch_node), error);
-			return error;
 		}
 
-		for (j = 0; j < num_ch; j++) {
-			if (thresh_tp[j] > IQS626_CHx_THRESH_MAX) {
-				dev_err(&client->dev,
-					"Invalid %s channel threshold: %u\n",
-					fwnode_get_name(ch_node), thresh_tp[j]);
-				return -EINVAL;
-			}
-
-			sys_reg->tp_grp_reg.ch_reg_tp[j].thresh = thresh_tp[j];
-		}
+		fwnode_handle_put(ev_node);
 	}
 
 	return 0;
@@ -607,16 +584,13 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 
 static noinline_for_stack int
 iqs626_parse_ati_target(struct iqs626_private *iqs626,
-			const struct fwnode_handle *ch_node,
-			enum iqs626_ch_id ch_id)
+			struct fwnode_handle *ch_node, enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
-	unsigned int ati_base[IQS626_NUM_CH_TP_3];
 	unsigned int val;
 	u8 *ati_target;
-	int num_ch = iqs626_channels[ch_id].num_ch;
-	int error, i;
+	int i;
 
 	switch (ch_id) {
 	case IQS626_CH_ULP_0:
@@ -683,40 +657,13 @@ iqs626_parse_ati_target(struct iqs626_private *iqs626,
 
 		*ati_target &= ~IQS626_CHx_ATI_BASE_MASK;
 		*ati_target |= val;
-
-		return 0;
-	}
-
-	if (!fwnode_property_present(ch_node, "azoteq,ati-base"))
-		return 0;
-
-	error = fwnode_property_read_u32_array(ch_node, "azoteq,ati-base",
-					       ati_base, num_ch);
-	if (error) {
-		dev_err(&client->dev,
-			"Failed to read %s channel ATI bases: %d\n",
-			fwnode_get_name(ch_node), error);
-		return error;
-	}
-
-	for (i = 0; i < num_ch; i++) {
-		if (ati_base[i] < IQS626_TPx_ATI_BASE_MIN ||
-		    ati_base[i] > IQS626_TPx_ATI_BASE_MAX) {
-			dev_err(&client->dev,
-				"Invalid %s channel ATI base: %u\n",
-				fwnode_get_name(ch_node), ati_base[i]);
-			return -EINVAL;
-		}
-
-		ati_base[i] -= IQS626_TPx_ATI_BASE_MIN;
-		sys_reg->tp_grp_reg.ch_reg_tp[i].ati_base = ati_base[i];
 	}
 
 	return 0;
 }
 
 static int iqs626_parse_pins(struct iqs626_private *iqs626,
-			     const struct fwnode_handle *ch_node,
+			     struct fwnode_handle *ch_node,
 			     const char *propname, u8 *enable)
 {
 	struct i2c_client *client = iqs626->client;
@@ -764,13 +711,14 @@ static int iqs626_parse_pins(struct iqs626_private *iqs626,
 }
 
 static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
-				 const struct fwnode_handle *ch_node)
+				 struct fwnode_handle *ch_node,
+				 enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
 	u8 *hyst = &sys_reg->tp_grp_reg.hyst;
+	int error, count, i;
 	unsigned int val;
-	int error, count;
 
 	if (!fwnode_property_read_u32(ch_node, "azoteq,lta-update", &val)) {
 		if (val > IQS626_MISC_A_TPx_LTA_UPDATE_MAX) {
@@ -823,6 +771,48 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 		*hyst |= (val << IQS626_FILT_STR_LP_TPx_SHIFT);
 	}
 
+	for (i = 0; i < iqs626_channels[ch_id].num_ch; i++) {
+		u8 *ati_base = &sys_reg->tp_grp_reg.ch_reg_tp[i].ati_base;
+		u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
+		struct fwnode_handle *tc_node;
+		char tc_name[10];
+
+		snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
+
+		tc_node = fwnode_get_named_child_node(ch_node, tc_name);
+		if (!tc_node)
+			continue;
+
+		if (!fwnode_property_read_u32(tc_node, "azoteq,ati-base",
+					      &val)) {
+			if (val < IQS626_TPx_ATI_BASE_MIN ||
+			    val > IQS626_TPx_ATI_BASE_MAX) {
+				dev_err(&client->dev,
+					"Invalid %s %s ATI base: %u\n",
+					fwnode_get_name(ch_node), tc_name, val);
+				fwnode_handle_put(tc_node);
+				return -EINVAL;
+			}
+
+			*ati_base = val - IQS626_TPx_ATI_BASE_MIN;
+		}
+
+		if (!fwnode_property_read_u32(tc_node, "azoteq,thresh",
+					      &val)) {
+			if (val > IQS626_CHx_THRESH_MAX) {
+				dev_err(&client->dev,
+					"Invalid %s %s threshold: %u\n",
+					fwnode_get_name(ch_node), tc_name, val);
+				fwnode_handle_put(tc_node);
+				return -EINVAL;
+			}
+
+			*thresh = val;
+		}
+
+		fwnode_handle_put(tc_node);
+	}
+
 	if (!fwnode_property_present(ch_node, "linux,keycodes"))
 		return 0;
 
@@ -889,8 +879,7 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 
 static noinline_for_stack int
 iqs626_parse_channel(struct iqs626_private *iqs626,
-		     const struct fwnode_handle *ch_node,
-		     enum iqs626_ch_id ch_id)
+		     struct fwnode_handle *ch_node, enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
@@ -924,6 +913,20 @@ iqs626_parse_channel(struct iqs626_private *iqs626,
 		return -EINVAL;
 	}
 
+	error = iqs626_parse_ati_target(iqs626, ch_node, ch_id);
+	if (error)
+		return error;
+
+	error = iqs626_parse_events(iqs626, ch_node, ch_id);
+	if (error)
+		return error;
+
+	if (!fwnode_property_present(ch_node, "azoteq,ati-exclude"))
+		sys_reg->redo_ati |= iqs626_channels[ch_id].active;
+
+	if (!fwnode_property_present(ch_node, "azoteq,reseed-disable"))
+		sys_reg->reseed |= iqs626_channels[ch_id].active;
+
 	*engine |= IQS626_CHx_ENG_0_MEAS_CAP_SIZE;
 	if (fwnode_property_present(ch_node, "azoteq,meas-cap-decrease"))
 		*engine &= ~IQS626_CHx_ENG_0_MEAS_CAP_SIZE;
@@ -1057,7 +1060,7 @@ iqs626_parse_channel(struct iqs626_private *iqs626,
 		*(engine + 1) |= IQS626_CHx_ENG_1_ATI_BAND_TIGHTEN;
 
 	if (ch_id == IQS626_CH_TP_2 || ch_id == IQS626_CH_TP_3)
-		return iqs626_parse_trackpad(iqs626, ch_node);
+		return iqs626_parse_trackpad(iqs626, ch_node, ch_id);
 
 	if (ch_id == IQS626_CH_ULP_0) {
 		sys_reg->ch_reg_ulp.hyst &= ~IQS626_ULP_PROJ_ENABLE;
@@ -1378,23 +1381,10 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
 			continue;
 
 		error = iqs626_parse_channel(iqs626, ch_node, i);
+		fwnode_handle_put(ch_node);
 		if (error)
 			return error;
 
-		error = iqs626_parse_ati_target(iqs626, ch_node, i);
-		if (error)
-			return error;
-
-		error = iqs626_parse_events(iqs626, ch_node, i);
-		if (error)
-			return error;
-
-		if (!fwnode_property_present(ch_node, "azoteq,ati-exclude"))
-			sys_reg->redo_ati |= iqs626_channels[i].active;
-
-		if (!fwnode_property_present(ch_node, "azoteq,reseed-disable"))
-			sys_reg->reseed |= iqs626_channels[i].active;
-
 		sys_reg->active |= iqs626_channels[i].active;
 	}
 
-- 
2.34.1

