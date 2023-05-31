Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5930A717359
	for <lists+linux-input@lfdr.de>; Wed, 31 May 2023 03:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbjEaBuG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 21:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbjEaBuE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 21:50:04 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242AA11F;
        Tue, 30 May 2023 18:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEJU3/gDlXKA21l1TADQlPGqqz/iKMy/xnVI1xpDgrpAFs1TYc6wbYyYgvbgkK6nUGyFu0GWIu8T1lnJn/zEu0fcRMX11v6S6BcxVtk5QkwN3jqwk4ZLUUuQ8P7u+aCSdvHwBmG8lQLKPls5xz+ptvyPr18dfM2ICgUNi+xD2nBXoxAFR1JANt2WhcrED0Jc8JB4N+JFVgxbOJ1P7nEeEQwxjJ5Iiqqlpd2j/SyO7bQLCEBx6BPfyDI1gsMxwoKNu3QdvMGD9sJ0VMfu7CUQm0QdMCXYm6vrwEXcat32kiGo6KSnA04yGnU/fZb+Z0bFvJdyIjr2BXSdyF0xLM9O+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn6TsjJzVdUNq/P1rsSJMqf/YAvHoK4PUqe3M8XzTqU=;
 b=CWMQpwOi8L4WyuUWemjWTmoKhd6j/fuMa3RRV9gVASNu9U5AJ9eSBF1JLWdbCQbJ0Md0ssf6gXGatteWCIoLCMIChwOrDcqFGpMe5hfJsHoOQGpnPEEUEgUwO2bpsY/gqgyk+Cf8L5VXt2le987QeLJhkmwr2eGQr4/FohvZpVil5jaLjFbZSSEKoMymRBRsyI/R5QMM2oVsJHLghTFQgEt2srBSax8qolkq/olz3ROX6Q76Z8+rBL4R6wQ46lWEGHok7+wGIlFE2fEbk4K/Kms8w58eH5zpGHCM+ueXPYq2+F8HSh3bEZ+bD1CZzhZOrAYHqVHWQrGb2+de50RkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn6TsjJzVdUNq/P1rsSJMqf/YAvHoK4PUqe3M8XzTqU=;
 b=ayIF8aQnGcKVGgzddLIuvANBKXv8SsGg7SuePGUTeQ7ud7yAdxF+VsYvZcfOE/ICg5WEtLr0y5pLv9M16DrvCN/zjtQVJ0K5Wz4VAxI/FC/dtiGNQ5ok2eDJiPYjJZSRcRgnCgSZ+eaKIiSiOFJioxfIqTQPmvicrka24XL+xsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SA2PR08MB6524.namprd08.prod.outlook.com
 (2603:10b6:806:117::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 01:49:59 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::c696:d0df:10ac:8071]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::c696:d0df:10ac:8071%3]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 01:49:58 +0000
Date:   Tue, 30 May 2023 20:49:51 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH 1/2] dt-bindings: input: iqs7222: Add properties for Azoteq
 IQS7222D
Message-ID: <ZHanv+8fOYhpyMEC@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA1P222CA0081.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::7) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SA2PR08MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 373d1080-9e77-4cf7-5ed8-08db61795715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4NlHqyMsDUjOX6vD9iulx5twUvRyud7A4YkmJccfR7sJreM6QjebRUOER5IcUtCFqmGq9NlmpuhMa9NRZlpKm57VBCpO+YUAXKCW+jKA8usasX4CKml8pZ0LgmZ1FFKAEAagrZ0Xu+oOEcUSCqDAkabiMgrglrocw9jHRm/II5mE5BuQ1B6vtpaTnHbuFNZrJiBg2ubSL+ykxy5DtVRJ4OTL2Y+tp53VNUMzBxyyZWYtnuh577BPKXJp+NeilZRe60l5s6EBLWWXjA19N44zFD5AEKXUxDz7eOz4AROHfz1TzRzTRmQjE5aeIMD7Sc7FWic8tTLHdEQtiUPYlIQJGD6mkZ6Lg+2p61pZD/TdQF4BkHr2WTBOeB6xI0pg5vxzfPkW5bDsZx4LWgtsUWOycjlunl4KJyJzI1sfrZgaKUsz2zQxHkT8wf7tOMcc1tZfCsHHYTvawc4hFFpIDysuKBssi6wc6zCN0syPkfsg/4u8XSDQoPd6INNFt30P26x7QBe0p8CVqArbRPeVe3A+AoEoXw3eSg/zK+x3YtaPRjhDiYU29cxh9xnfEVx1lYRuajvRkE0dh4iCIssCYpah5+6I2qVA3OZejz3uf9v74E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(396003)(366004)(346002)(39830400003)(136003)(451199021)(478600001)(5660300002)(8676002)(8936002)(86362001)(2906002)(33716001)(4326008)(66476007)(66556008)(66946007)(316002)(41300700001)(38100700002)(186003)(966005)(107886003)(6506007)(9686003)(26005)(6486002)(6666004)(6512007)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L17O/xSK5hXkQjK2BAVOUWNoOmFPMfMEC9kG518uaidOusDZLhOV6eKoesEG?=
 =?us-ascii?Q?3Ls6Ou+Oy9OqlHUnrKv9uSERPGqSbKI3p2XQXhQLVpC08hhYbAOplL0ZcLbE?=
 =?us-ascii?Q?hZZP8oD6WlgQLfLfaM6vgKwEFbicxRYSgcvpL7oI42Qx7TKbs+N2LXz9Lpg8?=
 =?us-ascii?Q?vtojLIlK2jmHzKzO4h8A7NMKwKIDRgDK2nQVrj3ezrwFu6t9aGXIo2fJqjKX?=
 =?us-ascii?Q?cDmwSGYYmo3zuQQ8k7bGvab7yid0L0pSz2f+eknl9gqiM6u3VAY2TuXonpLV?=
 =?us-ascii?Q?hEAG16ABB29hS2+E76abVvoR11+ExOgbh2OFssONa78M6A8IagxnXv1wteqy?=
 =?us-ascii?Q?mKTv48tuB07G5ZHOTyGyYGDo4l/KquE/Q0VvJnUBZqH+tDmGmrFL7XUez0TD?=
 =?us-ascii?Q?AEy3sET+pZFPgrF+JmH9TD794vBOCjzrQNMeqv7RB6JG678PgKnfjWzG7P8W?=
 =?us-ascii?Q?mCUSG5gse3kfsjb92Yd24SFlEeaweZL0iCBvvJibVhccQP9MyIeHTSQPeDTu?=
 =?us-ascii?Q?arj7JEXDNIYgZPWjDsgMDa+hzjdXq6QpnEzbvQK9xHRKIEzCiTpQTGpFujqW?=
 =?us-ascii?Q?Ri3oqG8XeuN6Ct/DVi+5J4fgIB0Pf51WSomX6w0t7IoDCaVu4rCOjxNg8dBC?=
 =?us-ascii?Q?prE3KRduOC8vhN/GDdcQd88/T7DoN1xOBHU80Y+nWXeHur7yNCQ6cWkJ2Z7n?=
 =?us-ascii?Q?5hY/Z/bcQpPToKGv5nVea2zadfu28+1/jvQqv/+1YemSyWIvBULV7YktFxdX?=
 =?us-ascii?Q?67NWAASfQ986vY+xJb2R4C/u0gL6YiIkl0+SHS1uNUASJ/URnMc7mOvWOsMs?=
 =?us-ascii?Q?4hTWiWYchCH+CDw/3PffVF6G/pzCyO828s5qkalcZzSBbcgmrxg0hFYpIoQM?=
 =?us-ascii?Q?Nme16axGWwNEjkAYztLPklWWyhmAT8+VlYsWl1RoPmdbJ7t6irCi8RsPGRKV?=
 =?us-ascii?Q?kI70r5j3vOFfpd6/23jWtd+/YdudfVXzFAtTJt1/nermhrieNBH/i8RJex+L?=
 =?us-ascii?Q?WaxPchqGZRBu436Nww/ZnrIoTxllXax7SNGqaXkbXQhow2zSFGvJfbfzPpw4?=
 =?us-ascii?Q?OW4h3auL12XEWK2vgLi0zAUgsCulB8jw6w6cRMN+Hhg83Godqc6z50ObGYOl?=
 =?us-ascii?Q?pvHCTjgsfkRK8TkXs9JljTQMMZFUaYpx7NGc8OrFLXGA3tK3vtRHUQ75iHyF?=
 =?us-ascii?Q?07NYzX/xr8c5xDoBAKCaZY4T2HDf4bq0eAEzChqMT6wNkle1dGJS2p5MX81e?=
 =?us-ascii?Q?tHt4tRpH3sYbd3IGD8qYDnGahcKNZG3U/WkOL0KAYyd4MORGVqBTp8gjvAVb?=
 =?us-ascii?Q?W254tcs64AOFXq7y7Br0CCF6sml0IfrpwQgEUZDqzHElTRdUWux3zla2IYmP?=
 =?us-ascii?Q?v7OG8zDU+ST677dCup63esdxfALbWu/73IZ9V2/xWeMsftJMWXIgf3wVB/mf?=
 =?us-ascii?Q?VZrg7hL+nFwkYFWpimjT+JBJINvV/LxE7V4q0eGIclDbWmsHmo51R7ne+ueE?=
 =?us-ascii?Q?9bUqlhlGUGK5MJ5h2kDaOG4YMo5AQA3Uwy81rTpKjAHDCTaHad/9Rg4QZs27?=
 =?us-ascii?Q?am8eM45yulUPqnoSP0XYSRDrjXVsqr3Nkjc+HX2W?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373d1080-9e77-4cf7-5ed8-08db61795715
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 01:49:58.7080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEfdKSpX9QXbF+1eXrE48Gn59jxBr99t5HlJ7NH44J3lbBfHV47Hi6puR+S0uG8xmnxIXHrlnY+dH5B7d2ql/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6524
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Extend the common binding to include a new variant of the silicon.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../bindings/input/azoteq,iqs7222.yaml        | 202 +++++++++++++++++-
 1 file changed, 192 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 9ddba7f2e7aa..a4c251a430fa 100644
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
+  The Azoteq IQS7222A, IQS7222B, IQS7222C and IQS7222D are multichannel capac-
+  itive touch controllers that feature additional sensing capabilities.
 
   Link to datasheets: https://www.azoteq.com/
 
@@ -21,6 +21,7 @@ properties:
       - azoteq,iqs7222a
       - azoteq,iqs7222b
       - azoteq,iqs7222c
+      - azoteq,iqs7222d
 
   reg:
     maxItems: 1
@@ -173,6 +174,148 @@ properties:
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
+          Specifies the speed of movement after which coordinate filtering is
+          no longer applied.
+
+      azoteq,bottom-speed:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description:
+          Specifies the speed of movement after which coordinate filtering is
+          linearly reduced.
+
+      azoteq,use-prox:
+        type: boolean
+        description:
+          Directs the trackpad to respond to the proximity states of the se-
+          lected channels instead of their corresponding touch states. Note
+          the trackpad cannot report granular coordinates during a state of
+          proximity.
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
+              Specifies the distance across which a tap, swipe or flick gesture
+              must travel in order to be acknowledged by the device. The number
+              specified for any one swipe or flick gesture applies to all other
+              swipe or flick gestures.
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
@@ -288,6 +431,10 @@ patternProperties:
           Activates the reference channel in response to proximity events
           instead of touch events.
 
+      azoteq,counts-filt-enable:
+        type: boolean
+        description: Applies counts filtering to the channel.
+
       azoteq,ati-band:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [0, 1, 2, 3]
@@ -432,12 +579,12 @@ patternProperties:
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
@@ -610,8 +757,8 @@ patternProperties:
             description: |
               Specifies one or more GPIO mapped to the event as follows:
               0: GPIO0
-              1: GPIO3 (IQS7222C only)
-              2: GPIO4 (IQS7222C only)
+              1: GPIO3
+              2: GPIO4
 
               Note that although multiple events can be mapped to a single
               GPIO, they must all be of the same type (proximity, touch or
@@ -629,8 +776,8 @@ patternProperties:
     description: |
       Represents a GPIO mapped to one or more events as follows:
       gpio-0: GPIO0
-      gpio-1: GPIO3 (IQS7222C only)
-      gpio-2: GPIO4 (IQS7222C only)
+      gpio-1: GPIO3
+      gpio-2: GPIO4
 
     allOf:
       - $ref: ../pinctrl/pincfg-node.yaml#
@@ -641,6 +788,41 @@ patternProperties:
     additionalProperties: false
 
 allOf:
+  - $ref: touchscreen/touchscreen.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: azoteq,iqs7222d
+
+    then:
+      patternProperties:
+        "^cycle-[0-9]$":
+          properties:
+            azoteq,iref-enable: false
+
+        "^channel-([0-9]|1[0-9])$":
+          properties:
+            azoteq,ref-select: false
+
+        "^slider-[0-1]$": false
+
+    else:
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
   - if:
       properties:
         compatible:
-- 
2.34.1

