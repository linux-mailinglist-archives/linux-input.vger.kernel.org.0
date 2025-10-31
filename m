Return-Path: <linux-input+bounces-15837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D6C26C47
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 20:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E180B1A24E4C
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 19:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3702FE07B;
	Fri, 31 Oct 2025 19:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="foeVSNkE"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F42EDD7E;
	Fri, 31 Oct 2025 19:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761939166; cv=fail; b=MLA/yNCxyr9tx5Po8hJp6LcYpecNTd//p3bslnN8LB4Fwh1+1WYvCdwyGpX7Pug1CRPeDpOkIZo9qNuy4EZeb9uG3tD+dgqUTHTcwewSEkiq5NaPtOY5uH7oJpFpZFsTxCQV7v3uGPXdSaZNiSIuyob9/eW2pdQhiGXBwkKhPHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761939166; c=relaxed/simple;
	bh=KG/VgBBl+/YfKP3gpGHjOlPeLA6iIKGQKJbP2SvJ5nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GnvIWqp0YgP/EgbfA4PVUyQGetGdZPp4wFJZJLY0E6LClS55mdYfH9kzNZNwYEoCKNH0OPKYSfvMC+Y3U7Qbme9kfjfWrQkgih1/LRE3cXW3lhswnqLi6uKfDicfQ/CeiFQXFokA8BpLEyBTLUkIqcv0xL81NZDVHhS8jJB7SGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=foeVSNkE; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YErKD2aWJPc4VMHJ6u6QRtqGp5Wu28Uw1doVLwkRQssKELCUZ95Xz0O0uZYE5VHi/pywVuEMO6hoqz7wCoXS5m2fVbLmm2epZqzA+12KQqT3OE7lJJ0ddcD++QWdzbZwSQ9gAud1+vzZqcNBQNoDqIq4+r41sF024QFgznU0GFwN2LI7NAsChUUxCi3YZyT9VnaUhzbTevSQh1r2gSVwvHGlccnJuBfc3LYlg5miKdgbMdaErU5qSrlwzhm2OQaEDTovGbclo8Y2p8BmMuLvah/+kI67BydpfbLI6/sxl1MV9fP7vS7ncYt3ani6NYj+Lnod24Jg2AhlReJaIOORvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQfoeu5KvtSVWlVqF9xC3uk6oGOkO9MNDfwvOfsZgG8=;
 b=lVjmlRQ/Qso18cs5TwnW8XNDhqiqWl53nXitoHhCc4FFmMp6K3FBFpTMdWLAsK3bIb8P+Zj3e8DoKYUihYm4CxvmP2ZpbHwsSPWWMpUlBoZm8dv/kF+zaFjv35d3SVJR9zKcUA4I7pLhtBckpPOgafr939tPycqk58EUPFzOTLn9KQeeDdCZCjvC1jQV3BEX0YktMrDixmH0oiZgP9xLT3iUt0bSNW2rdrGtEQXSfQAsTqkAfA44ZGRkRfRVQXEXkj6uvR9zI6D8gLh+7hUroJjF+6t2FBlnc7sKnj+S+O1SXL/Gw7xtQOWC0Y12S3RanWAmR0TJdcu1OezZrzjUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQfoeu5KvtSVWlVqF9xC3uk6oGOkO9MNDfwvOfsZgG8=;
 b=foeVSNkEBeNnMLZ+vZBn+uIsVDoo9UKeqQSLaRS/0Hik2YCNeKAFeUZp3cM8ewneAZp9UuYouj1dshgE4LZSoLOt/KFASH9otdEmL4nW2qhZ69A0WqYu64YHC9pnuNxNt/QoJvfKI2hvjy1Vbsw2K35MNUwxXad3wz/WzEmFUxBj/4HlsWpiFqTHfXiMLT6gA73gYNeKqxCnWtCe4kvsMYzzAUQu8lTEBDBw2fplG6SJcmp7Vs1PT9DxW7yOJVX2eXvRKOuxfXCeQAlwfKjAO9RNWPPCASvF2D6O/yHuTJ27STacHE7q+a5j2i7ivIKOY2g6sibOpfZg1M9oUTvwOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBBPR04MB7596.eurprd04.prod.outlook.com (2603:10a6:10:201::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Fri, 31 Oct
 2025 19:32:41 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:32:41 +0000
Date: Fri, 31 Oct 2025 15:32:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Kurz <akurz@blala.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Dr . David Alan Gilbert" <linux@treblig.org>,
	Job Sava <jsava@criticallink.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v6 6/6] ARM: dts: imx53: add imx53-qsrb PMIC power button
Message-ID: <aQUOzQvfACiwxkGc@lizhi-Precision-Tower-5810>
References: <20251030195654.20142-1-akurz@blala.de>
 <20251030195654.20142-7-akurz@blala.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030195654.20142-7-akurz@blala.de>
X-ClientProxiedBy: PH0PR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:510:f::34) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBBPR04MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a5a87a-47c4-4700-b224-08de18b4407c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xP1Cw6ssn7HZdENX97jlJdyynM9jsfcpU4ZbzkBDSqjGSURcK2HG6RsAGN4+?=
 =?us-ascii?Q?o56eFcn7PemUK6rGtdz6KJmlvqRU7E2tajSXAA2NG7yVSp+XTFP5+PmGVejI?=
 =?us-ascii?Q?wy/f5qJsf/u+0KRu9gYQJORR2mYdmdWRm6nFsPMSrUy+rzFHPPbPGFvb0Fom?=
 =?us-ascii?Q?kgwrdiIWeXtb77sc0w/uLYQ5X0L9dI/pGN2H7Asbbjv7lekRFbGnXUDxRlR9?=
 =?us-ascii?Q?YPr9q2C2Gk+SNeJjZD9m2+UbcoBtTzulh+aGK3DoPAjeeaLI+P48w8Cpggth?=
 =?us-ascii?Q?ZxrpWgXt/qmzDEHKwaLQzi6DAWgKAtoWLChetqGW5Flg94lMsgehLesij3m8?=
 =?us-ascii?Q?4BWtD3nDLobbslucG0cw6Or2ZkBU0aBnCuO4J17j2MHQ8vP5DDcusb4cp8cc?=
 =?us-ascii?Q?akepUDVaA7fKGq1UL79JqLElRTjqavSHe88Kf1kVfGXLc/r7fXmmHlW0JXWx?=
 =?us-ascii?Q?NnkS2uDHSL5Wk+PewnBchEodOpwlObCAmMZHmw3Ix4oMNFH8Rkm0Qet71v2H?=
 =?us-ascii?Q?82tFcohMtZel5C33V5RthRd0NWafT00PvXmw4lGT62Ei609tMuOAA4+z+b/L?=
 =?us-ascii?Q?NHOrs0NJsYcmptpBGBx56dtvu2lrE+GFeCP+pQy7yeCdLVYW3YTxieBIyQl6?=
 =?us-ascii?Q?LlrPFz7/5YztgAJ7r0G6Xriacdh6NaJhNTs3cKgnA49y3f2AU/xFrzTCbzWW?=
 =?us-ascii?Q?ja79CF9mt3jb83auohwjpyY86BQmR+bkUMoQp+JUAw9Q1thnCOOAz/ijEClP?=
 =?us-ascii?Q?F1J/p6Cx/P4DE27xHJbJMfEPDbdWh1EXEdXS0KpW1U6sOtaCrQim4c8noCvy?=
 =?us-ascii?Q?2heP59cnoo1syxjZ9YQ1ChZPjKnCNFYrysM0a5fSiXggDmLZTSKp1atYSCJP?=
 =?us-ascii?Q?43wVVZhn9HqJnu4DSDNlOgqOZgzqCtMIAgqyzV/UgUVnzR/ERKarvnzH1DPe?=
 =?us-ascii?Q?8aiKJJJdzHWvwfMiQn7rF8ROgK8RovVSKecU0OJCDz7D4ndDrqljAxf36XJf?=
 =?us-ascii?Q?PV/BkXtRbGPQ6n5ZLQDAHLZRtyBxmqVMZv37XCKxR28megbje81NLvsD8E7e?=
 =?us-ascii?Q?68tHYlrz0o89WI1szDU1C0QcCyBeVF8bQOMIsjZ5wXwn00VZ4/D8TLmXW2hu?=
 =?us-ascii?Q?lS3h1lw/BT95iqx5Q/5k1M/1N+O58YV/3renBpe9JYYUhZP5pP1H0dCh9PwI?=
 =?us-ascii?Q?1lu1Ix4K3tXpKz3E+XVPMVpDWBmvMxMlh7F3Vz/Nmkj2R3Gj0n2+1CoDkcbR?=
 =?us-ascii?Q?ulXnnXub09WuitE/eRFJjVydVTxloRFzyfJXBT2x797Oyl3Jh9gSmajgRa37?=
 =?us-ascii?Q?JZdHYwQo75K3jqKXQiByNWIY5e0i/LAPxWcIAF7jE19SoZR9jxE2qeSUsCWs?=
 =?us-ascii?Q?Ptf8KiXoRIjeqFuR3xSqOe8iXEvFa3Y7RJEGu/CwFjoS/1AlFnRU6DKzaNp4?=
 =?us-ascii?Q?hBJQAqUHxpca8PvR4v0485jKJrwnWy9KqevhtkD2m/PgllSDqUjcl9Ro5Wsr?=
 =?us-ascii?Q?OZMG3Xq4cnZ5yxy+4MoKyrVDGe8wxWpoyxCc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q3KYSFgQ76fuECDXwpT6GQcRGyfZ53l/EIFn0hF9WQVQyCS3bvOaIoIq+xjn?=
 =?us-ascii?Q?XAMzIyQnuiJ9iXT7BBFV3OLQNgc9SQJ9Jfm/LcZJ36c2UpewV4rtEIh3fmVb?=
 =?us-ascii?Q?690FowXb5VCkOVRJH8DYndxYVmodUHEAxShFF2EgnghW70xwHmAzRLojQ+sF?=
 =?us-ascii?Q?aY3eyDUMWMJbl64+DonAF96k+aoTxjCijnLRU+u3yXdKkmb9N/r/emcNfKkn?=
 =?us-ascii?Q?T1BEw4O96/zSdnWBwnd5Kucfg6TrBUDlquzuPSQQbJIq8ky9r7IojuVzvRW8?=
 =?us-ascii?Q?nn1h3UbfpxzNMFML5O7DCpr6WMQedQOc50AKkBZ4PK0ye+j+a33joMyDlRAn?=
 =?us-ascii?Q?S6T9hlB8MdnGvKzjkiJwkMLvk/IVJyxVgG1YQ1yNx3BQPqqZElkxbcJcM+/4?=
 =?us-ascii?Q?M5cwdSjg3GkvMrgERAq59c/J94uAmqOPlAEqlRhI1Fb8Ts0jdn0X9BgZlBG/?=
 =?us-ascii?Q?3yVrk9F3JaJiTw3npPTqb3QKagag3onwrz5Hfi2JYGl8vAPDGTMyhjFyQUDb?=
 =?us-ascii?Q?THMnMTHBZ8Vn+RZJoR+kkBV7lv078mtC8xV70K3u3pLTQWDewgcEPSzgiIRP?=
 =?us-ascii?Q?bjzHIxASDPyJVmOhyN0n3DH9T+VunR5RIhbtdthIYCD+t9NqvzbzPoctUT/A?=
 =?us-ascii?Q?nYbMoMVEHl50EKduSGYmF7EVmkScaXifbWk4gWUcEyh1IR4l/B0YR6A7IXn/?=
 =?us-ascii?Q?+amUhdfEQAzjmyaeGB9rp7yVi1HqBvif0DDAW7O9tdlDy4FPCz51xpsX5EXx?=
 =?us-ascii?Q?7wW5zOz/yFalFPTc3Wh42oWY/D/sYoEM6VSBS1MWfvgiCksi5ZhVvmChkVkD?=
 =?us-ascii?Q?F25DzgdqnBr66VUxSbqYvoy/fBwPtyoTKun6jsxJwfnKQMyvfc/V3lNQ5RkF?=
 =?us-ascii?Q?L5rzIsJoUDYcnd/tzDnjQ5+tOHHaSVRRv51T0kPtgMIwuoJ6LErQstBwEGtA?=
 =?us-ascii?Q?NqTQTLL39gE6ZAhcAb0Lq1EgjgLvv0wQCR3fqpxsCm24s2UPyJOWNrQGRb2s?=
 =?us-ascii?Q?rP9D1PmWWQeiq3zIf092/MuZfCIudKxGwsCq72D6TYi1gcbJ11wNLGR7Ia4f?=
 =?us-ascii?Q?TVa2ZrOy5Qo9fn3lfuiom0UY2CdYsuYi6Eqn9BVDOWWkCdi9By6Heofh0nLe?=
 =?us-ascii?Q?fN3jLa9h/VlVW6JDWvOa5giCndTBhqjsZ2d4mCyIut+nLs9wAVW/0jK8OKio?=
 =?us-ascii?Q?/kcrh4T3nCSP5hQK45W/FQ8VUXc7VSdeE8oroJRnxjQuwfLXkUGjo3b/t+Mk?=
 =?us-ascii?Q?+PPtHwI4nD2I9YnIRcO9T4HYXjW9e27/qBN/Tfdrpdw/k14RlmFkJh1+4mWC?=
 =?us-ascii?Q?nIhJ1DHXLsASciGp2tZYy4D5Ntt0FAJN0/skn45BQ8axWJYPuxzpgBIIex9u?=
 =?us-ascii?Q?X0z2q2l2j13DZEoGWLwiWqLLwvf4+NAi1SzebaGRABXHcsEICMNseKeiiqJJ?=
 =?us-ascii?Q?cPCk68NKiH+jYCTSZOhC5YxV9+H1eD40huHJpg1ztTAFT7rRKT1xddetqz6+?=
 =?us-ascii?Q?pq+QR51kMfQN6v5wJTzzLmxG4uesCzU4nEIV6N7VhgFCQwZNrlmiXffbodvK?=
 =?us-ascii?Q?fqkxf25YjcihP6rkTDhlj9fRZCkO8tWogx8YGzUo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a5a87a-47c4-4700-b224-08de18b4407c
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:32:41.4863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r18CONQwxSX98ko0iUjzPYb0iP6I5SDK2RXg8IWw9iy5jS4oD7DOq4Av10YEkDmHeG5FkEl3AKhfcOoRV5R74w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7596

On Thu, Oct 30, 2025 at 07:56:54PM +0000, Alexander Kurz wrote:
> As described in the board hardware user guide IMX53RQSBRM-R.pdf, the
> mc34708 pin PWRON1 is connected to a button "SW6"/"POWER", connecting
> this line to GND.
> Add support for the imx53-qsrb "POWER" button.
>
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
> index 2f06ad61a766..2a6d28e9e8f8 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
> @@ -139,6 +139,18 @@ vgen2_reg: vgen2 {
>  				regulator-always-on;
>  			};
>  		};
> +
> +		buttons {
> +			#address-cells = <1>;
> +			#size-cells = <0>;

Need empty line here

Frank
> +			onkey@0 {
> +				reg = <0>;
> +				linux,code = <KEY_POWER>;
> +				debounce-delay-ms = <30>;
> +				active-low;
> +				fsl,enable-reset;
> +			};
> +		};
>  	};
>  };
>
> --
> 2.39.5
>

