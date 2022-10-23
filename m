Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E87E609097
	for <lists+linux-input@lfdr.de>; Sun, 23 Oct 2022 02:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiJWA4m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 20:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiJWA4m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 20:56:42 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AE56FC48;
        Sat, 22 Oct 2022 17:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asDnbDMxVf3yEp59TALqztvGuoDQF6yMeFdJzcBtautpYW6obQ+hPshUHOUCoP5sCdMlFSu0cWt7cHHiA2vbbcyVAqRgXej5TLI3wvJr/oW85hJsduWzc1jf+0f+4JKSTG6eRVAf5UpXuAFWqbRBZti8I+wYbUY0fWHBPrj5v/l2wjvbVQlxysMfcAfXC7zHlEVHJ52BZ+7eNxhcg/yDm/mCH8jvANFiyT0Qtqs5XRBwcwqjoSLMxXJhfo25m6qTavSr0JaHXDc17G/Z6gBhaAW3OzJpMSnMgoIuNosx5Tx2NSdfsUmM2g1bLCkevABgUJaRfC1C7+VK/3rA/G9U3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlqgKOB8aNVo5fNMNN74kblYaAtlgWRCsTRYWo6EN6A=;
 b=MsfHrzhOBZwgCKQFzVMYaihq+gyH4wATvvU19RnxImJbaDuDtpUm1y++yIzaTA7lL1VFP9qeNfTmacjNbnklnovTmZ9MQjYCFQgvj6QMO3Px1I+VKVrG696nLa/gUuDGGVrzDyuuZp+ds3MXCQRWHFQk6CxiPvEFO+JHT3d93GJIq39ovp03Dd/6Sq0I4/ftvPomcLdRXKRsaCTX+OAL9QxKGpH8Mfu44k1HY4lNJrf+Mpvr+dRdP+GT1l3RMFEeAZYNVs66XL/tXFLq+9gzXGminix7HTRWTuhnth2aGbOODRxBG+h590GqRsBRgtPpdV33xMTx+QtLrhLccPDQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlqgKOB8aNVo5fNMNN74kblYaAtlgWRCsTRYWo6EN6A=;
 b=r7+rE9fE+9J1EHsO8zoj7GDBJZ2yvT4xNaeLYRZn7X4SmUjusl5FSwoEZF+iQKcgjPpBIgwxsLchJiZcj7ai9uanEO/m8yUZPMRH+59Qc3euCNS80e+FDU3csEgn+/kH80yT4mXOtfcvFVzuf9d8K+rLTytKIHd9Bjq2fx3Cuo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4896.namprd08.prod.outlook.com
 (2603:10b6:805:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 00:56:39 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5723.034; Sun, 23 Oct 2022
 00:56:39 +0000
Date:   Sat, 22 Oct 2022 19:56:38 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v3 3/7] Input: iqs7222 - report malformed properties
Message-ID: <Y1SRRrpQXvkETjfm@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: Y1SQ2t6yUvdaIQPG@nixie71
References: Y1SQ2t6yUvdaIQPG@nixie71
X-ClientProxiedBy: SN7PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:806:122::16) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN6PR08MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fb898f-0e37-43a9-4d4a-08dab4917175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LhlWnLHnE5qYlW0RcHbsxsqr89aZc+RvO+ncPy7JAEEv5J8YRtgIyskxJvi/NnkQcAMDW7mt9b4z8O/xyZphd3srrZJFhc7+i+qzURoncTsAmNsHR0hRmkYoIxZ+FyYYcPydqxqetAbD/oNyWaqCLdN2rHTKCpp5KGqlhQdAesr9DAQX81UH8g/TCX0JgeykL/g54i77k3I4igEycxgBdruXs1VQ726W+H7vpPFw9q1rEGBvzLy1Sf16YOPTjXvQq5W5elaKmk4ai7L6tFORFjjEOaeWww+s2ydCYhujkmcIqznTqL8HtwnL4XwgVk97IhlGE6+uHTyhhY19gX69tBLunheIo31t26tkn96lznLNau92PMkD5AItNPQ9+kbEIbVNdIRPsKg/Fo469poRCDK9iHvlK0AHj5+Eo9P71ypz8d45+Ecwv3DoseznK9KyiT6H6+GIFFmhHCq55ipw7kv/tIGwaVHYPjGOm+6+yNgrkOP3yHvcYpZIKHmrijNtdkktkL165HRfy7pwLB0v1nNNi4VM7zTJi9TlXUjTN3HTpBpA0nvthX1svoXR6x7WYOHpEGjPdY8Zq3NpRIIkauwX+Hdyo8LV2Q6UVCvmhjkD6dE6JvAkGW8K4X5wrL9p9D7z1a9SBz0P/bTsBs0ZMf+jo2DIAXxkk0mZmB+kpK+q9erTBrlO1bmaXHbnP0u3VBgvh4CIu1XZedYFXe1kGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(346002)(39830400003)(366004)(451199015)(8936002)(2906002)(38100700002)(186003)(6506007)(6512007)(9686003)(26005)(5660300002)(41300700001)(86362001)(33716001)(83380400001)(478600001)(316002)(6486002)(107886003)(4326008)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GPan9Ks/H2L7F224EFU5+pAI4eCz50Kzvrkxuhfr9Pcny1rW2kc9ESq7sP6Q?=
 =?us-ascii?Q?dyI1etRQyc0mbcpGDpKiKqT4p1guS7D+Dmrd1R6nriwZQ71n/9IdNmu2DQ8O?=
 =?us-ascii?Q?pQ8AHVm/uctCufVCEQQM0B9f9C8z0lYxhtnOhHefckqyBIE2I3Y2NGL2DTK/?=
 =?us-ascii?Q?lYRhQla97oQGFUt9TT5UQXzNyVPmDDNN6gcKe1N7MaLVFqv7OewuPhfILeIp?=
 =?us-ascii?Q?ZiIjYELsu2+2tvDd2tLLfqinWv7YHaKYvWloPQ5m071HQHzB7wscHBOTT6UR?=
 =?us-ascii?Q?h/pl6Cwct6gz1va2e/ChYc+2fMfxhfXRMHz/vSiPVKaz0+NBCOAaVMO9OTDm?=
 =?us-ascii?Q?gQRBe3Ue2fMoBfcW6nlYZOvV4CL6dBkVwUqc1cgR9iocSU4Eccd/K4zRysq8?=
 =?us-ascii?Q?AUX/XR8o+vXpLWguPUt4jnsmK2/fmcsqb17IMrvQ1vMuek4JTNJmtGyjp1cF?=
 =?us-ascii?Q?2rAGvvTF5whElbA6NK5pGCU4mYYccWHJtw5rVQqFRXyWTnNp7iIT5AwkTEHr?=
 =?us-ascii?Q?Wp/SZOx2/TFcbo2/hYHDOlvbxFTozmJBE427+0v1l3km01DYnL009EMPZSeE?=
 =?us-ascii?Q?TttsWICqWsqO9duLiP1lsIQwXbLBdvxXSnA/s5KtQHHnAIRhZuFBuYEbV80p?=
 =?us-ascii?Q?+fhhJXU6WIoqxAe2y0+x9MzjfheyArj6jGB1eGYO07TNTM0TizcxUPlbo3H7?=
 =?us-ascii?Q?jtZD6nx2MNMQJkV2GLBP/gjY5T9nsDpizOdjeHPN/jfuSlZQt1JgGIiGLa4k?=
 =?us-ascii?Q?A3GJs3BNfYY+rbF2Ph0hn7+D3Es0Z1hSFTXltHOdQkoV1nijTikW8zG5q8hM?=
 =?us-ascii?Q?7hB9ZcOBvV/2H2WmqfGCBT1GQr3kcicWKMfRsW0Kzvgf9xPRS2D8wpYBtgdF?=
 =?us-ascii?Q?t7+5bBhCPcio06dHTjlc6yUII05dMWnXEGQQw6/8VKuhzigc19hif4Un1IBF?=
 =?us-ascii?Q?StSG/XqbeTUPZDTk4SvL1SnHv2YK6dYjZDdbtcrk+71PV/BJEzF/kpRUkyM0?=
 =?us-ascii?Q?OZWjBn24T6MmjHga1+IMicnMsq/D699uiBp5XJNQZ4+r7Rw1uKtLEZ9Fawgf?=
 =?us-ascii?Q?uJar7Jgq2CwiK+Ffox7jFobn6NZ8hL6y9FgJgyA4Avpb0PwgtWOcMyIyhHaR?=
 =?us-ascii?Q?Vggt7Z58WM14TQnKIqJwAUT1OyMtMM7dUbRHYVOF5Kyl+90PgDUWBev2eX7j?=
 =?us-ascii?Q?R9wzZgTuJfHGvL5aKh/53Qyx0Shq1kcqXAAJLH3PRAjpdUkhJpeppd7zHQUy?=
 =?us-ascii?Q?O5AJhtBFmIWv7fj/b0yLAjZTP8EJad09TEeyOoaCW2r5yh/AbteiMvtwSI9a?=
 =?us-ascii?Q?M+OG3JAHSANpx2tD1EW8pYikA9kjFEES90+c13suMulDus+qkwiWGtB09W1p?=
 =?us-ascii?Q?zQESSx4k87kCvj5kFmk48VdRKrOtqm0cbtKST1wOfzBt9oLLTdRZErjx4IPE?=
 =?us-ascii?Q?hz9TN4CCVGcWiBJDJVRC6Xbrtp2zSMiTec4UlfEi0FgrjpvKYSsN8/xOZm2f?=
 =?us-ascii?Q?gByA86jLmRMhkEU18raFGYTbR2wCJQtqXUBpCeqnOaRj8VVSs00MCwaKyCcp?=
 =?us-ascii?Q?q7XXwV5RTB6HoXv7tZWN03Yz9eo2lHgWbH1+wkEN?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fb898f-0e37-43a9-4d4a-08dab4917175
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 00:56:39.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoJelbemc1gnKpHiPTF4WYtqDdNHzbMkG5rVHdMEaXFs1vrTqnIrqTi+9ZBlBVyBK93422xP2BxKTMkP2L2gog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4896
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Nonzero return values of several calls to fwnode_property_read_u32()
are silently ignored, leaving no way to know the properties were not
applied in the event of an error.

Solve this problem by evaluating fwnode_property_read_u32()'s return
value, and reporting an error for any nonzero return value not equal
to -EINVAL which indicates the property was absent altogether.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changes in v3:
 - Added missing call to fwnode_handle_put()
 - Added Reviewed-by

Changes in v2:
 - Used -EINVAL returned by fwnode_property_read_u32() to indicate an absent
   optional property as opposed to calling fwnode_property_present()
 - Updated commit message

 drivers/input/misc/iqs7222.c | 44 +++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index ca02fea9be59..a5c08b1d9c9b 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1807,8 +1807,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
 		chan_setup[4] = val * 42 + 1048;
 
-		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
-					      &val)) {
+		error = fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
+						 &val);
+		if (!error) {
 			if (val > U16_MAX) {
 				dev_err(&client->dev,
 					"Invalid %s reference weight: %u\n",
@@ -1817,6 +1818,11 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 			}
 
 			chan_setup[5] = val;
+		} else if (error != -EINVAL) {
+			dev_err(&client->dev,
+				"Failed to read %s reference weight: %d\n",
+				fwnode_get_name(chan_node), error);
+			return error;
 		}
 
 		/*
@@ -1889,9 +1895,10 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 		if (!event_node)
 			continue;
 
-		if (!fwnode_property_read_u32(event_node,
-					      "azoteq,timeout-press-ms",
-					      &val)) {
+		error = fwnode_property_read_u32(event_node,
+						 "azoteq,timeout-press-ms",
+						 &val);
+		if (!error) {
 			/*
 			 * The IQS7222B employs a global pair of press timeout
 			 * registers as opposed to channel-specific registers.
@@ -1911,6 +1918,12 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 
 			*setup &= ~(U8_MAX << i * 8);
 			*setup |= (val / 500 << i * 8);
+		} else if (error != -EINVAL) {
+			dev_err(&client->dev,
+				"Failed to read %s press timeout: %d\n",
+				fwnode_get_name(event_node), error);
+			fwnode_handle_put(event_node);
+			return error;
 		}
 
 		error = iqs7222_parse_event(iqs7222, event_node, chan_index,
@@ -2009,7 +2022,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 	if (fwnode_property_present(sldr_node, "azoteq,use-prox"))
 		sldr_setup[4 + reg_offset] -= 2;
 
-	if (!fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val)) {
+	error = fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val);
+	if (!error) {
 		if (!val || val > dev_desc->sldr_res) {
 			dev_err(&client->dev, "Invalid %s size: %u\n",
 				fwnode_get_name(sldr_node), val);
@@ -2023,9 +2037,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 			sldr_setup[2] |= (val / 16 <<
 					  IQS7222_SLDR_SETUP_2_RES_SHIFT);
 		}
+	} else if (error != -EINVAL) {
+		dev_err(&client->dev, "Failed to read %s size: %d\n",
+			fwnode_get_name(sldr_node), error);
+		return error;
 	}
 
-	if (!fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val)) {
+	error = fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val);
+	if (!error) {
 		if (val > (reg_offset ? U16_MAX : U8_MAX * 4)) {
 			dev_err(&client->dev, "Invalid %s top speed: %u\n",
 				fwnode_get_name(sldr_node), val);
@@ -2038,9 +2057,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 			sldr_setup[2] &= ~IQS7222_SLDR_SETUP_2_TOP_SPEED_MASK;
 			sldr_setup[2] |= (val / 4);
 		}
+	} else if (error != -EINVAL) {
+		dev_err(&client->dev, "Failed to read %s top speed: %d\n",
+			fwnode_get_name(sldr_node), error);
+		return error;
 	}
 
-	if (!fwnode_property_read_u32(sldr_node, "linux,axis", &val)) {
+	error = fwnode_property_read_u32(sldr_node, "linux,axis", &val);
+	if (!error) {
 		u16 sldr_max = sldr_setup[3] - 1;
 
 		if (!reg_offset) {
@@ -2054,6 +2078,10 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 
 		input_set_abs_params(iqs7222->keypad, val, 0, sldr_max, 0, 0);
 		iqs7222->sl_axis[sldr_index] = val;
+	} else if (error != -EINVAL) {
+		dev_err(&client->dev, "Failed to read %s axis: %d\n",
+			fwnode_get_name(sldr_node), error);
+		return error;
 	}
 
 	if (dev_desc->wheel_enable) {
-- 
2.34.1

