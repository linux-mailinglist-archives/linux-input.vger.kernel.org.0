Return-Path: <linux-input+bounces-6003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF46965E5B
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 830B11F2763B
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E78118EFD3;
	Fri, 30 Aug 2024 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtTHfpYe"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94C1A2857;
	Fri, 30 Aug 2024 10:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012723; cv=none; b=rjJRdg8K3p95jfnyrzGnvL82wOep57QoAKc93JKKhxBYgdYK3QmFUNtFphkkT1jIzXBW0GJ53ebQywNimL9pX/A2f3e5QWLBuqHHK+48iz9NvSGf6IZjOtLfBWIUiEOOD9cYuwCSK7j0g1xW2GArNVEZGe57kXeZ3EFNhbs9jJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012723; c=relaxed/simple;
	bh=y00x1TMGRvzYoEqQKzfQV1CLcXwYCVrbAv6PGJi2A2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcXPebVvt7BVentGTSSWT6JfTB81AIZ1Um4uhBy8yQB+Gn915R6yhH1V5KxKWY2etVB77KNmp50oW1R1vl1Yr5DxIFs36FYAly5uAngjoSNP/TqdEJ7WRnDyIPTsAOLFJ5cMGjngfCecPh7pnwJZCeEwgDO0qqTWD26R0WtX00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtTHfpYe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012723; x=1756548723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y00x1TMGRvzYoEqQKzfQV1CLcXwYCVrbAv6PGJi2A2o=;
  b=VtTHfpYeTF4scyDIHZLPjm6joQ8+258fJxLWFr8hO15nMsNkaXVJYGou
   fNHpDyfbuQdTgHWHEIeUUVPVh6sOdAhOhKqlOfaHeXj3cQ4yR+8NoPi0v
   /OOBoqSHaa4zORJVIAz3rZPV82bsVx1udlgjZdzfp4NRT3gej0e4BNp+0
   SVIeyS1eAK1VoxQkgcJRW34Jv6qrusDj80CAxPtC5hvP82BDPd2YlGBa4
   c9ewRIXVvkoZrAjcBVOROlnXMvozELf9G+Bl+4sSMYgNuobQD1cDh3Rp/
   NRI9GzLEi6PW/Cal9K5wu/fOYgRAnYMYvTc70ovGlLY5tED6DtPHvpLbi
   w==;
X-CSE-ConnectionGUID: BqY1Uk6tSEOvvsGviB4b0w==
X-CSE-MsgGUID: uSLDSutwSlS6C5fSofaHGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218799"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218799"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:02 -0700
X-CSE-ConnectionGUID: fjjXRzf5Q/qN7kKIT5PMPw==
X-CSE-MsgGUID: Rrtuk6UgQ0iLT65o58uqzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481536"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:56 -0700
Message-ID: <144f02c3-e75c-46d8-9a50-936167a25576@linux.intel.com>
Date: Fri, 30 Aug 2024 10:50:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 15/33] ASoC: usb: Fetch ASoC card and pcm device
 information
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
 <20240829194105.1504814-16-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-16-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> USB SND needs to know how the USB offload path is being routed.  This would
> allow for applications to open the corresponding sound card and pcm device
> when it wants to take the audio offload path.  This callback should return
> the mapped indexes based on the USB SND device information.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index 5c788cbfa82e..86876098a2b7 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -36,6 +36,7 @@ struct snd_soc_usb_device {
>   * @list - list head for SND SOC struct list
>   * @component - reference to ASoC component
>   * @connection_status_cb - callback to notify connection events
> + * @update_offload_route_info - callback to fetch mapped ASoC device

nit-pick: explain that 'route' refers to the (card, device) pair and
isn't related to the concept of DAPM route.

>   * @priv_data - driver data
>   **/
>  struct snd_soc_usb {
> @@ -44,6 +45,9 @@ struct snd_soc_usb {
>  	int (*connection_status_cb)(struct snd_soc_usb *usb,
>  				    struct snd_soc_usb_device *sdev,
>  				    bool connected);
> +	int (*update_offload_route_info)(struct snd_soc_component *component,
> +					 int card, int pcm, int direction,
> +					 long *route);

nit-pick: also explain the format used for the (card, device) pair
stored in the long

>  	void *priv_data;
>  };
>  
> @@ -59,6 +63,8 @@ void *snd_soc_usb_find_priv_data(struct device *dev);
>  int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>  				   struct snd_soc_jack *jack);
>  int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
> +int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +				     int direction, long *route);
>  
>  struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>  					      void *data);
> @@ -101,6 +107,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
>  	return 0;
>  }
>  
> +static int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +					    int direction, long *route)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline struct snd_soc_usb *
>  snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
>  {
> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> index 3d5354298206..de249e8a28cb 100644
> --- a/sound/soc/soc-usb.c
> +++ b/sound/soc/soc-usb.c
> @@ -117,6 +117,37 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
>  
> +/**
> + * snd_soc_usb_update_offload_route - Find active USB offload path
> + * @dev - USB device to get offload status
> + * @card - USB card index
> + * @pcm - USB PCM device index
> + * @direction - playback or capture direction
> + * @route - pointer to route output array
> + *
> + * Fetch the current status for the USB SND card and PCM device indexes
> + * specified.
> + */
> +int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +				     int direction, long *route)
> +{
> +	struct snd_soc_usb *ctx;
> +	int ret;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	mutex_lock(&ctx_mutex);
> +	if (ctx && ctx->update_offload_route_info)
> +		ret = ctx->update_offload_route_info(ctx->component, card, pcm,
> +						     direction, route);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_update_offload_route);
> +
>  /**
>   * snd_soc_usb_find_priv_data() - Retrieve private data stored
>   * @dev: device reference


