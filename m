Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71CE49C1B8
	for <lists+linux-input@lfdr.de>; Wed, 26 Jan 2022 04:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236815AbiAZDH7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jan 2022 22:07:59 -0500
Received: from mail-mw2nam10on2050.outbound.protection.outlook.com ([40.107.94.50]:29921
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236885AbiAZDHy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jan 2022 22:07:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD2VKBphmiwkryhEO/5T9Mgv+EMD+hRvKacwjekY/a5/wGkE01qdEVL+YaWbdKbyDnkm7R3Q4ttVeddfc87WbpB6DlED88VIIT5EorsyJjAH1TA43RUFTLuaupWW1N9Mza9wofUpmAdcjnepymVyBTiFjnl/xh4A9RYNo3oaFbDFsSiCEFm1x6HzmfJDLBUyNTv8dh5NHfcHcw6hAAFs9OwnAQ2un7FP1/c58oqAcRKrvGoQTIXnpvA2D2zi9hsX4hXgTaMJbHpvtEjn7NywlHDN4KPEtBI+VUGHHM/XIN9i42LoNN72Hvd2MlaXefuk4jeF/q4jUX6GeE9Pm7Mbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUo0+Nie8ZHWA1Zw8U8Mf7s2K/MclvLV1RYtwvFpQzI=;
 b=I4o7EhNIAZcwNKyF/rsplj5sGfW50lLKupVBCwCS99+1WqhVZ9IaznSRZyIiDs7KAyxDFZrN5+Yj4/TpnyqomZRD6NhcOCEF/B9saap/U6PZvpQpfKyuH0AT75bwOBMnH2yZKAC8Q1z+ycuR+f11HcPWxwsUywmqAjlOhjGDjrjkaogoZkGX6KWWyjcrSjkBKcWsGONf/ebkg/hktfKzFo2JnUK7Zw/F8We2aIQ2HIy3nijyJYxgT6J0/589aE/m1HvqpmA91nwXCU2P0NmbY++yR85CdxEYDez1dydMxGwHh3IJb195Fv5CpfMcYiPSqy602y+Xd8iOL7zIJ1Z6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUo0+Nie8ZHWA1Zw8U8Mf7s2K/MclvLV1RYtwvFpQzI=;
 b=0HoAF7ApnlsDOPf9RSfEZPYMIJn3FBJFgZ1ANAVz8D+vcD/7Aiso5LtPkZyH0KpfIHBtZskMCeHBgKVXvwqjYF1xdJcsFtSbExod2DUAHyM3QQk9a5ScOBel2azVJ4qkRz20gT+l6RBtFxqzfahIIHVcwUIFubTImr978cWI7mA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by DM6PR08MB4585.namprd08.prod.outlook.com (2603:10b6:5:fe::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 26 Jan
 2022 03:07:50 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba%5]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 03:07:50 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 0/2] Add support for Azoteq IQS7222A/B/C
Date:   Tue, 25 Jan 2022 21:07:21 -0600
Message-Id: <20220126030723.223809-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:806:121::11) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e230854-83e7-4b29-f738-08d9e0790945
X-MS-TrafficTypeDiagnostic: DM6PR08MB4585:EE_
X-Microsoft-Antispam-PRVS: <DM6PR08MB4585E72300B90F5EA4D46BACD3209@DM6PR08MB4585.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEsckEfepY9acjYzkWXJnsjgLrSoMF8MFF5I0Z4GR3X/YNgqEDzhuw5U71dXegbJQ4Bxbf253+nqnaVq1dqX/hFH5mK5LigXKrhwCweqKDoxer7/HLqFUpBzas384sUZehXWqLCJCAWLouP85japx96gfsEfb/U+MYmu1FWe9BOwVZokjWtoZ86RreDaVmg63LdA2OPFYW4J12WmlqTo+VfF46yPi/SCMVqoThWKC8mbAnh9LckittqYijYXO/FGdOlUqST31HrPgtrzaVEKL1JMZi08bQDi75hoFmAIjAQaSCLh8W5ibRxAFQo00K/B+5lF5ivXPTR8jsAPRmaZgfuFACTNIIDs3gQqP2hMPZPzW3Uz//DvzaqY/x9/vfZHh6eC5aC/1yqFu8Ms0aRhqynFYWn4Ak14Z0qEj/DPXgnXKpHDGlEHMDbLism9iK2fMDdEHpGC/YMvvMnLQulvSepA4qnxCbpFVTEtLfr31S/P67TcDu7ZGufuNcClx1KWukR5AyQS6czK7GSM8EUlLMyw0t7RcXVdvSHGLZwmrxLDX1pcat8vEqACpJPPMJFKOioDrm6gvQIgaQZkBVn7xmbxZfK/Knbei5+zoRE60OqCmFpnC/373nnbDeOXB7funBMHjairCfoPyq3/fKMQv+VNTL7W78AUdCTLKDPn1ELtrekfDgFKH+nWDRkiBgHP1/xx/slGGzt/TDKJl7J4cjO2bpC8tuHHJ39DsYzgErs9PQv8VwPTCqeSCvoi6Xm2IOC6qI0stFUFH0pT5YJutw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(136003)(366004)(39830400003)(8676002)(66946007)(6506007)(66556008)(38100700002)(107886003)(66476007)(38350700002)(6666004)(6486002)(26005)(4326008)(5660300002)(8936002)(1076003)(2906002)(83380400001)(2616005)(316002)(6512007)(508600001)(36756003)(52116002)(186003)(86362001)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t/s3FKMchqm+jVcE/G8ba/QeZmuDnQsji744eQNNkFP1hQgCTyHiyDwaRbNa?=
 =?us-ascii?Q?LPlciURiwN5Rj3fSwtHedhh2r3UkApjJbrn+earulRDNTFHSZxQGTToRelzP?=
 =?us-ascii?Q?FdzXjsrNvf46pbDqX/vJyy4UlvEk5B3uZ9Z9neSLRZs0zOqrQqXo+QQwb0Nf?=
 =?us-ascii?Q?V5V0IHeJiMECaa8GEql6lUMrZq7idNimqDHeFtVMOVjZLorJO01kCIlZ0X3d?=
 =?us-ascii?Q?3Z5NEBTVKlsXG3dMZchu+Vz3RinSTlyVT+UeEciEcM8j4Oflkmn5HpqAbdXV?=
 =?us-ascii?Q?fG0NuijdFvCzDYD/heZCD+7EXrf+ARBKv/Iu1NdCcRkAas36m+i7AdUHAabT?=
 =?us-ascii?Q?GburI8JbMGLD86KvpMx9nLdS1QzzKRX1xlLbUkUvbhaoU2YeWXbE/JksBQ2Q?=
 =?us-ascii?Q?XcmWst4nS1luaJPQrWzz29vDZAPR1/20gDr2KvvbqWNUQEg8bn3vD2Yyp7YU?=
 =?us-ascii?Q?TsSo6XSs/44sNiYf/nENccPHuFiiVbH1hoKiFUHr+hjNF5gHijTwdKT+UeY2?=
 =?us-ascii?Q?iAlL1DjWkxQBTa8QQ8ruAa6LkusIYDnEiM+jM3/gfQ5y1vLXvbd0FuJVPV5S?=
 =?us-ascii?Q?VBkdiUyqZAWllkmkOTG6Ftnz2rWVjqzk3HGXJWDtiLsj4DyPxPK7lLoR/ik7?=
 =?us-ascii?Q?NHj4z0H3640UulyuFCLJmKYxycIoDCoxtHpZi4Rz1J0RZ2ubAUjSH/mjV0TZ?=
 =?us-ascii?Q?QLtaxFflKTj/I+2im921nL2l/2vxd00wsGg4DH6bFBzYB6+gqUeP2UgKykh0?=
 =?us-ascii?Q?L6EfT0fYbTv7XSS7tociCvet1mEo5Lv++PvuMLYpibU1CcChYzc0uBJGHavf?=
 =?us-ascii?Q?jGBaE/GlziGEbfO03bxWxJi8x78LdDs9Li7Di1YhswCt489VCe9/iofaQVrq?=
 =?us-ascii?Q?rTIQKqdMaYjYioShVPn2GEi5znnCqQB7pxEG+Oa9VB3eAaTNzy1hjyXWnzQ5?=
 =?us-ascii?Q?5WMKBV8z5PtvwGeqz1R7O9T3qk6nLeIeazId7+x2UrY+ZRfMkwb5LDjZui15?=
 =?us-ascii?Q?Wnr6Cno4WcESRdXX//SKzSwe16EuOonhyKdwBairWljcO2Cypw02woQnHszj?=
 =?us-ascii?Q?+lO/oCxJc6T1ExKYgQWuQrsGSQRjtZsyOAkOzDmfjOaSn/klPIu4b7/yk7ji?=
 =?us-ascii?Q?DpHxVuk0CDstWZi86FiWGEny9FxStREMdkJSpmAsBffRwF9xXCxpil/mH2hn?=
 =?us-ascii?Q?2gPWoNkenTB4ai0yyO3uhIHQcnVzcYlTqiq8hKbeKYPeRoDcGJjLUiGsAN8H?=
 =?us-ascii?Q?VjEHNSoal/ufdAkEkByC8ojKtp9mnBglueJxeA73AfAX1WaKVB9eCbwXRV0g?=
 =?us-ascii?Q?CwXPWsa8tnQHVMO/eRyGpYL81ZSeVU6CaUJY1Y8cJ1+5WV2h41Z7+hJ0h8Oj?=
 =?us-ascii?Q?F16pYxkOdf/AD8D/0iqSlrFj4NThSGl2vd00GnxS5hiWW7CvITF9yoodN383?=
 =?us-ascii?Q?mWDbIBEryYUrGsRHURuZ01XY8Uq553yyM6aWl9oWdaZBdq/3BBaQ2260eQ5H?=
 =?us-ascii?Q?F0oQXxe6mhrXwnlCWSHMYLCodIxSZiWDT21r2yGraQtUWF2l+ysTblKmDUQW?=
 =?us-ascii?Q?v9r8zUocCDhQkJzhHf6FMc34aS11iL9ufvuckvO0oUT7w8hhDEl8oa1JbR03?=
 =?us-ascii?Q?t1VZDrZ/ipdFz6nU0Vuf03M=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e230854-83e7-4b29-f738-08d9e0790945
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 03:07:50.5723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V5GPWax1YFPdiF0MLdQNZ0QavjO5g0mldgZZ3WDqlq/Vf1tEOd23erLuH3CVm4lvo4bxgxu035mhwKHTfka8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4585
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for the Azoteq IQS7222A, IQS7222B and
IQS7222C capacitive touch controllers. This new family of devices is
similar to the IQS269A, a key difference being the delineation between
conversion cycles and sensing channels.

A cycle represents the charge transfer mechanism shared by up to two
channels. Channels may represent keys or switches and have two levels
of detection (proximity and touch).

Each device has its own unique features including channel count, slider
or wheel support, and Hall-effect sensing. The driver is demonstrated
with each device in the following videos:

IQS7222A: https://youtu.be/SyHhe9pSr8c
IQS7222B: https://youtu.be/R9Yd8yFPmN8
IQS7222C: https://youtu.be/-ahg52Co5zo

Like the IQS269A and its close cousin IQS626A, the IQS7222A/B/C are
highly configurable and follow the same general structure in terms of
how their bindings are represented.

Jeff LaBundy (2):
  dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C
  Input: add support for Azoteq IQS7222A/B/C

 .../bindings/input/azoteq,iqs7222.yaml        |  960 +++++++
 drivers/input/misc/Kconfig                    |   10 +
 drivers/input/misc/Makefile                   |    1 +
 drivers/input/misc/iqs7222.c                  | 2444 +++++++++++++++++
 4 files changed, 3415 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
 create mode 100644 drivers/input/misc/iqs7222.c

-- 
2.25.1

