Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C095B1E6D
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbiIHNRU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbiIHNRS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:18 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC8A543F3;
        Thu,  8 Sep 2022 06:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jszct8JXW9hRz6r3XfvIVOOgNzLi5/VqszIGIluD8ax0eLwt6PFh8eA0VkGPZT/YcXlzqDmNAI7PjoPmy3f2fyOqv55LEFxFWBucX1p9NwRE8m5XY/HKSO8zpmPKpjrWGcfXg4YIberIH5lMEBL6Z/KrNSCmsGSpozR9KKEVKZJiiJTXACweirtT5BC7PixM+GxO3dKC/mrVpV2Rn/DeVBAtjAgHWdPpnYgxURkqglemTZO6v3bmYEOYDstJ+f0CP9Uurd3vEpjkVhPR9viIBBPLI5CnyBnlRn3ciq2tJWtGGMwuUFtZpmKtnDA9xyl0opNVaYgikenzQWmwd0bGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng9dyBT2VZrfGrq/+cUQ4J1kQUoaP0TBt4gmjx1F6BM=;
 b=YzXygjHnt+v04dMHQnAX86l6bikuXsYmV/Is9WPqXm5dPnggCjPeADJ0xQAUGHUU/iy0j+Vxsiu8mUkw/3x4EaszsNkXd79+J1GNBn5G/VZDxLwUSCbK/gEF3EfWumFi1Gj/8dPj419sC1eCNsA4ydX/C3ZU2wNbeXA55Pc22LfIskA8qV3rUmSnJ6dYUmHKYW2+YdETddhE8r/GJakFBsz+65A0NQQWIaAxJMbtFFUrvospIijXoyRVaA12ZvDiyh1H4SqedqonuG9joRjlhqbG+FgvGG/4GII09A9Y8o9Qy/bqBN8E/5uQ0lXbA8e3XQu6hiJdatVKIqLUQfXeyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng9dyBT2VZrfGrq/+cUQ4J1kQUoaP0TBt4gmjx1F6BM=;
 b=rJFdsYronBZZjKHRJDsejO5zRZdHb9NbnHKhmYSXTDiqNResSubRVjEx/c794Hpn+7RbpZhx6RKjZW3K9ltXdAqIAOka4VVWm4ecoGuGrCF62iuQI66TsC7qApQ7e10pmJvdBvssh5EvS93jLbcCE2B7zGzXFj3bILzh9q3x60k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:15 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:15 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 06/11] Input: iqs7222 - avoid sending empty SYN_REPORT events
Date:   Thu,  8 Sep 2022 08:15:43 -0500
Message-Id: <20220908131548.48120-7-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: b7825e40-ddc5-4979-1f72-08da919c72f2
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fbC3DOY7WtAzQRgL7HryyZUeAyCbyrZgLRwt6nu9ZPyTnqWw4C3qGAN9KZM6WpvnVe8ghYKo+rMToJjDrS1AgGq+ShpwP7YkrYFMLuKfldy93RE9+lUL0rhMe0K3/iU+s3XK4OhQRaiMj/j0WfbOo+qKTmkuiTcNhvpzIHlAAhhjbumDN+mxJYsVwgF1k+wAYlV9JOdrokN+No7NnFzxCl5zVZl/oQWlIgkGtT3/P3tlXvRjKbOw6f60IIRAClTnnZUmx+lum5qpa6o7xkWrNeYXUfU23QhnaRDrNCnkRzsoVPLbt0DUT0FTJF6/1ThKYmccUWud1RNyximWKSBOvr5Q406CB5YU7k+fb29ypawRnqj+lUveFESYAtK1TEmDkrYjroD1EkSlkhUMeV+Y6j94Qk5s2o1tAVVU4PzEjYQXv7KL5jROgiqrbOTmJp/hwpOfMG3TcZoIOfWL9eSliIXP/U9yAGlcnCxoYXei/fyXYHYQt80CLHIDIVoeFD5Y2iP1ShE8NDkQpzw591kGhT3ceB6NcELdQ8q6orK5nFLdxT055DQos7yCN+7LKQVrlisD5D3jw/0RHNtamYl4t6kU73bXlWacAMp9eWkwQjEV4oI5vixuuqCJQeDFItQCXG8YSSUiiqjcdnj2plVlPWt4xjxKRAvwqUmqN59r6MAg8SQ1Uhnu29dyEJaexeBQuL3yahiCXtaFEjJD544X5eLmSjzagC7HeadgCqn9XPc/wN6p/Pfx9F8IBjuVEEjonI85DbcYScbMG3bbM+t4Eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(4744005)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JoAumco5+MofK/WYu3hBxSvLIbc0WhASddZK9FnqQNrpiwiSUR89t454B5Rg?=
 =?us-ascii?Q?jfDPf4ofKse9TamwkE4nFa2KGIQpfb9CCX5IsLEtb5n/lOxJdutTU+HmfJE2?=
 =?us-ascii?Q?xBBnWBLizdrQWg/DuAi1CwhRmZuiv+6XxPUICskujCBbK3Jgm/PHrINHQsKe?=
 =?us-ascii?Q?LRys0F81cGesplnPeCBVVH4cjtPGs3Z5y986wftnw09fgFN5wqTYsr5F1pTh?=
 =?us-ascii?Q?N5VAMp6HfKc73+FNvJL2Nv9dLnGnNw0Eqfe3WbyhKa3+7SMXRqBf+Z8hkPS1?=
 =?us-ascii?Q?NVL+SCApTksBxcSYhreE6DBTo2yZcUjDc/HXRYIBgMdRGgVopnXyL8ff4h9C?=
 =?us-ascii?Q?OmWtSELAue5cB8oXik85L9RsCHWOexkpc0AWVefFCib1K6z0GrVnmNGF4j8/?=
 =?us-ascii?Q?n7e2rdjiuybS1B2/i0XafDQ3kHPLs82ngpy72k/Ck+k/goO3LgldPgWCMof6?=
 =?us-ascii?Q?fBA+JEdzSF0cp37I4BQZ+aYFlHHfF9WyvY8syd1+E8jBwlxp1VZePh01H+lH?=
 =?us-ascii?Q?BbyAa8EDTJQU8gUklmTfUW8Xy8TyK1VYCGknNwdTd1NbllloWybqCHcT3xhQ?=
 =?us-ascii?Q?5hgU3Kefh/QGnys9KzzQGF3Yj3KkFEO+Hwrj9j0udhD+OZqGDJz5Gm9gHwna?=
 =?us-ascii?Q?wxf/toRKDdn8hr0yqNB126ESmxte6Nps53cf+m9cDqPz1UiViVkMRWgxJ3rM?=
 =?us-ascii?Q?hRQlJby4QbGTYo2/t4jUZ9t9DV/c2bF2AgxyiJXmcaBpP3uOsQ6I2BokGQ8P?=
 =?us-ascii?Q?E1QfElk20S9bJ0fekY4rDuwgbowR2rFfQM3MpCeyTJuZzFYSPV5kY0dTCLUR?=
 =?us-ascii?Q?VKEqsrvGEvJyMSEn3omI1vVppbBf6UZd+gyHYrq+9YbVqMPnOOUolftYjw5z?=
 =?us-ascii?Q?9sGn1YgT+L0818M6amAMbLtBwqE+Qrn6f6xSOSymI5xx5pbuxRy9ra7Qbv3U?=
 =?us-ascii?Q?HZeagsDVox1Y4XAaOmvKhoWf+iF8Q2oHMrBTpZzpHHza7WE/9MEupRvLeEo2?=
 =?us-ascii?Q?2kbtjmdqVkn/j2NYO3u/sTtzdkE32ZEWu+w6aMP07f7E3xC4D+I3Fr6q4TNb?=
 =?us-ascii?Q?D++sZCl5lwXhjUvs0fGazr5KbIa5qKzUyupuH1MHSwqPPvNwCEAMvqQZGVYx?=
 =?us-ascii?Q?ArRymSKHOqdM0hOhpO3gnLAWQsBCAB53LzOcrKsz3ZfrJY7mrWiQFgE+2Tu7?=
 =?us-ascii?Q?8QAQvcahJKiAIAztm1mzp0FWoKD0J6oI/tK4uziuSCwnA8sa/+2L1KcHHhz/?=
 =?us-ascii?Q?yzzz5o54dwbRPnSGMSGoqtNv/TZQLvVYuk81S7HSaNLc4B7KbUjuxjC/RUYw?=
 =?us-ascii?Q?mXdp4kXenrkjPi2LvKZpJGrq93UpXsLVM8bnqOk1/PuC/BVc0AWfrLrxzvqz?=
 =?us-ascii?Q?3Jes+MRy46AXz3qnTMzM/uJb3kx5LdmHCCXMgUojcE6QTKVDqdvLIHc4sFKx?=
 =?us-ascii?Q?6he5tfRublxOMXUO8D3a3MQQ8OjevvGT9jnbF9W73KLZwUN9bEDuy+tFarX2?=
 =?us-ascii?Q?jlSFbr8PjRZ1FYhwtYneX2eD2Hj72JTZmZIqzJH+FfNk8CB3OrFCD1doa3lk?=
 =?us-ascii?Q?xO1lgSrQYz7FHthyLBAWNN9mMW4+clbls8lgXJ94?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7825e40-ddc5-4979-1f72-08da919c72f2
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:15.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hiz3JcGmtrqIE2+B3KhDqDTHX63SyzHvfwx1o6Z4aEHdYC8CJ7S/cGtHaQqV8uVNfI+EiTRpZtt+1C4bIZn1ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a check to prevent sending undefined events, which ultimately
map to SYN_REPORT.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 365e59f78f1a..00c73a920ab2 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -2427,6 +2427,9 @@ static int iqs7222_report(struct iqs7222_private *iqs7222)
 			int k = 2 + j * (num_chan > 16 ? 2 : 1);
 			u16 state = le16_to_cpu(status[k + i / 16]);
 
+			if (!iqs7222->kp_type[i][j])
+				continue;
+
 			input_event(iqs7222->keypad,
 				    iqs7222->kp_type[i][j],
 				    iqs7222->kp_code[i][j],
-- 
2.25.1

