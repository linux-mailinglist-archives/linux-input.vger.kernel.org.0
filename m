Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE67467F117
	for <lists+linux-input@lfdr.de>; Fri, 27 Jan 2023 23:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjA0W2j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Jan 2023 17:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjA0W2i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Jan 2023 17:28:38 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6E18625F;
        Fri, 27 Jan 2023 14:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NS9gMrk5kyypPJuUWTe3raPtdfZA7epJp1wPPjnpwBoyf+hXQn5xJZJEUn/q1Gv7Jagdszna/WDcZ0z+Db+nOt8YoP3MywJGpPZv954ULYaE3j5foW80O6j2GbeGMgF1lYPZFe0tXiiVp770vYepC3e2jyntzJL52dTsZ70l/YB2leQSoc9oCQegewLnKQLCEFQ1xHnyzLP0EdIIUX/mVS0kimvhaXPbitGVioinSoRD/tGO5DKmYQNiiUSrnkv1fyP7n/NHCyY9bHJ6LyZwpfALMAcff21OHA21DbVnkmjpucbLMPMbZw9XYk6oL0AhI/v0VN9gSGIZ0Q9UqzZo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCpf51S7pPEePwReKwXosFlzs98XhdXJ6l6ZFdNRW5I=;
 b=b6miNfSoeRnXKnDpHdABdMXlLVXl819uwV/ZValLKA0EGAL/0L4Mo1MA0+LsXg7QfzZ75oIg8SjULfeEjqPIulxg3DX2+IVrSdYN6JQNdyg0hWcXz5VwJZj8j7vQMkXnzrrjO5osI5e4pe5AQoyIQ6mrZFBXu2yOPpoHdNNeljqtsMa0gvFDwJiSOCbwKsNSkHid179pUOAtrIrl1ONdsMrtfeQ1h8pgCnQEwQ1dziTHAYLEaatc63EXn1PMyuULgLRRbqT4qT8Dv0GB5ZkLh482Ws/Z/VNtowWvx+MpUH/7tjSKdtiiKdsGKHuaWcMkixDBWl6RNSkWyACjjdGpYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCpf51S7pPEePwReKwXosFlzs98XhdXJ6l6ZFdNRW5I=;
 b=o8Lqmy7taI7YaQkb9+dOMThtqFPU69KHRD6svWQRkH39IC6u5KnUdkUuEpIAYEPt7bIXwCOeIqIr3qJxonPZ8gulHTUWKO2/sCJM6/NQneSNeCB0hKQLmPfIgOGvylRI197F1Y08sSznakDuKfyG4A8DAr+bLU8kgezfjrgmAig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN8PR08MB6257.namprd08.prod.outlook.com
 (2603:10b6:408:d5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 22:28:33 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 22:28:33 +0000
Date:   Fri, 27 Jan 2023 16:28:25 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 0/2] Miscellaneous fixes for Azoteq IQS626A
Message-ID: <Y9RQCQa69f3TaiWf@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SN7P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::22) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BN8PR08MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fbb8927-04c6-4992-0ad9-08db00b5d31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCsS81pd0itdcGkmpMIyaJIjRlryz9EoTDi+OthkhfwVuKLUzkhofe1BgoKeSuNyHKtzr13hJw8rXGY9LTi0UDU73+EkNLQ1cwwtylR1My7bckdeNiVlA5OQ3HuVGLSNlfVPEErNCL+B1P9AsEuoANoMammrAwIJOoiXJE4ZgPzvva3Zns6+/OPO9pFtMjBcnQ2fH/AVUF1srSjGyy+zJEg/vugniEP4ypM441l1uEJBGvWfH8JrtGr40zkdazmkEK5o44FkeLPCb6cSyW3o0e0bLKYNz5pTXOYhkoXI+Vnbda9Pj5zMx3VnHLYIxPVAKbJXYMauI5D/tknA0NhmWzhH2VPer2TzfUSQg72r1HP4ObAXD+k7aO5622W0EVu9SM5gXSu8qPN6G0LAcPUlmeQYCTnlTz1tvsN/0Mr4EPPHol6oHJqaR+4v4FnL3xTZZVKR0I7xvleA4lKMYhUTqp6oAmf5Y2I3vT196/tIRWv32ghsX1zKV3aoGn/BIGxx2m5NCWYPDj+jprHUJ7WHsc4FeF0qOFhY+m8E27JK932JLFeSLXJqZhnCWzlrdTQqZdsXPkCXH2/SPJ0iUqANTilpVuqomJD4H3B7/qnwMjDOLbR4qpzSPVVXqVOehHCXlg0Ea5eB3vOSKLCo6upyYvg8ib9JJskN4+eZNzs37NbEX09LU/7mSYUN+Z6qhqJu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(376002)(39830400003)(366004)(136003)(396003)(451199018)(316002)(38100700002)(41300700001)(8676002)(66476007)(4744005)(8936002)(66556008)(66946007)(4326008)(86362001)(5660300002)(2906002)(6506007)(26005)(478600001)(9686003)(6512007)(186003)(33716001)(966005)(6486002)(107886003)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EqsIqZdunTLJkYlJjGFqaq8FzIIq6KTCwCuX7RV1oiMs1B2Tshwe8ngCi5S5?=
 =?us-ascii?Q?d3KJAcnvguaNCboZO/x8EWTxBABCYATYiNsSwqKXWWN0YKiSKYR9LhzHbGH8?=
 =?us-ascii?Q?R8RqDvAOtkxDsC2dQeZgACGOzS24jZY+1xirI0Iz3FUTIerKXOWNQFgq6r7h?=
 =?us-ascii?Q?k2S3mJUDjdy4P31ooFR7CBDFxiLV9+GKrva/m4yMTO+yPeA3UiB5SLEFRKWT?=
 =?us-ascii?Q?mCzaRjQSoBjsyHJZnDLdFkK2/sR40vy9w0qlKRZZNZWjCcgEOhfDmDH3RbcU?=
 =?us-ascii?Q?J76S4VExPDlIlOL/xUfqrqsodenuU+KrqWoer7xewaqMX8rYwe9drFuOwVTC?=
 =?us-ascii?Q?UiIFlGTmBGJGq5wVrVEiBHylPBrwLnkJ/TcNrsaAxLc/7sd7xJES1JeDZ2p3?=
 =?us-ascii?Q?y4i1bHyCa3NLMPsdAyekmdYekl11NNFesvTPMT3n6C7JkrRcfTo1mx0qYps2?=
 =?us-ascii?Q?LQEGEjTtAhAAZbUKAUij7P9ygfV+DRENHxCYahqecGcXEnSpOB5cXsk67n/E?=
 =?us-ascii?Q?QGJX9USG+Zt2eKOA+HgrKlH5J3LBP+t9COPBgSYriY6REptflBs+MFN7sITu?=
 =?us-ascii?Q?OgD5ml7JNhVtVJnzSVPz5Z4DJgeUvsPHnZdSpo4ZaYrrU3E1RRJJm7+IUA89?=
 =?us-ascii?Q?347LKz1Cp10vK4azFVXllgb9jSL5wdEmxfsook9lQdC0PEqtPQjr7M4/3g96?=
 =?us-ascii?Q?gZZariMbuVSU3R+ajNCuNK0p3eoIMOg1tQ/jCBAEyYsHlQ+zOuvRAs22GN+R?=
 =?us-ascii?Q?bOAOixZfFuzS77trw50SNgmlFuBhfQ5Qehl1mdCl7aFDg7QyznlQMBxgrpX7?=
 =?us-ascii?Q?fs9OsVipUtPFijfewbg3Z2iJBp5EiAujOlEf79pvsBECwj1diY23jUIMgIX3?=
 =?us-ascii?Q?0CiyqJ5kJELetagnVr3EAz9ECHMxyiKvZ3rHZde+L58WczThmh1PD/kbRW25?=
 =?us-ascii?Q?oZ58RZCjmvgWWv1e7hbFnFgpXBNnpJsBVp8tlEXJGi9zTee4sR2Hq8T6Y05c?=
 =?us-ascii?Q?ZPXmKf+ywX4EzzMjr4rM5R4XDBpDbW23sXIVzn9e5ZVtpwfLpSswM/MDknMy?=
 =?us-ascii?Q?pXV/DV6Mnr3ez7bs5KgClXoj85byJHUEm4ZJiQiSQYN3eDFEmuEDSlTqraEl?=
 =?us-ascii?Q?T3Tmn3H/VTgdUmJ4UTh0MsaG1xzQZhYzIGj5YZ1HdDyqd8+oFhYVai9frmes?=
 =?us-ascii?Q?janlQoVhJu/YMWyFotYOil5Dk7yhcdEVc4f4fyn74FFi1mASJ5/zi/AgcIMY?=
 =?us-ascii?Q?vfqHYXeM/niYmWFGqWFJSNpis5u91pN/I3jWia4TErs6/QKzzG4MSJivhN6P?=
 =?us-ascii?Q?WbGtx81IqkRw0XcF4tskpL5oGtNO/9HCteKQAcyhoD+ER8Vj3wTbS04ccqEO?=
 =?us-ascii?Q?C/jJWhdXDnSNlOXcCaQfxmXUw3OENb/cFWqy0CHYWIkBgBPvrrmUtPxVKF5O?=
 =?us-ascii?Q?VHWHt5G4RyBCkKfN4LjjO12PcGxMe/onhN0Ryy5Q/HBrsCDHIrzhBc5CBd9O?=
 =?us-ascii?Q?WzYQizWn360JG9sq68rzI/MxxBFDC7qjRrCNqQ59hXJHsE4dDR4tN6JzOowl?=
 =?us-ascii?Q?7pyVWo36tkfgItOYVTZzhjgVes+aqVs+xsMKT4by?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbb8927-04c6-4992-0ad9-08db00b5d31d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 22:28:33.5439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5bL0LgkTnhJ4AEawLIXTvbazJl1r1jfHqNyrxeYFabh33gSZA0mQ+yLSKAX5aS3ETDGfXzFsmL4ck2ySLqzvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6257
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series addresses a fwnode_handle reference count leak. Tightly
coupled with this logic is that behind the discussion in [1], where
it was pointed out that two properties in question have different
types across bindings for the same vendor.

Addressing the latter in fact simplifies the former; therefore both
changes are introduced in patch [1/2]. As there are no known users
of this driver, it is safe to change the binding in this way.

Patch [2/2] makes the corresponding documentation change and carries
a fixes tag so that it accompanies patch [1/2] into stable releases.

[1] https://patchwork.kernel.org/patch/13116327/

Jeff LaBundy (2):
  Input: iqs626a - drop unused device node references
  dt-bindings: input: iqs626a: Redefine trackpad property types

 .../devicetree/bindings/input/iqs626a.yaml    |  94 ++++++++---
 drivers/input/misc/iqs626a.c                  | 156 ++++++++----------
 2 files changed, 140 insertions(+), 110 deletions(-)

-- 
2.34.1

