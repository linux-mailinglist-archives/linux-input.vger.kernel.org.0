Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7C9609090
	for <lists+linux-input@lfdr.de>; Sun, 23 Oct 2022 02:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiJWAy5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Oct 2022 20:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiJWAy4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Oct 2022 20:54:56 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5523E37197;
        Sat, 22 Oct 2022 17:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifZ5WxyqxB5mdMCcIV3PK2lvUOcTLc1wSgSivYDD0+9MOsA4KgWrONqQ2JRGCNsMNaSu8hDIWyHxEPR7dFH58DFsJheweBFB575LmZkXrvgYEMFZmgrL2oitM9Uwrubvxmu15eRIJt9EgXlkZRAZO01YyZPcsIckulnI4vnqs2EFxsVncX0l0qWv6NAmvRZul7KsKaam/3jQ8XPJ0rXYi72t3Ke+SXVtwSLJ8CtWVZBspFlNpKPT6mSij2tnX6stMr9XZyRer2rTPLXzJfNWv9T0XYNZHQWRzqFLdf1HP9otMswM4MXPlObfljQBwHZcjErZ/Mf7J/5zN1y+XRYhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGPm1dYap4cYO11KEZp278hkDF58aNQransTOHWqNbg=;
 b=gJ47PDxWh1zJ/OO6LrQ1N5S7rsEouVVYY73bDzj38CRnY5G+oAMk83Z2JH4GaPqFWpxCzUPINGGIDJ3jGPwmutG48/OGrpyFlzNy9OO7HhFXo09cVyTX+t+5P1e3Ra/Khw39zu/yiXo8rSh0LI17k9JhQ/U+4vSbhy6cA3HcWYqb9eUYJMnOULqM2n43g5qOr7lEKNiHZsgwWHW+MX++kzZmaLNFh5EiuJHrWynQOSYGU+QF2ds1RNNE1gPOdeZC81nxWIVZ039fw+JisKgGmquaWitYxNRTEfAZVsaB+ALDY4x74mGi0Q3C5YM4NGbDuNbey+fhq2uJHk3CkdY8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGPm1dYap4cYO11KEZp278hkDF58aNQransTOHWqNbg=;
 b=XSD6fcZSwga2M7ENAZuY4ONA32ttrQDSjx9KTKB0k62HgIBzGgU/B39VLrQRepN1gEeb/AnmmX4KMVPX+3mVUtSKMcZmLcQgZaRKa/KsABvQkyJYZjw2jaHLZKppxVGcyjCHfCkh8kkPi2PLsFBeFCrJpiq0NNyC2wzayExGZ68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4896.namprd08.prod.outlook.com
 (2603:10b6:805:69::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 00:54:51 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5723.034; Sun, 23 Oct 2022
 00:54:51 +0000
Date:   Sat, 22 Oct 2022 19:54:50 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v3 0/7] Additional fixes for Azoteq IQS7222A/B/C
Message-ID: <Y1SQ2t6yUvdaIQPG@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SN6PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:805:106::17) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN6PR08MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d5fcc1-a25e-44f3-8cfe-08dab491312c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2Aagly9HIrVAPsYYA1jps5cOr2a+bLQSxJZrwdJIiOoKGSTCgMK8V5ul44YxdatEbj67swlclQXL6N5urmg9BSPhpsDOGaYC+lnnVYsoQ7q9HHRKJ6wkmde4Hx/5tKDxWaQ/eLJWOA5mKnYH0Xou4U8BDgvzZxcH0xPvT/6vGR7bheUGYQOEBEy3I3uPOWUFE7xJOMKFWJnwjk9dEP6PDw2tSTRh14ijxguXjIN0Um4V+HfaFIpZIv/B8GjA1MhQ3sJ9ndSGeswP9rWocwy8qoMWbOKqWCrIEVeVqRY5pNByGwAzkicSPmYWAsJsvW4idlci1cb1n+FTdUe2J0qRCwMfPdHne4rLUDCC0xnIQH5Per71K7FCsDHD/s3oiOg8ZKLfu3eOpCpaCDAPpchyWubC7UXK7ZFsNIPwDel9amxl/dHoxl13IJg7N0XqpkmePqRw46HFdSSHGuweLWviA/kMatebDBfV7o5YHhCXbhbxGvlPsACw1tiQmKYKZWgfvIJTuHIOuQBQ/83/Mc4zOt+i575bMftMUdrGNI/dOjbpa3YaF04nTsXyfqpEmBGwPphbc1J8mWLSNrONUAKnLZbgm0Pv2slEF4nbaGI4cGUDmqYNeqKH9yAZHOfdK+uPzoJx3HzqEj8C7OyUQ0VA5e6NSqMaSgVKKt1klKmrE7yiabmlrOlWKBspnMb4lcv5zBdlzWKGLIAw5p+3qCz7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(346002)(39830400003)(366004)(451199015)(8936002)(2906002)(38100700002)(186003)(4744005)(6506007)(6512007)(9686003)(26005)(5660300002)(41300700001)(86362001)(33716001)(83380400001)(478600001)(316002)(6486002)(107886003)(4326008)(8676002)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rMikWKJz7wCdDwYfHGHxXYZSNaNNTGEthciMYrO4Wc4yDzXd0pzSrdt5EDRh?=
 =?us-ascii?Q?6aHUrlUW6fyRRcxk9Mk5uV8KLRTIv7Y7+ZJtI/zVzacFY03iL5zLoAiwvNcw?=
 =?us-ascii?Q?7uQi5aOFn/xuDOZBrCNfvWbRP7jGIgQSkR799v71ejH1YeT+MmrgCyW/X2pF?=
 =?us-ascii?Q?ZGGHMTWei5mgPh8XIHxG4nFwEMj97+TcROvJM3xOqYi/iJr6fSDpe+PLhFt7?=
 =?us-ascii?Q?S2PKhrnW1Nkck09fwi+f5VbyMR2eo+SDgY2UN0jyHxkwaNMXeDmGBghM3uyK?=
 =?us-ascii?Q?OOvRnGSFyPCESF2CPTkKzA1Wojq1IQ+G+bi3zeXZR7aKp1PXTtBFrZfgqvep?=
 =?us-ascii?Q?JT82/e5p2bBswNuhjpJGMIGS6kzBLgwA4SrjYI+v+VJebYY9tNSF9/Zf5aCg?=
 =?us-ascii?Q?5toD/RrPtk26080HcNpC8MG8SZHPjWAl2ZFKvvXW/bWzcIEPctP1aSnME9Fs?=
 =?us-ascii?Q?UZMWpIWb3y3EeHLZ8Pcv7Li8NKOCvDDBetjVsVLtrRhdQi6mtO90OHPSjF3K?=
 =?us-ascii?Q?UlXfZpioeopm4DfI2+aKsNBh9liwHFCke7LtlDWg7M4DoAgRCHwi2eZrpC9a?=
 =?us-ascii?Q?mIBFxedmV3/eHkdROcxofAm8SQj6RKRfmRFzxshVIHwt7cyiHIgLWvCxpXiz?=
 =?us-ascii?Q?T6l18jymxw1hJGWwfKyqJTOjqApZTNGnweUTIAcQTY6zViP/6GKx3gpDc1aR?=
 =?us-ascii?Q?+vIgTc/LHQVpSDd7lAoulnc6ul0nJA9/ZB3zyo2wQiWljM0fRRkynPXE/PNq?=
 =?us-ascii?Q?/lj9+lMrgF9TYeqK/7BCsW33iNvztG9h3oxcEBjMcAIuQMNXxM4b4glnL4We?=
 =?us-ascii?Q?CbgWBqqmEgxjaxfcRIsOWTgoJ07JHBb04L/4Ms8hfWOVVasklnFLrXUlPnXz?=
 =?us-ascii?Q?iFRwPGsu+XCJtDppvttaPOwdTFQSniOZKRXwHe+NHzsuaAcPa/kHdlJCHTFz?=
 =?us-ascii?Q?/XciPyztvMOkZcNnkg2KTjVxjHByF7ANzF+hKs5G1UbQJqSnaH31YfD5bavf?=
 =?us-ascii?Q?hdGDwuSNGwFr6Zx1MsRRiYc64uBpZ4PnRQZrj78C27uXuPnScJIRi81yyXSD?=
 =?us-ascii?Q?l9LZwX7ONkq242bra1GnZZl8N3VFREMMyF/1jve6Ug8TzSpwjQGXP6/7l/gj?=
 =?us-ascii?Q?oy/gSj57Ow14RLYJJfek7V5Dy3kykS68bYSZ9C85Zu0+8pU+De8AU8HwIiHZ?=
 =?us-ascii?Q?6chnF6pVlNYAmH+TH6MC8uKQZ2wRuuJ9pn0MP1iekw1nA/E8HXy44JcIVL4m?=
 =?us-ascii?Q?oJDAgnxQcMNIvbs2sIoDzRAHmryqbJzplN8ya2IrCsCcgr9hR1pmhfsJsDIG?=
 =?us-ascii?Q?ofZYOVMZ8xwf74THD2oY3PJQwEzYD95XqFnvpcJHZC6x0fP1/V8w03/mPjoI?=
 =?us-ascii?Q?TSe15spU/BPeEUYW4A+OIuqJygRf3sZigD3KZmk6yaDaBcpl0M6cZzVsAA0F?=
 =?us-ascii?Q?rYwjGgUBY0Rs0ClLnMKswWRmaf3RrTrJRxg6XGLqmgc+dpiIiQPHQIEgiHMg?=
 =?us-ascii?Q?kZdFSU5/Xlo9HtKMBruVJqRJRv0R6fJT7z17Ooqk9e6SZbfx+ih5gLz1L4Do?=
 =?us-ascii?Q?KHz9DMoXOsnl6hIEem7MaNd1IaV+Bz1k7EM0mEZM?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d5fcc1-a25e-44f3-8cfe-08dab491312c
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 00:54:51.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RW9fUsgx80qT0anmgG0cizttdwO3z2283GLfsr1rTfzQ4XEU+8P6PEwmWcb53CwfMinSQj5TBFgpSD3TD8C3gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4896
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
 drivers/input/misc/iqs7222.c                  | 504 +++++++++++-------
 2 files changed, 311 insertions(+), 218 deletions(-)

-- 
2.34.1

