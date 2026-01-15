Return-Path: <linux-input+bounces-17114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2ED25553
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 16:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 645E530274EB
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 15:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102FA36C0BB;
	Thu, 15 Jan 2026 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YPiLiqmP"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFBD3AEF50;
	Thu, 15 Jan 2026 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490748; cv=fail; b=o0uRUUbb+5NbmgsnFFriATEheMr5ZPaUyfV/jWjr5+SRZ9akjw+qC+aFm7f8G+zsqPJD53ARFE+mB9RRoS79JyTDcJHwGtIX/2QOdanME2L88EmX/gVEwujKYMxbIlHvut1+oe39kPW9PpIzYew8A3a+mQxaRauYfQ/3f7FpJ+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490748; c=relaxed/simple;
	bh=YcWLtDRb+B4HnMG4IO6zi4d+/2id71VIsCcoms62Rd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LXMsuv67VNg3Bhj8OZZGIKHyclDFU4tYfLOnVfcki689aeOeJXdACl4WF9tS2oOPU3EGGRhgvdDlgpf8fC2sInsDW4d8L+gafGUrifO5XEtGe2HYIS9Hr0Q4MehCe4n4VwMuhcc+6docEimEBYRLPBbdjcRdnpq15g+zAwVoUac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YPiLiqmP; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcM0yZCp9T0DCtT+70JcY6FPAmHCqGSLzLPGDZ+/seliFNKa7HZBHCtEpdsuZE+gfuVTXcDcSFzR+PPaRs+kA2KIjO8PfpY/plBdM8yjllIXsU8KvZdNwEQRB+FCIK6RD2MBIx3oaosipNCx8jxvQd9vPTkLL5U6/BkN92z85rzR35GBFtqP7G8CxCEd9tb0SO9w1s35YGa2DjrlzLK8/WXbQZNh+zBsrXxEwfkOYcsw5DXJfHzTV17L9Y35K3Vd29tnOWYZMMgMR2KykvR2OaNn4yI5Y1Qkl7Cqh1yKJN1Knl2dK7p9Z7NscwduIMuv4zZypQS59I6WR4wEqe5Ozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEvra4kHTZjjds2WQkSBuq47WpHcBnLf4qzyylzTv6c=;
 b=C3PBGZAUd2r7ojyvWrAeqTwzN2BjxdmjFA8bJi9QwhUn0nfEEIxECApdIHfu2JrFah8F8zFi7K4p9o4yq6wJ3vbRbYgvpj1/NMAr+O08D2Movgox9t97ZlpjyPpPRCK7Mjb7tdn6SdyLLfPy4Ff6aqFj/I9FjGFotuhS1/2SnWKlENkkeKtaJFNOEJ1/v27df5boKn7SruO9NR2aww9M/gHCkmujNu0zQP2AbDPU6TXY4A6p7zMgj83wJLQWc64f9u27eW+JhGMIJOl4hyp6aBIdEJ3ZoV88tQH/r+CLZwROjGindNuPtKnU9Ltip9VhJJzOUHpqwA6+/1RH1+iCKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEvra4kHTZjjds2WQkSBuq47WpHcBnLf4qzyylzTv6c=;
 b=YPiLiqmPQT4UFKFinCtpWWdHUPkKC+KtsXOY53HuJlz6croCqWS0og69Alt8P22x1vaLVvOP0eIPYhfiW0yzmVdc1DNN8mdg9B5oUAA8zcL6tRz8PY8CeVqndVsj7Z3XadDI3T6BmOeHZ0idoYjsWMTGLxv1Ia2DV2w1KAvnRYAHoe9lcg5OUIZBwPXLvHKo4YrbT0QAJbl52zEuY5m7DwulWhPye/yDYYZAv6V8SXPcRnkjHaKKUfJmM7iKnOlRlhlrwSZsWuQ49+4PZs1jr2+rTbKn6o/PF15bHzGJ9HiNR3wXztLG3sfEdC3R1F6HHAM6RFDNKB/kE7Lk9rzKdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by DU2PR04MB8662.eurprd04.prod.outlook.com (2603:10a6:10:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:25:33 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 15:25:33 +0000
Date: Thu, 15 Jan 2026 10:25:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: touchscreen: trivial-touch: Drop
 'interrupts' requirement for old Ilitek
Message-ID: <aWkG5lWGM3FUfdKn@lizhi-Precision-Tower-5810>
References: <20260115023530.656645-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115023530.656645-1-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: PH8P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::13) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|DU2PR04MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb716d4-b354-405e-469c-08de544a5359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BsvvCe1LrhrsunK8yo+JxgQtIJA2V/N7DibN48NH8JUBBEnVTnH+koA3JX+S?=
 =?us-ascii?Q?sSS3SXyng7/+6gnovzywD6pKogVc75JmeF15pQDWXcxJt+rjDg8Li5Fx43qE?=
 =?us-ascii?Q?505Fw2eB0gFogDo4sKMdYi3EGD3Ajylya1iOlpFIf5w+l26GNJ1JoQEztAow?=
 =?us-ascii?Q?DqwORERGlWqUyGHb2VLSERP6gp78BbEtSyjauv8eM47MbDRNUSGohRlXGJ98?=
 =?us-ascii?Q?ACawWv38NERlC0CBiJ0i0Q5gjNRBdzuIXGJEGXHid6tI75DhlLb875IfoYwH?=
 =?us-ascii?Q?h0tREy9JFp5CbWm8P87UIoh63ygMUdYhccja7DaCWqNi8SZXHgEqNRGTXVfo?=
 =?us-ascii?Q?ZiWJ3wolaVJg36f7fFx/F8uZpXGPYHIDTCYNC+PG8PdleENdS/6eWD5DwXBh?=
 =?us-ascii?Q?8H0YgOppL7NDheRk7+Haqh7ey+y8hZJezvdOHbcNxjuAbOZAN7TL4OlbwMh2?=
 =?us-ascii?Q?rG2w47yMzAnsyFI7z6l9uLOnzivrQUfj5yi/bKrBooKMy3cyFVkytD4thSu4?=
 =?us-ascii?Q?00pRx1jyRZtmnmVU5fXOomQWwoEU2Yn7amGReIFuuX3rV5MYThRuVvDGu1kD?=
 =?us-ascii?Q?n6yUJLd0Bz5P98A5f3Ywuo8pE7PG4Q/rJJvMLAe0mrWlJYoHkaPeUmXh4yTR?=
 =?us-ascii?Q?0iApAlb+ujoRyndTyGbvTGZPkYh3pxHIJDftpO4Dl0p7Ys/hpkQ8+ZE9gnda?=
 =?us-ascii?Q?he4udaXL5FSc1ohCNhiR3bSyV8icaf38MMBmphiq2jB63MKm8m0WtsgI+sHT?=
 =?us-ascii?Q?TBr/DAYcj18hDEqic2gitLIRbb4PfjfoHpVmCuoy5WNpBoIZ9mlt6br8V5ah?=
 =?us-ascii?Q?jwRO600byNtyTTzIZMgy6D/s6mNqyTvVCfKaby3fqszO7NsYYGDmS1k1KDUr?=
 =?us-ascii?Q?twW/YS5CYMv8uHIIxS2VAhr96m+20S7ivWFsuZr1jTU66UZm/Nrtnhgbgz1+?=
 =?us-ascii?Q?YCiGbN6ooqAnp1KJZesy8CgwyZ+34DTi4mpRO+7IP2kYMtgBjhj8Z+qgy7E4?=
 =?us-ascii?Q?FHTx8ObB2tu72AVIlyhkuLW0PkzTMsltMwx2wbYtqRNVoCXjBe1QF2JihdW/?=
 =?us-ascii?Q?nlxthz2GzZO+F2waM8zdd1jA0gfuoMAOBIrpLhvcYe3mQcRrkGI3zIOQ124k?=
 =?us-ascii?Q?fGl9DFrsNOY74fNLRhP/mdaueIadtvWq3+GaNlBy3vsemXhV7scJTGxnE6X/?=
 =?us-ascii?Q?oNwdfvIdaMLQg5kOTzHcTslujHrtqY3t4xMhBeHUw8fWZoxTZ3I951LRifI7?=
 =?us-ascii?Q?oAIaHEHb+w+U9kKPt7pOxhwEuTWfIQ+zR0LZ/dY2v7NxtkH7XyaAFmjS3GKm?=
 =?us-ascii?Q?i1/9xF9LrpRaHTNj9JvQFuV9gf7kFLuaWMQW5UU1nN6NuXRlDtP+GilDw1Xv?=
 =?us-ascii?Q?XJO8eu4UYuX7PSbF2tl1lgeKErUu+PeNbeKfs/k6PMM0YzUV7XAAEb2eAsEx?=
 =?us-ascii?Q?TAp5e1Kv5PGOLa5QrOQxtyxR5Sm21O9OR5X0r9moFtoNaUgPchHTNFkU+dhl?=
 =?us-ascii?Q?VpzwFNZc+P3GL4pHlntgF78LnuUM7rgiyQcGFws6+vRVALo7L4wyNxmLc4aP?=
 =?us-ascii?Q?PaILu3YtpBIt3ZOXt6J7AgbCUVdkufka6XvZD8vd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8948.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ofK2qL+2mjE5AjRXdEm36WAhobW9ZSutWAgt447gmriLm73KNxikEiz0FqV?=
 =?us-ascii?Q?s8+vmA4+udukJ7ugBi1zKjjiGZsghBex0k86/BIU9hr8Kzejdg9YyoB7OfFu?=
 =?us-ascii?Q?5yYRciYvhHILZDSfU5seV39C8yFPx+37VYw97w5HyM0T7HpHD9sPbzPWicmY?=
 =?us-ascii?Q?PvM3IUPq+NLMLs5C5zgaWH7CEuVgvIAfEmgb9tNXu6+euve4uaOdhlhWMeQb?=
 =?us-ascii?Q?oGrCgB96YEq6nPcAKbz7JIJjsRVA60NrIyOwqGrsHctfbpa6uzOmRosepVdB?=
 =?us-ascii?Q?FDpC2CVKzTgWsdk1Z6S0JFNU7KyZfvQVYXd/SUEbdCUZcfWje5O1mFHgPSGa?=
 =?us-ascii?Q?kG3+AGzUlfyj1D7WfT+kc8NgKjYSYKEHDicJ2ERCEC0t6skkOprKybarkxTl?=
 =?us-ascii?Q?HFav50eSBhE9vscY//DN82lDCQYgYRwu0MR5tjEwYtZkM/0jw1BTOy6ZpYBS?=
 =?us-ascii?Q?L0TSL76UbVTbFhwWgV8peSfAoM6jmuHh/HDJuRwHZunJgTmJWFkqsj1/IykX?=
 =?us-ascii?Q?ibdUw9Z9ZqVJsZRA4uTgKyxmsMcWI5/vMj6BwQqXFD4nwUQWLx4ho5ffomZC?=
 =?us-ascii?Q?T0LgKnI6776WWC+D52x0aqHAhTOcTiz96T+3kDM5hh0ueIw73M9Uu2qqb6lM?=
 =?us-ascii?Q?yoOHjZgzhtWidcyu3f1JTqhKbRoY41utj8POjIvWDIgGIbNrFn7iR2w+5Yly?=
 =?us-ascii?Q?VV3Re0/eiA3VhKz6XZljZjE5mM/sbAvSSJEb4yOux7oAkxF9pOFIaOkYxvnI?=
 =?us-ascii?Q?RVZeC1pcgwOQztl6Mth0KmfV2OXWOKzyE2rlD4NCr6eaY3Miq+nuMPGNBtvl?=
 =?us-ascii?Q?TaB14FW71mx2Fg2GGr1sq0NPjVSxgf6/w14n1psgHV+DYasgP+Krb6APtpvd?=
 =?us-ascii?Q?i49Ebo8VGqwpe7j8POMb9JVEcGd69RP7pb5+kg8ef9fYpZ4UuFwXlqF8rqD0?=
 =?us-ascii?Q?g7oz9bs/nHO7tjU4NaQSzBbFoevF7q955N3TxTXB4dMSqY0pXkBvg58ILoW5?=
 =?us-ascii?Q?ilV3Ush1DMZGyU8mWGvNBkiYAx30/ucnLFW6qooXUbUpzMrXHC4oFTrV/pAY?=
 =?us-ascii?Q?94eL8OrNDUJzLKHMHLOnU/v627wcs9/18tD0aEmQ461vuzYcjPn2d2wu8Mo2?=
 =?us-ascii?Q?y0xTBOL++YeMinMKghfMDAYdW2PgFFEb316jJl1X4P2hS2TV2XdicfF8WR5L?=
 =?us-ascii?Q?dXlSa5AalYHDjz8UeLYnxRQeoyAb1dyr0wIyYn1xuk5T2FKsfHenw495sZrc?=
 =?us-ascii?Q?xOmDj4x0LRHQrVB2X0MihoELZKiip+WYKVcnBTKp74mmp6LORfBQrrO9Xri7?=
 =?us-ascii?Q?6dNkaOIIjY+uTs5m7xjFOfBz4v+UdSs1un3LT7Cg61gC3M9TXJDnKLwFFpOv?=
 =?us-ascii?Q?jzxhXFLASNcLXo8ub4zIEHmve51+x0gyVtbkMG5gFleWD06VWXgZ6MlFMQf+?=
 =?us-ascii?Q?swamXsGgohvkrKOh8Hqnt7vGoAPtv/AKuj38CGXp9bLoRC4O85/NcPBwlnqC?=
 =?us-ascii?Q?oy0R6HGiI8M8znUMWH+4qxSmHXncEmmVQgt0CeR5qkug4NxYCFVtLCZFKA53?=
 =?us-ascii?Q?IPhFGG41XE9AEnKyJM6X7JOYul9lZr+RB8cJbdhw+324T6tHhh2b9ysak3q3?=
 =?us-ascii?Q?u2qSNuUR5Z90BufzBFMXhhRuU9V6tETfm7Yz5eV6bIX34W25pY0JC13QbJso?=
 =?us-ascii?Q?LHVOKhx4MC6T1IMEvog3k5yUwSAVBGBeHfXmzMLCXxhWpZ+a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb716d4-b354-405e-469c-08de544a5359
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:25:33.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJrvXToYlPHQDTBlZ6K9oKorLipLZTXEhc6e3Rs0eSPZgMTl2Gs4o6ztwbtWpKqxNJkHKEmbWL3h0XiohZD7Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8662

On Thu, Jan 15, 2026 at 03:34:58AM +0100, Marek Vasut wrote:
> The old Ilitek touch controllers V3 and V6 can operate without
> interrupt line, in polling mode. Drop the 'interrupts' property
> requirement for those four controllers. To avoid overloading the
> trivial-touch, fork the old Ilitek V3/V6 touch controller binding
> into separate document.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

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
> V2: Fork the Ilitek V3/V6 bindings into separate document
> ---
>  .../input/touchscreen/ilitek,ili210x.yaml     | 51 +++++++++++++++++++
>  .../input/touchscreen/trivial-touch.yaml      |  4 --
>  2 files changed, 51 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
> new file mode 100644
> index 0000000000000..1d02aaba64f97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/ilitek,ili210x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI21xx/ILI251x V3/V6 touch screen controller with i2c interface
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ilitek,ili210x
> +      - ilitek,ili2117
> +      - ilitek,ili2120
> +      - ilitek,ili251x
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +allOf:
> +  - $ref: touchscreen.yaml
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        touchscreen@41 {
> +            compatible = "ilitek,ili2120";
> +            reg = <0x41>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> index fa27c6754ca4e..6441d21223caf 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
> @@ -23,9 +23,6 @@ properties:
>        # Hynitron cstxxx series touchscreen controller
>        - hynitron,cst340
>        # Ilitek I2C Touchscreen Controller
> -      - ilitek,ili210x
> -      - ilitek,ili2117
> -      - ilitek,ili2120
>        - ilitek,ili2130
>        - ilitek,ili2131
>        - ilitek,ili2132
> @@ -33,7 +30,6 @@ properties:
>        - ilitek,ili2322
>        - ilitek,ili2323
>        - ilitek,ili2326
> -      - ilitek,ili251x
>        - ilitek,ili2520
>        - ilitek,ili2521
>        # MAXI MAX11801 Resistive touch screen controller with i2c interface
> --
> 2.51.0
>

