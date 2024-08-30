Return-Path: <linux-input+bounces-6011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 893F4965EA6
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AA1D1F263EC
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8144A1B3B15;
	Fri, 30 Aug 2024 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjSoFwwc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E319048A;
	Fri, 30 Aug 2024 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012779; cv=none; b=p1qLLOo+9LQk53VrJpJDMU0g5z/LGQAvfVV24i7jde0aF8dqbMsdDRkg6umwSpbXBQ//zI/omj1B88HiGzdr/Qznrs56XG67fiODcM3rDzXuBb4KNfBO/JURbt46pnLO6siZPRI2Ek79DyjAoCuqnPhacp/LpuGFtmFZz0KnHWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012779; c=relaxed/simple;
	bh=DC3LXGuTao39AQVcPXtfcXzKlQsgne9NUz/tj0oabTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hP1ZYVBPbNBqWvYimAfX6fv/PRBysqGTNJe9fk+U3hx4Y2bF2SBaNuZNUc7C/0TFWfedTF5DI0g9ULg2a00hK3PmCON2UPURYDSdUW2UGwH4TOky1GIyVOoqBcCFDYrQ1+oC7IqTKSizEssml0LEeCu1hkvM3pYt2GEpaoWEHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjSoFwwc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012778; x=1756548778;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DC3LXGuTao39AQVcPXtfcXzKlQsgne9NUz/tj0oabTc=;
  b=WjSoFwwcgukWUs3sqaTvuzOIoQ1H5gcWWi5S8NSZ+eWoSlwXrDVH7WI/
   4KQpe5M5+bRKyZs4s+vq65BSPFw5ZKFj+wtYiJUBQttALrKWTRLXoe8Lm
   LRxwPHMUKQiCaIdXJpz6vEllntqjgNmFNsTBAas2LTUhGjcepMJCdT9Qz
   Z20mwLbZk6mlFt77lyBN5H1hSNvf7WhsSunhtpxUEeLG6ehcWA2rpfYHF
   uUlo6GK/wuLfIwAA6xg7BvGlWy3s+t1ga44Q83TCwO+CDRUstSDAC2FOI
   aJHl7LC39X7XWKudiphOmUxha3YUabG6C9fBmAG6myyAa/s/TwApfkLyG
   A==;
X-CSE-ConnectionGUID: /6GTDo5KSd6MNnC8OPeyLw==
X-CSE-MsgGUID: 4qyEslaETGG3rSzCBq2EfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218952"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:58 -0700
X-CSE-ConnectionGUID: f+KwzfvnTy+ypwHptN16vQ==
X-CSE-MsgGUID: OEvPd9KaS7i+oM6Yt80u3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481844"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:52 -0700
Message-ID: <b8700e13-2b61-4888-8b7d-c6ab7d713198@linux.intel.com>
Date: Fri, 30 Aug 2024 11:42:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 25/33] ALSA: usb-audio: Save UAC sample size
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
 <20240829194105.1504814-26-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-26-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Within the UAC descriptor, there is information describing the size of a
> sample (bSubframeSize/bSubslotSize) and the number of relevant bits
> (bBitResolution).  Currently, fmt_bits carries only the bit resolution,
> however, some offloading entities may also require the overall size of the
> sample.  Save this information in a separate parameter, as depending on the
> UAC format type, the sample size can not easily be decoded from other
> existing parameters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.h   | 1 +
>  sound/usb/format.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 23d9e6fc69e7..15cda1730076 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -15,6 +15,7 @@ struct audioformat {
>  	unsigned int channels;		/* # channels */
>  	unsigned int fmt_type;		/* USB audio format type (1-3) */
>  	unsigned int fmt_bits;		/* number of significant bits */
> +	unsigned int fmt_sz;		/* overall audio sub frame/slot size */
>  	unsigned int frame_size;	/* samples per frame for non-audio */
>  	unsigned char iface;		/* interface number */
>  	unsigned char altsetting;	/* corresponding alternate setting */
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 3b45d0ee7693..5fde543536a8 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -80,6 +80,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
>  	}
>  
>  	fp->fmt_bits = sample_width;
> +	fp->fmt_sz = sample_bytes;
>  
>  	if ((pcm_formats == 0) &&
>  	    (format == 0 || format == (1 << UAC_FORMAT_TYPE_I_UNDEFINED))) {

Should this patch be added first? I mean, I don't see any dependency on
USB offload

I am actually confused as to how the regular USB audio path deals with
format, this must be inferred somewhere from the fmt_bits. Probably a
question for Takashi :-)


