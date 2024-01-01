Return-Path: <linux-input+bounces-1067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3135821536
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 21:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6877C1F214D6
	for <lists+linux-input@lfdr.de>; Mon,  1 Jan 2024 20:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41C7DDD2;
	Mon,  1 Jan 2024 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="tW6LdFbh"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB68DDC5;
	Mon,  1 Jan 2024 20:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Blz5YYNwcXFNP4w9J5mJFmrvJN0tJV0v79/1W8oElengRzpOuQwbOkly/n27jTUo/MhC5iwbrJXIFXZv8FUfzm0oL7Rm7gYhxIw5zDasFTt3xsINEgstqHkvyoSyUIK7gUXGCHQd8qZW6MuRNMrvfJmKMOH2VO86cpTmXo5ePvcDSRp8C5XtUPsDwPc4WZndqXLsmh4KEOK2OlGMGVz1JT1GHX/KJMyZiTbWZ75RbMsP2xkxMNFuLFxrWglEdekitpqJ6wq3pgZw0f/52u1hvDa4qRwsBWb1zseHy34+heZv0lo/bMJwqLV0qY00uSvOYb/+zaMCPp/3k79rOkZqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5dsOlwRZCEVOolfoPTSFAsien1bsaD7/eaQPhvfo48=;
 b=ogoJWw7R6B6KdBuyZ6nSIyN7mHTuoS2gmZ90+XOv2Vv6TA3DquZYUz1Pl8dUhsRzr6Dq+Y7dUqpmihhduIvXYhZza1YADtAYzP1kGGFnVHaUo9XB8iH7Rhq35v10ZUhsf0uA6D9z6GkA8QcitdT2ce70usKJHWjkOyd1EOAuKj3fYC7q2wfVRGwqpRCFmCQbdhq5G1BCE+zhey6QNPfmqx/DnprcCy6nb03wzsbejvclZ+/Pm7Sw4bNVVAkd3EQq4eYXP3tXyy+0SL3iQpEhiko0W/3si7kXUNDkHA1lLPnlRFRvGrK3nFNC1myxNsydQnTN5j405QsS0vxsefD7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5dsOlwRZCEVOolfoPTSFAsien1bsaD7/eaQPhvfo48=;
 b=tW6LdFbhY9Q0o35NS6AuilxgTMc9AVUfzngcxgmDYbcHUo3/U/wSkIOJVPQmF8V33mvXAsnYEuhlkoeoNqZzaC9QGxV8NE34uXrbd32q2l/L5y4huQvVSA+JrI6Y3GwMq/DGChootreOFV2xSbHGJlaSquzrQ7m6wk+SFrcD3v4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BY5PR08MB6423.namprd08.prod.outlook.com
 (2603:10b6:a03:1e3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.12; Mon, 1 Jan
 2024 20:02:37 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::36f2:78d1:ad7d:66da%4]) with mapi id 15.20.7159.010; Mon, 1 Jan 2024
 20:02:37 +0000
Date: Mon, 1 Jan 2024 14:02:35 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	jeff@labundy.com
Subject: [PATCH v3 3/4] dt-bindings: input: iqs269a: Add bindings for OTP
 variants
Message-ID: <ZZMaW9RkQ9bKXOUn@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZMZzeX77VeHdIeL@nixie71>
References: <ZZMZzeX77VeHdIeL@nixie71>
X-ClientProxiedBy: SA9PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:806:22::30) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BY5PR08MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a16476-42b1-4dde-2113-08dc0b049a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZapC0ZSw+OF0Wmar1YJHvZX3c415iVtAYsDGLoAD+F39c5jyF6EPCdR2lBMvuCqbLevS7IETEPIhMzkpvPjnXCq9Lqv4F7wLssx3Yr/0esQvh8eFgtnhfM/Yr8tKIYyLgR7cv4r4OM5ZI16He2F+FeqX50IeG5enGwhqwabbtr+pC+LHgTleF1h8TGf8gSy6+CiOyHZc6W2SqxN3kHnBer2fE3rszLBDJhb8DHROxQoE8OoFMayaoiTqNYzDa2rN9o0OVuLt6wiPxi4NxPdXEjw2P+W2I04bislMS9bH7Vob4qs6JzP8GLypsth9ZQBunkt5QqN8levdPwUaPIt9Apk8qt4aw5hE4e9NTwKCcSLxd2hzBfU6RcnKniVJZUofw8LYuYLWNEEScVJlRNqeqQ/02LA2r81gNdQo6rBK2QXjt2iFXWSUJt5s8Vi1cpLKvlQFmHc8b2amyCUh/9gCm+Mzyn9R713or7NSmD85bGq2zYImQzO1LgaSsZXd8dmGnIL4/G3lwYDkpRytUUI/dmxjKJO4e0T2VyE/g82UqiOBApt8ipx30mtVi7rTss3+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39830400003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(5660300002)(41300700001)(33716001)(83380400001)(107886003)(26005)(478600001)(6486002)(6506007)(6512007)(9686003)(38100700002)(86362001)(66946007)(66476007)(66556008)(316002)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?as7USoY5iJVsYUnsI3YLMC1pyOyjOqINhmw5OzPrUxe1xjp6jY92P1BSKI25?=
 =?us-ascii?Q?+MqCTpKDgcyATjcMgoDbfri6oBeL1daF0WSlI5DvaPqR3AoHRtoXhPPw0FGi?=
 =?us-ascii?Q?Y1OD1I1Hr14pxdECWVZFaghBKEidT92gF17XfPJrurR9OfGPWSVlyCg8IThe?=
 =?us-ascii?Q?FUP/D3pIOEP+GLsC2OTrP4X+JIaxuaXTLwxp4uvCQRAtuO/wHVEybVTCMV+V?=
 =?us-ascii?Q?M+gxjOhRsfvKXsDS5MLy8H9xU3UwYYi6Yi8Z3wU2FojXSdDdWUeoUuXHPV0E?=
 =?us-ascii?Q?c1FkxzFvs9uQFZm0RoQ23N2aUE92uGe4GTLb7gD1BLZQ7YHmwrOP6C2RbJ/w?=
 =?us-ascii?Q?2bhcr1G3a4Q3hbIbh4PVqSviQzo9oAQJvkVaZqA9EMdpCxJUVY/gHfClu7qQ?=
 =?us-ascii?Q?H+hODezJyIITYp3dKNedTRKUT9p83jwh+zkGdAwURJpQV1TC1qdOsi2k0/Nv?=
 =?us-ascii?Q?gUqgR/TqOFSZDifGdt4yQ90nZBKAkYfMoLmK5rop2JIALGQIwwihYyK3iL1m?=
 =?us-ascii?Q?tOvrDSap//UhESU81FPzsmH8DD1vkvsqhlXt8+s6A4fhPIK4H/K+taIwPB4U?=
 =?us-ascii?Q?YAT4eCjulLodX3YBFoWC70e8zZPqXCy2Y4X57FneuhlSdNMMUT1dtGgrS5uP?=
 =?us-ascii?Q?TUMjpnCSET/aszwK/4jHCPJmg3buT4wFXfjlZqbLjJ9GRXbyTy1wMb4I+6DH?=
 =?us-ascii?Q?UQhzguYo8pxuDTWrdqV/OEsqw1wH1bBClMMaGUEvvJo7NuwLT26grLWkC/vQ?=
 =?us-ascii?Q?zI6MaMceXxY5U1SU1CMJ64NASRFZ5M69EvmP+gdS42M7vMbPMRJqJ7NGbkmg?=
 =?us-ascii?Q?K5eCHQsNgPrbyxZnijDAwSduiRNPP5VPUYSfa7AyebC9eN1YZP5x1H7gfy6f?=
 =?us-ascii?Q?VtfvUCAeHfBgRPSYUHf6qw4PRe5ZcmcRWsao/7uDW1tZ1p3PW5/OtH9FCtMO?=
 =?us-ascii?Q?pF/a7y394bKgJx93lvGG1tpuDoHRF6LU7MRnbe/bPG1MssgJ7YER+52KdvTn?=
 =?us-ascii?Q?AsAyOKXNc2mLhsPBakdb2j0Pnxh2jGFaqoUhZSVrzMMdnQyRXrdypnj40I5H?=
 =?us-ascii?Q?ADeAlFKCdHEHpLoiHtOzO0PR8n5Pa2PyV9Ak2o63pkXa9gUfHLd9xh7mEAQL?=
 =?us-ascii?Q?s9IgxTXff3pqCrvjmzAUVxT7SmJHbgdrR6UoYCe1+AhGqoPwHIxxfx7cXba2?=
 =?us-ascii?Q?pF4UQvmqrwklKjFq8fq0G7LhE9S277VZFcifC6QdSiS11Ov/NIDtYN+BFqkb?=
 =?us-ascii?Q?RWZLMfwv9RszUdofJJENEPeG/+71p+cic+LUyOKnC8koIHpp2Nw+3oCPil1+?=
 =?us-ascii?Q?QhlVt7exB6uOuLGiIFFbJGQKn00w6jYO4olDDt437or9XYfQ5l6seoIJ9A+r?=
 =?us-ascii?Q?d+9HfJ9k+deEruOoL6DtdDltimRY5s1xio+cRxfPHWEU/ulHGc/BZr2JK59S?=
 =?us-ascii?Q?3hQweVyUCZOJpjFiqbI2mtdJM88uG9dCu9/L6RCvHaknOLm0ClI/In1QeVAx?=
 =?us-ascii?Q?YXPUXo72PCToIgerTp/2uVubLaPiLgol8u8KaeoNkCLIhqxwXKQ1I7Ka+lb5?=
 =?us-ascii?Q?dVEzqtANuO6cppOmt3ka5VTJLmF/uiSdaKUl1SwD?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a16476-42b1-4dde-2113-08dc0b049a3f
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 20:02:37.6952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sqt419mMa3/QppzbDZd6qEu3bN0pUG2mywFlhQ22RemYBHAExjQXw095uOmOZgVKCejL4PONJvTae8yfFq5S5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6423

This patch adds bindings for the D0 order code of the device. This
order code represents an OTP variant that enables a touch-and-hold
function in place of slider 1.

Also included is the ability to specify the 00 order code (default
option with no OTP customization) explicitly.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
 - None

Changes in v2:
 - None

 .../devicetree/bindings/input/iqs269a.yaml    | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
index b42f07542d27..2c3f693b8982 100644
--- a/Documentation/devicetree/bindings/input/iqs269a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -20,7 +20,10 @@ description: |
 
 properties:
   compatible:
-    const: azoteq,iqs269a
+    enum:
+      - azoteq,iqs269a
+      - azoteq,iqs269a-00
+      - azoteq,iqs269a-d0
 
   reg:
     maxItems: 1
@@ -207,6 +210,16 @@ properties:
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
     minItems: 1
     maxItems: 8
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
2.34.1


