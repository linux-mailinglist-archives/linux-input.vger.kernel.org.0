Return-Path: <linux-input+bounces-17056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAECD1A571
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 17:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A6AD3012BC1
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 16:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6662F6927;
	Tue, 13 Jan 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bOPVTB4K"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013018.outbound.protection.outlook.com [40.107.162.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400D29D27D;
	Tue, 13 Jan 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322119; cv=fail; b=C11ntDDodWShTmhhKYlYhMHt+kpyOGV2Lmumun4yBBPRoRsLt+OP9iLAurDV7z+7yWnTzbPMEloiXej6DOf7nrCX2bX3euXbSR3YMNfd8PRduD9MbiDudQ5zE6DYhOFWii6TXduYKGSt4Vcc86V1vqAC9JbHFkCD5xLZF87p9qQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322119; c=relaxed/simple;
	bh=QLnfGA4u2zx+2sKKMloI/m4h7BQnj4vp31a/qK+g1aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ehkilZcPA/A7b/WoEUq+MU6TNYBoyvut+Ik7F+9zUh+bTiMADZ3D9HLKl29FK08PFu+utSi/YD//nTR2FyF6Y+scD4/GwGpM5yeujDnMWfnBBcdvxMimP3NRxjeJaMrEFBS1Isfy/trRaQNmDLMS4nTUURei48OXhJCwO09iFVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bOPVTB4K; arc=fail smtp.client-ip=40.107.162.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3/iwcH5JbCxbgjXMLB7nIhVNeLVeXneklUgOB/3h4yyjHi4rMEMkevulHDMpPJwNw0Dqo2+iFD0xAiEEZLD3fhZ+fCGUQPoUOByGvNGDvYxHoYrTUIpIlkKwjY76NTIsG1CziMT7sMr4ZkfNcyzsudwZq4uhzrEPWZ69nTECvQfBa1Zi5GPpmqQ7Z+GoOGdvUfE530pn3/pKCSkNIpGHsPAymbd6LJDOiSSBmDruMsXcWjKQgKs8SoxLZdjWJNwNtwxt+Ga77X89nWe0mIphbTrt64qcwPQv6Zlrae6eaoKxYa8Y0pIN/p6Dcxha6G5z+q1mOJwDjTVoohMspWioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FWYKb+2Uun/ftE2iUTGaddtR8zz8u3d2rXCcmwshaA=;
 b=sNFfZghZMDscd7f+Cu1yNPRE8qY/5tTYUYnXvbdAQgen1kKWS8SOGMhgfAp9e9qiQw64trPfWlR8B8Cxv/BX5hDAZv4lxBvYTbmwYKRyLp2nthUEw/3Fj3mIF5a6J+KPwuv2PblJlTcQdmUGuDgz4+ukkBHmB5ZHHrkOYakUMeyBB7GOdHVg1qhr2yliKxCQ40hv/imcuU/V5JX67L3z3Q0eIXFCxQ1XR5ZReDj6MdlnkIzjDiA6ccLXXDHfJNPxhYEl9vpLZxmngTncrfgxwnNBZI1Gj1JOWwrQdBXSu9HqkGsUB/nlqSZna65kbNMLDAaiJEbzevBaAS4ngTZM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FWYKb+2Uun/ftE2iUTGaddtR8zz8u3d2rXCcmwshaA=;
 b=bOPVTB4KQ70z87Y1fj6V93z8xcxQg7JD0WEkTq+L2XHgalNiZ7n9KIPJlLuUhsVi94vMXyTmxlz3J3BvaVfdMC0vY9scDPVuhJxXYyGtQTDF6KwgP1OBspuaJHKWTgHiWVZ2U5j10FMFBLzN4w2NHqhoXk1CAzVI3JwwyUgsAgJrWzrstAFO/B5tnWiixFGW4DzV+uWyg4CxrZ3WTJK3GIjdMFgxSKnzBiaWJgza04rnuAt/bZYqW2dBkEaISD0ZAEd2Yf+geKCRmNfEyO1xDotcihKpXafW3+ZEDxw5HaZ4DRgOcvMsn39YvSFcGwxqvBqRBe7JxoPWZ96smZflMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by PAXPR04MB9446.eurprd04.prod.outlook.com (2603:10a6:102:2b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 16:35:14 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Tue, 13 Jan 2026
 16:35:14 +0000
Date: Tue, 13 Jan 2026 11:35:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: touchscreen: trivial-touch: Drop
 'interrupts' requirement for old Ilitek
Message-ID: <aWZ0OQpQw814smri@lizhi-Precision-Tower-5810>
References: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112234534.225954-1-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|PAXPR04MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: acb604c0-9d4f-4ce8-3a1b-08de52c1ba51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|1800799024|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XSrH1BPxtOoJnh1qvIE51/p8o2e69EIFuIXHHtVyg9byiOVro5kBSxmVXQD8?=
 =?us-ascii?Q?UuXIWpFAy/j9fh1JyGHn+qU1tScNzbuTsu77P/5ZJPwcgrRnb4i56o+05YPR?=
 =?us-ascii?Q?STA+gwezYjqOn6nh67j2cTp8nTpoAWR/kpN0NsaEVR9g7yespxSF83qyYM84?=
 =?us-ascii?Q?mDDANMaGXpEt9hY+Pz6NwJ31FHOsj3b8Jx8sZf9E7YSQGePBiOML7l2fD/FZ?=
 =?us-ascii?Q?KD+n58GT1NCniG7SujkD7GkF0h9c/VOfMOhBWZlUSCsGU5T/iUs57cEHxvp+?=
 =?us-ascii?Q?jmH1QP8SiKF6xYEEBdKy7udPmnE5+S+YcOR3wBfkCuteKnTLCxIRxdW3ORbX?=
 =?us-ascii?Q?ZLetQbbd06RKnsKVDIMXvzKgEtT1nCcl6WMkcD2nRyWcvAYYEvioLH4GcU+k?=
 =?us-ascii?Q?waAU5vA4wPbv9ZlItkIylgW9g6KtiistBAYMpFiqeOSFoJ3Tc8ES0BwdYz51?=
 =?us-ascii?Q?9QcAJwX1B2xYJbAzkvQb63XJcgi/bQeRIw3lYgJct8RSYRqc9up2H36GU+vh?=
 =?us-ascii?Q?Wp9nIrtMcBJPQr0+7XKUVkQpQJp03p8GwmiXviGK+1IAS6nD1nXHiQtfIfol?=
 =?us-ascii?Q?JDy+Tx/zv25N8xg3QHxavGrFAdFELi7QbSb4GKqZuyfavoihT+A/jXuBQMpP?=
 =?us-ascii?Q?cEawgWImFWKuHoq0QO2lLXts1hweHKT4AbBgb+c6S8PfuydoRVdnetgDX+um?=
 =?us-ascii?Q?er6im+0ISZllrfBfZm4TryKRCogS2NLTF41oNJmXhdE593XGXVVjqBznRK0E?=
 =?us-ascii?Q?q4PuMpvZCPI5gikKHxlRR3LUpxVOB9kMPtFiSAK9Sum4908d82eUZxJ4VQ9a?=
 =?us-ascii?Q?EzqbdpyjfnhkLbkDvhgORWNbTX2ntJ3IsHN0zEKLAuoej6WC/xVni8aJ2sAR?=
 =?us-ascii?Q?sbE9UEXAbGu5Nr60Y6dYUs5flGway4QS+cKu+1rJFBW3y6xZ291CNyeFAuah?=
 =?us-ascii?Q?wmDGK8VXPuwbfAXSLQEi3PS4hSc1N+yML9G/cYUGvMvJ8ziVNZehoChXDV4/?=
 =?us-ascii?Q?CAAYtJE9V0/lPSBVFX4umS3NY10Vn/ijbFL9SBCiSOCDbuJZeBKyJk4+yvjD?=
 =?us-ascii?Q?TL2jD/OtVh/Ier//QF3tsUjj64/MC2PGkXtkOC6rndPtkQcQbgDzQZkwNhOs?=
 =?us-ascii?Q?VHaROpnR+uFFXLY5Ho+0qByeMvkZ2vZ5BinLMebu6K8ogLeOFj4ZoZFqBB+M?=
 =?us-ascii?Q?sHBfle+hGj26KJemfzYIv/VZeML1/cd2ZpqvN4osIO4j2CDW5k6n2/ke7Q+0?=
 =?us-ascii?Q?tvnEkBQB7269tE2/CFdFleT5/ZjMhQH8CianQefrUwZsB1XJIZe8vs42ZcfB?=
 =?us-ascii?Q?grWAYs3N78tdClQqoQg0Swr3OJj2xoHv+s+1MPn/SJmkK6CnWHDoVKHw11/U?=
 =?us-ascii?Q?e4kDI8NTRULfbdPrOVyScsj+lGUktrB7E8ZZHP2/qx5+eQgeeaGSPRtDY2YT?=
 =?us-ascii?Q?2SJKk/OZn3+TnJD/YfBQQuWHyUex8q4C4xlmFu7GyE6M5XAgE/nX3EQtSG9D?=
 =?us-ascii?Q?ql8HgHarczkROLvWiogfgcVcRk5zcC+agA86?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(1800799024)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SdKMYPt35xbyv+ehggNpAm/ZtCHK/09POGA78crHIfnqEKEdTS1vLBp/q/Ne?=
 =?us-ascii?Q?Gz5s8qLUOLBQ/guALHuVtD9vReDLOPi2vTVngLnxhloVuRTCWlpXtKYlVeHj?=
 =?us-ascii?Q?YXwCvKmUyJfyoulX1ZIoaCTVLz0zhQ2kHA4mNJ97r7rqgQgrJVRmEBMGzgqq?=
 =?us-ascii?Q?643kswXzyJr0kws1J/xUJgEjmKTuGF0L6DbZvD+BpntcnIsYP48hT+F6RFFp?=
 =?us-ascii?Q?dJdLUMSMKqz1Poa402cfTbavBz6tK4FvDkCm5INwz4GOZt7UqBcKk6ffVh+I?=
 =?us-ascii?Q?onMmC2FcTGMLxUAMiwGtzu8lgYTtAdmBdNmWxOO4ipnZifzMTurDQqFgWtrS?=
 =?us-ascii?Q?/7gZpzEvvS8BE6uKzzG8x0QB8XNYJXhsrkItv2P+IdIqjR6uD9ikeHUm+Iir?=
 =?us-ascii?Q?u0SmE8yIjsoXRtnlRF7pBjuMQZxb8R6EGU9JMsPnuWLBjXBbc3s9Gz4VvkhO?=
 =?us-ascii?Q?MRXlRI/Csb5qmvg+HiQ5ZmKBrPNFL70BUDe9hmDkV9ro0M8MlHSEmxEbUDuy?=
 =?us-ascii?Q?XTaSPW3Ff0lVWOfMsWybXvHPDXhqO956lE0IstKfb9YWhI+YNFt8vAssQe1S?=
 =?us-ascii?Q?fCmhnHBboFhLdd1+0aniyUAaK/T+pqwyTFCMGwtY6lS2JIdNGyxu0t57SJq2?=
 =?us-ascii?Q?IZ1oYNsekcPAp9lEUvYI5wxJfs3ITRz0Npf2kteSpabOU2I9iFaeqH/lOAHh?=
 =?us-ascii?Q?lP4aSYrLoW62MCICBr1GGzPrwC6akNsFadzBEjoNjIj7KvjyekTCBtEn5Q9q?=
 =?us-ascii?Q?1wfPbgcFRMNGR5Z2a+rXycBGcb4eDHGSEaaYwMi/4efluMjfyrMlhhinihR+?=
 =?us-ascii?Q?uRV2+2ArBEJjlZmvxt7HoGRh8B4RcQzNN+tttheIWnNsBthpNQtXCvxJ1THW?=
 =?us-ascii?Q?RB/laactx8fkw7TSa6AnBGBnEd0r/NP/ZBauwT4OYmRVDo3+esjv3Kj5DbvT?=
 =?us-ascii?Q?23OTHw9lWE5xfoqpF7eLniYslKfpFakS0Ew3hiIkT4us0gA0rZmusU+5N6DR?=
 =?us-ascii?Q?/j7pHq596LkD7y0WIoRswAVXZsTIXQLCZRR1rVsMcwRjrwW1NqKnaxlvPWYN?=
 =?us-ascii?Q?5mI1QZxUYKPvlixIxxVKBF6atl6B0wBo3cSHhAZpb2yJLYqqZdqgFRXh7Khc?=
 =?us-ascii?Q?5Y6PMZhpoimUn9siaFrJx1eb+s8yS0laBzIn+EWxwV9G1TTWN4HdMH9YKlYl?=
 =?us-ascii?Q?y/LMqneIVNxcbpAAoMMysDdzzLy8cx7AbMCURvWpy3B7NFubb+FdWydWbSpT?=
 =?us-ascii?Q?lzfbJWNnNDASMYa3mzjDwsk0juRhR4h5fr1nwwpBZRAAVXRTMEUGYRqyMcWW?=
 =?us-ascii?Q?/GOj4UELCWTfNHX1rjOC/NSClJdqgSj7a+ruAar5CMQctBBF2z3bT+wT+ngZ?=
 =?us-ascii?Q?hh7HZh+EuyHoaxs5B0DC7G0g13kbP0aM/z9ox2C2jS95iwBkCTTQM9SViv7/?=
 =?us-ascii?Q?Ky9HRQK530+f4llrCmOwnn+AfPZQOKL+RfGXQHrIzX6Kt5kS88jSEr2XDM9U?=
 =?us-ascii?Q?/cMQTD+siurmpuGaRwPkO9rQn0AHF5/KSGqiU1x/0kvkBE6G8VTWHQfIvXyJ?=
 =?us-ascii?Q?Oswsmmg+BO6lzvB/CwP1oBge81pMTcKleeBnXW+AaE3TxxP8DmACCaAAPkRc?=
 =?us-ascii?Q?kcSzghZkxdtRfmrvq4h5zKWFQJ9nJ9Qi823WxHJBKyTWwGnLV76YJhEnsZip?=
 =?us-ascii?Q?a0lhfKbz6lo/VdO/0TCIgOiB1rWDr5aPV1xozrnP1/odQoi7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb604c0-9d4f-4ce8-3a1b-08de52c1ba51
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:35:14.3743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uN/yqw9bJfpUjR5fe74TIitD72EtjkFM4y2Xb3KYmma0tGDJ4IjoM3+pBY6m4qoKOQTQVe6SCMzqunOVsc3Wqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9446

On Tue, Jan 13, 2026 at 12:44:56AM +0100, Marek Vasut wrote:
> The old Ilitek touch controllers V3 and V6 can operate without
> interrupt line, in polling mode. Drop the 'interrupts' property
> requirement for those four controllers.
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
>  .../input/touchscreen/trivial-touch.yaml      | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> index fa27c6754ca4e..a2145a62f9723 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> @@ -57,13 +57,25 @@ properties:
>
>    wakeup-source: true
>
> -allOf:
> -  - $ref: touchscreen.yaml
> -
>  required:
>    - compatible
>    - reg
> -  - interrupts
> +
> +allOf:
> +  - $ref: touchscreen.yaml
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - ilitek,ili210x
> +                - ilitek,ili2117
> +                - ilitek,ili2120
> +                - ilitek,ili251x
> +    then:
> +      required:
> +        - interrupts

Generally, if there are special requirements, move these to dedicated
yaml file to avoid complex if-else in trivial-touch.yaml.

Frank

>
>  unevaluatedProperties: false
>
> --
> 2.51.0
>

