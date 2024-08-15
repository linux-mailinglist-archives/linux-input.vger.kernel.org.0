Return-Path: <linux-input+bounces-5592-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5978953A8B
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 21:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00AF0B21726
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 19:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E5478C8B;
	Thu, 15 Aug 2024 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S3PnGUCb"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013008.outbound.protection.outlook.com [52.101.67.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C49558BC;
	Thu, 15 Aug 2024 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723748812; cv=fail; b=CSuMOVHxBHhgvtSFCq+0eD0IGbNdt9EKtlO3DkZyqigFAVOtIwIaJNPWtETU4dRm1Vgmr/VnF8nIudxJIMvQy5/XoGS879yiRzC2P/H8wKLaTdfNIhbzQcTpG4cTK/myLh9yLd/v+c1RO19ltKc3/Rmq6PidO8Q862TYezjbESE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723748812; c=relaxed/simple;
	bh=D+ByhBNjhl1jZ8aNE3EskHX2pY5rAMzfSyBD1Dco0/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n9+3xTcSAo69kvon0zhO2tCaBlQvQy9r7aDAk0SitW6wrrbNsKdZMAEPFqm1p3MKu83Up9h17bneP18UTOv6Rm94X9cE+eQ6035vYaGscH43bpq0HghcUjaBPw6U4fHEGUiLaDsP2GEbyT8OybPw6FSYvY1eBS8VVLSQnWHKQos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S3PnGUCb; arc=fail smtp.client-ip=52.101.67.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sy6erjdAj3VE0A0x+LvKpyP0ZIK3KorqZ6lw86Hexcw0WbgmHty9S7wmMcIYhEU3Gc6QQVT+vnshP6F/yuS1G6GnnM5gsagEfNnO9rutYpQzRNllAQ4DiqWtHgp4AXkhyBV86aD98QMD8Y5UGAK3S07NCWCUB1lLlAE3uxQhDbOgWuWf9L9sQMT5RYDRBw7xI0CZN12zdoz+dVMhfCFJehyz6IQrjD1GPWlTyAE0gk+XvlrGWOb+U1X7DATfqD9/pcaL/IARUvw3cDoAu5uN/KJ1C9q8UrwyOQXes184KNhmO/CZxIAZd1py4xqM19F+F2jxQx3deh/snBmCvzw59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEwvBUOraKdgWUKUFkr3dNJJ3N5DN2ilk3ZDU4nqwQQ=;
 b=L8Kj9Dv/2KYVsTrmXgpH32qZARQhlswcqrLJe0s9imNhozuxT6uWqx3UWuM2gJpq/fYgpjO+TIJB7DJf0W/+9+1l3Cj46jeMSZDNQLZZcrDwhdMECmyga2JWhxYZvDrKHp12Agp9nDJCvNletynWCIwwFFw9x+xOJrklWx5IHmuO0FjHWqt2AN1ZOHrvZjbdwr4QO14yuq7HV0ue4zip5LYWO0KgmTqhCxq+X8QYFNxVgJu2cQBeqSaI4gcDUkeoJZd1VJb+xHyjztYnvUIh8+ZfVz3/XFGTcEW/gq52gTCG4VZsefuLhh9Civt3NQuUJaQCuatysOnTKgXMAUGalw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEwvBUOraKdgWUKUFkr3dNJJ3N5DN2ilk3ZDU4nqwQQ=;
 b=S3PnGUCbLxI3DjWNIt+B3X1w5zVnIol8blK28aqeJKd3M3DEvgyu9aDBc32QrQtuP3YlGA3gc8+otRNNOMzroqbOv+7W0YgjNwLUPLjHxxqJfO4bSs/NRyoJdkh+cyrr+oVhESkqcjaa5h6Fh8OgnejOPQaPsqjtIkwYS581dhrMOBGZ0/Xray4N6EqHy1TlOk9ENw+R2dyKmiJ0mWfJ/taLw9e3za5PqJ6JBod9iBxG749bny2WCnik292320ipGFLB7GH5ZlOi+3BakaefKITE3c35O3oAITAhFpmIKgU5M/VJWYQNKmIrfqGXsHfsWQ6+qAU4dUUkd3JsnU3MlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8966.eurprd04.prod.outlook.com (2603:10a6:10:2e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 19:06:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 19:06:47 +0000
Date: Thu, 15 Aug 2024 15:06:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 ads7846.txt to yaml
Message-ID: <Zr5RwL5qRVBKbHcc@lizhi-Precision-Tower-5810>
References: <20240815161413.4182796-1-Frank.Li@nxp.com>
 <5864cdcf-a1f2-45a6-a034-a05315402663@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5864cdcf-a1f2-45a6-a034-a05315402663@denx.de>
X-ClientProxiedBy: BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: c80a1e9e-0406-45b7-56e1-08dcbd5d696d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7rVbBs2BAec0+pVpLyQWn1HajA31bui6ruYQuhSvELf5VZT2rytYMUlLhSSB?=
 =?us-ascii?Q?2TilEwH38kvNUodLDzFojy2LN56gqzsuHBG2FQLMEnP0vNUa/uHTD9LjmGbq?=
 =?us-ascii?Q?tRBeduIGN8Slfzgi99kkUvRL60Q2TMaoeR7DgQHXQ19Sj7QpfouiAY6di4HA?=
 =?us-ascii?Q?aFJFp5hzBavD+IjXY94EOacO48SRvSeotp8H01vHkUJ8V5b2968ILbp3TsAk?=
 =?us-ascii?Q?X3kymXTJ6GlDswlzHjXxKhJKdm8YKj+0hUjbwrkLFo4gc5WYO/Jcw8o02RxD?=
 =?us-ascii?Q?l+16MAL411mAJ6yOa0Mf09MGrLQvG0FQoKmSC3HHf+hHSguRyZ71yaJ0XeIi?=
 =?us-ascii?Q?LGJECZ69/QFGNDf/ZtzHdryPdvJC5VcSOzE0oSVEsAADr6BibhRX84Xx/zXt?=
 =?us-ascii?Q?AJLJWOBPhIPxkiQOCPrav49A/9JQVs01S/mOSg8IJooop4iO/OkTccWArs09?=
 =?us-ascii?Q?lfsCH/eTZGzkYy51YHEyv628l8CXc2L6BfgsFnPX/WOcm/WVO2Q+TUqQV4qC?=
 =?us-ascii?Q?HU5pemFwkAFGxYm7IAM4v1ALqTJKmBTBMSWQC978yEmVktFx9R9k/WsFZQ60?=
 =?us-ascii?Q?W189+I2uBm+vLbicimxGXeSzpwq91HCde5OSbgXBZ00nX/4R7XfnjIszSJaK?=
 =?us-ascii?Q?DzqzOpuvolSGEq7vKnhWsjb8UicGZbLqs/Ew7nz3OEN5nRHIUoaYJqhm3Jxu?=
 =?us-ascii?Q?2htGsRdfD38GOrGnfmtLQHyRTlGq0YiJk3XBgC366Jvntlhe4k02sDhU4dDo?=
 =?us-ascii?Q?tDWTkDdPedoITFUyvJb5dFSB95spX8i0G/SjowuZTqmQy23Z+0mC5r5Lhx6I?=
 =?us-ascii?Q?bfE9sLkSdGKdqrDl2R9MrxkHBW7F7az48FoyweILvcM9quTK5bRqQbcgedlA?=
 =?us-ascii?Q?8RBGOU1zYExQCSApy/q1lxmBIS8JqcXc4AWKJh+yi0gU6gulahlmtqFUF6ls?=
 =?us-ascii?Q?8tZdB7R3IPvhaJxZeeADvt2Z9rXuTvEkRZIaYyQPMHGtqboql1YUoeNsrKvQ?=
 =?us-ascii?Q?k4pCz5aEqIC/oW73ALUSXLPjXD+fXbqM93maB2bhddE8kzzuR1XzTIB1rl+G?=
 =?us-ascii?Q?YY+Kky0+ZRksQhTYWy2SQW/vh92+2hPWEeTNuQgq4YyxR1QTwUAnzYiHSAQk?=
 =?us-ascii?Q?Aorm1MMYqCGyPzWmqEqRXqbTh5MRSsXhD84kW1G/G6nTha9Mr7Cd3+l/EKjn?=
 =?us-ascii?Q?53iA9Z2wOrSRPOF53Cruxo12lLQvW8YzLtSQBuvQCdUB6b0nBfmBMYy5ExLn?=
 =?us-ascii?Q?ZgPntMh8HmLqvuBYjB+y2S1svI8bI3tSfdTrrv005EI1CWmOeNw9a6bNb9oW?=
 =?us-ascii?Q?BpchBcgFBtfOHOEbLcRc2/9KOTPVpkLbL1prhF1vsZwZ3gRgPSV4SnNQhi1h?=
 =?us-ascii?Q?mTMlDx2bfcXNozWBqBrDxLpiJZEW+F6TDjTbfVusOULl0hDVtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7JiqxHiDzdk8Ds+NIjtbTYANIRzrEkG1f/DHC7uB+pvB6hCtttj6AUgDa1pY?=
 =?us-ascii?Q?vRJ9jVC+L79s+s6ow3RxS4AP/3XLR4UhdHP4qy/NTg8FBrELSaIOiSPkccWs?=
 =?us-ascii?Q?yc2AgibBXgK12aXXeHVoGVYXwbLbeeqMcuO8kA5NXvYWgsruaQ8l+uRsX+08?=
 =?us-ascii?Q?908NGcBNB1RL5p0vdwQ0Fm3q7WaV5Rui5+PQRS8V33WEP6NbONQKAO4NOqmJ?=
 =?us-ascii?Q?kVNmIzjwutKchQsVX+2a7Cd5FHidC4q0pA41guaOYHXT+MJGsTY3HWxyg9iL?=
 =?us-ascii?Q?bOP6Z76Y6AEoy0uMvIyqhW0OjgovvIyLgAW1CdYADnRR/UlZkYHakYqF/I94?=
 =?us-ascii?Q?s6zdmgDav4kckATtVkcZFnRJni/N1q/g6za/9a3GkIGa9yQCgEXoXDWtvgmC?=
 =?us-ascii?Q?McrV4O6Qbmd3IkcruAlJp6SSi344KxAgDiDfTNC6v/URAI/LlNDqL/PK/Det?=
 =?us-ascii?Q?9hI29O9fXByDRNUh7kvTd6f2h/7X5jccpqURK9hKxU3nFMAqWeZAaS+10F2Y?=
 =?us-ascii?Q?4ln8WSoBQTF5Ql5UPgG6MBjNGk77SlgBGEmHKIn+iV9b7puTxvBGc2k4rTH5?=
 =?us-ascii?Q?NSZlKbISM0yCpGZ2GngHfhQiVOKflzR9I0B2sSxYeL5sMZqHukYZraRVTljF?=
 =?us-ascii?Q?nzXskVG3VIb3ft+yNXCDEGExhdBv8arBF69c8g+FpfNqLTDBj23WeThcl6Ej?=
 =?us-ascii?Q?9cwwOx/095GU7m93P5V5yd+Imw3s/gB+d7E4zdO6W29S4cUfuD8rHGKqUwIJ?=
 =?us-ascii?Q?LEPuuVinjU71KqCJ1bziz7UvxW59CX5FoYRh9FjPQMOh4CMLc9WMsBRMaBOG?=
 =?us-ascii?Q?XNp0kMjUoEpr3QN4WtLTf8KCptY6wMyJwy7AfR1LVyRsm5Ucl+5Sx/nBqYey?=
 =?us-ascii?Q?k+/Rsp5nr7b2TmVS3PQnIt0hEehrnLB+hbglvxDvGFEITM4dj6lRjPdJK0t3?=
 =?us-ascii?Q?Gr83vD+xKUY5MhvNbaWMugZK79MIKIAn9aDqu3Oy5rALxcYubaITDK94WkcG?=
 =?us-ascii?Q?zy8V/F4AMEkK82kbdlF9gnO7MjtM+uSuhFW8R6VWjIm4SdIAV42eYrGSs/od?=
 =?us-ascii?Q?OkSemK1xYsv4JlaPUpNY6ySiu3l9lzACjZCnP8Bm+p51qeDU3citrZTNUdye?=
 =?us-ascii?Q?l28mtG3OPmtGzuKvfVWZiw4lJPRWFW3Np/Dwxx0rd93+R936hLK494Y8dRqH?=
 =?us-ascii?Q?hLI30kxya6ZK62dldz1du7BdAnEm8yF7/CnbiWHJyEMnuigewQXIJDkN4BNU?=
 =?us-ascii?Q?GpUsp15agUmtqSaaMCn1z0D2jIyFJ3vutdwHdA2GXaOxIyEXHFDgQ+K2QTH7?=
 =?us-ascii?Q?JfGttBEMTIXQX2WSjXyexxgVNZjCjiYv8j5Ntzzbf3W+L9tIT9D3hnhDyN7R?=
 =?us-ascii?Q?ezj81VEJp8rxKNXW/SMpwDP1EBOOy69NTHzj+JA9LBKxxoNblFft+lfwEfgd?=
 =?us-ascii?Q?kLn1XbHZh5rKwEYJCFch4MXuv8Njwfy0wxclZR+PQzDCk7xTDw6co9yf4t4S?=
 =?us-ascii?Q?D5zD34EmoqhUCQaHCn37JZhAJzEYDQg7M59yQ9p+kQ23E+Uxu9G/NZb445eO?=
 =?us-ascii?Q?B4LO7wyD59kEsA1n67gqThJySCmtRgEkJiGf+NYj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80a1e9e-0406-45b7-56e1-08dcbd5d696d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 19:06:47.8851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OVl5zib3Je45M4BQKXfZptd7WqgOreSjvoz9B5K8SmjRhv77xmpouzswYoKxitsQUWgX6v0tKUXvf1K5xC+QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8966

On Thu, Aug 15, 2024 at 08:44:56PM +0200, Marek Vasut wrote:
> On 8/15/24 6:14 PM, Frank Li wrote:
>
> [...]
>
> > +  ti,debounce-max:
> > +    deprecated: true
> > +    $ref: /schemas/types.yaml#/definitions/uint16
> > +    description: Max number of additional readings per sample (u16).
>
> Could you drop the (u16) which is already part of the $ref'd type ?

Sorry, I forget it.

>
> [...]
>
> > +  ti,x-max:
> > +    deprecated: true
> > +    $ref: /schemas/types.yaml#/definitions/uint16
> > +    description: Maximum value on the X axis (u16).
> > +
> > +  ti,x-min:
>
> Is this deprecated too, the same way as x-max above is deprecated ?

I am not sure. I guest x-min and y-min is still useful becasue it may
indicate invalidated touch. but x-max and y-max should not usefull because
max value should be Vcc.  x-min and y-min help filter out some noise.

Frank

>
> > +    $ref: /schemas/types.yaml#/definitions/uint16
> > +    description: Minimum value on the X axis (u16).
>
> [...]

