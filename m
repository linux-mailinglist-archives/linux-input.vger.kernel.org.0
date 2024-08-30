Return-Path: <linux-input+bounces-6007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110A965E89
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1FF728AF85
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2F31AF4EC;
	Fri, 30 Aug 2024 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHTxXNbQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BA81AF4D9;
	Fri, 30 Aug 2024 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012753; cv=none; b=t2QvB2fei7lnsKnf5sHTkYyeAsJR04F8KQDCBFWoMzEOwgL6t3h9bNbpg7b1stUfViXHdsLDxBF9HLDPMwVXHiM4+/v9wwq/KcrxJsyEUhqddql7HwnRZ+DObc8PHfIHnyXfHiae3358CXLJVQl1KfAhkemXGAjo02jddTt5tVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012753; c=relaxed/simple;
	bh=3I2S+/y3zRWREP8+H0SqebmdItXfXZ9zPC2+cYey4Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKo7MjGaXYu3ioDRF/vJMczMjpTjv6PRglY6RRMT/hepB20h2PkQhSL7hzFMfs5vzo6sk2kSUIDjHugffexAr9jSoAUSLhusWhtgBQG7vbqKBsi21jeorA2R7Xip9LWHaMk19HCqggIpA+2hKZwGXhzYQVPvRvjjMz8hB0g5ZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHTxXNbQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012752; x=1756548752;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3I2S+/y3zRWREP8+H0SqebmdItXfXZ9zPC2+cYey4Qw=;
  b=hHTxXNbQCoQxBHOpI9HEsXhTA9e5t2Mz08owYajEFiAD4+iSWNNtex/2
   rlG5RJc/pu4QumVhH/FhUpfkn9WU718uWomplvpz/kfYpc4WNovG2QIIz
   QiVwP+j83rrHbEzM8ZEXdp68bVc/l52V6/hqMxJEgxS9B4mHbAUcMjG2N
   nk7siTin1agojZFonvQblWrep6Ug2tDj2t9BUEuLD/QzXbyT+9yTSW+oX
   Hzyg0dyk+BjfJh6Ur3m1IA1IlKYGP05CLFcCrt7amzOQbq1KUZw2JIQ/9
   0TXS7aXN6Tdo1VxLyQ1rtIImzzsPY/WMhivGn0f/Csbf2/i5PnwkDn+Nz
   w==;
X-CSE-ConnectionGUID: dyhxhh2mRSyBnCkOTNSnVg==
X-CSE-MsgGUID: VU2pTdnlRrG6q7xLnATp+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218873"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218873"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:31 -0700
X-CSE-ConnectionGUID: gtK2iHKfSeuDG2GH68lbnw==
X-CSE-MsgGUID: tIZC8KOQQ4uGb8DXCiEqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481724"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:25 -0700
Message-ID: <afe37014-8ec5-4808-bc24-09ac0f2d93b6@linux.intel.com>
Date: Fri, 30 Aug 2024 11:21:22 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 21/33] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-22-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-22-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Create a USB BE component that will register a new USB port to the ASoC USB
> framework.  This will handle determination on if the requested audio
> profile is supported by the USB device currently selected.
> 
> Check for if the PCM format is supported during the hw_params callback.  If
> the profile is not supported then the userspace ALSA entity will receive an
> error, and can take further action.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/q6usboffload.h  |  20 +++
>  sound/soc/qcom/Kconfig        |  10 ++
>  sound/soc/qcom/qdsp6/Makefile |   1 +
>  sound/soc/qcom/qdsp6/q6usb.c  | 246 ++++++++++++++++++++++++++++++++++
>  4 files changed, 277 insertions(+)
>  create mode 100644 include/sound/q6usboffload.h
>  create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
> 
> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
> new file mode 100644
> index 000000000000..49ab2c34b84c
> --- /dev/null
> +++ b/include/sound/q6usboffload.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * linux/sound/q6usboffload.h -- QDSP6 USB offload

not sure about the linux/ prefix?

> + *
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/**
> + * struct q6usb_offload
> + * @dev - dev handle to usb be
> + * @sid - streamID for iommu
> + * @intr_num - usb interrupter number
> + * @domain - allocated iommu domain
> + **/
> +struct q6usb_offload {
> +	struct device *dev;
> +	long long sid;
> +	u16 intr_num;
> +	struct iommu_domain *domain;
> +};

consider reordering to avoid holes/alignment issues, e.g. all pointers
first, then long long then u16


> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int direction = substream->stream;
> +	struct q6afe_port *q6usb_afe;
> +	struct snd_soc_usb_device *sdev;
> +	int ret = -EINVAL;
> +
> +	mutex_lock(&data->mutex);
> +
> +	/* No active chip index */
> +	if (list_empty(&data->devices))
> +		goto out;

-ENODEV for the default return value>?

> +
> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
> +
> +	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
> +	if (ret < 0)
> +		goto out;
> +
> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
> +	if (IS_ERR(q6usb_afe))
> +		goto out;
> +
> +	/* Notify audio DSP about the devices being offloaded */
> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
> +					  sdev->ppcm_idx[sdev->num_playback - 1]);

don't you need a symmetrical notification upon hw_free()?

Also what happens if there are multiple calls to hw_params, which is
quite legit in ALSA/ASoC?


