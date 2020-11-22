Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46B02BFC7C
	for <lists+linux-input@lfdr.de>; Sun, 22 Nov 2020 23:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgKVWjm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Nov 2020 17:39:42 -0500
Received: from mail-bn8nam08on2058.outbound.protection.outlook.com ([40.107.100.58]:46161
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726810AbgKVWjm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Nov 2020 17:39:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbI+8Ix6NczQYIn2gcqF4TStG+Vad+IBMIAryV7Q17cZ3pzqS/TQWzNUTPlrSSfR3N1eIaLWwUa5V6BCfcFsIxXBqpXQtTSi6hESeY+ZJ6RWVZuFVknvYKuGKx1GIYxfczwYYm8ukCc09osGsH2kID6OYZ9IZRPa8GiaAYpvmu7UU//uCAagnAKwc2NiokZcGQnXV9xpzkaE7fgzmYpLGXOKMh2uzZWXlHM53gB8U4ZjBIQKpZ2Klr69pUBSgemGut0izvd4gW91lEURWvLmusUUrTE+XmqrXeU4G/xEv3FoPPPXUzWeYUhefC4WBpgj1Y6+8IYdptxu0qaE5JiDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7rPyazXVNSOjsHUuqmm2YTjrXcsCbDmjM2e8z3rv/Y=;
 b=JwfYwh4rH7FdvZhzVPElRvqynyZUfj0M+w32ZNaEW3yhmlAs0BcxNsxa4DT+nsWW7Hr3bbSYdj92ZjmWhUK+d/yIZGC/N40bX34KjLfYyDrhQKFcDggFpMZ9Do8qg76LVJzHP8TMH0PlT2Mx+DzfgL2QXhtXGc0Vx10g5QDAL4/TAqEUJWb7PbQz+EQ0T2nuAoxz/askGyzf9Ha+wTCo7WJzmlA/4kzkJ8OAFmwOGbnI4xio6ToiXP88OCrxYEjevN1usD49buefQQFiUM4GyVOx1LwzAzQuokyxf7IZAAbR0x7EiTZ1JtWR0iLsDOUj6J7q0zn6pXq+xTMxV5oUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7rPyazXVNSOjsHUuqmm2YTjrXcsCbDmjM2e8z3rv/Y=;
 b=Xb/MFr0op/70QeFDhemSw5Opm5SGFPB2Ks+VF2WW2esVJpTecjeU6K/OwJDvdof3yAT8Fnyj16F13bL/Qk0N3qUQiqaGzBgx4YHtTYG7xunzthvmheTv9eWCKQTRSZmiP63aE1BSi+YdR7VuJ3oZPHfkX1geFdcDX9qaslUT2LI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA2PR08MB6604.namprd08.prod.outlook.com (2603:10b6:806:11c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Sun, 22 Nov
 2020 22:39:38 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::3cac:792d:fcf4:75a2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::3cac:792d:fcf4:75a2%7]) with mapi id 15.20.3564.035; Sun, 22 Nov 2020
 22:39:38 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq IQS626A
Date:   Sun, 22 Nov 2020 16:39:07 -0600
Message-Id: <1606084748-4097-2-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606084748-4097-1-git-send-email-jeff@labundy.com>
References: <1606084748-4097-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.227.119]
X-ClientProxiedBy: SN6PR01CA0017.prod.exchangelabs.com (2603:10b6:805:b6::30)
 To SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN6PR01CA0017.prod.exchangelabs.com (2603:10b6:805:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Sun, 22 Nov 2020 22:39:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7f1a6f1-cc69-4f89-691c-08d88f377e6c
X-MS-TrafficTypeDiagnostic: SA2PR08MB6604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR08MB6604491CA16E0499907A0C1BD3FD0@SA2PR08MB6604.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sWSErqIoxCZ7XxB0LRPyHhFYLL9txMLBpaAwnM/v7L0dIDRmPLNq4jbJLEgR3dquis9+0HtQukIvHMuhX9a5DNhyTcAkLU4xG19AirWXDoEH9C8egvdaWO4iTk77AfAtcOxBGsDBReB3CMdbZShHnsS4oVbrqM2KJKt3vxgiA8+v9aniEAQqdowx2r0Mw+CoOxPGsOWUD949lfdLVEa1vqqi16dQ8pZOs8Kbw5iqytBuCdzUJgJWzasTPmkr+E3ruCeTanMtli1zA40N0KGpURRvTrwSNyol5VG8iR5mucpybAf0y1Rh8N1xztSZrysvZliv+WGGnZAvtjgI5qfkJPf0J2FW6S1eVU4JlvMcOBlZ8pgYdgvEfz7oYONQ55qVIFHXR8jOUlMl940p/ov8ADhdpZM8HQpWLH3Xz5NTKDKRhZJxd4Fca38aQ2Q9oCkFMAw3XeIP/h9dxIe/hRyxsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(396003)(366004)(376002)(39830400003)(6512007)(316002)(6486002)(83380400001)(86362001)(69590400008)(36756003)(478600001)(8676002)(966005)(4326008)(5660300002)(107886003)(6506007)(66946007)(66556008)(66476007)(2906002)(26005)(6666004)(30864003)(8936002)(52116002)(2616005)(16526019)(186003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: TwLHPc2gHKCIljvLFAJ0XB1TPY6gb0BdCsmBUKetZBy2gVw0zJnoHXjzJE4ZdS1q1eyEaa7mC6QiZeGgatDvjnyX8EEaG62qYKyiiXKhyC9C/Dpu/48aSGZCapn8BuR+15RyP/Dk+bkxcseprx7v1A1EQ9lTJbl5iOEnRtTGdJFhslIv+RlGhOU6koMX6ToTLYePDgChoVCI9/wBBtZM/favIoxBzWZ199EfiMu+kRy01nHiSfffW5tQo+MCze15iAjeQCBHsTEncPATqM34ExGtnfDDyEUAfaisjg9g5vGDzDuDpwhcwHapO2IUwO+OOglypS1ZtpGEQTEVNm6AXAFDTUeJvw7jSXBn7O+iPkMlab9W4NVDPjoqYgYtRq5SzvP4iI3U4pAqNJGwSPx+Xv07GgU8Dp8pdvQ1iIrM6p2WZIbmC8z9ZzcEu6VcsbQpcXrlbYKwwu68WTlO/CFJR+WXlasvapoAwC8Itjot97iZV3FIbhGanuzb7n8tFkvcFIlVI2hCovIPsaPw+X1yyhdb/NzG7w33MaV/LZ9raVkrhx7wq+Vg/eohmfyLuDUcmT5jUy2Yb9uG+LaHvzsO+NVUipNM5KlrPKVyYiAE9JPqznYRNmyvakv4fnozOedJftl6mBy0+IfRqErnzBHl+Q==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f1a6f1-cc69-4f89-691c-08d88f377e6c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2020 22:39:38.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mOAcqBevqmfL10b/F9effnWNV+r6/vDTbGNc+JJnLd1LgoahKAbVua6Y4mPIQkzoZfYSy1mcEnJDXTfihFePg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6604
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds device tree bindings for the Azoteq IQS626A
capacitive touch controller.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../devicetree/bindings/input/iqs626a.yaml         | 840 +++++++++++++++++++++
 1 file changed, 840 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml

diff --git a/Documentation/devicetree/bindings/input/iqs626a.yaml b/Documentation/devicetree/bindings/input/iqs626a.yaml
new file mode 100644
index 0000000..af2f88b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/iqs626a.yaml
@@ -0,0 +1,840 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/iqs626a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Azoteq IQS626A Capacitive Touch Controller
+
+maintainers:
+  - Jeff LaBundy <jeff@labundy.com>
+
+description: |
+  The Azoteq IQS626A is a 14-channel capacitive touch controller that features
+  additional Hall-effect and inductive sensing capabilities.
+
+  Link to datasheet: https://www.azoteq.com/
+
+properties:
+  compatible:
+    const: azoteq,iqs626a
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
+  azoteq,suspend-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 0
+    description: |
+      Specifies the power mode during suspend as follows:
+      0: Automatic (same as normal runtime, i.e. suspend/resume disabled)
+      1: Low power (all sensing at a reduced reporting rate)
+      2: Ultra-low power (ULP channel proximity sensing)
+      3: Halt (no sensing)
+
+  azoteq,clk-div:
+    type: boolean
+    description: Divides the device's core clock by a factor of 4.
+
+  azoteq,ulp-enable:
+    type: boolean
+    description:
+      Permits the device to automatically enter ultra-low-power mode from low-
+      power mode.
+
+  azoteq,ulp-update:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6, 7]
+    default: 3
+    description: |
+      Specifies the rate at which the trackpad, generic and Hall channels are
+      updated during ultra-low-power mode as follows:
+      0: 8
+      1: 13
+      2: 28
+      3: 54
+      4: 89
+      5: 135
+      6: 190
+      7: 256
+
+  azoteq,ati-band-disable:
+    type: boolean
+    description: Disables the ATI band check.
+
+  azoteq,ati-lp-only:
+    type: boolean
+    description: Limits automatic ATI to low-power mode.
+
+  azoteq,gpio3-select:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6, 7]
+    default: 1
+    description: |
+      Selects the channel or group of channels for which the GPIO3 pin
+      represents touch state as follows:
+      0: None
+      1: ULP channel
+      2: Trackpad
+      3: Trackpad
+      4: Generic channel 0
+      5: Generic channel 1
+      6: Generic channel 2
+      7: Hall channel
+
+  azoteq,reseed-select:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 0
+    description: |
+      Specifies the event(s) that prompt the device to reseed (i.e. reset the
+      long-term average) of an associated channel as follows:
+      0: None
+      1: Proximity
+      2: Proximity or touch
+      3: Proximity, touch or deep touch
+
+  azoteq,thresh-extend:
+    type: boolean
+    description: Multiplies all touch and deep-touch thresholds by 4.
+
+  azoteq,tracking-enable:
+    type: boolean
+    description:
+      Enables all associated channels to track their respective reference
+      channels.
+
+  azoteq,reseed-offset:
+    type: boolean
+    description:
+      Applies an 8-count offset to all long-term averages upon either ATI or
+      reseed events.
+
+  azoteq,rate-np-ms:
+    minimum: 0
+    maximum: 255
+    default: 150
+    description: Specifies the report rate (in ms) during normal-power mode.
+
+  azoteq,rate-lp-ms:
+    minimum: 0
+    maximum: 255
+    default: 150
+    description: Specifies the report rate (in ms) during low-power mode.
+
+  azoteq,rate-ulp-ms:
+    multipleOf: 16
+    minimum: 0
+    maximum: 4080
+    default: 0
+    description: Specifies the report rate (in ms) during ultra-low-power mode.
+
+  azoteq,timeout-pwr-ms:
+    multipleOf: 512
+    minimum: 0
+    maximum: 130560
+    default: 2560
+    description:
+      Specifies the length of time (in ms) to wait for an event before moving
+      from normal-power mode to low-power mode, or (if 'azoteq,ulp-enable' is
+      present) from low-power mode to ultra-low-power mode.
+
+  azoteq,timeout-lta-ms:
+    multipleOf: 512
+    minimum: 0
+    maximum: 130560
+    default: 40960
+    description:
+      Specifies the length of time (in ms) to wait before resetting the long-
+      term average of all channels. Specify the maximum timeout to disable it
+      altogether.
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+patternProperties:
+  "^ulp-0|generic-[0-2]|hall$":
+    type: object
+    description:
+      Represents a single sensing channel. A channel is active if defined and
+      inactive otherwise.
+
+    properties:
+      azoteq,ati-exclude:
+        type: boolean
+        description:
+          Prevents the channel from participating in an ATI event that is
+          manually triggered during initialization.
+
+      azoteq,reseed-disable:
+        type: boolean
+        description:
+          Prevents the channel from being reseeded if the long-term average
+          timeout (defined in 'azoteq,timeout-lta') expires.
+
+      azoteq,meas-cap-decrease:
+        type: boolean
+        description:
+          Decreases the internal measurement capacitance from 60 pF to 15 pF.
+
+      azoteq,rx-inactive:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        default: 0
+        description: |
+          Specifies how inactive CRX pins are to be terminated as follows:
+          0: VSS
+          1: Floating
+          2: VREG (generic channels only)
+
+      azoteq,linearize:
+        type: boolean
+        description:
+          Enables linearization of the channel's counts (generic and Hall
+          channels) or inverts the polarity of the channel's proximity or
+          touch states (ULP channel).
+
+      azoteq,dual-direction:
+        type: boolean
+        description:
+          Specifies that the channel's long-term average is to freeze in the
+          presence of either increasing or decreasing counts, thereby permit-
+          ting events to be reported in either direction.
+
+      azoteq,filt-disable:
+        type: boolean
+        description: Disables raw count filtering for the channel.
+
+      azoteq,ati-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        description: |
+          Specifies the channel's ATI mode as follows:
+          0: Disabled
+          1: Semi-partial
+          2: Partial
+          3: Full
+
+          The default value is a function of the channel and the device's reset
+          user interface (RUI); reference the datasheet for further information
+          about the available RUI options.
+
+      azoteq,ati-base:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [75, 100, 150, 200]
+        description:
+          Specifies the channel's ATI base. The default value is a function
+          of the channel and the device's RUI.
+
+      azoteq,ati-target:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        multipleOf: 32
+        minimum: 0
+        maximum: 2016
+        description:
+          Specifies the channel's ATI target. The default value is a function
+          of the channel and the device's RUI.
+
+      azoteq,cct-increase:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 16
+        default: 0
+        description:
+          Specifies the degree to which the channel's charge cycle time is to
+          be increased, with 0 representing no increase. The maximum value is
+          limited to 4 in the case of the ULP channel, and the property is un-
+          available entirely in the case of the Hall channel.
+
+      azoteq,proj-bias:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Specifies the bias current applied during projected-capacitance
+          sensing as follows:
+          0: 2.5 uA
+          1: 5 uA
+          2: 10 uA
+          3: 20 uA
+
+          This property is unavailable in the case of the Hall channel.
+
+      azoteq,sense-freq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        description: |
+          Specifies the channel's sensing frequency as follows (parenthesized
+          numbers represent the frequency if 'azoteq,clk-div' is present):
+          0: 4 MHz (1 MHz)
+          1: 2 MHz (500 kHz)
+          2: 1 MHz (250 kHz)
+          3: 500 kHz (125 kHz)
+
+          This property is unavailable in the case of the Hall channel. The
+          default value is a function of the channel and the device's RUI.
+
+      azoteq,ati-band-tighten:
+        type: boolean
+        description:
+          Tightens the ATI band from 1/8 to 1/16 of the desired target (ULP and
+          generic channels only).
+
+      azoteq,proj-enable:
+        type: boolean
+        description: Enables projected-capacitance sensing (ULP channel only).
+
+      azoteq,filt-str-np-cnt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description:
+          Specifies the raw count filter strength during normal-power mode (ULP
+          and generic channels only).
+
+      azoteq,filt-str-lp-cnt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description:
+          Specifies the raw count filter strength during low-power mode (ULP and
+          generic channels only).
+
+      azoteq,filt-str-np-lta:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description:
+          Specifies the long-term average filter strength during normal-power
+          mode (ULP and generic channels only).
+
+      azoteq,filt-str-lp-lta:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description:
+          Specifies the long-term average filter strength during low-power mode
+          (ULP and generic channels only).
+
+      azoteq,rx-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 8
+        items:
+          minimum: 0
+          maximum: 7
+        description:
+          Specifies the CRX pin(s) associated with the channel.
+
+          This property is unavailable in the case of the Hall channel. The
+          default value is a function of the channel and the device's RUI.
+
+      azoteq,tx-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 8
+        items:
+          minimum: 0
+          maximum: 7
+        description:
+          Specifies the TX pin(s) associated with the channel.
+
+          This property is unavailable in the case of the Hall channel. The
+          default value is a function of the channel and the device's RUI.
+
+      azoteq,local-cap-size:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3, 4]
+        default: 0
+        description: |
+          Specifies the capacitance to be added to the channel as follows:
+          0: 0 pF
+          1: 0.5 pF
+          2: 1.0 pF
+          3: 1.5 pF
+          4: 2.0 pF
+
+          This property is unavailable in the case of the ULP or Hall channels.
+
+      azoteq,sense-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 8, 9, 12, 14, 15]
+        description: |
+          Specifies the channel's sensing mode as follows:
+          0:  Self capacitance
+          1:  Projected capacitance
+          8:  Self inductance
+          9:  Mutual inductance
+          12: External
+          14: Hall effect
+          15: Temperature
+
+          This property is unavailable in the case of the ULP or Hall channels.
+          The default value is a function of the channel and the device's RUI.
+
+      azoteq,tx-freq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Specifies the inductive sensing excitation frequency as follows
+          (parenthesized numbers represent the frequency if 'azoteq,clk-div'
+          is present):
+          0: 16 MHz (4 MHz)
+          1: 8 MHz (2 MHz)
+          2: 4 MHz (1 MHz)
+          3: 2 MHz (500 kHz)
+
+          This property is unavailable in the case of the ULP or Hall channels.
+
+      azoteq,invert-enable:
+        type: boolean
+        description:
+          Inverts the polarity of the states reported for proximity, touch and
+          deep-touch events relative to their respective thresholds (generic
+          channels only).
+
+      azoteq,comp-disable:
+        type: boolean
+        description:
+          Disables compensation for the channel (generic channels only).
+
+      azoteq,static-enable:
+        type: boolean
+        description:
+          Enables the static front-end for the channel (generic channels only).
+
+      azoteq,assoc-select:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        minItems: 1
+        maxItems: 6
+        items:
+          enum:
+            - ulp-0
+            - trackpad-3x2
+            - trackpad-3x3
+            - generic-0
+            - generic-1
+            - generic-2
+            - hall
+        description:
+          Specifies the associated channels for which the channel serves as a
+          reference channel. By default, no channels are selected. This prop-
+          erty is only available for the generic channels.
+
+      azoteq,assoc-weight:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        default: 0
+        description:
+          Specifies the channel's impact weight if it acts as an associated
+          channel (0 = 0% impact, 255 = 200% impact). This property is only
+          available for the generic channels.
+
+    patternProperties:
+      "^event-(prox|touch|deep)(-alt)?$":
+        type: object
+        description:
+          Represents a proximity, touch or deep-touch event reported by the
+          channel in response to a decrease in counts. Node names suffixed with
+          '-alt' instead correspond to an increase in counts.
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
+          Proximity events are unavailable in the case of the Hall channel, and
+          deep-touch events are only available for the generic channels. Unless
+          otherwise specified, default values are a function of the channel and
+          the device's RUI.
+
+        properties:
+          azoteq,thresh:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 255
+            description: Specifies the threshold for the event.
+
+          azoteq,hyst:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 15
+            description:
+              Specifies the hysteresis for the event (touch and deep-touch
+              events only).
+
+          linux,code:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Numeric key or switch code associated with the event.
+
+          linux,input-type:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [1, 5]
+            description:
+              Specifies whether the event is to be interpreted as a key (1) or
+              a switch (5). By default, Hall-channel events are interpreted as
+              switches and all others are interpreted as keys.
+
+        dependencies:
+          linux,input-type: ["linux,code"]
+
+        additionalProperties: false
+
+    dependencies:
+      azoteq,assoc-weight: ["azoteq,assoc-select"]
+
+    additionalProperties: false
+
+  "^trackpad-3x[2-3]$":
+    type: object
+    description:
+      Represents all channels associated with the trackpad. The channels are
+      collectively active if the trackpad is defined and inactive otherwise.
+
+    properties:
+      azoteq,ati-exclude:
+        type: boolean
+        description:
+          Prevents the trackpad channels from participating in an ATI event
+          that is manually triggered during initialization.
+
+      azoteq,reseed-disable:
+        type: boolean
+        description:
+          Prevents the trackpad channels from being reseeded if the long-term
+          average timeout (defined in 'azoteq,timeout-lta') expires.
+
+      azoteq,meas-cap-decrease:
+        type: boolean
+        description:
+          Decreases the internal measurement capacitance from 60 pF to 15 pF.
+
+      azoteq,rx-inactive:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        default: 0
+        description: |
+          Specifies how inactive CRX pins are to be terminated as follows:
+          0: VSS
+          1: Floating
+
+      azoteq,linearize:
+        type: boolean
+        description: Inverts the polarity of the trackpad's touch state.
+
+      azoteq,dual-direction:
+        type: boolean
+        description:
+          Specifies that the trackpad's long-term averages are to freeze in
+          the presence of either increasing or decreasing counts, thereby
+          permitting events to be reported in either direction.
+
+      azoteq,filt-disable:
+        type: boolean
+        description: Disables raw count filtering for the trackpad channels.
+
+      azoteq,ati-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Specifies the trackpad's ATI mode as follows:
+          0: Disabled
+          1: Semi-partial
+          2: Partial
+          3: Full
+
+      azoteq,ati-base:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 6
+        maxItems: 9
+        items:
+          minimum: 45
+          maximum: 300
+        default: [45, 45, 45, 45, 45, 45, 45, 45, 45]
+        description: Specifies each individual trackpad channel's ATI base.
+
+      azoteq,ati-target:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        multipleOf: 32
+        minimum: 0
+        maximum: 2016
+        default: 0
+        description: Specifies the trackpad's ATI target.
+
+      azoteq,cct-increase:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 4
+        default: 0
+        description:
+          Specifies the degree to which the trackpad's charge cycle time is to
+          be increased, with 0 representing no increase.
+
+      azoteq,proj-bias:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Specifies the bias current applied during projected-capacitance
+          sensing as follows:
+          0: 2.5 uA
+          1: 5 uA
+          2: 10 uA
+          3: 20 uA
+
+      azoteq,sense-freq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Specifies the trackpad's sensing frequency as follows (parenthesized
+          numbers represent the frequency if 'azoteq,clk-div' is present):
+          0: 4 MHz (1 MHz)
+          1: 2 MHz (500 kHz)
+          2: 1 MHz (250 kHz)
+          3: 500 kHz (125 kHz)
+
+      azoteq,ati-band-tighten:
+        type: boolean
+        description:
+          Tightens the ATI band from 1/8 to 1/16 of the desired target.
+
+      azoteq,thresh:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 6
+        maxItems: 9
+        items:
+          minimum: 0
+          maximum: 255
+        default: [0, 0, 0, 0, 0, 0, 0, 0, 0]
+        description:
+          Specifies each individual trackpad channel's touch threshold.
+
+      azoteq,hyst:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        default: 0
+        description: Specifies the trackpad's touch hysteresis.
+
+      azoteq,lta-update:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+        default: 0
+        description: |
+          Specifies the update rate of the trackpad's long-term average during
+          ultra-low-power mode as follows:
+          0: 2
+          1: 4
+          2: 8
+          3: 16
+          4: 32
+          5: 64
+          6: 128
+          7: 255
+
+      azoteq,filt-str-trackpad:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: Specifies the trackpad coordinate filter strength.
+
+      azoteq,filt-str-np-cnt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description:
+          Specifies the raw count filter strength during normal-power mode.
+
+      azoteq,filt-str-lp-cnt:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 0
+        description:
+          Specifies the raw count filter strength during low-power mode.
+
+      linux,keycodes:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 6
+        description: |
+          Specifies the numeric keycodes associated with each available gesture
+          in the following order (enter 0 for unused gestures):
+          0: Positive flick or swipe in X direction
+          1: Negative flick or swipe in X direction
+          2: Positive flick or swipe in Y direction
+          3: Negative flick or swipe in Y direction
+          4: Tap
+          5: Hold
+
+      azoteq,gesture-swipe:
+        type: boolean
+        description:
+          Directs the device to interpret axial gestures as a swipe (finger
+          remains on trackpad) instead of a flick (finger leaves trackpad).
+
+      azoteq,timeout-tap-ms:
+        multipleOf: 16
+        minimum: 0
+        maximum: 4080
+        default: 0
+        description:
+          Specifies the length of time (in ms) within which a trackpad touch
+          must be released in order to be interpreted as a tap.
+
+      azoteq,timeout-swipe-ms:
+        multipleOf: 16
+        minimum: 0
+        maximum: 4080
+        default: 0
+        description:
+          Specifies the length of time (in ms) within which an axial gesture
+          must be completed in order to be interpreted as a flick or swipe.
+
+      azoteq,thresh-swipe:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        default: 0
+        description:
+          Specifies the number of points across which an axial gesture must
+          travel in order to be interpreted as a flick or swipe.
+
+    dependencies:
+      azoteq,gesture-swipe: ["linux,keycodes"]
+      azoteq,timeout-tap-ms: ["linux,keycodes"]
+      azoteq,timeout-swipe-ms: ["linux,keycodes"]
+      azoteq,thresh-swipe: ["linux,keycodes"]
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
+            iqs626a@44 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    compatible = "azoteq,iqs626a";
+                    reg = <0x44>;
+                    interrupt-parent = <&gpio>;
+                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+
+                    azoteq,rate-np-ms = <16>;
+                    azoteq,rate-lp-ms = <160>;
+
+                    azoteq,timeout-pwr-ms = <2560>;
+                    azoteq,timeout-lta-ms = <32768>;
+
+                    ulp-0 {
+                            azoteq,meas-cap-decrease;
+
+                            azoteq,ati-base = <75>;
+                            azoteq,ati-target = <1024>;
+
+                            azoteq,rx-enable = <2>, <3>, <4>,
+                                               <5>, <6>, <7>;
+
+                            event-prox {
+                                    linux,code = <KEY_POWER>;
+                            };
+                    };
+
+                    trackpad-3x3 {
+                            azoteq,filt-str-np-cnt = <1>;
+                            azoteq,filt-str-lp-cnt = <1>;
+
+                            azoteq,hyst = <4>;
+                            azoteq,thresh = <35>, <40>, <40>,
+                                            <38>, <33>, <38>,
+                                            <35>, <35>, <35>;
+
+                            azoteq,ati-mode = <3>;
+                            azoteq,ati-base = <195>, <195>, <195>,
+                                              <195>, <195>, <195>,
+                                              <195>, <195>, <195>;
+                            azoteq,ati-target = <512>;
+
+                            azoteq,proj-bias = <1>;
+                            azoteq,sense-freq = <2>;
+
+                            linux,keycodes = <KEY_VOLUMEUP>,
+                                             <KEY_VOLUMEDOWN>,
+                                             <KEY_NEXTSONG>,
+                                             <KEY_PREVIOUSSONG>,
+                                             <KEY_PLAYPAUSE>,
+                                             <KEY_STOPCD>;
+
+                            azoteq,gesture-swipe;
+                            azoteq,timeout-swipe-ms = <800>;
+                            azoteq,timeout-tap-ms = <400>;
+                            azoteq,thresh-swipe = <40>;
+                    };
+
+                    /*
+                     * Preserve the default register settings for
+                     * the temperature-tracking channel leveraged
+                     * by reset user interface (RUI) 1.
+                     *
+                     * Scalar properties (e.g. ATI mode) are left
+                     * untouched by simply omitting them; boolean
+                     * properties must be specified explicitly as
+                     * needed.
+                     */
+                    generic-2 {
+                            azoteq,reseed-disable;
+                            azoteq,meas-cap-decrease;
+                            azoteq,dual-direction;
+                            azoteq,comp-disable;
+                            azoteq,static-enable;
+                    };
+
+                    hall {
+                            azoteq,reseed-disable;
+                            azoteq,meas-cap-decrease;
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

