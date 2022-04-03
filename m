Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 560974F0CC1
	for <lists+linux-input@lfdr.de>; Mon,  4 Apr 2022 00:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376537AbiDCWTn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Apr 2022 18:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376527AbiDCWTm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Apr 2022 18:19:42 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F0A39832;
        Sun,  3 Apr 2022 15:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lip1HdFmzoe+1Ba2RX3fmFffJ4WM0yOBbvIIIpCXnZl6w1chbOJHCvcUIsXqgQNTnkeoh1u6nh38A2xOtOUJUIAJVLQoCLfOItRFyhtcF35bCz/zOpTZRKpftlDOx/IfITFwZcinQOmY3VhMCp5tBAatTdyWX9P2NwFMmi3+GAKB6y7/Ef9alk3dTytkV4/WOrnZIxl/0dj7ngkODkvTED8yYWSMkn//OXKMFgoFHlAyWnyuTXed1HEWZ+p+xgNcMkX7WTIOO6osHpWK1DDlTGLNPpTzNMf1DE11hA0zJ2LppNiiqOy/JN56f0XyPEqtL0AbXuEAITwflsJbiELtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPClVQ1Ay66R6Vmi3EBZUutg4qxOFbyEpuPoP+o+J+c=;
 b=Pj+OlsFOnNulQjcmqqXCLCVOKghehXu2c2LZbs8sFz0QfW1pTjDEHKHU8ZczLQGhCyx72MoH8UNjyX13lJl+Y5aZGSX5BLt2paPPbC4qh3eZrun4HlljhgxKbevtvQ+MO3A6FaOjf0eNElF+qXDeEYsk+ho0WtrCHh8oX+8bJ3EYsTt5NoD6AtYttP+xYiXgJ2e7GzsbhLEab5y+/q2Y9V/okIG962rrJf8weIF1WIXZRD/oyZ/eb+1HP5ORbKNUTAQj5iABXVfiideqmbsTht273e236mM/1oYwhxPpSyK/F3AGFVC8hnOgmJffnB3pcotUjo0/amLI0UF8ldqutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPClVQ1Ay66R6Vmi3EBZUutg4qxOFbyEpuPoP+o+J+c=;
 b=OpxAnpbYE4r8MlaczkKEnebl0nigl+OOPobkglbKvkoXjQJQovZLbM34QELdKt3iz5Fy4Di3SIpxNsLazMl0RmoZTiFEmHpfk2Q7YxYWOk7iXdkf6tBG/xhVc/gnI/NBu9+I8EoXQMJBJ4SK40/T1rshETUSRsSSRur2PRbtzsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by CY4PR0801MB3796.namprd08.prod.outlook.com (2603:10b6:910:8f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Sun, 3 Apr
 2022 22:17:44 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::a007:fd2d:e5a6:8591]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::a007:fd2d:e5a6:8591%3]) with mapi id 15.20.5123.031; Sun, 3 Apr 2022
 22:17:44 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C
Date:   Sun,  3 Apr 2022 17:16:58 -0500
Message-Id: <20220403221659.865997-2-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220403221659.865997-1-jeff@labundy.com>
References: <20220403221659.865997-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:6e::27) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab5f334-9d36-4565-3ca4-08da15bfc668
X-MS-TrafficTypeDiagnostic: CY4PR0801MB3796:EE_
X-Microsoft-Antispam-PRVS: <CY4PR0801MB379671A6C40313106D8118E7D3E29@CY4PR0801MB3796.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wk+SI7VKQR0YkcaJMBKne7UQ3P7d38Ij0O5mV8OurDmVkdTkLwtvcRKUZtok5vGrBnUMuXzL0Uf6rjlDjIBwfp1vEZqLGUUaV5DwxiHgyb6SYnyB3GTTVZPc5FpEn4wg7VZkH+b4BQUswetZ0XERmWarZLGvOBigj4bV5Yb71HqjKCvURaALWHgtmv/+XeaP4a86oWmdneCxia02P7uQ2/OospfXLl01tJ6JmVQD6guXyAyrYusSXZlKfrppbfSLEiokqauyXr6kavpBN4ZTAkU0J2LycVlDj2yG/JRreEaLMTyc0Y1Q7pVl3UjWkq2WExRAzZ1a/GJ1Bwhr/vB13aHgc9gAgjoAtsOHOL3SdCIw8n2oAp5NKK7jvZDDaQGVR6qDhOsMXsR0Ff5TJMF/klRxK/qe7wC/d6gu4qbc6w6r8yhaL/ZGML3PNNJXPfFBvPkTveZHkTNhlRj5Hyd/CURljqQjWu2IPbIITcKx2QK4vRMGCtYn5BqTTr9VSL/1h6e72i561mMSitXxFHBYrqQrnIJemR88ShPtmi+IOUnWS+HW8LKOkZC+qPTbS/xTV3r7lai0OPSFN8tOuzovm2XdBRYPan0Nu7oecStJxXTI8SO+rKowxcWWRFrk5TS6P+C8mm2RC809sSpocM9lqp+78qTsiYPDv7awKtkS351CfBLeSfBe7U4CPA9AevucsTKCT0ZVS2ahkebX8SmqnF1gFb21KMKy9M1SA0n+oNnI0quPk4HIPYVEoYI1xt7hpPn5X+8VAiqN5gnGJwSDETwWmDMKJh4QP1cbWW6VKSRSsSm4vJgwdjYUfkXecEWBcbV6+r92ggaXOYEvEc1eww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(136003)(396003)(376002)(39830400003)(366004)(346002)(26005)(186003)(86362001)(52116002)(6506007)(2906002)(8936002)(316002)(966005)(6666004)(54906003)(6486002)(5660300002)(30864003)(38350700002)(38100700002)(83380400001)(6512007)(1076003)(508600001)(66476007)(36756003)(66556008)(2616005)(66946007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wkw5sOh5mf9DCNsTjl8hUw8KMAb+I+e3jBGcuiihOx8mwvJMUmngcdPLPgRL?=
 =?us-ascii?Q?e0F/r/+YlDJ6ju5w/yMLt1EEOW2xphrS/y0kryyylKm7hFTXoVOGhvTlPb5b?=
 =?us-ascii?Q?lctWX6MwRNRFejHbLHxmF07VNG1dhxLpvU4zf5mSZUofQF+6275PEVzYs1wN?=
 =?us-ascii?Q?9irVZoCB2idOv5ZcnQrlwKxFOIG0FPms2Em4CTskH+JsR4ork6R4bjiheWsS?=
 =?us-ascii?Q?d35XzKUusQrtfMqmnT3mnOquLGDMYKh+bY7zFlUHQIZqkOtDV0WVTfxJAj7W?=
 =?us-ascii?Q?qaszhLKWDXeNWOt+H7yCxUQD+pO4KXQfxzzNYt54mCo9jZaBV/YJV9aRqX1n?=
 =?us-ascii?Q?2EuNQaQ4ox6wFEe5nQ7/0ltlcOwjK6vQjkTUiLlgj81x974EZ2MAEqL6Qc2e?=
 =?us-ascii?Q?da/iPPZe2qOTQRZ20vuHMJDpRfJJG5eqGjbIm7VvfcC9nfX/jyys1JTh16ah?=
 =?us-ascii?Q?/SxRFLUOfz2taHlreLlxUD/OhUcwSv5WhY9QbxkFr15HCwsB1WZ4cbLq1p1u?=
 =?us-ascii?Q?3NEtrv8EE6KKC0myQCFZKjtX446ypHoKgat2Au+fxCvY66FF6pbuIgqKn04R?=
 =?us-ascii?Q?lRFmZNrcrull7pS5FGnPZ0nbfxokWCFTisIOyfljjypryODQrWxPkERn49Tt?=
 =?us-ascii?Q?nzaA17XnwqKLHaTRomUUVXnk0R07842zSDY4toQ2MzJ9xxTTtPdqE7cdaRQj?=
 =?us-ascii?Q?zvku/VCjL3QILJC7n3vjVejeqfKXEq3QWzzkV/tQdXqLxmp1AkI0aDU0UFXe?=
 =?us-ascii?Q?fZFU9LPQIvipIInQ2lV7156xWnJqDM1rkwPbeAKJlxvohxEMSGFdy32SvO0u?=
 =?us-ascii?Q?JQf5Iqw6f9EMUoXad+rK+kwWwRqRAhQfsJlmPrK4NTslev6ySQXEz2NXKq0z?=
 =?us-ascii?Q?8IE0OiZmIxymazyvgasEbgPwHBskMzz2GjW+TmvnwpDEg4vRTtwtBfFZHWK1?=
 =?us-ascii?Q?EkmcLEuHANMuMEDMUPJUjW/7kGM1VOvl01VO/QROkU0ldguEYzw+1aurJPQV?=
 =?us-ascii?Q?GtGqNfvU24P1yrl5FPvGSG0gHwH38SIgckPWHaueyd96cfiBkj+iWIymfIET?=
 =?us-ascii?Q?ErnBNkRfUtP0DKEDGo+b5j5p3Z86AAybNFASkSAF7abV6NbqVxuEjVjHD2VN?=
 =?us-ascii?Q?tDDRbOmKNh061D1omnjCHhj4pi7fiJvKlQ6w43OmA0Kfj7d3gR1kw7KndXpS?=
 =?us-ascii?Q?7MK9zhRpL2jqXzBjhxYcv1efnfUjtaUifppSM39NSYgX6IMCchfUu+l+8heW?=
 =?us-ascii?Q?yrgalQs2WvzsxbNNarZAjpZ29U2g0KKevWpPbVxc8Bhw3sxVIgtW499Eb4O+?=
 =?us-ascii?Q?4BWVruPYHPCgqyX5opl+ZfZvvCzjmkUFib86weEDkQnDrqGqOedVZVP0PXpr?=
 =?us-ascii?Q?5D2/slOwDEErNyutdIyq06wh5yR1TvPZ3+qtLRTyoJXN6jXgZUAUgHcNJgQU?=
 =?us-ascii?Q?lxqUiRRmgr4UksUnn/z5Sk+H50DMqxwKnv20sJ0Tdg+yYiSOAYDB6quEqGpJ?=
 =?us-ascii?Q?6kndIMODs9386eBHUaJ+9tkA7/14VVJ0xM9IZdcZp/Fr7E3PDFc26RehZOa7?=
 =?us-ascii?Q?QOhhoqiJ4C42lhUgrhBOCQmbk2EoOn9jHTf2eBtZdWFI+QsJWrYLAllR7awB?=
 =?us-ascii?Q?EY8eVdroWfN4fGRe9Y7xtiHcKULqyX65Fk77Rp+8oGmyL6CQV0ga0PQpdDe9?=
 =?us-ascii?Q?bqKHwGhcz8jrPmrBog15EgiZTRmbIA24WkwZByZPCXW+s/YLB28P4zODHx9Z?=
 =?us-ascii?Q?zLMHm5sqKQ=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab5f334-9d36-4565-3ca4-08da15bfc668
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2022 22:17:43.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p9Ddt+uQhs4wTCqWuIF9hcpnt7sOKQ4U/65vaiLtCwE9S0LuTTkc9OG7u04x8Ujc4zBxtu9UIyvEwEoHkC5Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0801MB3796
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for the Azoteq IQS7222A/B/C family of
capacitive touch controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
 - Added Reviewed-by

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

