Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541955BBA0F
	for <lists+linux-input@lfdr.de>; Sat, 17 Sep 2022 21:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiIQTJe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Sep 2022 15:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiIQTJd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Sep 2022 15:09:33 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B421158
        for <linux-input@vger.kernel.org>; Sat, 17 Sep 2022 12:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b92DDz5TOXKJCPFmRp6uNuW2u0YaEhSepBG+QgONKNmL878KPy2ziZ3C47cvfGgkDIxY3BNIUmzRbmJZjyAX6+In+zhgJC5HILwUKLfudM0bk3PK/QHSd1a1wiQnC7Hylk4h35RGIfOD7T6UISDmp92fIUxc+fv3y0r3ZE7N6tmP3/dAZ79hKlMLTSHBPPQM0/1ssngqm13KGdWwYqw9+Xw9H8MjDuakeCBuRKMbETj44w9D6KohgfRl6t+xHY/c8+wyeCxEid7I9RbyGJ+yUaEvLBh3YbKO6nptwj2SIpsgI9t3tvdpG9t14ijNaKZ8sAXlUfAfsG//U2yOVvWbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tls5mZwA3DxAh4Or77b7XzuMhDryXqW0C0VyiMjAKQU=;
 b=fEN1B6i9rJYwK9t/1FDhtLZduWeybK6zwqRzvz9sxX4WJhf+9hPeztX10pnhFVD0iiBuu1QvHUQ8AryDi5vjH3qzrarkYuAsU4WaFWTB0YtTcG11Vf5NbMI0dKfEQlayiUvIAdwhaHjg6OFIvE/yHBKohwoLkPSOknaGhzYA4/AmdJq/A2UjhCt+7pf7YwjWzEzP4UvZlzW8yMFRa3AqS+rjF7MHxKYsF7x3JonQ/Hvk6arQcOVbwNVR5vMzJ7aauHDln2BGur3FaVc9qCuD3OqwHskHSK4KOIVkpfPjWcXrqN9cctPb0i/yFNyAf/tqpWDk8rJJ3xqJo+lbndWK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tls5mZwA3DxAh4Or77b7XzuMhDryXqW0C0VyiMjAKQU=;
 b=QpxWsa2/oNRffjeBSOKG6bcT7O/DOuU2iGtkqXq0iz77Ix3wrxVlWmtXvjfuTjEHHWtnkP+Fw9ygY/V00VqR1Bxk0Ea22p76OP35YEQED6LdnYz1vFM40GL7RMvpoU8Pl1J82ZZL47s4rJE+UjNH9QDDBH5/amXG7eoplicQNK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB5113.namprd08.prod.outlook.com
 (2603:10b6:5:4b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Sat, 17 Sep
 2022 19:09:29 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee%6]) with mapi id 15.20.5632.016; Sat, 17 Sep 2022
 19:09:29 +0000
Date:   Sat, 17 Sep 2022 14:09:22 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH] Input: iqs62x-keys - drop unused device node references
Message-ID: <YyYbYvlkq5cy55dc@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: DM6PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:5:40::27) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa5bb39-1be8-480b-fba8-08da98e024eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yolDteP4jvFGrPN/7NQtSTcakSSQ3mpsRPtCez+nmzS1dRMyZwxB+fdxIQsZZqdUTbuCJoAZw2yxpoSX1ZoueJfHGSF+T/KXvJ5bYU9wZCQPKvWYTNng9n6RWsbsw6RYi4AoLKMMXd9KkFE1cB0q+/7xmGfvAyPqjlm1eg8BBFVX4IWm6noL38CYZ7ymXaoAI1kFclikUjSIF/VNQOiVdP0dPNAgIb5kLx/v3zb5gDyjR+eUWgBCuM3co6Xj6OUSM7LV0/iPxIB2qIFt4RAYWTL8y9yHF10MQQILuKa93rHsJo7Nm8kiglCdjvuCBh0grlE/JYS9RyjknHY6sLiTSTMmtcgERR+CLjsh5VxRHajqwk0juRewaJLZ7DOEpcYFwgqwQ7h6PIi+l4KUP7J3BqNjV/RgWpQvfO0aPZ/wgdrd87yJmeIvd2KZVIqZBxRkGhgt0HIW5balPTVbme0UGs/Vcx9r6qmqn4s7oJlPSeDr3Yqc+u/mktdG2/9vN5sd2TBXhyxt5Ljfp+x11F66IDjpgcVHEQmn7+Z99LIodgtTn8AERcbacYQkYKa35GNvY+Ec6thzvWVIqrE25D7hF86IXIVUkZksHNiYwOPG1rIIRLQVppRsT6BaFvdn0w35GNgfvuKGMF204xv0iUo4kC0SYB4ZeZwahYKn8qPOYdJD3EsAzpoe4NfhJBRMXiQY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(136003)(396003)(39830400003)(346002)(376002)(451199015)(66946007)(66476007)(8676002)(4326008)(66556008)(5660300002)(8936002)(6916009)(86362001)(316002)(38100700002)(107886003)(6666004)(41300700001)(6506007)(6486002)(478600001)(186003)(6512007)(9686003)(26005)(33716001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4hGdcGvUWtq7Mqivo0ksjgcu+efQkT66MBKCeWYBWTdjX5FxtODIS48APs07?=
 =?us-ascii?Q?jP1XNGKJye29GYscf6LLVQpqB3cxP/Afp1n/QlFKvIyLUsUiUt71PGOXMrGd?=
 =?us-ascii?Q?uP3qA8BVkC+1D6glVUYxAG6uaMloWW3K/kj3gRpzspDMeEHGbEpAcTLo1G6p?=
 =?us-ascii?Q?9FAdU3NNJquqWCzjYWOTRhVEGYZDthw1Nx0SdWp/eHc+3YNKO3lmn5MsXUUC?=
 =?us-ascii?Q?Lpet9Rn3c8wHHQXGiXdR78dXuaL18+0wIh6Oag+EKkfaVTef5Mg2Te9F2SY8?=
 =?us-ascii?Q?1QVZ2NID2Wuka3oiX4z/HqXdLEYjW2RAniCrApUIweAepdctQl4rXXA4QuQ1?=
 =?us-ascii?Q?vM0zEsGtX2cfyirkxLqiMRRSYR1x9CPmI3yMELecIop98kXPlZ2q4mH6kyvL?=
 =?us-ascii?Q?lQLcpTMYOg+XPEu8TBcQUb0upHxBgXtXJosxC95ZCuWmAfAB576tN6u80Gsr?=
 =?us-ascii?Q?hlMp/cZLU4cZBN9JpQVE7qjTPjiIZwCQmn010+n0WRRgBpP8sldOgHFNCAuj?=
 =?us-ascii?Q?k832cK6HqoKiVkbdx0Co6DBgcAibCqNACfjfPgdtYw+7PHNPDwzlU4vAi/7d?=
 =?us-ascii?Q?f5XTzgnOUrr5S56+e0ja8HuB5yAk4/s8SudPCj/YQLMQ7u2QobTzPlFA7LS/?=
 =?us-ascii?Q?S7GvOiEGjNZ0PjvdgU7VMgNOss8Arq/cPnUu7yUey47+w39pG6Rf6XhglzjJ?=
 =?us-ascii?Q?EOotfmv9I7Te+s6EFF+SehBEKpCpQJP8NsfINIIxNcSApfGdppfuH1MR1XfR?=
 =?us-ascii?Q?zd1+zuGTncMi0TAfgUqAS2pgySUh8Rl+PBJ/Xomu+CPGf9Mq6JEU83AHNxXT?=
 =?us-ascii?Q?QJS2l0S7GtK/1+GgKtoSgWtIuEbyq6Epq53v7Uqvs9fq2rLqsV8BKqgBmBP6?=
 =?us-ascii?Q?CyBe0BjEl8cOl3rHjajrfwrTH313PpUm3UyobDRoGmS/bTby+nSpe0cOk+Js?=
 =?us-ascii?Q?r0T8Ou4wx9z82H3mN6PR5EtSDRZiXv+n0IZvonUY8RrxNX5ozIEOdFM9pPSq?=
 =?us-ascii?Q?EY9x/S8Vocf56msdYHAq423pRq9UJE8cQojG1XCE8smExJMRp5D+gFB9LoFB?=
 =?us-ascii?Q?Hr9nIZyOIKOQsUaTie4K1W1n7OI6Rpv6DkgMCJ/CF6TFwOIB6XueCqJnCcEJ?=
 =?us-ascii?Q?inRa4SpK0aTkrtfVKaJFaKh76ViLZOQbp/WKiqu+fBDCUiKoPLrwvQwTbXzs?=
 =?us-ascii?Q?iDmTezwklfoWlWoCdAjavVWOBo6jwmvPyupiAl+tzX5qkRy69wJ2DOhabRBh?=
 =?us-ascii?Q?iF04ASG00lAPm6LjVj/qSIIQMHeVjnS6VdNa4kJEM9wAq0L3+M06ctoq0iRJ?=
 =?us-ascii?Q?0QhTT3NqbZSmdI9qY6YzINCCi5RMzcmGsK6CVR6pD1ejUH7UPtJFWY41NLyA?=
 =?us-ascii?Q?7SBL5dJzQwHDNKTqD/Lno45pSJ6u2SDvLw44mDAu7OnH6zkeuty4b5kPIiJg?=
 =?us-ascii?Q?hcq72SRa0kieu6xYb0NIuUEAIwoMIDTcMF75xo6JOnapKbtbI2xH7V9weSDY?=
 =?us-ascii?Q?ovXLAw829C235rTlLzu7FeYRIk8HvVLIDdP7o3vh5QnOTw621wAz5sJz8Y9x?=
 =?us-ascii?Q?mAFJr5XLpEbULC9sjQbXiAWmnApcSnHBV4L+l70y?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa5bb39-1be8-480b-fba8-08da98e024eb
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2022 19:09:28.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sZm/Kx9ES23TGE7Dzb5HiOaQ5qi+5QSGI+0tyDJbihUSxNELDO9qU2zA48y6j0TSrGqGvZxeya96R9EJd2wQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5113
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

Currently, the driver never calls fwnode_handle_put(). This patch
adds the missing calls.

Fixes: ce1cb0eec85b ("input: keyboard: Add support for Azoteq IQS620A/621/622/624/625")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/keyboard/iqs62x-keys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
index 93446b21f98f..db793a550c25 100644
--- a/drivers/input/keyboard/iqs62x-keys.c
+++ b/drivers/input/keyboard/iqs62x-keys.c
@@ -77,6 +77,7 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to read switch code: %d\n",
 				ret);
+			fwnode_handle_put(child);
 			return ret;
 		}
 		iqs62x_keys->switches[i].code = val;
@@ -90,6 +91,8 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
 			iqs62x_keys->switches[i].flag = (i == IQS62X_SW_HALL_N ?
 							 IQS62X_EVENT_HALL_N_T :
 							 IQS62X_EVENT_HALL_S_T);
+
+		fwnode_handle_put(child);
 	}
 
 	return 0;
-- 
2.34.1

