Return-Path: <linux-input+bounces-3970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C278D5089
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 19:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 965701C22589
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 17:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BBB4436C;
	Thu, 30 May 2024 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="deA1kXVY"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC49346544;
	Thu, 30 May 2024 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088862; cv=none; b=ZIELqDCoAl+INNYpwnYMm13pjlIjYmD3ioSOIAuTiqITYtaE9qt4++uP67HjrYBJKqa91pREeEumeZ6dRHk73tdeQivuQJLO9hz5VFusxmbYJk2+McjQwY7nM6/YX+7eqyWPTCEdlWSpGklSz2Ji+HW0/rI5NGIZHMGmWwdVDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088862; c=relaxed/simple;
	bh=MJ2wuaCd/2ZiUIPAA4eoz+c/Cwyu0XqjDw22ygKEx5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JdK09GybHJ22N1//J8w5pqrGoebA6QYXaCPT/nnoTjMnMCDu6jZ19chm7iB5U3nXjegg8wu3n97tg/yvZUOvIVZj7A5Ipju7CFETU7XPcjqTT9F9OdAoeCkdqMjuRg/MGeeJw5IWk+oAiPIiLw7g7QpwoWFQK6T8U1+OkxpkwiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=deA1kXVY; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44U4xJXV021359;
	Thu, 30 May 2024 12:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+9ZyUc5MMmPZs6k5uP+TG3Et3UMyDITZlWUysquJE+k=; b=
	deA1kXVY3kVDo4/abGabWIPCgnjSq7x0XnHoVvddsGi8Js72NpyMwztv1KG0bgKP
	plRCPZMsyLDvZb+MctmqISZMc2IQslS8McPodAiLwTUQlYLzdklwxWoLSWfQihrN
	po2ogelgXrQiFxla46iNfTByXTgYsjr0yui61cc3rw/G98wRhzjKbs7espX/U7Ey
	2dw4tGNbAbknUztLVokwHG2MW2rHDv9Ei4mnxTBbvYdBXKEUsuuS7SOJ5LEOG2Bt
	Eru4l4iqFMQ9KVFuIvhSmx3NXyV5FMlMQSe3BFOe6CSqhMyD4kj71jEpylO1lFB8
	0BXER34DXRcsDmGS4Ej3Lg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcww1ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 12:07:20 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 18:07:18 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 30 May 2024 18:07:18 +0100
Received: from [141.131.156.155] (macC02FN0GLMD6T.ad.cirrus.com [141.131.156.155])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3EF6982F2A4;
	Thu, 30 May 2024 17:07:16 +0000 (UTC)
Message-ID: <abf5d0d6-30f4-44f4-b01b-ad9e4321db58@opensource.cirrus.com>
Date: Thu, 30 May 2024 12:07:15 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
To: James Ogletree <jogletre@opensource.cirrus.com>,
        <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        David Rhodes
	<drhodes@opensource.cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
Content-Language: en-US
From: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>
In-Reply-To: <20240408153214.42368-6-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nlHNiblfpo6Och6cb1w5RqC1P5Fkj7aO
X-Proofpoint-ORIG-GUID: nlHNiblfpo6Och6cb1w5RqC1P5Fkj7aO
X-Proofpoint-Spam-Reason: safe


On 4/8/24 10:32 AM, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
>
> The ASoC driver enables I2S streaming to the device.
>
> Reviewed-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
>   MAINTAINERS                      |   1 +
>   sound/soc/codecs/Kconfig         |  11 ++
>   sound/soc/codecs/Makefile        |   2 +
>   sound/soc/codecs/cs40l50-codec.c | 308 +++++++++++++++++++++++++++++++
>   4 files changed, 322 insertions(+)
>   create mode 100644 sound/soc/codecs/cs40l50-codec.c
>
<cut>
> diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
> new file mode 100644
> index 000000000000..6d4a0970b219
> --- /dev/null
> +++ b/sound/soc/codecs/cs40l50-codec.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// CS40L50 Advanced Haptic Driver with waveform memory,
> +// integrated DSP, and closed-loop algorithms
> +//
> +// Copyright 2024 Cirrus Logic, Inc.
> +//
> +// Author: James Ogletree <james.ogletree@cirrus.com>
> +
> +#include <linux/bitfield.h>
> +#include <linux/mfd/cs40l50.h>
> +#include <linux/pm_runtime.h>
Is pm_runtime.h being used in the context of the codec driver? If not, 
you should drop it.
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +
<cut>
> +
> +static const struct cs40l50_pll_config cs40l50_pll_cfg[] = {
> +	{ 32768, 0x00 },
> +	{ 1536000, 0x1B },
> +	{ 3072000, 0x21 },
> +	{ 6144000, 0x28 },
> +	{ 9600000, 0x30 },
> +	{ 12288000, 0x33 },
> +};
> +
> +static int cs40l50_get_clk_config(unsigned int freq, unsigned int *cfg)
You could constify freq.
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
You could constify clk_src.
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
> +		cfg = CS40L50_PLL_REEFCLK_MCLK_CFG;
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
<cut>
> +
> +MODULE_DESCRIPTION("ASoC CS40L50 driver");
> +MODULE_AUTHOR("James Ogletree <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");

This gets my Reviewed-by pending these edits.

Ricardo


