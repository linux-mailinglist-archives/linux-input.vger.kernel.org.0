Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF7A49C1BA
	for <lists+linux-input@lfdr.de>; Wed, 26 Jan 2022 04:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbiAZDIG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jan 2022 22:08:06 -0500
Received: from mail-bn1nam07on2079.outbound.protection.outlook.com ([40.107.212.79]:20174
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230099AbiAZDIF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jan 2022 22:08:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ckq2HRxM9UNoJ2h61VACxQpmK8J9AGrrAEwZUfdetxahRr72aPAv87npg8zMH/vvYman6M4tSsuiBKOMv8y7JBPZt6FfD/V8icd5Ik3x+LnICl+VioGSU5sPZUrJ0w7WJtc95XEsLp3fU5QXH/Q4QD8txFHG3eDengDzmi5y+61Idg3+5nwXMSejjwKE3zfCcS3lnGcKbMNKMgIYVCw0KP8oNxSyb0PHzrMSG+iLJ67pgmAcNBAYaQJjQr6dX/f6tPOv6laQw/oHAEb0espCGPbKz3kZ6RXe9/YHR2omDy6RBXk5d6bLRD9mftxCPGOjiG9J7KkBeTxP/RNCpnP5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abh6dlfnBL35Tv0++sDBotesjwlx4QesPtiOscgSpNw=;
 b=ELrnc6qPCR8v2Ziw5AuNwh1KrTnOog0NjYnnrZSE++vd3Bb1nt55tpdaEC2kyWF6yVJCQaWvmpf+ttUB7vW2TEj2mQiMPJPLmwmylYWLBH1EqNnroaUj7GbfWIYKHgUvSdGlurEPE8ruknlup8UHdWKPDMP8M15yLfmluhIFQiNTueHzVNd8CuXO4Rzi38eb5HFb0NvyTbzhf01PH6odTeh6aR3e+moT3G/faM4ZZ2QZhlYXn8OuxNSbj5rxVcMKfl6MbVnyOX02fxl6e4OuG6a1KdY0PxLDxyd3/5PLq9I+zI1MgZVB1W17FPCSSpOvSfqaAneXSfRwgxdXt6yTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abh6dlfnBL35Tv0++sDBotesjwlx4QesPtiOscgSpNw=;
 b=A3BTxtD2HpAS1pkeNgB1jRux+nx++jJlXyMNvfZsInrlB0PdFKFVPjbybIjdw3vv3CN9+Tsi+5ZzTz8ouT+en1RtZLSW9Qh7M0DgCRVhaMX5PztDrDfafv3MAkmQRkhEGUJeXkxAjvi/EFxFvOk4l1qQWok+Jr9mUrjyZgXTjX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by DM6PR08MB4585.namprd08.prod.outlook.com (2603:10b6:5:fe::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 26 Jan
 2022 03:08:03 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba%5]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 03:08:03 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C
Date:   Tue, 25 Jan 2022 21:07:22 -0600
Message-Id: <20220126030723.223809-2-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126030723.223809-1-jeff@labundy.com>
References: <20220126030723.223809-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0066.namprd04.prod.outlook.com
 (2603:10b6:806:121::11) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bf6ac30-d2a4-4ad9-544a-08d9e0791139
X-MS-TrafficTypeDiagnostic: DM6PR08MB4585:EE_
X-Microsoft-Antispam-PRVS: <DM6PR08MB45855A2F945253C516D18481D3209@DM6PR08MB4585.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6+VduZ4wvJyLib4dGlUDlUU7PvH5rydUVSfhAFkfglx9gg4+f3eSAdJw7JY1AtDpwYVWw1aWKHqgQKYHr4hOp3hhG+yUQXBOge8pFSksYlQKGEc2X9horYhp0IqSuxHtcE29+XCLs0L9Y8pDKo4LNGHUjhg6G+n2kAnbJiQtEPvbYw9dfr1OtCLe//9TGSNbmLp2P4PXCh2L9PRYnYKqSEDQO9mxkFMWFmWbb3hknQWXVexEgz4eBDa9yTNCule6Es/SaWADGmqsAfQiCXsG+gAq2pWFpH01I0kGLYAtEDK35zp2uG855Oi8wtYiW9Tdvc8vhmmhkdCx2V8RK2/Wk94uvR/DbHTSS3m9KvxzelzxL6hF5J3LHKsdYiDxgaSGScpl7HkdI0R5/6l9hBS/Lr1oeXsKGrmQWYhAEfJfksFps4aVyC+98K36zGaY9VY2BC/B5JD0fdOqvoOfJ2mn3aYPIkh36LcIkSbHqZERk7j5ttWWwIrMyUcbALdC97QduuL1+bV6jgU5ZuxW9jViDAA42X4Mr22EFnh6uIgDOHsd0/6WtDjRNNv+todF3+dsTiwfrm3w4nAXL4az14y08Fyty5Iihx890PdSu9fsmPstlebT2r7li+d46bwwvCtbCUyGE4ptAP4hWjc4hZnyZ6+xnlSHLPgGY6JucDyrt3VwGPcPHZNxiPTtSz22B27atEqRWAAnquuapbbYcUfWwum8VKzmH/AGoe4MW9Fwab86OHaZ7iYN/8VLXH5BeQpBYZPJi4De1n0WCGYIwKfMAuFwb+jucS1906HzdM/NuHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(136003)(366004)(39830400003)(8676002)(66946007)(6506007)(66556008)(38100700002)(107886003)(66476007)(38350700002)(6666004)(6486002)(26005)(4326008)(5660300002)(8936002)(1076003)(2906002)(83380400001)(30864003)(2616005)(316002)(6512007)(508600001)(36756003)(52116002)(186003)(86362001)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c4Zzt37FaJ/LUujwSZOIiHMER3U4DlGA04dGplA7AOdMPLf24N2vAls8c4XF?=
 =?us-ascii?Q?gsBUFn0kZdCuPb6FTRdo5rDxktA8p9Fg2PZfWYrO+pgonHqa1OqKnYQRrycn?=
 =?us-ascii?Q?xYIWWrCcj8TLLCbMvqf5LD6xEr/oxNcDVerOWyZux6uilZUVVaXUiFGC/nvv?=
 =?us-ascii?Q?oyjbMxqmhCaTgLlodG8uT5XaQOrLNlbsR5ewf4TO89d7D1BthnXWSEEhQpUq?=
 =?us-ascii?Q?aMjkfNClsKGahck5n9a+3R6H9QH2XRvlVfXUtyow2DnPBYwFs/Iu4VNoQFXL?=
 =?us-ascii?Q?x6EBM4DRo6UcZ6DxzM7tFm91fJALReLNqlw7GfG6AF1klwIM2Bq3es/BCYge?=
 =?us-ascii?Q?es+Eb+xJi1NOhWUyZ2TBDLjeAQOz/iJ+Su6UqbTibAnAqIHUYPDL+9VcBH/B?=
 =?us-ascii?Q?BGzEMTrSi1+u9xRudHoedA3qB5L5RyfTOfFQqy2mJlxImHVMX4tlRUVibV5L?=
 =?us-ascii?Q?Z33AicjGxHGqW1bHVznHWgwzCZ5S7xPfraB+5XKhpflWGbiWBafoNQsEtD+o?=
 =?us-ascii?Q?pEw6PRbRn0WGHIgBMxnnV2raIEjB6etbzaT2hWYOtMmr6gATVrBO/QE3V5nY?=
 =?us-ascii?Q?lfG+Ol2RGqNyj3JqvS29wgC3uylXUYH+C+YpIPyiyNx7LlqnnAy0Kp6Hcuz2?=
 =?us-ascii?Q?T1p0qGfShZhAe3YnFs1hv8SWJubpIMbOPHB9++c9t6lZ2BoosnDePXgFFlMJ?=
 =?us-ascii?Q?D4QsN8fCbM+VevkQANF3L24cejB5K9vHenYeVgkHZZMHNATqeWeSH7IkrVyL?=
 =?us-ascii?Q?TIvfFun7B/WCazyKfD9dMTE+pEnG29Ksod9/XVf6oYrXkEC0d/0Wq+HQp/vl?=
 =?us-ascii?Q?JnAC9FduCOVYZVwmZdobvQ4B4AI5wmoxjpSSrqxM7tEy9O6Rie0A/sINeVqU?=
 =?us-ascii?Q?bcwBVZpQibodPLAQtrWsL3NULtS0iNBEeFsL3atRU8PhmxKt5tAB4Vq6Nnio?=
 =?us-ascii?Q?shrbgFMQGhwtDi2UUqXHeFMg1JzcKppJtMh+bPfh/0HIc7QoDNN/1febpend?=
 =?us-ascii?Q?J8CNknDKlNecf1l8nYdJ3UJ5oHcx8EIpoBORz8EbiJi4LLz1CFg9O0UweZFS?=
 =?us-ascii?Q?uLylvzaL51eTo2HJ+/VlOpN2UpR+iD6GktAoUzFGPazCEvOUD7NOOyXqCsSY?=
 =?us-ascii?Q?GVJZo0+/vp7lqeZy+u9lyT3Kjr/0i01PFivd5fxxTM9Th9l0NvZj+mzSd+iq?=
 =?us-ascii?Q?9Qs8lK52zMNk2uJEilUG5hB+9ocsFp4ZdwHY5NBkbsG+J8po5RIhL+wQ1q8B?=
 =?us-ascii?Q?PKdAFDv5geqdelJXd2ZRCFwLqbu34zhWBVad9WC/2/fkD9r9erqwoeDqoqjp?=
 =?us-ascii?Q?R9Eh8CZzlCpA0g3c53CNSJNg23dLY6+IoZW5xN+fRrbXdmPTo6bM8VXvaK8e?=
 =?us-ascii?Q?wC75siu7bi+/I7GmyX4CSywjNQjPeUywGadmE5cGnWoTUvv+dmdHsqol4dul?=
 =?us-ascii?Q?6wFEF5xYrVLkH98jylnF5IIsFZkWV08jWypt1QEsfPuAtqYtPHh3xl9BmbA4?=
 =?us-ascii?Q?Hro2AmCuHXhP2jOmzSbfpXx2jPvMdW4DGn9rzoKTNYST1qQPuN5JVHQK1ocg?=
 =?us-ascii?Q?myap31qgMLWXonfkB1cfjrIZWZtIQ0uBl6AAlszL9mg/8+rrBCamrULLrsi9?=
 =?us-ascii?Q?Ghh/0hzFKN2rx/LJv8YH/js=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf6ac30-d2a4-4ad9-544a-08d9e0791139
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 03:08:03.5676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRIHWdoZsVI6I+b1drdVC/4s8Qd91RqxJNAEhj6E6OlXpGSXl3a7Hjd1C3tvGsRTO4rueAaNpLYAJaV+f3EQeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4585
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for the Azoteq IQS7222A/B/C family of
capacitive touch controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Renamed binding to include vendor prefix
 - Corrected error in channel node name regex
 - Removed superfluous '#address-cells' and '#size-cells' properties
 - Added more detail to 'azoteq,max-counts' property

 .../bindings/input/azoteq,iqs7222.yaml        | 960 ++++++++++++++++++
 1 file changed, 960 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
new file mode 100644
index 000000000000..a3a1e5a65306
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -0,0 +1,960 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/azoteq,iqs7222.yaml#
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
+  azoteq,rf-filt-enable:
+    type: boolean
+    description: Enables the device's internal RF filter.
+
+  azoteq,max-counts:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    description: |
+      Specifies the maximum number of conversion periods (counts) that can be
+      reported as follows:
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
+  "^channel-([0-9]|1[0-9])$":
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
+        "^channel-([0-9]|1[0-9])$":
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
+        "^channel-([0-9]|1[0-9])$":
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
+        "^channel-([0-9]|1[0-9])$":
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

