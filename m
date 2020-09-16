Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E68426CCF1
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 22:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgIPUvw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 16:51:52 -0400
Received: from mail-dm6nam10on2061.outbound.protection.outlook.com ([40.107.93.61]:48609
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728586AbgIPUvK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 16:51:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPetkd4WIqIoNKBiDpSsFXxREkNuBiMxxCv86hR/POsAvdD2pUt3MIKmq0Eli96rN8rLQlSL8oi6vsDcDgSWiWTwS6LCVJMA0h8P7jiQMPFE2S6setlDB8r8rOX4zHE+Zr2h5102WguWPZWsgmhpiirQcoCy8b8Gloi6uFJ28Mes9d578mNFP612lSH0RG6qU1vswZDnZuJnuEa0XwahCR7VYRh9r1oqovGGD/f20xrGdaNScbnFWXVu2qPG9d1VZuOzFGI+vXmF1gddDx2BOem7NvSGuleAMy2KxLy5/voWL9E/T1ZKKXidYO1ar7VjKfH3m8/EUMQ7YQbCJg9/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03BF4GsV9zNb6I+owR3AmF6hCvPw2B0akVpCn4SSV0E=;
 b=gYeww3IRk12udH6aE57OxojoBQFewpr7co4PT8iteoDnVzOITvW23M4ECqkrcE3/TEh0h2youF5Q/YFwPzFWMCLuzxWLIOgglu4sNfMbMeuHvFFf66t/oB/ewPcbPF2qJI/AUZ/PmroGf7K+hmgNiZ/v8G4mXEf0Dsly8Ds6dxZvisUbtpAXqXxbpRkT5S4EU6mK1LGuRVewsN/+TaAgyq3+cLUQxbEXCXLtxpxzxTSoiuLCt6Onv82Q2oYk9Lt2R22CMWFKsIgRLG0pkqqnjrGajz3gQKWZdOanfaP9b2ASUuGUW69999l/jSGye7K72cPznAn3i36o1OOmb6yp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03BF4GsV9zNb6I+owR3AmF6hCvPw2B0akVpCn4SSV0E=;
 b=DQNWwpb99YttknTiIsX1YCRP+4FtTNEwciqhC8Hp/dgC5y4peOh1lWZfA3Gaui/d9npEN81WrkF0aIZS2oKv+NjC4pHMXxVSJROb4d5ViGquSoctHu19hPEg5UcJPHmwwNN4fpnirrny/gKHQ0lSP1/QRSvpTzrW/uhqQovdS4A=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4848.namprd08.prod.outlook.com (2603:10b6:805:6d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 20:50:59 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 20:50:59 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [RESEND 1/5] dt-bindings: input: iqs269a: Add bindings for slider gestures
Date:   Wed, 16 Sep 2020 15:49:56 -0500
Message-Id: <1600289400-27632-2-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600289400-27632-1-git-send-email-jeff@labundy.com>
References: <1600289400-27632-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:805:ca::34) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN6PR16CA0057.namprd16.prod.outlook.com (2603:10b6:805:ca::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 20:50:59 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4cf3494-f529-4c35-7647-08d85a823775
X-MS-TrafficTypeDiagnostic: SN6PR08MB4848:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB48485949FD934515E29ACE96D3210@SN6PR08MB4848.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NK9luN+clxdYkHOUH1KlWXGa45/N07YL7zSo0W0ZMvdNDr5Z61NJWManpQHk7sUzSwkeHbbBz23htQyoYeQEQFQZkS5ou+sJYXs3kxvazgtfYFBGparh6ZAi/44XcZKMSla+MWxGsaS31Pe5s7NNPWzZD3xlMkNjFNg1OE+r15SurwQ5ymsTw05TQc87+h8Dqh3WXApvb50ynNVdGVsA44bQAWkbNzEmPPH8ff3133W/HWyYzB0O/SRXJCgNoAFKOPzSDfutk5NVZsa80BoeIMCFj81ORwfRi+nYpLerpFMVKrD40+vPY3t1cA+fxMK2kAgNxklpnTxSrH7VEqIQg1edZitVG2X1D1Cjr+B1F2R0AydKBD/HffDrK00XxBRtXfhIQmqjNgGmgBq1ghl8CMbBLvX+eJsy3GRiSoka8z4IOAM/2IWOhGUxgJOEhVNI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39830400003)(376002)(346002)(366004)(136003)(956004)(316002)(4326008)(2616005)(26005)(186003)(2906002)(83380400001)(8936002)(107886003)(16526019)(478600001)(6666004)(86362001)(6512007)(5660300002)(69590400008)(66946007)(8676002)(6506007)(66556008)(52116002)(36756003)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3Z2z+v8zvtIBofkSKMAw4/puOVW9emCHbsf124C7n2ATNAgcg/VXR8FTUekx114kOFaDjyinZhN9RuXGvwK7cPJnTXRcRxbHTgj0rP46trTW4+ZdrKvVRluOPNDIVN00MrYqjWuHc3gsQrrjOviGwXQqb2Uu7CCpOT+vl1CiU60TBAWbjFblD8SkWYV1CxGNwavpsWJUaw4mXb8Y6gGGyIkk39tBmNnhVCMkOSI/gg9tIr4wMKsXEUAUOPlpTKQ0zgWSZPS5OAZpP8QAP9ABsIIlMBMQieGEPJZS7tT5U0wbDTRxQbotqyefjQaBMYbmwVXX1Kb6VouELTJDtskS1aPtvuFUeAsHf3xDNCi+lGOkktepMiNxLNGZrAtDVYztuO0eRg4BazdqeyxgHyAiJ2JLBUR8Qpb3EH7nIVyD6AQMZRm9Mcxgvau7XyYxqsiXi37ObzEXlsaOX67fs5rzpYsW4aMPMs0cbntj9EQz7yY9R1OmT4jEMxDHcbdESSV/z74Z9Y9akcBIoWR8sXD4q65rsrXGY5di7ljTDDVyUuOCqWA0umNJPmlxbXI5zRgfPhls9O/7/xIDXDi6taUakI4HDKGGHxROGrZvkwI9XMa7n+p9oRh43pt89O5W5ljPWL0b3cwib95RXiHK+ODDPw==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cf3494-f529-4c35-7647-08d85a823775
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 20:50:59.7577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApGIdyB8lYstMjOs+ukH9Q4rXqc35+4JrFTBWmZedWDhye93Z4uiYZxzHdUh3UkxLShyRUAw9GBMvAu/ivPOFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4848
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds bindings for slider gestures that can be expressed
by the device.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

