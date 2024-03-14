Return-Path: <linux-input+bounces-2379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC587C0E6
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 17:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA62F282D81
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 16:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A707B73181;
	Thu, 14 Mar 2024 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="uY6o0Xid"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2094.outbound.protection.outlook.com [40.107.94.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8565C5C611;
	Thu, 14 Mar 2024 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710432312; cv=fail; b=ZmkfNNbkvrb5z+AYgo9psBh4sReiytw63F9hm+v9D8RXwEKGM+rsc95QzFAFuyFHQSm365mWUiZew2X9qk0+onk2x/HZW3QMKLs5TEq3YUpdYOozPJJRjsR8/BuGK89ZTEL9+8AGDEMYk9QB8fH4ZaJp3fLFFk1B4YPkGxd+dkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710432312; c=relaxed/simple;
	bh=JRxF/TLTdUzG889zEWce/dDP0KonML0BpWM3erme63s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DNNvrVghhNmMptM1NeAoFYHv8MS2Zx5fpAsAwbAqRktVh8qYV9rWyFSpTVxBO5iUgSNA5OxcxNmj7wvGB/xOS7cx+jKOKEL2+1OT9ELrxvBS+qFeC/eyhiZiD4z+vLNQVUM+ZsOt3FxlnZgixn0n2aIeXjaGron2xzA05mNSg+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=uY6o0Xid; arc=fail smtp.client-ip=40.107.94.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJgocQMxH4uQy09axUGGKNlBMUuFZ4kZMh+gbzvQOSFNkynnZE5fVJ908qQCiaH5pYBTf1Sv/6P02ZVuQpewOi/worHKpf5WjUPsRLIKg4BX12z1G0zCOLaCcjfRHfg8agl9JY3effp7FmoccVXvtWEHiIiUWfSc5tOzga51pbWy0dqIyYBv+7wPNz/9Wt4oTH7CmDBPyMlP6qYETJtc4URmP6WepDV6LWG+OojhxNak/VakBxw6M+79MYb1hqH4gjONzvux2hNXQY5RwwA6suwPvihPYp8iP38SBpL9gjNWJ02hctZRIzNBMHAz/7PkvY+tOVoAnRhhJgdUznWBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBF03lkjnxL1W4xyGNu71m5VfNjFeqgOufpjLSjsGLA=;
 b=LziOLnO25JVvPSu8dpvrPh4SKkrSUztk+THAgfqw5yuTPKjFbVXorNzwhOqAxB5kq0wpQLHIwYYwj+Sy2KZLnnfYBSL4kcIErOPrLjdxI9QgdwYarWIHInEbR/D9TssT877c40AmZg1Gkn4153cknb98YPRMyHHWgKAjjsuE8v86aHVFe2PzWJ2h/yfjfgcxzDGsGSFXmwjlRmzrvUplq/lRstaOqygEeRjvxgc0MAD9MNDpjJwB0M3wi/RoK4T/ojAUDsydap0bjtWBGcvdentDP82LxTvfDZf28XgQ7iLZlD1/gRG2jzyWSgLz5ebN7aEExxCPWzlcFIEE7T5HKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBF03lkjnxL1W4xyGNu71m5VfNjFeqgOufpjLSjsGLA=;
 b=uY6o0XidNpOL0wV9pMLttqLd8MqpV8S3U0L5HIitnjsxl/0fGfa4gYo7ctIx89V+XxCr+DAKzI8TgDMwsgLSeK3CjemY0OxO+Z2Paifh12ws8C0f0jHVs11bADtEGCdesNcdCd9HZWVTnWKHDtdfnj2bZY+jY6F/XUEivG42geQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB6426.namprd08.prod.outlook.com
 (2603:10b6:5:1ec::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 16:05:06 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 16:05:06 +0000
Date: Thu, 14 Mar 2024 11:05:01 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Message-ID: <ZfMgLc16lOTK62wa@nixie71>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-6-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308222421.188858-6-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SN6PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:805:de::18) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e7b68e-7985-4941-dcbd-08dc44408414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRPcSUokZGjik0mqfjuxBjtItxYOdbq2xF50yhMhkHVVG4kMASrlsV0C9i1jIbpsIpVqYIzBuXtmh5uriwAi2sqy+qFL079aXaZkm9TQST49EtS1G3XAwv2YJ3xb+j2aZvLQXLdST8o4yiMWZg/Qn5E43SYJq9GYI4xCJHMX9LQWkNixEb7NCDsiFlWrz7YLq5poG5jXubpBCUQ9J7rA/jAJunCKaOJTcs/6c56GOjk9mhUL7LvucMHSkllAlwXZzHJIFVZw2YA1vtbN7+B+mfiKwyB1E5y1hMgram7vH/SjC4Eduni8/ZI+P+zCpoZpp1JdSN/2iCwF6VAyhedRTDEcrNEgAlIrcAkJVYxZsJbK5sp8HnZqcVQfqOzQnjOC2G6C+PfXZ6yKvpv31ouxmW8QO0T0YVp865z9RxQoDwEo5ABZzs8HjIWBaEYzex+kDL8s/xIViCtTNg1KKmOk9JROp+hc5z1dpBHFXBEZxx/TUs8o5CxXyzydaxbuV94NI35aRC22YSKGMpI0IPrngpPrm+6sz+htK6YDYg2pYHMLrcMeuMhWamD3ur6QuB2084a7UrnAcPQeZXMCmYnpl60jcoaHg1TSdTbs5XHqj406EWANhyQBoRhGOC8ZDCYruVFAo6oRFwFkwa7YWA3DWU8OL5rKj5HqDTmiOjqKAU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KnVHCAzyx0sno1dBtGORd2XLrn7C9ORcmdYWJkcWFcLrzfIp26BI40pStcZb?=
 =?us-ascii?Q?+J+UlOHy64UcVjT0jqZSf4vsuhMHVkS3BRKVmVdJkJWwZBnZXCgLMc77/OBp?=
 =?us-ascii?Q?RvM4QYhrp0pwsUcObRXMYIdvn939OMoT+r90v507Uu2YjhI25XiprqKSf/u6?=
 =?us-ascii?Q?ptKkfbgiRajj0JmrFb+89/EU63c5nbrHJiVzwpkygowXkWeel21YlAbZU7z/?=
 =?us-ascii?Q?rgYB/TZdl3tvm/RaixQBuOB4bnnSh/ee6nHawXc/ginUD7vUt1X9DVKHWn73?=
 =?us-ascii?Q?Hd6Jycq0qv9a+Bx8LWcOe6uH+KpJMO4MY2l78+0nV0DJsdBjJTlaSiJ+ZT3U?=
 =?us-ascii?Q?MNERypH4rH8rfaCoLHCPais+Xe62htC2KJ5eGtGLGp0BiEPCvIUhmE5P6YEA?=
 =?us-ascii?Q?r7ebOra6EZWD1g5n+Rk9rke1DUxRd2jBrEcT7G+99jn5R8V+5M399j6bYDXU?=
 =?us-ascii?Q?lEmH6yXXh3lYhZsgpV2s5eV7f+anWDA3O2X8n+DL4nlKCXQr3++/S0c4Hyq3?=
 =?us-ascii?Q?HG6pIWEQmjaHxDYVE+ZhiLHQnQ1DP94BfR31E5S94nB91OtYkeGrNYeA5Iha?=
 =?us-ascii?Q?l5qufQEZ+lBT+0n5nrOmhJ/pAjzwYzh0RN5g5Htc19riS5/3rryDJ8wER5jG?=
 =?us-ascii?Q?L/9DpSoE7TzSpEetOdBPNidRaIGaiIaLwEkPDVAFg1BTq/OWivpqsNprFeZU?=
 =?us-ascii?Q?LoF7aPsGquP52vZzbGt4ukiFVnG1+IrK76DKvKthuUXbdieJZVjjDBi0FjPU?=
 =?us-ascii?Q?i19GldV+FOaXvM0rwIb0yxqF3RrniZJ2CmDtPRbI9BwpllueFPKAZ22/OaP/?=
 =?us-ascii?Q?gRRIRt55h1bcE40NvBEihti4puL6vDE08BWWntbvgWqMVPucKfqauck7VaMr?=
 =?us-ascii?Q?GXT3T32GttauXst8pveSlexAS6aWQn0dy/6hTCXdOikVM/HSKpVRVwaFQpXA?=
 =?us-ascii?Q?fOw6gZfce/vbJ8NC71T/5U6rcVl78/azbenWscyVfGVbh31w7hKfW2DPPq5/?=
 =?us-ascii?Q?krC6bc/KjC+Fa1B/ir2dlaRmFTQtVQj1kTJRFSS4gg9Ng853WCIxbmhhV8Y8?=
 =?us-ascii?Q?qeBHFGYXzQ0gCgglnEccnsed9VXgNBsVBNnqfMbsq0lAtvPNC9JIgbnQ4Dws?=
 =?us-ascii?Q?LFNfIs/70FyNfZADLQf1G6EUTtX0JW2BHjq/mOEHY9mY4X/HxsN1eSVq+KaB?=
 =?us-ascii?Q?qsfiLTsOWUFAuqXRqhqTCoIRKTMbTwzBIODNbNyUkSzkHOKS1haKCvYncpYC?=
 =?us-ascii?Q?KEFz0oCgvpeBbGRVPfsbGTLdtIsfkn9wJCmYbx4hJyArAIZwYAcg52KHsjd4?=
 =?us-ascii?Q?5GNuM/iOBEaiivrGnJj+p5o+Hmj4eti3E0aau3fvE9904vUFD6aGoYwwBPE3?=
 =?us-ascii?Q?Iuaj0d8XoD0sF0RndPDvHjAxUl/plrqxz4R8O8ZsnIK1N05bPQK26W5ajuFV?=
 =?us-ascii?Q?iW4CuP+f8ZOe+ToZcoyUiyF778k8Eum8uC1IDwPU/G/WXyh9RRXLIDysyQJs?=
 =?us-ascii?Q?jl8FKiogkFPBElr79Mh9M8baN0VKTELOuihpqsZA+dkw2owyadjd7jcTLd5A?=
 =?us-ascii?Q?papq6r+OjJJ+ACGLIcuIzXKNcZr9yzcVu3kv8Hi1?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e7b68e-7985-4941-dcbd-08dc44408414
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 16:05:06.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPR2eTcUgWARmDLVGvlCeq4MWOciSNYZnO9VNyaHkNJ0LAA5Eb5E6bX4ESCd9mWEoMlUvKhE0y3zlvruSfVfWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6426

Hi James,

This one looks pretty good; just a few nits since a new series is
coming anyway.

On Fri, Mar 08, 2024 at 10:24:21PM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The ASoC driver enables I2S streaming to the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
>  MAINTAINERS                      |   1 +
>  sound/soc/codecs/Kconfig         |  11 ++
>  sound/soc/codecs/Makefile        |   2 +
>  sound/soc/codecs/cs40l50-codec.c | 307 +++++++++++++++++++++++++++++++
>  4 files changed, 321 insertions(+)
>  create mode 100644 sound/soc/codecs/cs40l50-codec.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 24cfb4f017bb..fca2454a7a38 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4943,6 +4943,7 @@ F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
>  F:	drivers/input/misc/cs40l*
>  F:	drivers/mfd/cs40l*
>  F:	include/linux/mfd/cs40l*
> +F:	sound/soc/codecs/cs40l*
>  
>  CIRRUS LOGIC DSP FIRMWARE DRIVER
>  M:	Simon Trimmer <simont@opensource.cirrus.com>
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index f1e1dbc509f6..1a81bedfdbe3 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -73,6 +73,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_CS35L56_I2C
>  	imply SND_SOC_CS35L56_SPI
>  	imply SND_SOC_CS35L56_SDW
> +	imply SND_SOC_CS40L50
>  	imply SND_SOC_CS42L42
>  	imply SND_SOC_CS42L42_SDW
>  	imply SND_SOC_CS42L43
> @@ -800,6 +801,16 @@ config SND_SOC_CS35L56_SDW
>  	help
>  	  Enable support for Cirrus Logic CS35L56 boosted amplifier with SoundWire control
>  
> +config SND_SOC_CS40L50
> +	tristate "Cirrus Logic CS40L50 CODEC"
> +	depends on MFD_CS40L50_CORE
> +	help
> +	  This option enables support for I2S streaming to Cirrus Logic CS40L50.
> +
> +	  CS40L50 is a haptic driver with waveform memory, an integrated
> +	  DSP, and closed-loop algorithms. If built as a module, it will be
> +	  called snd-soc-cs40l50.
> +
>  config SND_SOC_CS42L42_CORE
>  	tristate
>  
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index a87e56938ce5..7e31f000774a 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -74,6 +74,7 @@ snd-soc-cs35l56-shared-objs := cs35l56-shared.o
>  snd-soc-cs35l56-i2c-objs := cs35l56-i2c.o
>  snd-soc-cs35l56-spi-objs := cs35l56-spi.o
>  snd-soc-cs35l56-sdw-objs := cs35l56-sdw.o
> +snd-soc-cs40l50-objs := cs40l50-codec.o
>  snd-soc-cs42l42-objs := cs42l42.o
>  snd-soc-cs42l42-i2c-objs := cs42l42-i2c.o
>  snd-soc-cs42l42-sdw-objs := cs42l42-sdw.o
> @@ -460,6 +461,7 @@ obj-$(CONFIG_SND_SOC_CS35L56_SHARED)	+= snd-soc-cs35l56-shared.o
>  obj-$(CONFIG_SND_SOC_CS35L56_I2C)	+= snd-soc-cs35l56-i2c.o
>  obj-$(CONFIG_SND_SOC_CS35L56_SPI)	+= snd-soc-cs35l56-spi.o
>  obj-$(CONFIG_SND_SOC_CS35L56_SDW)	+= snd-soc-cs35l56-sdw.o
> +obj-$(CONFIG_SND_SOC_CS40L50)		+= snd-soc-cs40l50.o
>  obj-$(CONFIG_SND_SOC_CS42L42_CORE)	+= snd-soc-cs42l42.o
>  obj-$(CONFIG_SND_SOC_CS42L42)	+= snd-soc-cs42l42-i2c.o
>  obj-$(CONFIG_SND_SOC_CS42L42_SDW)	+= snd-soc-cs42l42-sdw.o
> diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
> new file mode 100644
> index 000000000000..23299b8dacfb
> --- /dev/null
> +++ b/sound/soc/codecs/cs40l50-codec.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// CS40L50 Advanced Haptic Driver with waveform memory,
> +// integrated DSP, and closed-loop algorithms
> +//
> +// Copyright 2024 Cirrus Logic, Inc.
> +//
> +// Author: James Ogletree <james.ogletree@cirrus.com>

Typically we see a // C++ style comment for the SPDX identifier, and then
/* block comments */ for the rest, unless the maintainer has explicitly
asked for this style for this specific subsystem. The introductory block
in the rest of the series is much more common.

> +
> +#include <linux/bitfield.h>
> +#include <linux/mfd/cs40l50.h>
> +#include <linux/pm_runtime.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +
> +#define CS40L50_REFCLK_INPUT		0x2C04
> +#define CS40L50_ASP_CONTROL2		0x4808
> +#define CS40L50_ASP_DATA_CONTROL5	0x4840
> +
> +/* PLL Config */
> +#define CS40L50_PLL_REFCLK_BCLK		0x0
> +#define CS40L50_PLL_REFCLK_MCLK		0x5
> +#define CS40L50_PLL_REFCLK_LOOP_MASK	BIT(11)
> +#define CS40L50_PLL_REFCLK_OPEN_LOOP	1
> +#define CS40L50_PLL_REFCLK_CLOSED_LOOP	0
> +#define CS40L50_PLL_REFCLK_LOOP_SHIFT	11
> +#define CS40L50_PLL_REFCLK_FREQ_MASK	GENMASK(10, 5)
> +#define CS40L50_PLL_REFCLK_FREQ_SHIFT	5
> +#define CS40L50_PLL_REFCLK_SEL_MASK	GENMASK(2, 0)
> +#define CS40L50_BCLK_RATIO_DEFAULT	32
> +
> +/* ASP Config */
> +#define CS40L50_ASP_RX_WIDTH_SHIFT	24
> +#define CS40L50_ASP_RX_WIDTH_MASK	GENMASK(31, 24)
> +#define CS40L50_ASP_RX_WL_MASK		GENMASK(5, 0)
> +#define CS40L50_ASP_FSYNC_INV_MASK	BIT(2)
> +#define CS40L50_ASP_BCLK_INV_MASK	BIT(6)
> +#define CS40L50_ASP_FMT_MASK		GENMASK(10, 8)
> +#define CS40L50_ASP_FMT_I2S		0x2
> +
> +struct cs40l50_pll_config {
> +	unsigned int freq;
> +	unsigned int cfg;
> +};
> +
> +struct cs40l50_codec {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	unsigned int daifmt;
> +	unsigned int bclk_ratio;
> +	unsigned int rate;
> +};
> +
> +static const struct cs40l50_pll_config cs40l50_pll_cfg[] = {
> +	{32768, 0x00},
> +	{1536000, 0x1B},
> +	{3072000, 0x21},
> +	{6144000, 0x28},
> +	{9600000, 0x30},
> +	{12288000, 0x33},

Nit: please space these as is done elsewhere throughout the series, i.e.:

	{ 12288000, 0x33 },

> +};
> +
> +static int cs40l50_get_clk_config(unsigned int freq, unsigned int *cfg)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(cs40l50_pll_cfg); i++) {
> +		if (cs40l50_pll_cfg[i].freq == freq) {
> +			*cfg = cs40l50_pll_cfg[i].cfg;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int cs40l50_swap_ext_clk(struct cs40l50_codec *codec, unsigned int clk_src)
> +{
> +	unsigned int cfg;
> +	int ret;
> +
> +	switch (clk_src) {
> +	case CS40L50_PLL_REFCLK_BCLK:
> +		ret = cs40l50_get_clk_config(codec->bclk_ratio * codec->rate, &cfg);
> +		if (ret)
> +			return ret;
> +		break;
> +	case CS40L50_PLL_REFCLK_MCLK:
> +		cfg = 0x00;

0x00 seems special; please consider #defining it.

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_update_bits(codec->regmap, CS40L50_REFCLK_INPUT,
> +				 CS40L50_PLL_REFCLK_LOOP_MASK,
> +				 CS40L50_PLL_REFCLK_OPEN_LOOP <<
> +				 CS40L50_PLL_REFCLK_LOOP_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(codec->regmap, CS40L50_REFCLK_INPUT,
> +				 CS40L50_PLL_REFCLK_FREQ_MASK |
> +				 CS40L50_PLL_REFCLK_SEL_MASK,
> +				 (cfg << CS40L50_PLL_REFCLK_FREQ_SHIFT) | clk_src);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(codec->regmap, CS40L50_REFCLK_INPUT,
> +				  CS40L50_PLL_REFCLK_LOOP_MASK,
> +				  CS40L50_PLL_REFCLK_CLOSED_LOOP <<
> +				  CS40L50_PLL_REFCLK_LOOP_SHIFT);
> +}
> +
> +static int cs40l50_clk_en(struct snd_soc_dapm_widget *w,
> +			  struct snd_kcontrol *kcontrol,
> +			  int event)
> +{
> +	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
> +	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(comp);
> +	int ret;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		ret = cs40l50_dsp_write(codec->dev, codec->regmap, CS40L50_STOP_PLAYBACK);
> +		if (ret)
> +			return ret;
> +
> +		ret = cs40l50_dsp_write(codec->dev, codec->regmap, CS40L50_START_I2S);
> +		if (ret)
> +			return ret;
> +
> +		ret = cs40l50_swap_ext_clk(codec, CS40L50_PLL_REFCLK_BCLK);
> +		if (ret)
> +			return ret;
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		ret = cs40l50_swap_ext_clk(codec, CS40L50_PLL_REFCLK_MCLK);
> +		if (ret)
> +			return ret;
> +		break;

Just for my own understanding, does the HALO core need to be told that I2S
streaming is about to stop? Or does the L50 gracefully park the class D
outputs when the PLL source is suddenly switched?

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dapm_widget cs40l50_dapm_widgets[] = {
> +	SND_SOC_DAPM_SUPPLY_S("ASP PLL", 0, SND_SOC_NOPM, 0, 0, cs40l50_clk_en,
> +			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
> +	SND_SOC_DAPM_AIF_IN("ASPRX1", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("ASPRX2", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_OUTPUT("OUT"),
> +};
> +
> +static const struct snd_soc_dapm_route cs40l50_dapm_routes[] = {
> +	{ "ASP Playback", NULL, "ASP PLL" },
> +	{ "ASPRX1", NULL, "ASP Playback" },
> +	{ "ASPRX2", NULL, "ASP Playback" },
> +
> +	{ "OUT", NULL, "ASPRX1" },
> +	{ "OUT", NULL, "ASPRX2" },
> +};
> +
> +static int cs40l50_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
> +{
> +	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(codec_dai->component);
> +
> +	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBC_CFC)
> +		return -EINVAL;
> +
> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +		codec->daifmt = 0;
> +		break;
> +	case SND_SOC_DAIFMT_NB_IF:
> +		codec->daifmt = CS40L50_ASP_FSYNC_INV_MASK;
> +		break;
> +	case SND_SOC_DAIFMT_IB_NF:
> +		codec->daifmt = CS40L50_ASP_BCLK_INV_MASK;
> +		break;
> +	case SND_SOC_DAIFMT_IB_IF:
> +		codec->daifmt = CS40L50_ASP_FSYNC_INV_MASK | CS40L50_ASP_BCLK_INV_MASK;
> +		break;
> +	default:
> +		dev_err(codec->dev, "Invalid clock invert\n");
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		codec->daifmt |= FIELD_PREP(CS40L50_ASP_FMT_MASK, CS40L50_ASP_FMT_I2S);
> +		break;
> +	default:
> +		dev_err(codec->dev, "Unsupported DAI format\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cs40l50_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(dai->component);
> +	unsigned int asp_rx_wl = params_width(params);
> +	int ret;
> +
> +	codec->rate = params_rate(params);
> +
> +	ret = regmap_update_bits(codec->regmap, CS40L50_ASP_DATA_CONTROL5,
> +				 CS40L50_ASP_RX_WL_MASK, asp_rx_wl);
> +	if (ret)
> +		return ret;
> +
> +	codec->daifmt |= (asp_rx_wl << CS40L50_ASP_RX_WIDTH_SHIFT);
> +
> +	return regmap_update_bits(codec->regmap, CS40L50_ASP_CONTROL2,
> +				  CS40L50_ASP_FSYNC_INV_MASK |
> +				  CS40L50_ASP_BCLK_INV_MASK |
> +				  CS40L50_ASP_FMT_MASK |
> +				  CS40L50_ASP_RX_WIDTH_MASK, codec->daifmt);
> +}
> +
> +static int cs40l50_set_dai_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
> +{
> +	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(dai->component);
> +
> +	codec->bclk_ratio = ratio;
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops cs40l50_dai_ops = {
> +	.set_fmt = cs40l50_set_dai_fmt,
> +	.set_bclk_ratio = cs40l50_set_dai_bclk_ratio,
> +	.hw_params = cs40l50_hw_params,
> +};
> +
> +static struct snd_soc_dai_driver cs40l50_dai[] = {
> +	{
> +		.name = "cs40l50-pcm",
> +		.id = 0,
> +		.playback = {
> +			.stream_name = "ASP Playback",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
> +		},
> +		.ops = &cs40l50_dai_ops,
> +	},
> +};
> +
> +static int cs40l50_codec_probe(struct snd_soc_component *component)
> +{
> +	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(component);
> +
> +	codec->bclk_ratio = CS40L50_BCLK_RATIO_DEFAULT;
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_component_driver soc_codec_dev_cs40l50 = {
> +	.probe = cs40l50_codec_probe,
> +	.dapm_widgets = cs40l50_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(cs40l50_dapm_widgets),
> +	.dapm_routes = cs40l50_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(cs40l50_dapm_routes),
> +};
> +
> +static int cs40l50_codec_driver_probe(struct platform_device *pdev)
> +{
> +	struct cs40l50 *cs40l50 = dev_get_drvdata(pdev->dev.parent);
> +	struct cs40l50_codec *codec;
> +
> +	codec = devm_kzalloc(&pdev->dev, sizeof(*codec), GFP_KERNEL);
> +	if (!codec)
> +		return -ENOMEM;
> +
> +	codec->regmap = cs40l50->regmap;
> +	codec->dev = &pdev->dev;
> +
> +	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_cs40l50,
> +					       cs40l50_dai, ARRAY_SIZE(cs40l50_dai));
> +}
> +
> +static const struct platform_device_id cs40l50_id[] = {
> +	{ "cs40l50-codec", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cs40l50_id);
> +
> +static struct platform_driver cs40l50_codec_driver = {
> +	.probe = cs40l50_codec_driver_probe,
> +	.id_table = cs40l50_id,
> +	.driver = {
> +		.name = "cs40l50-codec",
> +	},
> +};
> +module_platform_driver(cs40l50_codec_driver);
> +
> +MODULE_DESCRIPTION("ASoC CS40L50 driver");
> +MODULE_AUTHOR("James Ogletree <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

Kind regards,
Jeff LaBundy

