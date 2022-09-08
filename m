Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCBA5B1E77
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbiIHNRi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbiIHNRf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:35 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C42DABB3;
        Thu,  8 Sep 2022 06:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FogquqaWO0uIUhaPl5h8umKAAYufteTZc+ZlbS+7dWpRCLaxEgGUD/pk9yqOTBkV/xy3Lik2CWokws/Ua/h1xxoSdMz4/fGn+37ooueauxP6fi3CgOrln4fjv2EbS22EnCLSmak5pFYmg3LZjv6kkoQqZD3dFr8OgX1pztY3dDDPL9apIYmfIsfr6QlFl2PiCE0fUXaCbpVwxbFEIWJB9pPKfO+vvEpJwdhFO7f6kYHx/o1Yu58W74Y9OTk2wzGov9rDfna2yCHkbzpLncFIXoE3zTk1vf4i/MWaMgZDwtfN0sawujrIug++6PiLwK9yn2PhjsXvRjBp9R8f+e3C1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BJkYsU5454wTm9/PWLuOG+ow05np1N8BtnMe+jf/wk=;
 b=Tiak0hsa9nmr/JWjVzgLse1IcX7fXLp10klT+mAsuphnnX7U+LYXE3FpugjG4LHOhQryo5vQBls4UT2Nwp/1kadMy3GDXecgIFlV7tA0sn6/M24nK6dV6f1gFUuSd4K1RaLe+fhb4dA0ZT+7KhviNKcI3YdJRltsPs371HtRoQVBpjR5A2xt5+va1xCoq8a444K0+6SU6rEEfyCjSO+DRKACi+UdxFBXPIHdaYhPhYXJkJJ34Y7oWsbQtxTp3pJDJh10rVhynTZYkEVGen00tp9slqgNvQdThzeyKgzplM8jrFu83kMsiH8+EFU/knYRStc8EFRxT1GtV9fD9BMkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BJkYsU5454wTm9/PWLuOG+ow05np1N8BtnMe+jf/wk=;
 b=HViO1L23mP5FnydQcqc36CZOkF3cihHgD9An9YKOVQ930InkibFeoXOPXbCcEV0Os04J3zWsFUzaSE6f/AMeMbMbc1Gt+WPDPOZyQ64zr6n4YjQ0H8SB4iLc5k75wSpN9N5sRz8YtRk/Dp3LJ6tU7YSTg4pKMLnQO8iImKmokZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:31 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:31 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 10/11] dt-bindings: input: iqs7222: Add support for IQS7222A v1.13+
Date:   Thu,  8 Sep 2022 08:15:47 -0500
Message-Id: <20220908131548.48120-11-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28836d90-a832-402d-a62f-08da919c7c6a
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7Sb7eIvmcEhY9abTnLHbt3S2AkgzokY+uvE7Y2GZjlBydJXnImetzL8eUB+ycjPLl3kjrQhzCjkL6+1Jf/9Sv2kefi4037EDfF9+F88JPySnlye5NqR2Y95+kag4//U2bLNr8Q8Pz4cMqB2W1yXYnm2h6ojTX+agd0QTguRrOrZBgx4QCmdBbGXZa97SkZXfciy1EOv2h4PdszZfW9CL54yxb75ojBEVmDvNRJWjRMY4P+BbLucEOOA9jwCcG0qM6zJQjvNt9qjvamucbcW0uFZ88qVXy/2E2PY8TVIDTo7BBtPUurkdyyDvYsMm6HY5P0EVoXQ8jR1Fshcc1FNalrcd1GmcSr3/JUsUjrGlgNAqW634R79ZDD8AHnq6SZ601/EIj3pPr+x6Px4KZtY4r18ZSprmRA0dwL2xPQD3+aOnUHG+ZZHJUUDy/ejHWZs0QdrF9cuhEU8H0lsFBx4KoFwPucutooyawpI9z0+b3XcdjzJJQDcLTsnTr8YkmYsAZ6/yamJXbuc3iBd2SC5eBiTlo1/iWplROPI2cg71qApYyfNU/vt0Eycyqp9zKU1zOHmxa2YkTshYZDVhL6Gftvmg438TNSaj6orVIYgVFb/9XVZxt9KdPeLnjBwEg9D9Ldv0U7NkcU0uxjXTKkPdzHgj926f4cBN/tULnTY/5ZIvyxKBJ6fv48rP+87TJNd7GQFgXysSfPa7LMzy3436+M5vT+BuTgIaMpz4k3DvLsjDFTX3w70GFJ4oSRmW3FS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0xQ5b3MH9rCHsIj+eDIaUH83CazPd4K5sxnq8pgOK6pprBdEQaUuVXX24taL?=
 =?us-ascii?Q?d3vY5ph/I4tCHOLdbxpSPttESzBQ47UTWqv0PdsPw9XAhAPMz3N9+p3qFx5a?=
 =?us-ascii?Q?bclETYCULXZTTHXpqhSoFoPI7aB+im5skNmPoTmf9vmQyZStAMMYJpeo6yqn?=
 =?us-ascii?Q?6z1y2MmcoNB+EOqz1H7v7mjSEM4ToirVxSGsG6lRrwxvPgSocZ4SbYJQhrpG?=
 =?us-ascii?Q?c4Y6w7Bq3e+5Bd5nsw81RDaWvsgTOYCuH8ye/MfL0TxP2b+4/gakq82E3b81?=
 =?us-ascii?Q?oPaUkyLVXORn2Z/tCErcS4J1mWZ5NYsUSxznG428E5/8iz+On8m+c/VQNnPU?=
 =?us-ascii?Q?G7ZRwcmAzL7bN9p2wvAedcpboYa36JKrypS/BbnN5nIN2qtYFdP0GwJKfjEV?=
 =?us-ascii?Q?fvMw2q9b5NoS23edE1SnxAqFjh6O+0468TmSwgNuHt/h2UozMEWtteyNSqzD?=
 =?us-ascii?Q?Hvx/yxNVnOKOhyVhNoj+cGTCYzr/zHGlr6g5Z34EBTeMhpbc7Gp3a/RXsqWR?=
 =?us-ascii?Q?nJdWJyukibimlVCGZgZed/Bi9XM9Xf/z5ph5tu9ZHyzy5mCsbsTQPVYkbyeO?=
 =?us-ascii?Q?i+EC4FfwujlK8QIiDqrrfE1Iep99WHwOplkKB8MDaTn+AOlHN6WzCFT4SmA1?=
 =?us-ascii?Q?jnHW6B5OK0gp088g3LTFJVvwWeS7xfrdFdMqVjK33x6/dgY1MR9oAoLrTmNd?=
 =?us-ascii?Q?kHauy6peN2pRKUABoT6RCoq4o/XFvSnNlPoTasY0ERo86XMdtJmIJAjEzLe9?=
 =?us-ascii?Q?/eIvC/uzeBFyPdvrGkWcPDuZgZcl4tVfOc/KGXcSeRsXHqe2xsgU9+/zLm2S?=
 =?us-ascii?Q?ojvjmN8QfUbqmiTbcnvjMXMKB+69+qBVmrrCierjln07CybyONdv8b0QFpwh?=
 =?us-ascii?Q?TK7rDnkycvW4wa17XmF/qCtQ3LjoxYoInDT7cjkLuTKDLewxlyrbUq8TrsBr?=
 =?us-ascii?Q?v/Jbpd53aLX0e6oMzPJ1Ok515/9xoCYMxUU6azzqPt9/X+DCRk5/j81vdKWV?=
 =?us-ascii?Q?RfiFpO5KIVq5oYM67ds/qtgfzDO8aJtvaMYg7ZyuFuMq7by1FaUEvmUMKsKt?=
 =?us-ascii?Q?6mFyKoPC7cB8tFtq2TtlAl76Df0Zw1FUJtTJM4I1ANec/E9dWoBs6knxEGWy?=
 =?us-ascii?Q?FUH64cc50h7jqtSHKPtz44HzVlO2KilwuID5INL9vt5NaK8P8/+UFjkEPYpF?=
 =?us-ascii?Q?aBKkn3KWhXV0x1farB7nPxwwT/zxoxubvuibp9NCgCkor3nClpSj0004ChTR?=
 =?us-ascii?Q?/3o+0CIS6emNipLAV2QkObzL4LdaJlrD0NOcxrFveImG65LjwFKDkbiB0KOX?=
 =?us-ascii?Q?gMsm0qzFTtZBJAYACl3KUQFd09mVO/9xTTOeBJB8aBD8VWe0Dq7rSadOD4A4?=
 =?us-ascii?Q?5Sgpb8TDuzDD30RRh2hkL4LWXvSaNA0LYuZAaLhNrjceFsaaSUq3wiBKAHIy?=
 =?us-ascii?Q?dFfpjbAYcSWWw/yLmJdgMb19e9KsSMoQstSi7G4ZtUHfpQTVsMgSPKgI2CMo?=
 =?us-ascii?Q?SGBsy7QYI0Mw+imFbxx3MHQ24wPgcGDF9+Nv/7gikOUYTP+kgTKyu3YhwWjP?=
 =?us-ascii?Q?pef1p5AHLaq7AcZpkhwDpD8YF0Kmt5kiX14w+umX?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28836d90-a832-402d-a62f-08da919c7c6a
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:31.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubEUXz59duw7W6gvSop7hYX844wUXBex1alPP7tMpImpnFqwgGnI2yvPisgJR2XLk2ZLdXyzlu4dQtA7X0GwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

IQS7222A revisions 1.13 and later widen the gesture multiplier from
x4 ms to x16 ms; update the binding accordingly.

As part of this change, refresh the corresponding properties in the
example as well.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../bindings/input/azoteq,iqs7222.yaml           | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 913fd2da9862..9ddba7f2e7aa 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -572,9 +572,9 @@ patternProperties:
           linux,code: true
 
           azoteq,gesture-max-ms:
-            multipleOf: 4
+            multipleOf: 16
             minimum: 0
-            maximum: 1020
+            maximum: 4080
             description:
               Specifies the length of time (in ms) within which a tap, swipe
               or flick gesture must be completed in order to be acknowledged
@@ -582,9 +582,9 @@ patternProperties:
               gesture applies to all remaining swipe or flick gestures.
 
           azoteq,gesture-min-ms:
-            multipleOf: 4
+            multipleOf: 16
             minimum: 0
-            maximum: 124
+            maximum: 496
             description:
               Specifies the length of time (in ms) for which a tap gesture must
               be held in order to be acknowledged by the device.
@@ -930,14 +930,14 @@ examples:
 
                             event-tap {
                                     linux,code = <KEY_PLAYPAUSE>;
-                                    azoteq,gesture-max-ms = <600>;
-                                    azoteq,gesture-min-ms = <24>;
+                                    azoteq,gesture-max-ms = <400>;
+                                    azoteq,gesture-min-ms = <32>;
                             };
 
                             event-flick-pos {
                                     linux,code = <KEY_NEXTSONG>;
-                                    azoteq,gesture-max-ms = <600>;
-                                    azoteq,gesture-dist = <816>;
+                                    azoteq,gesture-max-ms = <800>;
+                                    azoteq,gesture-dist = <800>;
                             };
 
                             event-flick-neg {
-- 
2.25.1

