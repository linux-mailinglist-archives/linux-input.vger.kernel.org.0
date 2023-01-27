Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 284A867F11E
	for <lists+linux-input@lfdr.de>; Fri, 27 Jan 2023 23:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjA0WaQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Jan 2023 17:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbjA0WaO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Jan 2023 17:30:14 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16CD8625F;
        Fri, 27 Jan 2023 14:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC9bUUmscSyzGlOEmyFTyaVgvsGyq1y79DQqxKWVJdKVSqYBLckZw5usm+uDe326IoaexBycMlnJP8KUFjUiaUO1SbYzD9qB3avJ+hFR2uPp9VUpKYskMfxzqm5WY6kgieZPd7uXptrfOGZ1oO8rEx+AlWpy0kEhx25nGrSx+hNnesluZEUnK5x55xmH7UhUHVKPs9CuHV6o1qoukmOuk3BH91HJjBCerp+L/qZyAlJmFqr90XpRu5A/mPBZiGMVsPrztNB8nKYqBmovW+nP5D9c7NiFzbZ31DhYRS9BAr1+hLTukwR0kTJbKu89FofbylyArchoWJUuDP6Cl0YCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69UAOFUz0kG45Apsd0iB0G/rnZ3usiocFPsBseFjChU=;
 b=SPOJHJ4Y8ne+ucJ+gkOXAy31KN8JzvDKuB1PfzISdBNhbHQfBaxfjBzxiiJn7zrFfFVrk+rUCv64L4K2otAo7VjUz+yfOBOlejaKORRrNnhSGGtZbzUEy/z1W/SENB59/tKj+Io1Lm2JV0xcfLotg1zzet+clUPzdcVLs3GIdBlR/+3F/bg5rqZ1ftcIh74nrvPLdoVXAkFi2bjLT8GFZYKYKKrfOOZSkepUiLfsatdlJnuOi+ytzKNKdnAXaBASddjxgLyD/AZtqpDKwkOy9/aU/tc28nKUgNvA91GLifh3+F5PQfRUwy08StYsS81MG+gs4NbrTgJyIKaSF7z8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69UAOFUz0kG45Apsd0iB0G/rnZ3usiocFPsBseFjChU=;
 b=YZXjNjRYN2u7jIOYfqd0RcwDrt1k/mhkqG6CZcH/1Oq0B1g1pRPOHyYlruJjUqjLNFBFtEzru9CimljPmcQruD6RF94LCplfHRwd2xPIYss62gMPRHc3Wwf7h2yI0gw9TUhcUDoXzHsI2TqvIo3cBmZdOtlgfFzum3GxcoE/8no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7035.namprd08.prod.outlook.com
 (2603:10b6:510:93::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 22:30:11 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 22:30:11 +0000
Date:   Fri, 27 Jan 2023 16:30:09 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 2/2] dt-bindings: input: iqs626a: Redefine trackpad
 property types
Message-ID: <Y9RQcddToBr1rrnJ@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9RQCQa69f3TaiWf@nixie71>
References: <Y9RQCQa69f3TaiWf@nixie71>
X-ClientProxiedBy: DS7PR05CA0086.namprd05.prod.outlook.com (2603:10b6:8:56::7)
 To SN4PR0801MB3774.namprd08.prod.outlook.com (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: df48f323-7f60-41ea-67fa-08db00b60d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1heU0Vx4TnIB+ZSY/UqlxU4js3xluvFcof2UFk1D+jTIqCqJuxErrpJKR1xCFvWLGz0prkR81YKB7p6hnR0+nxJK5O9c17X5Ydd3aT3A99X4gso/z/QgwbG6WA7f50IEeF+RHk9U/P4ygexa77plCh4lOGkG12ROIgWJG9mSrdr4pnjfQkVVStr6Vbg8GvLPn+R+DwfKXBz7UkLOxYvbk7ZqBTTqW5LQD/wpUn6BzhVgZrCuZQMGayKXVzv7tdEt1L0Q3gY4oDDTVNOFDdCxnPc2nXzFdNAKjeyoxOyX38WfPanoL1utIjaNEj3UYGzmMaAxBA7S9alUz45Q1YBV8JJX3vD++aOwm9FmMi8f13ccHUtM5wmhFbPcbAPanw2wJi5lbfpZwf3CZRZjNyRzz+AFrF5Jz2OO1+HYAYhDxYfpRQJkzpP7yltwqyApVHnjaW9q7nRWLpDWVDd2nXSJ5PoW8yKvhyNRT5idzHgUKyaLUgSDsvQgDYvWNYOLlQxR04omX7IVQn1L84tVSopGy92KphGqFEExApQOX2Kmu/EjsMC2+6XVlTLmbufDZJODpV2aB4gSDcuiqSYO2vq/VGzYRfexhtJ0PRr7GgQ2uvBOq5NiHfI1Ysvc1eOW9Em3Aw65QkqAddNL5Ca7bZUhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(376002)(39830400003)(136003)(396003)(346002)(366004)(451199018)(2906002)(8936002)(5660300002)(41300700001)(4326008)(8676002)(316002)(107886003)(6506007)(6486002)(478600001)(83380400001)(6512007)(9686003)(186003)(26005)(66946007)(66476007)(66556008)(86362001)(38100700002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jMxyBTZkE6sGHIhXhLy7xS32noNfBOFfgvKoZV6D5lSPTdV6PbVtYo5uKUqB?=
 =?us-ascii?Q?88LBvbfv3ecTvHn0KuYZG7ChiCie5bKTep0yD+gtvUgxXPuQahxZy7vWFifk?=
 =?us-ascii?Q?IUS1cwq5JVr+IScf1r5OV3BJro8KnetFbT3Q3LAuTIRDq3bpEcoChgFy5Nrn?=
 =?us-ascii?Q?DZ7TgR2dSdliqMWuP/HjeakhyzuMofi0W+KCp+qd+lzC77mnxaET63X2GMFL?=
 =?us-ascii?Q?Kxvt938DdRklNc2tSgP8y7TWc0x7s7lbgDO46j42WYOl3GNRz3t2/cDClLcA?=
 =?us-ascii?Q?VDmpVCk0/GYvx2QriXoTeDdGsIrHsh+yZOcwlnIKt3bAvAQmC4bfZfTfEB/a?=
 =?us-ascii?Q?tIZawC/Q7JGpcaa+2+pffRgCk/10Lhwcs94EUGe7C9dt2nX/eo3NvBgeeAsZ?=
 =?us-ascii?Q?HpaXJ/gWLcNii+gs3arCp+ySBNvYUftIT6LFb+7J4FC6vytGc4MUbfixqQEF?=
 =?us-ascii?Q?HREWs7xJz//4gcPDR2cK/oUgJkT6UDCWTuImhiO09lLqsq1B6POGsw72Sm+U?=
 =?us-ascii?Q?EoBFSxvQucL4/WQM9LikSpnwcV48ynX/G3OCHfi7SFHvuY2+6KTIMQ4qd+kz?=
 =?us-ascii?Q?CwdYBvdDXzLXyDOpyzvD+lOdm+tpDYbjh/FLg9w6x5ljHE6sbIYy7GbPsWaN?=
 =?us-ascii?Q?egRU2uagV59R3pTGLCyvcvTg87uZbM+ofleAurjo8GrGRy280KEwYaGhVxOC?=
 =?us-ascii?Q?8CxyF7K27OmiGfEwlpCPp+d7Q5VizQbZzvZYbatllTxPV4fnRGOtnkbKjGlQ?=
 =?us-ascii?Q?fRsL03YS5zPkFNiPD5WIAnEqR9inbc/JY3fx/DTPIj7gOKOPMbrr64ZRFAeW?=
 =?us-ascii?Q?6SwU2zbGedMq8ULZN7z0AQXljsuQIo6sH9stmNVkk4g8nb7NAP+OJt4hH+No?=
 =?us-ascii?Q?wfwcmwZ9/BETOkqFEBDaGyRnkUOQ5Na+vKpgFSTLia2aVm84q3wRYF7whk/W?=
 =?us-ascii?Q?zS0KIPfwF8+dgVU+nHu0exdJb50hSidN1J7u28E3364XNxHeP0tFI17bZL4Z?=
 =?us-ascii?Q?yUK4PrG0oaXHcE1A//nXp/UGKukeYV/FFaT5UBfSD8CNrkNr/xMllm/Jvgp5?=
 =?us-ascii?Q?zv6U4CnSxpVYLn31opBGfk0TLB5OH6DyrJ9La8nE1La9TwfYCuOdbmGvAIWa?=
 =?us-ascii?Q?mzBeDmwedJy87HNBEGFjQKtaj/Y100M5fhHJ2BXf0DSrS6/5zC/kcSlncGUg?=
 =?us-ascii?Q?JGTlKQ8DvVRBM9hICHSXGtBgJyLYMIy3JuDhyZ5BYv9U/sw5lDhigC1XRkZI?=
 =?us-ascii?Q?KEmqY7X9nGEv7jMFNYfY0TfJoXMkK0QBv5gqDytuwHkp+ywUEJeRYJxwd6aD?=
 =?us-ascii?Q?4PF3h6i4Yu0hhKhxj0X/QU/LcHrAdKemLMa6G15iKt7EI4EdiTo8G6vWERYm?=
 =?us-ascii?Q?x04CTHt4pVhBKT0Jm7DgQOHL6ZXrf5h9JTCoD/PfrS/LvIHQGSiAWfIsjxbu?=
 =?us-ascii?Q?jQea021gQ+dZObg5MCPvEZ2mTd9/nUAfoj1QMAVHuthaZlBv9h2p3rJIRh4Z?=
 =?us-ascii?Q?aoVuAbeUoLCSzJ+ri1tJE+z5//js/zCxxMKJFXA2cnDw/wYl/9r1hfBNRRUF?=
 =?us-ascii?Q?5FaO8C8n+chjOFXz7lTT6xniDhvlFo34gmWhyuGU?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df48f323-7f60-41ea-67fa-08db00b60d72
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 22:30:11.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ym0kb+TuWeHrMWzVvsg2vC6bmXKrSRBKEVzSvCbpdj25vHWffPo6ZJXIg800mTwzh+7wk02eH/Tw+bwVX2HOEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7035
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Following a recent refactor of the driver to properly drop unused
device nodes, the driver expects trackpad channel touch thresholds
and ATI base values to be specified under single trackpad channel
child nodes.

This enhancement moves both properties to scalar values as opposed
to arrays, making their types consistent across bindings.

Fixes: a8f1f0dc865c ("dt-bindings: input: Add bindings for Azoteq IQS626A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Added to series

 .../devicetree/bindings/input/iqs626a.yaml    | 94 +++++++++++++------
 1 file changed, 67 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/iqs626a.yaml b/Documentation/devicetree/bindings/input/iqs626a.yaml
index 7a27502095f3..e424d67b0542 100644
--- a/Documentation/devicetree/bindings/input/iqs626a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs626a.yaml
@@ -564,16 +564,6 @@ patternProperties:
           2: Partial
           3: Full
 
-      azoteq,ati-base:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 6
-        maxItems: 9
-        items:
-          minimum: 45
-          maximum: 300
-        default: [45, 45, 45, 45, 45, 45, 45, 45, 45]
-        description: Specifies each individual trackpad channel's ATI base.
-
       azoteq,ati-target:
         $ref: /schemas/types.yaml#/definitions/uint32
         multipleOf: 32
@@ -620,17 +610,6 @@ patternProperties:
         description:
           Tightens the ATI band from 1/8 to 1/16 of the desired target.
 
-      azoteq,thresh:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 6
-        maxItems: 9
-        items:
-          minimum: 0
-          maximum: 255
-        default: [0, 0, 0, 0, 0, 0, 0, 0, 0]
-        description:
-          Specifies each individual trackpad channel's touch threshold.
-
       azoteq,hyst:
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
@@ -720,6 +699,28 @@ patternProperties:
           Specifies the number of points across which an axial gesture must
           travel in order to be interpreted as a flick or swipe.
 
+    patternProperties:
+      "^channel-[0-8]$":
+        type: object
+        description: Represents a single trackpad channel.
+
+        properties:
+          azoteq,thresh:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 255
+            default: 0
+            description: Specifies the threshold for the channel.
+
+          azoteq,ati-base:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 45
+            maximum: 300
+            default: 45
+            description: Specifies the channel's ATI base.
+
+        additionalProperties: false
+
     dependencies:
       azoteq,gesture-swipe: ["linux,keycodes"]
       azoteq,timeout-tap-ms: ["linux,keycodes"]
@@ -780,14 +781,8 @@ examples:
                             azoteq,filt-str-lp-cnt = <1>;
 
                             azoteq,hyst = <4>;
-                            azoteq,thresh = <35>, <40>, <40>,
-                                            <38>, <33>, <38>,
-                                            <35>, <35>, <35>;
 
                             azoteq,ati-mode = <3>;
-                            azoteq,ati-base = <195>, <195>, <195>,
-                                              <195>, <195>, <195>,
-                                              <195>, <195>, <195>;
                             azoteq,ati-target = <512>;
 
                             azoteq,proj-bias = <1>;
@@ -804,6 +799,51 @@ examples:
                             azoteq,timeout-swipe-ms = <800>;
                             azoteq,timeout-tap-ms = <400>;
                             azoteq,thresh-swipe = <40>;
+
+                            channel-0 {
+                                    azoteq,thresh = <35>;
+                                    azoteq,ati-base = <195>;
+                            };
+
+                            channel-1 {
+                                    azoteq,thresh = <40>;
+                                    azoteq,ati-base = <195>;
+                            };
+
+                            channel-2 {
+                                    azoteq,thresh = <40>;
+                                    azoteq,ati-base = <195>;
+                            };
+
+                            channel-3 {
+                                    azoteq,thresh = <38>;
+                                    azoteq,ati-base = <195>;
+                            };
+
+                            channel-4 {
+                                    azoteq,thresh = <33>;
+                                    azoteq,ati-base = <195>;
+                            };
+
+                            channel-5 {
+                                    azoteq,thresh = <38>;
+                                    azoteq,ati-base = <195>;
+                            };
+
+                            channel-6 {
+                                    azoteq,thresh = <35>;
+                                    azoteq,ati-base = <195>;
+                            };
+
+                            channel-7 {
+                                    azoteq,thresh = <35>;
+                                    azoteq,ati-base = <195>;
+                            };
+
+                            channel-8 {
+                                    azoteq,thresh = <35>;
+                                    azoteq,ati-base = <195>;
+                            };
                     };
 
                     /*
-- 
2.34.1

