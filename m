Return-Path: <linux-input+bounces-6179-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E34E96BFBD
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 16:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0822C1F21FB8
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 14:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622961DA311;
	Wed,  4 Sep 2024 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fAjdl6I6"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA8441D;
	Wed,  4 Sep 2024 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725459054; cv=fail; b=u4xGNUzvKCg4K3jxBg69gpy/13XubiOVzi1WIMAfOFCed1Z+4yNjiJseEQivzrnSwMzx+v4CWKcumhfdSkicm+Q1xZqF1+sSNyFvTepoQ6KcXnFFkzK44LKQ227wurtBxODcMdhvA+4E3gWIZ8G0ar3Gkw3XYpSHfSBsPJ8ygyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725459054; c=relaxed/simple;
	bh=VxtoZPMsjqbTCFTWbJZal6mGvJJRNxqxqObGV0v+288=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VIPTeHEXkB3kYmNH36pRP6MLO2Vz6x5S7TI26POvDC83e0CdtCddrAJpe8KA4YEK8hQJJc2hC8UO8E3oVTRbbqPsXP63KT4pflmEO9Mhx9a1UIqNU+2Mgjr5x/Gor1AhykSrCp4Gnx024tDLrLPrSAGTArJuRe+DFSzN4kQUkDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fAjdl6I6; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYN/bXfLaw6e2Bzru2gy5mxFrV3c4vDzuLwXI6DhhKf/G2AkcmidCaUl37IIyQr8pQwfux1rAXJAN1aJhkEQsv1NsMlNf4pTN7val1cV/2BumBolD3zE+7wUQpEcJOhZuyABUG60H2hAi1p2n4PyGzPP06a6/tEW9AHB1Ff1Bqb71517w5SpM5iYmGWXgiUZwvVRZRaK+xE3OFieVBidN3DU88Ok11VrvKFruIJEIOZ0QjWcgDXXqSmbqOgVDzc+vUQDhJRAvWRlqcww29Kh3hEIAYqvj0CUWBm0R0YAy+rirVbbgjxBUqPzIEGAwEYXSyAZn0CGem5+oVymqL0Uyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLp3WmCoe3AKLVfEUvQE5vp6bx26dVfV7RwsYfFvhXs=;
 b=yQzsIDZ8T2Sh82CO/SE9SK1GnwqrBWGIpqXBgpL/Bx5Fg29WhKEy8n7Fd5Xf6P8u1cn6IEmiT/jXL12Ux/M/BihoJG0/d0tB53E+POZ4Rx4XJyRn0h4WLXjrxbOvE91cCmOo6519YUeW5S/wI7MeeozUcIV17UVKMc1KHaAacQA3weAUQuCUb4BJSNb7FmvWxAe0KOHSUkvHHzDpukMJk24cC4nt6Uh8Xum2+9mW1LlwL3cQf131Rt3mq/jKyLU1iGj1bVpMZRrhaDJC1CW4pJ/0lROWi4xOPGk6U9o2NTsh2seCxSarL/wZc8wArVQWWRRcZXLIAgJZJQAIAKodog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLp3WmCoe3AKLVfEUvQE5vp6bx26dVfV7RwsYfFvhXs=;
 b=fAjdl6I6ewrMoJs9w+TlK3x6cHj8Wtsxn6NppA+yRsy+1ZXCuGF6kqlfraatVZfyP5YyIUGqVvgjDWXkYdkU4pcvVck7mDtV5qo6e7gCHOiphZR5hT8FXlbB55Hg4knlXSE/juEmrVyTv5oUz7imOvf6x7I6lbvkyxnHJYoR51xRyoOD9gvT1ni/2NL0LlAYCn1q8cTyqSHaviZyojZdKy5xK+jfBT0g/jUUTQZhwxNMUhFuzj06I3pbaiwFMg5gm6YAt+xZTVt/VdjMjKVKr/kE8LLpnSXlG7lSbZ+8yh1qVfYK21KPdn5ITqS7WcAzGN8D46i/7r39tK4v7IeAsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 14:10:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 14:10:49 +0000
Date: Wed, 4 Sep 2024 10:10:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	imx@lists.linux.dev, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: input: convert rotary-encoder to yaml
Message-ID: <ZthqYQlwegZ2ubp/@lizhi-Precision-Tower-5810>
References: <20240811214656.3773098-1-Frank.Li@nxp.com>
 <172358311160.2028662.8871129494345919782.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172358311160.2028662.8871129494345919782.robh@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9a5d15-bd51-4099-763a-08dccceb60b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mH/XqZckEJMWbHFrdqhcPiToE+Jyr58i+tbsazK1RdOnLvL4pFovp7VozY9a?=
 =?us-ascii?Q?7pMdiJ+WCPKLZ0ov09sfMmdkA9RZ0PxNDEU1qv+r0g3rNDM6uM+m4EBp2ds9?=
 =?us-ascii?Q?Uc2Wwvt3dcLu3VgiUuEEeeqvLRGOOJyFrTI6xtKe5yqB6xh2atLbY1LJzuin?=
 =?us-ascii?Q?FG3ERo8HqnVnVYEu+0o0UAZD6Vs6krak6Hxuh+htztbVjSMQYIO8W9REStBf?=
 =?us-ascii?Q?njJ/g2bDhDjcL8jDZpXbCAGLnmVtaSvTPBukp2TEf4byLDdtVYb7M4y+YO5w?=
 =?us-ascii?Q?BML+DsjIMqMXIsijb6OzceA+3shQ/8O+nKy2ZxjXSc+E2oTzwUmhvVjV+4Dy?=
 =?us-ascii?Q?e5T3htra2OVsX8HA/iLdH9bdrTOoXhdZla0SR9OjnuEg6oyiXxUuGAMVmgTx?=
 =?us-ascii?Q?xoLAYROR46dMc4d658mOv8kHEFO3Cedegh4MpBaS9TpmrVSWnxn94bL/ZAC2?=
 =?us-ascii?Q?T6M+dbDKlb83h2KeRhExagljxcXn22WjpIYyC9J59dVv98WuowS/PtAGmCiv?=
 =?us-ascii?Q?2sVTtGTJJr3F/+Fu65lEf5rv6BzxQs7dA/ydCw2tVerwMNmkrpHXDOfmk8zQ?=
 =?us-ascii?Q?79QgUpeB7rLae8goRQoqfLibM4IpeA4+rwo7w/iAQnDGZ30mtmYRk+50s9js?=
 =?us-ascii?Q?3s/bDHRaaj3dgbFf+12RSnp40iOr8zQ25MNjWhbSb4fXgL0ujzoic+3vC8ms?=
 =?us-ascii?Q?T6cNoMs6pMgDbnF7uWWfh8MswtTxKjw7aEN6OqSRsRgvBShFt4FxwZ0IW5cf?=
 =?us-ascii?Q?h07F1jphXku8CVHd/yTZwlmid8YM0O08gu/KHurFJunya9v41R1HGVS3Pqo8?=
 =?us-ascii?Q?Q5Zg+h5OBxyI8vqSvQiTMZDBIqzjyq6I8p+4yi2ngA9AV9xvl4jVBUjIIcMC?=
 =?us-ascii?Q?nEkDaEuo8T1SjcU7RDj9fu5RXbvHU5u3vWQ8OTDfq2WL3SbIbaW/lUL9GNk6?=
 =?us-ascii?Q?pcX08mW3s/OZTrQufCRKYiFgOcN784gJ22Lx8f3+TeU5H84U9SKc8GE1r0Ue?=
 =?us-ascii?Q?bRT/+0i+/yq6K18ltF7tHOT+beflE3LI0jVIle7A8F7h87Ts+HBpbfsf1hxX?=
 =?us-ascii?Q?+n3Bo0J5uVVtCHUiHkawmDdzfchRR0JJhDoRjNzwtfFZjz0XkkGRkthRS/e7?=
 =?us-ascii?Q?ycLNkidw3bexTa0x+7jWRjzMcJBj/XpZZL4iYJmCp3XiuZDnsOs1jXXUOyzI?=
 =?us-ascii?Q?rfGgi5RNCpkU2nCwkYo+NCc6YJ2iEodoC7DY7R4hDodw9pBQXzI3UW0NBQMZ?=
 =?us-ascii?Q?/QdCEx6hhJ6HGehbDD3W5jT74u02+Dmh15Y8Mjl73XSCzuc06/LfVldMspNN?=
 =?us-ascii?Q?1W9hke22IpCyahZ9z05nQMZn/qIpkMNRWMFeT/KC7wbMLfMidCIaGI08uY7L?=
 =?us-ascii?Q?SomhR62c67t1JZcGKdf7G2FH9jBNX9yrejEQrCvS4IV57ZaB2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wHZGntrXcQsBIf6IwI8pQ5reF2PejkYB5K3dItU25Vu6Ot+95ZzBWevXnOuE?=
 =?us-ascii?Q?bVZqxIQ9L7oXK2BW4K0bFlSdKLYNVXkNp+deX0Yf891//UtBJFen1tulA2Ac?=
 =?us-ascii?Q?QgJygbmaftbFLVffg9hDHEeFV80zFBjZdwQ6Wg/Gdb9T1MLdNqxqr2dqNgcU?=
 =?us-ascii?Q?1RfxsMJPzghL8uoUc+hXX3NY+a/TqCFX9EzTJoSl/kYyVcH7LPntR9Re5Pv1?=
 =?us-ascii?Q?ap6OMip+UDIWCJG+XybwD+GTGQ9AP8WaEBgE9vlazlFNZWRtJi7EOAW4Jihe?=
 =?us-ascii?Q?9TWb3FtDbKGJF1SlkVyeqa5vqu4/O5Vi91GNpRITXng/t8QQQtZ4Xg4JRGSA?=
 =?us-ascii?Q?fa1TLUfuIiumn8TvMidvbQTXXuo6t0mZcjz4JRUY+J1h+R7v8TsLJ8egf563?=
 =?us-ascii?Q?JZuiJ2TMxcAlJsRKMsNepbI6oEcNhD+zPgflRVgCOH6L6xqRvBRzHdfqExBb?=
 =?us-ascii?Q?nLClm5ZukmmmyBuaWO/VQql9z7xEd6zAxVKc+P7Vi8l9xY+I9tJCSERuTa1/?=
 =?us-ascii?Q?u8KmtGJ8XAJw/UHz1oh1SmSe1e11/2/8438gcpLaR1oi+lU6+TB6N+/c9Jjb?=
 =?us-ascii?Q?TdyOcB0gr7wf1GM3LgIzV8R0Y7q41o/MphGGQF/AW3wabmW6y009/9/UtBHM?=
 =?us-ascii?Q?ot7qIpIczzKw+DqQ1uxgh3L9hWlT/MhCaCxkwsQf0pmvhm5iFJS5ooMAcKyN?=
 =?us-ascii?Q?Ife8YpFEdeEL+LufyWMrFPlwqHmE9tfyJq6VQJRLPG14T5/sSwKGO8rZZga9?=
 =?us-ascii?Q?g4fOxnPbxIql1hWd4jawWSBs9nIzvK+7TlHUxqy9d3+Pr6sowUJRCVoasnWR?=
 =?us-ascii?Q?teoIYE3a8I8swexwnO5IrJOm4q2jnaf+7xTeSyMpp9iQNZD7NuezXaI8YivI?=
 =?us-ascii?Q?QiVfnc4TuH5HKXbAIDzA37QrSmO63HGTmX7YmAsL1JXnGtww2+VeNc6m6OTn?=
 =?us-ascii?Q?arjbabOWPjIn1eE2ElO0MhKaKgBfjcnNoqZ7KUZhHOIYRF8Oe9oJVXXsrZn5?=
 =?us-ascii?Q?IlEA3ADDcOMr5qtE085whf5eIZVbWliQEs3y7Tfg8QbOVPR6UHiM83bPvlaq?=
 =?us-ascii?Q?gTusKG0HTvuqtqnxezuJ6L1fpmJKOhaWcGgojxp4ooR+QRtFDkGiZDg1QeXo?=
 =?us-ascii?Q?A4/bLPWsuNZ+YGdcAPBPSnw92t7GC7dzCihquGlJ2Ic73WY1KI6rY0X6T4QL?=
 =?us-ascii?Q?5tbvjJ5TSXELd0JBdQF2rPu2S5bOCkfJX+kT6vUQPuBqUctJbksDau0hgc4p?=
 =?us-ascii?Q?lEXbakllC4XO3a2TrsfYzXvy+qo+V4ae7hDAfn0DBlZiVjHxFvOeMMKsvHWo?=
 =?us-ascii?Q?rhfeWyAhKOs++Mn5sygur4reNITI2Y9qzIrRzW9aRcO1zswVOZuSJH7VR2KF?=
 =?us-ascii?Q?zv3ONn1M8+MZGQNs3alXVXGHhRn6s7+H3qotzXEtge1CQcAMWwDwIPUrwwIi?=
 =?us-ascii?Q?CCUpHnb6GszfygbKEqN72c+vq1nu8w0oCteke/6Lgb7cdzDJSB5swalGFm54?=
 =?us-ascii?Q?JvYIakvpz45IL5KOk+GQX3XsigmQ5+fXogwEGVwEcN/x64Klz3CfBW8mpz4N?=
 =?us-ascii?Q?BxX74nMwXMolbP9Z0VF7Z37g8SDUrjiF5UkOigsC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9a5d15-bd51-4099-763a-08dccceb60b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 14:10:49.2927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K63myw8JpxsZoMJ/e39KzcPH07d254GTXmYq5ia0rLRHl5Rz80+SmGpJozHXUBK/T/KUwGkG/fP7Bnx3YVjzDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758

On Tue, Aug 13, 2024 at 03:05:12PM -0600, Rob Herring (Arm) wrote:
>
> On Sun, 11 Aug 2024 17:46:55 -0400, Frank Li wrote:
> > Convert binding doc rotary-encoder.txt to yaml format.
> >
> > Additional change:
> > - Only keep one example.
> >
> > Fix below warning:
> > arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: /rotary-encoder:
> >     failed to match any schema with compatible: ['rotary-encoder']
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/input/rotary-encoder.txt         | 50 -----------
> >  .../bindings/input/rotary-encoder.yaml        | 90 +++++++++++++++++++
> >  2 files changed, 90 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Dmitry:
	Could you take care this patch?

Frank

>

