Return-Path: <linux-input+bounces-14591-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1AB51BA1
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 17:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51641465413
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 15:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A67327A18;
	Wed, 10 Sep 2025 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EISnQ1UR"
X-Original-To: linux-input@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA0327A06;
	Wed, 10 Sep 2025 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757518172; cv=fail; b=A8znhvHiL8SDkH9yrT0eneeug5X9LOu+WVRGCEQOrAFetk4dr7eWo88khdGymErhHbW/2Oaqmon77YHFyxOQqlScdFk2DcePhIOzAfG3qnXraMvrsURQH0CrCspuukjr4EiCVroveJ7+PjGbXcxWLP9wljqEyTNrOM1HctnU9Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757518172; c=relaxed/simple;
	bh=xsW1rJuxqiO+gRvXsATzEMxO+NbxqV6WnF3kPHNPTBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JMWIX6tQkJjwklCbPkiXRGq7wFgOHGK3PkeKt9Eu1H+PX4wQPpHoqcre5iq5vBchfDc5WMcsEFgCMydzh/uJVmQH4rBI1Y4Oyly5bU1axWrCyj53RqvmWcrjwSk+I6cMdMD0khJo8k+PAnmt5gaL4NoWtr60BcBMcGj82S+ZKzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EISnQ1UR; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKQVMItelYC2pBGv64WVoxetL1gq4v3qcEe6RVoxtFnMnPi8wZpuc7s0IQlZ1KtKQm7aaZvevpZn9mj8y6fYvOOjkrCw8ctXvxYRCZU1vLfgS+GBuMzj14wP50PMfEA7IFeuCD9JsYZFyguT0S3VEGuozEdtiI+Vzdsq/QMcuQ9FoTyiRezpfBNtEgsGJdJfeddjTBqaa8jjHuj3gTG+JRtSPY+pDqe880l8xAIubbBGfZ3DfPHP7e7blql14c6pM5pRVCMPNPNKFk46W5xQFzoUsyLXMOPFAFVvAy3WW53Ckynl4XMkt8ZsoeWZMHE94XjkFPMcdKYU79uL+hPCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NR4bv5u32Hhih2OjUtTyUqRqBOwpye/y6hOpbF/4JgU=;
 b=D4iehtJYF3POqbloa3z/R80mJWNURVl7oIvbIVrIHvDmU9fHg61IOl/DJ9cFmhUSRfmIjuRrTYWd5R/eVYyaswMUo/6HRnVXnJm+bil2t7y/cy64OTisG5mRlGjZAlQBdGZbo8Z+nrOALpzgTG8/UGuaUMRjvRm+/kGjn0VFWumEpWG3DIUHH4m42q7PWDHt9bBUyVgbKgM5SHg2KW/btZS9qLI06t97K+oUzpJETrQan9k03heNqnudQ4LDHoU9bCOh8FP6YyxHUjWhzUnCypPv+vTzEGMXihPbwJVekeVK5pgqyAQNAnfkG01oXfmbjyeji/vtcO7ZoWwo3CXDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NR4bv5u32Hhih2OjUtTyUqRqBOwpye/y6hOpbF/4JgU=;
 b=EISnQ1URsIz4v0jsXI4XUXvFkH/vvUu81WxY2fJtj9YMJR1Qy3igU1Kg5hRYl9tq7HlmaP+6d8jcoCUozbdPCdUY3D1wYbfN55zBS1D8JBK7o62T1J62Js14vsHdEURLd60PSb5TBwoc0ZCWAgAgQp0dd33152dqv68eA2aIHqVSRO9pbw4AfJLqh9aTeR9ZBtwIANzaCh0xrmisJto+O6MBbYEVSOTRG/klrJxp+GA2olfz0OknpH0Tzf40hDZY+tBR1Dg4UUX/aTp6CPTZOKVUj2+d/wOLs6sQfMFElpm490vS5mL68wezdOag0rAuvlLXJ5GHYzBGHF4A4SWLog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9443.eurprd04.prod.outlook.com (2603:10a6:10:35b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 15:29:26 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 15:29:26 +0000
Date: Wed, 10 Sep 2025 11:29:16 -0400
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
Subject: Re: [RESEND PATCH 2/4] dt-bindings: input: touchscreen:
 fsl,imx6ul-tsc: add fsl,glitch-threshold
Message-ID: <aMGZTPMCF0B53Wty@lizhi-Precision-Tower-5810>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
 <20250910135916.3939502-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910135916.3939502-3-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BYAPR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0b102f-ca05-4eb2-9270-08ddf07ed373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fk4mG3tYF30oie68wQTm47KnrN4P5a7wasfgmtNbfpUXrSFieL/U3yfbb0N7?=
 =?us-ascii?Q?SZoEUlDZuvcL4R0HbBcteEgwP6h/Su88ecThcLs+bnY3n9Pw/SQYgMIqg0I5?=
 =?us-ascii?Q?k+9R7B7kT9xHEpreURGYCetbMBS4mTjOqNmjRqAxVHm2PsnFCWPvuA5xAvje?=
 =?us-ascii?Q?sndZViUfK71TJgBx0BLe7g2UG5Q/6iVsHlwDt+3VDhnF/4hQQvoeHaC7NtLS?=
 =?us-ascii?Q?09g63tgbeSlp9tRCR3GiroT+l2CNYtRajihv6lJDLALr2LI0CTAg93U4+P9K?=
 =?us-ascii?Q?VDdmQafjHFF+5IE2sqC7ZaQkslwQGVZRYsyTsouLLW+n0pTv7hZwZ7j6cBMF?=
 =?us-ascii?Q?iEi1t+7BMZFhzjdUzpVXAGBMgwL576H+Br5RNVc+CDYzckLSucLjzkOjG5wW?=
 =?us-ascii?Q?C0YFkIex1X1lRI/2bpIUUnLYyGmxzsFAZxfZ6gFguwNkwSH8TzHR3usiv9lJ?=
 =?us-ascii?Q?ugfSJEnN8JVzqTWnFA4eA6WbX02HHkFyFM5KpEmPwtpM5nnURq/9Ee956s3x?=
 =?us-ascii?Q?PEofnb0/arllObTcDLy7jWzN1V9tQAMhiqLSIDouLOjv9UwvSim5xiUp6oWH?=
 =?us-ascii?Q?lf0VQRGpxmx+2EQT345RdV0MNab2UTEWfZ9sQUNmMZ4TkNYr+OFcMOMvwCJb?=
 =?us-ascii?Q?MGd3okZBABP4aHUEG0nX8CV6yDwrKSw9FmsMxAdJG2zk54XxijQ65mIPmL/9?=
 =?us-ascii?Q?BlXoxmOBfB7dB335QsG4XtfXgTrFFYXgylcAeQ92HwHwc/gUI2vlTqC1b+lF?=
 =?us-ascii?Q?hRg0CoS1yCbXlhxeZRF+UKJ9FMlUxRIYo27O5j+nDqUiNMLa1WMypTjjq/WI?=
 =?us-ascii?Q?U5OrFSl0WglsX3q3DPptici+YeOA2cfaJEomOBEyBOWte5AHeMo+3FaCr3qi?=
 =?us-ascii?Q?wigq/bcCNM+6uLMfMhs3RGZBEvDO7/AmtIvfWAvkWfkwFpyYbheIZmxSM/LR?=
 =?us-ascii?Q?zkNRro6NCRA8nXTF6F2DUlDKnr6WqQsIKMEoLlVQuSMJ6vClfgGeiQD1nVC5?=
 =?us-ascii?Q?f67Cp8iMmLCC8jbCvJc1pBnb4d4ssq8W9JV2MyRGDPxtYddh32nPRrta1DYw?=
 =?us-ascii?Q?nAHirk7ryxbdDP0ptb0AJ1M0X+M1OP3zzk72nWf8x+C590gcIzAOz7jYW0L/?=
 =?us-ascii?Q?8M2oU/pzpw5HvFdZxkXy8ASIbWNs31YA3iI3W6vceJg5uhtKdSdv7pOzqCY+?=
 =?us-ascii?Q?GSol26RfV723R1XMzSmKBpiVnQ+UtCfvoi7hnBlJJZj0S1kyOl5vRmjlafza?=
 =?us-ascii?Q?hO0tRsTQ+F840iXFeO3LYnhLJqNODa2noKSd2c4IlcuHiWXVye6ZKrj0yBaV?=
 =?us-ascii?Q?c61/yMQ2kG/f/U1qZDFUc5KfIvQlz5vyhIjQX2XxDeGmWlaq7D2JCxDCdeTY?=
 =?us-ascii?Q?Qp+frIPCXj4xu1/ag+bFRsN9RRm0QceZzVKvAtV8bTEgI7naGzrfTkeAvuba?=
 =?us-ascii?Q?i1Opj7OKJS9mtkN77CoVKrHBir9sXVHf4y5EEZE59cDaoLAhjegEdVqzAO2n?=
 =?us-ascii?Q?P4mSJU4HPRYTXgE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v9avGsIAPW5E00EWZLr75JEVBj4E26FmwNEnBu0iWnl5r1ckcLPFzjtgurbU?=
 =?us-ascii?Q?sZ+T2kE2yOecgmqBg/zP9ZVdQ8NBtexCLx3lux07zoNCjMCajiavRwKs1PsH?=
 =?us-ascii?Q?NLrmQ5DHl5y8ZGSb+fEzTDDWn3C5t3T49HuAQNOhGFbmpZ2bYIjpCghCoIFa?=
 =?us-ascii?Q?wFBsOyNgqIg5pV3Y/bEiCdtyySCFdZH8IgWDl9c8y5tbzz0Wvy//xgsloUAa?=
 =?us-ascii?Q?fmV5jV8yZizsmq4I2mDC/c7WeM1Pg2NsWWn+AG62jU3x52N0Xacg3uEqbBu6?=
 =?us-ascii?Q?MoFuL+hltpAGvG8F9FksLTOgikQmIr8WORa8vpXV69Pf4Fw9Ha1HxbvoGwRl?=
 =?us-ascii?Q?uFYfmSpZgbCbtTOiTEvM5Xu7lysje6xQxa2EKYYj1GhUisHq6MDBXREjmdWH?=
 =?us-ascii?Q?D+BFM13e1mEzQdcKGs9iimTYHY5Mi08b5yjW2gh3ZfqAn7VTN8ZZ06IvRSem?=
 =?us-ascii?Q?GWgGG5rlWd+AsipO0LbFMM7IL3AJGsoeHt7+K6WvsjRAM0QUqxyvizeCvYcu?=
 =?us-ascii?Q?Jbs5nCb8jABqeGFWKcCrrulpb/GKrU6kQnP9P4OWkEPbsafqY7ZCm0C1oaTV?=
 =?us-ascii?Q?oYe6bn+I9g1hwvUEJlIuuMM24Jcmha8Ec3Jb2NgnHhyzYArB5/qfU9V0jZJy?=
 =?us-ascii?Q?zUEXJIiF3N96O0bOYRK3hHdw1V/wYs61qSGAKxt9mx+ADTNGcWJO3DhxVzYq?=
 =?us-ascii?Q?M6Ya/bZvsP7NuX3uAY0FCDAaNgUCQwMiq2l9jbCyBDHTcOZkaK9HvypmkoMR?=
 =?us-ascii?Q?ybxXHLzqxnWZknpYnv6tKVayg61YuMTxUjt8gWmOsPJqg2UpcEbL4qRB7V6q?=
 =?us-ascii?Q?qNoafiDpV5Dj5K+LzVkeF5gk/sqadR5UfzyGGRUJ97elKooU6WPdcKmoW68N?=
 =?us-ascii?Q?ZOvRF6osEs4Mq5GZIQfmw3YSoybYG+YZmSn+uvw3IWtud/NxEBP6Vu9EiubE?=
 =?us-ascii?Q?i1broGTQi4nu9i5uBndG/bma3JU/K7MEvR+IUseEw/sCrV0zu9lyhkqJg9H2?=
 =?us-ascii?Q?ya9z8w8ltLoTMoG8NJZC1Gxa+Nb+zno+EZGx30b1HpWtL50cLEbr7nhfeqdG?=
 =?us-ascii?Q?uaC8MBs5EqedW0uTxn/qilPJR1HODid52Nmt2s0JMK3d6k8woBZuLTljYfqo?=
 =?us-ascii?Q?pnWC1M+T71CDBgYyvoTTuWp7wMY1mDuw/Ss6n7+bk9GpHL0DgvY22bVKGbqv?=
 =?us-ascii?Q?lLT4W7xG9Hf0Og3J7ZViZ1Z1F2ipiSMWLCVb3CTc40ZqDFWtLHow1xE5PWNL?=
 =?us-ascii?Q?i2jTOyCX6JZPZ5ukXFenGrWoybcdA+Sxoz+PQkGNavAJ4h2sPzHHKHleEae1?=
 =?us-ascii?Q?ctxnKb4DDhuzZiklHIgIwy6Cz87ricIfcL+6QhsVhnHpKiM5mkqjaSnk/Mcd?=
 =?us-ascii?Q?JOE6NOpOGM6vtPA7ARjsO4Bhw547375nzeCvQhyN5JJLWFmM2YkxGrlPx8df?=
 =?us-ascii?Q?ok6uT+Xuia08RCTGF6IgA+6COZJ+sgXawVP4w/K1YQ4b7INpJF84xU3HS24f?=
 =?us-ascii?Q?JjplkmGgX/w6tFPyaR37aAPOCGhywr6YBm7NN+r0Y0nL5dRh2Em38Zuh2a1C?=
 =?us-ascii?Q?XTSaTmVgm5N1AcY20ri6Mfbs7vmLkMZi+65eT58e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0b102f-ca05-4eb2-9270-08ddf07ed373
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:29:26.2502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmyLZNmKeRisGhkMvIjbIHsfqhc5ZO7R+qpC3NOdVMK1kzTeko6gmRpWiUZT0K7RMqsF1S3Gp3eJScqONVhetg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9443

On Wed, Sep 10, 2025 at 03:58:36PM +0200, Dario Binacchi wrote:
> Add support for glitch threshold configuration. A detected signal is valid
> only if it lasts longer than the set threshold; otherwise, it is regarded
> as a glitch.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> index 678756ad0f92..2fee2940213f 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> @@ -62,6 +62,23 @@ properties:
>      description: Number of data samples which are averaged for each read.
>      enum: [ 1, 4, 8, 16, 32 ]
>
> +  fsl,glitch-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +    enum: [ 0, 1, 2, 3 ]
> +    description: |
> +      Indicates the glitch threshold. The threshold is defined by number
> +      of clock cycles. A detect signal is only valid if it is exist longer
> +      than threshold; otherwise, it is regarded as a glitch.
> +      0: Normal function: 8191 clock cycles
> +         Low power mode: 9 clock cycles
> +      1: Normal function: 4095 clock cycles
> +         Low power mode: 7 clock cycles
> +      2: Normal function: 2047 clock cycles
> +         Low power mode: 5 clock cycles
> +      3: Normal function: 1023 clock cycles
> +         Low power mode: 3 clock cycles
> +

does any property in input/touchscreen/touchscreen.yaml use as it?

Suppose all touch screen have similar property to filiter out glitch.

Frank

>  required:
>    - compatible
>    - reg
> @@ -94,4 +111,5 @@ examples:
>          measure-delay-time = <0xfff>;
>          pre-charge-time = <0xffff>;
>          touchscreen-average-samples = <32>;
> +        fsl,glitch-threshold = <2>;
>      };
> --
> 2.43.0
>

