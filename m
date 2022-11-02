Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C90615BA3
	for <lists+linux-input@lfdr.de>; Wed,  2 Nov 2022 05:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiKBE60 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Nov 2022 00:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiKBE6X (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Nov 2022 00:58:23 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6432A23EBD;
        Tue,  1 Nov 2022 21:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kekSJf+2la3WpEtFBuAiFTm4ZQcbKVEXRTwN6s7kIbwRgjQeGjB8evWXeofhYw70wGM/NdCj5nbpdRot8CMpnIBssBLDivyxU/xSelIh/0E2UJ9keQZLio85y0kSq/qYqCZ3/wHOVFRGTw8Q2EB6VA8jvT2BWzXopaGWhPpndPoGOZWN3L5eDwD53A+IdWQOxdscGOryvNJpxfF2WKF+DLiZeCMibcbWTvm25L8ApkoTo9KJX1EzHmGnqdU8n9s9196FLUofdc4cF3aMi8fmpY/WQJRGESDqyTlYUuZSEFlLkzoksXU0O4vbdUllgArliDyYpsuXNnRmcJucrXiBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZMXbyh5asmFIpEIwUsOGl7u8gGAlj+d/YqNjEH8ams=;
 b=cdyt6oUgAahd7lfbwqb39lIRYzKVomYCHrLogNgZY+XwTGFcLuCghHp5xnA8AigOpaaJGEpXsEqVVZSnUk88UBeQlRz6T4Uu2qozGhkjsi7RO86w4MFKaVAzK+gH2JemBzaCC68qgMnrbItioNODVFIR425SCwhm24kgzUEFyA3wfELifuCne/6vOHIJ3ZETsW2vzyEAyYSUPykKaerO/znuC4mcv4I4oHZa29kvOTQ1j0M3jL0pQzFJSMRRm/E5km3p6qasbJYvfrIP6YkqQcl0qyHehu8XaMbr/r81PjNVsxTQEgmG+73m/RG//o8K4KixeoqsGidDpaqkWIgYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZMXbyh5asmFIpEIwUsOGl7u8gGAlj+d/YqNjEH8ams=;
 b=RzGJHcG5HjqAZ4noUjUV5M5mEoDAot8/z0jZ5Rm30WsN1Qk590y2H3iNhTtUo1EsBP2u713dl270g84uHTFMuPuRXaC75AthbL6jUwAmwfPNMNDiXWxgb4q7LlRH8Pllz8TA5RpVZylutgUZNcPbgXuQ0lagCW9cU+9XRRCb2zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by MWHPR0801MB3721.namprd08.prod.outlook.com
 (2603:10b6:301:7e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 04:58:17 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5769.019; Wed, 2 Nov 2022
 04:58:17 +0000
Date:   Tue, 1 Nov 2022 23:58:14 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Additional fixes for Azoteq IQS7222A/B/C
Message-ID: <Y2H45pGb6JbxST3G@nixie71>
References: <Y1SQ2t6yUvdaIQPG@nixie71>
 <87pmectm8a.fsf@baylibre.com>
 <Y1vYM0Fe323qZupM@nixie71>
 <Y1v//k6MfHUd46F7@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1v//k6MfHUd46F7@google.com>
X-ClientProxiedBy: SA0PR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:806:d1::12) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|MWHPR0801MB3721:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9dbfda-55e5-4846-f6a7-08dabc8eda9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jqrFPIut0AOeelnao917eB0l4amQ/XANv75acxewVneycuURaxSZjYEm7A4778IAMmuUQd2tr2xmCf1mltvUc1boU2JalFoUimDZKYFO3nryoFf4M55HiJz2R3LjZjlB4hTHEWyQMwCmFooyt9KPAx1+7irLgOChAJ55kicn29WySWKzZlFabfGR98Q3YWAw5Ob3eqVtXCwzv5y2cAbWpaOavd8vC7bxZDlJRO7rIJoIFTQMIpano/58vfeZsdmYGkyZ8Ww8fk4zUfiNSFjI+cM3kK8frf24VkWET1cAhzheSTwLzOPgeI7H/nbu68wK7Ji5h8LoDQj1p+eHo83uptX1+ns4PlG6hhkQ1+SbhlnAgJt2BH1HwGYClzZN5StDInVv83Wf/U8ozHv31sSmMDYU8LQooFLrq0/Oa8OZsC82PKgMbzXP9AM/vzyVj8AcOY+lUDvfGr2xQ0VJczAOM4pT1l+7g4eyEZfWzvI2DZpy8CjkgT5ypo9WUx4otHXjZT1c6KppaYHrqI/4xhEBzKA0Mr2XjwcQ7UkKQw7G1nYtrL7+v81+kNDXld7Nq74JDJG8PGtPS5aMV7Ugn0c3Hm4UBpke3N4emCs9n4AoJw1lMdpLY7zZPvQdOY2fFcOCjbKI6UckN1rfquGfa/cSFbXREgk2OJGOjFTmnjG7sXh4A2k26bYxXOPtNKKCuoVv2kSflj0Kn7qfcQoN0h/ntA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(396003)(39830400003)(366004)(136003)(376002)(451199015)(6486002)(5660300002)(66476007)(478600001)(6666004)(316002)(66556008)(6916009)(2906002)(33716001)(66946007)(6512007)(9686003)(26005)(4326008)(8676002)(41300700001)(6506007)(8936002)(186003)(83380400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gL7vPpcjWWH4tCcHNIUk5Y31YpHTfby4OsZzL420gGE3LHQaAfi3aDKraqxe?=
 =?us-ascii?Q?dZ8w4DRMv/JUBzpPCYvh7vIHdtoDjE67/L0E3OjExHDVBrrCeViQjGGxB4nE?=
 =?us-ascii?Q?0xCg9UQ1z8rW11ITUY/ABYt+7VaBhbY1GDiR1kZH38fGxx34t745xg6QXPxZ?=
 =?us-ascii?Q?od+o4ZvBZ10u0UrmkrruhAEIm30qwsBexIxgLPkV7bHLM9risJp0p7IeDi1w?=
 =?us-ascii?Q?ygdSTLk04tE85bxSR+8fTF7Wka6VcOPrt0RVLh4y2ioJ2qe6N6AgYmEdhFtP?=
 =?us-ascii?Q?pe/t+g2qUTEe7kWIeaeDyQsas8Q8WcDrU32JaNZogj06dbK36yAQY2rV0Z4f?=
 =?us-ascii?Q?X2rO7lFKcib3S7NpEa6wjBK+U2V/EWUeTSwd8QFoidGSc1vTtlwQb218Mzyc?=
 =?us-ascii?Q?ZGcZO51btYhf9mxAibS8L/5CmJd/GHsuG9ZbzYhHKGfX90ww9IUTmBO62DAq?=
 =?us-ascii?Q?V3d8b1Iz7gnMar0MHvlVYENRNsQRZT7fPAgb0VG2u9c1aA6VN9ogybL/EZWn?=
 =?us-ascii?Q?zb5rLZmi68p7us5Ybs060ucYzdTnhZqyIhbhk+y6DJ7LunIkzFjNzOdgsIZm?=
 =?us-ascii?Q?BQ62l4hc/maAySmghxL0Bn+Rj2jNVm4BLgD3fc51DIoRHzmeUw4+jSAyHGEF?=
 =?us-ascii?Q?gkzxmWLnkxcVLR5jn5c/hVyZNHGfPDXgLLgoB+hh57MrfxO2w4geA0Qxfx08?=
 =?us-ascii?Q?OSKtZun3vTMGB4iALSsDxkkJmWxuEh2oF1bSgZ3/9SbUMnsiuJwm0mB9Epr3?=
 =?us-ascii?Q?Hs58FrKZ+pOGFo0o+gM1vvAlmKJHTxxf3bZMNuIhfsDJBxGxzemeQDWe7wmv?=
 =?us-ascii?Q?NLckD0cCEZEeP8Q8wOjaY1MmkMP10DE7Bzdc+Qf7HnbKorrool+uIXad9iHj?=
 =?us-ascii?Q?PovOOMYgzaNvADdPxHba0ZI/sG4d6E4qBKAJP5JGU5vmcMIquOjOT3YYuEdw?=
 =?us-ascii?Q?lbWfEgwCnyBA/yDrvP3WDUJ1G5JQE1revuwJOVXnMGQ+kqXTxntTtbGX6bs1?=
 =?us-ascii?Q?z3pTD1QqjhNZ/nnSHcNtgpLnhiWx9/NZlfeg0ZVqsMrDxffgLuBpL6TiNMyS?=
 =?us-ascii?Q?yhuPtREyZSFw0yD3zO92BH5YHF9jyEmP6uE4MFiCAkW5JFnUM0hpbjfUCkZg?=
 =?us-ascii?Q?urbeyENzV1+PhEPd3CLqA6GvVVZo2yAwIp9fGNrK7xSdA9CgCOKsZztN5uV7?=
 =?us-ascii?Q?VHymoj0lVagDaChxxQtv578lJXrbWoTlda5FU8fe0yd/xuynoYUg1zD1Vatp?=
 =?us-ascii?Q?ciCQMiS7IxbjhehHY4/er5wuz0m3KGbWLv+1UXUbrhTkHKex/Z+loiv1Bm1e?=
 =?us-ascii?Q?XqMcuOAiKZZQFsoxM3EJxAZlTcOCQidGMldDsXho96bR5LMzcXu8N9SknZQc?=
 =?us-ascii?Q?/Lo0NTgi/XCe67m6qjM6dweRbpoJ8Ddce6S0CnFJMOzx64Masc8G+bopPs7j?=
 =?us-ascii?Q?XR2HAT8u8rVMeqnHD67IZBzlw2mPfjAUaSxWw0dS/Yvl9mCdh2X0stMklyKD?=
 =?us-ascii?Q?JgO85HC+OULjrEGyhLo7cpm+RjvWgPZLSIktKBI5Nb91IzNHresiomZIjwbK?=
 =?us-ascii?Q?6gxl9SrrNP/37T3KSkomQP0pXFgZI/GwRxhmNLhP?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9dbfda-55e5-4846-f6a7-08dabc8eda9c
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 04:58:16.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSv0QabR7KscCqnR+NcRLMUnM8LZ1FkXsS6sA6GLAVtW/2Smfs7Up61jAzqGKP45BX03Lt6uvv1seB8cqDlH0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0801MB3721
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Fri, Oct 28, 2022 at 09:14:54AM -0700, Dmitry Torokhov wrote:
> On Fri, Oct 28, 2022 at 08:25:07AM -0500, Jeff LaBundy wrote:
> > Hi Mattijs,
> > 
> > Thank you for reaching out and helping to review this series.
> > 
> > On Fri, Oct 28, 2022 at 09:56:37AM +0200, Mattijs Korpershoek wrote:
> > > On sam., oct. 22, 2022 at 19:54, Jeff LaBundy <jeff@labundy.com> wrote:
> > > 
> > > > This series comprises a second round of fixes that result from
> > > > continued testing and updated guidance from the vendor.
> > > >
> > > > Jeff LaBundy (7):
> > > >   Input: iqs7222 - drop unused device node references
> > > >   dt-bindings: input: iqs7222: Reduce 'linux,code' to optional
> > > >   Input: iqs7222 - report malformed properties
> > > >   dt-bindings: input: iqs7222: Correct minimum slider size
> > > >   Input: iqs7222 - protect against undefined slider size
> > > >   dt-bindings: input: iqs7222: Add support for IQS7222A v1.13+
> > > >   Input: iqs7222 - add support for IQS7222A v1.13+
> > > >
> > > >  .../bindings/input/azoteq,iqs7222.yaml        |  25 +-
> > > >  drivers/input/misc/iqs7222.c                  | 504 +++++++++++-------
> > > >  2 files changed, 311 insertions(+), 218 deletions(-)
> > > 
> > > Not sure this requires a re-send, but the series seems ill-formatted.
> > > all patches are posted separately to the list instead of replying to the
> > > cover letter. Is that expected?
> > 
> > Yes, this was a goof on my part. I see that the series is threaded
> > properly on Patchwork but not on lore.kernel.org.
> > 
> > Much to my dismay, my mail service recently began enforcing OAuth2
> > but declined to enable app-specific passwords as Gmail and others
> > do. I can therefore no longer use git send-email directly and I am
> 
> You can teach git to work with OAuth - I am using Gmail without
> application specific passwords. You simply need to use the credential
> helper that would give the token instead of a password.
> 
> I have the following in my .gitconfig:
> 
> [credential]
> 	helper = cache --timeout=3000
> 	helper = local-helper
> 
> and I am using the attached script that gets client ID and refresh token
> from the disk and generates authentication token. The script is using
> Google OAUTH library and endpoint, but since you taught mutt how to work
> with your provider you should be able to adjust it as needed.
> 
> And please do not judge me for this script ;)

Thank you for these clues; I will give this method a shot.

> 
> > instead emulating it with a script that tunnels patches through mutt.
> > 
> > In this last series, my script inadvertenly dropped the '< >' from
> > the cover letter's message ID, so some mailers may see this series
> > as seven separate threads. This is fixed now.
> > 
> > That being said, I see this series was already applied earlier this
> > week; I think a mail simply did not go out. So no further action is
> > needed.
> 
> Sorry, my bad, I forgot to send the notice.
> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
