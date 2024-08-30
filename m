Return-Path: <linux-input+bounces-6012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEB965EAC
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1837A1F2608C
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915C41B3B3C;
	Fri, 30 Aug 2024 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQO1/M/6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2052190696;
	Fri, 30 Aug 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012788; cv=none; b=N+SrPi6DpfSGfIKnbKvdlgldQT6vUyEMZo9AQW1AjMFbX8BQodDeSEdbXmRtFUpDPAOKq6MbzHBSFcpYB466ClAtHlQQ5tZT519zvs+CJyGQG7EMfpWc0e+8nnSFro+TcLM/+694VJSA35gfYI9NudjgpHnupOV4gvEYD+KzSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012788; c=relaxed/simple;
	bh=ZiV5juXZHsxC12Bco99ZwT2n9UA1i1g2rDetW/Sz2c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLEe+1ld0b3webJuFDmnzR5q0cWGs1fKpaoODCZ0X2BuLjpqU7QeKQeqS+nXs66VbrvQWRZLWsYx+Tqj89lYuhhl8zvHgweTTENQOSwIAe6MEUJO/na9xxt3L+TBGwDdsACyq2HmHjqDpfrh40JRhEppWv9SBpb5hQlaNMJYkc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQO1/M/6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012788; x=1756548788;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZiV5juXZHsxC12Bco99ZwT2n9UA1i1g2rDetW/Sz2c0=;
  b=XQO1/M/6ZCDLdoM/cz8a0CGXTjz1He2LJRdgAROP8sem2RV4snmhpHBX
   TU6JgrvVmyWuoASl3+Tnh30bZzOshJt+hdghVbdTFvmyP3GZYWbBHwFEa
   ryLL44J58SPR4E22Yfakj8wsi1besg7cfUlNfd2sNkY/3fZne2mTwwlqP
   vzaayjEs+NiBXjBlCfuqaelOWVmKA1R+N2X4schwJ5ni3NshJe/p0IWFN
   JBOhiyhVMaQZ7saKR7h43vOOFvJi8us5XSJUz1kssdyNVSDM/iAWtjvdn
   9VjfnUV3xaAhgxW4Rh1iQ3fNJk0z+r6VY6wrjxDFmP+zv8rT6KdDQSM39
   Q==;
X-CSE-ConnectionGUID: Eq2JLRN+S1CWRgCfOnfclg==
X-CSE-MsgGUID: NNgqzkXqTLu6+6EyHHxr+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526356"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="27526356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:13:07 -0700
X-CSE-ConnectionGUID: FM08lA2vQK25MsRa4jxGGQ==
X-CSE-MsgGUID: hlPVQKuySCi3JE8FTvB74g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68013117"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:13:00 -0700
Message-ID: <e8b11cb4-cda1-4904-b83f-e124066758e3@linux.intel.com>
Date: Fri, 30 Aug 2024 11:45:05 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 26/33] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20240829194105.1504814-27-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-27-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> With USB audio offloading, an audio session is started from the ASoC
> platform sound card and PCM devices.  Likewise, the USB SND path is still
> readily available for use, in case the non-offload path is desired.  In
> order to prevent the two entities from attempting to use the USB bus,
> introduce a flag that determines when either paths are in use.
> 
> If a PCM device is already in use, the check will return an error to
> userspace notifying that the stream is currently busy.  This ensures that
> only one path is using the USB substream.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I would also move this patch earlier in the series since it has no
dependency on USB offload really, and if somehow it breaks USB audio
regular paths we'd want to know early for bisection.


> ---
>  sound/usb/card.h |  1 +
>  sound/usb/pcm.c  | 29 ++++++++++++++++++++++++++---
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 15cda1730076..d8b8522e1613 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -165,6 +165,7 @@ struct snd_usb_substream {
>  	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
>  	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
>  
> +	unsigned int opened:1;		/* pcm device opened */
>  	unsigned int running: 1;	/* running status */
>  	unsigned int period_elapsed_pending;	/* delay period handling */
>  
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index 18467da6fd9e..b24ee38fad72 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -1241,8 +1241,17 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct snd_usb_substream *subs = &as->substream[direction];
> +	struct snd_usb_audio *chip = subs->stream->chip;
>  	int ret;
>  
> +	mutex_lock(&chip->mutex);
> +	if (subs->opened) {
> +		mutex_unlock(&chip->mutex);
> +		return -EBUSY;
> +	}
> +	subs->opened = 1;
> +	mutex_unlock(&chip->mutex);
> +
>  	runtime->hw = snd_usb_hardware;
>  	/* need an explicit sync to catch applptr update in low-latency mode */
>  	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
> @@ -1259,13 +1268,23 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>  
>  	ret = setup_hw_info(runtime, subs);
>  	if (ret < 0)
> -		return ret;
> +		goto err_open;
>  	ret = snd_usb_autoresume(subs->stream->chip);
>  	if (ret < 0)
> -		return ret;
> +		goto err_open;
>  	ret = snd_media_stream_init(subs, as->pcm, direction);
>  	if (ret < 0)
> -		snd_usb_autosuspend(subs->stream->chip);
> +		goto err_resume;
> +
> +	return 0;
> +
> +err_resume:
> +	snd_usb_autosuspend(subs->stream->chip);
> +err_open:
> +	mutex_lock(&chip->mutex);
> +	subs->opened = 0;
> +	mutex_unlock(&chip->mutex);
> +
>  	return ret;
>  }
>  
> @@ -1274,6 +1293,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>  	int direction = substream->stream;
>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>  	struct snd_usb_substream *subs = &as->substream[direction];
> +	struct snd_usb_audio *chip = subs->stream->chip;
>  	int ret;
>  
>  	snd_media_stop_pipeline(subs);
> @@ -1287,6 +1307,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>  
>  	subs->pcm_substream = NULL;
>  	snd_usb_autosuspend(subs->stream->chip);
> +	mutex_lock(&chip->mutex);
> +	subs->opened = 0;
> +	mutex_unlock(&chip->mutex);
>  
>  	return 0;
>  }


