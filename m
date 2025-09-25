Return-Path: <linux-input+bounces-15109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52EABA11A1
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 20:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F31A17BE09
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 18:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D1531B830;
	Thu, 25 Sep 2025 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V8LazoQ5"
X-Original-To: linux-input@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FBA31B83A;
	Thu, 25 Sep 2025 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758826635; cv=fail; b=PDRSeWDbjgnJ4NRpQlagKLYFzVyrTRhal1wzE9sMRGsIpiueNhsVRNaowKsYsyWHyZ4kSgqdhAKSx1cOs3+ZawYfv6luY2cC6DfxBPPayXiwmy4H1N1HrZb9lRf7X7MaSHGJPbqIE3Q4f9cZ8oxUeYVhVrHKvvhpXBQ9ReeRXdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758826635; c=relaxed/simple;
	bh=xx1N4JHJKOS3Yp44GSmJTXhrxvnHybhWOmoGg7YRA14=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VKZ8aEoQ3GBYpZbHdzutAw8f5zgVAB2KrflCvd1TwuKfwxZ3Mjn48MYjl4UDH0qwyE4YEQgoOMt5BksTVlX630bLa1dTbpRR7ZWLHHhggo6d1FAwZdBGYKSDFgj5iRdezkb8Yqr2O89jVbF6waa+YR48+yTLiiHLtvjhhmfUUfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V8LazoQ5; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FloIvVbjG8MHSCPBZWz5uHrwbzv70x9COrvCrsdl0ffVn4WNuJOfllNq7lUI4/DDCoRUdId5ncbhXRHo0/Eukag0ygDegZmBCOVnZ3m1HD3Mv1cfs6uFUqw74wLADGMhP8+vzYdvhszs45lAnKrHYEStcfjHkeGDWv5KYdiGT4amwNKvR0tqbqQcIuMD5+ier4FF0W8QZSKd1dkEt5hhRen5R6IJmh5UxHojzZSgM75HdgGpDhq6isjUiRxoKlsSjvySU7NIStiHnRVBIGNhziSnfuIpgs2GP7AGYbrM4I6gbnXD9T+Mgu8vEd0/sTfhX5AFa77v1Zgq76LXFIrAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6ERFWAqesYxik7qO1O2L4NeWufrVMTL/pMtC93D4G4=;
 b=uatNIp4hEz82JRjN4PR2rkQOOiwHX4R17KhZkumci5HA5uodwhVsBTkFMfo0o5UJK+MgnMqi3vz+sI7Q0UnRffnUGeShHsr4mRHU1bMkSVDzOaLKD1weZ+jU6KrpQRQSVas48kWE728WUcSPGOyYHR78FBUGuDd5AvdxFaqSBQk40avd5sn04OC1vFz4xfgLmZQ+KDdPGqGbZ2mBNfOEifN53tfPeO2vy1kA4xBAHC0AtlwGLSn9+R0RQRklL8Ofn1pwguWoIFfe/psF5lUQLGLXeOjnD3HxUK0awvftqM4ibnMMkbCccusnpCCEbIMuxwXQpYKHIJpbwFBJG4LzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6ERFWAqesYxik7qO1O2L4NeWufrVMTL/pMtC93D4G4=;
 b=V8LazoQ503Z6i7dJEJbCFKJwJS1jqX4X7Kn3odrSpwTxHNthoQ+5nVy6qRRQwwRUIcii2j+XXDzVYzkpKLGhC2hGExwHfg1fgH9mO8kPFptI8ssG6/kJ+bdY0s5ILUHvdFFRtq/Sld+oaAuTZOTB2KCES4yVuLa8BDVYb+dmmTXQGlRIBeTflIpj6YUBM9IwhGFmNbviOFZv96dJeqGx4Ow7SEPvPbdJdgnxhX4+w8Ygq5SBmielBcTjGqT574UwQqVJwza0BO34dnD/nWBxiE1DC/8NDXQO2maizuKtZdFerYjCy4e+J3auIkM7mH3GpIoDOB1/rjrhKmZ2gRU0LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI2PR04MB11028.eurprd04.prod.outlook.com (2603:10a6:800:27e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 18:57:08 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 18:57:08 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: touchscreen: move ar1021.txt to maxim,max11801.yaml
Date: Thu, 25 Sep 2025 14:56:47 -0400
Message-Id: <20250925185653.298246-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0114.namprd07.prod.outlook.com
 (2603:10b6:510:4::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI2PR04MB11028:EE_
X-MS-Office365-Filtering-Correlation-Id: 00855918-f9a6-4929-9795-08ddfc655382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MrJHwou3lYp3zMVR0XkTN4+kjM3eVSZWNdOyNbCzBqk0p7mCo1M9ZpD9aXX7?=
 =?us-ascii?Q?/e+wjIJBwVIbaWZ5lSr4jfbZSy8umnTdrwdefKHB0Jl7WhxLYfpkuB8PUgUF?=
 =?us-ascii?Q?gk3BG6QbSczEN16UVyYoxRZL7FydH81O6yXaRDACVC1MyZCjp4sZLXoyVFLj?=
 =?us-ascii?Q?F/1Fl/Uf9b3xWrKs7s9QZDDdxuZeQcKAA+8PLdNmOOx6rf8GeOFponjgCAWP?=
 =?us-ascii?Q?q65NAcq6wFsBp3VTdOL4OJzesRFEZ2nvK9J+Phdt0EzUeKMY7u5vZrDnsTeN?=
 =?us-ascii?Q?hdis8ki8WGqpSIDCIXQiSX5ejn+hq1U7yuMMksjWMeZnfKPZ42Oz+VNkjF3q?=
 =?us-ascii?Q?Oap+GOIfPpjfMXSViKOooTKFrF9/Cvy2sPAF2xw78e6VKFBdqLyhilaoV2y3?=
 =?us-ascii?Q?IsQ7Koxxwpztn3zfrMpKqTc6mKvgc4j63TAT/S/QUcdbseRt81LjZWvq68pM?=
 =?us-ascii?Q?yufp5ZtiubwxlQR4rdhlLzi9RwbHym/5N9YOfn8y08OxDsSVgIhiuIXUWFcM?=
 =?us-ascii?Q?Msr8dQ6Ys/f/comovgFr0QhpNOrXNDChYOz5Rb8sdyxfj7tqQ9QyoHjBUM5x?=
 =?us-ascii?Q?t26CjtYblmptlcX82XfXwVJV2sRnLT5A45HvhZYpOa9hR4ecimSJJOA+Zo+7?=
 =?us-ascii?Q?ATmqquBmRym+RQkpj3iQM7lG55eWNDpIchVY93xnHh3VfpKZ/4IBB9fMjK4s?=
 =?us-ascii?Q?mbnnz0EE8Tx88pJmgwIooDtdoGiGbAePay14NzrwkIlHL079gRcOWaWcETea?=
 =?us-ascii?Q?yJad69kndXHeiVUl6WTVnzuOYe9x8MdMSGaKg9Y/maOKYR3t14a7DRvMxICp?=
 =?us-ascii?Q?91wuO5vwjXw5H+xZZInEsFzyEGaE5x/+veQXAUzhWRfFhQP8gsNFeekbb6f5?=
 =?us-ascii?Q?CIIXzRagyWtGTj8Gf4xGTb2kkDNg9M6Ei+XkmKy/iaKhD4Nm1tI1EVPKD2x3?=
 =?us-ascii?Q?tQSzlxCFebx3O3adr4IEOgDY4iue4x+0H5pK+/E4ox5Dxu+lpGcBz+qxHzYT?=
 =?us-ascii?Q?yF9cRSAX5hBUFid36of7nPWZxRdUYUK01rmIRICxHA8qiuiPcEPdV0D9S99P?=
 =?us-ascii?Q?GIWqAc42htJMQIWCdJKl/B+huZT60rgVYEs3HzIioGPwi8FP1shoDdQzG7Rc?=
 =?us-ascii?Q?YQCtFBdqHsAWpLCc7lPx9MW9UmOvpmY2ZEEYpNpPj5zP+UYK8lFUF1BQ784q?=
 =?us-ascii?Q?msHURSQckr/R+ucDfwCaRzZ5+Pw75P6o2AUDL9z2fQWv7AhRZterT9YE8r4i?=
 =?us-ascii?Q?agSC79Bpp4mOCEO/yULwbJwHbtk8xlSSOdNa0gTKTwvVXo4RJ/U98Zd33rR8?=
 =?us-ascii?Q?yJXrbbySxbvl407/fI+vuVF+Y82mbPPb8wbtKvV+uIDu9vRHoaEYrESTZfZd?=
 =?us-ascii?Q?FYtO7aLjcIwwVOkuX7IO69tCZrH+glYfNivUvZiY2I6543PzEBsJhq7iOYwO?=
 =?us-ascii?Q?SYZnCqzI0CfMylUFKKrGLFMt2CwIso6Z7yl+IJsdgAxWtAbfneQ7BUgO0JQV?=
 =?us-ascii?Q?2CAZav7Ke+mf5Ps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O40+kdA6WeJYhHPdqnNM/93ZYwC79ypn5p7SNv4tE3oSIiu8dPOW/annugdD?=
 =?us-ascii?Q?jV/ciYa1JN7KuceyM6Tw7lSHsbxTx4xeqRLIxpzuQoawi4m2NogZ1oGNuNMk?=
 =?us-ascii?Q?nynd0UOgnhZMsmJi8bAh5eRiRK17rt+WPG3UBySvqXKUeqf253LFYTxDGb6+?=
 =?us-ascii?Q?Pf9vyJlmrmqM7vGJWuSoSMFdrwYFiBWv5JvbqOU+0y9TylGz9K2ncM7J8rS8?=
 =?us-ascii?Q?ZzZXD/7d4+4NQC7cq9pVnEBQwimiHAzdWOz8lw/lpnMnD8kfzal2lnJE4V0h?=
 =?us-ascii?Q?VGj5Out/atn468D8VlgqTFlVCd+F9x0S2fq68RSCSt+N2AXVmzj/W6FWJvUP?=
 =?us-ascii?Q?Jv52EcOuAbiYLpyN9LP/1FAGLEMYCWDrWZQSO0bRn0BNARXoNZqU7FTPBgtX?=
 =?us-ascii?Q?A6LjEVuxvuFQRvTy/x/I3ww59+XyxW1dxoBAHWk00AxjRd98wJw+2poRk+KL?=
 =?us-ascii?Q?x+SdAj0qcWiHhyQ2oFzF20DpXAxCoNGPVJ938qla7+9AbPgtEhEdFdDCSp+G?=
 =?us-ascii?Q?TiaD3GE0QXfhNABhFom9VkoYdYVV54n7nampjUB3D5mmHPspKbBw61lrosER?=
 =?us-ascii?Q?+ijA+97ae8G0rAtlGNna8B4V5FfF+q1DV4I9YU/GvGwXuiOv4BpQqYUqyiph?=
 =?us-ascii?Q?rSRAvCnAKQwdjxJoDezZtqyI318CK0NLMzN5w4P3rK3KdJgRiwg7V7IZ61B4?=
 =?us-ascii?Q?BS8jFfLgKMXT9OM4WHY9yqb3vFTr0uCsX6zcfx+Nem5xi2cluBN37fLwOjGM?=
 =?us-ascii?Q?6nL2U+SYRgs5CDwKL0HjRecAKURvOhyh6KCxDvGX9LTLR8nIpXGpd8BAcXiK?=
 =?us-ascii?Q?FBpWsREWiUvFxYTIiE1T4STWb6V2eLIolr1RNNWmR6xxjz4bkmK/ZJpcRgu5?=
 =?us-ascii?Q?eLEy/rXd8o6n6VBvBye/MnslFSj8okUJ5vF77TpmLjp6ONdRfo9zNbeEi/Qt?=
 =?us-ascii?Q?F9A5x+u74a9Gu4SYWLo+P1ahh25Hg4HG52JqCQMJWLJkvILmXhqHbFT4Ds0V?=
 =?us-ascii?Q?SyCNJvoAJvoXubzlIeioYWm12jOqRCBiYk6E+nuF0iBSl2Kyid38hY9bRvQZ?=
 =?us-ascii?Q?UEF7HUzj2NiUis83t1nPH87r7gcVGrRHxSl2t5x+rPrLzhvjZWuLCdV/876/?=
 =?us-ascii?Q?hUlWiug1AZ3otfR7po0B+BTe/s1NFzQGwpit4Ar01eaa/kDVdTDTr4HyGPp/?=
 =?us-ascii?Q?5PyXdPniygAt4tCIcDT5zBECYnZD68lpiUWvDvDvpb3RkE+3wLVrOvQiccxu?=
 =?us-ascii?Q?gJIS8dowyUxcyWYek08Td18vfkR9WWO9hrGv3WGJpf9iTiWmRTYSW1hZQO21?=
 =?us-ascii?Q?bJdREADibkcNQ0MsDwtyLJJE+VA9PO1ONsY1hRfy/rkq2+gkQxJ8LDQEgcd5?=
 =?us-ascii?Q?zOw0gU1Ww/aeK6GtoUoYKVbtLq1lUnUeO1088CTZ5jhqX+T2mMakK16vczGx?=
 =?us-ascii?Q?J9etEHzWKQGLfjkQE0MTXbj1wb1TymyPnthf76TOxXS3wnLG1eKseqklrx2X?=
 =?us-ascii?Q?LuTLYC67/4yc6xmPscDIKcCP/OlC7KszDjAZDhA5SBfwj+jnQ4/qeG1pTAxN?=
 =?us-ascii?Q?sEuWa6RslER+Bc57Ceo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00855918-f9a6-4929-9795-08ddfc655382
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 18:57:08.2120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3dWfGy0MM8suvjI76mA2ISsXBvYRJ3/elrdyScUJuEg2AHs/G7G3PMRsHsLiwXvKzgnSX6R3AwpIdAD1+Xsag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11028

ar1021 have only reg and interrupts property beside touch common
properties. So move context of ar1021.txt into maxim,max11801.yaml.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/input/touchscreen/ar1021.txt         | 15 ---------------
 .../input/touchscreen/maxim,max11801.yaml         |  4 +++-
 2 files changed, 3 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ar1021.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt b/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
deleted file mode 100644
index 82019bd6094ee..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* Microchip AR1020 and AR1021 touchscreen interface (I2C)
-
-Required properties:
-- compatible		: "microchip,ar1021-i2c"
-- reg			: I2C slave address
-- interrupts		: touch controller interrupt
-
-Example:
-
-	touchscreen@4d {
-		compatible = "microchip,ar1021-i2c";
-		reg = <0x4d>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml b/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
index 4f528d2201992..288c7e6e1b3b7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: maxim,max11801
+    enum:
+      - maxim,max11801
+      - microchip,ar1021-i2c
 
   reg:
     maxItems: 1
-- 
2.34.1


