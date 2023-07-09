Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D8D74C677
	for <lists+linux-input@lfdr.de>; Sun,  9 Jul 2023 19:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjGIRFL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jul 2023 13:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjGIRFL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jul 2023 13:05:11 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E786BA4;
        Sun,  9 Jul 2023 10:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZ9Ff2uitrTwv2GLfeydJ6ne4uqPj6YsR79/iLBhT+OTZ0VvslYPhuFjT9r5WshGlQ75G8rpj/6cj3flMqQfBHOc4WgIcCeShYopia1qc6kzPI/cttWV4FXKBn1D+hvLKZxJ8hf794QZNXXyMtcHxlcvFnS0U2sakCmC1Cpltrpv6/pRCakoFN0lgFBHEJhwyoMsKX2+fdMCjZuFnjK/fmWKgNrht0nILKx5ZU4GZcyxa62ap2AO8zdPeJpWwZaNAY+3HJVuRkp1x6I7feP/IHq+EhsHlsUk8Z02vpdCYEelSQVTgGr7pm6jQCXmzqP1edwB1xqXx877GWbrhq93mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX5lUDDY0060WaXpCpr0QUczpjZ7ItYW0fZdOAKbA1g=;
 b=Yb8PTsI25quAKdi7CNIo/jeoikGArSaikuC3zHWaVV3o+4YZctYZKbmvqGDatwYw1DhJ/E/XZQjhl/EDDeBMS1mVzeo1K3RgBK4vexawm6a4/jCF1qRqR9xhpvmPxB5fo2SGsXRDZEh2GxZeZxv1qF3nM8pO8C6hQP6XjU8GgE61NfrMvc2BSecKoww3gBED8CM+QKV/4Kpz/NoX8XNhrVn+/bMbpjamDwENlDjUvnFnD8X08PN+UD3HHlB6Ez598RHb8Xszz8fDrZqAnOMGpUPBA3uN6tWqMJ5MfIahhZw5Vo6CMS9QrTLZTxUDnj9jB3Kor6b+wflyPgD9uQkVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX5lUDDY0060WaXpCpr0QUczpjZ7ItYW0fZdOAKbA1g=;
 b=XfGw3vQyZQAJDH2XX9eIWWkZVqZFyIsl8WvisUQIM0gigtItWwgGHfA4XNn8deDV7efE2KaKVsFX1AvLtyDWHNBz2E36MlARymSAaG7e0rtMOzF0Ijp6Dz5hBGmCqbTyJE4wQH/OVihlTkRr/nklV1z+zkN2RJPAa+3KlOOEkXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7020.namprd08.prod.outlook.com
 (2603:10b6:510:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Sun, 9 Jul
 2023 17:05:03 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae%5]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 17:05:03 +0000
Date:   Sun, 9 Jul 2023 12:04:55 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 0/4] Add support for Azoteq IQS7222D
Message-ID: <ZKrotyhz7eueujys@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: DS7PR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:8:54::28) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: aed41330-f3e8-4b2b-6537-08db809ea2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: InhKfAP1HIoo3wLmJ0n0Is//S38s+NwR32IvNT+FmZImcgH6SAgdBSKWsFAZhJuFd3QeeMb5W2bwf8hplvj3e250J+hSVjlKKJYBloOGdb5IQEXAZJfBDVARJb1tXd1GYsPWHV2atgtGhBcGryk/sxfmU4o/TIcNR679QEzueT9BYOLwYhbvmncs+hWVnPas6g1fEG8dvlAknVLFODIp5VHwcfsUVYM3lST0YE9yWJB03GH5IX3FpjflP/icT2a/rL7TEvw1nzXIi2oKJqiGsmUkkhfQnKCa8rMtVznjI0uO6u+/AJaBBuN8nxlH+JuIi78Cs22qi7yHwdKfv9f79oYlNSR2sZTHNwKHloDe71Jc/UuH5r0xmEAIKYoKDjM3mGHgefbnRJkxyHudFbyUHIb+IkpkSQs4E7i16QleaevMNnaHHi1N3+CpEs3SzFddLdybBUEWxsrgvyMoWlS1Y7uvPMhZQq1FK3OFVWptZJZjXSswPd6Wm1i/GgmD+84tjYkxmnu7DIA5POjjb3M/2gUoAH5paKAM/btQo/WvWmHkXJsCYk8/bGYJbbk9l1lY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(346002)(396003)(39830400003)(376002)(366004)(451199021)(86362001)(38100700002)(6666004)(6486002)(33716001)(107886003)(26005)(6506007)(9686003)(186003)(6512007)(5660300002)(316002)(2906002)(66556008)(66946007)(478600001)(8676002)(8936002)(66476007)(83380400001)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Txo/c5/QYNy3JiN3q0xLLSHj6zQ6jwaoEqEbsS+8E96k4U54bkRWAmsRBRVa?=
 =?us-ascii?Q?Gmil+n0A8/v2NHZkx1x7/LR5/kDKuUJVSOG4Ss7tIGBdWkAg5bQT8U4m6jJ2?=
 =?us-ascii?Q?X28YG/sWzNWKlttdIzh+AJHMQGPwGupO2Xb2CaoU+6ShGVwM5DYVnJTi0g2n?=
 =?us-ascii?Q?IN6jMTO3gtnpCn2BPTrd9ufFgeVYgiG2rcQ5vMMk6owCT0FtjVeim43WCFDI?=
 =?us-ascii?Q?6dNj9xNMGnOquGklxTZmk0/ovaQyEOKEffKQzkKVBOWPRpMBdzQmnLzbbgYO?=
 =?us-ascii?Q?Ij+d9iILUWNMyKje5iKXY7xDWcilkTkIB8XpcpYkNOhm9P8sYaEh84vwh3Ze?=
 =?us-ascii?Q?94dkSPls/g01NEsg4baqGIOdKU5N3IcAmc2lL7FDzukmTB+qxYlq6Xs2Ii7g?=
 =?us-ascii?Q?6HiJ78BGMcqffKtkMNMUd4R8T+iUpwueHf5wkhWCulGx53jbQf0ld0MhrBq5?=
 =?us-ascii?Q?in6soZrH6UUib6fXOTRCeBN9MO7m/rK+5sCoxFK8POSXVgIazjma69oN9nhf?=
 =?us-ascii?Q?K/huysenraOcxWM8LBdjx8tYn2aWoULS5nwSa4wKnTEYc39kW5ZAYX4Am0WS?=
 =?us-ascii?Q?ElyThoFNtMnYBjmZ0C06hhFj3AmgnEpzYQ2q4QtMo+Ev1rEE8y32JAv5Yhe1?=
 =?us-ascii?Q?y04ilnN3oJinAKc4YxcZQMgJrPp5NoEZzr9gv9diDDZx4RlxQrhe9hlm7dLF?=
 =?us-ascii?Q?I0lGodf54/IbFXBwMVLNLXZhyZnkNJjsSa74jUw5x+ApuBTYQAIBmjIysPGY?=
 =?us-ascii?Q?aXZFOdY7kxCaqYI3puWfB+wapvBb8HRggph28KN+YYTXqgH95ChADDjmbW6e?=
 =?us-ascii?Q?F7f1T8lluqWpdnAidOohPRicqM6adHcDNM2+lOgGLH7alH80ldgg+ObC26ZA?=
 =?us-ascii?Q?HldXINY3uotHf4xJIliNwVnKsR32HQ+ru8VINRh2nVggAbCO/rtjJLb0ICCx?=
 =?us-ascii?Q?3vnmHaCsV0hrOd0vIO78ddDdZH54m465xnLQ/7mvPQpLnY0nr1os907b0fcS?=
 =?us-ascii?Q?fW4sMHdDIoAt/KK1rt27pgu2Nu8jC4yQPG+blDNeyIQvuuVm35paXtLeSqwN?=
 =?us-ascii?Q?1H2nEnlgGh3BsBjDVCe4NHRuiLvANULDUjlbACp09V71s2mKPnntYrppr83k?=
 =?us-ascii?Q?12zxZH350gdu+S6ceQrITRTHJZOVMgRqapR8T/RVIfevPUQRiI/+NsxfyV10?=
 =?us-ascii?Q?QlfUUQGF0EIg3FGmsDUJY/tM4yQDxddIHiuLgfPN/7xdlSLWHtM009lAr9cs?=
 =?us-ascii?Q?y8pvtbf4paupiU989LW/KrnDlaI5sHbzVgVRzJAKyRpSK+49F80qp6J6kk5l?=
 =?us-ascii?Q?8SvP64vXnFjlpO25ecqLgA3c/s4vDJ9NLvSrqaFyV9ANhbdlRplddp91FCrw?=
 =?us-ascii?Q?vMtLU+4Ep+YP6SpSGiVJYeR6SDcKDEUyvqcwyPdqiW76XcV/gutH/47FrAe1?=
 =?us-ascii?Q?e8tTmN1rJz7h8FoxC5N8NR9HRNv+mrUJPypC4RwJyZKMpBGXWabZ+wVYFiLm?=
 =?us-ascii?Q?Ll+Ha3ZarwGi9WBeWWmERvVI246bFBgOvNYOGu6fYe+O7VlHFDLEqaH6iq01?=
 =?us-ascii?Q?FIwRb1kKb/b3FCO3juU4ZzqUEYoQuG0IF707qE+W?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed41330-f3e8-4b2b-6537-08db809ea2d5
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2023 17:05:02.9260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hS4cL1+S6ejNjBcAK8sCSVAAqxTbrIjxo7Lvh+nQXrBbGr3gUh1RYvVQlTebivLMskUjjmJLufwBwrlWKiABFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7020
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series adds support for the latest member of the Azoteq IQS7222x
family of devices; it also sneaks in a bug fix and a clarification to
the binding.

Changes in v2:
 - Added patches [1/4] and [2/4]
 - Updated patch [3/4] as follows:
   - Wrapped words instead of splitting them
   - Specified units for the 'azoteq,top-speed', 'azoteq,bottom-speed'
     and 'azoteq,gesture-dist' properties as in patch [2/4]
   - Corrected the 'azoteq,gesture-dist' property's role in the case of
     tap gestures
   - Updated the if/then/else schema to consolidate restrictions common
     to both IQS7222B and IQS7222D, and to indicate that the latter can
     support the 'azoteq,ulp-allow' property
   - Added more details to the commit message
 - Removed unused variable 'val' from patch [4/4]

Jeff LaBundy (4):
  Input: iqs7222 - configure power mode before triggering ATI
  dt-bindings: input: iqs7222: Define units for slider properties
  dt-bindings: input: iqs7222: Add properties for Azoteq IQS7222D
  Input: iqs7222 - add support for Azoteq IQS7222D

 .../bindings/input/azoteq,iqs7222.yaml        | 248 ++++++++-
 drivers/input/misc/Kconfig                    |   4 +-
 drivers/input/misc/iqs7222.c                  | 476 +++++++++++++++++-
 3 files changed, 688 insertions(+), 40 deletions(-)

-- 
2.34.1

