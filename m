Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A953715295
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 02:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjE3Ad4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 May 2023 20:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjE3Ad4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 May 2023 20:33:56 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAD5AD;
        Mon, 29 May 2023 17:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A98KaS1kDR8TIZU544S25QiJbV5wBTtFpGyDWKDoCbFfTRP1QFQ+pxup5nKod/tiavl3uKMfs4VsnJA/JD8M6ak6Gep3MrhHmiFkPR/rwXi07yRnJLDi3LwE20ldNiTpRjsaq03+NLaQP5qHSQmpE1PoO8hCfneIxujKxRc+fE3VC60cyZjHyLNPO12SXZFqg0qo7MvPUZUQ88nLedik+HDwO6jIOMCwrpKQb6gnndRemHQ2nok0hsMSzTDOzirMEGxtnBSTga4IJdCTXUPFhKruICbAyrseHNbOPIVHFWZ++u324ohsiVYj/+tBR24q9oS03mW0xTn3kB2k/whhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UabhDqml8upX6Ue924cR8ITHO2U12ke0J7iDXhpJe/8=;
 b=U1Lf0cqpy8mGaOb5Gjw3nQKp+yzyr1dw9D4q3p2MpTs+Y+uj1n5CqvDNEdxgByEHm6kneTSvfBsWusovqjjc4F0xFFgKG2M/n+nDbKij1DeYuNxEHcoo71Sf1Z/ITWx/PmPajygqS+/+gjG2WSA/cwD9kT3v0hvzPH1wPzkCWb7SIjdLboWIWSA0pvoNtQExiL5Ub8RZ4CUGYQ7d+sVTirfdC+zCfWHgJPyr4oikP6hhUqYl83ajiDsxBkotdjLfOcjnnyONYQH36y97PP0LbPdp+LFzkYNwt7VdVEnWkM0qgH5O6GIzg2shql3GVssY0Cl+E2rzVa2ifd5mPjo+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UabhDqml8upX6Ue924cR8ITHO2U12ke0J7iDXhpJe/8=;
 b=o40Z93Tq1hdzx4V5gM3jptBTo0SiXr+3SXsOabLNm8NEutAfB28r3uAT5FPMJkidkGlFvaR66JTlg5ZtcUCcrf1/jY/S8oXf3HflQdHZGz2B4MhT07ww9B8ZHaH/f3RIUPqI7Kac/SnMJ2zmKeJiFH/EMu8jykz6GrGJ2r7ImZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ2PR08MB8477.namprd08.prod.outlook.com
 (2603:10b6:a03:4f9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 00:33:50 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::c696:d0df:10ac:8071]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::c696:d0df:10ac:8071%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:33:50 +0000
Date:   Mon, 29 May 2023 19:33:47 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <ZHVEa0yM1LLUJEfO@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHVD/9OgRTAwBhqx@nixie71>
References: <ZHVD/9OgRTAwBhqx@nixie71>
X-ClientProxiedBy: DS7PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::18) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SJ2PR08MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: bc3f9882-d20f-44e5-c007-08db60a58990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8x2byEXptb0R/hnVCaUzuaTcDe+5Wp2JF9MQTBkigenk0T4wWdB0XxEes2q9mXBWJCYXGlBRDAXV/y0c93CABDjzNiE42izuq6PKneg3COyfz9p4d+GW9EMTZUsLE95N5di+p1NPeiBd6LSVDRHLxhH/cxLmt1KbQuFbtjLhJpcqFRBVYGPI0V1nIZftiyVQER4IMq8UvWMIezhBYCS4oARJw8dQIh5tA4IN9OxDwb5AemT/Mji3r66vGkgllqeFI6v6qwGjwuYq9yw/rUqPwSktMve4pBTCS11z6FPHVWw6jyQtolRakccL5Ph2al4F6qB/pLKNw7cC66WBr1IfnuOBM4yb7mqpXKvbfyQXCA+5ukUyyrCUckI4LIDXnPfAzc6FbNI0aWH/+Hbt8s175d1/7D2cqQyiDPdg9OaWQh7VwLRS/ousJEY9ublh10vrVc6qQ4l05Yd1TFfUZh4DYoMnaqaKuetXdqdwCayQGwZYpgVY3tZxtyJMR/ebiVSb3Cw4QhPtRqPKm0jSheJF0OFagnGTj5J7aYJENimCGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(366004)(39830400003)(396003)(376002)(136003)(451199021)(38100700002)(41300700001)(316002)(6666004)(6512007)(4326008)(86362001)(30864003)(8936002)(2906002)(8676002)(6486002)(66946007)(107886003)(9686003)(66476007)(66556008)(6506007)(26005)(83380400001)(966005)(478600001)(33716001)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y6EvQSJ6NZmlk7g3G6UREzUhqmsGMKxd4uL/KRHkPs7MLkeaSyRO1jnMBWNP?=
 =?us-ascii?Q?AV8cMZKvfDGX0kvUUn3RQ7F2xCJoJ5Rbl3ZvPXfmu43bqVPZaj6fzWYmmE9+?=
 =?us-ascii?Q?Sh8WuOmeasSchDTIwFv+i5HPkSliCBKlCtHLQATvDK8pvACgPcepspJX9Kdh?=
 =?us-ascii?Q?80UhvG3b3bBk9Epjv4z7nFID3/nHwM885yutCBvQon2Vr/zkmzJuyX1HlyOp?=
 =?us-ascii?Q?OfJnLa1w0U6f43hGemC1DDgr1O+Q/MCPDhy/wDQv9UYf+MulKYsG7bOPZrdW?=
 =?us-ascii?Q?phQa0EGD+zoyXHSnU5ikFFlPWnps50sMClG1c4EjTdilVM80dJDb3XdXOGS1?=
 =?us-ascii?Q?aoksHfVwB9P8OBAC3FwuB2jhoPDvt+kv81x0lRUh9aOxSiEGXyjzWFx7G5RN?=
 =?us-ascii?Q?xLYYTD8VlWyHWJ1PxaiYfKgiwzdqw1TBd2PirqJLRpJEklcIJ3bea6d41KfW?=
 =?us-ascii?Q?3l5ZeFtfzi3Be793DiyeH2JEswiRHyZUvr6r50o3LT+cMPP/42RfoYeebC43?=
 =?us-ascii?Q?Tj/I4yAw0sgczATHxmBpmbiEL2NN/X34Q2ujBeWOD9A7WC2rw6bEZx5u/kN4?=
 =?us-ascii?Q?R9Drw2fjdEqwRv+1k9IDi9Hjr7ul3dvXt9nAPRf6Pf34S7KIY0okpw0EdJgi?=
 =?us-ascii?Q?UDfn8+eGA0BW6s49LIChMlE7lIVJyHbl4D0ELo6oP9DP5SkpC6dtS8KhlV+W?=
 =?us-ascii?Q?X4vw/dlCyc4rpG42BlTA2zVbLMeMlnWjbrQCvgMxXhmSJGzwXJXB9G+jNbs0?=
 =?us-ascii?Q?whPfApLkBpQJxCESerT/FBhU+G3TEcTntRO83122x4xcBGA4wJrhAsnELVF4?=
 =?us-ascii?Q?WdROE/y4TI9Rf1RIqzZ0ZyiOemvjjPWxlw40G9yGjiBI8yv+5vEjBqFydAZl?=
 =?us-ascii?Q?fcNr/8hTO8inFQi9u401BNf9ownhec0aNy+mU+JD4BrbRDcoP/pZrxcXvCfe?=
 =?us-ascii?Q?CEHmObtVi1cYaP4fwkW3liNutQfXzKVWevcneJez8GDekY+7gSLAgHt4BH67?=
 =?us-ascii?Q?6uU209uUFNArKy2fPYzG2RPvLdvzsyXqsVrN6gwFCpbrPNW9cwFUvKdmRzOP?=
 =?us-ascii?Q?iqkft8bEQX8OCKSmDPKc1fbCQwKAoWwm0rXCeHrKZIHcG4XIK33IQ7CR3EpB?=
 =?us-ascii?Q?swgUvVIPa0iwlEwwCB+PbBdDIoj9KoaiEz/NJGtqjZ5p4+nCsVIfuWko1NpY?=
 =?us-ascii?Q?g/u04MjctYl0rz3sFx90cbPEmEMHhX/FlfWTNk0IXVUk+Y3J2pUQg5s5n9Sx?=
 =?us-ascii?Q?2V79CI9ehL3+Y6HvBjSF+mYc5h0/2Oqa39Mc02baOEQMIV3Gh3etkO9/DQ58?=
 =?us-ascii?Q?XpboX7oVdrwK3uoRcsMYigrxnlR1pesIlH54+Zicdf7cxOGYpuHgirgUHCqf?=
 =?us-ascii?Q?nz5JfC8N6l9Cs/rUjmD6Fip9ic8RsVgaF8zORGV6yGaBWhU/b+l5I+DYZKYB?=
 =?us-ascii?Q?hGm7CcjFFJYTaXg0f0cQRTDjuGqz/6qXEyz+JpZsLlNHj440MnNVxkb16zHg?=
 =?us-ascii?Q?i3VC9abVlcheIv2CmYHqrThwiIiAVVS++Ge9mKEoW6vHxEuWDTrBLXY1Hlwd?=
 =?us-ascii?Q?jR3VmaNGbg4F8lYTmmqtQjGC0+crQ1LxuaT8F30P?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3f9882-d20f-44e5-c007-08db60a58990
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:33:49.8896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5rnMn0a9eaFz48DgWL5zFRlX010E509k6+VtSqKmiPpF2WdEuyOE+r/c42qk3zJuUOoNHKy43vKy8KmsU8pJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR08MB8477
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add bindings for the Azoteq IQS7210A/7211A/E family of trackpad/
touchscreen controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Renamed 'azoteq,default-comms' to 'azoteq,forced-comms-default' and redefined
   0, 1 and 2 as unspecified, 0 and 1, respectively
 - Defined ATI upon its first occurrence
 - Redefined 'azoteq,gesture-angle' in units of degrees
 - Declared 'azoteq,rx-enable' to depend upon 'azoteq,tx-enable' within the
   'trackpad' node

Hi Rob,

I attempted to reference existing properties from a common binding [1] as per
your feedback in [2], however 'make DT_CHECKER_FLAGS=-m dt_binding_check' fails
with the message 'Vendor specific properties must have a type and description
unless they have a defined, common suffix.'

This seems related to the discussion in [3], where you warned that the tooling
cannot yet deduce that vendor-specific properties have already been typed in an
externally $ref'd binding. The only other example of a common vendor schema is
[4], but in that case the common properties are defined under arbitraily named
pinmux config nodes. As such, they are part of 'additionalProperties' instead of
'properties' and hence exempt from this particular validation.

Please let me know if I am mistaken (surprise!), in which case I will continue
on this path and send a v3. Otherwise, I would like to suggest that the review
moves forward under the premise that I will happily consolidate these bindings
once the tooling supports this idea.

Kind regards,
Jeff LaBundy

[1] https://github.com/jlabundy/linux/tree/azoteq-common (WIP)
[2] https://patchwork.kernel.org/comment/25003573/
[3] https://patchwork.kernel.org/comment/23867857/
[4] Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml

 .../input/touchscreen/azoteq,iqs7211.yaml     | 769 ++++++++++++++++++
 1 file changed, 769 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
new file mode 100644
index 000000000000..8cf371b99f19
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
@@ -0,0 +1,769 @@
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
+  azoteq,forced-comms:
+    type: boolean
+    description:
+      Enables forced communication; to be used with host adapters that cannot
+      tolerate clock stretching.
+
+  azoteq,forced-comms-default:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Indicates if the device's OTP memory enables (1) or disables (0) forced
+      communication by default. Specifying this property can expedite startup
+      time if the default value is known.
+
+      If this property is not specified, communication is not initiated until
+      the device asserts its RDY pin shortly after exiting hardware reset. At
+      that point, forced communication is either enabled or disabled based on
+      the presence or absence of the 'azoteq,forced-comms' property.
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
+      Specifies the delay (in ms) before the automatic tuning implementation
+      (ATI) is retried in the event it fails to complete.
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
+            maximum: 75
+            description:
+              Specifies the maximum angle (in degrees) a finger may travel to
+              be considered a swipe gesture.
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
+      azoteq,rx-enable: ["azoteq,tx-enable"]
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
2.34.1

