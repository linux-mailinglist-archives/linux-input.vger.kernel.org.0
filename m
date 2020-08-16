Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1232459A3
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 23:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgHPVPG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 17:15:06 -0400
Received: from mail-dm6nam10on2059.outbound.protection.outlook.com ([40.107.93.59]:32963
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgHPVPF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 17:15:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJzXbQBR/3Uc/RZvonJ79keMYr9PtgH3rrx3QWjEBoFancLc6CSilNFkzSjTXdhf79c5wnLahBDpq5Uy+0tZ++fjyA75Uq9KVS1e9ofQfJFLyLAuUxBM8I0yNy6x8CPNWnU4JbjaXhtsgDIWLwe7AfM5xAiqFNCfJnxTCqiA4P0lc3BVsXUT1VXLXzurFVx73oi2HJqAyXXS/lDeb6obZDQxPVcn0pc0txHRZcwNdhvJajGmVk3WUvZ0vWuqyEhWbqHT/czwcltrL+TqAdLpDbU3NdD4/cbTMMbV80CiAJg6DQ+I5BOFMwjYztJcTQtdUaIucf3uGalb/aMs6bOffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys8qGZuCkJQq+Fvfp3QROd8s8RMA2dIsbBXjErkIA3o=;
 b=Si2YkGQz58fgXT1FK5VY26ulBC4/vE7jibIbczsNhL4zZZJUzSEXj3mUx7kzO1FyhTHa+303fME3suIrBHKuxKxUHPPPoVy2qaxDcrug7LJQsFpbyxd0shJv/5hjp6PI+VVqd4arfZ9DXVieQrW4gYKS3nB1yHuAK2yUVhc453KLekgJ1Bg5MEiRxRRpC79P9ZolOBpBR4XadsfT+Z4wv7pKtzMWCxFJ0+7MnsrcZJAy/ke8g8YvpWwiZ8n+im/NLQ/NVgA201r1Hu8CVRgGwgj5rq4MpP9JZ/W+Q4PM31vQRBrpymHRNn/wFOKzCl7LaAcOjH7HAhf0eBfN/3AInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys8qGZuCkJQq+Fvfp3QROd8s8RMA2dIsbBXjErkIA3o=;
 b=SfJJTRcrMoSLPBcEqbcoLhkty75slY1VIQaV8oTQA+aM1Zs4kZOClVWRmvvUDaJ10zyKU96R8NZkQMLkEpoKmqsF6lfG9nB6SyrwRePzjWMaRI76v3w6U4FJZajSSQe59H7GoX4UY4typwDfGiaifEVom0wcw4v6JQ1b4cBJy1I=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Sun, 16 Aug
 2020 21:15:03 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875%6]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 21:15:03 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 1/6] dt-bindings: input: iqs269a: Add bindings for slider gestures
Date:   Sun, 16 Aug 2020 16:14:22 -0500
Message-Id: <1597612467-15093-2-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597612467-15093-1-git-send-email-jeff@labundy.com>
References: <1597612467-15093-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.27 via Frontend Transport; Sun, 16 Aug 2020 21:15:02 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 515d1faf-201c-4767-a455-08d84229710c
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5631742E8D3EEE26455763A3D35E0@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgStnqI4LR6Nu2Sroos4zeK6DHlXiXwBv2ll1TPDrNAKGElol17pa0lD/pLpktUNml2YFDgtuLaf9FQ9Wb6+zsTbpGUqto1yRZaQaAMD6ssdg8h4Vt1GkWUFzzmhV+PhrdlKOmqqTLPF0Pvi4+U0/Apcmlo8i0J5up2/Ro4SWo/vVHhiV2NgofJQ0GDAnrlypDtMJZ3uN/lgBH8b7DLDO+lMyVOJTKhwl6gurqpuvCettl0Hxz8vNo+o8J4k7pc67cl130ojFgHBN9TFV5InwKS4Gq4j1vLm+xdu+leNDfFghfOW+nP22/fhqi/uPf++fwWf+tVvAq8zpwiH1SHK3X6SBT6R+YWe4RJPrXYT/FN4HbSeoVJkmN0K99s4f4pu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(366004)(396003)(376002)(346002)(66476007)(6666004)(66556008)(69590400007)(36756003)(4326008)(86362001)(107886003)(2616005)(956004)(316002)(16526019)(8676002)(83380400001)(6506007)(8936002)(52116002)(6512007)(2906002)(478600001)(5660300002)(66946007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: odvYUVrEI9rB/0Khjlkj+y5/pphAHLxorndIjvQVZuXEO+Ng5q6RscDISNj3ymZAPi+X9s+2DgIsn7lzk5CgLU2jaPXgTEyVwnP0cUK5Tx62Raz5QJQgfYv86mFEdF4dgGQGwvrA9savxKFnKnozRUqwZV5Zc5+Cffpd5piOqdAhmphRSh+gm2p+Xk/xpv9OOVgGdN/E3ePWrIP4yXiVOYX8g/s7EILA9hKf1NDKg8nLKzRXJ7LpOEG/skofuXIib+Fu6bWAFiGYB/QVpois/Ye5WOCTk2FiGUb713OFFjr9XOksubaUx5cucvMMmZzmmo1BwIsiTdTQjWISaW2f17G/o5TvPBtPqF/J3IxXcXUZxn1tr+l6HWI9uJG4NpYSs3iVZSNgLMVMTudJhcw2ZN4XeM9HTUpiLIE/fKwxH5HE1mULKsfvP13VMOEqAzJ3J9n0PJV/tlrZnNs9cW4dqG8Nr4+UX4nXDIyLCwoR6C3Bd9tjKyEIzd8VBzkOLSNzywhlOEq4cDMbpv5n/4mPMcXs8xB9W/XV+9JKAI2TtnwsdrKC0kc4dViKGOtqJSBixURYyDbQ2rijbDuaTX43LZiNP2rryrMEolYieFwb8p+O06UGBZskJM5J9/zN61HMdwCgR8bSOyZkNy/xF2JW4A==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515d1faf-201c-4767-a455-08d84229710c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 21:15:03.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzgJ5fBO1BYh48wTk94xleimLPCt7sZWWfN6N/bkewWZ4qh0uW346mnS45W03Xfp64rt7jEr2ZcDLWmG/rBhtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for slider gestures that can be expressed
by the device.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../devicetree/bindings/input/iqs269a.yaml         | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
index 9c154e5..e13812d 100644
--- a/Documentation/devicetree/bindings/input/iqs269a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -61,6 +61,12 @@ properties:
     default: 3
     description: Specifies the ultra-low-power mode update rate.
 
+  azoteq,slider-swipe:
+    type: boolean
+    description:
+      Directs the device to interpret axial gestures as a swipe (finger remains
+      on slider) instead of a flick (finger leaves slider).
+
   azoteq,reseed-offset:
     type: boolean
     description:
@@ -204,6 +210,57 @@ properties:
     default: 1
     description: Specifies the slider coordinate filter strength.
 
+  linux,keycodes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    description: |
+      Specifies the numeric keycodes associated with each available gesture in
+      the following order (enter 0 for unused gestures):
+      0: Slider 0 tap
+      1: Slider 0 hold
+      2: Slider 0 positive flick or swipe
+      3: Slider 0 negative flick or swipe
+      4: Slider 1 tap
+      5: Slider 1 hold
+      6: Slider 1 positive flick or swipe
+      7: Slider 1 negative flick or swipe
+
+  azoteq,timeout-tap-ms:
+    multipleOf: 16
+    minimum: 0
+    maximum: 4080
+    default: 400
+    description:
+      Specifies the length of time (in ms) within which a slider touch must be
+      released in order to be interpreted as a tap. Default and maximum values
+      as well as step size are reduced by a factor of 4 with device version 2.
+
+  azoteq,timeout-swipe-ms:
+    multipleOf: 16
+    minimum: 0
+    maximum: 4080
+    default: 2000
+    description:
+      Specifies the length of time (in ms) within which an axial gesture must be
+      completed in order to be interpreted as a flick or swipe. Default and max-
+      imum values as well as step size are reduced by a factor of 4 with device
+      version 2.
+
+  azoteq,thresh-swipe:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 128
+    description:
+      Specifies the number of points across which an axial gesture must travel
+      in order to be interpreted as a flick or swipe.
+
+dependencies:
+  azoteq,timeout-tap-ms: ["linux,keycodes"]
+  azoteq,timeout-swipe-ms: ["linux,keycodes"]
+  azoteq,thresh-swipe: ["linux,keycodes"]
+
 patternProperties:
   "^channel@[0-7]$":
     type: object
@@ -487,6 +544,14 @@ examples:
                     azoteq,hall-enable;
                     azoteq,suspend-mode = <2>;
 
+                    linux,keycodes = <KEY_PLAYPAUSE>,
+                                     <KEY_STOPCD>,
+                                     <KEY_NEXTSONG>,
+                                     <KEY_PREVIOUSSONG>;
+
+                    azoteq,timeout-tap-ms = <400>;
+                    azoteq,timeout-swipe-ms = <800>;
+
                     channel@0 {
                             reg = <0x0>;
 
-- 
2.7.4

