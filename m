Return-Path: <linux-input+bounces-13655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A3B0E8C5
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 04:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21D64E7C8D
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 02:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596391DF755;
	Wed, 23 Jul 2025 02:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZfKdasnt"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE361D7E4A;
	Wed, 23 Jul 2025 02:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753238747; cv=fail; b=hTZnye0xv0B4tA1LxSYWLFw0Y5ZiPt3Z/l6r5mxF6R2AMqz5Boe08HKiF6qVwEtGr7GPpxAUZ0SCCQZ5b4+jKvqW+qF3Mv5CWAd0Av2cKp5QPVAQs5kxxDtAbJWYkOaaJasni47efBo298GhipIxCn1dkgGbsm7xs5TqPDG470k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753238747; c=relaxed/simple;
	bh=a+GNU0BxapNIAFDT67VOQOteOQamsngEZUc7YMFSIU8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o3NKm+42DIcP4jJBOLHxaOyWgDFcvMGRumrrO0X5rxrHFCkOcK5A157Ct+L8Cju1k9+q4AwqwgoabZGgQPnmUnGTQn37AdEe08LFUWuYLmohYLQt/4CYlY+vFG5GRh1ceWjm+m4u0ef2tZyZVFKK0ScQ8alsoHT9/YV3vy5CL7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZfKdasnt; arc=fail smtp.client-ip=52.101.69.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyefaiGwGxpUNbp/AZBdD2QhpG5PrB4kioaNI5zjKyWCMl0+SEPwrs2gAlAqNNM9Zc/vVDvlzxR1rTSN/a8ssl9dAHmZMotUeC1ZJAn4wieJMpnGTwfehDHLdTlEkqY/I0uW2QKrDGONLH4x/vvBIla/TvmxaktxTj7fALCL8NK9PISTI2urX0kMGttK2kwp0kg9O2YENAqgdiROpUxDX5rEyN1SL0KfhQpnU/FmWRv+Sw6MAc8kPG12pjEVPKM2u4FFTJ5DR7amXV+YGzwKLQH5hImYcPPfe1BczQIItMexCxw+SYqtKAb43Tk/88pNaLQquT9qPEcvtjs2tV1ETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+GNU0BxapNIAFDT67VOQOteOQamsngEZUc7YMFSIU8=;
 b=fgtBux6hqVDpjQMXojOYxITHSgFF6VwUMlfJTdzZ+3bbLxGejioJqAclTGDD5w9j1k7ZZtq5xBMs9d7CCgZZOUMRnrJZwuwK4lKKMyCYYqMXCphxUerkx77IAGPgpZrRiG4lKzR0wxAmNqgg05Tp15DL5yLnkPE4Sj+1D/35E4S2s1m8J2BCsI2qMSw9faSnJ9toQ4yK7TL0W81AujwEUEOkKupNR0px26oIvSDz6pNAjrfrmJaKx2hdwxFzb7bqFfcIUQid5sDzTHLqw6sdXoc4cvT0zy48SM84WD4cs9v9fSyv4SLcOsAIP5PLVTXsxPXDe1Wi6zuYs8o0SSiLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+GNU0BxapNIAFDT67VOQOteOQamsngEZUc7YMFSIU8=;
 b=ZfKdasntsct/OCCwjCEXkvl9nAHczafnJV+eb6UH/V2Q97t7lvISP951o9LfMafj3RXZULGrVb+fUhUfJAR+jLxVJ0pjR0pcjYf7xSmDuLkSL1yKjj2XEYEKq61vXoFZis8kViKXP5GjPabhpO7NCRVL/ZJ1S6OLeWn+GorMqHePe6+IKL7p/3F5Xty3cldFuW3QvljD/ui5qlxgTTalm8se8pTZlfaxUXOHNfjFKo2ZSq/1aCKG29NPO1rWXHD78yfkLxzYyH/AGH5vZADruFP++ngoMJz2gmHHjz5SKnDc3TZtvGFQtImyeYpzheJl2pnQDdAI+TXQKHA8pyhzYg==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by DU2PR04MB8726.eurprd04.prod.outlook.com (2603:10a6:10:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 02:45:41 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 02:45:41 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: RE: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
 fsl,glitch-threshold
Thread-Topic: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
 fsl,glitch-threshold
Thread-Index: AQHb+vSa6x1zqyGbTki/bDHBUc80mrQ/AHQw
Date: Wed, 23 Jul 2025 02:45:41 +0000
Message-ID:
 <DU0PR04MB94966B1D445966C0E7C1BDF2905FA@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|DU2PR04MB8726:EE_
x-ms-office365-filtering-correlation-id: ec42fa7c-2bd8-4e9b-881b-08ddc993039f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?cmFqREUzV0hlMFZpTWhBVlpWeFNlei9iQ1R3a2kvRU92Y3loZ2hzWDRvRUhk?=
 =?gb2312?B?ckR1dVVNZWhweTQ0M1BOamhuVjNqNmpMV1pmbFFnSkpsYWcxSUhjVkFVbTc4?=
 =?gb2312?B?ZTlCZkd5QlZBZUFnRS9LSGkydlNWUUNHUHpLSlJnS2cramdyMDQ0WnRvYWFn?=
 =?gb2312?B?WG5aSW1yVlhHMStHOFJTTjd0SWhqSDFKZ1FlR3M0RzBIb3d1QUNSVHpHb2Vz?=
 =?gb2312?B?M0Z6Rzc4L2xFcmF4dm5VUWJqajJNU0FQdTNGUktUeXFrbmtMUi9HaUNLdkcx?=
 =?gb2312?B?SGlYSUlKUExsY3o0RzhkSG4rbGNoSkRNNTFheXpyU1E2QkxiUUlaMU80K3Ro?=
 =?gb2312?B?cUtNRlVKMFkwWXRtaWZ2alhqdW9DVUZ0UktiU3RnYjgxdWxlOWttOGxtQ1c1?=
 =?gb2312?B?dmM5VnJGclQ3RVJrR2xMcldpMGRLSmVHUHpjZ3AxSXJPbTNEMGtZdDIzeVZm?=
 =?gb2312?B?aFpaaEdQaFd1amJ6Y1YyT2ZHYjJJSEpTUVRNTURpRHd5NHZ2cnFDSGlGOWNh?=
 =?gb2312?B?NTUrNEg5RUx6MUNOZHFvbytOandUUUFZamRhM2pQdlE3Ull4cjdyem0wKzZv?=
 =?gb2312?B?MXlDdlRwcGRIaElBZlpBNVN3UnpUMDFIeTNBbGFyTlFoY1piV280UGVtY0xn?=
 =?gb2312?B?a1VldGdmUEVvejR2VExVc2IreWZNNlBITUJKa3czbUxHSVpkaXlNd0hBL013?=
 =?gb2312?B?eWkzdWpPMHpGRlpvVlFUSEtmWjhGWmFIMmQyWkV2dSt0OHRXczQ5ZjdESmZ5?=
 =?gb2312?B?bGlBODd5alpRZloxN2ZSL3hyTGs2QnpaKzBiWHZEa2xEY2F6Zzl1V2lscUpP?=
 =?gb2312?B?VzhqTUtyUjdnemlmdm5kRFluRGdQWXdaRUVYd1ZFaUF0UDBzNU5ZeWt1eFRi?=
 =?gb2312?B?K3lTUERGVTBEMkNXbjZCRzM1ZVVJSGVHSXRMSS9GdUo3YnJFOVpULzV5aHJa?=
 =?gb2312?B?Q2FvRDNXUk5ZbzFkNEM5cmtkZmJibXg3SzVENlhnckpnSnNab250eEpGck1S?=
 =?gb2312?B?WWhzN1dCdEdIZ2pVbVBaTzB2SnBBR3dVcFdNZkdiSGpqdTdQNGowNDFsN1ln?=
 =?gb2312?B?cFhWMGNVUFJwaUhuc2NxTFpHTXgyQVZpYU5wS0FJalk0MERwb0Y5K2N5dS9L?=
 =?gb2312?B?dXk5ZC9yZjJmalcwT0ZKRXVEUTdNM092UWpTN3VzL3NEV1Nyd3hzQWh1cFVt?=
 =?gb2312?B?eXlmQW5CZjhzOWlVSCswVk1wR1hQT0hRaG1kSmxzamY1bm42dWJBbjBsTjFQ?=
 =?gb2312?B?QU9IaXR6eWVkVXp0ZmpDV2hQL1k0cHA3MUFKT0R4ZHFrdzBFTG0rYjJhU2ZR?=
 =?gb2312?B?b0VBVndFNk00SVEzeTlHdEc0S2ROZVlFV09wSkIrTU5tQVBNblpDRHpkQjZ6?=
 =?gb2312?B?dG52WHUwYzlyNDVIVUtod3J5ajZkWGlHbFVsQWhvSmhLMThLMHZldVBneTk4?=
 =?gb2312?B?cE9CQ3ZCSDAvUUozMnFkeFVac2FhRkJxTTc3VTZHK2RHeHc4MEJjbGdYWE8y?=
 =?gb2312?B?TzdWUlZzS1hlbXVOVU9vbWV6SVUxL1ZiNnltYUZOY1N3NzdLYVRHb1BhN0Qx?=
 =?gb2312?B?QzZZOUp6TUEwSHpIQ1Rnd1VHVE40cEtLL2xiTWlYcWJKOWs5blpXT2dvSnlx?=
 =?gb2312?B?MWFqS3ljTnlRU2xuSTJzMDdXOTQzVUh1LzRMWEo3Y3hxMlg2VjZBS0duMlBL?=
 =?gb2312?B?NnlnaFNOUDhoN0NVVXZ5NCtrd3ZqRVRBN0RpUjhsNm1ZMmczQXZjU05GcFgv?=
 =?gb2312?B?d2N5MlUzZ0QvTmhHUHhIaFhnRlI1c2RHcG5acXNSK1VrVHZZbHhSZlcvQnBB?=
 =?gb2312?B?b2o0ZS93SmhNcVZnc05obVBIV2NwSDRXdVc5VTU4NVFuRWVRQTN1MXJETlFi?=
 =?gb2312?B?YW9DbUU5Y1ppcVdCa3o3bFdLMmF5UGRUZVRwWURub0FhTE1ucFJ5UXoxWkt1?=
 =?gb2312?B?bDVPMzY2d2RjcFcxRGthN2ZxOENjRTZGOTQwUWVHdkVidzdHSmFtWTdZU1Jn?=
 =?gb2312?B?YXl3MVk5ZDdRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?cDV0Y1ZZSmY1YW5sQXRCR3dMM0hqQjBhMy9BeFVGRUJrcncvWWdhT2Fxa2F1?=
 =?gb2312?B?ajQxNHhCaGNTN1FPbFk2YWQ3ZkxyVG1DRXpHUzlwMGpUTnRDYWRJOFgxZUdH?=
 =?gb2312?B?RWxIN2VlYjFkaExCS21GZlRqUFBEeUFrYTV6Ui9iNnhYU1JtOGZuM1ZNL29p?=
 =?gb2312?B?enZFZDl6Q2o4ckhWM2M1NURHUW02MzlDRktDajE4U29URW80TkNlUTlWYnds?=
 =?gb2312?B?b0hmbVlYWm55bERxc1hEQzQvNTNFK3Fyc1o2N3VvenlNemtncVJlMy9SMXAv?=
 =?gb2312?B?U1dtNjh2c2VyVVFLTXovcy9iN0JmbmYwZk1wbm9OYzlZRDZTWnhraXhIVlN5?=
 =?gb2312?B?U1RxN3dyTStMblEwRFVwZ3NYbGNPMjN0bmgvREJsM1QyUnZ6Tm1qOHJTYkQx?=
 =?gb2312?B?NUtsVGpVdzU0c24zMVAra2dudjVidGNzY1plZzk2ZkdrZGJveG96OExwdVlx?=
 =?gb2312?B?Q3lWYzdMRnpzNjNmWXBQcmo2TkN2b0F3bFkvOUU2bXlxNXFkaFVaVTN6dVd1?=
 =?gb2312?B?TG9QaWFrbm1BRmtHeXFQUUl3MGFtTENnZ2M2emlhMXdnMXhOVTNJUDZyMDNh?=
 =?gb2312?B?WjJNZGg0dUEzVDZOS3lza3pSbE9ueWhIUTM2MnV4TDhMMXE0aVVmZ21nZXNr?=
 =?gb2312?B?cEVnUXRRWVVMdEM4a1l2b1B2YlZ5T29UQnVYZEVrdUpLeWdtNGFMdzZMYmFt?=
 =?gb2312?B?cnBGcVowZWhDV1V2c3p1MHQ1WlNZaTd5UnRNNVNPbDVqUkFJU3VJQ1NUZDVM?=
 =?gb2312?B?YW9UZHc3c0ZJU3ZkRGhUTEJUVGMyK05wazVKL20wR3R4bVFQU0ZZZXdxaVdV?=
 =?gb2312?B?WW9MVTd6VVVLN0NJbjRqSlVCdzZvSDFNSnkrLzJubXdjZlUvNHN4c3g0K20w?=
 =?gb2312?B?d0dRZm0wZXAzc1owc21sUWwxNjAwcFFoTVpDdTJ5UjJqU0VnUmMrcUkxM3Bw?=
 =?gb2312?B?UmM0SHdnUEtNTm9WY21GNk1kM3hiV2ZlcUNIMVdDcFpPQmV2MXd0TWVnSWhE?=
 =?gb2312?B?TGFLZXJvZnF0VGV2MVpXM29RYTUvRWpCOC8zOFVXaVdUMlJJbzAzMFluSFpy?=
 =?gb2312?B?SVBRYjVDaGdaUkNEeGVaQVFuV3Q0QXBkV3dCcktOSGJCdHVaNmNZeHZpVzRO?=
 =?gb2312?B?VVdFcEhMbjVYcWdTUzlYOWJtRnJ0dDFBeG5nSmowTlFaYVpBalRFVzVYT2xM?=
 =?gb2312?B?ZUg5UzhWMWFxMlZqWUJiaFd6RWdUSlAva0ozMC9DSHVGVGkwblhMUFE5YlJ0?=
 =?gb2312?B?YlBWcjdtb3dvU1RUQ08zcEt4VnVJYkRMMlcwSmV1L1p1S2FpR0tWcGpSdERP?=
 =?gb2312?B?Sk5IRTlBbVhrS1Robm84K1B5RTdzUVk2WTl6SHM5OHZuM1dYekFTUjZnaEwy?=
 =?gb2312?B?VkFxZDdUNDlxNTFSa0s2VWlOQzZERkM4SW9tb1ZUWTVWWkE4Y3FQaWs0cW4r?=
 =?gb2312?B?SjBJa2NQTmFkdHRhTDFvTXVBOStYTGRLTXladUhyTzZERkF3dHhFOUo3ZEJp?=
 =?gb2312?B?M0FhSVZuMmxxcGs1M2pPb0NzTXNjK090WDR0TTNBUUVXK29KdUlYUmI3SXpR?=
 =?gb2312?B?aVZoZzJab3lYZndJRkM4WW9VMEpEejJHcVZkZDJ3TkxBM1ZzVnhVc1BsY2E3?=
 =?gb2312?B?UFRoNG1nV1NML3M5V3VkMVJIODh3bnozREs3Wm5aTWxPMFdVdmlMdUdITWdR?=
 =?gb2312?B?cFovdE9UbVpyckxNUksrMHhWWU1aeWZtQVN2bDdOelA0WHdBaFZTeUlCNTJI?=
 =?gb2312?B?amE3ZFcvSHVNQ3lhSGprTUM1d1NuQUludEkvalRNVklUNGNRaGhZMnZGNHN0?=
 =?gb2312?B?SlhIQlJjT2J5NDNnNGp1U3pjWnQ4K01tVkFxK1I0NzNvelN2VGV0cEk3UkN3?=
 =?gb2312?B?WklqZUVESTNaSHBCYUs4bHgvQ1htSUFjcW53ci91c3pWazdwcXJGRGdwNTFx?=
 =?gb2312?B?a09FRWZrSmFTM0dBK0NFT215dEN6b2pOWnYvVk5CM1dyTE44dlUvM2RLcWlu?=
 =?gb2312?B?ZlEva0ZpeVA5WlZXMU0wbkoyZWRHUHpXSWpHNE9KeXdGd3ZyOTVVT015WEtU?=
 =?gb2312?B?NzNqQjFvZEsrcE95MWNibkFJVXduWm9jV1hvWEVxcmdPQ0JFa0JSNnZSZHNB?=
 =?gb2312?Q?6oEw=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec42fa7c-2bd8-4e9b-881b-08ddc993039f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 02:45:41.4351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBYXI21y1lCoCNbm/xJGrHYTIKnfmOxD/IVYeftM9LMpiHeiTNQVhB8cB5my+Pb4xr1QGJXov5SoySN0LR47oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8726

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXJpbyBCaW5hY2NoaSA8ZGFy
aW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+DQo+IFNlbnQ6IDIwMjXE6jfUwjIyyNUg
MTg6MzYNCj4gVG86IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWFt
YXJ1bGFAYW1hcnVsYXNvbHV0aW9ucy5jb207IERhcmlvIEJpbmFjY2hpDQo+IDxkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT47IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2Vy
bmVsLm9yZz47IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT47DQo+
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IEJvdWdoIENoZW4gPGhhaWJvLmNo
ZW5AbnhwLmNvbT47DQo+IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47
IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPjsgU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsNCj4gZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnDQo+IFN1
YmplY3Q6IFtQQVRDSCAyLzRdIGR0LWJpbmRpbmdzOiBpbnB1dDogdG91Y2hzY3JlZW46IGZzbCxp
bXg2dWwtdHNjOiBhZGQNCj4gZnNsLGdsaXRjaC10aHJlc2hvbGQNCj4gDQo+IEFkZCBzdXBwb3J0
IGZvciBnbGl0Y2ggdGhyZXNob2xkIGNvbmZpZ3VyYXRpb24uIEEgZGV0ZWN0ZWQgc2lnbmFsIGlz
IHZhbGlkIG9ubHkgaWYgaXQNCj4gbGFzdHMgbG9uZ2VyIHRoYW4gdGhlIHNldCB0aHJlc2hvbGQ7
IG90aGVyd2lzZSwgaXQgaXMgcmVnYXJkZWQgYXMgYSBnbGl0Y2guDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
DQo+IC0tLQ0KPiANCj4gIC4uLi9pbnB1dC90b3VjaHNjcmVlbi9mc2wsaW14NnVsLXRzYy55YW1s
ICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0DQo+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL2ZzbCxpbXg2dWwtdHNjLnlhbWwNCj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vZnNsLGlteDZ1
bC10c2MueWFtbA0KPiBpbmRleCA2Nzg3NTZhZDBmOTIuLjJmZWUyOTQwMjEzZiAxMDA2NDQNCj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVu
L2ZzbCxpbXg2dWwtdHNjLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL2ZzbCxpbXg2dWwtdHNjDQo+ICsrKyAueWFtbA0KPiBA
QCAtNjIsNiArNjIsMjMgQEAgcHJvcGVydGllczoNCj4gICAgICBkZXNjcmlwdGlvbjogTnVtYmVy
IG9mIGRhdGEgc2FtcGxlcyB3aGljaCBhcmUgYXZlcmFnZWQgZm9yIGVhY2ggcmVhZC4NCj4gICAg
ICBlbnVtOiBbIDEsIDQsIDgsIDE2LCAzMiBdDQo+IA0KPiArICBmc2wsZ2xpdGNoLXRocmVzaG9s
ZDoNCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIN
Cj4gKyAgICBkZWZhdWx0OiAwDQoNCkhlcmUgdGhlIGRlZmF1bHQgc2hvdWxkIGJlIDIgYWNjb3Jk
aW5nIHRvIHlvdXIgdGhpcmQgcGF0Y2guDQoNCkknbSBva2F5IGZvciB0aGlzIHBhdGNoIHNldCwg
bGV0J3Mgd2FpdGluZyBmb3IgY29tbWVudHMgYWJvdXQgdGhpcyB5YW1sIGNoYW5nZS4NCg0KQnkg
dGhlIHdheSwgYW55IHJlYWwgY2FzZSB3aGljaCBuZWVkIHRvIHVzZSBvdGhlciBnbGl0Y2ggdGhy
ZXNob2Q/DQoNClJlZ2FyZHMNCkhhaWJvIENoZW4NCg0KPiArICAgIGVudW06IFsgMCwgMSwgMiwg
MyBdDQo+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gKyAgICAgIEluZGljYXRlcyB0aGUgZ2xpdGNo
IHRocmVzaG9sZC4gVGhlIHRocmVzaG9sZCBpcyBkZWZpbmVkIGJ5IG51bWJlcg0KPiArICAgICAg
b2YgY2xvY2sgY3ljbGVzLiBBIGRldGVjdCBzaWduYWwgaXMgb25seSB2YWxpZCBpZiBpdCBpcyBl
eGlzdCBsb25nZXINCj4gKyAgICAgIHRoYW4gdGhyZXNob2xkOyBvdGhlcndpc2UsIGl0IGlzIHJl
Z2FyZGVkIGFzIGEgZ2xpdGNoLg0KPiArICAgICAgMDogTm9ybWFsIGZ1bmN0aW9uOiA4MTkxIGNs
b2NrIGN5Y2xlcw0KPiArICAgICAgICAgTG93IHBvd2VyIG1vZGU6IDkgY2xvY2sgY3ljbGVzDQo+
ICsgICAgICAxOiBOb3JtYWwgZnVuY3Rpb246IDQwOTUgY2xvY2sgY3ljbGVzDQo+ICsgICAgICAg
ICBMb3cgcG93ZXIgbW9kZTogNyBjbG9jayBjeWNsZXMNCj4gKyAgICAgIDI6IE5vcm1hbCBmdW5j
dGlvbjogMjA0NyBjbG9jayBjeWNsZXMNCj4gKyAgICAgICAgIExvdyBwb3dlciBtb2RlOiA1IGNs
b2NrIGN5Y2xlcw0KPiArICAgICAgMzogTm9ybWFsIGZ1bmN0aW9uOiAxMDIzIGNsb2NrIGN5Y2xl
cw0KPiArICAgICAgICAgTG93IHBvd2VyIG1vZGU6IDMgY2xvY2sgY3ljbGVzDQo+ICsNCj4gIHJl
cXVpcmVkOg0KPiAgICAtIGNvbXBhdGlibGUNCj4gICAgLSByZWcNCj4gQEAgLTk0LDQgKzExMSw1
IEBAIGV4YW1wbGVzOg0KPiAgICAgICAgICBtZWFzdXJlLWRlbGF5LXRpbWUgPSA8MHhmZmY+Ow0K
PiAgICAgICAgICBwcmUtY2hhcmdlLXRpbWUgPSA8MHhmZmZmPjsNCj4gICAgICAgICAgdG91Y2hz
Y3JlZW4tYXZlcmFnZS1zYW1wbGVzID0gPDMyPjsNCj4gKyAgICAgICAgZnNsLGdsaXRjaC10aHJl
c2hvbGQgPSA8Mj47DQo+ICAgICAgfTsNCj4gLS0NCj4gMi40My4wDQoNCg==

