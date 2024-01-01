Return-Path: <linux-input+bounces-1065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD1821532
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 21:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C27721F21542
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 20:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F07DDC9;
	Mon,  1 Jan 2024 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="t2HLRW+I"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A8BDDA3;
	Mon,  1 Jan 2024 20:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6q5XOaWDx2BahuOkHbH4w3JU6txbeWuEaMZ7xkJH1Yx7unwgiJbqh6sA17WbPwtVJeqKSBhVUPbwgmnKXBsdW9I/rNVshf3mGBAgwhGXyLQkL2Xhe0AgLEp9EleBb6LYkWcnGDWJftqFUZ6FU51vHmr1MuFXVip6j3iRwNgvzc6wTh2v10Buj/1MEERct0bvyPuYwtkzH04Vsw0BAD0nvmtIcSqN7HuayUEz449Vcgv3CFf21OIwAm3S86FnRyhYEvfZw0ZxNmL+3zsKGfcdIgw1aKpWgoKOlTtDx0fDlX2RH+hSBUOJ8FkLu+Sw8COeBwv6tXRrpH1UwIrcGbuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rml6F6bSp61M75Y1kvqxFht+16k+zS36AV938sxmSC4=;
 b=ke4VaLCYYn2RiS6YrSNM6dK2epemiK+/lSkMAKEuZaPnOlcxq6YT3Ix4LN6Zog3+yHnt4kGaFIuyVA6Ijfauan9cabPouUxA3GVjCwNsA7fA5cAnpm8K+eVm9qU9WNeLeSgpTcEqpMe1Wrju1FwwunCcLmRh7nRHEid9m5TQBepTeMFZGnpXwSjPo2Py3gMw51GDo3KVJYpNTrKrNTPdTK3ZxmSsgZ/DUmlzY3kr2eiBghL+VFJpTc5WcwxGHuMKE0iUtKKqsOD9RLMf3phS20v5lhzhfDA6ZjIOUE73PP65atjUvlkroUBOsN8sDys5gm07hTuM2cyJQbs594OE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rml6F6bSp61M75Y1kvqxFht+16k+zS36AV938sxmSC4=;
 b=t2HLRW+IKCY0+amPzTVaTJKYisXRqyanXCCUrkjTv8WV3RFRgj545f1AFZmXfWBetq6i3Wjav7ADs/7rLNhsdC0CcjcYPNuMSemq1ZWaHaIxYbKk6Hb3nPk6NOOjQm524EIRrQw/1tnXsVakkkpEnbKGAKsRatQaWNBkakpCkbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BY5PR08MB6423.namprd08.prod.outlook.com
 (2603:10b6:a03:1e3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.12; Mon, 1 Jan
 2024 20:02:08 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da%4]) with mapi id 15.20.7159.010; Mon, 1 Jan 2024
 20:02:08 +0000
Date: Mon, 1 Jan 2024 14:02:06 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	jeff@labundy.com
Subject: [PATCH v3 1/4] dt-bindings: input: iqs269a: Add bindings for slider
 gestures
Message-ID: <ZZMaPrbSi4IrzwKF@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZMZzeX77VeHdIeL@nixie71>
References: <ZZMZzeX77VeHdIeL@nixie71>
X-ClientProxiedBy: SN6PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:805:f2::44) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BY5PR08MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b6ba11-4cd0-4ff3-1154-08dc0b0488e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9BZ1W5T1EOUrT8reQe1uhqV7tPiMZWX5cdkXt/qVhfy/R6EyHB3yQbg4PeSghLpCkRTA4tXUjrq61BlWgy1FPnwXZ3nuskDPfEwMUh7TwWOHUHb5hdxPyk9CVckAChbkWNra7O+EfBefSjM5Ww11N/L2Vjr8FTy9M+9aHTMenWzJBIdAGJ0JQOnoRfhqguXlnBdLnrcbmfAZvHHz0WVvj6VxgFJarkdVLktdOVnzW5Pd9TTdC5c6mjdd/qZ1oUw05dj6unekk+ZRw6hSG5+OwwQ+LqNdXHFMbl8dJWHKRX8I1MgrkkycX4iOu9hyHXFh6nrt8Vfc7jtqoQpkSMXIw1lUXRMpxQcw3AfiD+7bI8cJPVtn0oLXRpOJ9BHTI4D66MIv2hh3IdeYAjnyTT2MrY/MlTQjwtavDiDGIPEahOKaGK6a2nmXuO3OmMGT0W3ura0lmXMURXRlbPHKe41vHNSoPOZEV47wXEkYhiBj+diR8quiLDvTgh30NC3i8PfzE/QfvVu9LWZkQxIMmLO7dES65bzo6OidnIKKOPfPB1eJSKaVgAmJC45vJP1hE3/w
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39830400003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(5660300002)(41300700001)(33716001)(83380400001)(107886003)(26005)(478600001)(6486002)(6506007)(6512007)(9686003)(38100700002)(86362001)(66946007)(66476007)(66556008)(316002)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fl/lAX1BJwnw340RBrR+ECvDRbhPnGjeymtSyv1mh8yJxU+/yKiw2UxCdPfl?=
 =?us-ascii?Q?VZXpbwEj0/XAN0FLZMX+/Yc9p51fLi46aRF/r22zcm3NYJrO1rdTOx8kOBVf?=
 =?us-ascii?Q?2sndcfaVfRdRrTEwcUPWSv1wkMn/axeq5GF8FOdzOvHk2DHZjl5TfsN4uN0s?=
 =?us-ascii?Q?ObFR9V4rF+j40oSKiEbKHneIu+i6yFZG982hQI2BHESdvKYy03czY/dwlB/I?=
 =?us-ascii?Q?WgvpjhUymHfukEneIhj0+2g0Ukgs0gVYj727K9KHIoJveeD1TMsWA3egLDc/?=
 =?us-ascii?Q?ou6uIgaL0Zp5RuM2z4YrKuJIe8VsA2aS29cJKfVjgeG0CrsrbznDyFBUFCy5?=
 =?us-ascii?Q?QazHNx3t566jiQmWYtLRt1MEygC4XrFFnrsRf7JH0D1/I/knOKcQz4QUVjJp?=
 =?us-ascii?Q?vA4+wOOXr4iEVArUvWRRhqwCETUaaAIbla5pt2W4+JpLBi32IVQueiDHYnVM?=
 =?us-ascii?Q?1xacz/1JsIYcJWpbNXq++Cv/qhxBUJqKBdvxOjrMYm64rsbi7BfUpJqN8820?=
 =?us-ascii?Q?6ggn8ToJ5RoR0Mzufookb/hzndiwwQqGZMLNwXMl85vgjhVTh6cTa4c42DZu?=
 =?us-ascii?Q?dZcocYPBFEYJ6b7GaQ4yFeO8cWmUUcfPbpdk/Ig6zifmD6tBG/nKhgCo8vq2?=
 =?us-ascii?Q?ZaR8Ue/dXmdzi7FN69bPRbxIKr67R8bGe6FpgycOIkoWeuSu/Nv14T3YJczD?=
 =?us-ascii?Q?Uq3u9VhEOWCb2CcrD4bCFMx1YpaVNcbB9O36zBokd9TWlPN8k529lCTbMwEY?=
 =?us-ascii?Q?Y4jfzo+DTe1gpQUYv1snR5Kl3KmxDacr+WTt7WXzc6qJtwU2MjoVwWSjz608?=
 =?us-ascii?Q?n+eLJl3oMq/n9PX3qZQ3F6rIA0Z9h/RJq7KEBG8HJYWnqNNSaEClEbOXDZ+/?=
 =?us-ascii?Q?4V+7MxaHPuwfbMvce5s0s/a+hiR8OGGVjR0LYspBEqYaxjFJEfz1CUk+PwwQ?=
 =?us-ascii?Q?Yk4KTYipKrnW9S7Q6PPjfehuLMx/0+kHH3C856zWptWZ4ah0zjm04a9SDHti?=
 =?us-ascii?Q?V5h0hO9UBeWcmRE2Gp2gfQXyaPQ4hdLhvIePirgtTS+VO9JMztGX0lRZ/1Pj?=
 =?us-ascii?Q?QSr4hoy7D+6TpELmBxSEthCIH1dm3TllpYzvsKEsNyH/B/7R4YK2HiJ0vmjc?=
 =?us-ascii?Q?gSCP5q0m4IvUPUdO+6G1tECS1KJOsB8AajqZlBkWD3ymhl5yObpz/63yZuut?=
 =?us-ascii?Q?ulavEeSU6MDflb9NtGGTr75Cw8CfQEkCWZEceyAmVDll0B6dL2claZqnKRFk?=
 =?us-ascii?Q?IPOBeMqfYlO8SQPpRg6lAjuVeWr4z8nyffIR0lIQIVt6jDRYQulgH+CkFOcE?=
 =?us-ascii?Q?4m+90p9lEqN8G0egY9PCOL8Vc64hzxkjVrHoKIY0rTrBenKRY0vbhKLchtis?=
 =?us-ascii?Q?Fkoo3aDCKGeZZe2/G41BDuf2WmLXtglVjGUnG4XtKBBlgUkaCRGKo1zymZ24?=
 =?us-ascii?Q?aC0m6n4ZW60wMKIyGPaco3I5N5+lPUzZDfhfcEJo1HwZYMWlFv5UehWrzrHv?=
 =?us-ascii?Q?sHQrqngCqGEeEXQ0XrVFfmcKBpFZm2FNbmThJ+RCbfAHfTJ7GYX5G5uZeBmo?=
 =?us-ascii?Q?03JnI1ePYduGcQSjGsz0vkFDRlG5CcvvmquadOVR?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b6ba11-4cd0-4ff3-1154-08dc0b0488e3
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 20:02:08.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qoW0z+aUiWri/UL6j20ikt1UDgojx7MZIpJkLK/6XjOk4WpSYP/+G5ivIpavbvVcRECgVowC0znz0REWBmPWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6423

This patch adds bindings for slider gestures that can be expressed
by the device.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
 - None

Changes in v2:
 - Renamed 'azoteq,slider-swipe' to 'azoteq,gesture-swipe' to match IQS626A and
   noted it as depending upon 'linux,keycodes'
 - Dropped the $ref declaration for 'linux,keycodes' and referenced input.yaml,
   which has since been updated to define this property

 .../devicetree/bindings/input/iqs269a.yaml    | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
index 3c430d38594f..b42f07542d27 100644
--- a/Documentation/devicetree/bindings/input/iqs269a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -9,6 +9,9 @@ title: Azoteq IQS269A Capacitive Touch Controller
 maintainers:
   - Jeff LaBundy <jeff@labundy.com>
 
+allOf:
+  - $ref: input.yaml#
+
 description: |
   The Azoteq IQS269A is an 8-channel capacitive touch controller that features
   additional Hall-effect and inductive sensing capabilities.
@@ -204,6 +207,63 @@ properties:
     default: 1
     description: Specifies the slider coordinate filter strength.
 
+  linux,keycodes:
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
+  azoteq,gesture-swipe:
+    type: boolean
+    description:
+      Directs the device to interpret axial gestures as a swipe (finger remains
+      on slider) instead of a flick (finger leaves slider).
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
+  azoteq,gesture-swipe: ["linux,keycodes"]
+  azoteq,timeout-tap-ms: ["linux,keycodes"]
+  azoteq,timeout-swipe-ms: ["linux,keycodes"]
+  azoteq,thresh-swipe: ["linux,keycodes"]
+
 patternProperties:
   "^channel@[0-7]$":
     type: object
@@ -484,6 +544,14 @@ examples:
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
2.34.1


