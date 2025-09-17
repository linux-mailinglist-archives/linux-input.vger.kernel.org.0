Return-Path: <linux-input+bounces-14815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DFBB80EB5
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 18:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47BE662521C
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 16:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7332FB63A;
	Wed, 17 Sep 2025 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BXic+PsC"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE4D2FB627;
	Wed, 17 Sep 2025 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758125279; cv=fail; b=cSIdQtIyF4aQnb9x9S85uCvRu2VLorLnqY0ISptNQq4kGxHoiuQzOeThUKQmqYnDZK6+a2Dh0bffWqJ0pTiVoK/KLGusfnUyWEPmfCQSn9Gwet0Jyqox6JnUARb2dohhzRkMFLcjmZcvX+EC2bn7UPfmnEytE6V2jBNlBB9Pta8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758125279; c=relaxed/simple;
	bh=J0WktOSnA2eYiQ1hx9pJUG8Vf0f3mLwJJodW1WSQBOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ect02v6oAialaFl8l8sYP3F6fsq9OC4fBeB52hU5XzZ4C/RDZkggcK8IJw7TdRUwHO+LisPyfv4XAGm5RijliPsksXPcp9/n+sLlySKFYffKWy68pR2N2f0wm13mYZnfoBrx27d/nhHk8iulLpY2q4TfyqWPnzPzSEud5eg1uvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BXic+PsC; arc=fail smtp.client-ip=52.101.84.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRlOhDZ9/S7bOvDJissJYRLL23M5GW61sEvRvTXVxAtChV3mEXQzkR+4IWRS0Wq9hGHu/ETYfDniS04+JMNfks47CdAi/AxdCuDwDCQrJCTjLioyr6vjXbMSSlupRhLeCdf8SeL1vo7xpZSa9AqnAiLo6zfptHzlMZm5yWkOt68YbYQhTC1I2emYgCdkdM6YS8wNppA0yp56rkwQJNvivaSwAZDikbbWDs+4Y8Z7lkwnSBIeOJ4P9R8xb4rK8uJTiBCIskthZpKiRFnx3+IXymixIhLleslb2S3bpDwSjIMRzOo5C3vgoMDtYY69YtD1duxeVRWFi/wutSPbYW4U7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiCbRXJe7ma3fPrQRyvwueaUKQN6X36r0f2o6G6/I3c=;
 b=SbmRPwnVWkVrFn6wiRDv88xHVTOAkAlpxBK5QZabdMsAvGwcCZ0O0q+H12IXfzUvOwmjc1WYUXnRxdpCWZaYnR011IHzA3h9564FrcorCQR9UL74sZ6Cq3KW6FnBWSOYKdfZDLkooM568K5Ir23IAsoHROWaUX0CG85N5F0/pPwI/IuPiYiRZmGkGkmS9X7JhNCmuom2faOM/gQJBPmusMhREwC8o8pLGoLcd+U9wwewwwfzt1R+uha4v/LBKJPx3khUowQxPFiFh+Z4B1v/FoLcgiHoprHCgNw2JdmGBqijZSQv8D3+b4NPK0zZOuOoPcq65n4w4smITRwisnJKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiCbRXJe7ma3fPrQRyvwueaUKQN6X36r0f2o6G6/I3c=;
 b=BXic+PsCMwo8G377GWJYq64Kf5Z07fI7oltUei3HO3FVNELBWHIyCTgRZLcbihHNoNRQfP8O1RTtxe7OfEkcEh0dTijnCuLeDbIzDMXim5lVvlOKXUTz3qzdTW5zzMBxVB/46rCrMVJQ+NAHXjPzOCmG6VS7QOTZSTa2PccsHpsZrjwCUX5qm1tMMq0W6yDoDkZpqG/DLf5GRcPYT9oRdNPGCUvR1B6CIkSUTQFBL4jIbkxzP0XO/lRzU1bMKhZEoSh5kifpQudXySI2vIuOCVEltpl6CwjZ/wS0d8zL+qwHLukT1MbsuPCAS5pI9o7jJ3wr4W2y5XDkn2LAGslyRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 16:07:53 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 16:07:53 +0000
Date: Wed, 17 Sep 2025 12:07:44 -0400
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
Subject: Re: [PATCH v4 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <aMrc0GhVbpI38t3L@lizhi-Precision-Tower-5810>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI1PR04MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a64b3bc-4726-4a88-83ac-08ddf6045b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ikNpsSM/kTihcBbGkadA0qEihY4QPYRwiNuhqnJ4qb0YZM2s7AXWuWAEU8OF?=
 =?us-ascii?Q?QW5lLJjuV+ql0Qk8NhdOnU7ZVoAC57Aq6Dx9D8tfwkAdyB3IyNyDjSBcNLxg?=
 =?us-ascii?Q?w7aNSkHjcPeI9oZTZ7xFtOLBwnC9GHzYTG9mp2T5yySikY2yXKurYzjN8yDF?=
 =?us-ascii?Q?oL/pGDNv6qPYYGUb086tb89bkNM9qRZ5sIGiBAINaLFtBXI/FqOjsnCnlhFr?=
 =?us-ascii?Q?tlB20/uqQ1NTXoNLjULLOyWfDoPd/bMnYhrB0BIT7keM9xxQRF1s/uIs5DWJ?=
 =?us-ascii?Q?Rf1CjiN0FzLgqTRwiXmfLxdAiBI15EFhTcb+Rmax5WnpBKy21P4qJQivmQQ6?=
 =?us-ascii?Q?NwibKD6tANklftFwtToryUrzgHXDHAdE3rh4RmbcoX6xTD0rBDm4nydqtE6u?=
 =?us-ascii?Q?zTj92TtMcdV9Fz+ZvE7pyvFy9RaZPaYBHe8wSCsAC2Ek6zq1QCKPlqPlkx9p?=
 =?us-ascii?Q?WEhDRc9wUJALKHBiEkRS4TYmDEtayqsPLzPIZW0LTZ/tJlahfhiZ9sCEczrj?=
 =?us-ascii?Q?ha7n1vPBhmux1+Xvg1INVT1lsbiYnEYEFvKgSNZvQc1z1iDR5EdbSnCpX+DI?=
 =?us-ascii?Q?7VGRY25VWKP1M9avtRd5+YdGMHj7HY/dJqIrxoyONk2NWx+De6Fqwtpa8Cgy?=
 =?us-ascii?Q?6aX7GVuwWeptbG6UxvOAHYYHxGxLsQD4RZ5aLafSkIQ6reJCvF+xR4tWDjzx?=
 =?us-ascii?Q?/IWC+9ysNm6aOED/hmoV9YTPdqEgto0Y2+hj84XWQJiIIzrEEBVjQazz98WF?=
 =?us-ascii?Q?/4dbrWepGE7UoKBPP9Oxk6Gu2lUB8pJmrBMQ+UqzOmCp3rRzEMnhuGSUEER7?=
 =?us-ascii?Q?luIIBpjempQRm3h5KVfPwn/fybkhAh9xVu7tvqAA4VzIdNzBmYmHZKyWBLIY?=
 =?us-ascii?Q?DX/yiu7KrVPCYMm0VQLEeuYPZhObcjE/02d60vF/urenA4McYxAlLSIAgmx2?=
 =?us-ascii?Q?6Sg9L+s2r9sERruJb+p1DB4hBFFNrrgdvnAuafrekx7z5a20nMKdM4pqAFAh?=
 =?us-ascii?Q?1Z1nUTh+339+ZTEzjAAJKZOfmkXzcYqfcvGHqTPdRbVnCV6Rwu1Ye3+qYiZU?=
 =?us-ascii?Q?LPkti3SYtf5nbrymNTqEJkr3x17U/cBCN0tgB6UbCrWvL74Gtmb4o6m1Y2mJ?=
 =?us-ascii?Q?qCmube/URNfa7dK6IYT56CV2dKdKSKePRuSA6y0IcjANyn3/F8Yna/9BfZki?=
 =?us-ascii?Q?A0HIftRo5NlpWau+cYm7F62SlLgKzzKjVwDn8eQ0I1r/sg2UpKqTo00ndZ+8?=
 =?us-ascii?Q?Y1v5C5GfRDE+9FE+B91M67bcNxNvMQGhK+j/OzTlkHvsFzmL8cv1VR6esIJf?=
 =?us-ascii?Q?qMQ9144RJ5yY+wnYW3sjglKGuoFeXP0Mq/N9WgMf4L6QTWKo3ncNrb5KZpXS?=
 =?us-ascii?Q?sKhzFwF+oCJgZdmUm2XA0CRkqCjmIJEnyIKy26oXjs8Rzwd+kAdrBkViN3kK?=
 =?us-ascii?Q?E7qlpkqUvNzwsuZCO/Z/ZCl/y788EgI+xqD1EwkyvLQvQjNJW6Wakw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lL4agTg1mrwGZufkCW9Ho5GR8CcQSUeML30Q6rioplzQVEC0evh4umx3T8Qd?=
 =?us-ascii?Q?7nAWgj0HAhF63nwM8B19KFZZ+Je9EWch/R4/AZYngwU+GnC1gGo7W0bckUpA?=
 =?us-ascii?Q?QayplB/A/9Hdx3LU4qP4PhD6gVBAd1dbTCnL2QLGb49JoC2/Ip8zQuMz6CVc?=
 =?us-ascii?Q?iswhGYNuZTEl/nn/uRgpss68PHTSzMkjmSxdYtzfCqm7T16R93ISKDGjDD2j?=
 =?us-ascii?Q?PpUAFBpmao4CX4zpRrMIoYjJQZftaFbo4X9W+iZS/RfSB+KtHKviZ9qHV0uk?=
 =?us-ascii?Q?IivMesxl2JUXFCpRysiZ9V5HJQICSRBC2rBoAA2XqUEGnLtl22gUGlOM3BEQ?=
 =?us-ascii?Q?XKJY3Q5JuSAurUEOfwwkF4Ke//HrVnaAM1LH3zfOOmIaRevE68Naeqbf+8MB?=
 =?us-ascii?Q?D1QnqKUMya2XP1SCvhXbdnHcjzx6Nf4BmaZgcg2VxuETnNwaun/xGIy03i58?=
 =?us-ascii?Q?6bD+RKBEgc1Ifx1T/XrcdgdM4TGB2YDyiqcONoMrsRbsELiZSgMStD5sQM4X?=
 =?us-ascii?Q?tPeoROZ6JKYYMXrTTOfY3mFkLPp6rhMStcpHyxYdoGztfzzr6tVEHhRN92u3?=
 =?us-ascii?Q?PGrIZgnEXMC2MEHjhTKaGzz/SHGnTLlwhpH46YC5L9fVDgrAVTgsN+6s7qRP?=
 =?us-ascii?Q?SOoK2SeafRfmxCLVFSRsPHH1AfSm4XhIAHeKlIlmdhnVBGdJ8vEl+mjWraHb?=
 =?us-ascii?Q?gL3YdnxzsDR4GD98gjz5Wc5RfJH/6EcCVpusbMPmjJvjglU+/Fba7RRnYngi?=
 =?us-ascii?Q?UJnVRKf73053fp40d97hF/zAhI+KtwMCUmeeljmBcOat4oZnCT1T2H5bd1iJ?=
 =?us-ascii?Q?91ZIGZnCSOkI2gnPFA1HFnYSwFisxp7MYdpaAKOqZrer/Lytmm8vigNzJ8jl?=
 =?us-ascii?Q?9QNZ3m/1mCu+knndZ6O+WuyirhxuZD6Mhgj0rn+GTKNhV1NHfwugQp9SYaqt?=
 =?us-ascii?Q?Xtkc42HQ8/HEA8QbBAgrXXJTzrFVnIw5tfKBtt5w2fE33HdwxUPugX4qJmVH?=
 =?us-ascii?Q?vakG6ITxXBYlI8+oRmq9Yqqv/kl8wF9W8NWtswYK8DNQxNkXjUl9F+Ox/VmS?=
 =?us-ascii?Q?FTTuVTHBBHWL6i4P1xdbV53dz2EY+8VzCzXTS4SzVpJ8dOxEF1XkrqrhnizL?=
 =?us-ascii?Q?yaMlFAl9WcLgb244//6XmKki6rM3ABl+8dYzw2OnJxYJF17uamcNt2aTKMGv?=
 =?us-ascii?Q?/rxf8R6PoFtDg90zlspbCOQzAaqMXnPUEdbFX10IStPGtxhWxb0KxiJ9rLNC?=
 =?us-ascii?Q?XLi3WpSbvSU1TzMkd1pS57XbXCmLq2+bwTbvamaGrHqaYfIx0coEH/sj9ja3?=
 =?us-ascii?Q?U0aVUTPHvcDLNmjzHuQa3zjEH4UP8b2bhMeesD460M//wi76SGpbpgNPyrhZ?=
 =?us-ascii?Q?zcW4iEPcindrzdLi9mcDqImzdTGi3CmbETfT4ALnqsl+T1PzTlMF0oc7S1AK?=
 =?us-ascii?Q?jJghjV9bUD6uP2rled2tlF6OVRX+CNNtPaK3ibj2/JaxNEpvpQOfVxWMeayz?=
 =?us-ascii?Q?t5lzLF793sd5jvvZv2CYWL4Td67l8Sqf2XtehhvPDWAz4lI9wcI6cv7UHeP3?=
 =?us-ascii?Q?5Fk5GSUAvO9iRNlED/a1WEqKSWtlan5C+gSRVu1P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a64b3bc-4726-4a88-83ac-08ddf6045b52
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 16:07:52.9975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epG1YgQtQUNjWsS9QR56J2/uofwVI58g3/cZphLB8tqG9OA3EW4XP4bl/16Rd652cG7N8qshopOI375a9kumEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On Wed, Sep 17, 2025 at 10:05:09AM +0200, Dario Binacchi wrote:
> Support the touchscreen-glitch-threshold-ns property.
>
> Drivers must convert this value to IPG clock cycles and map it to one of

binding descript hardware, not drivers. So below sentence should be better.

"TSC only supports the four discrete thresholds, counted by IPG clock cycles.
See SC_DEBUG_MODE2 register."

> the four discrete thresholds exposed by the TSC_DEBUG_MODE2 register:
>
>   0: 8191 IPG cycles
>   1: 4095 IPG cycles
>   2: 2047 IPG cycles
>   3: 1023 IPG cycles
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v4:
> - Adjust property description following the suggestions of
>   Conor Dooley and Frank Li.
> - Update the commit description.
>
> Changes in v3:
> - Remove the final part of the description that refers to
>   implementation details.
>
>  .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> index 678756ad0f92..1975f741cf3d 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> @@ -62,6 +62,20 @@ properties:
>      description: Number of data samples which are averaged for each read.
>      enum: [ 1, 4, 8, 16, 32 ]
>
> +  touchscreen-glitch-threshold-ns:
> +    description: |
> +      Minimum duration in nanoseconds a signal must remain stable
> +      to be considered valid.
> +
> +      Drivers must convert this value to IPG clock cycles and map
> +      it to one of the four discrete thresholds exposed by the
> +      TSC_DEBUG_MODE2 register:

same as commit messsage, talk about hardware.

> +
> +        0: 8191 IPG cycles
> +        1: 4095 IPG cycles
> +        2: 2047 IPG cycles
> +        3: 1023 IPG cycles
> +

This case genenerally need enum 4 values, but it relates IPG frequency.
I have not idea how to restrict it base on clk frequency. May DT mainatainer
have idea.

Frank

>  required:
>    - compatible
>    - reg
> --
> 2.43.0
>

