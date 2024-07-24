Return-Path: <linux-input+bounces-5142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E913693B710
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 20:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EAD91C23AE5
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 18:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDC31662FA;
	Wed, 24 Jul 2024 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kHXtNKID"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013005.outbound.protection.outlook.com [52.101.67.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE015D5C5;
	Wed, 24 Jul 2024 18:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721847288; cv=fail; b=N2xFkDqwocKDHUwymp5ZQQGsEcP3dnWEV647Y5+jJQ0X4o6y9Tmok8Tj6zEosVicEkTTbKFE0MyfJPw3AjSAknWSCkYFAsb71k83q+Zm6XvmEc9McKRyldMJ2phfO5QFpKzis2oyiein8QCptcUvfYDRi6NogWcRNUOh3hDgvG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721847288; c=relaxed/simple;
	bh=WTleXmx1627uxsxy9G/L6BBqygAoT9sOu6ZxIdHbcM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bzBst+xdTSHYscwBzIJfb3m+wDyfsmnPzCVz5cMp9mfbXT/9NYFnTeN5ZPMc/OaOiRMvNRxBha/DHXBmHXaibVDOLOh8FSu277y4FgDR7Op0QPYnDnDNyrardCY4/MnmbAzkBVmlOP0LakpTjR745n7MJU8l50vHfm6+SuvOBJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kHXtNKID; arc=fail smtp.client-ip=52.101.67.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUI29+YaRIcHrpHbJ0yMh8nGe/i5AHXFUPaJkwnoGh0IVL+aOogLY+WYcHI095BifgjuIVIRnGjnfBGcKTAnuzkyXAhIkLDKlRw//Slxt6zeTKn2bz3riM6JAi1KNtSfK70lBrBcbYGtWyFVD2d77uSjA82h+Fan4UmSvYHm2lngGWupWs8Smy+yx6Ia32u2xsRX3OIGLfnna2J0he745AI8jlWWJZwupVCTyX18ZAHovDDn7UXDgyTBmOqTV2j73Ojc8/N3UkS6Pf+aLdFbeOxdRmAZq8kxUOzNN9aJ0PZZlF9yDNu+khHrhX8+8GdE872mewFtrsVxJ0jLnVN9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zERTBN2IQR4Umitd7yV8RC2VfqEOhOOdVwAsgl0ze0=;
 b=RYq6lH8ilpw9JOM11guC0/lWZD4WejsB/m220cZ2d/H/I7iTAnvHIDtzQdExREPkGI2IXJ99pMyO7hDX2MhukkZuXBonaGVPvjApfttHOiYEkTDtALFf/Uq640gQzIdt91iatYEU6ggLjggEicB2dXxeRfPIMmbqWNA6xAnNhmHLxcgpwd+xjb9T/O4FakRoPczKi7I3Xye54mJO3pprG5rpzTWSf6IH8WpNJX6m4fUa2Tpl4iOGtqlmG3cFRuqOfpXtB4ql4mMpXYLOM/eLwBHxKGxnODnIhgAYwLhK+DuHqWUa7WfeGtZ+y8AdYLvJ0lspeVtKLrc+A/8oQpmUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zERTBN2IQR4Umitd7yV8RC2VfqEOhOOdVwAsgl0ze0=;
 b=kHXtNKIDDEdv/vUqC/TcwxEWkY9ylDc58RmgykjBpwTN56Rz2nrT2TjpwD8aADGNfrU24DOVPwGGuexRa1t+lGEOAPIoDM8ys20CLNEhNEBRbq+kBwSHzP4QeqHrDWaHBpskXxrQWmg7g6so1kn9Akutog56HC+im/OJm99JdqvvFruTmHmkTiIk6NUejMf3DFkw5T5CC+8BQ1MaULvOPgj4Nx6jIktK6j9j7byRsosgstqp1lT0WL/3Fpy9ZLegpLIcwOSu3xx3t/l0oidejp7fY41HjcBqF+rBQ0fybPII+BnW12u4tXFGJtTww317PiuHHygbRB1S3/HIZnwrIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9465.eurprd04.prod.outlook.com (2603:10a6:10:359::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 24 Jul
 2024 18:54:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 18:54:42 +0000
Date: Wed, 24 Jul 2024 14:54:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Nitin Garg <nitin.garg@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] input: imx_sc_key: Enable wakeup according to dts
 property wakeup-source
Message-ID: <ZqFN6toImPWhRSvd@lizhi-Precision-Tower-5810>
References: <20240719152259.760457-1-Frank.Li@nxp.com>
 <ZqFGJwb-0MU_GP28@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqFGJwb-0MU_GP28@google.com>
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4cc9ea-99b5-4097-6abd-08dcac1213ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5se/SKc+9pQsf9BFXiSqRHpjEvLX/VMQ4Ym5+pcOeQld5mpcYvKQA8y/cvij?=
 =?us-ascii?Q?hyw50UdKuVNTGvcFQA0iedlovYVtEUgyLcGgzWsdDi3NIZNvEQ+kTEh67xVS?=
 =?us-ascii?Q?lFPHjai4IQ1Pn3g9X+LxFrUbsI5g07PmChmE7kqOZLad3nGAS99pcpBHKuNp?=
 =?us-ascii?Q?J71ErEojUSntl29EUnAfxEhzIWDXIiuCGOLHu8QplcAbL1SP9q/QEiKY0BcH?=
 =?us-ascii?Q?uirwBTmwK/Sjgy0f+6R66fCznLXKgT90YjZaHPE94ulwQl5wj8D7CSVqaRrb?=
 =?us-ascii?Q?BnieUXX2ruCfHAvpcK747SvtRbMRrocG8I+MYZFZ6kSKW5wkzVN/yfPZG6DK?=
 =?us-ascii?Q?/goPopQMreFKELTruqgVKTtJr3aa2duyjKlhJ218q+KES73z8WfBs6UVl/BU?=
 =?us-ascii?Q?ETHrAYPUj/alZLG45q8gwMQ5QO/c+9nrAMAGuA74/Gix3VL62TQfDBmGzplZ?=
 =?us-ascii?Q?bhbc2QAElsIkgY28+r1WO64t9Khk8qdHt9HhVUgrtrzoBXSGqTHxQNm7BgtS?=
 =?us-ascii?Q?EXoHZur44tRTJYzwIsU40bCHhWDajBXGcIxa3Va8LfXmecZzTahAhgfqKfhl?=
 =?us-ascii?Q?+omMv8pUyL7DO2l4T8NM3t/xKSw3N52hTMjJjWyYZM7lpsiml0O4Xbnt9Pts?=
 =?us-ascii?Q?9Rnb3MqE5uG2JzRFQgolgggkt3cOvgGJOqi/BaHGjMhlzbmVJ98IKZ1gMdPa?=
 =?us-ascii?Q?iSBs/ds7OWBpauZ54C5XUoV0ziOOFWylZRG97qm64Lt2+8kEpO2W3Rv6T/Rt?=
 =?us-ascii?Q?BAQu1wtJxP6JIlZTUvUIQDLBPFD6Xc5L2RUaeu6yH0dwL0yP6H2aX3HGlI9Y?=
 =?us-ascii?Q?IfnWyzsEHWh0frzj/ftd7br9rB0qkwazyJhLAh6TNisKzkawqkDqxNWN+D8c?=
 =?us-ascii?Q?yo4dH3KJt2hgtpm9tELaCqjSL7/jelbJLaIWMiJiwMFFyYgcoihLiJv9TyeM?=
 =?us-ascii?Q?OxX1FN2DCX6qImziVItK1JQuCd8D0ZgqesyGhC1osTKZ+UQoBE2CxTojMNfx?=
 =?us-ascii?Q?INdgKcRASDM4ZWOCUU3GKV+tequCpJjjQS19RTWAZoYLvQNdSpyVU4c/+Aas?=
 =?us-ascii?Q?SS+lFIqTq53qZQHax94+60O74DZq3xNuwR4T6gbNQweX82sJl/AAVMR0a8Ti?=
 =?us-ascii?Q?3bmKUKmpR83qagIYtcH7V3eUSHuo6NBdp6N3zFQ5wC0MEaVf8fgtZM3D2k17?=
 =?us-ascii?Q?aezp5YlyDnCVuIfKET+n2r56ZmZWB+C7hOgM44t6egoetUALjg96Fl3Btg5p?=
 =?us-ascii?Q?nbbDQUDAjrYofTrWW0fAVzHVt5tierVWWfGbnKZrZeRFeEYM0AWQmhQJ0/OF?=
 =?us-ascii?Q?5ieRayVmBWPn+NF3wsyNyxyWOhfePshDHGtMgi8yuCUe7T7tamBeMn8SGAy4?=
 =?us-ascii?Q?WqBbQyQsi4f9WUe9+8eJNh84JlovBbJj3S2BoCVgfE4pHg4wRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tQCwID32YtBiTjzyJjyGqRIvG0Bs4kmH6kFndvs0eoFN6rYjk+RU7BYKuq6T?=
 =?us-ascii?Q?NNL8yl+aAheE7R/UIzm9tLVTOFspGdhXF9fNmiyVvcVZ9xuDRNKJ0WUBBjj4?=
 =?us-ascii?Q?ZbrC0a/IJk0Umly8xE7SFQYWtBj53tKP5Jxj//+SHyzCjxGeGhklPSX7QAkN?=
 =?us-ascii?Q?rUfMYYcoIq3L6L8nFfkaY7dah/QYTMe7y30lzUFLbMm5+MdL6G55TSge9Gb6?=
 =?us-ascii?Q?8MSNYFDErDm7yu7iJg7KghDt+4GsPh1sUnymWjJd3OsBArQgFo+X3R5lXq85?=
 =?us-ascii?Q?OAGN7v16dLocW8kbbsk2Nq4HEzWBh+axdSesoTXeV83B0I8SKe+QA7t2BVdQ?=
 =?us-ascii?Q?6+Mkk8NkEiTlpCVF1/FPOZn9AdbMAqiIwdhE6+L+xVmBdJaE0SKonTacCevn?=
 =?us-ascii?Q?orE4itZNsrWnw3aChkiyTkvTdj8+rUv1fI2WJLZzVKVk95HLvhkeu/sLiqaJ?=
 =?us-ascii?Q?uiDNAiVYM6o+q37hPdIofh2PQxLpLcis929N8b994n3NndTMqNrOciRYv2KV?=
 =?us-ascii?Q?yj7iqh+bjUwxRdWhuZ00jdZ7LcRUzslD8b+nGuDwmPVqgna53DVWIiH8DnSq?=
 =?us-ascii?Q?jLZhVsOCGxky5G6Wr5Gv7OSounVBmvP2C1ufZGfV47HWvuqS0S2K6Ch4g0gp?=
 =?us-ascii?Q?l8ultNQxOcukMOKsn3boq2wtfOrxVDePOsKmbOfqp3sxoE1tu8kpbJtY6Gr0?=
 =?us-ascii?Q?J70yWcpb4xeoaG4iS59a0eBRHatRfL+2xUI5HqGWEJKa3hnFogKEsXJhhDEk?=
 =?us-ascii?Q?Tr7Qm9ZzEstJW6OB4o1+BtbyDXvDf3OuxljlwyB6SE+MSWSO41jB4cuHlmUf?=
 =?us-ascii?Q?sT250XjUGtsiF0E7nXvyJYZsxCt2IrL+uOoeRXnMZfAfCpKdlNiDOMqwy4PL?=
 =?us-ascii?Q?M0RHd6oHGPvstLJr1/Gd12Y55f7iW1FJ2B05gw6sq9jLZ+B+4kiDZsTuCSTv?=
 =?us-ascii?Q?l6lrVMGlhnPFdem//5O4N4QHBNAeJtggyMuFXTlCFQzN0zH9TCF//t9zQ5VE?=
 =?us-ascii?Q?OG/YKauZM+r/05KKqDyKspbIgy9kKVDaQGh0Pahf8plqPiIktM4X50y3/c+M?=
 =?us-ascii?Q?m6bqkru4wBOf/Gga7jz4XIafA9VqbTsNfOs07tgXC+68C0mIdVmnKzazxckl?=
 =?us-ascii?Q?vdnRm+U92bEZlZ3Ab6eQSUp/lfITJfCypG2dWxQfUoJ8wCkiXwvr9mGbBatt?=
 =?us-ascii?Q?vEOXiehP6NSha0nxU2NdnNmrzoRJ4uQd3S6IBAvqQ0Ys428i44p6eFOv68MU?=
 =?us-ascii?Q?WRJeEmapZay26hZApAYI1qbo1v2h54CyipUtZsFFVAMv0zzJhPcWkGpdcTDq?=
 =?us-ascii?Q?WmvVJlyoXyIOGA8TpOMSC9WBfUlQw57u7rIz6CgUMiuD+6y1kxLwkLP+yK4i?=
 =?us-ascii?Q?zz9UnVAABVwTGnAPSYm6zYOv+UPKRwm5B683wd99/3ZD6+i2uw10My8aotPP?=
 =?us-ascii?Q?Dbd4gk9XAWoDlyzG3hNQV+nKvjgRYmtkiz3RNHWPMl/80ivtiU/7vK8YGnG5?=
 =?us-ascii?Q?Sd3eht3AQ7Q6yxPaA7AfNo7weYauluwf/ZZTuN/HL0GHRhsA4T+xA7dfIj+E?=
 =?us-ascii?Q?3PWuJUfNcKSt+ZN8n4CVcHwl3h5T8t/lIgZ/+1WR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4cc9ea-99b5-4097-6abd-08dcac1213ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 18:54:42.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3u9njnFrK0VJE3v48uF0U5cVY2h7lUsHaHwKZRMQNFifiDJMfRbk8RNxPe5UzMuawI4V/2FtU8detatW0CQNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9465

On Wed, Jul 24, 2024 at 11:21:27AM -0700, Dmitry Torokhov wrote:
> Hi Frank,
> 
> On Fri, Jul 19, 2024 at 11:22:58AM -0400, Frank Li wrote:
> > From: Abel Vesa <abel.vesa@nxp.com>
> > 
> > Enable default wakeup according to dts property 'wakeup-source'.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > Reviewed-by: Nitin Garg <nitin.garg@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change from v1 to v2
> > - change int to bool
> > - move of_property_read_bool() just before device_init_wakeup()
> > - drop !!
> > ---
> >  drivers/input/keyboard/imx_sc_key.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> > index d18839f1f4f60..fc1492088b645 100644
> > --- a/drivers/input/keyboard/imx_sc_key.c
> > +++ b/drivers/input/keyboard/imx_sc_key.c
> > @@ -110,8 +110,10 @@ static void imx_sc_key_action(void *data)
> >  
> >  static int imx_sc_key_probe(struct platform_device *pdev)
> >  {
> > +	struct device_node *np = pdev->dev.of_node;
> >  	struct imx_key_drv_data *priv;
> >  	struct input_dev *input;
> > +	bool wakeup;
> >  	int error;
> >  
> >  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > @@ -151,6 +153,9 @@ static int imx_sc_key_probe(struct platform_device *pdev)
> >  	priv->input = input;
> >  	platform_set_drvdata(pdev, priv);
> >  
> > +	wakeup = of_property_read_bool(np, "wakeup-source");
> 
> The driver uses generic device properties, why do you use OF-specific
> variant here?

I think it just show default if it is wakeup source.

Do you think we just need call device_init_wakeup(&pdev->dev, wakeup) to
maintance consisent between software wakeup enable status with SCU wakeup
enable status?

Since most case power-key should be wakeup source.

> 
> > +	device_init_wakeup(&pdev->dev, wakeup);
> > +
> 
> How does this actually work? Doesn't the call directly below
> unconditionally configures button as a wakeup source?

Good capture, I am also strange why it can wakeup even dts have not set
wakeup-source.

Frank

> 
> >  	error = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
> >  					 true);
> >  	if (error) {
> 
> Thanks.
> 
> -- 
> Dmitry

