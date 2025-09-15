Return-Path: <linux-input+bounces-14735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5451AB57EFC
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 16:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A55C1897627
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 14:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABAB314A8E;
	Mon, 15 Sep 2025 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BTJbAq7b"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F276D1DD9D3;
	Mon, 15 Sep 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946641; cv=fail; b=FrjDCTkFZ4cHZXlVtnlpbySrgxj23hjSqOj1yV9750zB/hjqC7y3g1JhWbf6OfR0KYphdFtwpvlPe/FLYWeWWJRpnYywzTLLFTERNUICnm3RpAq30BLPFL6lX611HmJQjoISyNbErYxDu1VJQgHPihiJwgirpnFWPT7/wUQ9ceo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946641; c=relaxed/simple;
	bh=GcyX/HX2kjbzy1dRlZP/bvcRJBeX8/DsstuRdQArwVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mBB5zgWUA+qLnYZdlZcyKwFeHgrV2OwyIeFqBu2/F5YTHR/aq1vVFwtoWuG1HWnGxEy0p4eGfC7aGBf6XZwZyuaqFc8TCJh6So1a9pOK9MK/nLeMKfbfqpcHQZdogOsZn6+2BStg3bPdw2VCmjOMTFpj/kccMQShp+MMU1QbXLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BTJbAq7b; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXnsPo6TOYv6kcDLvYn/XojeVcYo0csPYdzTt3A86RuZB69hy82WWzUXsaqQWdZ30ATPMV6GsB3zRYR37Z1DwNaheWC0NlpxvxIECR5dtUfUvVuW3BHFWcT0JFXuA6s19eEJ5NHc4ZV6MnqIbxTciAR45thAEmVPwZ5xEyH0AJFRk9/BT635MY7oxWyEaBSOe7fvvuT67cBpE7t5Y7Xfe4IuEgu/gwzyV+PrZRKzng+7WmaUWe6gFff30jz9UYhek9tFrV2b6cgEFSPCKQ9T6re6/2zFD4+YGZzcQubFEedXstGhAclWGS42HhJNWWJg8cybYUIpBiV7IaW653W9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L4EtqUlXn1LyjgNfK94roBsXJv28Y7z/PNr5z4xvZ0=;
 b=pmfsVAKYqSWO/EsWe9fNuawXhiELOtDE2j8ErE1pw3sbtjBsg4KLzbq8F5vc3M/Rc+QhAAlkPLx/4yKwzdJEG9ZtikfFJt5YXM+KquALfzezQPgmLwe+A5GgeJZuIPeFvGcGhZ+ccrobCSfpIRz9Xf/iyNcolyuwcknHF8WQKaq0FA5jj0GTikvpSL2ccHTIqXjzFaD5ILIlu5cSeGvOPsbI5XohGUV2x4gYNyrrfXZZQ8g4Ub2sg2rspYfeWYArcdS0MfICL6KDfTPCdjxpZfutvzvGkmj3o7uKhNyd2RLAJITvMWOTXDhmfLYcx0eQc5AY6JSE13MOg9nXlyXyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L4EtqUlXn1LyjgNfK94roBsXJv28Y7z/PNr5z4xvZ0=;
 b=BTJbAq7b1hQ2n2+T4gSKLQSZ/14ttb7V2hZIZwvBRun2ccTTgsYs/f3Je5O4tGvY8TIq1tV0TEDFe+Wj7f+fsdr+X2e3XV7OfaV1y8AIT34SpYjnc/dUk0oK2NDfLR+Sg7Gt+mYs/TWVvHeJY9oudj3FQlfwDt9JB4z3iTIFDUD/csuU4itDAirIygN7rwNVXq3IVo16jvisUYI2Tncgd7o0cBog74zxD30uqZIY4+61VciivTFUP4FwFisp/mVkFyUrxXLZnW1M6buClqhlSfXlg29/3ucGXQ7Su/ygopbYSi4+dWCDTKydSi2B9wxb5QT4fF4SV9z8M6OxeNyxlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAXPR04MB8880.eurprd04.prod.outlook.com (2603:10a6:102:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Mon, 15 Sep
 2025 14:30:35 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 14:30:35 +0000
Date: Mon, 15 Sep 2025 10:30:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <aMgjAjfydIbYexkE@lizhi-Precision-Tower-5810>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
 <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BYAPR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::21) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAXPR04MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d157e6f-214f-4577-fd96-08ddf4646f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ILKkxu/RKA9ujCK3ORT0ntiPIQHx1G3hDeZmsqoS83CmOZPerj1SSTnDCZeO?=
 =?us-ascii?Q?qOBN484M2WwbTst/mjVR80g9CwlByRWoLH4noHijzKXB1+EhHPGGpO06L8iN?=
 =?us-ascii?Q?Pl2o8t/pxngxR7u5/cbCW3R4pCORZNYL7ABgHduZzjnp9qsGOZPm86viMaGP?=
 =?us-ascii?Q?0stkJ2LAXPSToVIXkM/TEqIVJnBKV56ImEbZdHfqCa2rvwEheXxJMGV1pfrx?=
 =?us-ascii?Q?css5ExHdi22q9ubo/PD1pxeEsJDvvAJsdYJ+B6XgS2/bVGjM49vjAPwIdnkY?=
 =?us-ascii?Q?TkdJEL+ocdVsZJoYlJpxqJ5RLgAAG28M8CINfKZOgscs9HlzeFG6gVGfopFn?=
 =?us-ascii?Q?347y9Wc6qxOcErvx9U/8VhAnv9TV7qO4YS50q6LQ3vQvn92otbgldgNv9OU/?=
 =?us-ascii?Q?gBubxlKvwTaf/v5PVtPSBFGW8wG+xgXPFzEXy1lbvEnMGb9zgToNidmt4Kav?=
 =?us-ascii?Q?XVZtE0FBRkMgnIPJ43aALhBQ5tczydMJ/n8d4dFmKoICO7UWzJ1qWakvX2TH?=
 =?us-ascii?Q?UZX9x55Bb4eS/mvnr0xPaCb0/RTpGww5ycO1RtO8MAleV5oxmmcg+kJbWLQ0?=
 =?us-ascii?Q?nDdq1qkcIOV53S/A8WQ3Lxcdi6S5ali6Fx+MrkEl/I0o9HoqyEMLT3RSFoGW?=
 =?us-ascii?Q?TCslaW4DCkp1OkliiyJ5UCPnUIOZgIYLMaxhe1LctEsNU6i74TQphpLL4e5c?=
 =?us-ascii?Q?RYxsJ/S7fgMuYdIphpYiUIdZ0NeskO+k/1xIFvLuIeX5cA4sF3BrtzR+p8T1?=
 =?us-ascii?Q?j4b2apjqrGKRkaYbNCWagDHwZlvk2Lyc8BZSA2MpOQmPus+GS4DmvdhUKd2S?=
 =?us-ascii?Q?Jb+H70YyADoe0Cu6ABSCjbibBmflr4bns/K1v4E5l3l9HtVLVfhBxrnfE5Nx?=
 =?us-ascii?Q?XdM6T9l6yG+Xx1kVzMIL4AGnVYtDQGSFj/MNJBfdrvayxQLmG+EJ1SoTaxdd?=
 =?us-ascii?Q?ey/6Bf/0ipncXDKU7tS3goPlMlg7ZgXx0bMQ6KrC/uKDEnPjaN72gNygOxjg?=
 =?us-ascii?Q?L80uEFdiYfi52iOCyUUL4eTQ7DDJ3Mo7kYjPBbWDJqXLUcdVps+U04qiQEVF?=
 =?us-ascii?Q?NuNk9ssWmfg7K/qkosd7nfSAB1VwAlMAG9QIiNTR+AjnhwaoN9hwRAifzN01?=
 =?us-ascii?Q?c58hbP5dersadVjnw0mXHyBd6SVRyChkONbb1VRWk3NlPaMu6dggHgMV6f5s?=
 =?us-ascii?Q?uVAI7U+ucSTpMIe4gS0paJsjTThnW/tx0lsU1ZgJROuRkiV0DwnNWDryY0qN?=
 =?us-ascii?Q?GS/VUzmICbfr2pQ+bptUOykXhJVMMhvR1qxgC9dOuq72kiDUS8KvyCiT9JNu?=
 =?us-ascii?Q?dUu5ii+j+ceqI5gu7H8clYuJiJEfvziINR3UoXrFaGF+SvucpC7unhUUk2rn?=
 =?us-ascii?Q?/2TzWbPaM9xGvNbXy4gt3xxBt6GPqD+RXmlmri8KtDl0exYZsQbYOoFtutjO?=
 =?us-ascii?Q?TIZkNEj/cy1eoCroo+0VkZEzUqImTh2JrQBAvFFgpURhnVmiiQtxAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9uwnxejsE+EDV16XDLWtd5+4u99YTE9j3PXfLL1Xz/5lNAO3ZV79+A7vNN/c?=
 =?us-ascii?Q?AsmJcn8nxxwFW+8Miq79soLPbjS1ebOPrIwOMe9+GzkAsSG1W0BpQU8yZYpr?=
 =?us-ascii?Q?bxzsjBguDI8D/+5/t5iFSA/4+B+vmVubL4ASNnjRB6QMAUjdLyUT97+CH8kF?=
 =?us-ascii?Q?U5x+UnoFn6ZF/6ZOqSs/dJBIEq82sHEajH8CDg0e+Zl8FJei9M3dws6ADm3W?=
 =?us-ascii?Q?cNC/dW3LWUPU7VjthEhwOFn6US1fmFgGt13u6yxZGMs8u/VgN/HLcVPnj97+?=
 =?us-ascii?Q?AmS/PzfL0FfNbX3ZZXCb0Wj381UtlS95BIJnzqzKvrM94yH1a0vIRRHSC+JV?=
 =?us-ascii?Q?0W2/ktRSNj+Z4DpJy7XmVzFugm3PIaeYFYXJciHjJ9kPOaVg+kHJdXtVmX4r?=
 =?us-ascii?Q?74OsuKhF/pIhBTGbKlSH+Z8TPhbUdpgD0sdLkIecGObqUK0oKUGN5fawarjL?=
 =?us-ascii?Q?BTPRaermacwApzmROk2Xm5wJuvoYSmhYHNyeSytXJQXzoeb9Zzn1WXuckACv?=
 =?us-ascii?Q?z+n6P4cu6uYn/4v9QHyZ4yoq1Bx+dMSUqbgFQ+QE2CAmzEL5+6jq4WWWm2RP?=
 =?us-ascii?Q?DCu5xoACIWmYkHvQs2yE9juvQ3YNU2VHR5nHupVTIbiLsp83H/zvhq91DCOX?=
 =?us-ascii?Q?Dq9rSGCY2IJYe0lK5H6LiOKu3Tw96QbzYHJB1xxcL+xaF562Ele1EcD925Bm?=
 =?us-ascii?Q?2ZCcTL4IYPq4mVK6pUH7ZmOPzKAx2Slh1y1hcphP25HtLdsgwvWcPh4yOAP7?=
 =?us-ascii?Q?Xbme9+/JmKwAOvkv78ZCRZW774/AAaiJ/SL4ZWCpfWu4dJooCnHyECrV4Bhg?=
 =?us-ascii?Q?SJPXyBq0xTaTf3VdFTIKLIaU9j6b2b6dpbmTPhmWXmfVlrASJcRRi9Sj7HXY?=
 =?us-ascii?Q?BloB0AHuDq7/hP2p6o186W9bmjKxUIid7oG5WQLVRNBwL5Cd5SYyDjraAkZa?=
 =?us-ascii?Q?GCqkqKfUClRpUxY+btLE7Z4F1MDkisg6U0xoQmmd20SIe97QZOGS2ZJTPQkF?=
 =?us-ascii?Q?FcyWz82ncrBL0ZNHcWI4oeL1td1wKruWqUZQwee14SNCMGUCyKRXWrUYV7HY?=
 =?us-ascii?Q?7g0+v0MZgZvOLhLnq7e7MwGK/STby3r6zwchsq+KeNcujWuADjSmAkw/7/Nb?=
 =?us-ascii?Q?+l6GnTKDKWPlhjfT9LezMMMSCO14G8xvwWslmVZDSZADblYR9yy84Mlcdu+3?=
 =?us-ascii?Q?5XU03zIquOBDqEw8nj6JUPmmPMRO47CJNgHgJogFDSsVJgq8H+rSODK9dQ2h?=
 =?us-ascii?Q?4rWS8j6pz0T49z6WdlXPVYHSbw3wgJ9gwax2Ribmd0y2QdwS/pyzZHhK6Vrw?=
 =?us-ascii?Q?IJwd3wjJ76ahlOxYZ6jQdvXioUdN1rb8oBUy8xrUZeYvkp6qK2gY43p397Zm?=
 =?us-ascii?Q?JUGBZgHt1O1tODpCJ4vDIeexydocvnbBMCfkCk1BkMOdBLSszzG0f680xs+G?=
 =?us-ascii?Q?Oo6gxsHhda1rZvd9g6yoOfcG1pp9pJa48mSOm4PgKPYARUdvEU+fdrCYZPnd?=
 =?us-ascii?Q?uNzQvYr6/LoCQoDc+YLC7tsXH7AJqf/3HfmHYSJiy1qaZ/paMCAGWJNjhUIm?=
 =?us-ascii?Q?ysqDcjvAJFbgovDEIGrL1BeLaYeDOTaSU+ePsC+3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d157e6f-214f-4577-fd96-08ddf4646f39
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 14:30:35.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsji23mugWwK5qm9gYq1ygXhWxuakb1NnJXSzIOZT14Zxp0WbmBSHSCd//9YIzEhE0EOdk4mbeskQzeAbor1+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8880

On Sun, Sep 14, 2025 at 07:16:01PM +0200, Dario Binacchi wrote:
> Support the touchscreen-glitch-threshold-ns property. Unlike the
> generic description in touchscreen.yaml, this controller maps the
> provided value to one of four discrete thresholds internally.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
> (no changes since v1)
>
>  .../input/touchscreen/fsl,imx6ul-tsc.yaml         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> index 678756ad0f92..310af56a0be6 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> @@ -62,6 +62,21 @@ properties:
>      description: Number of data samples which are averaged for each read.
>      enum: [ 1, 4, 8, 16, 32 ]
>
> +  touchscreen-glitch-threshold-ns:
> +    description: |
> +      Unlike the generic property defined in touchscreen.yaml, this
> +      controller does not allow arbitrary values. Internally the value is
> +      converted to IPG clock cycles and mapped to one of four discrete
> +      thresholds exposed by the TSC_DEBUG_MODE2 register:
> +
> +        0: 8191 IPG cycles
> +        1: 4095 IPG cycles
> +        2: 2047 IPG cycles
> +        3: 1023 IPG cycles

you should use ns
   enum:
      - 1023
      - 2047
      - 4095
      - 8191

you can limit only 4 values, but unit have to ns. your driver map it to
register value.

Frank

> +
> +      Any value provided in device tree is converted to cycles and rounded
> +      up to the next supported threshold, or to 8191 if above 4095.
> +
>  required:
>    - compatible
>    - reg
> --
> 2.43.0
>

