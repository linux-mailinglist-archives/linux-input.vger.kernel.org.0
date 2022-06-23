Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF41155721B
	for <lists+linux-input@lfdr.de>; Thu, 23 Jun 2022 06:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbiFWErB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 00:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244155AbiFWDxe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 23:53:34 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784D73EB92;
        Wed, 22 Jun 2022 20:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYcHYEbNKqUxV/0orMG5J1fprFwq8jy2DNl4ieKDBPcXbANEgswkaEiWC4LGsxzsgELaZMYJodXkMC0UVZ751BxVIiqlPrZ3K1XkBHcb+8ZGWhy0oySAt3ZY6ouLj3fZ3CAZl/HJyD5jmKs25r/71S5V8x1i6IdG+o3A1bNYo+1VAVD9Mu/RmNh+Ztv6DaH5VrYdVA1HbWSYbeHJkau4WasuddQNn9ZIHSQfVfaG8mFH7aKNGmBGEQ10xAOy75h/xqpYDvq4xQxmCLrTF5H4MTRIifzE2UjoviDEWftTp20AhZtLBulxdXOaRYyW+YzW23D1m51rV89aDV7035h8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+simp11sJ4pfHdIpOI7ambFRw2g1+WRLvAfVoHlyQso=;
 b=Oj2GN+ogs1B42Hjm0TMxmjcqhDoGqJRKyLROtPG7QnpFT1Yobur2Ydn+5ldyttS47qz/AkqtDkjW3XqetxHlUu64hGj6JaBqIo7LrPun543LnBTRm2hG4tGGHePu3u4sqAhGvgo3fwd5aRlMEhqMqlwUacQAor0WQQihkIw3EfHBVkr8BZ7ppaaNhwPz+JVKE7ZWcz+5O2exvIKLMjZxBiEp9XbCrIzOKlf0RYJ8eWVZEN7MEmVzAL5q4eSOq/qf2AuIAB8IFco2DZ5tCiyJVdi8iowyApVKrdoBXxT4u5/v3FiZLWBAKONX7GPO6inRkYAXmvsWv0ZDZoONINZ5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+simp11sJ4pfHdIpOI7ambFRw2g1+WRLvAfVoHlyQso=;
 b=QK6ySWWq+qstfyun25O4iOXw5j6p2KRX0zb6mg16YQ0WGkFYGfRWMtIbhrinDeyTngUrJHhiYwo6czwHrabfW6TJHeGD0XMKY6LDmzut1rYoe8yT6s9nHdA+JlQi4to0pdpSJB/4VVgpIeEojX3pTYnon2foYH92tCfMdETPqw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BYAPR08MB5783.namprd08.prod.outlook.com
 (2603:10b6:a03:11a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 03:53:29 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 03:53:28 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 0/7] Miscellaneous fixes for Azoteq IQS7222A/B/C
Date:   Wed, 22 Jun 2022 22:53:02 -0500
Message-Id: <20220623035309.39528-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0001.namprd07.prod.outlook.com
 (2603:10b6:803:28::11) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36d70e39-ae77-467f-e633-08da54cbeeb8
X-MS-TrafficTypeDiagnostic: BYAPR08MB5783:EE_
X-Microsoft-Antispam-PRVS: <BYAPR08MB57831E0E0A086F1F95E63396D3B59@BYAPR08MB5783.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XoAkTkLzQbwwvLVvvuWm6y8LJZN2dYHDhTiOiB3l3k+VJ2kq+d38cQGqJtyFo6aDdBRar1jnDBXX+HljqalmJwmwQPq7BvAkVC+Z4dzrKtlVry0Yo5pPbusK8U+L/663zX5QMloM07kRlJh/Htbwv8lpewYKizKh7v4ja/jCjKpNR6U+Prx1T3iTtZgvTu1QHzq3+tSLrXaVmsZ8xaz/0iN5y5ru/7zW3ToCnOixwimW0THEMGZIkr4TbCjjXuI36WzKArjJtE9DR7MF/l26JI1O2SAXGyGxHDY+fWL0Zs4sL/bhuEjXaRFZmOmSxjHvBNghsPS0jWdmDf5LeDas0I0dkngInJC79Xn/NuebT9mtEQOOx3BOd4dxS6NeEqdN3LP7Hcc3A2u7+dl3QLU8+mA6jcE02CtaAOJ7lAxtKdjeqiIwADmnMdNHaL9vevU+oZwq2efjgLqcSAGW6iaucqKF3vtonsvNnzxxXGoDSwhcdT+lSqQ4fsOTUbwDD4GjX5EJsUVi2E9HCZuSVpLodReA6pvfP5ncgGyBfXLiUQiDwQsVICKxtw5ZqcvorcNBzdY3cJ2Eks/m276WoMWykEIXPb6r3iIZiKmjgZwQs3jDWPPz5zBObVI7qmjUxV4/p1XZWG14DhS0mRoE3vze620lwsJX/DEn4WTrB8mba1yx4h3XbyHaFTFTrTzuVNeHKiRFcdIfmhJ+lnBhshtllSrkykNXSsqnC74/wGYRTMr5JD+8ZtY/Mbg1LfhupaTQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39830400003)(376002)(346002)(136003)(396003)(366004)(36756003)(316002)(6666004)(2906002)(41300700001)(6512007)(26005)(107886003)(52116002)(86362001)(66946007)(38350700002)(8936002)(66556008)(6486002)(38100700002)(4744005)(478600001)(186003)(2616005)(83380400001)(6506007)(4326008)(8676002)(5660300002)(1076003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?//Siz3DLphGEaaohMqbd9W5Iqee9/oh88BlcvrARhcl8jV6J8W2Hy6+1mH5b?=
 =?us-ascii?Q?t6U+EDBoOFxoi2YX9lf+K1yOjN1I2SXjmmP99RM1Nx6CNEFs/n+IydmIgK0e?=
 =?us-ascii?Q?DGYdwJu4l9wy7YuFnltp6lFahkOcBMphzmnkVX529UJmj5pVb4JVDb83ui7J?=
 =?us-ascii?Q?YHI123mSqJa+XOT3bvazfU79UI/lEl8cuinzN4uQtesZ9JI6LxeTzfeBiO7A?=
 =?us-ascii?Q?4IkOoWz6x7KKZIKtNbZwukQwZ1Rw+xPodlFXQgK5AJX3UCt3aF2gRPQz+FM5?=
 =?us-ascii?Q?CShhJzHDaZz3V62QNm6LoueeNIxPZY0LAlaZTx+GFq8hX03VWVuGqzq7CzFI?=
 =?us-ascii?Q?IYA43e5b3wCx+EtAgkvGS4/Dj6iYN+3w4KlDeFGOVSrwvt5yCghibOz7pq/l?=
 =?us-ascii?Q?Ci6rPK4PHWXLBLaLoGbMgjreWT43uBaQomPC3Xix+TxluH6J+Y3Tubi+L549?=
 =?us-ascii?Q?tVKi/ypKWvsP3W6yE9Cw9u960D4QSle56xFvK2hnVxzhz6JoKe6BEQb49t25?=
 =?us-ascii?Q?NEbr6AnWzxoht4VNG+vko76FI79+MrSvyMBHCcitW8x/aGeUXmGfYtQ+sR4e?=
 =?us-ascii?Q?Vc6N6cr9KHy0hPeNyY3XCCsdawe4Tnh2emrbrxXrm2xjzJqyVuU7fMDGY54Q?=
 =?us-ascii?Q?pa7ajHJdAQKU+mPdHzbHWz1gjzQk+rwZ/+xEkO5afU4kViUWWqqyuydByZfW?=
 =?us-ascii?Q?O0E6c77Ns+s6EyoEqJuM4NzLPzE/KAT0TxyxGUiv+zQEjBJhint/a7Zslvpc?=
 =?us-ascii?Q?5ucpjcp2cR03gEE7MlUO61X6ZusaF55o2AR/HPHfzVjeq87WdJwLrqZlacUd?=
 =?us-ascii?Q?s2hYawNm4bYOiDpvSlKCUoH7MqFOci7doJV7aU/KmqCGpmwLJzVDQ/lfa6h1?=
 =?us-ascii?Q?+oqwqHFbYbig4+fAWRGBEJCoCgIqGv1B03cRdirtpIRF4+GVqvXYC2939RjF?=
 =?us-ascii?Q?BfhnJme9gddbqOF54SZPSH2arLqjrjGVAZilYZAinCNCer7T2Y5r8EzNPiaD?=
 =?us-ascii?Q?7NNw5JPZugc/oYiWJws2VzeEKeAgAGSKwo5gMH+tLsEJlv5kg8zwNX2DuuxL?=
 =?us-ascii?Q?zBY5sPCApOkspgCM5+Z3l1JEuBCl/3fpdBZJhs4xLoIZgkFokGqJfGpy9OZg?=
 =?us-ascii?Q?hXAbyVlp8MU/sl68RNZYl40by2etxw7Z+VCkKuzR/8m4ZkPbmykOseVB0rE+?=
 =?us-ascii?Q?ob5k92srW/gkJARA9bEwJMdMTaFdjibE2wL69V7/wf2Csvp6rN6SfIn1lp0Y?=
 =?us-ascii?Q?Z+SA5QAdebVibYeX7BvX5qqpN+2KYbFwdlLWsJtxW0rZs5S1N0pkPSrX88YM?=
 =?us-ascii?Q?wdJtjZqwUW54qWbtHdh9GknXa7Y0hmDSQyFCcHwiPgfB+4DiKuY7thiqr2Q2?=
 =?us-ascii?Q?vs2Wmk+p8TP8BWzAuU5P3YnVd+bBhaZXD3RdGJbnTP2B8c55fAAkeAJYGDbc?=
 =?us-ascii?Q?BPgp0qr4nvedc7y8b6Po6Y45z0cc5d0C04fzQbzVnNILsZs6+kczlZoE0X4U?=
 =?us-ascii?Q?PeUTQNwqIGMMTPNvF3kK59TOcsc0Nz9HYNGElZnIs/rQTPVKpSfIMxruvV9T?=
 =?us-ascii?Q?jSxp6NJMZ1tojYDeQ/gJsb9CRtSB8I9/E9isGItzJkEW8PlK41Tlywvwdo1C?=
 =?us-ascii?Q?P8raO3b292wkiyL5yvsmMZIekpdvTsAJxHLBBQiOzP9Z3NfYrK5sh2ahwoOe?=
 =?us-ascii?Q?PTc0gKMfEw2yOBwvI25xCodNJSD17HLGtkFiU1ccMyJMQQIcyEgoLeZRpk0e?=
 =?us-ascii?Q?yplgc637ww=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d70e39-ae77-467f-e633-08da54cbeeb8
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:53:28.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7zeYkf9a0Ey4xouhinusqCnWw4XDYN3v1SPGfHqqwz7x+fD0yE0paJiVKTcgahJ1tz8Fny7s8mnq6lxLBo34Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5783
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series comprises a handful of minor fixes that result from
continued testing and updated guidance from the vendor.

Jeff LaBundy (7):
  Input: iqs7222 - fortify slider event reporting
  Input: iqs7222 - protect volatile registers
  Input: iqs7222 - acknowledge reset before writing registers
  Input: iqs7222 - handle reset during ATI
  Input: iqs7222 - remove support for RF filter
  dt-bindings: input: iqs7222: Remove support for RF filter
  dt-bindings: input: iqs7222: Correct bottom speed step size

 .../bindings/input/azoteq,iqs7222.yaml        |   7 +-
 drivers/input/misc/iqs7222.c                  | 132 ++++++++++++------
 2 files changed, 90 insertions(+), 49 deletions(-)

-- 
2.25.1

