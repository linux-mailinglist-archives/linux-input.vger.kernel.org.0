Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B5F460BD6
	for <lists+linux-input@lfdr.de>; Mon, 29 Nov 2021 01:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhK2Aqg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Nov 2021 19:46:36 -0500
Received: from mail-dm6nam10on2058.outbound.protection.outlook.com ([40.107.93.58]:56288
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231354AbhK2Aog (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Nov 2021 19:44:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTWP7rNBO00umafeh7k261nYM6vxImvjssOZ6fFIwUvUVd6HfQU8tWzv1NaSG6b/6taPaNDLScY6FTZW3rIyxClX+vQ2JkjuwNnG0R9NqXfe0/A8HEcJoUBdUd0xKAREAYB4YNe4wkqUq8Pr5XPs0ja4Fn/xh6H9be2yLwVwOmRZ0ROpO4uE7TMiHdXbN/vaMLXSByeet0HMT+RW/BQqvuPmLcLkNB6aBuKw+Wp1gO623e2EJrN4GAGX5us6x5Hs3b548v2Ofcsng6WLo3HnAyRw11lKkoMRTeNs54bcs1pHiLpJy0fGiyR/YmzNMoR+2dCPgG5W20JKKnbuCkkeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAPxkHKyo06m2pfmnuGDtIxUM3/xNgqSG7rgntkmUGw=;
 b=PdVGfOCLEm7Muryk8wbbMnFhazD5BJ/6QClDFxXAqRgTswDGFwNWWPPHDnyqrv8Utq2XXhnkWsm1PGTh4BaMUG5pS7j1eVG3mkNp7n5BBqg2IIpNMdrCN2xOU6Y3ehQjKVl92W0ZztVaf5/CW1pU6jZcNElN6Tk8OcuzZSjIhG8mo0VIK2CMNmdviesTHuJsbdOCv+haEZBWyW8DDKJ428SZrRxOKUWJ5YxGjhMS3IS7WvtSuBd+tMD/Ds6BBN46C9bP22/TbpxZV2ilxAWDBLbjma/8m4OqSExS9Qa7EmmJA8ugGZp6fDqXM+7hRRtACkh/dqoHlDPlpJOi+4KdGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAPxkHKyo06m2pfmnuGDtIxUM3/xNgqSG7rgntkmUGw=;
 b=nwdvfPywrHGuJ9TbtjoilomTNGwhuzDkNqZlu1WnO6ttHYCldLL662Vko3srInZ77V/AZs6D9gsKRAiTgqdrkLmGtbAGkiQPx5WCE4uQazaf0pOOGp6t842KHXdZIXSvzclTl04YIMjbNvsuuUnLVqsoHfxyLdsRcMTYYgm5XcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB5207.namprd08.prod.outlook.com (2603:10b6:a03:72::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 00:41:18 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::b015:39c1:b102:608e]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::b015:39c1:b102:608e%4]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 00:41:18 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] Input: iqs626a - prohibit inlining of channel parsing functions
Date:   Sun, 28 Nov 2021 18:41:04 -0600
Message-Id: <20211129004104.453930-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::19) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
Received: from localhost.localdomain (136.49.90.243) by SA9P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend Transport; Mon, 29 Nov 2021 00:41:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9f86049-4c58-4b4e-2f1a-08d9b2d0f4b2
X-MS-TrafficTypeDiagnostic: BYAPR08MB5207:
X-Microsoft-Antispam-PRVS: <BYAPR08MB52071CB135511F3321B01E89D3669@BYAPR08MB5207.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bcST0ZJQFAU55HSDy2NTmJGIPa3K3vI3syCyJfYSExnjCn8aEG/AA6B0aiccW1rAN9x7BmSLRVM4DGAu18suCZ0ih6czGYqpogs+s3g0xpWosSto9nsAt19jwTTHk23/JMw1KEqJu7nS3YMq2TCiA2Ct5jQGd8UDh1cRIG36iXb5nM1HR+oFu4yD0tH/1gowswqFpQIHwkiVHxDOQhvRzKK5u9nl1b5C9TYOouEZw6J4SBgC5EndWPCab3F7lSWo0yKAwHqsqkCTM35WQVfaqmPLZ7ehuGBP+VFAcmOBInqn/BdluHM/VHiGMQ1oyp3nabwoytlSLiZIYSyNcHJnPuyscc9qhII7g8Lv0qr5P0YOEU1u0Z8AZ3yA/eOyG4FXpuq5iW1g7uvqjsgjrGT27LbgOxmsRgnNXZr2UpricXvhjnhw2B9CUxPqCrutbbSWYc7XiQJjB/Nr834MFBcDCxtNyJnQds/xTMg9NVYdRwZYlBkdMHA1cTIgskoKy2IfWucPr4kedJIjdK8x9Tc2NEvlEFLpfVAH7+Gv30yyrJFeZiwaAss6J63JYzcsYvTknV9DEc/wZA9g5Cphi+QyPbE0I1jlVgJByXd1FD9L136WKdQDez3dGdhoFBGrrACmh5L6SEGXsrc24HpTm2dFjjxxVaaeBlYGjMGevzd3+4xN5sPCJW9N4vZEAah5JcnaV0NqulkEm/VUMhQatFuklw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(366004)(39830400003)(4326008)(1076003)(66476007)(6486002)(83380400001)(956004)(86362001)(26005)(5660300002)(508600001)(6666004)(52116002)(36756003)(66556008)(66946007)(186003)(6512007)(8936002)(316002)(6506007)(6916009)(2906002)(2616005)(54906003)(38350700002)(38100700002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NOqHyz3vvO5hc69rfRKPm5Qh9f5BusJq2ty+gbNUPuo0p+EU82lhz2N2SFjQ?=
 =?us-ascii?Q?4CZu7q85ntkM552x6/qtdbieNMRyXl28fsOu6o7rwvzyGl2urV2IioJmIMxi?=
 =?us-ascii?Q?wtpGVAr1P1pVtiVUEwmNilHJDY41nTh/f8RNuv8GUDRNavT2w4depYfrw9C9?=
 =?us-ascii?Q?MI1KYUSqjQw4eLgMmTv/EFU60rpOnrbtBs+beI2RqMGfI8o5EaEI8IENmltn?=
 =?us-ascii?Q?I/V0pX3gfFAd4ZLvqu85cYPCSeEgZw8IDCW2J7+wD9cKrnYhGkIie81XCiZk?=
 =?us-ascii?Q?l7lHPUVtDNT0djTTvCMXScvZdtNwIP5IYzt6MCdpabtvw6N/w41GYOkOIlZr?=
 =?us-ascii?Q?L9qAtY3JMMp5FSeQQE9Wwva2fs8/lWPp/q/TSSctiSBkywafNhK7KeTJYZQp?=
 =?us-ascii?Q?JHdAVVyVi4yADZGDF5ExjHk93gk158BbQyCQxK7OSPLORHEwy+lYsg1hjzp7?=
 =?us-ascii?Q?Koiybx1dhDeztTW/yyvNax5vie8x3J2AdPn0WZqouvLsgHmu0yDbkifZmpYs?=
 =?us-ascii?Q?Jky+RZirSZoIbUZ0ENRe8tdHOxoJsjC8+thwR8vkaDYAYB4jpAuGk5jkuCBt?=
 =?us-ascii?Q?p/CT/PflstPg66TWlSt0g1zEyKVmfWdtQoL1RMzAONwu2KwVTD/IjIpseUa7?=
 =?us-ascii?Q?Wg1C41kKQLVSQfxCqI3ZxHgUkfgh88zaSzSix9Kq9nUaLDNPQb2XEUXnDld+?=
 =?us-ascii?Q?TIE+uV40c8pKEh30FgH6crlVw82q6ix4UwUsDkFPt7GFXGfD7qCAf3IiWtyR?=
 =?us-ascii?Q?/emOjJDTdh+WFi5tDgo+o9x6EshFRrkpPTds+ZUtHWjnSyCVunQRSb2KnmiQ?=
 =?us-ascii?Q?d0I+r/P1QzjNiJcy0z1KFt5ITEQrBnWJX/XxHrtnEK90GmQf+wOo3ur3DrR7?=
 =?us-ascii?Q?p6DOuwEEAh4aS2PWfhFJ/nm3sT1bxVJCKRJefT7fuxY/nQYDG1QLtitWMIBd?=
 =?us-ascii?Q?uAmnVcZyqvuUlIvgJaqeLeDlu4u3Odt5OJelB0IMGRpjTgqmJDE/8TzkGtK5?=
 =?us-ascii?Q?qPEoXqHuB37/eSUU2H+lDwBF9sdqrbo6R8x7VD15iV0eaq+35o4Ptw/r6kg7?=
 =?us-ascii?Q?G8j4BY5coS4QapO89bwSuEsvRah1p3a+ZZBWENnNwBSiy0ObJI5mwUhzBUHq?=
 =?us-ascii?Q?qZXsH2Vp/mEkUiPWuzQGlTPaNapQmGj5fkhWS/gWpigJaj6UX9bxqC8/AnZG?=
 =?us-ascii?Q?+DAtduMThMGtH7ZkQQdR0QNu9oztVjlCAmjSkfjakGnSbLQfmKn70mtMvUQq?=
 =?us-ascii?Q?uDS0jFJIW25pP/3/95tc5JgQ1IJXUMfZLqLo2INyo4K2YQMg7NE/nNkDAJii?=
 =?us-ascii?Q?82mLpwq2nHKVLxHsZZuSly/MejzdEHgAvzCexncYGV0EHuvLHyK8XjdgsgUL?=
 =?us-ascii?Q?CRzedWdyTHM153iJJnzjZYLA2fnQFMGfGZJIufVl1SBFxbD1DwcbKmsDuM9t?=
 =?us-ascii?Q?ZsBcP5vO8ambcpft8958I6aFTAf7YZkblYiE2phGL8EGa9RRWSARw/PHa1g0?=
 =?us-ascii?Q?4CIKdpThr15ranbm7JUO98F1+44VJgokHO2g3QSwEBAaJSwfz7HvW1+D2RU1?=
 =?us-ascii?Q?pncEjiWMFWcvCuDTGhTpRnOEeoyitgjI7cFxPjkTa7LBFEHEjjGHBuuVXhxy?=
 =?us-ascii?Q?bdff12QVAFYVzy4jkFkCFeE=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f86049-4c58-4b4e-2f1a-08d9b2d0f4b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 00:41:17.9448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYqoCeSk7fbv/NkMwnFfS9W0slSZ8ZbzC2HOlVwKkdy0K48YyXz0p5t292q2eVUtsghvcOkHTqMI7SZx6+RpXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5207
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some automated builds report a stack frame size in excess
of 2 kB for iqs626_probe(); the culprit appears to be the
call to iqs626_parse_prop().

To solve this problem, specify noinline_for_stack for all
of the iqs626_parse_*() helper functions which are called
inside a for loop within iqs626_parse_prop().

As a result, a build with '-Wframe-larger-than' as low as
512 is free of any such warnings.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs626a.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
index d57e996732cf..23b5dd9552dc 100644
--- a/drivers/input/misc/iqs626a.c
+++ b/drivers/input/misc/iqs626a.c
@@ -456,9 +456,10 @@ struct iqs626_private {
 	unsigned int suspend_mode;
 };
 
-static int iqs626_parse_events(struct iqs626_private *iqs626,
-			       const struct fwnode_handle *ch_node,
-			       enum iqs626_ch_id ch_id)
+static noinline_for_stack int
+iqs626_parse_events(struct iqs626_private *iqs626,
+		    const struct fwnode_handle *ch_node,
+		    enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
@@ -604,9 +605,10 @@ static int iqs626_parse_events(struct iqs626_private *iqs626,
 	return 0;
 }
 
-static int iqs626_parse_ati_target(struct iqs626_private *iqs626,
-				   const struct fwnode_handle *ch_node,
-				   enum iqs626_ch_id ch_id)
+static noinline_for_stack int
+iqs626_parse_ati_target(struct iqs626_private *iqs626,
+			const struct fwnode_handle *ch_node,
+			enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
@@ -885,9 +887,10 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
 	return 0;
 }
 
-static int iqs626_parse_channel(struct iqs626_private *iqs626,
-				const struct fwnode_handle *ch_node,
-				enum iqs626_ch_id ch_id)
+static noinline_for_stack int
+iqs626_parse_channel(struct iqs626_private *iqs626,
+		     const struct fwnode_handle *ch_node,
+		     enum iqs626_ch_id ch_id)
 {
 	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
 	struct i2c_client *client = iqs626->client;
-- 
2.25.1

