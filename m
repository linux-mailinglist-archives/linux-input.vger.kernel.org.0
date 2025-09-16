Return-Path: <linux-input+bounces-14769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B554B59D03
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 18:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EBFE32671F
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 16:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F976288C30;
	Tue, 16 Sep 2025 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bjxtoCp/"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B920DD42;
	Tue, 16 Sep 2025 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758038605; cv=fail; b=c7Re6wfIWM+ZpNtIsFScE+dmuaxF2Fg0aUrz3vF+rDztuH9gwUjw3BgDJuPstMm1upPPGEHXaMk0feVwuiZ1VPdXpOI9jHDCgmch+gKvbOrchB/yFPiH4VCW4uMU8DJcQxTd3SjoLhyC3ahC3ecIWXHAMSU/AHaMt5/wSknOfvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758038605; c=relaxed/simple;
	bh=XwObYrXJGJlkbMf5HFGXcHxVW0sVLhQu7Bx2hZBxXcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O+H3kmcUL7V2AATHkSf+N0Vug/XQS1Hrhse2pgkfHO9gnhrwHc5MZH/cDf4QBTyOBoTE42qWTQc+oAeUj3ZuzDyUoTW6who4BFxhIaaQ/cyctiRza5DaHTQCPNMuBDeziQQwStPXubiOAjYDhdcrCQoHDihGuVs1gdI4IDgn2ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bjxtoCp/; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEsZvtTPMUk6jr4wDPLCaZhOuzM4rqEOf9tOhKf1GK0wHhxdQhFPvbAH/YvPjlPVA0TNEwfL65xW251F2M2up3TyQ8Nod9YWdsMID8nPV8WLTJPz5n5x+wWMRXU38wUFskDqyCxG0MuxOwIA9F7fdg2QZJIcA5pZpHuDbhygzRVKI2otCRbzW3inFPgzjmqpnzXkgCUg01alXL1/Aohj+YmfrdGZnWvFod1s7KEYSvFTguL2E9q37WHk6LqKwlEGYr1tuj3LI91Z2OzYsSXkSaDIwfRGujFuKvXWzajJmG8dm0ntQ1qMgLGABFYZs6/eVcIDcDqMblIFVus/b5gWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yw31PENNinYdnNFtS1wgxbhjPaUvreZrvu0B9Vmw3+Q=;
 b=fYt2StS/4BuhCbZIRT/BzZCJ9JAlpIqRNmAGY8+dWnk/UX9BGVFrtqXh1lXLbNThrXOczhc2LDbG8cMk3yT5ukSpRkQbfTjfdEMMgiSK7bfYLQFxtqipqr4oCxqQDppWjr4JsTXGDO56lstN5zIKvUJ7jF0GSewfFOw8j8HLrIAwDMMPXmbwVri60p84olHDuxBH6yBMfn71N2s6xCGf73jR+X5nW8iT4cdKldwSVEjj9N1XqnyXmXK243dEt2kV32XxnGowlAIgH+aADhoqfCwya4mWu466WIEbtjC3eLA8kbdZDtSfuzKkv7x/xd9nG+uIwd5kzWrUVA/vARFgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw31PENNinYdnNFtS1wgxbhjPaUvreZrvu0B9Vmw3+Q=;
 b=bjxtoCp/oXvcy2SPtyXxQHBtzFFq0VYlJJxSFudlIkYitRPUC0zL9iXQrMBDwxNg8zC12wt6FXmVhex35ekBqgpNW961rwcykf5LMgjPfPGbDjXRFbcyi6MaQYigghiIcFbbMWOecIGe18ohsgRZ4I2Dfw8XVWAaP0qsqdyWYj4zH6vk1X5WqP+twfBFHO8Og67IV4JFWsBlTMUu0Ryk4s20wIEgpS2JOCqrw6+Y9wEAFjREvuhraRxgIKtXyj+FOgJKTyevC8taCZM1Er3TtPNKhHwpOp+HzJ4hagx8jJOP3bjgjT8XEcMj7sPqsy9wW4Hqq84i58N+wAA7nz/fRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DB8PR04MB7098.eurprd04.prod.outlook.com (2603:10a6:10:fd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Tue, 16 Sep
 2025 16:03:09 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:03:09 +0000
Date: Tue, 16 Sep 2025 12:03:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
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
Message-ID: <aMmKNYjxolrCb1yC@lizhi-Precision-Tower-5810>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
 <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
 <aMgjAjfydIbYexkE@lizhi-Precision-Tower-5810>
 <20250915-tinker-music-03cff49a41a7@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-tinker-music-03cff49a41a7@spud>
X-ClientProxiedBy: PH8PR22CA0014.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::29) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DB8PR04MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 006e3724-2607-45c6-16ad-08ddf53a87bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J7U5jr3bFdIoVeF7KjB//5JoYLIHUdOmm99p4LgM444b7aFgBDlMRSHjtLEO?=
 =?us-ascii?Q?wfi58ABpfmV918ZBX9VYzUUxLweSFI4pbUd2ceixRdr5O6tIHxi7BVm5QoRw?=
 =?us-ascii?Q?W6kDyPf/fOM7SgoNT69IW4a95inV3lr91Qlxshau81V/GOlub42SllDekzTO?=
 =?us-ascii?Q?WGGZSMxCvGT0Lmf1FFF9awlut2ajjQ6RriE7fini/6DtZ8pfluq+0mYQ68Dn?=
 =?us-ascii?Q?QmwC7FJhMNm+eAXt/e/IgaH8/IRsX6/oFnxfccZP3lVKK8Zgfe8n9JF1OaIB?=
 =?us-ascii?Q?i8s+u246BE2Iri9viZkugeXFFrKDMbSj8oWrren6VGx4Il9cvd0pPfVMA7TH?=
 =?us-ascii?Q?YmLIQ8xtaYGhqPD+3sEQ8GZwoCNtBucXzmnCJm+ANfFAg6ceLEXtmoU6j1JS?=
 =?us-ascii?Q?x+FwVcUteSmY2Xv7rRb1+BKcjHa1jsCac8EBRSsiknFBuJSKgMmMCSxiAXrK?=
 =?us-ascii?Q?l6HEuXxlYjVHm6+gL2KV2tajjrrmBDvXOduVHkiQ0ncdQIoeZO+iz3t/Ha+K?=
 =?us-ascii?Q?UMaS+uRLYsFR4Px1yTRsK6k8bbfII3/wCI2iSQcw87x+FZS2crwKpU546dgw?=
 =?us-ascii?Q?bztscjZr/gicbnC4bx97Rj54/ozUTIlyRzyqs9FqzYZ54qq+qjnPipOU1HFX?=
 =?us-ascii?Q?lF6odRhlHt4mXRyMk+jd9+GU8XI2heCtFXB7DsUp4PqVkJZaQTQWrygIRSpr?=
 =?us-ascii?Q?orwY7Lk2wBIg9wnVYn3+Yj6qJoi9GEKAbPKCK6NXDTougc7HA2xXErRI4mJE?=
 =?us-ascii?Q?rRj8KcPd53FcBnYh/2QCckalla1whGKy38E5mnFW/e+hZ0dHdHTt5bt9HPbe?=
 =?us-ascii?Q?4YdCyAuKfPgN2LyHIlmbkfIi/odur9nNGg9ZJXymMy9QEIs8pACQD78CZK95?=
 =?us-ascii?Q?EbYrKOoTpaXA0nQ0VaYx6qcBnjZZM5KIT5Y5AJX20r8LgjxSWCKty8KPbxX5?=
 =?us-ascii?Q?odjFu9GZhs0KoRLUKXIYlX9j+6662C3UeFrK5bDFmiDyvvZmxECKseKs3ljd?=
 =?us-ascii?Q?CUWUqb7ypbtYpTdlGP50fOTYDzRMCpW1bT5VKz4Ns8ZewlNUtwd1MU6KxRjn?=
 =?us-ascii?Q?2i/GEZyEAfs0vN8oS/1J8AN5xbgUCV4oQnsWKOyHR93i2Bty5PQjRwdvSMOx?=
 =?us-ascii?Q?bYk/0oABurfBoUZFRfGk9w4ndlbD4/2MgxpYSOtfRbiNcXN3/nXGxYbY6eeq?=
 =?us-ascii?Q?L9XGebExeMr/5to0tr14g4K3/SCauZmqcvZ6gNTb23Z6a5nmVnxMKeheXZg2?=
 =?us-ascii?Q?wU6gqR3mlCCNir3M/LiVQkbKBuAwPx04gC3ov4b1aRB2zY2hTmkvQ7zJ6EVL?=
 =?us-ascii?Q?+6L8YulICrz7844wC04zzWjCw9hZ4WSRCC0aK/aHfMWb8bAUiynjdAm65sMK?=
 =?us-ascii?Q?KkOLLRAW3RTT2mT4pmur5aUNOFdCURQImEfecyah5+wUHZ7OBjRHczRkK2/3?=
 =?us-ascii?Q?qB1DHJZupgUHedT9OrdFH4rHfwDNLQLXNpNJOQD7WP4cyMoODH9kOA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yovnb/KP1qUzSoHvkA0bTPK8AkTAXTM/KJGBz2yvd8JWDNn/eQos4sIJNEvs?=
 =?us-ascii?Q?f+R9taWpie3LhUErzZiaxjlfYM6BO/FJfSu02HR54J5fHXgku6RxazXGWlen?=
 =?us-ascii?Q?UQZhjHiBeX7umpPMzFFxtIgSFUqWA7op3zsW3Fww7pm7z5viQztQrL2ZkPH8?=
 =?us-ascii?Q?hBW+PkuTjS1FtHinbf+hTS0JSalnxaUpbOANnRPCCSwCbkzMQTQzNykzSXBF?=
 =?us-ascii?Q?r64Y4AQqltEMHGAPK9F0rz/PgvnOaNt2YQ9lFSbT6Q3fTH3PIjmUEfHU5BPD?=
 =?us-ascii?Q?YvKP6DbXCoI3J1XBnwJmTyukzX7G2nI8g8jlNBEKpOYWmRlGnaWJ4GmJIhAc?=
 =?us-ascii?Q?TTdUEqxXL/zK9dpc91RhSiLPduT1hNyv64D3i+kgTyyx7nn+3ygWaGcuBguy?=
 =?us-ascii?Q?2y9GAH20dQeEsyN2zAUE/i4hJOPJNN+WO3EzeCprIbQuIN6jjesCZhU4R0zs?=
 =?us-ascii?Q?k6jiQ+XprAGxgceZoAN/rxMo7ZxTqe+LwsjU+k9WkHLnkGsWaAN5yd22Ktoc?=
 =?us-ascii?Q?VkMtKoYNbpteApsLh10x7fbRbHXuvNtv31S6M8R6Uv07/fP1KskPiOUob3UK?=
 =?us-ascii?Q?TpY68OyluDmx7FNV9GkVKfrg2UcI4+I6vdD6eWPObbKqR9iFwNz8UyNPFuOm?=
 =?us-ascii?Q?GkhoTH9gF4bEGffWtPr/ICDxztxLfJNAnHQ1iPkCpjfJOSZan5ETG8Zj8jkK?=
 =?us-ascii?Q?q9nsFWAhYTg1GkwrCuGVZIkO8hlVuBz9NwkKRluGcAg7Xu7ZGVHkA/1Os5dI?=
 =?us-ascii?Q?2JdhlRwZ59QSf7uFvXuipOMxrQIeLvUiDTr4fWNq8g/g114zzbA22Yq+ihmB?=
 =?us-ascii?Q?KIRO9EqsfpbU11fE5MOjyJF9luL45/S4U41BBAOwULwHFTrGBLalY77y96GK?=
 =?us-ascii?Q?dIsdzWH792eizAuPScUUWIjMPRohpIge6ojkU/lsMbtD7EZTRMxIu8GQTk0I?=
 =?us-ascii?Q?eTXYwx6LC6H+/tdBgkoksZp+AOf1YPTCToaGO+mViPiO45PCqLknyIjYkg6k?=
 =?us-ascii?Q?0SRaUIGkXolQ25xQjX/NzUnm2GQSB/0ghw1kgNeFfg5dUs56LDZKv+a/Afgu?=
 =?us-ascii?Q?6oeOX6eaVBl4I8Mp62qV4CScUNatIo/q9BGI2G5eVWsuOpHZxtIGXVRbH021?=
 =?us-ascii?Q?uasa8ej0kR0KnZp0RJZoRXevi3nkCHcDQoDvWQcTL/WwxtnNJmgsYV32NRHr?=
 =?us-ascii?Q?VwUrMK7+qBcbCM/VYmbzextuulew6fBuzFvGRG7F880kucmHk0ufcbrd2Kvv?=
 =?us-ascii?Q?q+vJLRq2AtO4R8hfCtDGVlhwCgBGYxzjW6/v5LNY7/d4cW9OP0h8wqeiXGD5?=
 =?us-ascii?Q?TfbPBQro6ihKF0eUWV79ft9daNmDiPEn/AqnAPVrThc9Y5U3XdLUdwnHMP0C?=
 =?us-ascii?Q?IOXKqKMyjGMgJTvVBHyuyHz3zbXLR0MlAfUfirLci3PuGkGCUqTQs3w1vCWn?=
 =?us-ascii?Q?JoDr0GENhjjg5hkfar0tE1R+tnGTIZyMaEEa87dC/E9HWt38EN3p4y2bNw0y?=
 =?us-ascii?Q?6nAcfay9jfdrnuUlQ+1pJVRCSt1VBMLxuHUrF3kFTz3G1HVsJHLtKakoF5zX?=
 =?us-ascii?Q?hCAtkXhF79cX/A06vzBzGJ8OrPaMNG13IFUs0YVf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006e3724-2607-45c6-16ad-08ddf53a87bd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:03:09.2277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlCIZ9ta9YkvahaZ1Rx46ejOn9WwIbg7nSHJPs3aiUXy2IDbiUgEp43RtxqXBtfdxzJoRBepjexNBhw3TmC36Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7098

On Mon, Sep 15, 2025 at 06:42:13PM +0100, Conor Dooley wrote:
> On Mon, Sep 15, 2025 at 10:30:26AM -0400, Frank Li wrote:
> > On Sun, Sep 14, 2025 at 07:16:01PM +0200, Dario Binacchi wrote:
> > > Support the touchscreen-glitch-threshold-ns property. Unlike the
> > > generic description in touchscreen.yaml, this controller maps the
> > > provided value to one of four discrete thresholds internally.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  .../input/touchscreen/fsl,imx6ul-tsc.yaml         | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> > > index 678756ad0f92..310af56a0be6 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> > > @@ -62,6 +62,21 @@ properties:
> > >      description: Number of data samples which are averaged for each read.
> > >      enum: [ 1, 4, 8, 16, 32 ]
> > >
> > > +  touchscreen-glitch-threshold-ns:
> > > +    description: |
> > > +      Unlike the generic property defined in touchscreen.yaml, this
> > > +      controller does not allow arbitrary values. Internally the value is
> > > +      converted to IPG clock cycles and mapped to one of four discrete
> > > +      thresholds exposed by the TSC_DEBUG_MODE2 register:
> > > +
> > > +        0: 8191 IPG cycles
> > > +        1: 4095 IPG cycles
> > > +        2: 2047 IPG cycles
> > > +        3: 1023 IPG cycles
> >
> > you should use ns
> >    enum:
> >       - 1023
> >       - 2047
> >       - 4095
> >       - 8191
> >
> > you can limit only 4 values, but unit have to ns. your driver map it to
> > register value.
>
> Looking at the driver change, I think Dario is already doing that. The
> text here is just talking about how the controller doesn't support
> anything other than these 4 glitch threshold and mapping must be done in
> some way.

Thanks, but descripton is confused.
"Unlike the generic property defined in touchscreen.yaml", which let me
think value is 0..3, instead of ns.

Suggest Remove

"Unlike the generic property defined in touchscreen.yaml, this
controller does not allow arbitrary values"

Frank
>
> > > +
> > > +      Any value provided in device tree is converted to cycles and rounded
> > > +      up to the next supported threshold, or to 8191 if above 4095.
>
> This seems to be the implementation details of one particular driver,
> and does not belong in a binding.
>
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > --
> > > 2.43.0
> > >



