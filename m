Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C145C5571F9
	for <lists+linux-input@lfdr.de>; Thu, 23 Jun 2022 06:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbiFWErI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 00:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244248AbiFWDx5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 23:53:57 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D6C6439;
        Wed, 22 Jun 2022 20:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNpVlo5/ETTL2G6uvLL4QUnJrYpZ6pNw6psCIavur2vuK64yOcpgV0xOLoEWqAw//EyUxzNayK2B6pRRq7wbKPevNFX6Ri8LD6YWaq66rWh3locbYXc+b2iuYZ4rkoXTAmjTtdqNtr42AMxMgI3mmaOzCAAl7FgnuhUJ/KQRVwiaqvgXMdL1FSZm3WfXtYD5RwbTBbWeKfxDn1/bzYmo9gFkT5mbzNtgNwfZrUIEMpx1rBX6apZP80b4oOSwmsJFJ7O+VV5Q924b/twJp0MQ9B33linfUgweEQCGwLtfU+A9sAfDU/9bUuJmZN1Ckp5O+fadwPZEW275EpkRciyxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVGMAUJjc73IMcJTzbudFCBtWMt6dYbaii2jJdUTM20=;
 b=FwcRgJTNk+1QaC2YFqu1R2FkcCfWw3z8+5M0JdV54VR4kZ7EzSNHexDXOBusV+yp4i6smvIM9tMC4Lc2yQgHckdyRHI7w+6ZuA7R1eD+/uQzCt6hyk6mcufodJgu+bs8Qiph1CIan8r1ruVnGqvyzFVGjLhIJehePx0+BCHgVJh0wcRjUpx72jZ+LJ3/TEiBgWxAy8ueG+4XHn7qIRQzQQIY6uTlvMNWbggGk5AFNXIO6gXQE8xqGr56PMonW/ICPQ1e5WktmxTfcdKFLYz1+TK7SuAxQ47pMS4lsKaKm7qkY01kcD5J/XT69TvXQpMqjRrKgAkISevPIDR8/FTVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVGMAUJjc73IMcJTzbudFCBtWMt6dYbaii2jJdUTM20=;
 b=ZiUZIhpgERGLMuL35zSMpw2g2SE0uMk2gOlcsOlWRz6uDAp1tHBcf0tUwfjlTUwL+974Pw2Dl3Zy5DWX21FycjLsBg1Z9+m6AcMi3m20XIbDHtHJjZG9ahZffXhn2nZ15dmUdpRVfRFSVYercJZAqQ5nVLOMBIoZOuSrDAkHgKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB7766.namprd08.prod.outlook.com
 (2603:10b6:a03:3db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 03:53:54 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 03:53:54 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 4/7] Input: iqs7222 - handle reset during ATI
Date:   Wed, 22 Jun 2022 22:53:06 -0500
Message-Id: <20220623035309.39528-5-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623035309.39528-1-jeff@labundy.com>
References: <20220623035309.39528-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0001.namprd07.prod.outlook.com
 (2603:10b6:803:28::11) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 938cd172-81f0-447a-cd01-08da54cbfe24
X-MS-TrafficTypeDiagnostic: SJ0PR08MB7766:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR08MB77667D491E3DA9C318159754D3B59@SJ0PR08MB7766.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z79fjjggMGrDd05doeASqR3Ky9I1+ixxYs0/N+sP87pI9QFYTRzpWUj1dmz7uxDk6QzvgYqhoqpdLI28nxBU8BRtalQcJtdZLJ4esUHfir8zMdRUYPQ4Hdtu1drYH+3wkfI/Kq/Xf4c3ZC6Qhum4Y7SmpNzrZ94ngyMjKBLNPB5HNz2cx/R6qjy+xZsBXPrOYWmhC5fNdss3ZVRfZ3YkjzfoyDuxPDgc8WicNeZ2fP8sQ4SRx3+//bKozHuqHrzqHeeySiN04PNMIBGSC4HLfeTd0ava7r7on0jVb05XmKrbqXqyj+48Rfq+TCga0aoX/UoyVib3EnZtriuSgs5iyxrRrrim6geNO0YrI7hZx5PmUVmTyGcFAH4mV3No1gi7fHQQfTV71DJ0B1TB+pf8MiwHK7AdidYNp9OgWnR/XuwooXvxkwXSMzMA/4cAJRCrw2Hut9iafoEpPukjHNCNXSq1kGntJw6vqSPQ7cGLoj8Vo2TtNfg8eTR2UO6eDnX5/jvVJt1UPouGHygSsEyq6mxMEtuWVeI7Xixv53mT//6fVnR1HFfa3BzryDTTjdZ8TxLuSN01epHi2TI5K/3Gse3OYw1VWzy+LtnsGoMlkEuVFuhKZS28FeKJ0XO/j3pdmiJpbQyZzP+TqHercMNlPvlVUAGvVllpX/qrTW3H0AgYaYkz1tx80XmgR4rwoYmjXVGEgpaoA2lmc1ELzjalSczJJgwNKsImEy0ArVHAHb7kM+c+QlAZppNlrzfj11C8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39830400003)(376002)(52116002)(26005)(6506007)(107886003)(38350700002)(36756003)(186003)(5660300002)(2906002)(1076003)(6666004)(83380400001)(41300700001)(38100700002)(66946007)(2616005)(6512007)(86362001)(4326008)(8676002)(66556008)(8936002)(316002)(66476007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cJGOVdyJBRCuBKRESJ9r7PlHkzbxjjm+4ZhXwM1lcjS1UJXv/rtxEXY0CrfX?=
 =?us-ascii?Q?jjbieKbhML/ij7lIYJeHlzW5o8A8ABK/dM61FdyWsZ3lWbKfhkyGwh7Gg4Kz?=
 =?us-ascii?Q?HTsc16ipx/tvzWxjXDpsCVEYL9Gjngua8Zw5rWgwYbOBoAH1DZiJRQ4E5f8V?=
 =?us-ascii?Q?ZFCEVzaR3hw+2Yh1SDQmMNfXJOAuYU2EhKpVZc4E/c4A0KAVJWc/rbJriMSv?=
 =?us-ascii?Q?gH1M4QuoG0juo8iY4GzCWfanPyUFIuKgA9paWJaTLf17B/45JICoPd2zZsjb?=
 =?us-ascii?Q?cinu9dhLECJ8e+g9sCzCPsDvgwbAH6mUNw42rDzBL3lXXUU/goEj3dJBX4H4?=
 =?us-ascii?Q?9bEcmCLbdYxJmrN4gT0Sn24fNw8rV2/tDbSg9K8wWFH0Ip2Ixw9HAGNwZQiP?=
 =?us-ascii?Q?+tipRTULDXjXvCvYppqOrV7ni0X18rW6VQPOR+kC0gliyKi2LYG5eT/QRGL8?=
 =?us-ascii?Q?q4bwUqPlWwpw+H9EV6eRmXBDusFUZsNwyw5BJ1VUVseGcxgzDt68W9arPJA3?=
 =?us-ascii?Q?opxbdhehDCIlTvDPxuvxYb0C5BM2mb3fgrw4G6RHRV/FGGT7LQqMnvN7UzAd?=
 =?us-ascii?Q?gXeRRd179Z4daTgtjvucyfptrr4yR6/KfGjXe3Hb9rP0hUV9lZ1S6zTCvaFP?=
 =?us-ascii?Q?MfuZ3wQwLwoICQ8xF7T1cWAdtvoKMTbrYbJeP6m/FN19z0aQ5k4ctVFhbMM2?=
 =?us-ascii?Q?KFL/6mIydisgZQ3+qQpPn4XEfqLcj8Y46psMXak30aMmw40BM2VlCF6h4Ybp?=
 =?us-ascii?Q?Pc4HjCnEbrPUFRCyoiJl8tdDv6e1GhSGwv0g3q8rxn+cyhxAYR5ztNRyEYxB?=
 =?us-ascii?Q?7LMjOWRJKx86zMjfBhVrjQ5nZuBnc6eG+CTXtqa/eNbXf8WJSm5wCjYinfE3?=
 =?us-ascii?Q?Xk70NwSeN2GxKFIazQdC3p2cFsHx4zH1cihKQB9RQcz8FPKS3qMVLU1BwxVv?=
 =?us-ascii?Q?dkhN38kG3r2B2TKjZxjwuPAdCTnFOSWZCXcNbLRFxVYWRKI/RqN00eNLPBDi?=
 =?us-ascii?Q?V7IZLl59gu7nML4PtiYgdjKF/cr2ZKm5cWxAjIRhxA6Nw/dn+RFQClTt8PUS?=
 =?us-ascii?Q?1VppPoUDI3XB9GDX3Ux0OPcG7o5oEQ5mBb9amq7ZSxU2QCZxinNd9Zsp/8YI?=
 =?us-ascii?Q?gfcIEc7U7JE9aHSfrH6/AUkinNC0NzLLuXWPisHmQHfVNsKuFAO5Hq5uyA7N?=
 =?us-ascii?Q?oHx6HTdXtEIJxykYtgKz+TUTfDjd+XO2h7Wh0vhKEHrxWCfWHvEk5loAeYSC?=
 =?us-ascii?Q?H6oHIepFC/ok6rd3O3bvrQJBPFs6iIVuT8NLICvUoYStDMBXkAIq28Rvsxqc?=
 =?us-ascii?Q?FRQS6vOtMt10WNr32U1aUnwn+rjyGcSjq373raz4KFF4bwyvD0zKQnbXKdFQ?=
 =?us-ascii?Q?0ch/dvpXT/ZL6FFItptN8UiIPYKRxPqsjxm6Qa673Uqt1vWEievzWGP2zSeS?=
 =?us-ascii?Q?/UhbhjpoJO2VW/HGFjJtVYeFbtO5pMnGJT3kKBfFtg/1UeWAkLm+KRp5+u87?=
 =?us-ascii?Q?glebLEzo528wtxGZWaCdA+4nRAfmJhAlIJVRRbFM0DTB4krpfObiTZcubQsI?=
 =?us-ascii?Q?i7+9QEGr9TGiiZhG1NNyu4g09bZk8T893hGMooJooSxs7BYiXRcKVwNjggzz?=
 =?us-ascii?Q?oJxw4zS7nOD+axxIB26I5M6R9kRts1QnTSMq8n9BSTeh24xg5a3yh/OVrPiT?=
 =?us-ascii?Q?nzvSaETMjFt2LN94MpL1lflu/KGIi16y7jyjZBLyS6KmBp10M6YifsvFIyVv?=
 =?us-ascii?Q?J1eYDknHjg=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938cd172-81f0-447a-cd01-08da54cbfe24
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:53:54.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NC5KPyQh69QqfH1bg4eE+aVIVlcOv/FtUcnKaqJCpVbrzPzhqRkZok0optO4uwGNX/liJG2cA0xmuTul7/lu5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7766
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If the device suffers a spurious reset during ATI, there is no point
in enduring any further retries. Instead, simply return successfully
from the polling loop.

In this case, the interrupt handler will intervene and recognize the
device has been reset. It then proceeds to initialize the device and
trigger ATI once more.

As part of this change, swap the order of status field evaluation to
match that of the interrupt handler, and correct a nearby off-by-one
error that causes an error message to suggest the final attempt will
be retried.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index c1ead10dccbe..a84cc18638df 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1314,12 +1314,15 @@ static int iqs7222_ati_trigger(struct iqs7222_private *iqs7222)
 			if (error)
 				return error;
 
-			if (sys_status & IQS7222_SYS_STATUS_ATI_ACTIVE)
-				continue;
+			if (sys_status & IQS7222_SYS_STATUS_RESET)
+				return 0;
 
 			if (sys_status & IQS7222_SYS_STATUS_ATI_ERROR)
 				break;
 
+			if (sys_status & IQS7222_SYS_STATUS_ATI_ACTIVE)
+				continue;
+
 			/*
 			 * Use stream-in-touch mode if either slider reports
 			 * absolute position.
@@ -1336,7 +1339,7 @@ static int iqs7222_ati_trigger(struct iqs7222_private *iqs7222)
 		dev_err(&client->dev,
 			"ATI attempt %d of %d failed with status 0x%02X, %s\n",
 			i + 1, IQS7222_NUM_RETRIES, (u8)sys_status,
-			i < IQS7222_NUM_RETRIES ? "retrying..." : "stopping");
+			i + 1 < IQS7222_NUM_RETRIES ? "retrying" : "stopping");
 	}
 
 	return -ETIMEDOUT;
-- 
2.25.1

