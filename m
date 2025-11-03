Return-Path: <linux-input+bounces-15871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9872CC2CCFF
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 16:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 056D55651BC
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 15:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED9D318146;
	Mon,  3 Nov 2025 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L2X146sI"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D553164BE;
	Mon,  3 Nov 2025 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182780; cv=fail; b=reGx4tEf3v/W5y0OF9ItqC4TyHec/Zo8Qh5qJlWp8JhBbY7JgAq/pgswBJDQIQZjSvQMAqIfJzQulNpvaKFgOE7kMAmOVFBbfOXYkXOJVrl5dmwl8nOu8rrTdcMaAH3CeiTISBxJK1uqdLapUpZyzARFetz2lyIUlTvBDzJh7As=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182780; c=relaxed/simple;
	bh=EuDK+z3oBBdCKFvtpOhKOCQ8H4tyZABL/uEHPFfa0dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I4sJOR9VVVxqO5oWeRGy2lslB7APEKg/lkgJzJFHQ8GvJJu1XM4o3jWK8LXbmeWxRIzvLrXv/Za5bqh2pfZA6yXIOeCX4+aJ/I8YiA/Sd3/jVDgplH8fqnhzv9RJyXr08D1Hkux9PUH4ob8H/jyEN+e5ydR7qDSzAYcOoY9CwwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L2X146sI; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2sO2X1Lc7K4fBkORZLSnDV0LuwMuQMNk1FhtUkxWVn4IdEIj0SPTA8L4Ff6igbb0kgMnbHT+AZZfXo0hOcZ89ZtadiuRyEZlHusobUP14qz/UZ1ovwjcMJxTePMpWk+cg5+ypMuR7wthRiEEXeISKlAq5o/AXUA/9qIyaT/diI04zvd6bd7pS7MKQfhhJIGQHexw00hIOay/kMi2wYUOo39hO/1Sb+mj7CCdgAP6K8jTMFd0tEeF7wgPKnSzOUk7scdBgnck8UGIpHr1Xvw4o3JivXfppDRk3S6GoVZdz/uvYF2FR3yFCQIMhiexNCZY2tPCkfjDB9USWOMCJ/kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6rbB+3LDmHIBWBXdi5abzG/1VsWT6ATs2cdAV/GmUY=;
 b=skkvcC0MOP0U+1vcV4yQ6bM+/nxQwM2oBx1ZKFYHvFnKpMbcq5wU6LK3q8NmcjfomPp/3KLq7ULKWjdCrvwz1fO/MPB4tbElonOm7zMkTadQwG3RD0I/W06nhnoHSCfLZjcxFBzJr9hrc5FsUzTsaiPc5oEXbvgKY9g1VUkS3E9E2IPCtVhUIByeGDNPwSB1J5HmpPbDPgBHhAereW+HZfp4FINkBEzieKXbzuKp1c84+NIusUFm7GHhdonbRzlnzgqoXaxJKCN8AJQQiyDBpqCxWN8/4acv8eyIHlM74lMLce6c0IfdduK2O98dHblgZ9xu5zs24KE/B0YbyMTaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6rbB+3LDmHIBWBXdi5abzG/1VsWT6ATs2cdAV/GmUY=;
 b=L2X146sI+STGXR7JfPQHHDgj8jFpOpaeKXiExNht/RRM+f6tBVtWoOJoW10jgIpXSgJ0MShb+J1i/Px3FJZYoLfKR5kug5EauK/OkGRrh44MQA8GnnGszE/ARq/y65CWuVGtCdMdXHFMABgjqqjWAALn5MWw/gFJMWytex/5i4BfgjltGpkmRFPq0aVRFTpnX3nqRIl2F8vFS697zGuHk4plRFPyvDzCIqhiub7w74CRvHbe2qLOlMgvlZiDg3Y303kAYdL+eG+p594p8M6XK1LfBhHrT74R6Zj8mM5CCn3IIflS/S/qbu+rN98y6EZaVZtoho7OUNqruLfS/d7imQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10414.eurprd04.prod.outlook.com (2603:10a6:102:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:12:55 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:12:55 +0000
Date: Mon, 3 Nov 2025 10:12:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anson Huang <Anson.Huang@nxp.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <aQjGbdKdTcfo83b+@lizhi-Precision-Tower-5810>
References: <aQYKR75r2VMFJutT@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQYKR75r2VMFJutT@stanley.mountain>
X-ClientProxiedBy: SJ0PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: ba30e97c-67d0-4112-4702-08de1aeb7740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xYIqQKXpl4roCYmfjt3E/jPcTHFHMWA8uiwPf9eGOXGHyN3AsMVQt2ogy5PE?=
 =?us-ascii?Q?hS4QkYZci0QMAxWzxcbZUh5/PB2C6XrRmLsPImpEJn85CprDbyWpR6YXv6IZ?=
 =?us-ascii?Q?gCgyjmTnqFLvOvOxjM2Oo4LhhU2AlciOi7nKcFkVEiWbAQN9GOCr0FPsxfT+?=
 =?us-ascii?Q?jFBZ1yhQlqDrTl3k+xOhyvFrFfq/UJ8/vbHCoD5DpnNSgjsTKixy3Wfjdwxe?=
 =?us-ascii?Q?KgBedQmsefgcwkkfqLMA3kqudfFO0QIj4Cc6OoDYrMzJHkoXeqeso+NFV461?=
 =?us-ascii?Q?IVWOHTQIio5GRwmQHxQgDGxy57D7FUmwtI4keu5ZkFHoz4Zmk8IgzgcGFhAL?=
 =?us-ascii?Q?ykzFe/4JZKX0bLSQh28HMXn4gRw78nrPJhPc6F9fj9Ok5CkK5I9DFUsZlYkk?=
 =?us-ascii?Q?JHOoIjqct/KJdFO1YrN5EEPRmlDKsvLM+pqL+OEqCoAtRiUWfWQft7fotlp+?=
 =?us-ascii?Q?o1BuTmPG692vZeCZyF3cIrMEIEgtxad2VIOCrOR4DRBQaqcbjItG0UTCxvn+?=
 =?us-ascii?Q?uEacPR/pzstH8RR+iWz0YK3r3AZg8s4bCqF5qxkXLCCptYa82R09DTNZymuC?=
 =?us-ascii?Q?PXmMYLUOZM1uHKunAfzNIm8RqcQtNwOSdjVYiejo1XUDi/5Neszq8QPYJTG/?=
 =?us-ascii?Q?Wyr5pqIvETAzilMB5ye/l8MKXC6AnGH0/qrkhLIosCrSlqSfyxB2xlsDHjky?=
 =?us-ascii?Q?tuXb01eptd4qQk2/QTRkbssLC3+fCREtzF/56j68/v4L2KztugVIT32wIl3x?=
 =?us-ascii?Q?8/1zseHhiOPHOF421zCN+HGLToGNTvzdF9Hp3+fDFh5G38Ltk8MonTh/850X?=
 =?us-ascii?Q?kcgVEbnV0C30Ac2dUEjr4ChuFX6Szp42pLbWNptevsDnxRVphJGTlFNgzdg8?=
 =?us-ascii?Q?dqpABJAmyYzAHxmA8uiSQzmOUJbi2ZjNWV8ypzMfdhF/q7CKw4H22J9bU5y4?=
 =?us-ascii?Q?h9v+6qDZPSAQtR3QDvbXm57TRIFStaTHWBGmvEAhQ5HOc0eb2HQmd6wBAwsz?=
 =?us-ascii?Q?XWLn+nE/cehhHY6k0ohikqIvnrOHd7ciXl+BPFZorzJUln7JNbT6wTUUoCEY?=
 =?us-ascii?Q?/zTLTu/OPb4E54ELTe3D6fq1OATbmZbuyYLZsvHA3OJn4N/CO+AsJXz+ahNy?=
 =?us-ascii?Q?e7SuYtqg4aQXPKtH1HW+Enk2+QrkrNTM2D/50N4QCLy3rETA1grnHj/hcJmS?=
 =?us-ascii?Q?ImirqZliqu4KVOR9MyiK+OhXWsY96zY1+xfKnj+vQlvwLSpfw84LeK7+ALYF?=
 =?us-ascii?Q?oxu0948VzbLueZPSgn97Js8zv5XYr5DdfwEbpU6N3MSzJ6zxVbCEtl9OcyIC?=
 =?us-ascii?Q?TZFgFuozaXgFmVamZlHVr2L/k3e+ZGM166vuz988FDsltv+QFcEmta56KEWD?=
 =?us-ascii?Q?aXeyHCZyqrtTC/Y3fjqcBDVcxdo1fAKw1N6vPXt75kIXQkCJM7f8m640egLm?=
 =?us-ascii?Q?P06HoSL3J7BTpVKcNwO2uedglHWJN35zd+tWW+MowPUgcePhy8OY3eli8e9K?=
 =?us-ascii?Q?MuV/PcFkBY/9oBU+ZAyhdEO6GqzI+z5z0AJR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Ygo7Q4R16Bq2nhSCpzSp0K82ny2wGlnpAIXCehkXJXaQpH5xaymRF9txg9s?=
 =?us-ascii?Q?KLwoOqWJsOBH1LdsI3tMXaZa0OXR3qfq5FOj33CUf6Ctw0mrEN3sS+MDaQBn?=
 =?us-ascii?Q?8UL9mR4ylPWCS+ePGBdEHaZ66HyFKRxENIvfFDRC0AysBGFIpurJaHwnAt20?=
 =?us-ascii?Q?pcnrbrwX81ZYGUawL3Ey7Vo+4Vc4tTZUr6zUrNUSf/QsjjWXHqz0EGoUqVnV?=
 =?us-ascii?Q?dPjGEINsOTy8PDYa1sC1ChitJYRXOpQ6Zkh5hQiL8iDdDsGQ3ntCxEU4X8ik?=
 =?us-ascii?Q?SIM2TmX2zF7SC02/AwcsSLIIjI4cEJ3XZz8v8BM8h3pHMxdKIJXBtOsi0app?=
 =?us-ascii?Q?2vhfbutvoW6QlSvEAfA14zn/TyK9zBfkF+FT7Uc7ta5XLgCzcFWx5QLJKyB0?=
 =?us-ascii?Q?SgOfQbxMVpSLaWLoDx+e2KxDJZmMPJRqFNhyaHRhBG87AR0/Qq8IekCkr5gW?=
 =?us-ascii?Q?LToBl7I9fF9QAkXAm/3fCkGahdF/9eed/2nbR81m1+JRP/ceELQY7RdG2HGG?=
 =?us-ascii?Q?voqm6+P+FASild2CiwFBNFiEaAaNh75KLygIE5GH3P//zik0xyOWaus1pm1Z?=
 =?us-ascii?Q?QMOXxN+WimF+8TLIQfWKFDltoLHleGGBIxcp8eYUFI7e2TyIq8HHpNQ48Un7?=
 =?us-ascii?Q?jQjrPrH0sv2ixor8F5nlYMgxgn2A+uqpXobavxs+TmqPSFnqYzCDldNEBTDR?=
 =?us-ascii?Q?zN6FkISR8/KsH4upuFj7471PoNiwS0OJEkcVVO2ZXH3hpaCjpHeblMk1UjDj?=
 =?us-ascii?Q?zxhst5ytZgkbtiJPd+6nsbJGfjIFu/AHQ9iNChVTDod/OzhtolCSZjlwMfJl?=
 =?us-ascii?Q?eHryrFsNQDeSf9cpys56XFUDYMpj9xBA36V3MnDEsHuNTpIWACwFqGLqXGXB?=
 =?us-ascii?Q?SECltH14gKBDu2J7OjNmPB2/gQUN/1LYuIGfwvQKarncSDmGwLqYxZiYez/j?=
 =?us-ascii?Q?gYbsys1hbQ4EaVQtAutiOL20mo1ig04YSp9ymjqKosvP8egwOAMttH9q/f+D?=
 =?us-ascii?Q?o/vnMRkDG67dXDzfrPQTPHIF6ALc8ihxtkJbAmAubARKm5VqQ6lmKZIDA7JN?=
 =?us-ascii?Q?T+eL7pllej/KBA/o2OvgZM6RPJP9hW9mohmG3mRDDSvez71FH7/+XfnQuMl/?=
 =?us-ascii?Q?SfdFy7NTWJs1SlnLg6Jrne/r7OIahhwl/NSatOsuZ6oVCP6FiosedN8s0z9i?=
 =?us-ascii?Q?0zzp7PVwBAj1azRP8oNThcT7w1JHARNVsGgxxAI5g3a0sHp+0TAJe5/u2RsT?=
 =?us-ascii?Q?I3RdFXQ+3bgAQBgCrqfjStPw89Gk8qetYQvQqXeNE9wPuX2VMq6xUgYVIst0?=
 =?us-ascii?Q?U6yHVbXZfC1j0kUcsMDQFsvr3idfeCIoKhvbH32BCNJDZJ9BZyxASN+wNr0F?=
 =?us-ascii?Q?Y+AvAPSEwT5rAb7f1Xw+MDD79uyp1dkX/Y5d7GKbihXoGGYlfyvypoGQx80g?=
 =?us-ascii?Q?BrRh6zvaX2dsraiY7ssO/Ys/lp9C/BgXMPvOxr+s/Du72aIdkiqqPZbJPbHQ?=
 =?us-ascii?Q?U3SRn676SrbJD/3tkKOw2QIlbJW5PlxPjtbjEWTcTeuRgsm7NF6RdX4AC9r8?=
 =?us-ascii?Q?deASF1GROafyKe+Z9r4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba30e97c-67d0-4112-4702-08de1aeb7740
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:12:55.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGZ1o8eyD9fITeks3obdgV7TJ2pOpA9POwG6nwWjOD0JeAElV8+ZRHNhxWDaO5/W6KrtWznf5TJ8XzCO7bJKsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10414

On Sat, Nov 01, 2025 at 04:25:27PM +0300, Dan Carpenter wrote:
> This is supposed to be "priv" but we accidentally pass "&priv" which is
> an address in the stack and so it will lead to memory corruption when
> the imx_sc_key_action() function is called.  Remove the &.
>
> Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/input/keyboard/imx_sc_key.c | 2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> index d18839f1f4f6..b620cd310cdb 100644
> --- a/drivers/input/keyboard/imx_sc_key.c
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -158,7 +158,7 @@ static int imx_sc_key_probe(struct platform_device *pdev)
>  		return error;
>  	}
>
> -	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, &priv);
> +	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, priv);
>  	if (error)
>  		return error;
>
> --
> 2.51.0
>

