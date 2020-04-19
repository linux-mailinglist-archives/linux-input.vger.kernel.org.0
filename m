Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468B21AFEF5
	for <lists+linux-input@lfdr.de>; Mon, 20 Apr 2020 01:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgDSXsJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 19:48:09 -0400
Received: from mail-bn8nam11on2060.outbound.protection.outlook.com ([40.107.236.60]:6029
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725834AbgDSXsJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 19:48:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjuZm1PuaTl7Kac7lyDKG8rcmEUhnTlJ/DVeMvLBShdBfoiHxvPwaDUTHKGCCzUfZ7/nqGqnaZxXPNPYykPRkrFLXl95nMo8W8aBtJdmcoSjPvB1jtx3oD3KMMJytsXoHAvkRpzu9KzaLRyPscXz1Xyb6hdQS3/U2oMX//GUIbCaYN8zu8OWuaeM4dW+aZJnyF/7JgBR104J3aRtu28j7DsGFG6G2YW94SnXLOTqxOaxV7oM2NRuYd76rMVY0XO8T1wVJVaRGSGmEF8AH9CgizhT1S6wGllv8cguYxmj9ymaFPPeDXYjXpepw4hgtP4wuRrmLiNyM/Kgiveqr/5Zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+th8iYTtzaiYmnz6oC3lAglqHMdWbjKA2ncjjA66AVs=;
 b=F3VFiDTEBwFigFiRxGkiZNPqR5lBVFyZKiFtn4bCkC0n7D8Jtmcc1t9CARtMuP6DnnAyE/iLSoY8oUaU/fBlT4Mi0BRDAGMTM/gyP3r4uJ/QA27hSUZH/pJJsbvqmKz/mRjjmal7nNQAtDnK2TH23x5QYA8Q9tv2Gro0D6TX1HsN8g0+/TCnf9BTNJ37OhgpqaJyukLr36loKerxZskqDqP5NYiqq7nyS1LxFhSOTfT4BtZy8l0oPpxTgJeTIGJWSBe0qD5mKJ3x62pRYMGlAzmIHL/Pb0ftai8RwtEAejwg+ZoASzVU3g+ErVT3TS4d3AzLG2GcuhXghTBHiYHQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+th8iYTtzaiYmnz6oC3lAglqHMdWbjKA2ncjjA66AVs=;
 b=aRcu5RhIAuxk14zIChvIj4FzfOtO5372M2RoPmOXDsJRJq7lr+R83Ss1lLj3TEJ5YeTmkYgfhb4djxrt3a134d/jDfZkRtqITPV1LEW3E2z7zwe+b826jpDMLjQKh1Sho+Xq3IEQUVWI+JKDQBMtK8mkh8h15urZG7gw1z9fZ2M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jeff@labundy.com; 
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4672.namprd08.prod.outlook.com (2603:10b6:805:97::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Sun, 19 Apr
 2020 23:48:02 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823%7]) with mapi id 15.20.2921.027; Sun, 19 Apr 2020
 23:48:02 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq IQS269A
Date:   Sun, 19 Apr 2020 18:47:47 -0500
Message-Id: <1587340068-2818-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: DM5PR12CA0059.namprd12.prod.outlook.com
 (2603:10b6:3:103::21) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by DM5PR12CA0059.namprd12.prod.outlook.com (2603:10b6:3:103::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2921.27 via Frontend Transport; Sun, 19 Apr 2020 23:48:01 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6887907e-d73b-46f3-8877-08d7e4bc191d
X-MS-TrafficTypeDiagnostic: SN6PR08MB4672:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4672B68123E6E3EFFC07845FD3D70@SN6PR08MB4672.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0378F1E47A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(136003)(39830400003)(396003)(366004)(346002)(376002)(8676002)(107886003)(66946007)(26005)(8936002)(316002)(66476007)(66556008)(6666004)(5660300002)(966005)(30864003)(81156014)(6512007)(69590400007)(86362001)(4326008)(36756003)(16526019)(956004)(52116002)(186003)(508600001)(6506007)(2906002)(2616005)(6486002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: labundy.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1ZqdbVAjKUa50WmPym+oObyaTLP1ePWjC0D0jTQt1hLkPWchhNQ/8itgQmn5uUi+jT6f2CjVizhRzzjxXOzKF7Kc3E/ejW89K6Pm3aHDL96JxFHh/Fu9pDwItISEQegAZI2OF7k29hEllymKldgsWmvBbvDjgWsYTZes4kzTlYsLD/86jkHv38zHJcz9LRctvhXcP/2i1jXtUfnsx1P0+I4BlQowT0B49+ci84cCCudqkgGbT7DEbxzWDQ/exZiIQw5RgqMvM6pTie0XZAYanHw34ge8yDiEMvRDXzkCKqpUgBIqjhJ/lrFPnuXJFkXjJ9PFhW1fb3dPJyVE2/5KIkDyxnNV0MrEQEz2NQhFvL0URMEz41bT2AE3zZi2H3Vy6aH8bdO5vQu6L/cZG0G3spkvKzoCqvuHZq5HBbCFuNLzDgvIqV9G4+q807re5pLF/rrUJFoklYQe7jiTlGBBfOutQ1IahPp5XTtcyTrD48G/mRFdawUGJOBAfsAiE4H/MMP9hccEoF2wbyGM6vw/2EPVt9cfWUURz/9ExduVpeIJRczKBcyih+KHnOeg3GYXFcwUwHPYHyXgPnZ/mJw5g==
X-MS-Exchange-AntiSpam-MessageData: Cl9jiRP7bEZ+VLyY4eVpVHQgu2xvkF/FLFSFfviwIpWD3DMEymtL2YNgGFSvxuPIYIxrkfgSZUfHIOX4c6C3ngZ6ARbxxWVNdTyPV6jMAe3wJaX8wwZaJg76wIzcqtaj3G/dD4vqvumem4aSKC6d/g==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6887907e-d73b-46f3-8877-08d7e4bc191d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2020 23:48:02.5793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kJ0Umycd1xCjGE6GRXa78FkqncB3JtBoOuRFYpoPjVu/0H7xCfzyopMope2HotkQ0Ximr4JE4ruTU7paqinsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4672
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds device tree bindings for the Azoteq IQS269A
capacitive touch controller.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../devicetree/bindings/input/iqs269a.yaml         | 591 +++++++++++++++++++++
 1 file changed, 591 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/iqs269a.yaml

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
new file mode 100644
index 0000000..7f4fcdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -0,0 +1,591 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/iqs269a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Azoteq IQS269A Capacitive Touch Controller
+
+maintainers:
+  - Jeff LaBundy <jeff@labundy.com>
+
+description: |
+  The Azoteq IQS269A is an 8-channel capacitive touch controller that features
+  additional Hall-effect and inductive sensing capabilities.
+
+  Link to datasheet: https://www.azoteq.com/
+
+properties:
+  compatible:
+    const: azoteq,iqs269a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  azoteq,hall-enable:
+    type: boolean
+    description:
+      Enables Hall-effect sensing on channels 6 and 7. In this case, keycodes
+      assigned to channel 6 are ignored and keycodes assigned to channel 7 are
+      interpreted as switch codes. Refer to the datasheet for requirements im-
+      posed on channels 6 and 7 by Hall-effect sensing.
+
+  azoteq,suspend-mode:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+        default: 0
+    description: |
+      Specifies the power mode during suspend as follows:
+      0: Automatic (same as normal runtime, i.e. suspend/resume disabled)
+      1: Low power (all sensing at a reduced reporting rate)
+      2: Ultra-low power (channel 0 proximity sensing)
+      3: Halt (no sensing)
+
+  azoteq,clk-div:
+    type: boolean
+    description: Divides the device's core clock by a factor of 4.
+
+  azoteq,ulp-update:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 7
+        default: 3
+    description: Specifies the ultra-low-power mode update rate.
+
+  azoteq,reseed-offset:
+    type: boolean
+    description:
+      Applies an 8-count offset to all long-term averages upon either ATI or
+      reseed events.
+
+  azoteq,filt-str-lp-lta:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+        default: 0
+    description:
+      Specifies the long-term average filter strength during low-power mode.
+
+  azoteq,filt-str-lp-cnt:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+        default: 0
+    description:
+      Specifies the raw count filter strength during low-power mode.
+
+  azoteq,filt-str-np-lta:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+        default: 0
+    description:
+      Specifies the long-term average filter strength during normal-power mode.
+
+  azoteq,filt-str-np-cnt:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+        default: 0
+    description:
+      Specifies the raw count filter strength during normal-power mode.
+
+  azoteq,rate-np-ms:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 255
+        default: 16
+    description: Specifies the report rate (in ms) during normal-power mode.
+
+  azoteq,rate-lp-ms:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 255
+        default: 160
+    description: Specifies the report rate (in ms) during low-power mode.
+
+  azoteq,rate-ulp-ms:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - multipleOf: 16
+        minimum: 0
+        maximum: 4080
+        default: 160
+    description: Specifies the report rate (in ms) during ultra-low-power mode.
+
+  azoteq,timeout-pwr-ms:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - multipleOf: 512
+        minimum: 0
+        maximum: 130560
+        default: 2560
+    description:
+      Specifies the length of time (in ms) to wait for an event during normal-
+      power mode before transitioning to low-power mode.
+
+  azoteq,timeout-lta-ms:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - multipleOf: 512
+        minimum: 0
+        maximum: 130560
+        default: 32768
+    description:
+      Specifies the length of time (in ms) to wait before resetting the long-
+      term average of all channels. Specify the maximum timeout to disable it
+      altogether.
+
+  azoteq,ati-band-disable:
+    type: boolean
+    description: Disables the ATI band check.
+
+  azoteq,ati-lp-only:
+    type: boolean
+    description: Limits automatic ATI to low-power mode.
+
+  azoteq,ati-band-tighten:
+    type: boolean
+    description: Tightens the ATI band from 1/8 to 1/16 of the desired target.
+
+  azoteq,filt-disable:
+    type: boolean
+    description: Disables all raw count filtering.
+
+  azoteq,gpio3-select:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+        maximum: 7
+        default: 0
+    description:
+      Selects the channel for which the GPIO3 pin represents touch state.
+
+  azoteq,dual-direction:
+    type: boolean
+    description:
+      Specifies that long-term averages are to freeze in the presence of either
+      increasing or decreasing counts, thereby permitting events to be reported
+      in either direction.
+
+  azoteq,tx-freq:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+        default: 0
+    description: |
+      Specifies the inductive sensing excitation frequency as follows (paren-
+      thesized numbers represent the frequency if 'azoteq,clk-div' is present):
+      0: 16 MHz (4 MHz)
+      1: 8 MHz (2 MHz)
+      2: 4 MHz (1 MHz)
+      3: 2 MHz (500 kHz)
+
+  azoteq,global-cap-increase:
+    type: boolean
+    description: Increases the global capacitance adder from 0.5 pF to 1.5 pF.
+
+  azoteq,reseed-select:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+        default: 0
+    description: |
+      Specifies the event(s) that prompt the device to reseed (i.e. reset the
+      long-term average) of an associated channel as follows:
+      0: None
+      1: Proximity
+      2: Proximity or touch
+      3: Proximity, touch or deep touch
+
+  azoteq,tracking-enable:
+    type: boolean
+    description:
+      Enables all associated channels to track their respective reference
+      channels.
+
+  azoteq,filt-str-slider:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+        default: 1
+    description: Specifies the slider coordinate filter strength.
+
+patternProperties:
+  "^channel@[0-7]$":
+    type: object
+    description:
+      Represents a single sensing channel. A channel is active if defined and
+      inactive otherwise.
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 7
+        description: Index of the channel.
+
+      azoteq,reseed-disable:
+        type: boolean
+        description:
+          Prevents the channel from being reseeded if the long-term average
+          timeout (defined in 'azoteq,timeout-lta') expires.
+
+      azoteq,blocking-enable:
+        type: boolean
+        description: Specifies that the channel is a blocking channel.
+
+      azoteq,slider0-select:
+        type: boolean
+        description: Specifies that the channel participates in slider 0.
+
+      azoteq,slider1-select:
+        type: boolean
+        description: Specifies that the channel participates in slider 1.
+
+      azoteq,rx-enable:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32-array
+          - minItems: 1
+            maxItems: 8
+            items:
+              minimum: 0
+              maximum: 7
+        description:
+          Specifies the CRX pin(s) associated with the channel. By default, only
+          the CRX pin corresponding to the channel's index is enabled (e.g. CRX0
+          for channel 0).
+
+      azoteq,tx-enable:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32-array
+          - minItems: 1
+            maxItems: 8
+            items:
+              minimum: 0
+              maximum: 7
+            default: [0, 1, 2, 3, 4, 5, 6, 7]
+        description: Specifies the TX pin(s) associated with the channel.
+
+      azoteq,meas-cap-decrease:
+        type: boolean
+        description:
+          Decreases the internal measurement capacitance from 60 pF to 15 pF.
+
+      azoteq,rx-float-inactive:
+        type: boolean
+        description: Floats any inactive CRX pins instead of grounding them.
+
+      azoteq,local-cap-size:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 2]
+            default: 0
+        description: |
+          Specifies the capacitance to be added to the channel as follows:
+          0: None
+          1: Global adder (based on 'azoteq,global-cap-increase')
+          2: Global adder + 0.5 pF
+
+      azoteq,invert-enable:
+        type: boolean
+        description:
+          Inverts the polarity of the states reported for proximity, touch and
+          deep-touch events relative to their respective thresholds.
+
+      azoteq,proj-bias:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 2, 3]
+            default: 2
+        description: |
+          Specifies the bias current applied during projected-capacitance
+          sensing as follows:
+          0: 2.5 uA
+          1: 5 uA
+          2: 10 uA
+          3: 20 uA
+
+      azoteq,sense-mode:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 9, 14, 15]
+            default: 0
+        description: |
+          Specifies the channel's sensing mode as follows:
+          0:  Self capacitance
+          1:  Projected capacitance
+          9:  Self or mutual inductance
+          14: Hall effect
+          15: Temperature
+
+      azoteq,sense-freq:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 2, 3]
+            default: 1
+        description: |
+          Specifies the channel's sensing frequency as follows (parenthesized
+          numbers represent the frequency if 'azoteq,clk-div' is present):
+          0: 4 MHz (1 MHz)
+          1: 2 MHz (500 kHz)
+          2: 1 MHz (250 kHz)
+          3: 500 kHz (125 kHz)
+
+      azoteq,static-enable:
+        type: boolean
+        description: Enables the static front-end for the channel.
+
+      azoteq,ati-mode:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 2, 3]
+            default: 3
+        description: |
+          Specifies the channel's ATI mode as follows:
+          0: Disabled
+          1: Semi-partial
+          2: Partial
+          3: Full
+
+      azoteq,ati-base:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [75, 100, 150, 200]
+            default: 100
+        description: Specifies the channel's ATI base.
+
+      azoteq,ati-target:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - multipleOf: 32
+            minimum: 0
+            maximum: 2016
+            default: 512
+        description: Specifies the channel's ATI target.
+
+      azoteq,assoc-select:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32-array
+          - minItems: 1
+            maxItems: 8
+            items:
+              minimum: 0
+              maximum: 7
+        description:
+          Specifies the associated channels for which the channel serves as a
+          reference channel. By default, no channels are selected.
+
+      azoteq,assoc-weight:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - minimum: 0
+            maximum: 255
+            default: 0
+        description:
+          Specifies the channel's impact weight if it acts as an associated
+          channel (0 = 0% impact, 255 = 200% impact).
+
+    patternProperties:
+      "^event-prox(-alt)?$":
+        type: object
+        description:
+          Represents a proximity event reported by the channel in response to
+          a decrease in counts. Node names suffixed with '-alt' instead corre-
+          spond to an increase in counts.
+
+          By default, the long-term average tracks an increase in counts such
+          that only events corresponding to a decrease in counts are reported
+          (refer to the datasheet for more information).
+
+          Specify 'azoteq,dual-direction' to freeze the long-term average when
+          the counts increase or decrease such that events of either direction
+          can be reported. Alternatively, specify 'azoteq,invert-enable' to in-
+          vert the polarity of the states reported by the channel.
+
+          Complementary events (e.g. event-touch and event-touch-alt) can both
+          be present and specify different key or switch codes, but not differ-
+          ent thresholds or hysteresis (if applicable).
+
+        properties:
+          azoteq,thresh:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - minimum: 0
+                maximum: 255
+                default: 10
+            description: Specifies the threshold for the event.
+
+          linux,code:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Numeric key or switch code associated with the event.
+
+        additionalProperties: false
+
+      "^event-touch(-alt)?$":
+        type: object
+        description: Represents a touch event reported by the channel.
+
+        properties:
+          azoteq,thresh:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - minimum: 0
+                maximum: 255
+                default: 8
+            description: Specifies the threshold for the event.
+
+          azoteq,hyst:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - minimum: 0
+                maximum: 15
+                default: 4
+            description: Specifies the hysteresis for the event.
+
+          linux,code:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Numeric key or switch code associated with the event.
+
+        additionalProperties: false
+
+      "^event-deep(-alt)?$":
+        type: object
+        description: Represents a deep-touch event reported by the channel.
+
+        properties:
+          azoteq,thresh:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - minimum: 0
+                maximum: 255
+                default: 26
+            description: Specifies the threshold for the event.
+
+          azoteq,hyst:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - minimum: 0
+                maximum: 15
+                default: 0
+            description: Specifies the hysteresis for the event.
+
+          linux,code:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Numeric key or switch code associated with the event.
+
+        additionalProperties: false
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            iqs269a@44 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    compatible = "azoteq,iqs269a";
+                    reg = <0x44>;
+                    interrupt-parent = <&gpio>;
+                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+
+                    azoteq,hall-enable;
+                    azoteq,suspend-mode = <2>;
+
+                    channel@0 {
+                            reg = <0x0>;
+
+                            event-prox {
+                                    linux,code = <KEY_POWER>;
+                            };
+                    };
+
+                    channel@1 {
+                            reg = <0x1>;
+                            azoteq,slider0-select;
+                    };
+
+                    channel@2 {
+                            reg = <0x2>;
+                            azoteq,slider0-select;
+                    };
+
+                    channel@3 {
+                            reg = <0x3>;
+                            azoteq,slider0-select;
+                    };
+
+                    channel@4 {
+                            reg = <0x4>;
+                            azoteq,slider0-select;
+                    };
+
+                    channel@5 {
+                            reg = <0x5>;
+                            azoteq,slider0-select;
+                    };
+
+                    channel@6 {
+                            reg = <0x6>;
+                            azoteq,invert-enable;
+                            azoteq,static-enable;
+                            azoteq,reseed-disable;
+                            azoteq,rx-enable = <0>;
+                            azoteq,sense-freq = <0x0>;
+                            azoteq,sense-mode = <0xE>;
+                            azoteq,ati-mode = <0x0>;
+                            azoteq,ati-base = <200>;
+                            azoteq,ati-target = <320>;
+                    };
+
+                    channel@7 {
+                            reg = <0x7>;
+                            azoteq,invert-enable;
+                            azoteq,static-enable;
+                            azoteq,reseed-disable;
+                            azoteq,rx-enable = <0>, <6>;
+                            azoteq,sense-freq = <0x0>;
+                            azoteq,sense-mode = <0xE>;
+                            azoteq,ati-mode = <0x3>;
+                            azoteq,ati-base = <200>;
+                            azoteq,ati-target = <320>;
+
+                            event-touch {
+                                    linux,code = <SW_LID>;
+                            };
+                    };
+            };
+    };
+
+...
-- 
2.7.4

