Return-Path: <linux-input+bounces-6712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A698635B
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 17:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC7DC1C27A4C
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6D414A4F7;
	Wed, 25 Sep 2024 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6uBOEmf"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6608146A93;
	Wed, 25 Sep 2024 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276721; cv=none; b=JzBknpG4YWtH7Ri/vP8G2wi+R4cUZzISgutnil85leRgidU6kUVtLleIux6hmyxVxueRwkEd+uWocc/c7JomXUggZxWO2yDz0YJcO+Qfc8lRNDdglB78Vhlbi/LjW9zlimT97Y6c4OVjNa48PUyN/3CXvfxZLASaXViWl17wApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276721; c=relaxed/simple;
	bh=WIUE+NR4dmM7UiIRiFrWrzm0HxLBv/l07VyuLoQbaoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtmzuJxhyrALssZkovzCUjZG0X3KtwPogw5StuPDUFuiUWiTQYE/NFgVdST6Kaz12UIC/d2TG+IbQhmoTFOkKwMX0uH13icUIzqwFF+8kaM2k8wikDT3/ZruHD4E7qhquSVMWmS8lDD9NLc76t0sNdiaMWRHbcm6ffHYiQxmXag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6uBOEmf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276720; x=1758812720;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WIUE+NR4dmM7UiIRiFrWrzm0HxLBv/l07VyuLoQbaoI=;
  b=F6uBOEmfKCbi9HKqANQtAE24cZL0GEl5UT69eWZwQ586ye77FIPrfIOF
   GhgVkBWFjEKycU9lFmK5qzK981ctHwFiPOegsH3qP6mWEuAlktd8xjWcz
   Xc3FVI1iUmrBiYP8g1pDRtoACTem8UiNVzmJLG9K4iu9ugPbrEZ1qL7Jr
   gufR5NsaHAvcneBJOMWwRE6R6eDfOShBLjz+wyTud8X3X9qZXBVU5HsVb
   spVYBUVsAhhupbpr8/F6I72ePviKIfr8N6tRECblhZHSbPLTEuKST0Ibz
   9dRbTFR6uLm9ae7q4ELUEpIMyIsehZnVEScJ0Oz/uyYMWDPLBCfcEnkFn
   w==;
X-CSE-ConnectionGUID: fP72wt0hRUyeIRqur4gWTg==
X-CSE-MsgGUID: +YflIJCgTf2lUB1Wdr2xuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482928"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="26482928"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:19 -0700
X-CSE-ConnectionGUID: t0VHFxgySvWLh5P88yN8lA==
X-CSE-MsgGUID: D7kHPYD7S9yt1ec8gM4MTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="76317712"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30]) ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:13 -0700
Message-ID: <a7e97534-0351-4673-9fbe-e02b2aef998c@linux.intel.com>
Date: Wed, 25 Sep 2024 16:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 25/32] ASoC: qcom: qdsp6: Fetch USB offload mapped
 card and PCM device
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
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-26-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-26-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> +static int q6usb_update_offload_route(struct snd_soc_component *component, int card,
> +				      int pcm, int direction, long *route)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
> +	struct snd_soc_usb_device *sdev;
> +	int ret = 0;
> +	int cidx = -1;
> +	int pidx = -1;
> +
> +	mutex_lock(&data->mutex);
> +
> +	if (list_empty(&data->devices) ||
> +	    direction == SNDRV_PCM_STREAM_CAPTURE) {
> +		ret = -ENODEV;
> +		goto out;
> +	}

well the code above seems to invalidate what I understood earlier, in
that an error code is returned instead of a set of -1 values...

> +
> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
> +
> +	/*
> +	 * Will always look for last PCM device discovered/probed as the
> +	 * active offload index.
> +	 */
> +	if (card == sdev->card_idx &&
> +	    pcm == sdev->ppcm_idx[sdev->num_playback - 1]) {
> +		cidx = component->card->snd_card->number;
> +		pidx = q6usb_get_pcm_id(component);
> +	}
> +
> +	if (cidx < 0 || pidx < 0) {
> +		cidx = -1;
> +		pidx = -1;
> +	}
> +
> +out:
> +	route[0] = cidx;
> +	route[1] = pidx;
> +
> +	mutex_unlock(&data->mutex);
> +
> +	return ret;
> +}
> +

