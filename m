Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F2F5BA5EA
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 06:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiIPEb0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 00:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIPEbZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 00:31:25 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2072.outbound.protection.outlook.com [40.107.96.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759C0558DE;
        Thu, 15 Sep 2022 21:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RocvLQU/zNyHOxSlYKL0d2YhYxDOsV/yA75kJRq9t9TDIZ9PzziReSOcHKLSp6jKpZiYOutuzdo1PQvmm3PJ9AMvYpbrBq9EvcJjwUlIBSffmNJQVZi9onHfr9Guc3e+/JNwGVggX4pr4aJNj+XWw8aWqItkwWIn0P4L9WZBdlsszl4LZXhuPh3ZWr9PHnsLQimXkBD+9Y8oJ+AKmZdreAJJ0EXfzy9fkPpMdh6KvswurNDATklefOao0MKyltU1srzAHGAZOjX3bVbEWxVhm9rbPAoEFFUZKjRLajftX99o7TIyX/Czytn5jFrhcjxX2TpOTierNLQ50OUMCDiDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+h9aE8pGScklp1LAg53bu0IULWzTNerRnIvyw0X9Cg=;
 b=GIN5kftdTaZWkHWfg6Zm8zZXNY/7YOpq+kPEpGokrSACkHU8XkFzvW7VRNFknT6m1UFL1ytKISIYNgeVQX0zrogOIBNQPJ8jnOprEif+7laQTfND9EVlmAaVVu1kNE/EGvQb35HXCMvXWbQBtE31uo7grVfmhm4CJ5TY4RaRKrt7zWwXccFYUqUBnF308p1xY3nkndVUjaL6Ocq3wwjw0D8/V3S6Qj5znJu1XtGfFokcayZQoUmlL4Bht5y+HTitColoDGGbjPCYVRDbkC+6+wnLuid/PnqPLdb1BbDR5lNepbUwF+v+ICvpuBmFBXBL42MOOPDFtJbh4vwLwSmqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+h9aE8pGScklp1LAg53bu0IULWzTNerRnIvyw0X9Cg=;
 b=eYmJ56oa/oblWPvDT04kS6GPFGPr/iFUjjgqd+yeqHYDjTSS8xVVeMW/+iVohB0IY40Vsjqr9ED7BVbmAuyVBWFkZhym5J8028yIGHw/xjACCcbB5e7CEzXUkSGPE4whXHLEMw9oVfllq29BzDejk0X0vtDHhNspXTW677fMnPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by PH0PR08MB7210.namprd08.prod.outlook.com (2603:10b6:510:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 04:31:23 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 04:31:23 +0000
Date:   Thu, 15 Sep 2022 23:31:21 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 3/7] Input: iqs7222 - report malformed properties
Message-ID: <YyP8GaYqdwVUNzPe@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyP7l/ts6SFI9iM2@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71>
X-ClientProxiedBy: SA0PR11CA0110.namprd11.prod.outlook.com
 (2603:10b6:806:d1::25) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|PH0PR08MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c50ac3d-3499-4d58-0349-08da979c4f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMXqgefF8Eho0YgDX9dcBeOs5cFatNa0bEaC6X1ZVBq67wPE+yY9cOJqB166eNGvMj9eUM76GXED258QMsw6JJPVgLGJTL4OH8gxYprBWDo1gmCk6QYOqgxxXoNLaX9NoR34OUzwqTDxxjShTz8/RayyyC1XDf5cuEvOWFGXSdC9oPXjqdtphKYUEcFS44zd3VqsmFFkI6VwYQfKir1rEn4lJ8dCa+1hy6PYWMkaFnqZBr8fLrmKsnQnLBbJXco6D1homCNI7M4IfIq2aumoXGo9qJ+LNrLva4/4A0ddUqc1ioo+kf1i16OCW4+ds6sXCk6LrPv5pzF/rCnkBXEKbnbIafJXkzufPSrGaTg+x2ZLfqnSfmJVQs5YP06Lbv3xa6rgnQ0mSjFkMh/V3RK2un6tEj9oGtQqQwAFDnh0XgS/Q7wDgMhE2PycyLCoaXn6euS4R6B8TZeaEkOfaxCdTQdWdqpTHfaScbO7Vcu7jUBY1cJGQbF0uvYbnJd0bBDq5cZ/uoWMcj0CRcb9adZJHwJ5H1NL05jYsGEVNmdlSj9BzqOLVdE9L+1fTP3ZFsfRzoqindY/BnQnZUS/rQvsnEW10WFIWjLhnHkdkzIe/Cghj9YtOxOh9Irq4fHeRqavTLWvCyFbkWfKR6+5myFM38nvr5VYuh66mQvh46BV2FxkbVmSuebkway1QUxRjGccglb0DlGUc2WdyVCwAdTAAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(376002)(136003)(39830400003)(396003)(451199015)(86362001)(33716001)(6486002)(316002)(38100700002)(478600001)(6506007)(107886003)(8676002)(9686003)(26005)(6512007)(66946007)(66556008)(66476007)(4326008)(8936002)(41300700001)(2906002)(186003)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?59+3PXnom9/QwYM0jB4mrgQObVTP2rA03hO7Q/fG/Q0fYJwQ+3kzluggDa5/?=
 =?us-ascii?Q?DeA16roLb8SqcD2xsRHTPWZ5tp08A00ddBV6JuqQzUH0X/aViJhswbvIbPmI?=
 =?us-ascii?Q?qz9f2eqVwqOPNA6OWHGtKSgslxBCm9rWl1sLPl29y+Tt4dVb5sthdSuCFTh7?=
 =?us-ascii?Q?OHPdKHECXSAe7N1tBhZ3D7V5pBrR3/KZQWrDNvD3LId865ywPqe654gGPTLY?=
 =?us-ascii?Q?DO2xdjk4t2z4Mgp0ptKfUa1poZqN9svFgKyJscongO71RI8FtaqvrJuBgyHE?=
 =?us-ascii?Q?i+ZGU4XkyNoRFr0dIVd0j1Sk9H6IfrHXldD6qMaarnO/n58XTcGXV7KKUghI?=
 =?us-ascii?Q?dbOSx1x4ws/+1yFIwqGMcfDzvuOqzCV+6gcG1h0PfP2wn7J+bbyLX6Grj3on?=
 =?us-ascii?Q?4AZJ8yhHfVZgPBdp+lpYzfrDILGJwGiqo1ZvuarLtHxc/XShcwqcNmqT0RJs?=
 =?us-ascii?Q?bBLAmO9oCYWUF6ziiYpapZHkL/CrgmYPluNJ38Trv0r6MJwOcAf+RT96pYEA?=
 =?us-ascii?Q?bqHHLHPZphCYLZZ9+ux6gLBpYTwbsLMnFF6VsxoNgp5q5vwdIXTk6iE9Uhx/?=
 =?us-ascii?Q?1WWGYDKodZa7tSocRPAx+UAVSNeWZ6nZpVYZxx1Ee9Cmc0Txfj3U9HFgWU0u?=
 =?us-ascii?Q?zJmK/KkkIiPWCKKOm/baTnl5Uo5qF17ILVUW/VQrYWKaJ/wFz3jNdm5BwZTw?=
 =?us-ascii?Q?D+uPfvDI2x5kwq1cjIO4dAsfFGptLnofHIlfxWH3RsMYrbTtydWHjw4zjhT4?=
 =?us-ascii?Q?EKh3QBAsAq3jKt1F763hQr2DM9Hh2WfgLr0UAV/rDFkEr4nGHkyUInu87hzh?=
 =?us-ascii?Q?KLpOL0ZrB0cRr9n7AklxHSPPUe31soaQU0b/K0goPSPjErfULyyFHTV7gbon?=
 =?us-ascii?Q?NVXf6uFXsQ7qnnmLKY8TGYlarERmp1lG8UXP/FnTYSO0ISeLYjJiA8XbXd37?=
 =?us-ascii?Q?CLbeJO3LYVkp8e35IOLGgat3FChQ3Rxe4r0WTOKwutNmgNnmhu68eAyH4HDd?=
 =?us-ascii?Q?Mq6LqpTehqk5bNvtAPrsL5Atlm2plq0FlzDXHlYzBjjVKo8wGDxckmOidLeT?=
 =?us-ascii?Q?WAbbvb32k3yUlsAZybMclMfndOhaJbKWA8xcmgcs2x1DlBqxcv0UXPXuZewJ?=
 =?us-ascii?Q?N7Tn3xKQ7O9W9YPJNknAsuegJKvEBePY0Ls9XK0IsRMaFfQbZ1SbpquicnSx?=
 =?us-ascii?Q?DTTilKBj3uvIh1Z5qGvgu6Aow/bc+W16a9o3TmpTjLONt46qRkZ9t+2xn3eF?=
 =?us-ascii?Q?/FAieGfIYerU6/EP0ut6fZtbTeaRW25xVLOKsGHMLbNtsuKGQPdEeHj/4JLd?=
 =?us-ascii?Q?VY6opNcVEJbI8QhMI6jox0J5KbXb4ANrTv9gyX6z9aX+5JjRVIe4iv0rXHH3?=
 =?us-ascii?Q?mt7Q9UEjlqPuwdZEcXeW99TVKScKpjuFizAOjEQxw4dpCb1kBRVkw0qihd/q?=
 =?us-ascii?Q?KyNH7u4iIVpy1D4e18nVs5SRSyx/F52gKSfrMgRszXfCg+xqG3aQtiXKEF1u?=
 =?us-ascii?Q?q/JP/zMBd/BQtnkIgpD70wSmeStWd7D7mXRhIEgLTy/XAi5F1O5Ptt1R275Y?=
 =?us-ascii?Q?46fzzDJERs6K4a+TYMWQgOy5V3zjsKQHOAcM+Paf?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c50ac3d-3499-4d58-0349-08da979c4f72
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 04:31:23.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzzkwtaMse9SWsQ9IsuteJRx7dMJYN5gbZO8sYIixmjTxtOfLgmYifDhFA4XEKQ/sOJ62pbSpvC5hJTOtgQ/hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7210
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
---
Changes in v2:
 - Used -EINVAL returned by fwnode_property_read_u32() to indicate an absent
   optional property as opposed to calling fwnode_property_present()
 - Updated commit message

 drivers/input/misc/iqs7222.c | 43 +++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index d39b3fdfb849..36c3b24e99a3 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1820,8 +1820,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
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
@@ -1830,6 +1831,11 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 			}
 
 			chan_setup[5] = val;
+		} else if (error != -EINVAL) {
+			dev_err(&client->dev,
+				"Failed to read %s reference weight: %d\n",
+				fwnode_get_name(chan_node), error);
+			return error;
 		}
 
 		/*
@@ -1902,9 +1908,10 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
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
@@ -1924,6 +1931,11 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
 
 			*setup &= ~(U8_MAX << i * 8);
 			*setup |= (val / 500 << i * 8);
+		} else if (error != -EINVAL) {
+			dev_err(&client->dev,
+				"Failed to read %s press timeout: %d\n",
+				fwnode_get_name(event_node), error);
+			return error;
 		}
 
 		error = iqs7222_parse_event(iqs7222, event_node, chan_index,
@@ -2028,7 +2040,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 	if (fwnode_property_present(sldr_node, "azoteq,use-prox"))
 		sldr_setup[4 + reg_offset] -= 2;
 
-	if (!fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val)) {
+	error = fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val);
+	if (!error) {
 		if (!val || val > dev_desc->sldr_res) {
 			dev_err(&client->dev, "Invalid %s size: %u\n",
 				fwnode_get_name(sldr_node), val);
@@ -2042,9 +2055,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
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
@@ -2057,9 +2075,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
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
@@ -2073,6 +2096,10 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
 
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

