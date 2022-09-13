Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE325B7CB3
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 23:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiIMVZR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 17:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiIMVZQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 17:25:16 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45ACD18B3C;
        Tue, 13 Sep 2022 14:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN2iYXs+93MW1NUbyESFl6nVqVt3C7dvAunmYWLt3/eP0XUoe03GWXbtAe43IOQqE/WDhDOTcy7OArffd4zGfwPYYcktVb8Wd3IOghExlH9zZX5hSZ+tDpHZu3+mg7Pl1zd4IF5xrvFP6owMvlYBRWAq0uK/76NBFiypTnUYVH3xn4ROufa1SNfHPvGPN/RlSRVrYIjaqYWE0hl7rgsZ89vuC7IYaqKAXOrzGCQP5XCzjTUoEfPp/ftsJ1AZTiK5/aOqA9y1FqlFP8C7LoAHmg5nzyEhN8xl8CzRg41ZRJf3WwSoW1nAhDK5mCRUkgaprVe3VQBAiQ2ek5/z8T1Ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ouyac4I5wk39sHMcoNC7iITRa+uMNwC5cY3C9kPruTc=;
 b=JCyZHfyCkF5RBtB7A/ak+uyq+579RgUyHBR5PwrRnzNGZdb5mDMrynkjo2peqEvOJBObFu4K/+U5q+xXRqCCxzO70xz4pfg+FGiUw0vNdTtV9Yvf1fvt4Sbrl501mvc+XXWf+I4Xcu3J9llIGN5Ijd6gW4gW5cqIVUgvIYhLYsJ6G3pba9KnnNSYLm/hsFjoAY37N94sXj++Nbvu7pm3IpNlBY5gGMf25ItgCXuJXN42XtJhc3ZLtMbVBErLT6/mlN0AWbB0wzOGbeW70bzopgTKNF7MTP9SR9FHKAUh9vy9TfEKPLS2bnDVgyHWK7QNSBW03SbWtJK2juJs2jNbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ouyac4I5wk39sHMcoNC7iITRa+uMNwC5cY3C9kPruTc=;
 b=S6r/D2k0UIysgewPLt9226QuPKEjbmSIEUnxeGk2u6QhuXT+uhVQ7QI/XemGNnSsWmnni+OttOE6MGKHDRORS7pq1qAFuazRqCAiZpmytlmeeGY0MmhuaBcp/n2HgfXxVwXiud8SH7MF1tjloziv4ou664EE0VdZrHMlukgWMDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SA2PR08MB6588.namprd08.prod.outlook.com
 (2603:10b6:806:fb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Tue, 13 Sep
 2022 21:24:58 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 21:24:58 +0000
Date:   Tue, 13 Sep 2022 16:24:54 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 05/11] Input: iqs7222 - trim force communication command
Message-ID: <YyD1JmuC6UH+DDHG@nixie71>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-6-jeff@labundy.com>
 <YxpdeuPAYiSVjmO7@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxpdeuPAYiSVjmO7@google.com>
X-ClientProxiedBy: DS7PR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:8:54::18) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SA2PR08MB6588:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab24c02-0ee4-415d-303f-08da95ce6886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuQU+Lm9/3OQMmbh9tt8sqm4Zfs6dDh03OIgyQIdXnGodtGNy/Z8R0QQDnrDUExVn6HEj1SNzkxBg0ckBxFNVHaJwYCVeo1i9CNk4FXCT/LJ0KZJcEGXKqhg+5WSu6gFMjDxGYoG/nsKT+txFFmpJnZum7wDCdbzr/aGbRMp+Ylbq0FZyPtNbRI9bd/0i+ZLSrVXM4RegdQTl19FsBrWbjT0XsX/XaNnRkWhMRd+/N3NvK/hVCkm9hb0F7+xIh0K4/e6THDx2bP6q4Bn3wj21zyMATfxkgZ975I/5PBWHmMJTAGI/psHCtTCs1n+k8LCzUraCvAyAqP0/+rt67dVziuHFHsZR+J/Prpk5mREQRnXNyx9GWcIRxe1erKLQutukN1QJfat91DRP08iS+pa2e7jBhWET6mZvqdA+b7oW/9k0fP0RaTo/wxWpfwXVg7HvfPYVf/Gpx8ue5M9wfmxzxdqp1uHtrSlqQEH0mf51ShEYqJwBscadEspyk0lP8HttdyzTvSR/6UW77dtkssa0dhfzB9zLG4V7aIfMLuE0vBfwNDyJ8Oqf9yXEsRckr+8NLth7BI8tM0tDhQNJpZYWL2TZcxpFmU8UwiefWzlz3nr1gTAW6nhgbR70o1OOtEy7W8ncb/RhsNDiLM1Z8paYlxYd96tcFFjocUlAN23bpOehJ1D1ZyBjapJ5CBosnqgFUlRg7ctiLHun8r1bp2BxfeDeIl3eMLEhec5FCwpYgLTPHlcYUgQlkiOSNS/8tj8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(346002)(366004)(39830400003)(136003)(376002)(451199015)(66946007)(66556008)(478600001)(4326008)(8936002)(6666004)(41300700001)(4744005)(6486002)(86362001)(2906002)(38100700002)(8676002)(186003)(9686003)(316002)(5660300002)(33716001)(26005)(6916009)(6506007)(66476007)(6512007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6EgK9TR6DY++zhtEKVYvSsiQZY5J61riKq8pMi+C9IIyKUsOJYd7cP26X1ox?=
 =?us-ascii?Q?ATYK97aJqB8RgaF+sm7LYPHlGGbWB6mUE+Dy0Y3K3bWGL0vV/s/JwTP7E5mj?=
 =?us-ascii?Q?cxOr6GZSBJRgrKnLlAdXDA66iT1YtAni4fru/u4Go6gYvD9lA+TowsQypo9n?=
 =?us-ascii?Q?QLYhoMbsUWKQ8XV6QFyRzulKx94tkQxdMts51b5QfIUxKLode8k0tvhb3n4u?=
 =?us-ascii?Q?c8wQf/77x8l7Sl2pGzz5CgWpvKDsHfxrv6z/cpxH+XRFvE+7UK6LDo2Gvk24?=
 =?us-ascii?Q?QtfA4Rl96KNtbDeYo4+5b6KAMcTtgJ5SFJXjL0kaFGBYbf0V5L92y7Op/SoK?=
 =?us-ascii?Q?jvgfnBSRgrIwAFswjSUQKNo+XRNRc4xX6D3jLGzYUDIR4TJKdhRM/d5EFuf+?=
 =?us-ascii?Q?mAHiAO/q83I+HJek9dK0y9C1bhJXWQ57SXEWLIu95K0+r6hQyHCsYOlJqwWP?=
 =?us-ascii?Q?druIR7TBhN67UIjFusqUh/gZGTCwo3zCuX4sp393ZhOfMC6GyAypl1g3tHNU?=
 =?us-ascii?Q?H62qi0nAH63qJy28wSZEWGCrPjX8q5oY7uCbhKCDw5Hg4jjVkxBLqeT/aYkS?=
 =?us-ascii?Q?p+nCMggkfO4//4JLlfrN4Vqhpg+XMA3SGHfI7/v0zr62YEso1CWSCZqQgPmQ?=
 =?us-ascii?Q?kZWjrgtGdkrq0AHwBQsnSH+CPrROJWDouLsvycWTsaoSR6Hn9OVgagF/pmBz?=
 =?us-ascii?Q?Xu6hc1+cMgqwByKpfftm0m4Qum/77vpZRT82Yvop6SVM78PT4HcXt9dnNLfO?=
 =?us-ascii?Q?fRarULI5jqLbXyAZZKlqKlGlLegDBS/haji+JGjYiurb2AzMYPcWp1stfggl?=
 =?us-ascii?Q?X39VZyYqj15pD4gmxNEyoM6fx0Xrn8dJfaY5gE/3rV/bA9pg+zrWRMAEBwVX?=
 =?us-ascii?Q?QdlcM/4aTVuw1cSjZvGzQiHhot1UC2cHmHkoSPhyuINzMnQkmsRaaUA1+djK?=
 =?us-ascii?Q?/k6rzj09q4A5l0xnGlRf+Q8kJ+KIL0U/uRHy4VrVfmb7Z/cC2yWqFA9UgfuD?=
 =?us-ascii?Q?J3SBesx937TYlRE1fnBB6RETVNBQJR1JgxASi4CfvY4oKKgGj8diGOKe9GuF?=
 =?us-ascii?Q?iZKOXXprlh7cfFB318jGkoDa2mnKPN/aQuhUusSRfd7aSK516KVZGqYYSwYf?=
 =?us-ascii?Q?o7wp6o3y9AW8c3w679jPKnEkTqVFHcyc7/m+Wb0e3W0pNHcbHx4IFIm+9T6/?=
 =?us-ascii?Q?swJNALl3UIf3paRGCIbRfciBFtnUnzy/66HHh3WL0gs/E2ykpWPEU7HS8SFB?=
 =?us-ascii?Q?bgopJiOSRuQYLDCR1V++7F8fwsY0J2eyhp7WYLs7/uKTf7eyyfAuR0oGb5Gc?=
 =?us-ascii?Q?bIjLKGJehIPG0X31p5ndvNc5fV4ClKvcb9ptZVIJY5OPZxoJ89jMgTzwisdl?=
 =?us-ascii?Q?meFfzUpgE+CCKJGuMwYfGhn3yxVAZTmI4HG7AJpElzvJ5A/Gxts8102niWa+?=
 =?us-ascii?Q?GLvywuvZP5rZ3wmwfHyVnCrgzrHEEGDB2ErJBMu8tf/sDo3DeYfkEtJeJbWW?=
 =?us-ascii?Q?VXU6h5sva0x/qQ0bUSmfKj8+L+EeMsF5hn2s1h3TmOdIq4zwC9QKw5LbM4Bd?=
 =?us-ascii?Q?pq+9p0X+MPTDz2CbLHEVEwqnA6unmV+zWwfy7HnF?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab24c02-0ee4-415d-303f-08da95ce6886
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 21:24:57.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgmV56Jp1b2TfYodm5wGRsZ7pWhLJzjkk5Yn7NZElPla7Fi6HLo09E9g/pL+InwVy8Ovo8U0lpa5u3YOeqhvyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6588
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Sep 08, 2022 at 02:24:10PM -0700, Dmitry Torokhov wrote:
> On Thu, Sep 08, 2022 at 08:15:42AM -0500, Jeff LaBundy wrote:
> > According to the datasheets, writing only 0xFF is sufficient to
> > elicit a communication window. Remove the superfluous 0x00 from
> > the force communication command.
> > 
> > Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> 
> Applied, thank you.

I didn't happen to see this one hit your tree, so I can simply include
it in v2 coming soon. In case I have misunderstood, please let me know.

> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
