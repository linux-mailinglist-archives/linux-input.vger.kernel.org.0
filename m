Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1617497546
	for <lists+linux-input@lfdr.de>; Sun, 23 Jan 2022 20:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234820AbiAWTnE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jan 2022 14:43:04 -0500
Received: from mail-dm6nam10on2072.outbound.protection.outlook.com ([40.107.93.72]:41949
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230038AbiAWTnB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jan 2022 14:43:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hh7pRbcuNbsBFu/aY22/D+AW3evcbtSgb5Q7aMlZRKhj15fI25Iqv4B4nbnsbz9cwAa6fCSj5qrqW4+KekyvmCR4VghY3I9YXGeIxuU7ZZTXtGIwgAE+OpN+uZ9Rl+N/7OdLqS1MKMeb4jcCKbHp2ZS9AJo1/e6jNOavd95wY7W8LJizynNkQJ/P+AuRcL5WF4ySZCqZde6VL9de3UKgv/qWHDyRbI+TtAduBZdWI6fHycshgGxKMbx71Lj2QaCk/KgmM3kbtXnQiHiDKYNAdhMrXKORBfpcVUkpyksig9z3ZIB9EjXABrhb93YZr0mFoqzbtmzH+oqLHHfXasnInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Axfw9nnnlOazI/97zHJStx/5z3JyY2OM/uYyma4Y7sc=;
 b=QU4TMX1keGPuoicd2rIs8zbieE0E5PrNTLodN797qeDNDXAGk/QQ7ag3jTVhon5sz0jtmHavani+td7M43mlPFPnyYUIQhpBTg/hWn17T9zQweB24U7LFYGvpIqvO9TGYHuH3f7C8/XN2aLFG+lkFJvTw2nDBOM5rrZDoZDQFIwlFnMZrHpU+jfanWhB5gDqgAksFRwU9bTcZNU5Vs+AZv7UA4CkREOO82hp/Jd1iEqHTzKiBa/n/6LcDNxCR7kfiNCWQ1BNZtGSciTMVR7PQcOYADgRFr8V9dWeXGlWiswT8sXVCPuAO+1NWmYxT10vLbyjak2eB7JADneIwxenvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Axfw9nnnlOazI/97zHJStx/5z3JyY2OM/uYyma4Y7sc=;
 b=PSGNoAXiCBdMA9kCg0gbXtma7pBl6zKyqJG9+0bg9WfUpqwXNwdRS8L5DSextLbpx3LECtpKQvSWjCjNNJ7vbI1Y65w6pfliTdo1T2t2pTWavBCdbYry1owbscd/lI/qYjNN0tuxppS0Odjfig8/Jpnoteh0qu7NsM1vtfYtFxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by SN6PR08MB4783.namprd08.prod.outlook.com (2603:10b6:805:69::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Sun, 23 Jan
 2022 19:42:58 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba%5]) with mapi id 15.20.4909.017; Sun, 23 Jan 2022
 19:42:58 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C
Date:   Sun, 23 Jan 2022 13:42:31 -0600
Message-Id: <20220123194232.85288-2-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220123194232.85288-1-jeff@labundy.com>
References: <20220123194232.85288-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:806:d2::9) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4e0b1e8-d8fe-4b9e-0a0b-08d9dea88e82
X-MS-TrafficTypeDiagnostic: SN6PR08MB4783:EE_
X-Microsoft-Antispam-PRVS: <SN6PR08MB4783D11874F41028C6BFE8E5D35D9@SN6PR08MB4783.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RVoVsdYJzImbe4jFmtQeVIYy64zUg6+0z/12seIQx2pY/Tkb4ouYFZfnj2Y3lEWucK0tXUu9QHLK5NhpJuRMlfSXFdEVg1umzSvWb5v8/ATDAu8X+Wu5WLtwgNMQs1FcGfZkFVfWzuSK4hwYMNol36iVablnOYdDU7lvqcgdDDvb6Fz6Z1IKWA7JWriTIBV479/SUyEjPU6QM9/ME9mTkLZyH/EgeV+iQag0Gl5Hk3adfS6DdS8wZuZGne8CHfRm2p5zXZsnJNAy8GGtOgDlScN2pQH81eqPQRdzLLlT3RixcuBpRnnV8zhL5yDIZWZ4BeixEiA8YlgnT8Hmk53R0pX6cSMcPhc7xG72AYualdwkv0Ww7FQE+Da6ge97Z91O0m5IgB9dZlbmgyDEpD6qaNtuQ1g9uBV+o18AKp+bxmv5tvdy4SY+viXhzDDpf5ZgXe6HGg78CMAGbOyTte/Jxz5fTdZPaOU2utvU88Pw1OjmE3ILi+B43pgm1MgM6ACbkSyMU4ovkWm9MnKDW2CYS50DQQeaHzkHa82vymIqyM++shzeomY4yt4LUo1SIg1YDkjHPQALvEkbYZePlLouZc8u50nrTuU+YD0ryi/aQmkuryBkcYsO2IDN+h/AKq0AVn9mKHANr46wmi3OoOjruLKAOo3xUeoLXVWbYweQ+Hd7iMsOFppjIRrt0PjHVFdBEztO5OgWAFA5aBJmqokxlL5p4jaf6e2mrd/pB7qz8LZ2BFeHpuEYB+O1iXunk314DmRVJml+8OTCywX3aOItXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39830400003)(136003)(366004)(396003)(508600001)(107886003)(5660300002)(66556008)(26005)(316002)(1076003)(66946007)(66476007)(966005)(2906002)(30864003)(6486002)(83380400001)(52116002)(4326008)(6666004)(8936002)(38100700002)(186003)(8676002)(6512007)(86362001)(6506007)(36756003)(2616005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kyscFr+EQVNjCWFPUl+qkeoO7neY3ICmsQRoz7XkOAS0bDDG9Pf5UK795lDp?=
 =?us-ascii?Q?aPPJ/229J6y4aaK7LKgaS0yUEQJTNI+ci3S7E6UZCHmz/RO8Ta5QU4h4PIZK?=
 =?us-ascii?Q?6nscwITkkooFp2dhrsAJ1/wnQSuurrSmHiguor53p1v76D/eMvbi9VQYho68?=
 =?us-ascii?Q?TzY1mbE/NxnRQJHO7COca7LlJxkG36MN6aO0OVgbfwSN0ZkfSMitqjo+665l?=
 =?us-ascii?Q?zDN9xEMmeaUPxYB+gl0rRtPzKkAlQ/w1Iokl3dg0N03MEgv9ZfzT/43R00/i?=
 =?us-ascii?Q?9x5qUGHnHT201wEJ/kjN7hM+pP4tIx/nlHrJW3gVWdfy0BtRKAPoBSlzBBxv?=
 =?us-ascii?Q?QC4+QG1/UenpcbMpTXEuwiveoUb+zBoXRkFots6gj3eQy37lANU6UFH1edRf?=
 =?us-ascii?Q?MGKwv7fiAeuwafw6rrY25PMiLlTOv5LPJI0IRLNOfVRgbDvZgAvQDabKGuRt?=
 =?us-ascii?Q?UF1+qCbhJ8po3xbi6g0cKp1nokgWiQn7tfEWZGvSxzJeOU7hkPwhfrzwNlsa?=
 =?us-ascii?Q?NAKAsSQDYJBvq/ylHuHzm0wrQXhiCsl4ZObP1CxQi2v8oAc/hlrfQWOeZs2g?=
 =?us-ascii?Q?8A0+Slz7jAqGPxw4U+c710yFvQHyxQMeKKU1ZPkKRPXUT5yViB8fXW1d8Nv6?=
 =?us-ascii?Q?+bddh8tfDCR3UmWlLz711arQ364ImqF+95+Hwt+8jZLj9YUjnEtGRjbsblau?=
 =?us-ascii?Q?Yt5DbhwJPuQmm6TpJBGTZy7lGcc7m2E9hGS0fapoG74JQUl0iaWJAopoQCDS?=
 =?us-ascii?Q?082BHsj9tRQlmfzAMTLzxXdfOBoaMDptaYwENId3R2KCWHvxctRbrTUkF8Au?=
 =?us-ascii?Q?dB5eJ9q46zyep+OqSNCuB/Q3TDnUlFF8x1cXKTUUO0i1+OX6JCoDYDLmGyah?=
 =?us-ascii?Q?yvS6M+XVCplRLPW/0sV5fm7gwSYfzf7/Ir4i/2FanHRJR7StDy+hHySVuNmI?=
 =?us-ascii?Q?iW59H5i2Ex5SfAAA/wZ95CHrrpXlbmLqdbpHCz9bzJ92x8gaOaTpu3QTnbOI?=
 =?us-ascii?Q?XOgsx7NvXh3ptwtCv8ZUG+qUsI1h3GmrBmYZNJfcokNZOM14NTaf2mSXeulS?=
 =?us-ascii?Q?DJsSf2SsUctWnVphAUj1CeQPWdTFpzstGOMJtLMbukNBsC/fqHrSeAFLOkbj?=
 =?us-ascii?Q?KZJfsWvTDODpBSg+uGKLWlhxcbGZdgxxq3xwJewFpFj62Qhp3THQICjj27UT?=
 =?us-ascii?Q?zcuNnruQHQAdnu+GCJKUr4DN5223q9p2Y6jUJ+Tb+z5jQJjRMUbLUkIsfApG?=
 =?us-ascii?Q?oFCd6K6qG0HRg7yL+BiAjg8U0C6RjXCwDzkbr3TaF3PGC+/1NV3HY8rLm7dE?=
 =?us-ascii?Q?5S7T2B9IzjZPeIrxtK/UzRUWpNNZgrln10Vg+OugznVZglA1f71wNrVmYW7n?=
 =?us-ascii?Q?Qhkr4ptppMoMUtKDVgno6UCbCMsOSw2/ty0Ci52CAThRNFo0iXiWIVteOA3H?=
 =?us-ascii?Q?N3CvbbOisZ4VoUe1fcAoH1iKTD1NkCKNEANKwtysYk+AxkWWcmR9x89kBXo5?=
 =?us-ascii?Q?V4bq06+gcXGedjIRO7VUwW6OIdSq+DqKc+6RAYsEIWAs+hftY8pav3mdayIa?=
 =?us-ascii?Q?oGXKsoL2+FoVopOSf9BJFFPjIjvzccd1hmOZlPOBRyOhnWf4tdfknVD/AQQ7?=
 =?us-ascii?Q?f813yeOsHgIeJb8RRqNxJ8A=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e0b1e8-d8fe-4b9e-0a0b-08d9dea88e82
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2022 19:42:57.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RCQqwB/8y+54KqfNrJLH4P3zIes/FB40SR21TNa1bEXc+fCmLMvSedhbjcdmRAY4slJVPV/f/hEDTK6X4dXfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4783
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for the Azoteq IQS7222A/B/C family of
capacitive touch controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../devicetree/bindings/input/iqs7222.yaml    | 967 ++++++++++++++++++
 1 file changed, 967 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/iqs7222.yaml

diff --git a/Documentation/devicetree/bindings/input/iqs7222.yaml b/Documentation/devicetree/bindings/input/iqs7222.yaml
new file mode 100644
index 000000000000..0c23d1d49ebd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/iqs7222.yaml
@@ -0,0 +1,967 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/iqs7222.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Azoteq IQS7222A/B/C Capacitive Touch Controller
+
+maintainers:
+  - Jeff LaBundy <jeff@labundy.com>
+
+description: |
+  The Azoteq IQS7222A, IQS7222B and IQS7222C are multichannel capacitive touch
+  controllers that feature additional sensing capabilities.
+
+  Link to datasheets: https://www.azoteq.com/
+
+properties:
+  compatible:
+    enum:
+      - azoteq,iqs7222a
+      - azoteq,iqs7222b
+      - azoteq,iqs7222c
+
+  reg:
+    maxItems: 1
+
+  irq-gpios:
+    maxItems: 1
+    description:
+      Specifies the GPIO connected to the device's active-low RDY output.
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Specifies the GPIO connected to the device's active-low MCLR input. The
+      device is temporarily held in hardware reset prior to initialization if
+      this property is present.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  azoteq,rf-filt-enable:
+    type: boolean
+    description: Enables the device's internal RF filter.
+
+  azoteq,max-counts:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    description: |
+      Specifies the maximum counts as follows:
+      0: 1023
+      1: 2047
+      2: 4095
+      3: 16384
+
+  azoteq,auto-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    description: |
+      Specifies the number of conversions to occur before an interrupt is
+      generated as follows:
+      0: 4
+      1: 8
+      2: 16
+      3: 32
+
+  azoteq,ati-frac-div-fine:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+    description: Specifies the preloaded ATI fine fractional divider.
+
+  azoteq,ati-frac-div-coarse:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+    description: Specifies the preloaded ATI coarse fractional divider.
+
+  azoteq,ati-comp-select:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1023
+    description: Specifies the preloaded ATI compensation selection.
+
+  azoteq,lta-beta-lp:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Specifies the long-term average filter damping factor to be applied during
+      low-power mode.
+
+  azoteq,lta-beta-np:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Specifies the long-term average filter damping factor to be applied during
+      normal-power mode.
+
+  azoteq,counts-beta-lp:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Specifies the counts filter damping factor to be applied during low-power
+      mode.
+
+  azoteq,counts-beta-np:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Specifies the counts filter damping factor to be applied during normal-
+      power mode.
+
+  azoteq,lta-fast-beta-lp:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Specifies the long-term average filter fast damping factor to be applied
+      during low-power mode.
+
+  azoteq,lta-fast-beta-np:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description:
+      Specifies the long-term average filter fast damping factor to be applied
+      during normal-power mode.
+
+  azoteq,timeout-ati-ms:
+    multipleOf: 500
+    minimum: 0
+    maximum: 32767500
+    description:
+      Specifies the delay (in ms) before ATI is retried following an ATI error.
+
+  azoteq,rate-ati-ms:
+    minimum: 0
+    maximum: 65535
+    description: Specifies the rate (in ms) at which ATI status is evaluated.
+
+  azoteq,timeout-np-ms:
+    minimum: 0
+    maximum: 65535
+    description:
+      Specifies the length of time (in ms) to wait for an event before moving
+      from normal-power mode to low-power mode.
+
+  azoteq,rate-np-ms:
+    minimum: 0
+    maximum: 3000
+    description: Specifies the report rate (in ms) during normal-power mode.
+
+  azoteq,timeout-lp-ms:
+    minimum: 0
+    maximum: 65535
+    description:
+      Specifies the length of time (in ms) to wait for an event before moving
+      from low-power mode to ultra-low-power mode.
+
+  azoteq,rate-lp-ms:
+    minimum: 0
+    maximum: 3000
+    description: Specifies the report rate (in ms) during low-power mode.
+
+  azoteq,timeout-ulp-ms:
+    minimum: 0
+    maximum: 65535
+    description:
+      Specifies the rate (in ms) at which channels not regularly sampled during
+      ultra-low-power mode are updated.
+
+  azoteq,rate-ulp-ms:
+    minimum: 0
+    maximum: 3000
+    description: Specifies the report rate (in ms) during ultra-low-power mode.
+
+patternProperties:
+  "^cycle-[0-9]$":
+    type: object
+    description: Represents a conversion cycle serving two sensing channels.
+
+    properties:
+      azoteq,conv-period:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the cycle's conversion period.
+
+      azoteq,conv-frac:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the cycle's conversion frequency fraction.
+
+      azoteq,tx-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 9
+        items:
+          minimum: 0
+          maximum: 8
+        description: Specifies the CTx pin(s) associated with the cycle.
+
+      azoteq,rx-float-inactive:
+        type: boolean
+        description: Floats any inactive CRx pins instead of grounding them.
+
+      azoteq,dead-time-enable:
+        type: boolean
+        description:
+          Increases the denominator of the conversion frequency formula by one.
+
+      azoteq,tx-freq-fosc:
+        type: boolean
+        description:
+          Fixes the conversion frequency to that of the device's core clock.
+
+      azoteq,vbias-enable:
+        type: boolean
+        description: Enables the bias voltage for use during inductive sensing.
+
+      azoteq,sense-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        description: |
+          Specifies the cycle's sensing mode as follows:
+          0: None
+          1: Self capacitive
+          2: Mutual capacitive
+          3: Inductive
+
+          Note that in the case of IQS7222A, cycles 5 and 6 are restricted to
+          Hall-effect sensing.
+
+      azoteq,iref-enable:
+        type: boolean
+        description:
+          Enables the current reference for use during various sensing modes.
+
+      azoteq,iref-level:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        description: Specifies the cycle's current reference level.
+
+      azoteq,iref-trim:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        description: Specifies the cycle's current reference trim.
+
+    dependencies:
+      azoteq,iref-level: ["azoteq,iref-enable"]
+      azoteq,iref-trim: ["azoteq,iref-enable"]
+
+    additionalProperties: false
+
+  "^channel-[0-19]$":
+    type: object
+    description:
+      Represents a single sensing channel. A channel is active if defined and
+      inactive otherwise.
+
+      Note that in the case of IQS7222A, channels 10 and 11 are restricted to
+      Hall-effect sensing with events reported on channel 10 only.
+
+    properties:
+      azoteq,ulp-allow:
+        type: boolean
+        description:
+          Permits the device to enter ultra-low-power mode while the channel
+          lies in a state of touch or proximity.
+
+      azoteq,ref-select:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 9
+        description: Specifies a separate reference channel to be followed.
+
+      azoteq,ref-weight:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 65535
+        description: Specifies the relative weight of the reference channel.
+
+      azoteq,use-prox:
+        type: boolean
+        description:
+          Activates the reference channel in response to proximity events
+          instead of touch events.
+
+      azoteq,ati-band:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        description: |
+          Specifies the channel's ATI band as a fraction of its ATI target as
+          follows:
+          0: 1/16
+          1: 1/8
+          2: 1/4
+          3: 1/2
+
+      azoteq,global-halt:
+        type: boolean
+        description:
+          Specifies that the channel's long-term average is to freeze if any
+          other participating channel lies in a proximity or touch state.
+
+      azoteq,invert-enable:
+        type: boolean
+        description:
+          Inverts the polarity of the states reported for proximity and touch
+          events relative to their respective thresholds.
+
+      azoteq,dual-direction:
+        type: boolean
+        description:
+          Specifies that the channel's long-term average is to freeze in the
+          presence of either increasing or decreasing counts, thereby permit-
+          ting events to be reported in either direction.
+
+      azoteq,rx-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 4
+        items:
+          minimum: 0
+          maximum: 7
+        description: Specifies the CRx pin(s) associated with the channel.
+
+      azoteq,samp-cap-double:
+        type: boolean
+        description: Doubles the sampling capacitance from 40 pF to 80 pF.
+
+      azoteq,vref-half:
+        type: boolean
+        description: Halves the discharge threshold from 1.0 V to 0.5 V.
+
+      azoteq,proj-bias:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        description: |
+          Specifies the bias current applied during mutual (projected)
+          capacitive sensing as follows:
+          0: 2 uA
+          1: 5 uA
+          2: 7 uA
+          3: 10 uA
+
+      azoteq,ati-target:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        multipleOf: 8
+        minimum: 0
+        maximum: 2040
+        description: Specifies the channel's ATI target.
+
+      azoteq,ati-base:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        multipleOf: 16
+        minimum: 0
+        maximum: 496
+        description: Specifies the channel's ATI base.
+
+      azoteq,ati-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3, 4, 5]
+        description: |
+          Specifies the channel's ATI mode as follows:
+          0: Disabled
+          1: Compensation
+          2: Compensation divider
+          3: Fine fractional divider
+          4: Coarse fractional divider
+          5: Full
+
+      azoteq,ati-frac-div-fine:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the channel's ATI fine fractional divider.
+
+      azoteq,ati-frac-mult-coarse:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        description: Specifies the channel's ATI coarse fractional multiplier.
+
+      azoteq,ati-frac-div-coarse:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the channel's ATI coarse fractional divider.
+
+      azoteq,ati-comp-div:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the channel's ATI compensation divider.
+
+      azoteq,ati-comp-select:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 1023
+        description: Specifies the channel's ATI compensation selection.
+
+      azoteq,debounce-enter:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        description: Specifies the channel's debounce entrance factor.
+
+      azoteq,debounce-exit:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        description: Specifies the channel's debounce exit factor.
+
+    patternProperties:
+      "^event-(prox|touch)$":
+        type: object
+        description:
+          Represents a proximity or touch event reported by the channel.
+
+        properties:
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
+              1: GPIO3 (IQS7222C only)
+              2: GPIO4 (IQS7222C only)
+
+              Note that although multiple events can be mapped to a single
+              GPIO, they must all be of the same type (proximity, touch or
+              slider gesture).
+
+          azoteq,thresh:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              Specifies the threshold for the event. Valid entries range from
+              0-127 and 0-255 for proximity and touch events, respectively.
+
+          azoteq,hyst:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 255
+            description:
+              Specifies the hysteresis for the event (touch events only).
+
+          azoteq,timeout-press-ms:
+            multipleOf: 500
+            minimum: 0
+            maximum: 127500
+            description:
+              Specifies the length of time (in ms) to wait before automatically
+              releasing a press event. Specify zero to allow the press state to
+              persist indefinitely.
+
+              The IQS7222B does not feature channel-specific timeouts; the time-
+              out specified for any one channel applies to all channels.
+
+          linux,code:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              Numeric key or switch code associated with the event. Specify
+              KEY_RESERVED (0) to opt out of event reporting.
+
+          linux,input-type:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [1, 5]
+            default: 1
+            description:
+              Specifies whether the event is to be interpreted as a key (1)
+              or a switch (5).
+
+        required:
+          - linux,code
+
+        additionalProperties: false
+
+    dependencies:
+      azoteq,ref-weight: ["azoteq,ref-select"]
+      azoteq,use-prox: ["azoteq,ref-select"]
+
+    additionalProperties: false
+
+  "^slider-[0-1]$":
+    type: object
+    description: Represents a slider comprising three or four channels.
+
+    properties:
+      azoteq,channel-select:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 3
+        maxItems: 4
+        items:
+          minimum: 0
+          maximum: 9
+        description:
+          Specifies the order of the channels that participate in the slider.
+
+      azoteq,slider-size:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 65535
+        description:
+          Specifies the slider's one-dimensional resolution, equal to the
+          maximum coordinate plus one.
+
+      azoteq,lower-cal:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the slider's lower starting point.
+
+      azoteq,upper-cal:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the slider's upper starting point.
+
+      azoteq,top-speed:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 65535
+        description:
+          Specifies the speed of movement after which coordinate filtering is
+          no longer applied.
+
+      azoteq,bottom-speed:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        multipleOf: 4
+        minimum: 0
+        maximum: 1020
+        description:
+          Specifies the speed of movement after which coordinate filtering is
+          linearly reduced.
+
+      azoteq,bottom-beta:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 7
+        description:
+          Specifies the coordinate filter damping factor to be applied
+          while the speed of movement is below that which is specified
+          by azoteq,bottom-speed.
+
+      azoteq,static-beta:
+        type: boolean
+        description:
+          Applies the coordinate filter damping factor specified by
+          azoteq,bottom-beta regardless of the speed of movement.
+
+      azoteq,use-prox:
+        type: boolean
+        description:
+          Directs the slider to respond to the proximity states of the selected
+          channels instead of their corresponding touch states. Note the slider
+          cannot report granular coordinates during a state of proximity.
+
+      linux,axis:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Specifies the absolute axis to which coordinates are mapped. Specify
+          ABS_WHEEL to operate the slider as a wheel (IQS7222C only).
+
+    patternProperties:
+      "^event-(press|tap|(swipe|flick)-(pos|neg))$":
+        type: object
+        description:
+          Represents a press or gesture (IQS7222A only) event reported by
+          the slider.
+
+        properties:
+          linux,code:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: Numeric key code associated with the event.
+
+          azoteq,gesture-max-ms:
+            multipleOf: 4
+            minimum: 0
+            maximum: 1020
+            description:
+              Specifies the length of time (in ms) within which a tap, swipe
+              or flick gesture must be completed in order to be acknowledged
+              by the device. The number specified for any one swipe or flick
+              gesture applies to all remaining swipe or flick gestures.
+
+          azoteq,gesture-min-ms:
+            multipleOf: 4
+            minimum: 0
+            maximum: 124
+            description:
+              Specifies the length of time (in ms) for which a tap gesture must
+              be held in order to be acknowledged by the device.
+
+          azoteq,gesture-dist:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            multipleOf: 16
+            minimum: 0
+            maximum: 4080
+            description:
+              Specifies the distance across which a swipe or flick gesture must
+              travel in order to be acknowledged by the device. The number spec-
+              ified for any one swipe or flick gesture applies to all remaining
+              swipe or flick gestures.
+
+          azoteq,gpio-select:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 1
+            maxItems: 1
+            items:
+              minimum: 0
+              maximum: 0
+            description: |
+              Specifies an individual GPIO mapped to a tap, swipe or flick
+              gesture as follows:
+              0: GPIO0
+              1: GPIO3 (reserved)
+              2: GPIO4 (reserved)
+
+              Note that although multiple events can be mapped to a single
+              GPIO, they must all be of the same type (proximity, touch or
+              slider gesture).
+
+        required:
+          - linux,code
+
+        additionalProperties: false
+
+    required:
+      - azoteq,channel-select
+
+    additionalProperties: false
+
+  "^gpio-[0-2]$":
+    type: object
+    description: |
+      Represents a GPIO mapped to one or more events as follows:
+      gpio-0: GPIO0
+      gpio-1: GPIO3 (IQS7222C only)
+      gpio-2: GPIO4 (IQS7222C only)
+
+    allOf:
+      - $ref: ../pinctrl/pincfg-node.yaml#
+
+    properties:
+      drive-open-drain: true
+
+    additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: azoteq,iqs7222b
+
+    then:
+      patternProperties:
+        "^cycle-[0-9]$":
+          properties:
+            azoteq,iref-enable: false
+
+        "^channel-[0-19]$":
+          properties:
+            azoteq,ref-select: false
+
+          patternProperties:
+            "^event-(prox|touch)$":
+              properties:
+                azoteq,gpio-select: false
+
+        "^slider-[0-1]$": false
+
+        "^gpio-[0-2]$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: azoteq,iqs7222a
+
+    then:
+      patternProperties:
+        "^channel-[0-19]$":
+          patternProperties:
+            "^event-(prox|touch)$":
+              properties:
+                azoteq,gpio-select:
+                  maxItems: 1
+                  items:
+                    maximum: 0
+
+        "^slider-[0-1]$":
+          properties:
+            azoteq,slider-size:
+              multipleOf: 16
+              maximum: 4080
+
+            azoteq,top-speed:
+              multipleOf: 4
+              maximum: 1020
+
+    else:
+      patternProperties:
+        "^channel-[0-19]$":
+          properties:
+            azoteq,ulp-allow: false
+
+        "^slider-[0-1]$":
+          patternProperties:
+            "^event-(press|tap|(swipe|flick)-(pos|neg))$":
+              properties:
+                azoteq,gesture-max-ms: false
+
+                azoteq,gesture-min-ms: false
+
+                azoteq,gesture-dist: false
+
+                azoteq,gpio-select: false
+
+required:
+  - compatible
+  - reg
+  - irq-gpios
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/input/input.h>
+
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            iqs7222a@44 {
+                    compatible = "azoteq,iqs7222a";
+                    reg = <0x44>;
+                    irq-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+                    azoteq,lta-beta-lp = <7>;
+                    azoteq,lta-beta-np = <8>;
+                    azoteq,counts-beta-lp = <2>;
+                    azoteq,counts-beta-np = <3>;
+                    azoteq,lta-fast-beta-lp = <3>;
+                    azoteq,lta-fast-beta-np = <4>;
+
+                    cycle-0 {
+                            azoteq,conv-period = <5>;
+                            azoteq,conv-frac = <127>;
+                            azoteq,tx-enable = <1>, <2>, <4>, <5>;
+                            azoteq,dead-time-enable;
+                            azoteq,sense-mode = <2>;
+                    };
+
+                    cycle-1 {
+                            azoteq,conv-period = <5>;
+                            azoteq,conv-frac = <127>;
+                            azoteq,tx-enable = <5>;
+                            azoteq,dead-time-enable;
+                            azoteq,sense-mode = <2>;
+                    };
+
+                    cycle-2 {
+                            azoteq,conv-period = <5>;
+                            azoteq,conv-frac = <127>;
+                            azoteq,tx-enable = <4>;
+                            azoteq,dead-time-enable;
+                            azoteq,sense-mode = <2>;
+                    };
+
+                    cycle-3 {
+                            azoteq,conv-period = <5>;
+                            azoteq,conv-frac = <127>;
+                            azoteq,tx-enable = <2>;
+                            azoteq,dead-time-enable;
+                            azoteq,sense-mode = <2>;
+                    };
+
+                    cycle-4 {
+                            azoteq,conv-period = <5>;
+                            azoteq,conv-frac = <127>;
+                            azoteq,tx-enable = <1>;
+                            azoteq,dead-time-enable;
+                            azoteq,sense-mode = <2>;
+                    };
+
+                    cycle-5 {
+                            azoteq,conv-period = <2>;
+                            azoteq,conv-frac = <0>;
+                    };
+
+                    cycle-6 {
+                            azoteq,conv-period = <2>;
+                            azoteq,conv-frac = <0>;
+                    };
+
+                    channel-0 {
+                            azoteq,ulp-allow;
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <3>;
+                            azoteq,ati-target = <800>;
+                            azoteq,ati-base = <208>;
+                            azoteq,ati-mode = <5>;
+                    };
+
+                    channel-1 {
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <3>;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <208>;
+                            azoteq,ati-mode = <5>;
+                    };
+
+                    channel-2 {
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <3>;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <208>;
+                            azoteq,ati-mode = <5>;
+                    };
+
+                    channel-3 {
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <3>;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <208>;
+                            azoteq,ati-mode = <5>;
+                    };
+
+                    channel-4 {
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <3>;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <208>;
+                            azoteq,ati-mode = <5>;
+                    };
+
+                    channel-5 {
+                            azoteq,ulp-allow;
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <6>;
+                            azoteq,ati-target = <800>;
+                            azoteq,ati-base = <144>;
+                            azoteq,ati-mode = <5>;
+                    };
+
+                    channel-6 {
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <6>;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <160>;
+                            azoteq,ati-mode = <5>;
+
+                            event-touch {
+                                    linux,code = <KEY_MUTE>;
+                            };
+                    };
+
+                    channel-7 {
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <6>;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <160>;
+                            azoteq,ati-mode = <5>;
+
+                            event-touch {
+                                    linux,code = <KEY_VOLUMEDOWN>;
+                            };
+                    };
+
+                    channel-8 {
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <6>;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <160>;
+                            azoteq,ati-mode = <5>;
+
+                            event-touch {
+                                    linux,code = <KEY_VOLUMEUP>;
+                            };
+                    };
+
+                    channel-9 {
+                            azoteq,global-halt;
+                            azoteq,invert-enable;
+                            azoteq,rx-enable = <6>;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <160>;
+                            azoteq,ati-mode = <5>;
+
+                            event-touch {
+                                    linux,code = <KEY_POWER>;
+                            };
+                    };
+
+                    channel-10 {
+                            azoteq,ulp-allow;
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <112>;
+
+                            event-touch {
+                                    linux,code = <SW_LID>;
+                                    linux,input-type = <EV_SW>;
+                            };
+                    };
+
+                    channel-11 {
+                            azoteq,ati-target = <496>;
+                            azoteq,ati-base = <112>;
+                    };
+
+                    slider-0 {
+                            azoteq,channel-select = <1>, <2>, <3>, <4>;
+                            azoteq,slider-size = <4080>;
+                            azoteq,upper-cal = <50>;
+                            azoteq,lower-cal = <30>;
+                            azoteq,top-speed = <200>;
+                            azoteq,bottom-speed = <1>;
+                            azoteq,bottom-beta = <3>;
+
+                            event-tap {
+                                    linux,code = <KEY_PLAYPAUSE>;
+                                    azoteq,gesture-max-ms = <600>;
+                                    azoteq,gesture-min-ms = <24>;
+                            };
+
+                            event-flick-pos {
+                                    linux,code = <KEY_NEXTSONG>;
+                                    azoteq,gesture-max-ms = <600>;
+                                    azoteq,gesture-dist = <816>;
+                            };
+
+                            event-flick-neg {
+                                    linux,code = <KEY_PREVIOUSSONG>;
+                            };
+                    };
+            };
+    };
+
+...
-- 
2.25.1

