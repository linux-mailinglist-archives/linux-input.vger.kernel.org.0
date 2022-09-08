Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD7C5B1E75
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 15:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbiIHNRe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 09:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbiIHNRb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 09:17:31 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DE8DABB3;
        Thu,  8 Sep 2022 06:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4llZ9lZtOau0vjAGSXV/VFyrNK3kxQbDFMOyc7svFzgBB+GT/07f4xg9l1tsZgUpMS9vjs1jv4Z5nd9c1UVyKcUMkDXN9okNlPNfGCaK+/6P2ktCdrXUKj4v90X2WpoaMxd8+6kuHKwojjPubGXkLyyC2/RkJhoiGzYyPnWzMNojzp9XVx2JgHU9/J5c9egZ3qbh0iFlmlie/xXi2dhBnhIjbZlrsTxJZKLwvdh04r3zaWen83CBSgIpEMwuoFcH88EtitSgNxHdos6W9mEhEcJIv/eO0t5nnZ25RIQ7E3qbicYmTIugiLnRlGZIYkLi9VSYXurAwggmyh7RA32Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RW6JvCzeK/n0ofZa7xvCTMTOJjIlXZLlZpPD0hgU+k=;
 b=UFAuXhkoR92E93CvY5mtqffrhQvZK4jtJM9/7QlMWp6RJQgWgKWn8P43V4QqVfCHLpWCgdoU1azMLM05dkvBHUjZxGuCjQJuGB1XfnMLpOvJYRjSobqmtIgAHBKpC4TI7sa0IBG9oE9t6koHqs4goAyV3ZsPQN+UTaro1M2+dX/+4CL3NblR0WNGTUKA1uwIre60Tet5McdqgJdB5s86MnllyxW+8Nu7T9EdBKhcfsas5BD8lY1KsMZtrknLNPqown3Qvc8Sd4m90k7qJ61iLIybu4cZObPAVGLHCVjrgzSidTi3wZDKdL9NZHsIt/ZV0kWz6qNHyhde19u/ps+uMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RW6JvCzeK/n0ofZa7xvCTMTOJjIlXZLlZpPD0hgU+k=;
 b=UAH0XEakc/xwL7szmzGgPTFV/WUC9Y1AuOTm853gk6r1hN4BTZu+Oht6tAIYrV6XerGiG/hBETES/oALPeqgSct/ikcKaQjoBlKrvKJSmpuwlfbE7JBtqJgJZO/fWUiu/Pc8RblOWrr+dyPx5xnOJu42l9ZkuHwqi9ls/QT5rUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB4976.namprd08.prod.outlook.com
 (2603:10b6:805:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 13:17:27 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Thu, 8 Sep 2022
 13:17:27 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 09/11] dt-bindings: input: iqs7222: Allow 'linux,code' to be optional
Date:   Thu,  8 Sep 2022 08:15:46 -0500
Message-Id: <20220908131548.48120-10-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6fd42d7a-1f76-4a5c-1d17-08da919c7a0d
X-MS-TrafficTypeDiagnostic: SN6PR08MB4976:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zdpQPSYLNgUfBwot18GsRNjgIcoqSrqsGDsBD2GW7yZ6z1le3DD89AV68geTetd+MNRgETQgIWUki8E1UuwtWtiqGP5YUL8Vh4aYxifFUP9/ZqIzOUr9zDm3l4RMVPKvhNj94O4OJYODNOC3hW9/LjEzqf1tSWwh3+rTkze/NIlakblRQBIQxXFOv9C6WflmFlve61o8Vo3efmF3geCRuu3EInlXyy6HWfIxe6JlbmtPwqznlBdi2E8YdbhyMH/s4Lu8eQMEuMm0n8LobRTLHL1tAbgOoUCOEemB/4YtjNt/WnvqksTWNCFQfBA4GZU/nevV+37rpoen0iSOy3oT9pi70F4qQ5Fx6FPhhls2uMS+n7v+t9itIL+dLp7DMfb7eyJiFXQd+jujinP0D7CTwJtGQR7MIHgk3ENsrgO4KTLKWzXuedvLR4aRTJC7HKZwfv0LhtVtY70K/H9rn/T7934P17/Rl8DzP+1WcUtrYnfIe2q2F4d7HMbXzl53pC28E62ljMocp/CTN8IRwIrG25e2lylzxYuW4BP16O+xiGfECfbbIEhNclq/pPg/Jgmqw/q9sd2waVh3B6az0xoG1LlEs0tvJ+GDMwrhqIrxgVdfeF4YL3lQgNYuCuKRnM31VU0ygR5r/c8bRHzlzu6Lgy8CC59fKgsATaFT/XNNEmNMpqZOxGK9YT2wYh3U6p2MILgDpFBPSLmV37r6B/3BMdj46p4R5Re9C6EmJfvFZKgefgiGW/j6ZgZDzbGv3OLLP5xG+0xdJdWJgMxvkhKTWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39830400003)(346002)(136003)(376002)(8676002)(66556008)(5660300002)(66946007)(86362001)(66476007)(4326008)(107886003)(52116002)(2616005)(38350700002)(1076003)(38100700002)(186003)(8936002)(2906002)(36756003)(316002)(26005)(478600001)(6512007)(6666004)(6506007)(41300700001)(83380400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E9gOhXLp2qWcD0tB2wwOUzU6M7YO2J5iTcJXggBSgJIPcYI8/l73vOMMUbha?=
 =?us-ascii?Q?OvkDprpBgwA7pb1z6e4mON8WuFN7HMX4/Hq8r1bhle8jhxIUzWvcMqWtb+JD?=
 =?us-ascii?Q?PEcZcBy92U0m2STNFaK3xp3aG2MTrNzNfGEy3tjLFYymdOkVW40pc5A6picu?=
 =?us-ascii?Q?+1eKVgbd6cBTBXrk6G0DjFPI0tWUsPrxQsiO1ITF/owPIkagRfoLKfNc+jfW?=
 =?us-ascii?Q?JRXaLTmos2t/uYR/nv1FSIqtzBpxV/nPb8dKjGm23/hWK0GbrtsXQS7cSSfJ?=
 =?us-ascii?Q?+drURSGyxNcHkK4w7U3JfGZigVOmaLLtVN+vtuZK/uKB3s3HxCj4BczA7di8?=
 =?us-ascii?Q?4GR/zaerSoqKBA4SOtL0QZ3TfiJDy8nK/TX8bnFFerJYc63/eTDOVtl0Afi6?=
 =?us-ascii?Q?UNGdLcKPDSTw1HQJkuwEX9KRAkc2sPlUvcKG+OthHEvoN4nOnjqorpgdWkvF?=
 =?us-ascii?Q?XFlsCOh+8Bo/IPYFkaYXG/JW11IrWX6YetScASzge4z0gqzKM6Gz6hV8noz6?=
 =?us-ascii?Q?euA0ffb5DywnULzcIKDt5NR6Zi/6y/KyGzsFcsKA+BED2/HXiYga/9nkVKp/?=
 =?us-ascii?Q?Nxrwwg5mrC5t1pjcbY7Wp/ReXssiyzsZv/AUeYcIXFYovSu2mZMlRcNg39Nx?=
 =?us-ascii?Q?KPPDsFTvu1M+0mszZ4+XU2dSju+tq/eB6S924JCuopgng8NQxcvFbv/h/mpW?=
 =?us-ascii?Q?UYJdGP1gL4C4XWTPcytlyQ4hE1sjz1PGUAcoT4qQtC8sXK2Zy6sMdo2TTleh?=
 =?us-ascii?Q?TGPtlowcPsV5Dd0zGf7yx64k7nCZEs/wFrSZgrVeaLeYeKXwgWSAeGMp1Fwk?=
 =?us-ascii?Q?eokFbOMxWi0zNC6uTjO4XT7zsLdgefzvYGC1VHJIUq7WOA0iIEqlPA+OO/gE?=
 =?us-ascii?Q?gdMfLJVefS9DsCz9dl3j6V8OhsWASr89W7pOCR/0qSl9oId6PcLkSD87NlUy?=
 =?us-ascii?Q?o8E9FcEx8+6QGv2kdq0qEow3LXjBxF7JYWzYEXBAAJAIxn4GKrt2akhb3Ud/?=
 =?us-ascii?Q?L/etaukklSVMbEqEEDh1NTu73cpUU7o66q6/1bpd3t6UsGEoJOoC2PLNeG0z?=
 =?us-ascii?Q?RnlkFOeuK0maL6d+vnjVkPZFbx4yWMmb9r/foux1XC0HLLSs22+TqzitpH4H?=
 =?us-ascii?Q?WwH3uf5ofEdbfh838HHVeeagtuMSYKeqAgF9ThKooz8w1gfLMl5a7v4MpXAE?=
 =?us-ascii?Q?daoi9QOIeoWXYDxBy2Xa4ECeLuPQ/Fu0fgWEeacZglVaCG/UqKPUtbVo7Om3?=
 =?us-ascii?Q?NJZEYAxQbqgJY14hXycCh3xBQT9dd6Nm+Iw/E6YoMeBNy85ZfFY9GQplgCMR?=
 =?us-ascii?Q?pZBtexxqlYaaDQGU79mVY12UsHWyeIxI/C3828rsBGsuYCqj0/djieoPYEGU?=
 =?us-ascii?Q?OroowEyB9A18LmzypqNy6Wv6xh/zhrEyiLRB0r6aJLbCc7SxooFYzK0PFYPN?=
 =?us-ascii?Q?lSkbGzFSFD38O2PXpML11uPaqmtMzglKjzP/9fM8VM7YxUDk/O6KlCbpMKLs?=
 =?us-ascii?Q?RZIrkU68yeNKCRejgxPSycZJBeIswVKGpM+KdbEtafB9zg908aSU9rYvUBON?=
 =?us-ascii?Q?iPRRrGuoAUFFalm/EmCCjtUSYjRF8ReclDLpM2YB?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd42d7a-1f76-4a5c-1d17-08da919c7a0d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:17:27.6670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvl0Bd0HBMatYCZ5QkBrvDPOeb1gtkT5ugnBGlZeON2apC3whVm97TflarEXym/PephcEkdsfH8ovSQXSzecyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4976
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 'linux,code' property has been made optional in the driver;
update the binding to reflect this change.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 785fb9e83354..913fd2da9862 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -473,9 +473,6 @@ patternProperties:
               Specifies whether the event is to be interpreted as a key (1)
               or a switch (5).
 
-        required:
-          - linux,code
-
         additionalProperties: false
 
     dependencies:
@@ -620,9 +617,6 @@ patternProperties:
               GPIO, they must all be of the same type (proximity, touch or
               slider gesture).
 
-        required:
-          - linux,code
-
         additionalProperties: false
 
     required:
-- 
2.25.1

