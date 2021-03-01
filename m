Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70DB532A57E
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350754AbhCBMsC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:48:02 -0500
Received: from mail-mw2nam10on2042.outbound.protection.outlook.com ([40.107.94.42]:2017
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347096AbhCAXvz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 18:51:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQJaLj2aBacG5JCTgT4AdQzhmETMcD8i7pxzoanIxqZuGtNbB44+Q/Gl5o4VmAq7SmisSrxBX0fpvAtmiDPXwWFeb7mKIZ4SAsvM0T3+DgTxVXyO7QVsphGOdPUcr/AEJBIT/DNikbK4JQkfK5f2+oBV7fSHrh8eJS/ECxcoXcc6pTjNVd0FDp4W5qZ1hRucM87tDRNBfpFUhMlvB7tMsCfJ0JEe9U1veY72M5c4d5SfiA/duK3OnXlc7pqIi8DzuCVi9PUd8gH5Leb4ALBQ5fBobmuz6Y18fEmt/+jRteiR9uAWDTOHQ3PvkivafPp59hYuWCkCm3AAzBqs4VKoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibI5W9lx56dkWak8pV698+RjdyS2K0kAYtqf3qMpKwQ=;
 b=AWUtA7bVSVKrWIvIwYLnX0AbEN0qCv9jypGep4r0WYm76kiJN0IL+63SF8eFg/0Zf+q/0eit5B3rFCOnG8imP1NITbrX3G4nWrD7AFRYNJ3npG2pLhBpSCUjPSZXxOgJjKFaB6E/QnP8a6BXouVxcLRfniIKlxz2k3qKyR9LQLxMGAYkSM5LEQz6dck+95KBdY1MkHgj/OcM3vTkqvOBFQSSQWYBHP8xxuETWh65akbUBcoELmcd/iirUqku4qjCCv6y26tirqsrtMgQCEFF+AkB/iFXv5i//vN7e65OyIET4OOyEIPbVVe/JhwKKo4VFqYNL+PYPp05xxBkxWA0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibI5W9lx56dkWak8pV698+RjdyS2K0kAYtqf3qMpKwQ=;
 b=CTp03VtsYxP1h2ntUolBQ5IbsX9v4iRvEflmh96MOlOUjSZ91dqD45+ZImknxc/5xGxtiqOqmAjhP3O/UxyL1PyT9R4Rd/C2g+Z+b9NWi+o4jGOl4GnfgbrJpSco9DCu2rLEFocBx1FLJJyDyita8e9CT4Xa7mSjOudC2qMAniU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5629.namprd08.prod.outlook.com (2603:10b6:805:100::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 23:50:24 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 23:50:23 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v3 3/4] dt-bindings: input: Add bindings for Azoteq IQS626A
Date:   Mon,  1 Mar 2021 17:49:27 -0600
Message-Id: <20210301234928.4298-4-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210301234928.4298-1-jeff@labundy.com>
References: <20210301234928.4298-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA0PR11CA0110.namprd11.prod.outlook.com
 (2603:10b6:806:d1::25) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA0PR11CA0110.namprd11.prod.outlook.com (2603:10b6:806:d1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 23:50:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 270202d3-9e07-49ff-90e1-08d8dd0cc7f3
X-MS-TrafficTypeDiagnostic: SN6PR08MB5629:
X-MS-Exchange-MinimumUrlDomainAge: devicetree.org#4160
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB562996CC891C08840554766ED39A9@SN6PR08MB5629.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfrq15vtvW9OKsbYYCXNIU4bp/OKC7saFlwG5DiEAisviyr1L+eZwY+tAHmRqt0+si4n9c6PZCnDlzgT2reaUoYXq5EQ29EvJpQU43P0plAaWA69pSepEZFbAZ/EmpxRQwzJ7Yf2J9VygHpnDEkhSAeFqzjQHTB8/N8Y6zvCLU7lx5cfOJEt9Zpy6Pnpjm4InHtr4gtKXlDF0odb0IlbyWlLjc8hnaGpY8o5lg8B/M255NP/pHwI998ZfxWL7MobCOkamg1rIvqnyUuQ/w7EkAImiMCT3avzuWYMz6MyC/lSgTXheiZ5xBP6QzyheuGZ2z7c+2Pgo0MUYCaNPDjzZvsytZIFSny6jwaKc9DJ4eIO/4OpT+SI1uLVMEOGhdRu0xxzKP8kEMVTkz5ky+2WNz2PAWV8/9zQIuLcIkTuHThrzbaeDByaVWyDJ/80GFXak0rQHG6QFWG/noyhifMHMAql6nSrR6ov9wKJ8fjMsuNPDxD465axReH+fXRcZIqlWjogfYGuQHo8VfQVGSftaEWr5E61O6x+aI2gpZ/YDoLRVLqJA3V6w1MbXk7O2JZNk85gT19ANX3pndWM5QcC4tZ9XyxKiGtxpgLx0wIwjT6Un+Nk3ly66f1ezyfDeAK743CONZMdIIdREtLrHjKngw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(396003)(39830400003)(366004)(36756003)(8676002)(107886003)(69590400012)(83380400001)(478600001)(86362001)(8936002)(5660300002)(6512007)(966005)(66476007)(2616005)(30864003)(66556008)(956004)(186003)(26005)(4326008)(6506007)(6486002)(16526019)(2906002)(52116002)(66946007)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z+XnnMB8yOuRzUaMcI3KZmi9M3GfOkBpFVwvn3HggDl/pwcfqqFOqpHHdFbG?=
 =?us-ascii?Q?dpD40xukr2AHYSwqqwqEQKTNYCWUEU/jQx8EUg5j1q3uoYsCY0NdPevTK3wU?=
 =?us-ascii?Q?sJukdKhzh6ssSU2qL6ocrd1RnnHCOyskiNi3+2pO3TW3XrVUbE33clMRWMQT?=
 =?us-ascii?Q?zokONIMftuD+L1lX8bit6/M+t4tFxMk08BsImLeB+ihPaIo9NCxOFrcv/FWL?=
 =?us-ascii?Q?BcGWOgNmJffDBii62MHQvCPKI0xJ2CprzriDB5KT51fA/ektUCm7LKCa98G1?=
 =?us-ascii?Q?5Z2PcTlszWcm38Nm74XPb7kPRMHiqp4g8SL2843ZuJDvVDiMWitj9b+1UNMr?=
 =?us-ascii?Q?ZGNPyBJmzfszfVeRHhkTRkRASonr7pGpMK6Ot81tI3pr4jLtrnax3axhiwzL?=
 =?us-ascii?Q?Re5VXPHf/O08lf4hIWeZjJQoHOciw22riQGO1iDoPKbwZe4RO335xNEWZype?=
 =?us-ascii?Q?EBrLbQF5h9fwaBMtZB87sp18Czm68M6me0rasUg3nIw6qjTyc7DBw2kun3yT?=
 =?us-ascii?Q?Ah7gXnr98YdXNFTXYqAnfJnKB2FGijXh9N5xzVp71yofci2kwkeSe2Ox5X2u?=
 =?us-ascii?Q?EKGdsOlVHDwcpJbAlEoA7a9uNcC/Qn58t5Hhb0a4PlL6pNEvgSqH/3nuxP+F?=
 =?us-ascii?Q?EAyKcMd3BGX35alK2baQV/u0/7+kslpps38GDx67Y2bLN8XzBPSTGTbkuXK/?=
 =?us-ascii?Q?YZhsZ/BrJE3Tn4vO6GGWzrJuqRuJopAAhCYrdx6zyohKWUU1WpwmopEU1RPB?=
 =?us-ascii?Q?0mHkXfamkQAk67W+U4B4csApBI1zgtjaWGPsL03lo0qm4H/cFLF58rBwMLg3?=
 =?us-ascii?Q?zMhHC0AMJLmUFLloZRNf5xH8bvozdrHV2PFTydSTXMBVgvN2N7lKYe16ZBql?=
 =?us-ascii?Q?uYx7/dTG94vpbJCWfbSXEmi84xfe8of26aGj6BaQFudeT3S8S0c6TJYuCbRN?=
 =?us-ascii?Q?WzIJFWzoIfpqpIOgvYqG8LdS3X8KO4A9CW2VqPf0nhcNF3lH+f5ochoJTjYF?=
 =?us-ascii?Q?nZHlA8VkiMat8cOSd7RExJbH2CW0GIHWvz9CRNp2F5xI83YQ3jWC4A+Htez2?=
 =?us-ascii?Q?xOffNWGmvPw+SNNMGWkvCI0bTjjI2MrWdZfmYHclxwxx3emdqbmXZ4mvcgUg?=
 =?us-ascii?Q?4QndgI1DzTQW0Krq+0a9A/SVzmJghxbHnbdoprcjoTvsryekh4eH/Mh+aIv4?=
 =?us-ascii?Q?IU0g6k01HFRIAyALkN2gxW0mpfEfUeeoEjsAv/YHGquEujgJIb5FVEor26+S?=
 =?us-ascii?Q?+V6gIN2Hh11DiKk8iontGj0v+lUGiGrVUYnjjpJ5SfFwkOJLPzCRnWPH/Pu9?=
 =?us-ascii?Q?cCt0L0yPPzeB7V6XSnjS6Wnn?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270202d3-9e07-49ff-90e1-08d8dd0cc7f3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 23:50:23.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ijrj95o0Oz0c+gSmwy+DyTX85R2KqTayE2CPzdXk0/zhj04rRqgLaxa1Xi257m0+fXxHv/WCphB6c+DP9WnWFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5629
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds device tree bindings for the Azoteq IQS626A
capacitive touch controller.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
 - Updated path to touchscreen.yaml
 - Added Reviewed-by trailer

Changes in v2:
 - Added missing $ref to touchscreen.yaml

 .../devicetree/bindings/input/iqs626a.yaml    | 843 ++++++++++++++++++
 1 file changed, 843 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml

diff --git a/Documentation/devicetree/bindings/input/iqs626a.yaml b/Documentation/devicetree/bindings/input/iqs626a.yaml
new file mode 100644
index 000000000000..0cb736c541c9
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
+  - $ref: touchscreen/touchscreen.yaml#
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
2.17.1

