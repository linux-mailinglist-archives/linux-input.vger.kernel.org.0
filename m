Return-Path: <linux-input+bounces-14874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 178F5B8701C
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 23:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86E83169E04
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 21:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEE32C11EE;
	Thu, 18 Sep 2025 21:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SZzNaGiV"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EB2857F9;
	Thu, 18 Sep 2025 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758229596; cv=fail; b=ROr661MQd4okpA/x5zhnThOM24WzKkz0dfsI2kpw1s5HYp4Qdk8ReLclUMIVuiJUxzMVbX9oWcv1/3f9KFteQbWa3tfDTxBx7DjOKMCGjnWLxQHbgcFGPC1gDOcZFbdWbR7NR7w7cqAZHecegDRt1339S0huuM8s8R/PHKlsymM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758229596; c=relaxed/simple;
	bh=9yqmJhpq3t7v92awOHTXmYyMee4JEEDC7IxZBMD5mFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I8GOKpdW1X74dfXQ6Bj4RRyo1CnQ8MQ4cB9+AIEGV+pkdKP09POSO1gA8YdAGLvhlUVGXk7Vp1cKiwoubjkDjKJNSlUVW3EmtFTtS4CvWEAr8YLu+YN9KjNoSw2qFeNDXwdbq6By5CQ/z4ajAjVs3apXrSBcYXvugyByxKcGsp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SZzNaGiV; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCSaH/FftFWptLbLK6/TX920Hvv589ZTYBiQpRbbjyezaM16arbQJYuFgDoBqbHWRoK+2UYs/JUHrSFbWXqq/hf4uJ9JJtmb6kt+eCI41TC7qOYIquo2jDPLhhfPm13gbvmrWdkc97BxmYx5QnoHkA/S4d53LoszRRwpeA5tTndBMiYZoKKOwhSYwjWAmfC/yVvTtzkABxWXsmPhutkYGyNfJbcR8dAmolc5r9ZHk6VrWAfmKWXrXnkSsD3SdD7oTKP+dhEJmP+BHjNZyi8inR2ZhlrZopcq2xUUR5P6vm0jXyVX6DzWkGNrf6WDLnsYXZOiWhDghfGCBUIWDWfsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLBqGjR4UpXW5ENjPXp0GJ1u5ON0GIxmsM+0mZnpfdY=;
 b=OAkfuR8TgLg471abxsQbT4PfeCu29ALUXupowfKVyQkTHN7o2AFfzxlzUT3NIfZSXUnZ571EhoCxn5uh75VnHwRuVX9PN4qDeBA+FOhhRdhlWhNTxUczU1UMXc1xXa86HWvZ+hJnKSrI3WgHlz7OAMFhR70+UZDkADSh2ydFvhZD7hCy4jMsGkE944GqpD+X62FPcIEnMKZUxSh7+3HhPF55UVYjMZJFQwyRbkvtHCES5wN4IuRP5vwo9XvBGSiWqje0aTfyLtdmX7ZWu9LfK69X22BGXOj91M7cAqTjm3gGct1zuUAJMQu0iTBNmzEB+g2vaFRXSYjFDpwPZTQzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLBqGjR4UpXW5ENjPXp0GJ1u5ON0GIxmsM+0mZnpfdY=;
 b=SZzNaGiVzvdOTG1JJUvwUSvE9Wg/ebKLO937HfxCHq+/Rb0V7ThTHwp29p4ypQxboLJVJ6UV0Jlm3uggH45VdpPFB6/rvc9RgqzpU1Sayv73L8hGYzm9tlsHSkgZFV3SOWWODIcOxjmLDjftYAPaMZtLWKh9vaZH2Dj3kcS38ySfm67VKpFxa5PbJNJmNcsi76pDaYngBCyamEvQLFjk4QNKhAMoCIzASVWrcdEGX8m+mtAi+m1ELyXWB47qFG6+e0+jEPrAi/M2HPick8QFiK2BQtxg6Bn5TmYGB3nrPOQa3MRgpY6gXKsHi4qjhEmuIABdu42sSCO1R1FOMgyULA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM8PR04MB7795.eurprd04.prod.outlook.com (2603:10a6:20b:24f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 21:06:31 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 21:06:31 +0000
Date: Thu, 18 Sep 2025 17:06:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: touchscreen: convert eeti bindings
 to json schema
Message-ID: <aMx0UFYsvIRbrCp2@lizhi-Precision-Tower-5810>
References: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
 <20250914203812.1055696-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914203812.1055696-2-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM8PR04MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bcf885-269f-4673-ec55-08ddf6f73ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6KEo4/OaQqCS5Wvp3ELZaBkdk5FAs1DJMc/D67/QIGgNwwjz9+m/FTlB+G+M?=
 =?us-ascii?Q?tjOjhisx7ktmkRNW9d+TogLHlHPFm6n6OhnUBx9CMjfH0FFaIK4+ApL+rsYe?=
 =?us-ascii?Q?8huDce0CimjkuZRHDV4B0Tq7X6ZHBbuLjLYfNChcrDJfXP2wAyzDr0xd4341?=
 =?us-ascii?Q?LdaTcPLojQ4S55FVZsLTtBOoH7zIuEnUHhU6Ne56ZIQux/9qERgCdw+9JVcA?=
 =?us-ascii?Q?0+OS1VFmsd8v57jmY1r5RVqEAS7KhwyX5sjN1BJ2uXIUcDso16+vpzCQzAK4?=
 =?us-ascii?Q?TDPKrhR2TLW7JruyNQ9ztYdJH3DO4maZM2StHabPURtHweu8Emkq/BSu0e3y?=
 =?us-ascii?Q?HnDzb932daGovA9H8V1difKm5/5rhjV3yXII+AS+1NsEqiZEOD0P1odkOyse?=
 =?us-ascii?Q?6+uTUMl2T3Clt1tf7mbKqRJ1cEZyXIsb/Q8pdswjMF2PpBucP5djKWNs++ny?=
 =?us-ascii?Q?L+I65bPvEmjRpmGKfNocjkAR4pVfAcPYLbWSJaiJ9tEnNs0IulR67P7yCXlL?=
 =?us-ascii?Q?heCqD/J0ySAcz6AAF3XQbNeMJMTm7cwPP4yMummUCUIPkz0Cha4WpUo7DaVr?=
 =?us-ascii?Q?fZbGO/jbWUhEZMG+I3lNkTZGa1W2y6xJcE0LfZs0p7urx4gTc+WGieUTo2G3?=
 =?us-ascii?Q?ZYimsvEgYp7vQhVUlW5RYW92FnuRiYNJFIN0R54v8cqjPpRj/0qrIqrI8CwR?=
 =?us-ascii?Q?pQLUSPSM822uDicauxPtGGSAkmbChlGqMmUXKNt2kgjRcDn+C8w4Eq+F0p9V?=
 =?us-ascii?Q?mPQX03s1A4PKnBTC2vK9TKS4pQi/HcOSU+GXTry0bkL30d6Vm+WDctUXiDcT?=
 =?us-ascii?Q?uS9PlYSQi+dD1ylwIoO/YeP9VL/wvNrbG8ubhbt/Zhq1e2OZ1WHDhhnrOhHB?=
 =?us-ascii?Q?tUgTrLb5Ea6by+xr99lHA6DEAbJgtTSnE0qqyR1C9kUeqxEhWhVkB3eGPuBQ?=
 =?us-ascii?Q?lUGYitDAKXm3ik4p3PRsCFu3Cvo+D8GbICCrw062Lcj0te/rEjX45sDCWft1?=
 =?us-ascii?Q?V8hCyjamGafImwfb/Uy8kRHM26j5XzV02x3Ds+cfa0RNjvPetsOrGYD/itbA?=
 =?us-ascii?Q?2wm3LY1ugApXzoVPy/w6PGKTK6OLzVjaYYagTcDzafDjNA/uxXqwiUS4FPKi?=
 =?us-ascii?Q?ukf+KWObjql6c5Hi06BV29EUR3DhJanNhs6cuZsCGuVu6gOrOlUm1T4a3ngY?=
 =?us-ascii?Q?WHUTvwZnhNNEPJ2wGA+iKE3QZ7CnfbcryYbnL0Z5txzxeamKrpyShD4zYAVa?=
 =?us-ascii?Q?FZjUzAUbefi3nViky/akHR0bRv6UGV645PkPQsg7mcnK28062ekcM2YfdlGk?=
 =?us-ascii?Q?jlR1Q7ynlO+Pfk98fxLbaczgrU4n8Dd/PZQisjpiU8i6SmzXW3oBwmuZWzW8?=
 =?us-ascii?Q?Rh73KUmXdntMUESqPr8MYtW8UIKA/isRFYz7SJ+Stq+9mJlaNBI1UdT8mj1h?=
 =?us-ascii?Q?nfXF6fD562E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZqCX7Yo2XCTJN+pQflpHx7HBRlJZvNGmSt1izDbHRaSoBXkVoBLtI/nVOnc9?=
 =?us-ascii?Q?8T1iaN01KUIv+x6usV/cNZ+3xQonQjUADjliBtiynYLQglDYlfJzQdXK1M8m?=
 =?us-ascii?Q?1BgBDQejgkNtMaKuDYdEMJ/RsY/jUnyik5g/cbzzK8HfjIYyzM6WIk+vzKng?=
 =?us-ascii?Q?7yfYIA8GzpMP2ftxXoWecSrb8mzn5NKEyN8TYwAmLSj+ndkFjIXt0wMgT2sI?=
 =?us-ascii?Q?nhK3Zl1jjKO1KmN0efRDKkxhM3qq8A7OVzCrKh5DAoNvxRSrnpF44ZO3V5f/?=
 =?us-ascii?Q?VrYanSC5kEVWbuA6fxGAl3U83mHsuzDMBQhEub+3pdtTil1ULkJc/MTKbY8w?=
 =?us-ascii?Q?HiWRlbAeKL2cBYXOBS9cQQr9dT60CSv7wFpbIhMrMWu0BNvbbfZy5f9zrKIx?=
 =?us-ascii?Q?fnGm/pK9MQwQrhRExydQaqosAnEyAhPHqfrvO135vzBCWnKbgKLs4Ri9kk59?=
 =?us-ascii?Q?Q91jVP1IzZItY8Q45pfPDg4AB1jgh0nNTk8EnSUKAKkHgu/465298XvY1HBa?=
 =?us-ascii?Q?NbvDqQ5V7WeXHyAA/3SUwtH+E9keIcqk0V2Mst/BhCrD2FySXDPF2DO+JRyM?=
 =?us-ascii?Q?os73O/zgg4sQWIVq/lZd7F8tL/JfNrXItHzoLRKepvT9TfZrEoyYqKjMrt5J?=
 =?us-ascii?Q?1ifjyEZIBFLaBfAUw4cJw3P5Ke5qWF8lmJM5s2adCxy8pzNd0TX9NW5oIkIG?=
 =?us-ascii?Q?ipeE64wJrn5HiWGXe5GY2OONno8JQZL5x40bzIPsmq+U1LGy8AOG1d8PzPqK?=
 =?us-ascii?Q?SDEYHR5pwkXJ4bm6Fq2D9HptHTWBtCAnE7iIlbqujfecBbUNr3n3dUcPAl04?=
 =?us-ascii?Q?fWASu02ZZTcK8+dCswYtn0usyAtNs8Ik4CoIDrSdCQQQ0kAf9WkUv3fPyEf4?=
 =?us-ascii?Q?94Fi+yrR5ETFPD+6qok76msHP9+yfKjTo01p58JU6q5HAHLE/aYjORQrGMMP?=
 =?us-ascii?Q?Ys6VsNNQaxbKeRD6IJLCjACVfhXfBwpUUQKLH/mWYh9dc31Md7FnLhFqOuDZ?=
 =?us-ascii?Q?N77C6BWfTKRHEml7f7hAhnZXnyzqGQoGMqgYCRblGBrtRKI9K/jmiA6jrVTk?=
 =?us-ascii?Q?tJCLy3rkPIRr1dXHDaYnthkF+o9QnzoSFncDUS76Pgip1V3k5aPE1gqx6JSP?=
 =?us-ascii?Q?vnNw9HTuUmI+y7TpIa6qTBE+EMpX96fHNhyJd+K7l3FogvZMvCyDaxfT04XP?=
 =?us-ascii?Q?gPA0pj6GzlP8jwV65831V0wjvB0rN87/hyf8BEhxjc2yol7UZtHolF0Y3UNk?=
 =?us-ascii?Q?6GnlEwQ2W3gNlHZ3lP9P79A5eB8lmrMfrFpukwf/0NCVP3FzjAe44Z3Y+q5L?=
 =?us-ascii?Q?QtqOH7LL6sVxONQHYcaU5q4Hk//L2hszdulexXOHFoMdxASn3HeVfxiDOmYq?=
 =?us-ascii?Q?UEQ91sIgOoAi6vlGpmDbfEVodBHCylh1NW0IM3YPge30bUa1K13OHwrr0H/0?=
 =?us-ascii?Q?G9/at4Xi2laXiX7GAbRPcKXqWo8Wk/4n/tdUTnGzbR3IdxsXyBQhbwS/sFGn?=
 =?us-ascii?Q?DSLec7PpaIyOeofKEMEMyo9UsyjSF2t+6APpgxYx0/ZJjcHOWg2M8NdxcW4Z?=
 =?us-ascii?Q?xAWlqnfcqzqGSrwx4elVbPFrNx049MDi67VqR5i7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bcf885-269f-4673-ec55-08ddf6f73ddf
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:06:31.4662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYWJ+mrT5tKAsXExWeO1/qn3LwSbx2+bNp02uFaZVyskK97DLjAbJ91UVS6l8c0i5RRxNlIFcAhRm5XNKZadYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7795

On Sun, Sep 14, 2025 at 10:37:53PM +0200, Dario Binacchi wrote:
> Convert EETI touchscreen controller device tree binding to json-schema.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Added in v2
>
>  .../bindings/input/touchscreen/eeti.txt       | 30 ---------
>  .../bindings/input/touchscreen/eeti.yaml      | 62 +++++++++++++++++++

I think it should be merged into
Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml

Just add new compatible string "eeti,exc3000-i2c"

or direct use eeti,exc3000 and remove .../bindings/input/touchscreen/eeti.txt

Frank

>  2 files changed, 62 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
> deleted file mode 100644
> index 32b3712c916e..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Bindings for EETI touchscreen controller
> -
> -Required properties:
> -- compatible:	should be "eeti,exc3000-i2c"
> -- reg:		I2C address of the chip. Should be set to <0xa>
> -- interrupts:	interrupt to which the chip is connected
> -
> -Optional properties:
> -- attn-gpios:	A handle to a GPIO to check whether interrupt is still
> -		latched. This is necessary for platforms that lack
> -		support for level-triggered IRQs.
> -
> -The following optional properties described in touchscreen.txt are
> -also supported:
> -
> -- touchscreen-inverted-x
> -- touchscreen-inverted-y
> -- touchscreen-swapped-x-y
> -
> -Example:
> -
> -i2c-master {
> -	touchscreen@a {
> -		compatible = "eeti,exc3000-i2c";
> -		reg = <0xa>;
> -		interrupt-parent = <&gpio>;
> -		interrupts = <123 IRQ_TYPE_EDGE_RISING>;
> -		attn-gpios = <&gpio 123 GPIO_ACTIVE_HIGH>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti.yaml
> new file mode 100644
> index 000000000000..97027914d6a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/eeti.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/eeti.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EETI touchscreen controller
> +
> +description:
> +  EETI I2C driven touchscreen controller.
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - eeti,exc3000-i2c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  attn-gpios:
> +    maxItems: 1
> +    description: Phandle to a GPIO to check whether interrupt is still
> +                 latched. This is necessary for platforms that lack
> +                 support for level-triggered IRQs.
> +
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        touchscreen@a {
> +            compatible = "eeti,exc3000-i2c";
> +            reg = <0xa>;
> +
> +            interrupt-parent = <&gpio>;
> +            interrupts = <123 IRQ_TYPE_EDGE_RISING>;
> +            attn-gpios = <&gpio 123 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> --
> 2.43.0
>
> base-commit: df86f912b45c20e236060321c85fe35437e9325d
> branch: drop-touchscreen.txt

