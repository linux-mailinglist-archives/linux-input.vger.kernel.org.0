Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38BCA65C523
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 18:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjACRd5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 12:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238717AbjACRdh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 12:33:37 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC0DF5BE
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 09:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ot624scoTyEFU/c45J9xNTq4X5pEmqPpIAWgimb3x/0k4qaH406xrofhDYo77Y7+Ayih2VFHf8VAhg1rly6JR6W7tNYJvfO+7J5v/z4XihJWODp25VGHgDEavsTeuXAgXBNt7rIh2W2kjxvwYDRp0M19a4F0EPJ6I+Z1R8qqWtvSSOfO5u6oRNR/qDWh54B8/NRVRUW/gNHVLYbdzeBpNrr1hxepGWH3o1cZcVHiKNl9surq13Km4y1DrIRrsqNIdczZ4NkAx1DVzlovsc5TNetW6OzYVpB0NXjDQVb06Kx8usz38zUVKBUIKOO6NXLKBGib4/Ya8VKBtsTWuc+nNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoUJKXk7lET9gPk6nmIIlJd3HxMOG2RM99mLSQ1pV70=;
 b=hjwhVjR55CLNWTxwwzWpmgcWb7PgoCQC8SetGIKnjP58WkOFXy2n7Zd7bkRa52OB7PtYzaheamuKdiyx5+ItkJ0kbKR0BBAmEBlEZ7wx7nOKTy43Ge5u4Q7XBqhuUFjdGpcC3+8Wvh4gOoUdFQRTH13BI2Xq4RhUsqHFpXVnPG6RZxJvYJLdWuk/QbThRXXuvmeGOjJZaib12YrNAhxH7Ejkc85HkJ6nugkHHpytHQYcJVW3Ufe22x+UKdBlMdq9MCe5nCjO1Xh3uxXAK8khSAR1MALl+ciz9fI0qkBH1gAaL1s+65krYM29fKpGA0Y5Uj1fPLHBy4Ug2mGrlt3BEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoUJKXk7lET9gPk6nmIIlJd3HxMOG2RM99mLSQ1pV70=;
 b=oS/sWgzqPrBJ/NBbRTKdbaBfzEIaiKk6/d8D5ofQkDaoXzyTtlXjdWOY2IS7KupEyvmPOz10wD3+YhGDzUkq49TjNJwXvIyDhkFzenx4cMIJtePsyUmeEQe1TZJzd1XnqJfqciHnAoBMf5/llcliPiHnxk55ddwlYD9KtBxBSZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM4PR08MB8652.namprd08.prod.outlook.com
 (2603:10b6:8:180::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 17:33:32 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 17:33:32 +0000
Date:   Tue, 3 Jan 2023 11:33:23 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH] Input: iqs626a - drop unused device node references
Message-ID: <Y7Rm40a+rrwxTIOD@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SN6PR01CA0008.prod.exchangelabs.com (2603:10b6:805:b6::21)
 To SN4PR0801MB3774.namprd08.prod.outlook.com (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM4PR08MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 733e6171-97e8-4e91-efac-08daedb0a239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XIz1bhBRT/5Q5suuDjkacKxRJJJgZpFQesdOWYDFxwfcMnjcaW4tbae2MUVBsaK4FlA3L4x2lIWV6xvb/w7oRPTf5ZB2OiInv26mI5ScmkQXHRn2HldBghgzXqWVu5/lPwnkHLVKROyqYBtEbX9xsXQOewBFkJxFSh+vjI79lHGUNeRN8CbIZqiKHLw21phQnytFWRVBGxNO+X1OoOIKRxiTF64CSbVAMD/qhago+XtiWTIWVDkq/x2Cf5xHWn/mtl8ZH9yqipqt30Ckm4BPiaItpv1EIvMM1Xi9RqdoJh8aUbQ5+0JgMvUDhI5ig9gfMDIRU5YTMrwFfrfkXCMc4tprfrsXbN/GFKUiITkA4dSMMOP60V6hol6eBQHWd56A6141K1oCh9Ufu2zajtqrM2KlU4DvcVGaeCGmzzHT9h4MMf08C5JRDEdSsriclZEfkE9Hm/5IAyty0GcKMn0FTOWEmA+P2lSCHdJo2J3V9Ip0zeQA5GiS2EnfbeMBnjZIwNFN6f76vW/XMOSTaxK1mpqsTgljVY/Pm5o+DYo5avqaDmmjORlntkGXUfp6BW2wHqANYHD3Qs6Pm+zUEoPHDY8QSmTpXvzp/KEcAJ8IrCdZBc0us7usy7Yg0IPIXCi2OfsBdFceCU/coE/n6LlQUTjKps9I3qx3xVqYlbS4EauYjYXr5KJF5WeMgaEwKNNYKDLnhTf24kPYo2XmvanO0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(376002)(346002)(39830400003)(396003)(136003)(451199015)(5660300002)(2906002)(8936002)(4326008)(41300700001)(66476007)(6486002)(316002)(66556008)(66946007)(6916009)(478600001)(8676002)(33716001)(186003)(26005)(9686003)(6512007)(107886003)(83380400001)(6506007)(6666004)(38100700002)(86362001)(22166006)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jfU3JnJCXIwB1OF4HJJC5RPRPbno40yAUxQnq6/d1XgGMNn1wAkLDvSGrFTD?=
 =?us-ascii?Q?MrpSmj2nDqibbsV49FOLlZty+QGcbvlEURNwenV6Hfe75F5ftaj9YP4tYfvd?=
 =?us-ascii?Q?V9UPVSc4LHfi8jlDJOcs7gPxnutCBSW5K7CwZjZFzI1FWIZNbcEeIFZivCLr?=
 =?us-ascii?Q?PVLIjORcrVEpnCqLSzIguhLav3UZTowa8tw+wovsZjGr2WS8RvoOuemyHfVT?=
 =?us-ascii?Q?vPimFiIUV9OAGsu/feDu1IZzhQcZhc5zpWLOj2fwUl78wldoEuhCuEqY6Ham?=
 =?us-ascii?Q?+RRXtADNmjUyzMlkLa7+PYFxPsmjoMLuKARPflSHzeM3bGWmHX1HKngglIhR?=
 =?us-ascii?Q?x+PpW5okRET5Cs64QeX8YlgljjACDAm92dn+Z9MKGm6N3JIFj/bcQMEyEW1d?=
 =?us-ascii?Q?dOomM/KfYB2ydjrTcdA4P7fZSd8qFeXHsNgUP/jB9FT68oaSKkfsc6SRhWUq?=
 =?us-ascii?Q?rmdybKnSE4oHEKZdpAbWcWs55OBBc86WZ7ZAW2Gbrzia+gB7fiOupfIEqkLD?=
 =?us-ascii?Q?5/oCW7tjDSdpicuuLP6AJGePGGJCQTBkTHpY2vhIRNnvUBuoNdjEnIS4ASPe?=
 =?us-ascii?Q?Ws0flMsvgEtKrd+w2A284zwNLB2/qX9tp09+sxUXBpGt0/vVqv7ZzREuQm6g?=
 =?us-ascii?Q?VLtJLnhDoWVkX+QNbM46LYiPSUMFV8eKowUUMY9wuSAEtsQ9gRPLHhYlYdpd?=
 =?us-ascii?Q?dWdknPod1NTNSM2sX/7dRDFXd/x36VAn5Uerh3Dq/wfJS/uZvqjYLSYfruEC?=
 =?us-ascii?Q?saWst4aLYbhwZoEaCigntCJEKrDQwNmqkFaN6cBZa7A/5NkYmUn3rMAecVS2?=
 =?us-ascii?Q?mJd0hca42p8tgn4H0tC9VqVz33HPLoWOPw/xXt7HLjuZt2w0tZ7nrRDPmcWn?=
 =?us-ascii?Q?NXTUhq2/GoEaW1g2QEY+OeaFFebaHebdyQ1AlHVwvFghUQ29OeIkW/LCt52V?=
 =?us-ascii?Q?PK/If79nrc5x0pVuM68dmFCqmb1PND3AE2qfiYKFmKU4X4hnVw7v3I0MuCPX?=
 =?us-ascii?Q?gN9RnbxpOdzAAv/BHDMGCe/Lvh/oJi4foc9SZUAyOFeXKAuL9u3uXKjn9NZl?=
 =?us-ascii?Q?fY1DMEsJdqo+4T2e4btfF257MBsO72LGZs0kYmHvfLQquL7f+BRYV8nlP3pQ?=
 =?us-ascii?Q?KlT+TSNM1lJhERxdOLOK3ZW3/MWqSoXxMQ0vMURRqKDUkv3Fl8XkAVRMrJyh?=
 =?us-ascii?Q?2lwANjehKjAXSR0EPJeYkHl3Kex81/llX4xiYgQjEUJ+vK9d8nUY01hKROIW?=
 =?us-ascii?Q?N44XvcEs8aZI6iCN2mhzw7vCUDPJwUrGn1PRpIA+r6gup1U1pH9MXWdSz+K+?=
 =?us-ascii?Q?hvBIElXfY1EL6qlgO6gIBXWZB5Dt+hfr0OUahJ11A/U5KZ2sdxauq5BU/7dp?=
 =?us-ascii?Q?2XyKgLzEC6sQ50gRmsujCAtS9O441vL7OBAIyi7pnh4bOVdhrbHgSRNNRJIR?=
 =?us-ascii?Q?r+uSFLaqPBk9F+jA+r7BMVx5f3KjHEIoC3FXV0Nd5eGmr8Ffv7tTQ5lh87ui?=
 =?us-ascii?Q?9ine4v4AjtcTKWBTOCR61vy3sI3ybsMiy9nubVIRhN/xLgIboXsOoBjMW2sG?=
 =?us-ascii?Q?IOlaNuUO8QpKz1qJY4/Ngk2Xk0f+9K+0mOswRY4w?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733e6171-97e8-4e91-efac-08daedb0a239
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 17:33:32.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tTrf/pEhbFjHNepEZgvS9ba2TcP8L90mP9o6hbdDRYhdtFblOSyNR+V4zfXPBRfit0DtbWvH2KfW7BnxAVKoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR08MB8652
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

To facilitate this change, the logic that parses event thresholds
is collapsed in order to limit the number of locations from which
fwnode_handle_put() must be called.

Fixes: f1d2809de97a ("Input: Add support for Azoteq IQS626A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs626a.c | 87 +++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 45 deletions(-)

diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index 23b5dd9552dc..060efb75f8cf 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -458,12 +458,11 @@ struct iqs626_private {
 
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
 	unsigned int thresh_tp[IQS626_NUM_CH_TP_3];
@@ -509,7 +508,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 			 * Trackpad touch events are simply described under the
 			 * trackpad child node.
 			 */
-			ev_node = ch_node;
+			ev_node = fwnode_handle_get(ch_node);
 		} else {
 			ev_name = iqs626_events[i].name;
 			ev_node = fwnode_get_named_child_node(ch_node, ev_name);
@@ -533,6 +532,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 					dev_err(&client->dev,
 						"Invalid input type: %u\n",
 						val);
+					fwnode_handle_put(ev_node);
 					return -EINVAL;
 				}
 
@@ -547,6 +547,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 				dev_err(&client->dev,
 					"Invalid %s channel hysteresis: %u\n",
 					fwnode_get_name(ch_node), val);
+				fwnode_handle_put(ev_node);
 				return -EINVAL;
 			}
 
@@ -561,29 +562,12 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 			}
 		}
 
-		if (ch_id != IQS626_CH_TP_2 && ch_id != IQS626_CH_TP_3 &&
-		    !fwnode_property_read_u32(ev_node, "azoteq,thresh", &val)) {
-			if (val > IQS626_CHx_THRESH_MAX) {
-				dev_err(&client->dev,
-					"Invalid %s channel threshold: %u\n",
-					fwnode_get_name(ch_node), val);
-				return -EINVAL;
-			}
-
-			if (ch_id == IQS626_CH_HALL)
-				*thresh = val;
-			else
-				*(thresh + iqs626_events[i].th_offs) = val;
-
-			continue;
-		}
-
-		if (!fwnode_property_present(ev_node, "azoteq,thresh"))
-			continue;
-
 		error = fwnode_property_read_u32_array(ev_node, "azoteq,thresh",
 						       thresh_tp, num_ch);
-		if (error) {
+		fwnode_handle_put(ev_node);
+		if (error == -EINVAL) {
+			continue;
+		} else if (error) {
 			dev_err(&client->dev,
 				"Failed to read %s channel thresholds: %d\n",
 				fwnode_get_name(ch_node), error);
@@ -598,6 +582,20 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 				return -EINVAL;
 			}
 
+			switch (ch_id) {
+			case IQS626_CH_TP_2:
+			case IQS626_CH_TP_3:
+				break;
+
+			case IQS626_CH_HALL:
+				*thresh = thresh_tp[j];
+				continue;
+
+			default:
+				thresh[iqs626_events[i].th_offs] = thresh_tp[j];
+				continue;
+			}
+
 			sys_reg->tp_grp_reg.ch_reg_tp[j].thresh = thresh_tp[j];
 		}
 	}
@@ -607,8 +605,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
 
 static noinline_for_stack int
 iqs626_parse_ati_target(struct iqs626_private *iqs626,
-			const struct fwnode_handle *ch_node,
-			enum iqs626_ch_id ch_id)
+			struct fwnode_handle *ch_node, enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
@@ -716,7 +713,7 @@ iqs626_parse_ati_target(struct iqs626_private *iqs626,
 }
 
 static int iqs626_parse_pins(struct iqs626_private *iqs626,
-			     const struct fwnode_handle *ch_node,
+			     struct fwnode_handle *ch_node,
 			     const char *propname, u8 *enable)
 {
 	struct i2c_client *client = iqs626->client;
@@ -764,7 +761,7 @@ static int iqs626_parse_pins(struct iqs626_private *iqs626,
 }
 
 static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
-				 const struct fwnode_handle *ch_node)
+				 struct fwnode_handle *ch_node)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
@@ -889,8 +886,7 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 
 static noinline_for_stack int
 iqs626_parse_channel(struct iqs626_private *iqs626,
-		     const struct fwnode_handle *ch_node,
-		     enum iqs626_ch_id ch_id)
+		     struct fwnode_handle *ch_node, enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
@@ -924,6 +920,20 @@ iqs626_parse_channel(struct iqs626_private *iqs626,
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
@@ -1378,23 +1388,10 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
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

