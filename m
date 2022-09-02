Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8695AB442
	for <lists+linux-input@lfdr.de>; Fri,  2 Sep 2022 16:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236280AbiIBOwJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Sep 2022 10:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236380AbiIBOvl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Sep 2022 10:51:41 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA3814D1A;
        Fri,  2 Sep 2022 07:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaxfC4QaAG+6Td4yglTlHx8pEaukoGRX4nNvvG9TVgKhgrpZf9B7KaH8sqcE+mXdBPQO9pOPXk/CA5ro1jo/HEdSGytJVm07tw/LVfHnzhSZT2lDnn/sUOnU3pEZYM4NuYs610cy9X6bT/CQBvPVrGPWaM08aPppxQWrCYf+Y56tZLOC3jUzAccjoD2wv5ybQwLkWe+24wOH5hfD8VIVx5TOujuFlNLapbcs3KPYmaI+MyGKAyikJcxaSJTRPGx4gUJycb9aEM1Izk+ALFndPMGCPuXlLURrYFhgZgFDpvCs7ovDHOWcaCS2N5oQD8cdrdicpyAKy1hJjHRwLK1Drg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdKkR+P+v63l8mWfeai9eU4TC6Qts4HonF0UNiaaCLs=;
 b=lspBwWyUql91R6rlzsta2KULTia/P/fJ2MCf2lQvds23ctourAj0lbBLROShtadWhZwG/GgESNovh/kE+xYYwgOQ7/qoi901Zq+KXP7OkQCs+P9tqTYzsdtrZJcO0PSwQNqhsX/ixiWbA50DKO6ALvG/zPe2lt8uCfUDWUISMrVazvNKoD/jvEEjkJaCOW17EVwTFtkSJ0hYgSRhonxLRm/kEubmmJuxcd6vRCAoZV7AgQRCoggLlvZ4+OTRhzFMYuJJclnrO8wftbj104+HmCIpi3Md4h7Mzbi7ki45u1iXtzE0P2EiRMGTUTTxD7kCWeS4TcOuQw71sK2lH+7/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdKkR+P+v63l8mWfeai9eU4TC6Qts4HonF0UNiaaCLs=;
 b=rOuxI0uIXf532vSTWnWKwoXnTXA75MpPe5LjCDhRSAZPIqw0emcYJ7LrxDGGhf00Eqzc8iRlMExxGxcGLKHEEoW5zQ8V36HJCWUr6N/Gr91S3wDfvG69Q6WbaOpzF00tgpFZPwSbys8iTwyEgr3vn+aRpGnioKnJP7ApU1iRc9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BY5PR08MB6342.namprd08.prod.outlook.com
 (2603:10b6:a03:1ec::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 14:14:54 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e42f:30e7:7a94:efb5]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e42f:30e7:7a94:efb5%7]) with mapi id 15.20.5588.016; Fri, 2 Sep 2022
 14:14:54 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq IQS7210A/7211A/E
Date:   Fri,  2 Sep 2022 09:14:23 -0500
Message-Id: <20220902141424.90063-2-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902141424.90063-1-jeff@labundy.com>
References: <20220902141424.90063-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:806:d2::26) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcfc87f1-d09b-411c-96a1-08da8ced81be
X-MS-TrafficTypeDiagnostic: BY5PR08MB6342:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ltEeGewpnh92FGNh5rqwSCez8fbBTX147+i5GFWkuRltvS471LTy7P7yE3j/d+G4JN9Em3nX8il5QVwtXmavPpzkXs2QHxiSeirNuVqOUYByIx8XMSC1+XTldBv5kBxnrt1c80nuYgyFhw/NwXgFXz71wNy2x4hRpY3MYKexeErcHr8DFKyl1absg21ZuOw6MnInG5+PpFxzu9G+gnGaevOE0oosrf1ZMRkT4vjrHFJxfSMN1QQa9TmeX2/9wfVXzmeCTxMWhBfJpWReFGYLQrU1ovaspJOlDSCybbKo+9RvTujwkXcn5rqdEhEhEF4zukaHxdyKQG0SldSG1ANGtQ7FjAfhzmAowMZX/nlUqU11jo8+Ugbefckh1opEn4b72jvidfFqg369SToHqFbD1rBcEafnACYWKjm+KHMJoXsCq59K1c5gbTz+liYEr6+BWTtrYRX6W5KhE15hwolpN3PWsjftEzj++yK6tsiFgGIcWovNVSBbw53Gvw+aVItW3L57fccdu//6gp1zQVmOBkhudGZo/SKOxnj6jTXxyBnDB4AHbj5gxVkJ3POfGDzJrzaPWCbiJycqrJt8GE6ac7J1kTrL3R2taLY3wFoyUw/PELb91qg7YpwjGUTI9kjwAeoVy7TFXxgjc7eo6Ch5rUlAmR39kFPnjIaqv1nWlUnSnWAhL65M7cARvUEnZp9N/Kb6sPRtEPcbCwYMsoQQ7Fv/gYPr87K5o6soG9PjJAUsHBbECf1NlGQEuqmBPG2d6WhI6fEJX1dfVnongAnQGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(39830400003)(136003)(346002)(396003)(38100700002)(38350700002)(186003)(4326008)(66946007)(66556008)(66476007)(8676002)(316002)(2906002)(30864003)(5660300002)(8936002)(83380400001)(26005)(52116002)(6512007)(2616005)(86362001)(1076003)(6486002)(966005)(41300700001)(6666004)(6506007)(107886003)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nEE5mlrVLBGfEj38ufbjM101KAAgcDkmOAGJ/7xlEz83jkCsKTX+SqXvXvn3?=
 =?us-ascii?Q?Inhaaac4vTUyviXkINXo2czBhmgxaHGEOVs+cCVO/KUqoKEeR3SQ85B8c04K?=
 =?us-ascii?Q?85IUJSR8SJXXqZdoOi8PtvjRCzyc+oQom5y7PNEGq5Hoe279fN1rwt4mmowj?=
 =?us-ascii?Q?kkG1x/6xYdagWiEf1qdjNB1bRND5mbbFLG5/LguRVXCXQaZQEZdPX4kAcltd?=
 =?us-ascii?Q?zhDVte8CnGeG/1CepCZ7HU41eaFhbzPoqthHwAqayCCX74Dvcu+hhm6VM6yB?=
 =?us-ascii?Q?GPyjZrYFIwX2+6aAQGUuPKiZ2hJL7f2Q0mcqmdZIFyud1uPlo3IiMtqFTJvU?=
 =?us-ascii?Q?vS3M5linjy+TLKEXIDXtV1jE6j87FofFyVEowu9jeWO/vrWF5HcExyAXji32?=
 =?us-ascii?Q?wzkvFFqlpQRKw9xU9V0x8MxVlXzHHurpbIJxttHrCj993D7pPXxBZc9BheZ0?=
 =?us-ascii?Q?llmhQH8ymQGfxd9DNZaUdtRQH46lu4bVB5nfGWyf6D6SbnUyYZFzURFHts6R?=
 =?us-ascii?Q?dC1TAMqLy5zzLgiaF/IFO3I8dar7BOrNXeVas2dZ7tEpd7/6u7Wky/VMFwIj?=
 =?us-ascii?Q?Qhs5sjuMM6sXa0AgzRp8Yce/oLlkj3vjUSeTHVc/cJQA0hrq+TBxf8BCBlXm?=
 =?us-ascii?Q?SbvUfIUXm71p9LxIjR/SR5mKLHfUpQpufHUJ70bK5fnQ1AQkh4JtNVUYm8UI?=
 =?us-ascii?Q?4h93icgBDF79YFoqsn0Ev6/bq3dBfuXlO/UdM4hh77KNirn4DgPEOEfQqd1j?=
 =?us-ascii?Q?/PAsPQVLRlbc0BritjfIDd0bhvFHhlBtN2z9zzfTkKF3SEF/1wXMWhtJYfR8?=
 =?us-ascii?Q?uz3sQQ6pFnWlDWqKeVdLBGREA397L3QrCnegoi0I8G2gMjSc5KLjccRFw1mG?=
 =?us-ascii?Q?MLJY0x/dsNSPYg6IrBCisV/Kt087NM7gniTRed+mVXS8axxxM4uYIcmJ5XK9?=
 =?us-ascii?Q?uuzzjnd9VrBFL/gOnUu6qGNe+z8stfRfTJauYjbaBwsXzHssHDYVJiN+exlM?=
 =?us-ascii?Q?xf+NXMxYgtZLUMRmNGU5RzMPkJh5q0txiuJd3BpT7URhWPa6G8icBf+s5A5N?=
 =?us-ascii?Q?JjeMLDN8F1DraBcs32s764SXP597+N/+sBmb9N8tycq/RAsSzXj+WA8XlNvh?=
 =?us-ascii?Q?CcDFPJ3A8C6FeIFJkgsY5ttK2i0Vph3/NLDx5zl089DnC7HHDW+LfRinSA+L?=
 =?us-ascii?Q?8IneXlBfLTzwinPu2FLJSAMU7FRsIZAne/ru0oQKo2YRPCbgxgO2PiDu8mzG?=
 =?us-ascii?Q?cVsbLl7QjqtHM6DjMYyM4r58d89sRS8xwDuuCTxCRt24VzPq5qtwo2xFPW58?=
 =?us-ascii?Q?cwCfWoc5J2+o/N1x3dv5vQ2GxrsPMeMW/YyeUZMv2E1P8qpj/UjaE5uA+7Mj?=
 =?us-ascii?Q?hR7OUEA4MHxEzbq+EVlZyO2zuDhENbDOviFOjoavuNzO0MO2mLryYgQpIRGc?=
 =?us-ascii?Q?PNqIsqi3aZ3m4YNLxSpsNU4P5nhXwcrEMtnaJsdgHrN1B0mEDemmNz40O2Xf?=
 =?us-ascii?Q?EmsBtN4oFzwWBayBxzsmCT6WDBe+ZxcHo2Xvx9V949y1eL/9Syie/4g90Pip?=
 =?us-ascii?Q?LMRhWBHPar/GUvKBGVZpwwYeTHEqulxFWyyRiyLz?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfc87f1-d09b-411c-96a1-08da8ced81be
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 14:14:53.9485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkPmy4S7tRaZ/Q0bk6fOBdic3a4o0ceEXlcDjgYcsr6AIG5uit5iG1aLXn737i1TArZuSyBn8y/RM2r9VOMhnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6342
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for the Azoteq IQS7210A/7211A/E family of
trackpad/touchscreen controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../input/touchscreen/azoteq,iqs7211.yaml     | 765 ++++++++++++++++++
 1 file changed, 765 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
new file mode 100644
index 000000000000..190bcd9a864f
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
@@ -0,0 +1,765 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/azoteq,iqs7211.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Azoteq IQS7210A/7211A/E Trackpad/Touchscreen Controller
+
+maintainers:
+  - Jeff LaBundy <jeff@labundy.com>
+
+description: |
+  The Azoteq IQS7210A, IQS7211A and IQS7211E trackpad and touchscreen control-
+  lers employ projected-capacitance sensing and can track two contacts.
+
+  Link to datasheets: https://www.azoteq.com/
+
+properties:
+  compatible:
+    enum:
+      - azoteq,iqs7210a
+      - azoteq,iqs7211a
+      - azoteq,iqs7211e
+
+  reg:
+    maxItems: 1
+
+  irq-gpios:
+    maxItems: 1
+    description:
+      Specifies the GPIO connected to the device's active-low RDY output. The
+      pin doubles as the IQS7211E's active-low MCLR input, in which case this
+      GPIO must be configured as open-drain.
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Specifies the GPIO connected to the device's active-low MCLR input. The
+      device is temporarily held in hardware reset prior to initialization if
+      this property is present.
+
+  azoteq,default-comms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 2
+    default: 0
+    description: |
+      Specifies the device's initial communication mode as follows:
+      0: Unknown (wait for device to open initial communication window)
+      1: Forced communication disabled by default
+      2: Forced communication enabled by default
+
+  azoteq,forced-comms:
+    type: boolean
+    description:
+      Enables forced communication throughout the remainder of operation; for
+      use with host adapters that cannot tolerate clock stretching.
+
+  azoteq,rate-active-ms:
+    minimum: 0
+    maximum: 65535
+    description: Specifies the report rate (in ms) during active mode.
+
+  azoteq,rate-touch-ms:
+    minimum: 0
+    maximum: 65535
+    description: Specifies the report rate (in ms) during idle-touch mode.
+
+  azoteq,rate-idle-ms:
+    minimum: 0
+    maximum: 65535
+    description: Specifies the report rate (in ms) during idle mode.
+
+  azoteq,rate-lp1-ms:
+    minimum: 0
+    maximum: 65535
+    description: Specifies the report rate (in ms) during low-power mode 1.
+
+  azoteq,rate-lp2-ms:
+    minimum: 0
+    maximum: 65535
+    description: Specifies the report rate (in ms) during low-power mode 2.
+
+  azoteq,timeout-active-ms:
+    multipleOf: 1000
+    minimum: 0
+    maximum: 65535000
+    description:
+      Specifies the length of time (in ms) to wait for an event before moving
+      from active mode to idle or idle-touch modes.
+
+  azoteq,timeout-touch-ms:
+    multipleOf: 1000
+    minimum: 0
+    maximum: 65535000
+    description:
+      Specifies the length of time (in ms) to wait for an event before moving
+      from idle-touch mode to idle mode.
+
+  azoteq,timeout-idle-ms:
+    multipleOf: 1000
+    minimum: 0
+    maximum: 65535000
+    description:
+      Specifies the length of time (in ms) to wait for an event before moving
+      from idle mode to low-power mode 1.
+
+  azoteq,timeout-lp1-ms:
+    multipleOf: 1000
+    minimum: 0
+    maximum: 65535000
+    description:
+      Specifies the length of time (in ms) to wait for an event before moving
+      from low-power mode 1 to low-power mode 2.
+
+  azoteq,timeout-lp2-ms:
+    multipleOf: 1000
+    minimum: 0
+    maximum: 60000
+    description:
+      Specifies the rate (in ms) at which the trackpad reference values
+      are updated during low-power modes 1 and 2.
+
+  azoteq,timeout-ati-ms:
+    multipleOf: 1000
+    minimum: 0
+    maximum: 60000
+    description:
+      Specifies the delay (in ms) before ATI is retried following an ATI error.
+
+  azoteq,timeout-comms-ms:
+    minimum: 0
+    maximum: 65535
+    description:
+      Specifies the delay (in ms) before a communication window is closed.
+
+  azoteq,timeout-press-ms:
+    multipleOf: 1000
+    minimum: 0
+    maximum: 60000
+    description:
+      Specifies the length of time (in ms) to wait before automatically
+      releasing a press event. Specify zero to allow the press state to
+      persist indefinitely.
+
+  azoteq,fosc-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      Specifies the device's core clock frequency as follows:
+      0: 14 MHz
+      1: 18 MHz
+
+  azoteq,fosc-trim:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description: Specifies the device's core clock frequency trim.
+
+  azoteq,num-contacts:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 2
+    default: 0
+    description: Specifies the number of contacts reported by the device.
+
+  azoteq,contact-split:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    description: Specifies the contact (finger) split factor.
+
+  azoteq,trim-x:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    description: Specifies the horizontal trim width.
+
+  azoteq,trim-y:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    description: Specifies the vertical trim height.
+
+  trackpad:
+    type: object
+    description: Represents all channels associated with the trackpad.
+
+    properties:
+      azoteq,rx-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 8
+        items:
+          minimum: 0
+          maximum: 7
+        description:
+          Specifies the order of the CRx pin(s) associated with the trackpad.
+
+      azoteq,tx-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 12
+        items:
+          minimum: 0
+          maximum: 11
+        description:
+          Specifies the order of the CTx pin(s) associated with the trackpad.
+
+      azoteq,channel-select:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 36
+        items:
+          minimum: 0
+          maximum: 255
+        description: |
+          Specifies the channels mapped to each cycle in the following order:
+          Cycle 0, slot 0
+          Cycle 0, slot 1
+          Cycle 1, slot 0
+          Cycle 1, slot 1
+          ...and so on. Specify 255 to disable a given slot.
+
+      azoteq,ati-frac-div-fine:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the trackpad's ATI fine fractional divider.
+
+      azoteq,ati-frac-mult-coarse:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        description: Specifies the trackpad's ATI coarse fractional multiplier.
+
+      azoteq,ati-frac-div-coarse:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the trackpad's ATI coarse fractional divider.
+
+      azoteq,ati-comp-div:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the trackpad's ATI compensation divider.
+
+      azoteq,ati-target:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 65535
+        description: Specifies the trackpad's ATI target.
+
+      azoteq,touch-enter:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the trackpad's touch entrance factor.
+
+      azoteq,touch-exit:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the trackpad's touch exit factor.
+
+      azoteq,thresh:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the trackpad's stationary touch threshold.
+
+      azoteq,conv-period:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the trackpad's conversion period.
+
+      azoteq,conv-frac:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the trackpad's conversion frequency fraction.
+
+    patternProperties:
+      "^event-(tap(-double|-triple)?|hold|palm|swipe-(x|y)-(pos|neg)(-hold)?)$":
+        type: object
+        $ref: ../input.yaml#
+        description:
+          Represents a gesture event reported by the trackpad. In the case of
+          axial gestures, the duration or distance specified in one direction
+          applies to both directions along the same axis.
+
+        properties:
+          linux,code: true
+
+          azoteq,gesture-max-ms:
+            minimum: 0
+            maximum: 65535
+            description: Specifies the maximum duration of tap/swipe gestures.
+
+          azoteq,gesture-mid-ms:
+            minimum: 0
+            maximum: 65535
+            description:
+              Specifies the maximum duration between subsequent tap gestures
+              (IQS7211E only).
+
+          azoteq,gesture-min-ms:
+            minimum: 0
+            maximum: 65535
+            description: Specifies the minimum duration of hold gestures.
+
+          azoteq,gesture-dist:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 65535
+            description:
+              Specifies the minimum (swipe) or maximum (tap and hold) distance
+              a finger may travel to be considered a gesture.
+
+          azoteq,gesture-dist-rep:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 65535
+            description:
+              Specifies the minimum distance a finger must travel to elicit a
+              repeated swipe gesture (IQS7211E only).
+
+          azoteq,gesture-angle:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 255
+            description:
+              Specifies the maximum angle a finger may travel to be considered
+              a swipe gesture, expressed as 64 * tan(theta).
+
+          azoteq,thresh:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 42
+            description: Specifies the palm gesture threshold (IQS7211E only).
+
+        additionalProperties: false
+
+    dependencies:
+      azoteq,tx-enable: ["azoteq,rx-enable"]
+      azoteq,channel-select: ["azoteq,rx-enable"]
+
+    additionalProperties: false
+
+  alp:
+    type: object
+    $ref: ../input.yaml#
+    description: Represents the alternate low-power channel (ALP).
+
+    properties:
+      azoteq,rx-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 8
+        items:
+          minimum: 0
+          maximum: 7
+        description:
+          Specifies the CRx pin(s) associated with the ALP in no particular
+          order.
+
+      azoteq,tx-enable:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 12
+        items:
+          minimum: 0
+          maximum: 11
+        description:
+          Specifies the CTx pin(s) associated with the ALP in no particular
+          order.
+
+      azoteq,ati-frac-div-fine:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the ALP's ATI fine fractional divider.
+
+      azoteq,ati-frac-mult-coarse:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        description: Specifies the ALP's ATI coarse fractional multiplier.
+
+      azoteq,ati-frac-div-coarse:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the ALP's ATI coarse fractional divider.
+
+      azoteq,ati-comp-div:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the ALP's ATI compensation divider.
+
+      azoteq,ati-target:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 65535
+        description: Specifies the ALP's ATI target.
+
+      azoteq,ati-base:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        multipleOf: 8
+        minimum: 0
+        maximum: 255
+        description: Specifies the ALP's ATI base.
+
+      azoteq,ati-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          Specifies the ALP's ATI mode as follows:
+          0: Partial
+          1: Full
+
+      azoteq,sense-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          Specifies the ALP's sensing mode as follows:
+          0: Self capacitive
+          1: Mutual capacitive
+
+      azoteq,debounce-enter:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the ALP's debounce entrance factor.
+
+      azoteq,debounce-exit:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the ALP's debounce exit factor.
+
+      azoteq,thresh:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 65535
+        description: Specifies the ALP's proximity or touch threshold.
+
+      azoteq,conv-period:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the ALP's conversion period.
+
+      azoteq,conv-frac:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the ALP's conversion frequency fraction.
+
+      linux,code: true
+
+    additionalProperties: false
+
+  button:
+    type: object
+    description: Represents the inductive or capacitive button.
+
+    properties:
+      azoteq,ati-frac-div-fine:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the button's ATI fine fractional divider.
+
+      azoteq,ati-frac-mult-coarse:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 15
+        description: Specifies the button's ATI coarse fractional multiplier.
+
+      azoteq,ati-frac-div-coarse:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the button's ATI coarse fractional divider.
+
+      azoteq,ati-comp-div:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+        description: Specifies the button's ATI compensation divider.
+
+      azoteq,ati-target:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 65535
+        description: Specifies the button's ATI target.
+
+      azoteq,ati-base:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        multipleOf: 8
+        minimum: 0
+        maximum: 255
+        description: Specifies the button's ATI base.
+
+      azoteq,ati-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          Specifies the button's ATI mode as follows:
+          0: Partial
+          1: Full
+
+      azoteq,sense-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description: |
+          Specifies the button's sensing mode as follows:
+          0: Self capacitive
+          1: Mutual capacitive
+          2: Inductive
+
+      azoteq,touch-enter:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the button's touch entrance factor.
+
+      azoteq,touch-exit:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the button's touch exit factor.
+
+      azoteq,debounce-enter:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the button's debounce entrance factor.
+
+      azoteq,debounce-exit:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the button's debounce exit factor.
+
+      azoteq,thresh:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 65535
+        description: Specifies the button's proximity threshold.
+
+      azoteq,conv-period:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the button's conversion period.
+
+      azoteq,conv-frac:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        description: Specifies the button's conversion frequency fraction.
+
+    patternProperties:
+      "^event-(prox|touch)$":
+        type: object
+        $ref: ../input.yaml#
+        description:
+          Represents a proximity or touch event reported by the button.
+
+        properties:
+          linux,code: true
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+  wakeup-source: true
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+dependencies:
+  touchscreen-size-x: ["azoteq,num-contacts"]
+  touchscreen-size-y: ["azoteq,num-contacts"]
+  touchscreen-inverted-x: ["azoteq,num-contacts"]
+  touchscreen-inverted-y: ["azoteq,num-contacts"]
+  touchscreen-swapped-x-y: ["azoteq,num-contacts"]
+
+required:
+  - compatible
+  - reg
+  - irq-gpios
+
+additionalProperties: false
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: azoteq,iqs7210a
+
+    then:
+      properties:
+        alp:
+          properties:
+            azoteq,rx-enable:
+              maxItems: 4
+              items:
+                minimum: 4
+
+    else:
+      properties:
+        azoteq,timeout-press-ms: false
+
+        alp:
+          properties:
+            azoteq,ati-mode: false
+
+        button: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: azoteq,iqs7211e
+
+    then:
+      properties:
+        reset-gpios: false
+
+        trackpad:
+          properties:
+            azoteq,tx-enable:
+              maxItems: 13
+              items:
+                maximum: 12
+
+        alp:
+          properties:
+            azoteq,tx-enable:
+              maxItems: 13
+              items:
+                maximum: 12
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
+            touch@56 {
+                    compatible = "azoteq,iqs7210a";
+                    reg = <0x56>;
+                    irq-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+                    reset-gpios = <&gpio 17 (GPIO_ACTIVE_LOW |
+                                             GPIO_PUSH_PULL)>;
+                    azoteq,num-contacts = <2>;
+
+                    trackpad {
+                            azoteq,rx-enable = <6>, <5>, <4>, <3>, <2>;
+                            azoteq,tx-enable = <1>, <7>, <8>, <9>, <10>;
+                    };
+
+                    button {
+                            azoteq,sense-mode = <2>;
+                            azoteq,touch-enter = <40>;
+                            azoteq,touch-exit = <36>;
+
+                            event-touch {
+                                    linux,code = <KEY_HOME>;
+                            };
+                    };
+
+                    alp {
+                            azoteq,sense-mode = <1>;
+                            linux,code = <KEY_POWER>;
+                    };
+            };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/input/input.h>
+
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            touch@56 {
+                    compatible = "azoteq,iqs7211e";
+                    reg = <0x56>;
+                    irq-gpios = <&gpio 4 (GPIO_ACTIVE_LOW |
+                                          GPIO_OPEN_DRAIN)>;
+
+                    trackpad {
+                            event-tap {
+                                    linux,code = <KEY_PLAYPAUSE>;
+                            };
+
+                            event-tap-double {
+                                    linux,code = <KEY_SHUFFLE>;
+                            };
+
+                            event-tap-triple {
+                                    linux,code = <KEY_AGAIN>;
+                            };
+
+                            event-hold {
+                                    linux,code = <KEY_STOP>;
+                            };
+
+                            event-palm {
+                                    linux,code = <KEY_EXIT>;
+                            };
+
+                            event-swipe-x-pos {
+                                    linux,code = <KEY_REWIND>;
+                            };
+
+                            event-swipe-x-pos-hold {
+                                    linux,code = <KEY_PREVIOUS>;
+                            };
+
+                            event-swipe-x-neg {
+                                    linux,code = <KEY_FASTFORWARD>;
+                            };
+
+                            event-swipe-x-neg-hold {
+                                    linux,code = <KEY_NEXT>;
+                            };
+
+                            event-swipe-y-pos {
+                                    linux,code = <KEY_VOLUMEUP>;
+                            };
+
+                            event-swipe-y-pos-hold {
+                                    linux,code = <KEY_MUTE>;
+                            };
+
+                            event-swipe-y-neg {
+                                    linux,code = <KEY_VOLUMEDOWN>;
+                            };
+
+                            event-swipe-y-neg-hold {
+                                    linux,code = <KEY_MUTE>;
+                            };
+                    };
+            };
+    };
+
+...
-- 
2.25.1

