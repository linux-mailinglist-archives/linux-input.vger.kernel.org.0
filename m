Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06C96BA5D6
	for <lists+linux-input@lfdr.de>; Wed, 15 Mar 2023 05:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjCOECU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Mar 2023 00:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCOECT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Mar 2023 00:02:19 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114F03402C;
        Tue, 14 Mar 2023 21:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTZbbUCuVaMG13BovGaQBKlCGTt5u5DcO6beSai27DkCGYt3ndH29h0p675tjyK7rfaw1FDqkinsVBpgwLr99aTcCr6zU7UK/L13ge5vETJ/UUPffrlbtzNF1qc/QI/6YLIHhYdKF7Uj0erB3qdBuhf6Bb8C7rJfDQYkDMyCqGR784baQH9g6qXYtFZ6qDzn34L9T9WJuf7ikr1XNpXLHWnwif80IbsGj/QVn0w8axskGTY3JgbG1so5SUa++EXIaPldt1UfbIGfezZyvQsKbrR0smSE52ViF9+FCqf2Ay3NgDs8fJ+HG4KYA35NIUyOEfEQlKcenLND2uFSfYTHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoKWlroqSJwvZksGQMcLleLe6BXzyWOY/+HRNSjMYrY=;
 b=hxyZoob7M+GRXKRV4Tlnb6s8aLG8g112B2282YtXn1+Vct3jA8yN5XeFAZG/hjVHmSRHelulq246OaeiS5SlZgXpFwyy5os3egIZBRQ2PmBgxW9dMW8OY2E4UMRqZ68W/c6rnrdeH+Fn+dzw7g7RX5w1K7CcHBozN0kL+XX4UDF4Bn+wFXzm6UaAdyw+/zgs69j1qHp3d0XK9pgH+2htTSgSHhI3S9hhHMF+Zwh2GKOBOJgyGgiVHhxeX6vjs+6CFfYNyktm0EhZD2Jb1Ucm+B+I932/I05U3s2KiW3OLKb2D0gGw3holRM8U2YcHpjLvJLMQJfi1C1LGKhbTyNCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoKWlroqSJwvZksGQMcLleLe6BXzyWOY/+HRNSjMYrY=;
 b=wTJlsyst2eMV4Fv68gU2dILGsmpVAotZ0i4qRy0EMYU1lIzcIP78e7+YbhRczSkYJUfMXWLV3gNmNM0VmDViJiwmcLmffRaqTSINMS3e+0t0Q7rV+BIiH27L/Trhu/k5+d/U8MMldbOxuPcHgqN53t1rWCwc5liSXnINhLhb6hI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN0PR08MB7487.namprd08.prod.outlook.com
 (2603:10b6:408:157::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 04:02:16 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4%6]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 04:02:16 +0000
Date:   Tue, 14 Mar 2023 23:02:15 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 1/4] dt-bindings: input: iqs269a: Add bindings for slider
 gestures
Message-ID: <ZBFDR0k9IDt4dorb@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBFC+e/3JcYITClP@nixie71>
References: <ZBFC+e/3JcYITClP@nixie71>
X-ClientProxiedBy: SN6PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:805:66::30) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BN0PR08MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: f195dcb7-b2de-4209-9e9a-08db250a107a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XRkRR983O+SFrPsMUk7q0QcCIumJhzup4i9Nr9OPMh0tO5A02Z7Ci4AH3XmKZSQPZKHfMZ646cGr39SaMRFB+Ra7P5jTHN9RI6ndD1EOBRu2Tci+DmXayxO0ILtEcl7JgO0FuCb+22kOaNGwpdAKAiER9+RNemAmel4eNaoNlgs/dibQuKRZ9HW92gFQSNaBGs4UI+W0bqBsit7Q38IFWTcSeTuTj3ZQqiih6rKdseTvqebqfalAe5fZ++peeLC4Sznl2/Aw5k0hZP0qd1tgcu1zkc+0f3W8RLfza+Zo4zVzmciO2dZYpyKYO8Q3XzBRzX3+Wxi6YoeIMOYstaS63c9doAJHMfOIkyAqULFyfbPutJvf6ZLuPpUpZbZodQO2XrcQlxoC9XzVlKSOjM53/+cUdAu8grRXlhZ7jwdhTfjI9g6wpSLSCWVPPOqOIRqlGFyyueJhAEjvPs7E3UPEPVxJ3LMGov9+8A+7K/0HXivCNysm/ig936E9zL4MjPXkY3K0MvUxB07oyNET0hRREi/6PU476ARBkkCbw50mmouPXnNm1vKaJlEbRP4+Q/X3JwwKAMNT0gzmyEadcib9IwgG3n5xk/91JpFLHdCS4bYyPMeu2hBGval5LwVXIpTJpLOFwx04D13GlHoebbsrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39830400003)(376002)(136003)(366004)(346002)(396003)(451199018)(86362001)(8936002)(478600001)(5660300002)(2906002)(4326008)(41300700001)(66476007)(66946007)(8676002)(316002)(66556008)(33716001)(83380400001)(38100700002)(9686003)(6506007)(107886003)(6512007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hP5J0TFuyeVQgLs5L2J45UuIwNU6NdGw2Pp84+H768lk/xdvMUXdnQUn2vD?=
 =?us-ascii?Q?n1X6luwA/smZ2ZAayCZ46ngUeXzVDRcXqy1z8CYtj6fG6PaZnKqy6N6QUOAz?=
 =?us-ascii?Q?OL7GCh2tZSeYXAizBe3JCGeM6itaeZN8109L9i/zPhftvLaC9GyEufxtoTdm?=
 =?us-ascii?Q?7NoW11CmUfLst3B/D/i9zj8Z6tLVqvojreC3QkQeXQNDxAWX2c34xbp2L2/h?=
 =?us-ascii?Q?VddI3umyaL/D35LYH0g/OqQu1gKM+IXYuWzlJduGL8sX3DHfrY+cnmOLYpZe?=
 =?us-ascii?Q?rtsgcqk1kQbwdpy9ckC+YyUyGFX1mRVq4DhRFSRW2T222jXRVi0bx5MB/cDp?=
 =?us-ascii?Q?hzOVI9X5Z17WdU2JahnOO3BtqnHyIiAe4rib0w6588xLRWCc4uBfJFnwykOw?=
 =?us-ascii?Q?QfVOgOI+o8GrZXEkjbVKOHiXFU0o/li2WdiSR9tz/7YbDkXyctdEOFbU0Ub8?=
 =?us-ascii?Q?Empw48SDCwaFNvWqnXwTGaKTvh6YZnD63SzPYRPbE7QAQI926DqbWyPtpWkp?=
 =?us-ascii?Q?WwGH42s5qCtqikn5QFERZN9+HxO10PNXWCgZMIayAMVmp5YlsUJNRVcFRCi/?=
 =?us-ascii?Q?7o++HKG0YCrJUQ4mL0fJoykqR5U9nxagx/iPFZOlBIBm10D1RoWhdO3u3L3I?=
 =?us-ascii?Q?QxXxl4WKpFWzt4OJWP+2kbQKhCAclXFoqCxgedGZiZveDT1k9R736cmpGLgy?=
 =?us-ascii?Q?JoDlm5z0mpfd8Qttfd84wc3/6jE9LFwwVvpzn/ifTwdOsAjgKa+k828mfYc+?=
 =?us-ascii?Q?QlqXQc+C/8Ac7VZKvt1/tBiduA2yL6tOyRJNmUJBZ6oE1dS4kGmc3vvXetKD?=
 =?us-ascii?Q?iN9y45+hdOV+ST6PROpG8cy5seHL//N26X5rK0Z9R/gEU5VIJ6RZiW34q1Cm?=
 =?us-ascii?Q?qXWBnaCFnn8S3KkttH9PXTnzyJARMPyGHQzE3gPnljmknCrRl6MYpzTqRWHS?=
 =?us-ascii?Q?PYTuI2bj1mfQ/QNdE/n9voIHb+nF9nFsq4aPKWmFwbyhjkD3euc4A8CbK8JZ?=
 =?us-ascii?Q?l9M542tDffc2sZmlXfaFstNbLGK8cNiAWl6h2OsTEN/vKQEKGpqI/CxedSO3?=
 =?us-ascii?Q?hDjNlAgouTMYuL1VTHiuCPiCk5jttUwOKDQiRTmcShVMwnV8SxzIClBnxysD?=
 =?us-ascii?Q?FQ/oIT0VQLogW9sTTMJcDVH4niewlLje71XyILqqhouPgeFLO9Uajmz5hXz8?=
 =?us-ascii?Q?5n2CK9ej/Hn6ZfdZVoZWfFatxqUcCDS+4kdTu17+BldpBlGmd6mzjXtb6DlS?=
 =?us-ascii?Q?k+aWWWB3lCo0qFaHc3hw6XSD/cKlik+i2s1gogDOfdtNR/nDCsbGK/b8oLnt?=
 =?us-ascii?Q?Q5OncbCFB/SbKYCrrFPgs3RdUfUEeVtEy+301BoO95a7hSvAyphdV/AD62pA?=
 =?us-ascii?Q?w5QZDZTg9qRO4MMmsIKBvmugFV8ZyhT1q1ROYAtFS0nq2xRf1nRl58O39wbQ?=
 =?us-ascii?Q?7ACaFzqgIhv/HK8bZFeMY6uZxyMriQ1uyVC/DkTHrKidY0pKeZmrafJNoPd9?=
 =?us-ascii?Q?m3EHkWy6vtsGcsrupYM4iahLYVcWvgbl8mBbVJgNSxaFcHI17+ezW+3mWAbe?=
 =?us-ascii?Q?rZz1siynx6+OIcDjk+hXY4VQQy5xkKS/NzzjeGaI?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f195dcb7-b2de-4209-9e9a-08db250a107a
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 04:02:16.0835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3Y2Ou0J1O2D+0Z89hhFFpBn4FnUlGz4gBozPMUavgUILeL+GQQm9gh9b2Peno/M6UIgGKIss9BcaGpkwZZQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7487
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for slider gestures that can be expressed
by the device.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
 - Renamed 'azoteq,slider-swipe' to 'azoteq,gesture-swipe' to match IQS626A and
   noted it as depending upon 'linux,keycodes'
 - Dropped the $ref declaration for 'linux,keycodes' and referenced input.yaml,
   which has since been updated to define this property

 .../devicetree/bindings/input/iqs269a.yaml    | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
index 3c430d38594f..b42f07542d27 100644
--- a/Documentation/devicetree/bindings/input/iqs269a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -9,6 +9,9 @@ title: Azoteq IQS269A Capacitive Touch Controller
 maintainers:
   - Jeff LaBundy <jeff@labundy.com>
 
+allOf:
+  - $ref: input.yaml#
+
 description: |
   The Azoteq IQS269A is an 8-channel capacitive touch controller that features
   additional Hall-effect and inductive sensing capabilities.
@@ -204,6 +207,63 @@ properties:
     default: 1
     description: Specifies the slider coordinate filter strength.
 
+  linux,keycodes:
+    minItems: 1
+    maxItems: 8
+    description: |
+      Specifies the numeric keycodes associated with each available gesture in
+      the following order (enter 0 for unused gestures):
+      0: Slider 0 tap
+      1: Slider 0 hold
+      2: Slider 0 positive flick or swipe
+      3: Slider 0 negative flick or swipe
+      4: Slider 1 tap
+      5: Slider 1 hold
+      6: Slider 1 positive flick or swipe
+      7: Slider 1 negative flick or swipe
+
+  azoteq,gesture-swipe:
+    type: boolean
+    description:
+      Directs the device to interpret axial gestures as a swipe (finger remains
+      on slider) instead of a flick (finger leaves slider).
+
+  azoteq,timeout-tap-ms:
+    multipleOf: 16
+    minimum: 0
+    maximum: 4080
+    default: 400
+    description:
+      Specifies the length of time (in ms) within which a slider touch must be
+      released in order to be interpreted as a tap. Default and maximum values
+      as well as step size are reduced by a factor of 4 with device version 2.
+
+  azoteq,timeout-swipe-ms:
+    multipleOf: 16
+    minimum: 0
+    maximum: 4080
+    default: 2000
+    description:
+      Specifies the length of time (in ms) within which an axial gesture must be
+      completed in order to be interpreted as a flick or swipe. Default and max-
+      imum values as well as step size are reduced by a factor of 4 with device
+      version 2.
+
+  azoteq,thresh-swipe:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 128
+    description:
+      Specifies the number of points across which an axial gesture must travel
+      in order to be interpreted as a flick or swipe.
+
+dependencies:
+  azoteq,gesture-swipe: ["linux,keycodes"]
+  azoteq,timeout-tap-ms: ["linux,keycodes"]
+  azoteq,timeout-swipe-ms: ["linux,keycodes"]
+  azoteq,thresh-swipe: ["linux,keycodes"]
+
 patternProperties:
   "^channel@[0-7]$":
     type: object
@@ -484,6 +544,14 @@ examples:
                     azoteq,hall-enable;
                     azoteq,suspend-mode = <2>;
 
+                    linux,keycodes = <KEY_PLAYPAUSE>,
+                                     <KEY_STOPCD>,
+                                     <KEY_NEXTSONG>,
+                                     <KEY_PREVIOUSSONG>;
+
+                    azoteq,timeout-tap-ms = <400>;
+                    azoteq,timeout-swipe-ms = <800>;
+
                     channel@0 {
                             reg = <0x0>;
 
-- 
2.34.1

