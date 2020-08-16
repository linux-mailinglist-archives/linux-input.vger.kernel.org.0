Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C19E2459A7
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 23:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgHPVPT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 17:15:19 -0400
Received: from mail-dm6nam10on2076.outbound.protection.outlook.com ([40.107.93.76]:55009
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729072AbgHPVPS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 17:15:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9GLX41exIZ8P3B5n/hbQKqWES18KMLuSaSSL0ptm8rCuy1f33OstT9qqiwYvuXdaURiCHLDarHx4RsRnSH0mVOfdD5Cnm7jPOUlrJWw422A+tzSWfHijH1layYBYy3x3F89xd78mdTqRnF7rU3jwvBIhcE1OT3pfbgB8Ercb9oeNUCQTJhhqEZtXJLZujXAW0KIqP7WKa48Y6NADCWI0uGLIqxq88VT/WBkuWm98d23BlfwAvz/tajJLCQi60QTPIobpWAYtd801vDHRcrVSqRywAT6kDv8Zi2fBdiW35BcKatX4zlHrhIwyAEM6XLQ0Id6SsniYLDZSfVPpEbasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qs/YKVRBtzFOL/l2mOlWeUZkN1r6qiWQgA8WjHabqes=;
 b=gS4CIZAPVFgcYTrpQzNF+VbZYvQ3TlXsXetv6hGBI5NbwHcLeBVQt7t82S/L5gm+hOe5NE4RMdGPUGOfNaWHCBo/rboJSYfIhJYJ3f4sqUhCBcuv8/D1+HQ5yuxAe4wccG/NSMe4B8X1a/+k3bOIqcc+g9vHuLTJhljPigYEzkjaqNSW1YyWI0SmgLYtIQCiKbcYMU8Pd4HdgmER5lSFE57jEvX48f0uxRIyzpgZAKDYFE1tj46lmC9IJL/gSMDtyvKPW762fGdot3VfUAblEJL2U9+Q/T0u6uC8PnwyrzFmobe92OvSjDTpZ8OPMseauLbjBvnd/oeA5jBuOAxnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qs/YKVRBtzFOL/l2mOlWeUZkN1r6qiWQgA8WjHabqes=;
 b=f+q6nGEo8QtKYpqnSHlutVhXksnIKgV3sexLMtF/JIQPQMUyZp+GajGQBZN1BulFVKa+jzDA9tw/SfBMDYimg0NjgP+PXSXSSNzGwapGhL+gisCRQzeDyK0WNmWuUvqxnbERgaPJbrVTlNTJ9jq5fzcblVX5WOogWINx24O6iyU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Sun, 16 Aug
 2020 21:15:09 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875%6]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 21:15:09 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 3/6] dt-bindings: input: iqs269a: Add bindings for OTP variants
Date:   Sun, 16 Aug 2020 16:14:24 -0500
Message-Id: <1597612467-15093-4-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597612467-15093-1-git-send-email-jeff@labundy.com>
References: <1597612467-15093-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.27 via Frontend Transport; Sun, 16 Aug 2020 21:15:09 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecf66025-e5a2-491d-2c13-08d842297500
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56310B39F954E57FB81D7A67D35E0@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jrj8oJ8MGhMvW5nCBO9wDjSuzuBm8kltvPw71LAZ2X93E3v6brRn71aOp6Vc2c+dLWy4J+R7bgqqBfxiXR8STRAxMYV+NO1webLV3LTTbSh26ye+Aw+8IlON1G2ZaraBqpABehNbShVZ06iRiA8T428oRgpYt3ICEQgesZlYrLW/sX71g2EDwTRQ5KhPCTz/wgFF/unNSTDA4TuMdnMFsIqH/5vOm+1s5YW+TyEGSwpT2jeU/2+/IklhFtSxllxGI5SJWgTGeXXdLjxPolCjB4pSRFwuvk2FPPoPzg0f3mPwYF4UutqOQDzXbXyJC8E8g5OpoEaIPUehJcm36L4Fgg8NVvLR3bzibvxSazTXBWd2jScA1jfib3mIRK0+HdHM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(366004)(396003)(376002)(346002)(66476007)(6666004)(66556008)(69590400007)(36756003)(4326008)(86362001)(107886003)(2616005)(956004)(316002)(16526019)(8676002)(83380400001)(6506007)(8936002)(52116002)(6512007)(2906002)(478600001)(5660300002)(66946007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: gtd6tR0b/8tpyGYkWPIK3rO1zW0O+fw3zitSlOrqpOGOx8X5HOJt6o0kfgIm+TJHMLWRMWI+dls96K2gI5mtHlNv6nBQlvYENPFNEWctaIDNxMl3HPr3xRazfVu6sdm3Bgd/C9Mdp5wuDJ+wWoWeVUluJzsRFUbzCN51GewPlfgmsyJg959JYvRl0q+5Z1COa3OfSK8e2j2/o004Wrml4Ep005+9MhpMJCPc1gWwlzCmykKrsdXqo7MlJ6GFd/N0yNvadwUMWCoy3BVsQC4GebkJva/8tYKFY5kwffTJ0YY1d0E7mKH/QymnxV5+iuQvbgfhTha0k2vs4v8pKok+GQwDlnqz7bsR2/M1d4u7vAyUu6CrKinoPvKgU+rrw9vrNEQeHcgoFEyQcBRy3UUbL3S6L4Sx1XJEumxB8elf99mwuANE5pnU8uCUAK/LNulqeQrIernyFGFxm675RP8p80IR8LdzoSboPu8TT0FsJTNJx8FCyWkzoj7dlNasfYJ68pf6QRz10pcUPJ/rBLfbR7zi3CIl4LxGcVQcLMrhKpOUMOJZlILtwvFTPcMPg5DWouTGH7e6owLiaG+AL05RyDkLW7CHEJ1DHuT6Bqa3K9RxZ5N+tOzk9/tnLteVuT4MweeKUP/AE/pEqD9nkahyJg==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf66025-e5a2-491d-2c13-08d842297500
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 21:15:09.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNVVi40FGGlwJcMr1wgWvMGQ/laHK31mgI/+lvHe/t99F4f1ecqGgNF6a7qc01kXfWuTqUGCWH6+qWhaDuZpNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for the D0 order code of the device. This
order code represents an OTP variant that enables a touch-and-hold
function in place of slider 1.

Also included is the ability to specify the 00 order code (default
option with no OTP customization) explicitly.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../devicetree/bindings/input/iqs269a.yaml         | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
index e13812d..56a628e 100644
--- a/Documentation/devicetree/bindings/input/iqs269a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -17,7 +17,10 @@ description: |
 
 properties:
   compatible:
-    const: azoteq,iqs269a
+    enum:
+      - azoteq,iqs269a
+      - azoteq,iqs269a-00
+      - azoteq,iqs269a-d0
 
   reg:
     maxItems: 1
@@ -210,6 +213,16 @@ properties:
     default: 1
     description: Specifies the slider coordinate filter strength.
 
+  azoteq,touch-hold-ms:
+    multipleOf: 256
+    minimum: 256
+    maximum: 65280
+    default: 5120
+    description:
+      Specifies the length of time (in ms) for which the channel selected by
+      'azoteq,gpio3-select' must be held in a state of touch in order for an
+      approximately 60-ms pulse to be asserted on the GPIO4 pin.
+
   linux,keycodes:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 1
@@ -514,6 +527,21 @@ patternProperties:
 
     additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - azoteq,iqs269a-d0
+then:
+  patternProperties:
+    "^channel@[0-7]$":
+      properties:
+        azoteq,slider1-select: false
+else:
+  properties:
+    azoteq,touch-hold-ms: false
+
 required:
   - compatible
   - reg
-- 
2.7.4

