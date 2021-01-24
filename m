Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F2330196C
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 04:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbhAXDqD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 22:46:03 -0500
Received: from mail-eopbgr750071.outbound.protection.outlook.com ([40.107.75.71]:35295
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726223AbhAXDqB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 22:46:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQI0JLdRVHXojNFDhy8i7EH3DocgfIICmNvrHYJPPQDHJ1lX5cJ6YTwadpXP/xj0QiT8+ZppSXOqBEZ2lctT9GXJZI8vhtP3mZ+woD8KOii73CuQ8U6y2omVvphM+8VWZDeAETBtOM1fIMoUcB3Wr/J+77zXu1QjHUo+OD2xUjBhmiJMVcK0odH/ly2/PfvAuXrNFbjo99/ke0s8gekd0iyXKs3FZ3AR/UGy03kPr9WroJfAhwS0Mt2xR5i1IT70qmOJryUFj7/L9L2nFVB1Zy707RtCzp0alQ4c9U5z7dz89Fy2+iIHl4+vyoDORaRYIdvfRFRogum3hJqN0RYhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TT8oEZn3mMHqDkc8Zysyul/5tsGGsrhh4WeqHHSjm+0=;
 b=XKrR/FHfMvo7J9p26uNkQbXqM7ZdP2QSZEMs9uYlroaifWgS8IBwMLxv4+r2zknBAqub3tHaQRhBt0SYGyJD78Iw9+GlnVcTwh0SaUL0M1DNHHy5DILYf7igrkpXwDG3qXmRMoZ3zzqPsU0yS4Kbdu4MglwFNsmBSNCFHlFhdzwDFXJT9c3SM4xPjKdDKNfzbporIQS95DwxOAeZKGE9YlXPE6wEj/6r7rEPrWVAt78KCMs+dtYCtXy/AUfDsaDL940yjftrDUFkaN5grsqnajozP3E1j2CPmc1tu8X1kXWlwShPB1z5WMoKZQilopav+3X8OoKKrk+xhdrG+gpi8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TT8oEZn3mMHqDkc8Zysyul/5tsGGsrhh4WeqHHSjm+0=;
 b=YxNhv+K5KJCqd797yBpcJEcBUeX/Km+P+8sOYkJH3squkPWdnwt4C2ULzRYHt7S1jMPRw6fzHofni52K7k4ja9OenZgndurn55shcnE1u1GycAfD3fMLT3lJH+3MAJhFDnwPIgMQ+rusadTN5HnhodAaWXJX1vHEHxnmunOMX38=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB6992.namprd08.prod.outlook.com (2603:10b6:806:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Sun, 24 Jan
 2021 03:44:07 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Sun, 24 Jan 2021
 03:44:07 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 4/5] dt-bindings: input: Add bindings for Azoteq IQS626A
Date:   Sat, 23 Jan 2021 21:42:55 -0600
Message-Id: <1611459776-23265-5-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611459776-23265-1-git-send-email-jeff@labundy.com>
References: <1611459776-23265-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:806:a7::19) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SA9PR10CA0014.namprd10.prod.outlook.com (2603:10b6:806:a7::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Sun, 24 Jan 2021 03:44:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df2c91d-2ca4-4e5c-5af4-08d8c01a4d5a
X-MS-TrafficTypeDiagnostic: SA1PR08MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA1PR08MB69923300D7A2F92912F38CF6D3BE9@SA1PR08MB6992.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yu4FRHEjCZzjtVGplRF86paoZq3gH3elj9EymsktxoqW1l3I2yg4rwLClSLjXzLSHnyFaLkTB/I62DMoBZnv+1q5F/mgxkgTtbsYjo9JY1RE/5/Z6h13YUCaZqplH1tZ6Ca4CQjlnTxXAmsne5TQyA0w22UBB03cCo9F80RAVHzeO4AiHuLY8iQuwZokH9a5EeBG9vCXZAKlFwtaWE8ar10Yc4L0QeiBBpcIT/mcgCNN5Q8R2FuC1nK8d9f9Yp+cNC+1v+WyVLmrnFXUEsuPkak/feX275VKH+K6k6vM7bFbm1BqHl2p6axh0tw5Vhuq5J/m/4u4S0JuC8tDQH5RrGhCosX5kjDJVyVQnkk3FvCdkPbALs3AidWXuWe4YrsXWopBRE4Q6UpQqQjgg5mW2/KEg7fdUzk4Fgrt6Ttl+bQXa5RKoVha2EwECjVVsPctE121+iAgdvvQpRE6Wa7ldqMaZRpTOZ6Qht1/Acsju0n+Gbxvo6O6Mcia4WpMfopd1ESbLl3piL8HYWKuJJmEew==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(136003)(39830400003)(346002)(52116002)(107886003)(5660300002)(66946007)(8676002)(6486002)(6506007)(66556008)(8936002)(36756003)(966005)(66476007)(86362001)(69590400011)(2616005)(83380400001)(4326008)(26005)(30864003)(16526019)(186003)(6512007)(6666004)(316002)(478600001)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SWB8bMX0K64no/UvIKkXkQPxnGQ9fcRTYDA0SAA0ibPcajnwtnD3PO9WunH6?=
 =?us-ascii?Q?x50mdrdyqFS1zlREAIJYuUSmHcaLdImcDqMlbnzoi+6Hc2S87IvN/sBabzXy?=
 =?us-ascii?Q?MS0UDVnHUlOO3iGlAoyYv85yNFH0SkpkBYpCtqndfA5RZ0ji/lcWTf0LYjVV?=
 =?us-ascii?Q?pcocJesILZARnE2oWayEyeTISCyxIXaYEc4pO5SCnVdji4lND1FGTGMLHl5W?=
 =?us-ascii?Q?22UVxPr8eXc2/xfxrU6I71TenptSem0YD9F/sZaHAtQI9Izc3jU4K647sTm9?=
 =?us-ascii?Q?MgRmigvMpXnVBGSwwMakLjn1yteXG9SETLUKwPbj9dhEWChamsgzTUNVuIBO?=
 =?us-ascii?Q?R6gLCxJ4abGtbIH9zo7DYCTsi4eeOFEmeUmmTQgL3gEtVRcSzvNRqto2nTP/?=
 =?us-ascii?Q?iP7FheAHv9LWOiKTXLu7HPFfAZ9Pck7CAu/ZVjH97gJh7CUBYBfS6iouQJcF?=
 =?us-ascii?Q?b/2qdeN/Z4qaDIrN/gVS6QcJOcVkN5BBdtxyYQD7vrw8Nomw/bSdiH7VyfbE?=
 =?us-ascii?Q?buq8qp8YhCYkwdD4MoK45sAACY8q4O7mwjD/5THugiBwpiiAV9+vReSUuewI?=
 =?us-ascii?Q?A223/cTLl5/VRtBa4eeRCqtJgg3cuP4jd/j1mflpdpWMigB938gmUQDpnuTb?=
 =?us-ascii?Q?Gq0IWKt99bh3oq+L2vzVFW2t+6cEK01HKm/tsXGLuaqAMeu6gm4ciC6nMjtL?=
 =?us-ascii?Q?wD+qF/f6BRIGC+L3vZmHRA652vVON4SqSCQqpODziFoD3BlZixR7UqII4KCd?=
 =?us-ascii?Q?LPhAl10ZR4L6ihb2trc4rvYNBXedIIsRP3ani8EgJr5Y5horb7X5ifl9Kfb+?=
 =?us-ascii?Q?f1UJrCo0Y8b0ayCfADdbftAJKyUaHksRi22sq/7PMLG65AxGhBwgKB0liKFR?=
 =?us-ascii?Q?cY/iEUPt2ytyNka8zYb/iWjmYZiq1+q0/yGO0jaZ7rmYeRscNxsuG/8KJqCH?=
 =?us-ascii?Q?j/q0OiAlg98ucC+sTYATkqhxnwmOJ9FRkWzmaydouKDub7zWrZjo9jEotLDM?=
 =?us-ascii?Q?L3Bs?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df2c91d-2ca4-4e5c-5af4-08d8c01a4d5a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2021 03:44:07.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GFsFvIj9GLmTDujdzYEt6dwwu+sClxtkJkVLq9DovyhKvGC1BiF+vO3/yJ5WDghdyalBoIwwgTNjlNBgDPp7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB6992
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds device tree bindings for the Azoteq IQS626A
capacitive touch controller.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Added missing $ref to touchscreen.yaml

 .../devicetree/bindings/input/iqs626a.yaml         | 843 +++++++++++++++++++++
 1 file changed, 843 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml

diff --git a/Documentation/devicetree/bindings/input/iqs626a.yaml b/Documentation/devicetree/bindings/input/iqs626a.yaml
new file mode 100644
index 0000000..679971e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/iqs626a.yaml
@@ -0,0 +1,843 @@
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
+allOf:
+  - $ref: touchscreen.yaml#
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

