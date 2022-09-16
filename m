Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E015B5BA5DF
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 06:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiIPE3R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 00:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiIPE3P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 00:29:15 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2060.outbound.protection.outlook.com [40.107.96.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D927E026;
        Thu, 15 Sep 2022 21:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmXrYBj0gnSQF3SkLSvL75bxnTZOGq9unWcWSjrO38E2gQxd2jtaHnXg9sz/VTDwURsktmpGyb4gt2XmNkJWnxsAQme2ggr0mOh3DiaAcIwWJQVENU4ZdB3nKcLp5LJwB5tOyhiFKtKys0KRLYxxP3DPbXk3ehDtDAAkWigDZkdZrhFxP35DaO+nl6/88lfgfS7RPw/zgGL1RTi8VhiAbpHPF3fMr6L7OFluTwTYNW7EwlzwTKVT5RH3qw2LU2YotyYENzeo5dkiHv/7+gQL6YFLxcV/Xsb+0drgIFPxTpPz54v7ixUvJQ1ldIsvMUw6S0dXj4NVC9o+3goxlFsVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gamN7BYky+QLOkTs+7teByklE0UmujAL0huNfWDkqiQ=;
 b=cuDyuWjnfISp/JZXtYOTrSVYayZ50zOuHco0QBOv1QjgojGtp8Un7H4d0Ba+d2F83k0mO6O6p9VAjPDmMy/0GqNnr5w1XTL2Ava7ZxmrhUe4UQDreNwF6uP4qQ8ClpiBUdQFk1JPUquV22jNGT4t+RZGHMWJbelxBdaPJRp8SP5c9jESlUwg50CVepeLQEE73NqgZxDSAP834P3o3yRYaTf7gWZV5r5et+u/3Tzu22SPLXY/VcNu7KIbFXTl+ssDORBWiTh9BFStnvBO84XavC8Dp1Eo9/i2q+qUubOJ501JIsdhJlVdzazT8b+O4rmDACA/gSRwQsjqu+aQXtZg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gamN7BYky+QLOkTs+7teByklE0UmujAL0huNfWDkqiQ=;
 b=McPC+OVUrialc6S4EuXhL1JKcsIWInSuLnbOX2eQf4svjHXmPe0lHCBYAb+bbRk8J1wV5uBSA9ECBjAPaeqwCglR0XIZ/A8Rupprq2zZDb3mr5zzjYXDUpSTjbrBDTkipHMlhn3b3SvOXrXKL5K7V8muLbrIq5fdtIhqTss+cCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by PH0PR08MB7210.namprd08.prod.outlook.com (2603:10b6:510:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 04:29:12 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 04:29:12 +0000
Date:   Thu, 15 Sep 2022 23:29:11 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 0/7] Additional fixes for Azoteq IQS7222A/B/C
Message-ID: <YyP7l/ts6SFI9iM2@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: DM6PR12CA0001.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::14) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|PH0PR08MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 6891b702-66a1-4faf-ca19-08da979c0192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2m9/u7GeL5VWfvECbqvEU0F/YGRzIBn/hFsBbT3LQSPyo1aSKEDOIl65+gFglBk7Sdl6m/jRXygMmp/vt733UoPLtKQqiTOUWkk6Q8JsSSkaKhKupe98VnohFsLe/Z+H3llUgShy78pdrSBDshUMy0afVN5s5/Sk/ef8nODB0s4rc7cigHuafJ8PS6oGpDvg0KcqvQb4HZyUuGiqWrFhxI5W9DyDahaHNgszhHqBmJrHMecrbDMUmxk8jo/+VBuZJXILG1evu6Ktd/XIbJUwOyCH2f2BVN59miWlRqlxHYmISpqNBeG9pVxsiEYPmFXe6zdwR9rHvhwc6UcB2N6OCuIAuHpEh1CiihfvS2acB6gnW602XJb6HSJrZsG8yoGGkvyBnX5kLKTqluPNkpt952cV9WopzZKTSey2G4yPzT3HQ2P+g/YZGuRw8U+fe/kmezwVMptLthqBY4pRBx111s/ElUFfvYA/qq46bfSNJA7SNjFtCbh/G5DoRW4qzFWCqI3cPgHKZf28qkJBRTBTYk2/BPF1mw8kJjidfNDPm3tvAO80GTwbRdSA8ZfjXyC+S9HQ3K2+qP3EfbjZNynn6cdPlezPOcf06GCo2Vt8W9O9yU6ROc2EhFE5i5Ruh3XhjAB+IB7UhkMC+8UrgawJXQbaCQP4uTY+MZF2XZ5GspFJZsz08UN0uDtajQgu3P3pzUBTFRN64+356hNlNagjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(376002)(136003)(39830400003)(396003)(451199015)(86362001)(33716001)(6486002)(316002)(38100700002)(478600001)(6506007)(107886003)(8676002)(9686003)(26005)(6512007)(66946007)(66556008)(66476007)(4326008)(8936002)(41300700001)(2906002)(186003)(5660300002)(83380400001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CmPmaZpHsvFz/JJOUoa3WrSnRnm9G1W6lE68+aTj/1Tc+UeBpUb44j5lxgcB?=
 =?us-ascii?Q?dy/0wAUljAmP1g7+IX/4eFmxRt2RltxLgAbUyKCXDITbvvX58uuwXdPAZT5v?=
 =?us-ascii?Q?EBx7WdEs+AhztIRiM8p6WxjOUZ67//JL+ymj6OABPWdOVPiUGnrH6wPB87t/?=
 =?us-ascii?Q?MyKVyWK2r2sqkKg7UbP2oDx8rwUpl+tseb4PElY1ktr7X7ZVjYnelN0WVrSm?=
 =?us-ascii?Q?zQDMA3nbifAYmTAHklQ5XMdWRtfaQ3NBAjz+VfJm6qR4DuIOqK+KXNdS8HjV?=
 =?us-ascii?Q?VdOsR1hOmwMGSn4wC84Zck7HaNXNdTtKIURiodE1AeGDJZ+8DH8Ygx5F/VgF?=
 =?us-ascii?Q?IxQp9R6/Oos1qQO/glS9CuLD3QUoa/tOvsW1PNqnRSdVmaxjM5ipWBBb6xnV?=
 =?us-ascii?Q?EldqPAFICDXuxAIAAsNTEdCMbJ8QM2hvavRSrU6di+OOYeF/0ZfTznWsl46h?=
 =?us-ascii?Q?VB6y2Wn7J7QiSN2ccPbIeiHN+vTEe87BeXV34OgOxWqeYUB4bMuUvFGLavE/?=
 =?us-ascii?Q?D7rwGp2qyaO8sezAmoaztwtAciHK1tdBDpZGhuWPkZRDTfZSPDG+H0gxnHPK?=
 =?us-ascii?Q?X9R/OmaeqzpDe9dF2xUjOkdpPJjNHNNxN+F29GvW9fFtYXQOpjj1UZ9jGI/J?=
 =?us-ascii?Q?icW/Yj8Tti+dIUhumhw9s16uGXKlkpR92FvvlYWyaxH2kE4kn0VA9vP/0fKu?=
 =?us-ascii?Q?g/GQEDr0SbxXHZdbCBRfJWSrS381JKggoj8pwFCzeBmcvMvdI5Noy2V/Sqr5?=
 =?us-ascii?Q?db2/W4imRnCHfkFY2jubj+Huk121dMwx0GxsBc2xoWvWP4UQp6Xj+54Ka5bx?=
 =?us-ascii?Q?uTUzp81XjeD2tATy/ZALbwEgY3bRl0P6AMrZ3r5N6rroPT8jAv2g1kXXXQmo?=
 =?us-ascii?Q?uq/CL7Me0e4aDhOfeSYQz9vX4/8T7DJjFwa5rwId27Y2e/nkPEDNzxclHcp7?=
 =?us-ascii?Q?KVKcyqJMxrC8fPaaBl/pf5x0Fe6gLxzY0BdzHAYQA5rqMeKIeEqhgq4b0tGL?=
 =?us-ascii?Q?jEObDR8rgYgvEC1G5i6UjJoKyTO/a20poGVZ/krHOG0GQ5Uuk/TO4UaP5AdM?=
 =?us-ascii?Q?Bq88W4rbDbl3klrIuyt2BNStKsMOY58ah9BsbST7FvbO++kvlLQ4W8aQ9miJ?=
 =?us-ascii?Q?Mxth4kd55oK/XjPrqadwqvglDJeJp0DaB8ESMX4bv3x+yLtm+7EYASTWNMHT?=
 =?us-ascii?Q?Eeh2n65m0jV+ZC0AgMtjfYO6KLe/pKRrZbtEOyoWo90ow/1j3x4bm+KLxH8G?=
 =?us-ascii?Q?00p4RIJprQ56gbCXIf5IAVsqzXos7WDU3DpNNK9csCFjH/Rf26sATVTplVqv?=
 =?us-ascii?Q?+T4I4KYogmjNWo2A+z56ws/JnwHrjoHPkbJrnZ8LpO1o48Yw3q/5Zvsjf8Jp?=
 =?us-ascii?Q?3UGXa91EquTvw0UQgFx98EP5XzlQamFdtQWlXexW+dH09c+xOXfnb+Vxegxo?=
 =?us-ascii?Q?Oqy9UWTHww4guHQSmDCbeSe7W13ryQJNUbxlS2HB1GXK29QoFFE91thaN17o?=
 =?us-ascii?Q?y7dxXq/gE4crbwyWlY5TGmWdlBHSxlCs33/n/JC1oKZYIScHaJD/GyOCO0A/?=
 =?us-ascii?Q?9CZMdquLQpEUCVac+NkaV2s21X9VztfOnYqVAKV6?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6891b702-66a1-4faf-ca19-08da979c0192
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 04:29:12.4529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kBs6Pa/Ld/G7bjzf6KV7y0XlS5nfxk83pau4f+aJxRy7GQirgAkPw+nhSwUONa76z3m+V5/wM1T3P+NN90Zaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7210
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series comprises a second round of fixes that result from
continued testing and updated guidance from the vendor.

Jeff LaBundy (7):
  Input: iqs7222 - drop unused device node references
  dt-bindings: input: iqs7222: Reduce 'linux,code' to optional
  Input: iqs7222 - report malformed properties
  dt-bindings: input: iqs7222: Correct minimum slider size
  Input: iqs7222 - protect against undefined slider size
  dt-bindings: input: iqs7222: Add support for IQS7222A v1.13+
  Input: iqs7222 - add support for IQS7222A v1.13+

 .../bindings/input/azoteq,iqs7222.yaml        |  25 +-
 drivers/input/misc/iqs7222.c                  | 489 +++++++++++-------
 2 files changed, 313 insertions(+), 201 deletions(-)

-- 
2.34.1

