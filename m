Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23A2F5B1E6B
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbiIHNRP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbiIHNRO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:14 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C7D2F644;
        Thu,  8 Sep 2022 06:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha6Zz7/ueZmtL0k5D7GJmYkKuIw51AVXfF9dAiZtGfR2YYs6yPpsUAquHbK/+srtNIgW4Sp1ZFwEdA6xuqv3Ka2VglwaUgHojk+cpxdyJ9wbHxT06TLcki2tDUb5vwvPRUO1SY/dQBh3BuyDl4VW4zZDJRCSA6BkUTPQJirkjGrbPjgxKdbwQ1UPHEq26g+x0eGIhydu30lVbvXdYS/Oiqr0Nwq6RB/Tj7ZIOLUmWcT/nvJd557momn42LJP9p1AaVZAhZJCrgvi+2aGTGvBBpOHLdMh+2AZ/wdKKNKFqcIxSer2FV5yZ7dcknpaijH2PgOmsQJsU9sJFSJgj2EcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIMvIZD7FKC2tdBRYHWyF7bydlAFIVDiV3vJjLXfl/s=;
 b=XWk8BGm3DN5b2dc/Zd8quaYjwR5L2wjd0H7JswMSZ19HZD/s0SkSJFqX99+BA2+qKhl9Zfkipw53dkkEUQV7o3Go50SmOWA4b2Y694yEGvTsdP/q5eyB6GB6hVQHEa0OTzD+I1tegcfYkQZTB0aKkpJ6+PXlce9btFeixuabJv4I0kgf9bnZvGmAAO6iUEPoiPhp4aF+uiOZSBvQ70fibyaRzN7u0An5CJaMGSpXA38wc0QSGC9/Z8mx7hWyWdMvxLWnVPVD2amkpzFapAvK7Hjney/r6ilKqrSg5bn67Q2qWj9HmNm+x6bq2LBMutk+qAMYTnqGP2eHnz3MonTSQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIMvIZD7FKC2tdBRYHWyF7bydlAFIVDiV3vJjLXfl/s=;
 b=Zv7lMwNujcOWyL6gVpag74WDG12BzuciVXBmbpZSwsTuMG+r2329dXdwIK7vtL++8t4otfFvfcG9ZRqZB066NCZDJ5ZT+Ilerkr7oPPTYpxJtNgwgtPhe/Pkc1zHkEYmednBYfkDqbNmqUXRaLmt4nNLKo0nNh4GHoi0+wPKH0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:11 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:11 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 05/11] Input: iqs7222 - trim force communication command
Date:   Thu,  8 Sep 2022 08:15:42 -0500
Message-Id: <20220908131548.48120-6-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: 958a3efa-e55b-4243-c35e-08da919c703e
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5QzJk/s1p0HVPmHMoU8TDs1LbNkByor2r4z6poOHm3og0vV9kVZZVD5TTnbgyipHGp10rfE5LkehN43MnKLDc36qakCNm0L98JZ6yegr8KC91+DRQ2DL3mN3Pxl2o8PYrd76Ev6s3C8VdAb5UV5ij1r7FvGTXTc0BNIJPe/mjKZJ42dAvnBwlcV7izkprm32FvQRvcA0DYOVulySKRN1nJ96xTUlTiQUbmgDB7MePEFnCYzRhdu5LaGf32S+td6yl0rZ2EgHr9CsyAbL2sxvnYR2A52Ms6FgQKe98kG5V4n5LwAdkJ+K3lQaF6vRhVvcO9wxAAVI9necarnSlQyn42QnhbL4ZbMh2IGUZ0HST6hpY9I36HG8YgT90d9ZVZdg9unEiqfwJCR8KG23sJqguXTIMju2geeYQfKegfxcw0rM8FKkr7y9p3baqt282S89iB0pm2UkCjLzKhs6pJ/9X+BHKEk+9q/HbD1BMVHuRL5pfEGWo+/OTXriB790KlnL69Icr2hv0gkxY6AL6kEHkU6K9qEIvI8BE8z4zkM5x3EJxj+DTM7qrlfW6sD2pENk3itvz5T8vrxpHm1Gi5zYXprW08aIuIuySplPuf3pEPALdnPnCmPIXpr+R7muDzjHIOWFAvGfo+q2tXIk4LKNlFQ2JDW6sO3Tb0fTeHLvGCV6y2z15Xxm8iw28yKz//NfsSCyK01WIZx4pC7jIjUxV5vTaKUByVThkfwXJaqgdFssvcLPqi1kMbMDJ00xEiCrvT/tK9lGh5i0aJ0CnK8jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(4744005)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?22f9ni7pI7NYkgQqy/UrTFyvwwWZj0X/FwAeQk3bHMLT7vhYHKHWQrcuw/ZY?=
 =?us-ascii?Q?E0RsiGPFNN+rnz19AOM7VsMqotD8pLCxXCI6wCKHN+B/OasEMv/IdICDYmu3?=
 =?us-ascii?Q?SiDpfHvUmRzVBp2yHKhZiTOTv8CsrYY1E4PNg1l0s6hychJ1oRV1O15gEobZ?=
 =?us-ascii?Q?SKyRzsX79Gdh5zpHRmWcjIpVx/ycRbMShGEommdm2YDV4IC7T+ht94qgpb51?=
 =?us-ascii?Q?/JJY8r9VWwT/wczQKUylRYVjXpfjB/ip1KPpCG1EkWay3PT423eD4Dg9A5HX?=
 =?us-ascii?Q?L/Z8L+P0SWl14XE69T+I9TEeefoiX0Gxi/OCyi0+FJjfMVlFgqSDwcQoXT2l?=
 =?us-ascii?Q?BGHrxI22CxpIDfXqpAXtfalxGklc8mH/3ItoES/yLMZe04hkxOHCSusZhDbG?=
 =?us-ascii?Q?JH0UN33cp9iVVKGD2icfMfGaxPaDZ4BS5tg1Y2wuKQAblJVHQJVkT2zfAywp?=
 =?us-ascii?Q?P1LsmD/L7NumskgTPf/OzPPoQuBsIiw+sQ4bGowyi1vrYJpS6wl6YZMRxedU?=
 =?us-ascii?Q?0izEkwPP1okL4724cLJvwKgZ+dUfsHuHeDLwGWPztKUTbvy9LduQG3nOLZez?=
 =?us-ascii?Q?QpSLtEhIZApTLxvGHTYRBw1uciF+pOUDaId+q2wSkjY1jXMiEuAuoHls+vEV?=
 =?us-ascii?Q?2KKaCe9OcrOGcO8USDumq0vyQAA6ti2FuzFM3H87ntv9S6jV1c1RC+41fesq?=
 =?us-ascii?Q?miMnMuo7er/rKXOHBYg/1+kv5rVJqUyUov4qaIlg7jaySXfWNNv0JtjV4cFh?=
 =?us-ascii?Q?Wk5vGYYChh1sqAlJUf8397ju7IZX/WasLx6VDDysrUUydzr9H8e48XN9O9xx?=
 =?us-ascii?Q?HNMFlfV9REFMYP1JFsmra66dhTKUFYtDR8JGEV9YhQHNBes1cHgAVWMHm4op?=
 =?us-ascii?Q?Brd3Ft1Fves4z5KizZ2P0L76MQHlFN9/KPb1fcK3hztKC21nh3ey76cvozD8?=
 =?us-ascii?Q?zOBnbACJLPzgrqsyGi0el4xxVPb3PNPuZJpF2799tL72rZAtDaJdJTclFqdr?=
 =?us-ascii?Q?Z2JQ7I9bwk/bjHWE6sO8p2b7ih2hahxgrUy8i37l62mLaCQ+FpGbuAECQbm4?=
 =?us-ascii?Q?q38W5XQl3uhmA7FhMIwBwQVAG7G7koQInsZFTYGhYHDNxQGNnAdViySTdRi4?=
 =?us-ascii?Q?xnhq0vtY8oByf/a+HMJhWmRcIrUC4qAKD6NXklWzr6FY2uJdJTSdyE0XmMWK?=
 =?us-ascii?Q?2/zWY+Myywh76aN5mveI1E4720DPsHgSlfKm4daFHDjSMNnkETUwVu6eUwpj?=
 =?us-ascii?Q?9TbzhNe8tUX1guhTt12gUEZUWm009n/UjvMFF4SIdfTGjYOY7VpjDbuUQTG6?=
 =?us-ascii?Q?fou20ldCDCbdGdgAOu337Ug1vrnPsttSddOe8cUs5BgHWk8OIJpWA1ypSg6L?=
 =?us-ascii?Q?8TWzhE+mIL/zfXStubqGCokPbiAc4mPBmei2ip2D6GzDs8WzDSSDJpGMufmq?=
 =?us-ascii?Q?vEJ5SL/1PPiuVSywvOeBkpoq5Icj24u0UC4XUiRvLzkY+wjXb2a1gydwhNnN?=
 =?us-ascii?Q?rrNjPfzqIUPh8V56VHshD/Kbjix/mMf0phQFbfUjUrcCMYv2b++eRpAaFH4s?=
 =?us-ascii?Q?ZMhx8aYF7nlDggNEh9421vVRQcNOOQMzbxR8DNHc?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958a3efa-e55b-4243-c35e-08da919c703e
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:11.2152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmcM25GlqN2hYTKVg5go6jl4JOZYMgmy5e4WunxhTdluRytUdrEvzMfRGoubqfDmxuYWwC8cHr8zVSgrh1VzRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to the datasheets, writing only 0xFF is sufficient to
elicit a communication window. Remove the superfluous 0x00 from
the force communication command.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index ba12c49e972c..365e59f78f1a 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -1077,7 +1077,7 @@ static int iqs7222_hard_reset(struct iqs7222_private *iqs7222)
 
 static int iqs7222_force_comms(struct iqs7222_private *iqs7222)
 {
-	u8 msg_buf[] = { 0xFF, 0x00, };
+	u8 msg_buf[] = { 0xFF, };
 	int ret;
 
 	/*
-- 
2.25.1

