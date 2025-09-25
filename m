Return-Path: <linux-input+bounces-15111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38DBA12F5
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 21:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D282F3B396E
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 19:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9692B31BCAD;
	Thu, 25 Sep 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H8/UX6+I"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E8F31C56F;
	Thu, 25 Sep 2025 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828550; cv=fail; b=JR6eH89MCA3HX46E5q7xS6poQnXnV5ap2vSN0d4uQBPYkDMwIY5AXNixtZTpIsyEjm9B/wPWxs6mXPjA655ilphn/00Fc8Lo3dIGg6EsOqnpiXGAc2R2iDq/jaUBSC0Yj6e798qekzeD6LtZ9ZwIcs+kmDgD0fMSSWgkUVHWWls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828550; c=relaxed/simple;
	bh=WtCeDQLmI5FJtU0hsLmQt6fQR4iFtgjVbUl8B3/Ozsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T0FyLN0UqiF82twHwG1YdYxQyT1Tgj/4NyTZ55baAYGkDdbesHU250tjLHP0NfGZ1rzpjeyrAsN1Ks/XcYyBVKOoXJOQ5zsVCFpu4vDsL8eeSd9T19vcTiSi2VZOvTkWGkQPQklKIKs1IL7j/gm2YOBoXdNh61hzSDl808qJ/is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H8/UX6+I; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIyP7X7mbs7rJvb6srsNnCuTMQ+R2R998C8aC3+Y2cO+Z4IbaAhxxRmey3zPqDnS9rg3rfh7XZAIlko7M370qUdj7pPrRe502bFFrU/t8uwR9QsjUHBZPFYq1owtQa2Cpu8vgn+FJuZyciQS+VWVyo/9W1esvkwL2RH6wYQaE0EZ6HVxU4dAd1DMeCgmfcEHbSeuTQEIpKhyjZxIOYPKr0G4j/lMzLtxUtMo5Y0F2j+ULSibEzGI8Qyrwqq0CQbJwbJpUFhW/SyDfY2wLljaekNplqF7kOCfGdkg6O4DqmdIvXATqSlSgRAKQBIBNsb6SIgw3aKiQGnxD63D6NacqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0shTRHNnXINlglP/khNzbEA+zoI8x6XX9S3uvCN7oNg=;
 b=dmA4s/7MYIyaLLTyDIRWGMphqZwscb1rjXl35CzGBtk3yz54wF1s9B8j2TTPM6XTwqR2deYp77D6ZVRVep5DPIkaN4GvLpkHg5nvHgPSHDAGSJyzaRgSEr9uwuCxRrbh2ugmwkEC8oxs/bMOZgY2aiCs4HOzO6g9K9nG6Qr2ybp3plyohSJSbosN1sUDIm4DMMvt+Z3kUs/z3Ivzhz3emAeohSnmGJc+AeRUU8w6lvrzKGY9v+IVfq7DK8jpyl6YNjC9TapnfJJcZdGtN79h52Bbk2zpIQroIdkc5Ke1vqYPCIsfdQI1wkXuna67Imxug8YyYjbaeZ3oKF0ql4BTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0shTRHNnXINlglP/khNzbEA+zoI8x6XX9S3uvCN7oNg=;
 b=H8/UX6+IaqHLKo500IgF9dnkmooCGCzyrWKjiGhZzc/yhzwAgee3k8L5snLYva3fp/uo/n3yPkf+3fXul6BZ7vx+0lOrCFgfJGxRVHu36rkRuAxWNQDEzryvoFPQMXvVGRvtiri4ekeUYATMW8isOt8xdYJ3pHD86/ds2jg7yZ+bFr4ZbCf2EMb6E16yLdBcIzTqbVjOU20zLxDA0BW4o4hFiAB0acabs3Ixc3hobdWrdM4D+aMTsvMsZRBTfiFeHaH1Ih8n7/uDoBcWeLIA/JFOsxytfiycKZeC6obV1kh308L8WxM8ICH2dGksPNcG2qghw+tnbdgP9YFE7K/iMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB11573.eurprd04.prod.outlook.com (2603:10a6:800:2fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 19:29:03 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 19:29:03 +0000
Date: Thu, 25 Sep 2025 15:28:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: touchscreen: move ar1021.txt to
 maxim,max11801.yaml
Message-ID: <aNWX+DxUOXlOvsmo@lizhi-Precision-Tower-5810>
References: <20250925185653.298246-1-Frank.Li@nxp.com>
 <20250925-boundless-announcer-007f08404112@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-boundless-announcer-007f08404112@spud>
X-ClientProxiedBy: PH7P220CA0145.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::9) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB11573:EE_
X-MS-Office365-Filtering-Correlation-Id: 03363700-ff27-4957-e469-08ddfc69c8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZgTxb0MTnkhorIPmlQZERr+HIG3ioWcSwMxh/389aXLRmWpKH40LytqYy3Uu?=
 =?us-ascii?Q?BjDmhKesHbzSFLNb4+6jkM+gx/Mlzl5+J2AeVM0+0oYxvU9wm5kuYlM4c4DF?=
 =?us-ascii?Q?jo6ZrjKt+MomIp3yVG0XNxDWmVcKrMXWOjzFLd7odeQp9HquMeTrdtZ6yekX?=
 =?us-ascii?Q?U6eoOiFkEkBC75ys65AOqYb4p24RTwnCPHleEffym/+K/St3ko+hY2qrG33q?=
 =?us-ascii?Q?UsIXh+QFI9ibUQ95ICL06MtnN+sSkMr9kBtFId6X0++tCsa33IvaoX8COZjG?=
 =?us-ascii?Q?RbmW9SaTJmiSSonbyPk02zZDLg8EBRo41RzQ+KMKNc8oD8RxBtgQ7o4OjBOK?=
 =?us-ascii?Q?Dq5q/N95pKDR4WyKzeTDXGFQS263pDFUlF+SRd4mkMVq6E80k7IDLXwam1gA?=
 =?us-ascii?Q?vSEbO2fQELPzuAGMGX33ggiTOu9TfMwdN9pxPjrgJMNqTQfm1MceCdrb2cr7?=
 =?us-ascii?Q?UeW9EVrBUv9X2VmBghM8uEzj1AcS3Dq+podp2yNleDfk2AAp4vawb+5OOtHJ?=
 =?us-ascii?Q?DEmN0SW+feYDb5Id733/Adyd8+7ohmOQbFYUGhaynA099USCke/Z+5+UHllf?=
 =?us-ascii?Q?DgweIWLV1+wJOXCXuSrM9vTKa7SojoQQz2MxRX0/JH3mfJc68/8jkU6u0TF4?=
 =?us-ascii?Q?cvFQ+AW7g22Y0wXV7J36fMZZwpVGzev9+l8RN6etCIw1Ic1Z3weOaaWvaon9?=
 =?us-ascii?Q?nJE7BwHxGE3NlWytj33VCej7BA9i4owTS9AuaMvcU+q13cdLO75CvJ8Ve0Ny?=
 =?us-ascii?Q?pTnaS2zCsL1CoPb4zulN9iVEZEsfUGR3ZbcHeS2geh/TGjZOH8AlCkhHyItb?=
 =?us-ascii?Q?jSxJkv79AS7rNEhgiXTjckIV8CFk3GKDXis5ebG6pM06mnetLOujCe5FzSfn?=
 =?us-ascii?Q?fZ5MpqiL7Uqqh+Hy9eJWgOKxESK5u5fnCIv257xS3fKO1qMnqaLdRAmnHlwl?=
 =?us-ascii?Q?a4LSLlGkR6cPG8twFP+qbODWjhdLZCpq3dxL9FH1S+NGKeviNQ2jImUfLIXO?=
 =?us-ascii?Q?Zpc1TOltbwJdVWJFSwYmgVR46ZCyyNtDO850jKRoNc4kRXHtbMDZzEB/qeeL?=
 =?us-ascii?Q?3Ik05s41978f05q3xVSw5EqK9XgZoOGF0sV0Ga796/aFw+FNSiWkPOJQolA6?=
 =?us-ascii?Q?gEvRZLD3CRF2aZ7f9Glhwk7DHvV41iqugAXlaMaMX6TP/dmbDYi1D4B6DpzC?=
 =?us-ascii?Q?0hRM2pW83XDe9rHlkd3+u/BKkPuKQJQ0Sc8kbJ+6zqrwpdL0zAvLCdyghODP?=
 =?us-ascii?Q?ubrL1sMrrva9K056tdnkiYID2UC08ovVB45BIIMDgGeisBHksn5b1FYcW0Fl?=
 =?us-ascii?Q?FuaKMISlZxnKOMcQjxoOlvgoWdbQPEGQTlJqX38VzJIje+jO3Z0j26BkzbTY?=
 =?us-ascii?Q?baMoVhmZguQs1qp6SgX0LpT/HqEedRM05vhM8CKTGe7bQVrEeGI9u0QUiPxN?=
 =?us-ascii?Q?fZ1Cn/A0uFg3bEPr1pHjUJmmMnnBMAoT+76cOA/gfCABdBN1nhXXVL8CkRUU?=
 =?us-ascii?Q?WmHddiEQyAIex3+HEYq+5tEVupu+i7TuzGqb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YvRcaFVItNwY42UuhahamijO1R9U5iMWJ6/sgvC1wfqimuzWU0rBJqQFxaaq?=
 =?us-ascii?Q?ULYr77qXxIF74O/08ZTz0/QPqcGaNh4Cfl1aNaJ8NV1CMfT8QdZLg4NqmXan?=
 =?us-ascii?Q?HajEN8AqAMeDqreyCgVq9pfMPrarBu1UXTEOLvm5BK720/w4U6RPLKjFYIng?=
 =?us-ascii?Q?1SepyXq9rNlTjeumkBcqnHXCF6k4ISbO2jhxYW8DdSBm9DyyFzvTKymr4ChY?=
 =?us-ascii?Q?SMjv2gICn/dndCElyMz0FoswLGYIkE2q2s0OzKpYFeftUaMHKZWmB7aTEBGU?=
 =?us-ascii?Q?FJfxSzlt5rw3kY0lyJa8prZkdMMBnRR+5rpIF45D8/AMyvA+txX9W85qMryT?=
 =?us-ascii?Q?l5brjxEgKb8h9YNZS0v6IiGweB2T5cVhHltPQdbOUFpVCcIBOPJw/erUbH6x?=
 =?us-ascii?Q?GrUTNqGGw9ECeuFtH1k/emQeelVrXo+s0t9AZVOEb8swxon/qgP24eTJRadE?=
 =?us-ascii?Q?1mpzBAdCMJ/n7bAu+X9DDaRsgGw08K0xvH3Z+etgjdlJtOL+4pL9ZO4FlZtg?=
 =?us-ascii?Q?PRKAp38kVT+4Ficq0LyrB0aL8TJiFuwSOVJ4jZ7FXyN37/VcEzR7Daf4sSmB?=
 =?us-ascii?Q?IXUXup3n4FWuFdZjrtKhc4Tw4uC7ib2nfaero6Z2Q9uOYwkTrfK05Znyr22y?=
 =?us-ascii?Q?nUmthKZVmW9g4Z+gQJzhNQa4GNAJ82T5YOIkxrLPT+y2dGqb6N24n4SvB3z/?=
 =?us-ascii?Q?n3jSezzqpWyd2xkCyeJXoR3hZ12weoJBzmF6ZdsjSiDo8p3FfX5ZdiJLNciD?=
 =?us-ascii?Q?Ua2qEs5mSnuQJ7bARR60oNvVnHBr/W8ssbE73+FbDUIi1URrp6amO+z8KyHe?=
 =?us-ascii?Q?EZ99U5fR3esDTeSYNAb8mbkF0ZVsVeksMc0H38Y+R7tEK+nXYAbk/vsnh6IS?=
 =?us-ascii?Q?vmguHHtrQIIrF+Y0gmBDL+aQ4UKLevKgrxfdXUVsgDleYyDVXMS2Pb8tGnmC?=
 =?us-ascii?Q?Eye5mMYuayJ1EE0m72u7DpDNXA7sayg1aBpRKoWUPmn8njU0/PpnR0d6BsVj?=
 =?us-ascii?Q?ZLqUl023ShAqgcUpw9Sm5q7ofs1GqtdCF7dUz2FfhsDybVwXpdY6n3rWTT7/?=
 =?us-ascii?Q?cXJaUcVQ4t1pld7fWsLeHPFlN5vA1epUt8/sAujFeeFO3zrl73iHA5egicfS?=
 =?us-ascii?Q?iIy7VEwz5EjlH3zAgehnKkrT0D/XFEaIu05hrgcGhQm/74XKag/GC4mtWdAR?=
 =?us-ascii?Q?zkdxxog7VJT3ZZ8FdLLTatOOmscYR4ad2d3oJUok8Pv9lnyJ2PCApUpQh4Fb?=
 =?us-ascii?Q?VPF+R6g5OmvetuYvWUymAtXqDe8FaFUioXPkLlV3/goscbW0iWd4Ee/+Yz6+?=
 =?us-ascii?Q?/8xgKwwFbpo0xqFU5XcgrBRUv3JROqxjyUWeB1CF72l498QrAdr4wmoWL5s9?=
 =?us-ascii?Q?ZrpqggfgoS13FnUzREFUhY6RfqEK/rpBT5iJSjj7hnvr1xpiZD0j5G1tjuQZ?=
 =?us-ascii?Q?16zsc9o2nsFDfGvoieLdzWyk+w5bs4+609skkZInqHARLnwzMmWSsgqAC7ij?=
 =?us-ascii?Q?q2eoXycjFQ8vvPpLpTVr7+lrktSzD5KpkJPgd6T8MesdxJbuak76InkyK/eC?=
 =?us-ascii?Q?xXyyXkJ/6jxH+1B7L0i9rlVT3/w3/9qXyoIXgwtu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03363700-ff27-4957-e469-08ddfc69c8f1
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 19:29:03.0793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RU1SNue5GFVGhFdg2cKADF2WG2UR7jTcY29Znc/pa7Djw3ZXIm65J6N0hBRfMkBtAn5QzsoYiDrFKTtw24ZpuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11573

On Thu, Sep 25, 2025 at 08:20:02PM +0100, Conor Dooley wrote:
> On Thu, Sep 25, 2025 at 02:56:47PM -0400, Frank Li wrote:
> > ar1021 have only reg and interrupts property beside touch common
> > properties. So move context of ar1021.txt into maxim,max11801.yaml.
>
> Are these devices even remotely related, other than both being touch
> devices?

No, just properties is the same. There are many binding files, which bundle
similar properties's yaml to one file.

we may create trivial-touch.yaml, which similar with trivial-rtc.yaml.

Frank

>
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/input/touchscreen/ar1021.txt         | 15 ---------------
> >  .../input/touchscreen/maxim,max11801.yaml         |  4 +++-
> >  2 files changed, 3 insertions(+), 16 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt b/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
> > deleted file mode 100644
> > index 82019bd6094ee..0000000000000
> > --- a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -* Microchip AR1020 and AR1021 touchscreen interface (I2C)
> > -
> > -Required properties:
> > -- compatible		: "microchip,ar1021-i2c"
> > -- reg			: I2C slave address
> > -- interrupts		: touch controller interrupt
> > -
> > -Example:
> > -
> > -	touchscreen@4d {
> > -		compatible = "microchip,ar1021-i2c";
> > -		reg = <0x4d>;
> > -		interrupt-parent = <&gpio3>;
> > -		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml b/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
> > index 4f528d2201992..288c7e6e1b3b7 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
> > @@ -11,7 +11,9 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    const: maxim,max11801
> > +    enum:
> > +      - maxim,max11801
> > +      - microchip,ar1021-i2c
> >
> >    reg:
> >      maxItems: 1
> > --
> > 2.34.1
> >



