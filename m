Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72AAC74C67D
	for <lists+linux-input@lfdr.de>; Sun,  9 Jul 2023 19:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjGIRHM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jul 2023 13:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjGIRHL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jul 2023 13:07:11 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88848126;
        Sun,  9 Jul 2023 10:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMe3d3gug7Wt/uJYqP5PyKoTTWLplVdp1PBmxEZuV4K7PeBtudvsg8Jyxze8oHmRM96KhyM7yR9FrIVOAm/z4G0AvB/mCkqgmpLUZk0m+IiL2d2lspPTt2lJZIFv3a/8MfQTRMT+zMvAdTY6NAB0P94nqDxAmVF6fYtFHY0f3+n7TpV3xkMD/WKbUkd0/GMw+x0yVC1WXWC4j4VNVlPuACSn7h4yj1d5cPSUSI8I6nFQP3A20idCzK3niLchmhbpB4X19VsB0fXW5z+vxaUIUFNhpfp573ogJ5+ym7JNG/e6MeBwK63ugkmk70U1EaHwevxnylpptzL8E0FOkdymtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjEMF61EFWqR5SbYouY/Tz6F9CG2rdvXCQUgY9j3YnI=;
 b=fAZFvpPfmUVSZGLJrnTcM5G1CuO5xfW+ewvOj+8AWwsz7CUzLAQ2uF8yDAcgxtneViWLHW8fpM+7sRUy2R+PV5RvTM1cjxpIchVOV1ukiqJufm9iisBPeEEL9+i0kLQTErqP6bnCRbK0CwtVWVzMzqn02hrLrVgdxSPzdRqXWam2BsiBKJPzFLoSanYzuK1+AMLID3W3x2dF5GR9C6952s5hCAmIaNyIal/15cLmU5/CgTxAvUqZTgKnzheIZ6PQY0AtGskIWeJn4XXSo+HXHPDlY5LG+Q9F8Z6RAzX9i6IDJ7Syvd39HrdN7jLvjabhyPIWd8q8ULLxQzBIxFN4CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjEMF61EFWqR5SbYouY/Tz6F9CG2rdvXCQUgY9j3YnI=;
 b=LELmixv1rpLlff3Qsju3V43bJCRjalfPHkBwOrRqSQj2GuPAJ9/tggeW4cMxE09K9ERg1BNbiLamfMvO1pSObfa+h5ZHC6u6fwc0E2VPKTbzq/yHDn0ElPOvKrDVMlcunwnX1EGkV9Uz9x5vJWG+d1BbVcAu1pq7YB6fR73bTaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB7020.namprd08.prod.outlook.com
 (2603:10b6:510:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Sun, 9 Jul
 2023 17:07:07 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36df:48aa:beb0:47ae%5]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 17:07:07 +0000
Date:   Sun, 9 Jul 2023 12:07:05 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 3/4] dt-bindings: input: iqs7222: Add properties for
 Azoteq IQS7222D
Message-ID: <ZKrpOdp+rM8gDekw@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKrotyhz7eueujys@nixie71>
References: <ZKrotyhz7eueujys@nixie71>
X-ClientProxiedBy: SA1P222CA0098.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::8) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfd2304-d2ab-4707-32f6-08db809eed10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RC1V/dN2+mxtBNAVLsbcg8oVn5MatPS17euRM9HtYx02qwHsovoj0xcH+usv0fZopJ6vjLLY8u0EJ7M1TGqC0ikm4tDAng24ISLCLG0zoXxp9h5t9Fy+3OXmPX348yXL1QS5yMBgoPPrDzMSEoXRtqDvIje+NrMYoVJdQkBkOlycn9g2tPDkgq7XL2XeXwnUqeu3HG0gUs+lZ/lexCUWCCir87NUzsg5NiYeCaFpDTr+jpKXJT8yfM8i7PzQNzIFuJMtD4BD+BlgzgrOyWFDoy8bWSZVQNhRH3YrdQ8V5BiFTkAfzbxi17chhysdOPMFpqss3clcucWDrqi+YXkiwsQ+s3JJopWSnIvJti23yoiSQFjPGJljqOvaly+aq2KLQB8xlVPn/T/tIIqutsRhr0w91O7TnZS0uckcRHN9S8yxfw1a2boqV+g5DynQMBIwdxJCQFI7vmw3Kdx1lsxOEv/YVgzn1sNuVvoDbGmGCMcioXOZ4ESS+vWLrOnYkFs1MRkbKMee3fz8agZhQMbRtIriCxzm5JmK6PfhgArQzH2o9znvT5bBFSyK4xUTV43QTVToaNriKzP62s/RHjREe6quVpB7zNdf5oWjRchf85Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(346002)(396003)(39830400003)(376002)(366004)(451199021)(86362001)(38100700002)(6486002)(33716001)(107886003)(26005)(6506007)(9686003)(186003)(966005)(6512007)(5660300002)(316002)(2906002)(66556008)(66946007)(478600001)(8676002)(8936002)(66476007)(83380400001)(4326008)(41300700001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yK5nsg54OcUKZAZs5VfKAikMLsA2Zx57KM1diPATnBesgcdo97Yv7m4zVimD?=
 =?us-ascii?Q?kP29RMwUgvy1s/pb91Lu7MQUIyCCoboTrRstGGcMUFvZyukF/+30qRiIrXMW?=
 =?us-ascii?Q?d9EaeYbPWOv92xUcxzpPsfAXnfFLtvNXbm0/CVtd0FojMiQoJSW6Q3xIH93f?=
 =?us-ascii?Q?n/fm1Nc1+ozQM4OarnwH3xvHhopoP5mXonDm/kgWR0Wz770ygNT6IPy8DzFM?=
 =?us-ascii?Q?cgEM8Op3SAqHnJEs+vvPgGRxDPstvnBLvoesap9nUg7K+79ogfOw3C8kbhq2?=
 =?us-ascii?Q?vAt0k+C3iDzFNjbsvSfO3ruSAsrVMcdKKQcXZHSvG3SU4dKLFufrDAVH59tS?=
 =?us-ascii?Q?uv13WHId1K3OkCnYJqGdSiqBl+xEVI0PUrIso+nUt8tm1o2sSpQSAf+MAT3x?=
 =?us-ascii?Q?SpLPJkcm0bc1fAzsyBFdGMmw4y6P8C7YcTPcYXU39r6NtmB0Wec8npy2eN5J?=
 =?us-ascii?Q?j7/6m5nm+UXOKZmRrryashpN/b+eodVAEvEkcz/1PC8xqDkt/EHOaG/3vAbe?=
 =?us-ascii?Q?RFmZDQCq4X4pJ/YP18F4SSSAcsvu6Is7Igddxz/iiHyUN0wDUOf43drg31KZ?=
 =?us-ascii?Q?+sIVL39PMsGzzg9c0jSHklYtoqoYU3LkxN9sjoKlQyebFT/UttGs80rjfE7b?=
 =?us-ascii?Q?oH0uTm28kdm9H/Z1jjsVxQEylnmbTUh6BGLz6PB0ZJdRkwjwnQJYLycbfG1S?=
 =?us-ascii?Q?Wtbr7ji6agmX1IK8jAq3TPhvRMH/Vbs2aSFOA7cVNcMy/8gOrYSE7ik0/6CB?=
 =?us-ascii?Q?rmrofTFujl0mHVg8DXwojCqjKdCFM/D2V26/gMvZKXs6NHVhe5Rl4jrzK0V8?=
 =?us-ascii?Q?sue43x8ay7D4IOVY6QwoCpBgo+6QghlTSmlGRUrDa97vM+VkF0rBG8B9kHbL?=
 =?us-ascii?Q?r/FZvCs1kkOxfHjajesxhCwOdRTluqg50n03GLTZe7yqEdO5WbM0Bb9gS7G/?=
 =?us-ascii?Q?PgFMLDfVQIrGiBNgD3eFdzoqW+rorF4u9tOoq2GBrtcHvKno+WQo2k/cJ0UK?=
 =?us-ascii?Q?kp52jRJuZaYrYhEI/zASqmV1pCP728JaO5KsXr0hUwANZG7Vv0wfGwesEPXv?=
 =?us-ascii?Q?iPqJMrcNJlTv1ykcXL5qBgC4+Zzx7w6uquem2krotxn1D9wVBrwlbaL2stbS?=
 =?us-ascii?Q?ke1gnNLBhcW+0XF5xdxux68GMqTn9WnugBto6Z80YhwGrUPkEfjXnYSXBGyF?=
 =?us-ascii?Q?KCIQ7NEhPplNZyGwcymabSZVygA61JTDIYlvxBS7186dgFCxr2KtuTW0kHcJ?=
 =?us-ascii?Q?ik5ER4SHdOJqr9RTZxsJvXPcekH4f5aexL+8C+cdPs30E6/M+UmQU80F7r6c?=
 =?us-ascii?Q?LFtDduPIEiZ1jBNTkvumo677PO/8Mus2UBS4h9AJQGLMPVh0BO2jDpnhTLsy?=
 =?us-ascii?Q?QvqCHMfyxx2OAZo3g0OVFtWngAOS0HrQVE9pvSG/5eGh8feJRdEafhB9mK2n?=
 =?us-ascii?Q?NHb8oGDwf9xbCBMPQOtAVbUNzZJMNZ2i+TUubuUBABCt8DodiNQbyXGcPXcV?=
 =?us-ascii?Q?wFKbS5IsJo448fG2HfQSnVBXFKf6qOwrzUXnyJcP2CqeEfnEZ6Rp28Z8p0e4?=
 =?us-ascii?Q?1r6yMZi2bOz+1fXFLr+wM1jXr7Qy0D3XikHOw/jM?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfd2304-d2ab-4707-32f6-08db809eed10
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2023 17:07:07.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8CFJSE9tcFm/+Wf0+NPZ3GW2AmZAp+ns/o+AZKV7F1g2cMNiKzITYRcCxQlzfSWG9qBUbquT+gsDzvDiQhmhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7020
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Extend the common binding to include a new variant of the silicon,
which effectively replaces a pair of slider nodes with a trackpad
node comprising the same or similar properties.

As part of this change, the if/then/else schema have been updated
to identify properties that are not supported by the new device.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../bindings/input/azoteq,iqs7222.yaml        | 232 ++++++++++++++++--
 1 file changed, 215 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 4c8690b62ce0..5b1769c19b17 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/azoteq,iqs7222.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Azoteq IQS7222A/B/C Capacitive Touch Controller
+title: Azoteq IQS7222A/B/C/D Capacitive Touch Controller
 
 maintainers:
   - Jeff LaBundy <jeff@labundy.com>
 
 description: |
-  The Azoteq IQS7222A, IQS7222B and IQS7222C are multichannel capacitive touch
-  controllers that feature additional sensing capabilities.
+  The Azoteq IQS7222A, IQS7222B, IQS7222C and IQS7222D are multichannel
+  capacitive touch controllers that feature additional sensing capabilities.
 
   Link to datasheets: https://www.azoteq.com/
 
@@ -21,6 +21,7 @@ properties:
       - azoteq,iqs7222a
       - azoteq,iqs7222b
       - azoteq,iqs7222c
+      - azoteq,iqs7222d
 
   reg:
     maxItems: 1
@@ -173,6 +174,152 @@ properties:
     maximum: 3000
     description: Specifies the report rate (in ms) during ultra-low-power mode.
 
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+  trackpad:
+    type: object
+    description: Represents all channels associated with the trackpad.
+
+    properties:
+      azoteq,channel-select:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 12
+        items:
+          minimum: 0
+          maximum: 13
+        description:
+          Specifies the order of the channels that participate in the trackpad.
+          Specify 255 to omit a given channel for the purpose of mapping a non-
+          rectangular trackpad.
+
+      azoteq,num-rows:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 12
+        description: Specifies the number of rows that comprise the trackpad.
+
+      azoteq,num-cols:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 12
+        description: Specifies the number of columns that comprise the trackpad.
+
+      azoteq,top-speed:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        multipleOf: 4
+        minimum: 0
+        maximum: 1020
+        description:
+          Specifies the speed (in coordinates traveled per conversion) after
+          which coordinate filtering is no longer applied.
+
+      azoteq,bottom-speed:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description:
+          Specifies the speed (in coordinates traveled per conversion) after
+          which coordinate filtering is linearly reduced.
+
+      azoteq,use-prox:
+        type: boolean
+        description:
+          Directs the trackpad to respond to the proximity states of the
+          selected channels instead of their corresponding touch states.
+          Note the trackpad cannot report granular coordinates during a
+          state of proximity.
+
+    patternProperties:
+      "^azoteq,lower-cal-(x|y)$":
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the trackpad's lower starting points.
+
+      "^azoteq,upper-cal-(x|y)$":
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the trackpad's upper starting points.
+
+      "^event-(press|tap|(swipe|flick)-(x|y)-(pos|neg))$":
+        type: object
+        $ref: input.yaml#
+        description:
+          Represents a press or gesture event reported by the trackpad. Specify
+          'linux,code' under the press event to report absolute coordinates.
+
+        properties:
+          linux,code: true
+
+          azoteq,gesture-angle-tighten:
+            type: boolean
+            description:
+              Limits the tangent of the gesture angle to 0.5 (axial gestures
+              only). If specified in one direction, the effect is applied in
+              either direction.
+
+          azoteq,gesture-max-ms:
+            multipleOf: 16
+            minimum: 0
+            maximum: 4080
+            description:
+              Specifies the length of time (in ms) within which a tap, swipe
+              or flick gesture must be completed in order to be acknowledged
+              by the device. The number specified for any one swipe or flick
+              gesture applies to all other swipe or flick gestures.
+
+          azoteq,gesture-min-ms:
+            multipleOf: 16
+            minimum: 0
+            maximum: 4080
+            description:
+              Specifies the length of time (in ms) for which a tap gesture must
+              be held in order to be acknowledged by the device.
+
+          azoteq,gesture-dist:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 65535
+            description:
+              Specifies the distance (in coordinates) across which a swipe or
+              flick gesture must travel in order to be acknowledged by the
+              device. The number specified for any one swipe or flick gesture
+              applies to all remaining swipe or flick gestures.
+
+              For tap gestures, this property specifies the distance from the
+              original point of contact across which the contact is permitted
+              to travel before the gesture is rejected by the device.
+
+          azoteq,gpio-select:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 1
+            maxItems: 3
+            items:
+              minimum: 0
+              maximum: 2
+            description: |
+              Specifies one or more GPIO mapped to the event as follows:
+              0: GPIO0
+              1: GPIO3
+              2: GPIO4
+
+              Note that although multiple events can be mapped to a single
+              GPIO, they must all be of the same type (proximity, touch or
+              trackpad gesture).
+
+        additionalProperties: false
+
+    required:
+      - azoteq,channel-select
+
+    additionalProperties: false
+
 patternProperties:
   "^cycle-[0-9]$":
     type: object
@@ -288,6 +435,10 @@ patternProperties:
           Activates the reference channel in response to proximity events
           instead of touch events.
 
+      azoteq,counts-filt-enable:
+        type: boolean
+        description: Applies counts filtering to the channel.
+
       azoteq,ati-band:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [0, 1, 2, 3]
@@ -432,12 +583,12 @@ patternProperties:
             description: |
               Specifies one or more GPIO mapped to the event as follows:
               0: GPIO0
-              1: GPIO3 (IQS7222C only)
-              2: GPIO4 (IQS7222C only)
+              1: GPIO3
+              2: GPIO4
 
               Note that although multiple events can be mapped to a single
               GPIO, they must all be of the same type (proximity, touch or
-              slider gesture).
+              slider/trackpad gesture).
 
           azoteq,thresh:
             $ref: /schemas/types.yaml#/definitions/uint32
@@ -610,8 +761,8 @@ patternProperties:
             description: |
               Specifies one or more GPIO mapped to the event as follows:
               0: GPIO0
-              1: GPIO3 (IQS7222C only)
-              2: GPIO4 (IQS7222C only)
+              1: GPIO3
+              2: GPIO4
 
               Note that although multiple events can be mapped to a single
               GPIO, they must all be of the same type (proximity, touch or
@@ -629,8 +780,8 @@ patternProperties:
     description: |
       Represents a GPIO mapped to one or more events as follows:
       gpio-0: GPIO0
-      gpio-1: GPIO3 (IQS7222C only)
-      gpio-2: GPIO4 (IQS7222C only)
+      gpio-1: GPIO3
+      gpio-2: GPIO4
 
     allOf:
       - $ref: ../pinctrl/pincfg-node.yaml#
@@ -641,11 +792,53 @@ patternProperties:
     additionalProperties: false
 
 allOf:
+  - $ref: touchscreen/touchscreen.yaml#
+
   - if:
       properties:
         compatible:
           contains:
-            const: azoteq,iqs7222b
+            enum:
+              - azoteq,iqs7222a
+              - azoteq,iqs7222b
+              - azoteq,iqs7222c
+
+    then:
+      properties:
+        touchscreen-size-x: false
+        touchscreen-size-y: false
+        touchscreen-inverted-x: false
+        touchscreen-inverted-y: false
+        touchscreen-swapped-x-y: false
+
+        trackpad: false
+
+      patternProperties:
+        "^channel-([0-9]|1[0-9])$":
+          properties:
+            azoteq,counts-filt-enable: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - azoteq,iqs7222b
+              - azoteq,iqs7222c
+
+    then:
+      patternProperties:
+        "^channel-([0-9]|1[0-9])$":
+          properties:
+            azoteq,ulp-allow: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - azoteq,iqs7222b
+              - azoteq,iqs7222d
 
     then:
       patternProperties:
@@ -657,13 +850,22 @@ allOf:
           properties:
             azoteq,ref-select: false
 
+        "^slider-[0-1]$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: azoteq,iqs7222b
+
+    then:
+      patternProperties:
+        "^channel-([0-9]|1[0-9])$":
           patternProperties:
             "^event-(prox|touch)$":
               properties:
                 azoteq,gpio-select: false
 
-        "^slider-[0-1]$": false
-
         "^gpio-[0-2]$": false
 
   - if:
@@ -704,10 +906,6 @@ allOf:
 
     else:
       patternProperties:
-        "^channel-([0-9]|1[0-9])$":
-          properties:
-            azoteq,ulp-allow: false
-
         "^slider-[0-1]$":
           patternProperties:
             "^event-(press|tap|(swipe|flick)-(pos|neg))$":
-- 
2.34.1

