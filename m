Return-Path: <linux-input+bounces-16789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FACF574D
	for <lists+linux-input@lfdr.de>; Mon, 05 Jan 2026 21:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E9083059EBA
	for <lists+linux-input@lfdr.de>; Mon,  5 Jan 2026 20:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7163191A9;
	Mon,  5 Jan 2026 20:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VE50oyy1"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E38D30AD13;
	Mon,  5 Jan 2026 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767643398; cv=fail; b=pP6jjMFcEpMpWyQLH3ky7hyqAbZd5JaDyE2nN5SiO0cNAktqgwJdQj1jPxqWukgcX6ENOtLHE47S6eyqIhg9qn3Is7J0mDoHQG0m5HUZm913EZ7MDc2ug20Ll64fVaye033FhtwsclNHxVaUrxAeimM91cf9/9NIo5JeHGJ9+78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767643398; c=relaxed/simple;
	bh=wq165rQgD2dl3MNZXr0xa040FNUkeKEh4JH6JEjJ0LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vz+AYbhRRoGG1FsrrYzf0R5oQdeod1GA+Ruo1TWljQgDaACqxGkej3o+bhkkFwzDUa2ivlWrvrlakC+U9NLxxj36VZY/sEq3boQWdrn8lLBsS3I/VK09MmsSHdBm3PRo7QeM3wBMga4gNSqcpcYW8i1BXG24vW/6BKDLWBXfPM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VE50oyy1; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpBALbOLfTU0IUTGmAojj/rw/BwoQCCZtREN7C47Im1FoVm9JyF8Dc1xYPaWG9uOx0yER+uZ8cHmVRhb8r8dqS0xmyYueqRXfmmItUaMBP41xlbZQwhrAD74Sq9yDokwu9UAdgUpKBfWcq0esk596Ds3aXELl8kEe1iG+uBa++wdH072smn54GmYE29PNSo5JmYQ1x2EPpUU6M/8dzdZIUeL6n81hHjELg7FFUlP59JWGofcyx3NABG4Jqsbor9MM8LVXvJSY74sXFdP2Xy8uk3E6cgPrIYzimAprrw+mS8A85JchYhzdwYVp1EoP+SM47MxR7zwNVofPff1Kqb9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0Axju6lRqQjr/qmFVaBxTIDIYx+pBxbEuXRqMSD9qk=;
 b=LQi3AY0z65rGaRYVeeXeMoIopzo9t4bY7py/TxgpQioOwLmro2H0UpY8rBGiVe1Nzhpxopqk2DPC/T7Q1qTEWymVWVwx5XEOC9b6YXxXYFYsU8+67NbW5PRbZfK4i+Iah5J+93eY7SMNe56a/xe/ulKsK7/BeXZAXkU/WsgMIATsT95EGUDHMlthF5Ie1egabIrpHpEMjdpqv1rFmU3zNILkG3VDHgFaXFoc75XcznSOS4gBcYH5P86xX24WqPQzYGLyBxXQLLfWdpNcCUjIHT3mgw93B8RV0ZtBEvXGZ9CUsQQG11RrSni4P2cgLgPJJ3rve5d1Omu/P1apBgl5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0Axju6lRqQjr/qmFVaBxTIDIYx+pBxbEuXRqMSD9qk=;
 b=VE50oyy1yyHyAotAZCpAMnYG93GwefkHQGiZ1hsXJrZTtHttJB2FlZuuazNjZEx8Z7BjNaTPqhe1Xru2X+5+H6iegq1bWvQSiRppx6AOKrX3Z8M6ufmCLRzapjV+QEyL7fW9hm4bxcYzM7fiEX9PZtWp+w/bbu3YfuAEfn1yaw7yHS6TTgzpQj4HlLIYboYOfTeykTiN7PTuOmux61mQdMF9qvYDnjgiLH3kzv+ORtGiJ29AGRMUp11hElcws81Uh+hQVU+tRd1xBO3mLIa+ycA2s1UTOporH83gysBPl9v7Jflt8NizdnK4XPW5zNpYavOpHMfjqOUq7y7CMk40KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU0PR04MB9694.eurprd04.prod.outlook.com (2603:10a6:10:312::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:03:13 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 20:03:13 +0000
Date: Mon, 5 Jan 2026 15:03:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: input: fsl,scu-key: Add compatible
 string fsl,imx8qm-sc-key
Message-ID: <aVwY+aU6ysDBKcus@lizhi-Precision-Tower-5810>
References: <20251028-b4_qm_scu_key-v1-0-9732e92a5e83@nxp.com>
 <20251028-b4_qm_scu_key-v1-1-9732e92a5e83@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-b4_qm_scu_key-v1-1-9732e92a5e83@nxp.com>
X-ClientProxiedBy: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU0PR04MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: d6361667-d05f-48f1-8fd2-08de4c95752a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E8yB/DVGneqmGUoQp71APtRv+HYD7Nf8oYRflShTYjKvNBZfgh1Li9lZuDOe?=
 =?us-ascii?Q?FClLnM3L5NYSD8cahKmZmGRxOQpwe2houmn3uePIpAxKY8A+Ee+nZ0G0DRHy?=
 =?us-ascii?Q?ozJGP+pE2qkGA1OIpKI2L7d75POpVxGSdDZwo6/K5703HVZwhkF9HUd1H+7l?=
 =?us-ascii?Q?B2V3M535k+YNekM2Orvc2ecH9eDMpj/DfJgTB0N4RrXvX+nLrsthPyeLhAhi?=
 =?us-ascii?Q?9hxYUB9G9w+r0KG/NB3AJt7qr/pvjAUVNwP596/qmH40KhJMbI8osIzGOswD?=
 =?us-ascii?Q?iM54/Lj+DT0SHQp5b3qY6Ek4XDclHWwv5ordxcHZL5EiP/j8li0RiNRH6C0S?=
 =?us-ascii?Q?5iWj2+57FG4465egfi5PrS8FyZe7ILvO73cZ9uS1tfDi7krhR8kcQjtrJESv?=
 =?us-ascii?Q?e3A6c9CuU0GAWg6y5vRHPB6Ze8VCWtklmLfSMD1aiEMOrb/+8g27Z790vtFk?=
 =?us-ascii?Q?/KMy+gLeslpJx0Fd+BhNHoABZLqvSQwkfK0TeiJCMIGhCXtRJ9B94wJXQ3mX?=
 =?us-ascii?Q?em/XBMyW8LT7H9IfRwBDSLd6hjAbuOyM93wMs/E9h9kfjfyBw57ZuwWMSkp6?=
 =?us-ascii?Q?dq+Fhu0hzjFXWy3cDst65FRQZYpkOpDJIAWZTo/11NOVtL355Py8NDHD8nEo?=
 =?us-ascii?Q?gxghjz+Q6uWXQTjgAl7F6gugxndsLCUwkHdugWKwk7+u2qxUH4fJP/oQX+88?=
 =?us-ascii?Q?0NkWJZcGhttCBQXRAiinyPhGYG3D1/Zgs1gB9tjc8qTv/WMmPW0uYRouHG/4?=
 =?us-ascii?Q?92ganJJV6Lvj9K9O8BCmYfrJfC5JghCn8uLT72ELKui2yfZDHm1YE7uekj98?=
 =?us-ascii?Q?5NrBNskuXnQbR2tciSfAj3N7hbyr3kRwCbpLV5Nytlw8CoOYR+fL3led/lo9?=
 =?us-ascii?Q?X2rIzt1mzv1/cHt+wfXFNGb04L0J6pvQ2l5kBq7asT+ZbmWC2cHv42KgQ3vt?=
 =?us-ascii?Q?VKsw0CD529Ar39fWW1YmYHjMXv+khultKVgT3Oxrtffvi3t7008r8o7WXNI3?=
 =?us-ascii?Q?OL1r/dPVy1WI/osNN3D+CFLVa5ZXfZZSTTJIF/g/Mkjj8SBCfofr7Kamamf8?=
 =?us-ascii?Q?XTbHxGWit6uuguDQGp9LJgCguMaYsQY5uuiLUCc19vRbKcIeoDu6qOFFJ7py?=
 =?us-ascii?Q?duG/DOSfP6e5iKdkDVPmIPiNGYjkYuanyjO3Bhn7YY2tnwplI95PQ2GKAiD2?=
 =?us-ascii?Q?YoOs0YHD074jRwnz9swMg3UdhY36K47uiNmqxO2hmxq7jVlHCbEfn5pfvRpB?=
 =?us-ascii?Q?dzTsyORBbIionE0nrTddntzjMcJeGBCyx3wjH7P0hzcSWTbIjDkK6FyM7DPm?=
 =?us-ascii?Q?vYa5AZ1YIJ788+jUSQAvCCyo/TiURpOiNhrbHwxAm2d5wnjvQsr7/6co33pN?=
 =?us-ascii?Q?0BqcflBk6HkocgcoRTu6Sf0qYSVTyv/+yN/XUgCpwdVuF9ekgGXdwBGzj3ry?=
 =?us-ascii?Q?WRFprfmtidDW/9cVkzSOOE5g4239oPltOBEud6xX5A5e/VDHUTDlHkMzvmEX?=
 =?us-ascii?Q?05ERu4hCbp+5zjAVcUWsyQP4HdHxiU6/JOjq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O7JZFx1QCXnp7iJarwGZjTYMYl86da2WsICSU7VSUDNMWW6u2HAu9lD2qjoJ?=
 =?us-ascii?Q?mMm6WIwwa4CaIxK2kO/awSpHcQQ5Hhr/UeE0IhJazwwVdAetfbGe82EuRS2T?=
 =?us-ascii?Q?70fLa0FLPuB+SFZp9b2Ubv5Tq/k65eVrZtoGDMQ1CdK7PbnPpgsl8uvk/om4?=
 =?us-ascii?Q?5Mw7lTCibfqtHgrSHjcMW7FA04VWrdIKLTIe2L506Hoaa25EgtsfndAgTb/5?=
 =?us-ascii?Q?8+iSav7EpGDrYoYEcvb1v5BTYnK69C3dDuC/uVX2IdJehfha0qhjzjl1glTS?=
 =?us-ascii?Q?mpx52IZ3X1k0cRQf+rhAE2XVTRzgTje5Z6bzHwuy1Miiv91bDkb9WCAyPQni?=
 =?us-ascii?Q?O2uSyHvROothC9UAKe3G9lh6LtmHyoDdjac3VB3V+Q+OqNceR+N5JfJq9K0y?=
 =?us-ascii?Q?/Zv0haynG6fU8rxXGsXWFDlfc+jqyiHWw+PQCsPwdEfp2CBfxrNZ5qPaaWR0?=
 =?us-ascii?Q?eEh542c16KcMQoc6coI4x+86WX/nu2GnXwKiyoR8SPYNrTvlmt2MeUrub1pq?=
 =?us-ascii?Q?z/KBMSzn4RuTsvREh3DucTNDmCYwjKAZ51tliliict9ISGTgjCpFA41UR9M2?=
 =?us-ascii?Q?zX8BNAFhd8aJ1ikroC7Zwo+XKpeLlsvPZHgGglsI1ARa1q2cm790xR3vYoUI?=
 =?us-ascii?Q?ylxEwAzWCPRlYFBXzxFjMJHN1oqMVlTb/ZBEoUtiGT1AdXWLXVMh7d033Guu?=
 =?us-ascii?Q?CPKAfOvsKCPYCBqSFzglFaHt+NJIxjLl7U0sZgsjqmXSBwyy6p4fkLgpVBkt?=
 =?us-ascii?Q?llwM9+ha+imh5stJW+UIEM6ZrY0DgLnwsgYFrD90NJvO+j+pYc+O+U3+v72p?=
 =?us-ascii?Q?9Ph9p1yw00H5HO962GpMREAep2AagHmjbyV6nqECDrpLJV7nha33n/ZEQFuL?=
 =?us-ascii?Q?78QwpWhrx3/KBTr7lmHx8von9UYnSdU/Sc0NQEchGXyQPRazBd+WeqeA7lgS?=
 =?us-ascii?Q?Znjca0R8OFTMgHpPxavHmo2H0sOpOs8knyNn1+gtkVDacbfSbZvgsVRn8qQc?=
 =?us-ascii?Q?wsES7qLewz6SqN5RikDGYfJp1Xa1UcHZlxaPLZWAow51jZ+K4UZ2vXiARvxv?=
 =?us-ascii?Q?2SGzPv5FNZGC2jISKUj0ZbiMspzRlxyW5PUTj3oPThpyc2USnDD7ZkGEQAKX?=
 =?us-ascii?Q?wdNIzTr8yoBk12fcehBpVgU37mtFPxc2wDrcRWrmD0oTKBNV2wT/mg4U9Xg3?=
 =?us-ascii?Q?VX08jShEaXRZXpdk8qZPbx7VC+KuimPAJngKvcONOsLQK5a1BznMLdgqp4qf?=
 =?us-ascii?Q?kXYfrV7cFBTZBK4zQrXjh9BgFdav7eUbxp//jg/f53eL8XbMXzSTLc5Jsz8i?=
 =?us-ascii?Q?UA1KgXoIHzGhl8/qwGJ05hFurdFZCOqFeTErTr8dp3+IUYCYTINDY7s4O5m8?=
 =?us-ascii?Q?DN/fLYpVim7nvPt0yQrdtOOgRPSlr2Q+UL9eoPOaXp7QfokOFQAYdnmLy7VY?=
 =?us-ascii?Q?s7P5rmuwZ5ZmVw4Qgqe1l72PXNZfSwbxr9Jbmvdhl8aJ9eY0YKaPd69Ntbb4?=
 =?us-ascii?Q?f4k0nw3O5LDukebY5+QGNxFcS3uohxobwZLKQlLiaoGSlrQ5b+2qhFQcTuH8?=
 =?us-ascii?Q?Tm6T1oLWfuQrPZRF6R8rzxCTL25FBfvV3Q5xBRMNpVWBxppL00rRqSfHV3g0?=
 =?us-ascii?Q?FLIPM1d56pgUHBcrXRvC3KMbaWjyqXpQEKeSKMUA1iX4bgNYJQ8l1Patx6Cd?=
 =?us-ascii?Q?kD60FP4aV7InoQjVlnKIKUvMXyD1l/gNZNvHhxvbtnisEVv6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6361667-d05f-48f1-8fd2-08de4c95752a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:03:13.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gNkm/gA37U71jcKfE9yynd/QhCP9VIFWL+BrvJ5Md5R0Mc7o0pVrJV6YIuaUlrsM9kFstcahoyRcxXpM94/6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9694

On Tue, Oct 28, 2025 at 04:01:28PM -0400, Frank Li wrote:
> Add compatible string fsl,imx8qm-sc-key for i.MX8QM and fallback to
> fsl,imx-sc-key.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Dmitry Torokhov:

	Could you take care this patch? Krzysztof Kozlowski already acked.

Frank

>  Documentation/devicetree/bindings/input/fsl,scu-key.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/input/fsl,scu-key.yaml b/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
> index 29921aab9d9713c475654fd1e1e1ebe26a5e08d1..2566cffc252d7c426bcd94fa3c2dc90fbb664a9b 100644
> --- a/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
> +++ b/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
> @@ -18,7 +18,9 @@ allOf:
>  properties:
>    compatible:
>      items:
> -      - const: fsl,imx8qxp-sc-key
> +      - enum:
> +          - fsl,imx8qm-sc-key
> +          - fsl,imx8qxp-sc-key
>        - const: fsl,imx-sc-key
>
>    linux,keycodes:
>
> --
> 2.34.1
>

