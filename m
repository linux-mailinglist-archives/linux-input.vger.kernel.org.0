Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA43755AFDA
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbiFZHZL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiFZHZL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:25:11 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E0B10571;
        Sun, 26 Jun 2022 00:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRWsbCFpB+YZgQ8ydnMJl4BFTjywb+TzkI86UYmDmKHgjILWrK4XVKxP0KUEh9Uv/S06GI4/f0qdQ21sHnhKb7PmFkY4iHXBD1NhiII3qL8Ti4TlL+p/Rr/FpHjPQ7Po/NGZmBC58MBpafCPs5D/RQbaivbaxH0EAYCoeArmo1fafcUQfHOwcvKIA6KnbRh/OqohRL0AV3NMKjR9BUMBakN2c9kJjtLJVkSevCwgz43+NrqC2rZZ8BpjwEeircWtXYU6n1yG+G6fwiQa0WksAp3VYrvR6R/iPNizl5y/PtD0CzOGvTk7nVCGQcuxrv3vpZM5CTFauGHCyP9tMmnFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yEO2tv9Qnc/HOdokOfbKt5AHyiMu94qjGUCc6e7w4M=;
 b=DwIc/NT1Ne3U8mFEbxWlst5pdpeaIwjCehojax7tLeHdieikEuG7C1Ygmdr11S0QPAcqtr1Md2+pCOzMI/9RMM+oR9pZgefLB2ZDjyzym4lsfMIO1cSy/4jBYQDDWjtM46qt1XUOuW5Wlpdcg2DTXoknFU00yWfpWUB+Oh22ylK/FQPEJr6MNacdR6XKYDU5nFp4Xdpulq0bGxk65JV+6a2RlPg+a0cWI+RYRrG+jA1sz3yBdpmi+Sb5ALJFKGnzzijNHKGwfNZGAJviIn1Q8PkSARb/8JXAo+aqVK9yKRQxf9Ihe2UQL45O4NYEDrSu3ls/8VkTnSyfoBSVBCxJ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yEO2tv9Qnc/HOdokOfbKt5AHyiMu94qjGUCc6e7w4M=;
 b=wsJZ/80YQvhJi+KRNEwWD3c3lEwCCAgNr/MNvyxSe4ww3CBJ80O1eupHsT8xqQKY4CsqJUxKFXynfDKt572sAFwzObiZfQhDPXlJhcwwkAoSOfVtXr+Ueq5a+fYI9R5Bw9addfCKdi8imluM2u8fj+xfwPqUMYJY361Y71vwG6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:25:09 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:25:09 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 7/9] dt-bindings: input: iqs7222: Remove support for RF filter
Date:   Sun, 26 Jun 2022 02:24:10 -0500
Message-Id: <20220626072412.475211-8-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220626072412.475211-1-jeff@labundy.com>
References: <20220626072412.475211-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:806:121::9) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a15a7aae-440b-45b6-7b3a-08da5744fff1
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvBWA+zztqUKO0C+HT2dkmfFFObQQR5oLk0t1wDgHyhpBFHNpYH1jQyYQ9pH+DFFMhjLn9qP0qDNQYoJA8/01VGQsf5OEF7AJr+7tSyP6d71we2/Q34wQ0epqKrvUOnPt6bpc6tyAd6KGmXk142vN7iXQUe9OJFtSKBKiCI2aphOrjCtHaKjoeSogAkXs27eOQo5TwZ25Cu5rZ03eS4OBiLmu/BOPMIhavFogUudwbeFJgiVv23XZL/5v9mju5DJirYiKcqUD/nIGBX2BP5s54vUa3r2I7yTH4Y7pX0+I8FYQ0eEvQCqchkWjx81wnt5wGd4/pcVwklLSZhAjSs4y7uZykLOczB0RtuihheF3H5VRmz+qgewb/b584KOZ62O5r1wJsEPjQkV2LNT9MQ/A3N1F1hSBDbWASzn4S5X5VYwF8Qi0a1BLBauAciKU+2YF84mTq84NgNG1ZjuXGzNg+1tn6Y7Ps8KPROlumoUuGvhv0fq+m+vBG1DMbC/n2PEk0Y8nS09PF6xGX6EClevzKEdG5sgKjRatBeCOPlzZMxdj2dHhUR1ySstZBn64ddzU9aP03Y0Jv+aavXmMbpMufdNAd4+m1Tezpu6PjCBg652MdCGRs+TqYtITiBaZzMjMYZFBQ4T6gXleZCFoVBYDVPnS2r5J7Tk7h5L0xATRJMcluCehYzruJy/UTWEfE80N2NIq9QZQVY5p5QM13j1EX8FzCdgVb+zRR2l3wgo8CY/+ik5Pr1orUzU876xqm2fV+tQ7bXzq5xut5cLcoeWKstk2gaq2dpnHbw5xfnKTP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6666004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Ivit22lXmSLfdKl3yvMChIWdz1TTFc8b4yu11p9RchvvfNJH3FODtBaST0W?=
 =?us-ascii?Q?oyJq+gfgfOddv7YYsiSTiCuMwIUanSkX1BFBahRmyqOKfaTwC8DGy3QYnLZW?=
 =?us-ascii?Q?NUpMISsfJtP9jA3OLVt0JgxrlqEgcJ2uEF/hVzr8jo5ZnD92e+r7LfEMwJt+?=
 =?us-ascii?Q?+w+NUT1SHg126BjYUyXWxYkvju0zin9tnuBhV/+Zmep2u4m2NFWacG41+egd?=
 =?us-ascii?Q?HPwI6QK74r9OZB3UMIvOcl4X/jh0IoT6ljko+Ie08PK8wv18q6OJkUS2Nayx?=
 =?us-ascii?Q?JLdNyNyXnvZLTK68X5VKyTn8+8xRERuLuaOW8f17HVYpRcIpNnaNvYHuYNy9?=
 =?us-ascii?Q?nxIV4ARMH1u96pURYiDkpop4Gsbfr8vppnyhS5P90dK5756tjXQP0xIG3x0X?=
 =?us-ascii?Q?jzYUsJhv1w7swQL5Ony5ZFT7jYAJhpplRccBg18DpDcoUUw7RfUgm0Iv/Lmn?=
 =?us-ascii?Q?uDsLMre9u9uio+sUJQ9u/3nBi+qTS9WXm0DUDAjUDLe3xfkNDE5ohBx1jG6k?=
 =?us-ascii?Q?MpWbIsIboTvTAdlKEEsLKnoZWPeXNzhRqcIobfmWzeUAN5KQs9WrAU4cGEXM?=
 =?us-ascii?Q?sjeDMJ3Y7Teu7rG8f+DVKt8atzjnz5h3LP2NCCYNDwTPQvASo+fVdJddSySs?=
 =?us-ascii?Q?1AThhdddbWouseZf/7wb5rQYNVxpbXm7xMlB0Ged472TQrvw4h6l/rNNDoRk?=
 =?us-ascii?Q?BwfkKMIpRvNuOuWkhERrRF6svuWOrgxA9JaYZIEHfqMe4OPJ7e2eAQyybSdk?=
 =?us-ascii?Q?SGuw3jwPJhAR2o/YyEvCbq7LXEo7XXgUHb+O8eSM/iZxTdVllxywUDlUjaeT?=
 =?us-ascii?Q?fFaRrr5I3kCoT6zbtoFCTrQIzcQJeUHz8mA66braCdfgjw+Un7/0s8SarWIU?=
 =?us-ascii?Q?tOQpLg6YhV0NXUbGfscYdu7G1kMdQHivtuTtowXENgGZD7njSf9QLG+pWUP2?=
 =?us-ascii?Q?VvQLDqIPKeYx8Aan7QLdwoVXBDB4paciCWlBM/mufbBC5KqvfhoczYDGTVI/?=
 =?us-ascii?Q?9hjv+l5WHzO/4JRbYxByjCZw1vlPdlNTHLuDqGsg2tilxHFJGP5eVGcgDmrE?=
 =?us-ascii?Q?z1LflZ/OKfgYPZ0QfXgL4fs+1TSpoMlx0Clt0D8YUgmNtxJyvaENkAe/oPu2?=
 =?us-ascii?Q?DoVX0V50oIOBUaZpTK6bVN+BoZ/ZshknE+mHcmRROKgp0ucfkMLf35DknuLl?=
 =?us-ascii?Q?o3/N5qk34oQtpvL9jKW+1stZ9P2qnvxcGchZZUmz8DzXXtUOqddQDY4i49D9?=
 =?us-ascii?Q?KOKXCFgtKEqiL065PC2IJNpm2wb8Vr7yxJnjB/+P9dvM7PfQtCKAiCf35m/G?=
 =?us-ascii?Q?GZnzFoN4EjfkD8PZ+uZM2hVOcs5SJl178VteqpqkPijN9A+FAlw4BwX06RV/?=
 =?us-ascii?Q?6vpBg+UpMEKXkhulZLqBqZS31augPr1X4gpp7LI0zY6c6Lkauyt4/x2oW1i4?=
 =?us-ascii?Q?L9gs7UVjTu4wVPYckT6x/QW6roQjzygWEu50A0z4S87AUArADMszltfn+AOX?=
 =?us-ascii?Q?kCWape4g0XHx3kl9A5r7mZWP/1QHBxf/S7y7kOnkz2cCKMDHH4LIVZSeaAss?=
 =?us-ascii?Q?AiPwkOIWF8lyfJRv81LRUOXfLbsEx0vtRzImHkEu?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15a7aae-440b-45b6-7b3a-08da5744fff1
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:25:09.1004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYiWh2bGptwHWKrD3wQDrvu+CLE2snNaC30x19IWFX4wqOKQRk7dX4haHLRmZpngmWaR6UvMcXI/VLNDZG1iRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The vendor has marked the RF filter enable control as reserved in
the datasheet; remove it from the binding.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Clarified commit message

 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index a3a1e5a65306..6180f7ee2284 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -37,10 +37,6 @@ properties:
       device is temporarily held in hardware reset prior to initialization if
       this property is present.
 
-  azoteq,rf-filt-enable:
-    type: boolean
-    description: Enables the device's internal RF filter.
-
   azoteq,max-counts:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2, 3]
-- 
2.25.1

