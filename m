Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 493E655AFE2
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233874AbiFZHZV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233862AbiFZHZU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:25:20 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343DD10571;
        Sun, 26 Jun 2022 00:25:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kU+5bsrudE4A/Tcp1HOKy3nolxqFMIicbAdTraPM52AYr2nzkNjx07nfMf1EGrR0FrSUVjHqU6HPEVMu1JCno+DkyEiAErVcmLVyUdYISRKmAxYa6vdCGB3jRkIrdwqUfZAX+3QeVk9+iamJ+4jtNyvurFFbC8VkWhLUiSmjLAoSKBLewNGYkgYLnP87Kjn8jWJ9O+0imYKVZxeDXoUtZp2FrONZoxrcqbr2G4rT3/mP3bR+qlVuS/uwWri6Klzzy+Ftmzg059JgA+x1BxcP31gZ9vj4WCjxZ9/ihlmrS7zOSq9NwSLKH3aggZJhqL6LfSrlKaqbBCAYQ4HHoFwVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00rFrVl0swFH6LEceOTJflMyK5slsclyhzfM8VT91+0=;
 b=MrRGj1XheUE+1lUvkAWXtnsm4nGH/NNxg1+Y/N4kkmALVV/nWF6Ryto7yRw1cZKyAnWr/tWIzyywmoxLdpHzvI3Pb3vbcH75Cy3XVnUcLpqLmeTesP3/NxGwIuLkd3DvFOiOPAmzF3Tpe9Pj8DIj3l0uxIW0jjvEt9GtQaHvfAmv8lmxZcfUoZ6PcipZ+DE6FV+iRfCcizGg7xe5tzbPYnMTtXRPnVlX9wvrH79PlyCCosoSyu2axccGVNlpuYjJsjZJgEcZcwhcB2i4Tl1lWyCMegA+I0kkhwW8M9Sg/98bXjwJouUEL/AOfiKnrGYr/NZ7xD8e9sdzz7J/2oXDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00rFrVl0swFH6LEceOTJflMyK5slsclyhzfM8VT91+0=;
 b=P3L/Vd1QBeWiNFUQChLO74uDCCfa7XbpHplQsjZLw9HqIxZ/ke3ROijklULCblha77YNVMwkEIARA93pe9WAFwDAqRdYrqmKsAbotf3ya7x6ZTKwjUO9nf7tnEaoE9DOTdjIrFzvd37zeeHXfjXZrGLshDNkEIn0lFUteWETnt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:25:17 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:25:17 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 9/9] dt-bindings: input: iqs7222: Extend slider-mapped GPIO to IQS7222C
Date:   Sun, 26 Jun 2022 02:24:12 -0500
Message-Id: <20220626072412.475211-10-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220626072412.475211-1-jeff@labundy.com>
References: <20220626072412.475211-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:806:121::9) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20b4c25a-1d72-450a-5ab3-08da57450521
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DST51h/BjgHkbMay1bYmOLoLXUUQKq6gs+2HeqOScAv+1Kh29yo4plicRyejk8G7hoS3EyUp0a9WIhHAYDgZ7BdF2U7a2KaBhwWKYeq1bbh+M8/LjYymG/GK5x0PWXz0Sozb3SCmssEln895wbTDebFa2TtYbHHhKjDX1KtwxFm7kfgL0g6KE2GXJWQKTuhhOKB4Kh626m3v1miOr0ROpl+KSdzUi0Avtxcatu3GMWP4Nz7jp+scygfhJY1yRc+azwbIUMVV1kiJRp7ytK5HcJFxOsl51lnBLpKVOBzhPo6hIxxROJ8kMAYiTEClEw6J3gq17gDXJS6LDKKKQmwbDXKmg4KTZYebnaug5++zAMpqOqznD3xsgoo7XZuTYSZN+s/ILJrDffNadj6xfHeW74Fki3EGtBEHhHm8hdUCvwIMtxuhZ+U1PC5d9ZdA+qsSswdViYbbecH4xnkseyyDa1TYVSpmQ+WO4+fcteUdl3/38wfx7eNoMt6JNzjDNQxP0uXdJrhoG/3HqvHTShSoXwnWIChgtv3AJ6WXOQ5Y2cd/oyZcAUXKvWBFIfTUgfAwXjfuklNJOb2QblfOt1cCHi8jjG4ZQsZH2jrtN+KfjV4OcAyb04AcfUVF8hZlBNrcrT8VlAsZorktrVvroT//x/RfzAUOed0U3Ms/Y+BPMbvI16nOXZ1lRVavm5Mkd3O9cqJ7SDcRkDwkG8mnuVE40JlBm/+qBPCZvkfe4VGcmKC3qUvekpLNW6MaCsTYMb0Mto/7N4GZ3zHT8kNbYkSPuhUX32pH9iSN4ifWj8lE7Is=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6666004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Abes1QiCI2cdaWLS56kb5tiCq8AvUQzhLMVyP3V4tE3LZ+QlIs+ljAAyT/v0?=
 =?us-ascii?Q?n194Fc7vu2mA7VloJT6dVNx6fVLiVXCUBSGtuPMV2l86tHFZ+H5KKenGABam?=
 =?us-ascii?Q?DFDD4w9YCnFxFKzXDZ5pooc0M0o1vHgHNptxlak1wasasH2jTNLlJ4SwU6AC?=
 =?us-ascii?Q?e3ADxwk2JEsidDR5qeLk/+ml87T6KgbRnSAgn9KW2Q2+NOlQ3wZEc0ip/2FG?=
 =?us-ascii?Q?x8RR2pW0GSutNZoRbhlyaOaSp6+V6/l5JoTUnZGTSSTsPIbLXUZiC3C06Xks?=
 =?us-ascii?Q?aeBhOSurUct1yw3eCqCHQGNelRgAt6Z2ARsAM9fSfWsOYLLnIPyPJ/juGIik?=
 =?us-ascii?Q?U2WzizLxeaxO+A84r6748Lib2T5Lx2RAdsuOVo5Mv5UWs55XbM0Lb3aFCB7K?=
 =?us-ascii?Q?kp5tXFy2opSKa/4HGF9peFDw8bqBDS++FJPcMM6DVyJW+cyXfqGezWzDxyIy?=
 =?us-ascii?Q?M+zSg/prjPS2apDNLUknLJOVQ03XxlsETjkcfFy7Kdf2FZuyJjd/eN5o1gzj?=
 =?us-ascii?Q?5OhIaeNqZZYIcaH5lvnt++KVTBtzo+vUvScL+DhvjSeTLE6Sw3eaGhoBFXf9?=
 =?us-ascii?Q?Sktanu6lDIWpij9Whh6VMCE1DHbMmq342kN//77Xu8TSPCZ55albl2vFI3Yj?=
 =?us-ascii?Q?T1FXJwYZ66pKbeZ42z+fX/pEaVRejyXOwt4V4FnzFvFDLKTTQ20ivk/s1AVo?=
 =?us-ascii?Q?5XcWv88zsGVsp7/5kmJxfJ4bb3zls0pjVGU6l12zyz3GKxaM4wMrMNXaayjd?=
 =?us-ascii?Q?MfB1vjoqbz6RYJFjth8LPA0jjnrZCROQCJXUV0e1n24jc617m+TB9gClhvvY?=
 =?us-ascii?Q?u2hnLWyD8Fj9441i00UQXyOFAPGrODJoYD8HC/9lG/qhyKuz/THJFkvYSKCU?=
 =?us-ascii?Q?Nl9CqE/qidmVrEoNqwhzQH3NWIwphrspPODOilVPMEx++AIyilKo31fj1tZP?=
 =?us-ascii?Q?3EOEJuGDVoUQxNUnJ+uUMDdYEiZpwotECvxCpxshkhHMQdS6LIGe8g5BEp7D?=
 =?us-ascii?Q?OT1U24lGgtoAE+J1GcRXaqzdNpBH4Ee5amQ5QVHsqKuRsj4F4TpKMKbwDDlo?=
 =?us-ascii?Q?lwvgvOsNvFu/aDEzhnb9tl3uX2Nm6FA7RW1ZGeQ3xGexnIseoPPyd817dAIu?=
 =?us-ascii?Q?gBAR1enD1q4mpiSiun+lfttZRVSL85XgF9JfOSQjjZCdepBOb2vIBA5FchjW?=
 =?us-ascii?Q?0m1UGyNb9Lua51Y4H4Khse7/SIrtLcHWVKWaHHtrF/VH16baoN3RfUU0Pek2?=
 =?us-ascii?Q?QeFqOxLS1weS6YFv/9vdtDxTR3SpRbV1Z22GKj6LHBIqIBIAEH53+CulFLZO?=
 =?us-ascii?Q?UxH0QA3kb5Diqu0a9ge7jJFmaOJVEgsXQ6vjbVTNbwawZVFD5pCt0Cchdch/?=
 =?us-ascii?Q?382vzMjhUmtkhWUEwDY9zykVXDy73kYfMXp235J3WyRV31cVNX/GIinVKRPW?=
 =?us-ascii?Q?U8/lVt3OGMETem7Lw2BVjND8vw5FJAzZfo0tA2RY5GGsgXozk5yvlOHIbNKr?=
 =?us-ascii?Q?wXmM+vhIX3C8SW46F0SrwLC82tpPrddlW/e323Dlh3Lc83BUend6llH6dKSo?=
 =?us-ascii?Q?CXPxIm1wy2XRJry801tlEux81rgXZjpmmjDeD8PR?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b4c25a-1d72-450a-5ab3-08da57450521
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:25:17.7872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iT4Rgzlk6SIZeVQXZKJLieFbqyf4fvMB20VqhWEd2IaT3QDVr7x110GJYURV6NxBihrPekS822nFU9B+pET4EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Although the IQS7222C does not offer slider gesture support, the
press/release event can still be mapped to any of the IQS7222C's
three GPIO pins. Update the binding to reflect this relationship.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Added to series

 .../bindings/input/azoteq,iqs7222.yaml        | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index c9c3a1e9bcae..32d0d5190334 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -611,16 +611,15 @@ patternProperties:
           azoteq,gpio-select:
             $ref: /schemas/types.yaml#/definitions/uint32-array
             minItems: 1
-            maxItems: 1
+            maxItems: 3
             items:
               minimum: 0
-              maximum: 0
+              maximum: 2
             description: |
-              Specifies an individual GPIO mapped to a tap, swipe or flick
-              gesture as follows:
+              Specifies one or more GPIO mapped to the event as follows:
               0: GPIO0
-              1: GPIO3 (reserved)
-              2: GPIO4 (reserved)
+              1: GPIO3 (IQS7222C only)
+              2: GPIO4 (IQS7222C only)
 
               Note that although multiple events can be mapped to a single
               GPIO, they must all be of the same type (proximity, touch or
@@ -705,6 +704,14 @@ allOf:
               multipleOf: 4
               maximum: 1020
 
+          patternProperties:
+            "^event-(press|tap|(swipe|flick)-(pos|neg))$":
+              properties:
+                azoteq,gpio-select:
+                  maxItems: 1
+                  items:
+                    maximum: 0
+
     else:
       patternProperties:
         "^channel-([0-9]|1[0-9])$":
@@ -721,8 +728,6 @@ allOf:
 
                 azoteq,gesture-dist: false
 
-                azoteq,gpio-select: false
-
 required:
   - compatible
   - reg
-- 
2.25.1

