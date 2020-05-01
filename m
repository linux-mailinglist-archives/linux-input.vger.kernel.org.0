Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643E71C1B43
	for <lists+linux-input@lfdr.de>; Fri,  1 May 2020 19:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729025AbgEARKK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 May 2020 13:10:10 -0400
Received: from mail-dm6nam10on2059.outbound.protection.outlook.com ([40.107.93.59]:6184
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728495AbgEARKJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 1 May 2020 13:10:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4ec8/rx7u4Wi7VBkz6alOcai4lp2jz0qRDnF5b0S9IWyCxKUY5fpAwTe2hYL5ddheCOPP5gaFD4JzkYtdwrUNYkEkKtd6rhwhiKkp8WaU0wW6SQziR969HGyhdePdZ9VsTGpErSLIe3EahEymq+MqFWRBUWXHsHIlXGHgRAXQqj4/nmvmUEZp/BEd4NtgMKdXoFjdTiIa7n//d7TnTkUnZncAkIQOOyy1RIJ0nCgOqZbTirBTg0iDzzzgwU7FFpEFN04zfsXUCyDtt0imnSTjrJu/mB+DVm1C/AbgSYt81mLPvUbNlYB/WWGQdqonuBWycBeDmSIeBmLBe39cuVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eljLH7YjcJPN7w7nUtMmjUEIoEkVw3gF2qiCfHY/R0=;
 b=Gfnv4zBSDpnloeTgQOCkPD9i1XDnHtmpdVsR93YwgOdb+pgzy4lO1vJZ8aGBhU3FLkntYPAeni/6jlA43gv5Qpi/80A9yX/ifPXN5+J6UT5K2to8u3NlCVezi46hgPUmTbGvmUTsz999POcEbtIj983Q8ExIdfEsFFtQmu/7QK8zd7BLfGfL/j5BHYfNJz3f7vFUEpbI8pGjqgOsCNYctaLvguYsxHNZ9m5Ea5+EnSBnAa//aY4DUBJoK1kro4ZwdM/XIO62BEAzlxzjdDxAjbRgy5+Z8XSPwuMi+yqwmtjq0bejEhHGFW3j7fJbRICfFEl26Fbvo6FG9NP/M6BwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eljLH7YjcJPN7w7nUtMmjUEIoEkVw3gF2qiCfHY/R0=;
 b=tixYDv21NQvIImkZWwJBzH8Y80AJzY7rsjq/T4swbaILhpKP7/LBcMO7t8e649VBKW4x9xWrCDzDsAVGGwe7NcyK2Em17nxvV/cF/yaAOuVQB280fXCLilvgLzNjQ4D1kIEQCWEOoSoBp8FLZck+O/4Fn7ZlfjNZ5eVuFYGj+ew=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4431.namprd08.prod.outlook.com (2603:10b6:805:36::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Fri, 1 May
 2020 17:10:02 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823%7]) with mapi id 15.20.2937.023; Fri, 1 May 2020
 17:10:02 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq IQS269A
Date:   Fri,  1 May 2020 12:09:41 -0500
Message-Id: <1588352982-5117-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: DM3PR12CA0053.namprd12.prod.outlook.com
 (2603:10b6:0:56::21) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by DM3PR12CA0053.namprd12.prod.outlook.com (2603:10b6:0:56::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.27 via Frontend Transport; Fri, 1 May 2020 17:10:01 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfa89210-361d-47a4-a1ee-08d7edf27c76
X-MS-TrafficTypeDiagnostic: SN6PR08MB4431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4431820F2059AFEB11B1150BD3AB0@SN6PR08MB4431.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UpibRVU60o5mPuJdBemLZ+fNycRQQ07fMjCm1ykCDO9K6GvsGAn8DqQmDHACpmEsaVlIHhPbpriCrL11OgwC7Ht1bxrVW5bFLkm2iBkvTzghoQ+lo2KVNJGO+h2H8LUwjuhXGhVJYgry9WRGMQ2bwm1pIGppzJWOsjEGzDdkHxOE+IsxXql/E8uGZu/6XMNyDUHH7NaRSCbk/tOeV/Vrrbc4I7NK4JzZZa7Uj3Ohr75UIMQwONojlEf7NhZ1t32tkgG6is1+o9RiaCzTuQfG6ush3ecIplKpFK184SoUpn/62OyiFO06WbProzJlbVEi0fJPLn3J0BCrxC354IbYbo+21aiyHf2/0q1r+SnBm1bR+fKSPYRB3nBd+DtNkv35S3B0NnDzDU1gVhupwaN3WUYjeGo2bnTBU8eT34uf5OA2yiqFg3SVdFDnIJPefg2CeKhotwsEfZ/VIkSqebuL7mp4LZmTyhsBX5mHxeuH8BWGX8WEYK1p1itPTownBRAeTWt0ytQltKYqADNQvbDJE4dqx5NlbmDroNWHNwO1vSQrW0ezLRZ7UDcVxQbXuF/rTBcFxSX+4pVw9lNLAipKGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(136003)(346002)(366004)(39830400003)(966005)(107886003)(4326008)(6486002)(30864003)(956004)(2616005)(5660300002)(316002)(6666004)(36756003)(66476007)(66556008)(66946007)(508600001)(6512007)(86362001)(69590400007)(16526019)(52116002)(2906002)(6506007)(8936002)(186003)(8676002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0bS3z9FpwApGLDNyY8NQaDmgT9P+kmof1eEsDstfko5/6soyxXb+6DpP9/izJbQfyF3IYKu21emZAB2C3P1xVXhHH9+/RGBj++j+Lxl8KArt8hO8KTTnk8ZE+jTzCkH7PWJ+SceEhmYvXwujNH2oAlMAvqMgQKbFptCkPjB3E9rrG4V7kzLefok/NwOit1a7E4oR1QI2W2w4zdD30ND/O/6H0lK2E/OZhBjNKZExf4yKWurGYEplT7HaDfEKXN5uteCtZ82vzsTsbgqC6n5bN8JxH3g5TNXxv/4wuIhq77KHm4g6cTDpxdCp6AFkoaOi1TjusCNC56C82sIzN/oBwxtvb61WQL7sLK5vZz735n/r+PAZlEbHiaLX0NeF61iiLUI4Lf0AhUMRy5SDm8EV95NuoqZYo1xMRqVp+OrNz9gE89wN176p8WYOszZPMj+5AsJRLSkv0mnUIvliVdKCDG5iYzpewaWRDW8Xb+0w7A4wCCr7OOBSrYi7wfztUEWptncjW1tn7p3gL0cA2Z+RunqaotmGapTvnQY9Hj9uO84k53+XQxpSs+OT6ECj/wuaFGvgUHD1Epu6qI5SGt/ErUHxz9Ld8/gnh7j/KSJTSNX49/U5JzmJ3QLSOgGxvWcWDQ2SfJlJYWG3y0cc7m/MRE8l/6HmvV3IEz1UlEcMvT0kEwmRgubf8GqgmpJilx2bz7jEEPCChe7jn/Qv/sh2sSc+ORjQxavYWle6frKjL+HhyFQEmuzdfj8JBzt1ws8v86Hg5qiJHzKoL1ZtTJAneWnHIvqrrpnEJC7zD4AlP6I=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa89210-361d-47a4-a1ee-08d7edf27c76
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 17:10:02.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URrL2NDNbtqtG30+N0shce+NeJkYKgKFLz3mdqveLlJkrJdBMb26WrThPqFob3N/dFoaHYfkUyvEZnVMhWLIzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4431
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds device tree bindings for the Azoteq IQS269A
capacitive touch controller.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
  - Removed '$ref' and 'allOf' from properties with a unit suffix

 .../devicetree/bindings/input/iqs269a.yaml         | 581 +++++++++++++++++++++
 1 file changed, 581 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/iqs269a.yaml

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
new file mode 100644
index 0000000..f0242bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -0,0 +1,581 @@
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
+    minimum: 0
+    maximum: 255
+    default: 16
+    description: Specifies the report rate (in ms) during normal-power mode.
+
+  azoteq,rate-lp-ms:
+    minimum: 0
+    maximum: 255
+    default: 160
+    description: Specifies the report rate (in ms) during low-power mode.
+
+  azoteq,rate-ulp-ms:
+    multipleOf: 16
+    minimum: 0
+    maximum: 4080
+    default: 160
+    description: Specifies the report rate (in ms) during ultra-low-power mode.
+
+  azoteq,timeout-pwr-ms:
+    multipleOf: 512
+    minimum: 0
+    maximum: 130560
+    default: 2560
+    description:
+      Specifies the length of time (in ms) to wait for an event during normal-
+      power mode before transitioning to low-power mode.
+
+  azoteq,timeout-lta-ms:
+    multipleOf: 512
+    minimum: 0
+    maximum: 130560
+    default: 32768
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

