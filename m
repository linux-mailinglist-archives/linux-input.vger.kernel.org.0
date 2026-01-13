Return-Path: <linux-input+bounces-17057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 05191D1A592
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 17:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78235300AAEC
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 16:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8050330F801;
	Tue, 13 Jan 2026 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XiX5APez"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269425B1FC;
	Tue, 13 Jan 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322480; cv=fail; b=KVszFrdkRGoQ+da/xmB4/3z0HupxLeXgz8bEr+nl958C3fpor/R0/J72xmmSbd6Qo7uLRe3D+6Mt7VnUVSBkyMxEWk7kiw7MdVbhRa+eSRK/3jGQhkmpqTKL77s8aJ3IqVhu+et0e51Qt28gXfk2w8rTykW29DyOSZ0X3h5K+1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322480; c=relaxed/simple;
	bh=clqEuNBx2Ciedckp+jZj2xNFAamLc/SohdVYttuHm+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zjb6y24o2y7jgVSxAmMl/rjecJjxByiMFtCjnXOemEqFfQpwfrIOcw1NaQSSN+lT0eq2/cuJo+4bStaw4uThKfr3PGzmdwK1b+O9klh5K7csT8PzeKBwf8nocXFueU1U/0lI5qNT/aQ6qq2v32n5TKM8Ovf398GLm6vu0WA2UOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XiX5APez; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1VYmdDVM6X0xtDzj3RKcfxwG+2ToklDpJ2rFcLoMQhXlrEasEwx8aSICACoI1QSoF8XDfxCCO9bQPEl8FszE9+ZFe6k6pqJ2fsOE17tRBzzF1UKaCKbW2iDnTyVicVJOGXDvTcuXSIww9x9VW9VzDL3MhNkFGY5pSx0d4+pr/k02HZJpCGJQmZd2uYFgMVPRrx5g0gXIcb1/BFcB3oXSGm8kE2IRlao5kvBS5OX55z8kyxNHdmrmujbdr94U5hD3AOouDC5wn78eOQdbVSOkjhx9u6oGbgIqneHlr6v/3JbRPZFeS0/rJIDTZY2FmJVIMtVjiPbJkHIu4R0GMnVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moR1Hrq4rk+MeYF/P6xf5Z6mULWNXzvdGRGfk1ovYGg=;
 b=x+k3FsLpYdhS8A9CqYcC6nDfyK8+PnjFXBRfiCLUJlxiD49MCoH+ixHQ/HoOy4m+nqiSRFW73HfvVvd0+43vuPeuYO70/RVIuO4nCSLJYYLuXXbqXrzXXVzNUn7PQM0g1vErv/Ujj5pT5+rfSVykvR/BD2nTyio4XPE/dy1whLda9BpH5MKDSJedbYj5AfH6RPEJwFsRmWhpYzWPoN+FwRS7tLXniAt+u5R8GPau0Cm0KgWtcitVzYL7O1DFvNJCU8tHpEor0jA+ZkQwZXto5jt25UnUDErJ+gV2vzdr4NxPHMc/12mFiWchsW/nD7SB60I1G1dUhp38NPM5JCwdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moR1Hrq4rk+MeYF/P6xf5Z6mULWNXzvdGRGfk1ovYGg=;
 b=XiX5APezguXJ7jEppSMX6+9H8Yw4FNaayI2xLWIXWEzPpsxLyojbHBzGkCcZmrNTBW64u0vFjRCdaSzeN8pPg6Pvju4Kqv7k1FyQhi81zOXahSA0qhyjwwtSJc47sTRCSg5JT/H3YXpCca0qKT5nkUQVqb6C/iVV/iLqYsy/m7IfPpjHCRoW0uBK+XjF563HgZeVwD25J0uGHp8bSEY1RekoT8IrpSCAoSEi4k81Rh92ZPJUqMQxR0UzskoOKlWQ9fuJTgEzjR2HgQFexy1dN8+IF5BiscSVjWv/uzCTMsznSm0NT+cRaeX2vraZ0/EoYtZ2lHpdJFWQPt6wNi81Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by AS8PR04MB9063.eurprd04.prod.outlook.com (2603:10a6:20b:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:41:15 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Tue, 13 Jan 2026
 16:41:15 +0000
Date: Tue, 13 Jan 2026 11:41:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: ili210x - add support for polling mode
Message-ID: <aWZ1pG5RRWlDSCwC@lizhi-Precision-Tower-5810>
References: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
 <20260112234534.225954-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112234534.225954-2-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::6) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|AS8PR04MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f9022c-d237-4e12-c5c1-08de52c2918c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|52116014|366016|1800799024|38350700014|7053199007|18082099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+ms88DpBnWbCGTDfw8PFXXX/OAf1iLjbELmX6QCELnshsunpYSWnXoRYTIet?=
 =?us-ascii?Q?dUGX6JClTuCZUU7uAuxyMU6LH4OOrK3n6DjHI6Vnpc6iYwW5dQrOJ6cIrWwM?=
 =?us-ascii?Q?ca8GBj+XNmjY3IEsK+VR3TV6D1dszD6vOC0hs5qPlBTpDIHH5wfx8pGkiHSx?=
 =?us-ascii?Q?JNWzj5CUEuT97x7kSyZmEZIRCp0HkMPuiRvTV9Wk4iezEbO94DO7xXTc9kW0?=
 =?us-ascii?Q?FtZmJkPRmNY9gAMrErLVdtCMutEbX+Mo5XIjpKK7Fx6tvV4GgH6EnkEojwxc?=
 =?us-ascii?Q?nTNMUpQAOBBmfrV2faEC2O7FjIoKFohNK0dakvzh1vUMVF6LtEuJki263YrW?=
 =?us-ascii?Q?dSrmffAMhctaJB3CrbcRx9NE8WB8+1QjmoRKTSi6CFsIXPOvXm9JDT2wCgDM?=
 =?us-ascii?Q?4KkPH/FIF+WTpEQRSgYhh/B1U1NxxcD03DqAw6soY+0W/Nd5va8x/aoVr86T?=
 =?us-ascii?Q?OlJ9UK8RS+l0hEp/pR6ChAM/ZS53kL0iS9Lstc6QT9PRS4ZtvgNgIi6dFptJ?=
 =?us-ascii?Q?G3OP9URfd/edT9/zU35QbThGsnSwdPPb4oxRgKl3dRL3H/M7aULqd4j8vsrA?=
 =?us-ascii?Q?5xMvP8iPMxXB1sHCV99Dfd5/qMKydLLp6rjBSsM7z/5zGyPbllTj7Ho0g+2x?=
 =?us-ascii?Q?S0xb5GuQopUBcz7LEe/qy9J7jfcVZNC0Qhy5yCQRA2F4LoDU5Ce+jAoV/yUB?=
 =?us-ascii?Q?hqMyHJZIfb/3xa7MNpGbp3uc/4XuQzm9tEkuoe8mG1bx52HX7yVY2BVAKYtZ?=
 =?us-ascii?Q?tr0G7dDmnN2yDqoqOecsBgifG7TzkSSelqWSguJcjv/Z4QY/Kzv7ObsmhKmi?=
 =?us-ascii?Q?6hP/jWgC8dJ9iv3TZU71Xqw7JbY94AXT5xCOvJsdhnUlKih1Fdc/oOuKclRT?=
 =?us-ascii?Q?K96xPoSK4bWRZsXXAcAoWjCM4/Jt85Bp0zfXBkk8fkrL4cmAqUh9fB+J0S5U?=
 =?us-ascii?Q?nyIaRF8sGFgE2IKd+KKbxgykCgIIKs1DW5iasDU7bTzta41/3SBSyuMH1q+D?=
 =?us-ascii?Q?cksViEhmLRu6uNwpqIfHYy2TFPoTuu29l3yHn1/fLzpiDzqdQ9UrovLLU4Fg?=
 =?us-ascii?Q?YUQtOCz+eUQHlnh2LrXc8xZaRE7xmcxjY5LyeCD7kVpTs8byWqdXKM8JOgN0?=
 =?us-ascii?Q?6xSgoH8qjRZekTRu5T3/Djd44g6CcN5jvHM5FaGxHdptLdCctDWFriZIgJye?=
 =?us-ascii?Q?AAXCocUd8kIgjYXMuq3+Tm4XkHDLfNKj9gey5IisGzmPUgNxYdVb+Tt+P4C0?=
 =?us-ascii?Q?B5JNNIfXXL8HTo0RnHqNVYB7Fz9Uid0HT2VpF8TaHM0IJOXf/PEpD6NFygbv?=
 =?us-ascii?Q?DIVLcgy1jn2/QeAGjq0bogiKcY4J+qG3e2ZR+XL6dx7HrhpqlfcVv+M+7sUH?=
 =?us-ascii?Q?l/jN9VleAGMzU1Dt6eUn+hIPbUdFFIVMTOCFbZp39GOuD0F8tKhl4NRtkf0e?=
 =?us-ascii?Q?ru5t4sNRCsagD3YbCtnx6phRW+qOUKnY9Xrb12lNxTPrO5AGEraqabynEZyw?=
 =?us-ascii?Q?vEYuAKZ63Q5QeHwEp47TOvvBLZR6htpexup3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(52116014)(366016)(1800799024)(38350700014)(7053199007)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EqvwMfj2TCMoyK8EjrJdTelJjzW3SYc+delkETpiUJW3FJvt8n2oWz+RSK9r?=
 =?us-ascii?Q?JqM5Imf5pYZ+ozcUCwpSN0qRBfG328/nyaqh1i86vtMTTjW4hnX2POd/c0ci?=
 =?us-ascii?Q?26DsQMvrYpxgLE/Gr6xDvAnB+f8vvFyl6wIPPJMCHRDLWgsVjn9FFZ+Xl/pg?=
 =?us-ascii?Q?bzpJ6apoznVEej9W8+Y+i1yEPThiXca09jWVX2asqT7NNB0SaobCCkIwd8Gm?=
 =?us-ascii?Q?NNu5MFYFoaR+cr06Jy6NjvxL7Wy+OKQY0q1nQU+bgAFoOpOrGpLBgKf18jRB?=
 =?us-ascii?Q?XEkhfCpqTOzjV9+eDsn8rHDoSheKnGIMVm2PKWCj5T8Cd8T1o+h+z6OJrkcM?=
 =?us-ascii?Q?B541hI7xe2bMobyp/bc6ZVGrl8pbtrZUKy53W0p8WFrm4ydznvi/rIzlikL0?=
 =?us-ascii?Q?XrEHphTuoeowpssS2Me0s8T9XSNliskQ6XkUqh+RUEkhy37HFiZ7lEa9uc7S?=
 =?us-ascii?Q?Re/A1NFE3zbYRs6mXuU2HEbxsEsMu83QWE2aTUAccgLMVI19og2kOy/kQtA+?=
 =?us-ascii?Q?zVIixkh+27DPmvkZ0kYOc3EL8S047aB5oJ2vUiYYv0XhxtucqRYsmfUuQ+HF?=
 =?us-ascii?Q?Pdxdl1bI0tOBzolBgKL5jZIyv8xDRrw+oYXd0IM3/UBzTNTOYhsB/ef4yx4T?=
 =?us-ascii?Q?nIME033lBmCPG/qtdXNMo6OVqV8ZfTCeWzMmTaJJ7pX87ig5ii5eB4YPkAbs?=
 =?us-ascii?Q?h1eegYfBYpf8Vb3cIgK1mFvDvNE3c0mhUYDq8mOvRzcEAY8v7Rkpo+5RzKuZ?=
 =?us-ascii?Q?6RGFrAU5P9ndMlRew4jqUbwhakli/c+K8EBddAACOLGaXlmpId09hVAJANJM?=
 =?us-ascii?Q?so8s1r3nbR1RY29LHBGaCeEbpRFe0fL3TllnHdOfuM7jJ4nNrIJ4Vk15vTzc?=
 =?us-ascii?Q?qPL4KaH0rOHLU5zlzvug4nnHQMl9C3+6705EuYyZL15KpzDu+y5G14rWL1nD?=
 =?us-ascii?Q?Py+6fBkaWAB0AA45Eo1JhBVHQ1JOTew9YGyJwMOPOFbGd3MnIN38Yg0oUBZ2?=
 =?us-ascii?Q?jD4s3MuvidVjKI9DQxUQl6zb6V5nSe7EoQ8OkrPWym2dpHodwBQS+PSYbTM4?=
 =?us-ascii?Q?1L/6jpz3SrlBquVm6r3zCOKrspOV8z82dV5xGvHkE5dc7sJIf6oFT1ltofs0?=
 =?us-ascii?Q?5tRvFjhysH5QO90Zfr+u4aI8e3mBMje0XHDDw4W4go/W6mhBkPGsp39bgOJ1?=
 =?us-ascii?Q?XOBGlRQZPQ6TRdvjvmqzh9QW1TD8KjA2/Q7+jTEFT+3Fr7aER4A73h7HRfJF?=
 =?us-ascii?Q?hiQGeidxaBUlV/ncXTkBPuPp6XZD2tX2JRSHMjQmfxaI99BfZLI4ytov21/J?=
 =?us-ascii?Q?gPrbmXY9JcZQLj73Go5KpKJ0psGYZ9BGxBJh+T/0AStLf3bh+b3FmFdzdf0H?=
 =?us-ascii?Q?9m5/0WY7UmMdRvVj7LBnzWQ+C3yF91E4BuE9tYhd0V79R+ZMQpxipcUYzeAv?=
 =?us-ascii?Q?r7pFjucqJ4Yu0WmSbH75te1Z4uN0AluNi5Z0cO2VzPn8DmwjOXAeqIZucu0o?=
 =?us-ascii?Q?VCEM5xxtqXzw0L2+sxaDagc3RvUjfJwaz0meiQRIBE77DuCz7UJ0lON7yCBj?=
 =?us-ascii?Q?0mpKlktq/qah2W8YgFovgiaAbw09932m49me5BG1KKYGU322Mqfq8kYo+VXW?=
 =?us-ascii?Q?tB2nAuvZJmaYtJWI9gqQZDRGNjfu8r6xGqKjLddxhQmlJEB+mghrHRCvDtJi?=
 =?us-ascii?Q?dT/fRVmIaFXcPvkz0KuosU/SzZdzEwMgMQz3SkQMVq/MgvIS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f9022c-d237-4e12-c5c1-08de52c2918c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:41:15.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQc46wGAI61D9y4BXG0XK+Cyc8BQ0+A+XdL0ScYiioE5Tw5KM7elePBvTxW8EVR1b/IV+rn2QCZR7qFQEYv1Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9063

On Tue, Jan 13, 2026 at 12:44:57AM +0100, Marek Vasut wrote:
> There are designs incorporating Ilitek ILI2xxx touch controller that
> do not connect interrupt pin, for example Waveshare 13.3" DSI display.
> To support such systems use polling mode for the input device when I2C
> client does not have interrupt assigned to it.
>
> Factor out ili210x_firmware_update_noirq() to allow conditional scoped
> guard around this code. The scoped guard has to be applied only in case
> the IRQ line is connected, and not applied otherwise.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Job Noorman <job@noorman.info>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/input/touchscreen/ili210x.c | 84 ++++++++++++++++++++---------
>  1 file changed, 60 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index fa38d70aded7b..3220848a4b843 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -327,9 +327,8 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
>  	return contact;
>  }
>
> -static irqreturn_t ili210x_irq(int irq, void *irq_data)
> +static void ili210x_process_events(struct ili210x *priv)
>  {
> -	struct ili210x *priv = irq_data;
>  	struct i2c_client *client = priv->client;
>  	const struct ili2xxx_chip *chip = priv->chip;
>  	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
> @@ -356,8 +355,22 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>  				usleep_range(time_delta, time_delta + 1000);
>  		}
>  	} while (!priv->stop && keep_polling);
> +}
> +
> +static irqreturn_t ili210x_irq(int irq, void *irq_data)
> +{
> +	struct ili210x *priv = irq_data;
> +
> +	ili210x_process_events(priv);
>
>  	return IRQ_HANDLED;
> +};
> +
> +static void ili210x_work_i2c_poll(struct input_dev *input)
> +{
> +	struct ili210x *priv = input_get_drvdata(input);
> +
> +	ili210x_process_events(priv);
>  }
>
>  static int ili251x_firmware_update_resolution(struct device *dev)
> @@ -829,12 +842,32 @@ static int ili210x_do_firmware_update(struct ili210x *priv,
>  	return 0;
>  }
>
> +static ssize_t ili210x_firmware_update_noirq(struct device *dev,
> +					     const u8 *fwbuf, u16 ac_end, u16 df_end)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	const char *fwname = ILI251X_FW_FILENAME;
> +	int error;
> +
> +	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
> +
> +	ili210x_hardware_reset(priv->reset_gpio);
> +
> +	error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
> +
> +	ili210x_hardware_reset(priv->reset_gpio);
> +
> +	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
> +
> +	return error;
> +}
> +
>  static ssize_t ili210x_firmware_update_store(struct device *dev,
>  					     struct device_attribute *attr,
>  					     const char *buf, size_t count)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> -	struct ili210x *priv = i2c_get_clientdata(client);
>  	const char *fwname = ILI251X_FW_FILENAME;
>  	u16 ac_end, df_end;
>  	int error;
> @@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
>  	 * the touch controller to disable the IRQs during update, so we have
>  	 * to do it this way here.
>  	 */
> -	scoped_guard(disable_irq, &client->irq) {
> -		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
> -
> -		ili210x_hardware_reset(priv->reset_gpio);
> -
> -		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
> -
> -		ili210x_hardware_reset(priv->reset_gpio);
> -
> -		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
> +	if (!client->irq) {
> +		scoped_guard(disable_irq, &client->irq) {
> +			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> +		}
> +	} else {
> +		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>  	}
>
>  	return error ?: count;
> @@ -947,11 +976,6 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>  		return -ENODEV;
>  	}
>
> -	if (client->irq <= 0) {
> -		dev_err(dev, "No IRQ!\n");
> -		return -EINVAL;
> -	}
> -
>  	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(reset_gpio))
>  		return PTR_ERR(reset_gpio);
> @@ -1003,12 +1027,24 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>  		return error;
>  	}
>
> -	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> -					  IRQF_ONESHOT, client->name, priv);
> -	if (error) {
> -		dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
> -			error);
> -		return error;
> +	input_set_drvdata(input, priv);
> +
> +	if (client->irq) {

0 is validated irq number

https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/base/platform.c#L284

if (irq < 0)

But it is strange that touch don't connect irq line althougth it works,
touch generally is wakeup source of system.

Frank

> +		error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> +						  IRQF_ONESHOT, client->name, priv);
> +		if (error) {
> +			dev_err(dev, "Unable to request touchscreen IRQ, err: %d\n",
> +				error);
> +			return error;
> +		}
> +	} else {
> +		error = input_setup_polling(input, ili210x_work_i2c_poll);
> +		if (error) {
> +			dev_err(dev, "Could not set up polling mode, err: %d\n",
> +				error);
> +			return error;
> +		}
> +		input_set_poll_interval(input, ILI2XXX_POLL_PERIOD);
>  	}
>
>  	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
> --
> 2.51.0
>

