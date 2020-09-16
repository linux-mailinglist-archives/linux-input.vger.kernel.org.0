Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2252E26CCFA
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 22:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgIPUwN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 16:52:13 -0400
Received: from mail-dm6nam10on2061.outbound.protection.outlook.com ([40.107.93.61]:48609
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727757AbgIPUvw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 16:51:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZMi9rofj9jgRklp59Vb8lAEqm2deX0FClh30C9/Ujwzj7DjgV5FM8Qq40CTrrjQc3sk83UHkfrMlVATYkNICCSzpEgu+nwkE5z4Li23sOqW0DKbK8N3wIeg3ACfVuCww7OaS78iQUyhMqgeKA15aacwFIHeXelgUjvDvhNQjBTXUq6xRbhZh1JyHPz9qo6B8wQsheLPe4Gh/S4PMxFNdgbvDstrV7L8T6tXmA/E92sl8ceAznh+Qz9dLcOaOxDWg4MsWN4dOqY5t7w3sZ5j19j6zCbkoamX3UqtUsgD+2OOfCmBpJ/bhE+3+gnjj+la5tmKi+4KNAIKjRTupSj8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiGv6lUMGQUeAGEMQL/+x34mpIHzwmBkHKJfVNp8y0E=;
 b=bf2U1DEHB/ULFWx/iWPK5K5VYgdQiYoEkgxcTzZI16n2RJKgp7T9wFv+s+nLp762VgHDCJc/JtN2jtboDKXgYd73ki/Y3B2Y9upZDybrGSu6n0+2oqbxRAqCDyx6REI5giXz70ryl91oJA6Vyqu40noHTQ9A/ZgPfcJjtS7IjjCrDeqBTG7Hrzstcc7jDpwYg5BvJHsKTvD6fTDCkXCHp8nVDqQXgePwLo41Si4CTPsGmnbZziK/aKlKYmtqIIB83Bv9Fe1MBqhZmluxavx6tNn5RH0K35pc6mEPizCB00/N+gskBod/KWSa777Lgc9rlgH962B1s5G0mWLBkG9V+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiGv6lUMGQUeAGEMQL/+x34mpIHzwmBkHKJfVNp8y0E=;
 b=wCS0lVOwIxjwAF3ReGHdncr0dxHIcDTWUVHYiX3EE10xRsGk+uYtL07K1Wttc50ycw8b1P2zyCpjgKlT4s3rZVaNQ27eK0N5jjjnXb3wjnTVT84etOS/jsh5DO0+Y/sX9UqKVI7ZpYNhnSbcn7MUfNXnokvFVjLYAN38SGI6bKc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4848.namprd08.prod.outlook.com (2603:10b6:805:6d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 20:51:08 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 20:51:08 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [RESEND 3/5] dt-bindings: input: iqs269a: Add bindings for OTP variants
Date:   Wed, 16 Sep 2020 15:49:58 -0500
Message-Id: <1600289400-27632-4-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600289400-27632-1-git-send-email-jeff@labundy.com>
References: <1600289400-27632-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:805:ca::34) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN6PR16CA0057.namprd16.prod.outlook.com (2603:10b6:805:ca::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 20:51:08 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11741f31-969d-454d-bada-08d85a823cdb
X-MS-TrafficTypeDiagnostic: SN6PR08MB4848:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB484851C5BCA427DB4E6690EBD3210@SN6PR08MB4848.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +asdYgZB43IVSwIGNFrSyUn+8o7zMO2ySyoHHiawqOBa6PT1za8MZok4cxwxY6wEffbNQDRkIiRbzIaZSuG0yeHZW8O2lvQi02BS6V4y4hRkGwtUnlHnyEqJNpp0hfgh2spY/TXJeKk/xs3lL2oAM+qxReNnOjEgX1+58m1PHjdI3adj/UYal7E39RC5HUqIwrgN4lbKcb9lRURkoKDQ3F0Znirz6g4XDyx94Oj53EoUjjmkz653GiR/DmHZeuqc5jZury3LRspqXQU3BudFu7j2POUgg4YuMKfqKohxieOvifzNFQDb2w+Q6Ig1biotv/AeJAHi5kxe5aR0RHC/y/YbgAxcKHSj0qP77E0ZVtsNcRnBg0TBihvIp9ps0QLZ5hVZkoaPu7cuqI247Vq1MGcJT4vCf/WgOebixnFgwPeXFjRhzgf5IYcTqiVLePCl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(376002)(39830400003)(396003)(69590400008)(6506007)(66946007)(8676002)(6512007)(5660300002)(86362001)(66556008)(36756003)(66476007)(6486002)(52116002)(316002)(4326008)(186003)(2906002)(26005)(2616005)(956004)(6666004)(8936002)(83380400001)(107886003)(16526019)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: aMPHCW726/RTItrcQWgUg9BlKFbfOKysBxFJxE0zcZATd/M7nyrYYHJ6w9l4ocMWHaxDxkBMM/q3RwMHbUb/mFdKzDdU+0MEtwRaoOAcyS2tiUUdYubcpq2Q3LlAbdtLn3vHA4biQelTs0lIkC+JIaAW8vZpuv3ZjwiTbjty0h7gfUhjEOfjBad5hbBp9XeD+U7lUWnVbhdFec9YHC+dUj5H23K5iiTZW7tqF5vdV3Jnxg+shUoWlvmRygXxoy76uvl4/ZqZzQ5DkXF5LxBrhs0q6hOq9sNfO7qBEMh2mppZ1elyYmFIcpJbO0P+frHAuNqC6paSf34EFgjSXVFTgnQVb38Z3gwmBo3AzK5lk6tG5SnY3z86hitPIKczBJqZrAhJBAjl/MaeqXh1GT6XEPQX8CeaC+QSwT1GBCbLSIt+I2z/xcttVNBTLGhg5Rky+zCLcXFarWUDHvt+kurbrlHtC6YgppJxFgBUzrJouGRncwp++KRKB+IuCLRJxE1Ygfk3YJWFAEpMAoWWwSSCrj0pFFDkBxPe1ASX7Jf3hUF4ptnfwD5aiKKrr0ckYADlR6blRKyWStbXCzz9EZ/LVVv69t+eXsWQkwMVwyRoPBAuYoEkiITXVFMbYiatnJ+HbEyKMKJYZ2xpkkez0aGhaw==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11741f31-969d-454d-bada-08d85a823cdb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 20:51:08.7855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnFWnCFVNI2d8W8otHErKOwfS21YCvSk7y/mdH4NUQlSKCFVsaciGWQaU6P0vRCD1K4h8L68AwspoEM94ZVBTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4848
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

