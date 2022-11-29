Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 500F863B879
	for <lists+linux-input@lfdr.de>; Tue, 29 Nov 2022 04:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235387AbiK2DDX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 22:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbiK2DDG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 22:03:06 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432B44B9A5
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 19:02:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqY8NaP+DCYWzoD1KZnTTEfcFcAItQeeVdIWcWQzcnqSLNkScQnxbJ6IDTxhpV2cGaAm1EnDNrxBhf62tIcajBGf2I/WdAMsldHfWG9UdCbiRGVoa8rkW73Ql3jg4If55sFeZnvugslVgxSPGYjOomnK2qFvQHZpQEY/N0tqqni36HLeZ9EYn5UQ9mS8ZlhD8AGq2Nef6v+oQzekqeixMydLRrSYwO3Xv2tB4BgnUYO+E2WgGu6+E5gDFmZxZqA2uSIOZ9+0dhdXHnMs3fFALkDbupnVjiThCwGFWlfvLzefW/cBVuPUxRMc/mgNeGKd4Gg7C6CP28V7WiYlOLhX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mVgKyBOHsKwjG7AQXgLYhbITMEWzqBW5qTQIoc/kNc=;
 b=F4eLwcBYrjtzcSBd2YniFu0pF8z/xm1+mOSS5c102mXkucqYgcdFM8qeYZI+b5AX6w6jvCY58rsmPEyfDubsX7stOKw3t1LMUlBvhMGioTX0Po+vq9SY0pG8BsxieCrSwDcULw+nn1Bzgw9SVxI5etET5WdgSpf05SAFzYzIAA3hdJGt8l1pyD9xF0DIGWRBMyVbAGNkNlJmuQWG5Z3fnHT3IStoe71MBKfW5VCUvPNGSSZFA1FymH44E66A5U+cUiOFOUlFijksMkbOOk5cWSglx+omFO7pHB8jeBy9zHprSEjMZMooF5jWBMYSecXFvdOuEG5LtX1T2p6Ji+b0Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mVgKyBOHsKwjG7AQXgLYhbITMEWzqBW5qTQIoc/kNc=;
 b=YJssakvGI06o7hfF83JjGvbqR8TrzAZ5Tp5Hi6KGjQm/2CVbMQAlVr1l+X4FbmaBFsCVxw0G7VK3KMlkNjdhrOQZ627K9cTqqijI7h3tLCxFRfaCE6AvZRAR+gYsQQfLSvgXA8aTVuWUUCVG6Igzw3PM7wjztNPIPagspKPrGic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BL0PR08MB4546.namprd08.prod.outlook.com
 (2603:10b6:208:5b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 03:02:19 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%4]) with mapi id 15.20.5813.019; Tue, 29 Nov 2022
 03:02:19 +0000
Date:   Mon, 28 Nov 2022 21:02:17 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH 1/5] Input: iqs269a - drop unused device node references
Message-ID: <Y4V2OSN35Yio9JN/@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4V16ey6osEaaZJ/@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71>
X-ClientProxiedBy: SA1PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BL0PR08MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: dd64f03b-04d5-4e5c-5791-08dad1b620c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKHAfkRvASeceVAAN0sA8Qny7MVHriKPfr1TYmO29bzO7W9c5WzN0sw/gkogCJiSwpigREx/N/hMlbFNAHfxGHxeMhmE52yYWkJzMaW/blNsY0SxgHZq7vydj5mLekwaEcWBHGe1Pc6Dsq1zzRLeaaJFp8X/2u8WxXeVqqAK52jcx98ljq39os6Jh5JeCjZrGweFl/HIEuUe1K61QaZ8+dziVhpeklrPO2Rzht3kbmWIUv/LI6ISSAvr3lRbIF4efLYe0xRnegK1zkin139YZuV/xiP7U+vFQnOFS7jdCY6g6ALqh2d0oZc1RSprETMI9jvh6XW0jo7U/XgNy6YvoE31eou5cW94VrBJaYzGmVIXT973d6/R8yBfa7T0I+D5twaBEMeiQ6zi+9Jb5EWgen1zsm/XCuB7t3SoxT7NHbkL1o87J75xFXonwDVP0cE7poXrwQ2s7TUStBbZVXqlWs+SZt3b7Qg+Vlly06GuVfDHPp5/p2ukTs41GMy138A6/6S+7zfiakSKOCtONtRJxv0JP3db0mSs4dLaMDfJNsMb4OMQxIm4aeQKl0EKvy0oMBE5nTSU2KD86YUTCrB8y3SvGVDVCJRVdDqvA1SeaWRCrhw9sGBlTKzgOct28zPhyqBoNb/auSbF7zvVdN//6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(346002)(376002)(396003)(136003)(366004)(451199015)(66556008)(8936002)(8676002)(66476007)(66946007)(5660300002)(41300700001)(107886003)(86362001)(33716001)(6506007)(6512007)(26005)(9686003)(83380400001)(186003)(38100700002)(6916009)(6486002)(478600001)(4326008)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGMOoIkgn4xaLgytfdrAZ4vRR1VbJq8L+XE/UhrWoRKWQCEUuEwAkCCJ7tIG?=
 =?us-ascii?Q?kKAdNFOomXSdP2kyYtP3flIQGO1zekJh+NkfKX3qJRA+vwxyd7P7rpizw9b1?=
 =?us-ascii?Q?9Y8nQpjH1aBRKGwkZkMJxMUsnFNmyv8KuYoZMDz8o5hQVqYBckOq6XBeY7Ov?=
 =?us-ascii?Q?miZiyf4UcsfgNJOW87xQktTu4JtrQU2QCmxgk3GmKRWxv/N+QlC0TroMcIcA?=
 =?us-ascii?Q?LtW9PmFupQNfb0iz7tZPwLcMfLB1/PBO3ljmut4Yg4jpRVfTNeEoequ46Ujl?=
 =?us-ascii?Q?6nkPEHXGKj6XYDK9JXtJCKSZlhurK7hL8Ew7o2jwg9ueCwHV0UBmDYUSK0or?=
 =?us-ascii?Q?E7kFVFZR1aKTOLxJ/QNJAbgbT5YAzAdvXSiqFKJVNO0oi4y+VE9nAED3NmmR?=
 =?us-ascii?Q?22+zzHM5Wq1CbVcxUfZAGOgpO59op/Y9kvU+kkWhpd9fzpk8qXM0ZVFLYcUZ?=
 =?us-ascii?Q?84q8qEDpjL3RNk0Lt+188dbwxiJaq9d8mab5oVcqebf5wtFQOtewfDYorVzM?=
 =?us-ascii?Q?eNy84fQ1UhJjOG80uneoPuWg7sI9Nq3ObLlE3Chrnrf4gZ3ERK5zQDgPuuKe?=
 =?us-ascii?Q?QN+JNhiIpEX62tGE4eCOPnTXikcjErGkMahTZqFCADg/FpYApb0tIE/ZWfbA?=
 =?us-ascii?Q?m4YJklv5BsAWNJDsl25We3XH6ravA7arcw24uMv5cmtp8hpbiAPKi8024jfe?=
 =?us-ascii?Q?lC0XcHk+IaeJ1H+HHMKNnK0o3+GpDnQIkQpteiaCMBLgB8xDJrgNZGdvfFg7?=
 =?us-ascii?Q?lMqLeW56rUUdAn5sB7zc+OIfRRbQo2rEK5IzKS1uGPp/3mfXG74zcsyG5oay?=
 =?us-ascii?Q?Kr6tPHYxq443gRL0dJ/30Q0nxxt7hPcFXCA2IEqL1kOE+U4E2Gs0uwoWayse?=
 =?us-ascii?Q?rIY3duvglE07xCeCfjcKAdrsXbJ53dZl1rO5e0592jr+H9OmSsR7IiQZGI4A?=
 =?us-ascii?Q?J7oO8uu70gYHdEHiAA3i3QdFOWxWF/jA+gVRVTQS94iVmi/PCdpaz8rfk37F?=
 =?us-ascii?Q?O6HopBHVPzqPJPN8aA5i/RQCoiTwfFB3mJn3ABE6NVgCAAbuX9wMPmJJyDyI?=
 =?us-ascii?Q?cSOOnQIpKeMuCgXRrmEy6VkfKjYOC5OcQSoMeQRKvc4j37IiHLKzInap7vGp?=
 =?us-ascii?Q?5aGJoPXHRbhcv0IXc8N+3QgwgUwaTlcwudM21FFmScUUTrPygjZQD5cp9QQl?=
 =?us-ascii?Q?1t5ZYN5j7rHOPvbcUvdUNlDfsJPCidGcPJQ3zhLtpYzafJIo8WQzHx4+r7Uk?=
 =?us-ascii?Q?WdsCpww8YDnFMSRtwCgKplGAUZdJyL1/qd4Glsxid2uyRa7cweeRjQ96pkNQ?=
 =?us-ascii?Q?cdJYfpBDBBu/pavteYzRMiyMSMJWxnv2dnDEeB+WVqBnTs44DcK9rYUK2mYu?=
 =?us-ascii?Q?8+fv4tg8aE/TA8LxY4QWWMUiLlIiInWbOUGDyqW8PinxItU3JfVfexj9bSXt?=
 =?us-ascii?Q?Gn0XMAIRLZxPNDECL1PGQBo7BpOa0ju486ZjMoL93MNSlkmmNP8V8B/jmcq0?=
 =?us-ascii?Q?+b6mcXGi/eQpU6zVjL5Tz0jxSSFfUDCJCPNsUfQWfD+zJrwRe9uI15BQI8DW?=
 =?us-ascii?Q?4CW7jfo6D9E22petzcDnxVOvX6J37ORVJUGPfz0h?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd64f03b-04d5-4e5c-5791-08dad1b620c2
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 03:02:19.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV9f1XtlzoyFYY5DYMc8cnaVGssnPi4/ouFwhqrE/8/Ufcoj70t2I8ba3W4oFWLV+HTcW5H75WdBq/hdbzVYNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB4546
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

Currently, the driver does not call fwnode_handle_put() on nested
event nodes. This patch solves this problem by adding the missing
instances of fwnode_handle_put().

As part of this change, the logic which parses each channel's key
code is gently refactored in order to reduce the number of places
from which fwnode_handle_put() is called.

Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index a348247d3d38..5620a009bf55 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -694,7 +694,8 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 				dev_err(&client->dev,
 					"Invalid channel %u threshold: %u\n",
 					reg, val);
-				return -EINVAL;
+				error = -EINVAL;
+				break;
 			}
 
 			ch_reg->thresh[iqs269_events[i].th_offs] = val;
@@ -707,7 +708,8 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 				dev_err(&client->dev,
 					"Invalid channel %u hysteresis: %u\n",
 					reg, val);
-				return -EINVAL;
+				error = -EINVAL;
+				break;
 			}
 
 			if (i == IQS269_EVENT_DEEP_DN ||
@@ -721,8 +723,19 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 			}
 		}
 
-		if (fwnode_property_read_u32(ev_node, "linux,code", &val))
+		error = fwnode_property_read_u32(ev_node, "linux,code", &val);
+		if (error && error != -EINVAL) {
+			dev_err(&client->dev,
+				"Failed to read channel %u code: %d\n", reg,
+				error);
+			break;
+		}
+
+		fwnode_handle_put(ev_node);
+		if (error) {
+			error = 0;
 			continue;
+		}
 
 		switch (reg) {
 		case IQS269_CHx_HALL_ACTIVE:
@@ -744,7 +757,10 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 		iqs269->sys_reg.event_mask &= ~iqs269_events[i].mask;
 	}
 
-	return 0;
+	if (error)
+		fwnode_handle_put(ev_node);
+
+	return error;
 }
 
 static int iqs269_parse_prop(struct iqs269_private *iqs269)
-- 
2.34.1

