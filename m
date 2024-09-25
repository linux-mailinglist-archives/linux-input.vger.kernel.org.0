Return-Path: <linux-input+bounces-6710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB598634E
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 17:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9CFD1C26284
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF46A1D5AB9;
	Wed, 25 Sep 2024 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9Fe9Oh8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08141D5AAA;
	Wed, 25 Sep 2024 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276708; cv=none; b=fMYRLdOblJbZDD+MbTiFhC8KRIAPH4/v3TpoC0I3pChTA9lrAEcEWikq5tnezkzrPEItiKxebdqlm6XVHXwWBRmvy4XNojYyh+8HsMgxwb2xn0FslqWmlWYwz88gFO2IrBE6D9wNbLlSALtpV/dAyM/1qsJMwNP52xCHUxLzKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276708; c=relaxed/simple;
	bh=7vCwXwDG+bsxtvd02iytviiUSMi6iO6Ybyp3t8WIe5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQu8t/nznrNR3OkpPm6MsAyiFJv4qtrSfl63IbksG79098MUJJAQGF5apIT32M5yxf7DTU+/qv3K1WbeJ6EADbYo8zcuUVphfpBSv62zKej6/VJLMxx/a6vjzygD8AAD1z3pYvHJCb4BVHAi8UlGtgO3BqkXB8kF65K3WyF0JiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9Fe9Oh8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276707; x=1758812707;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7vCwXwDG+bsxtvd02iytviiUSMi6iO6Ybyp3t8WIe5Y=;
  b=U9Fe9Oh85bH/PdB5ZG1jCEY+QRRj55hwj7XIodC22A7jYo4Avc+wg1mO
   PGMKuVlUAk2Yp5qlPefe8EQdkgRtupzwPWIcsCkpdcxTJA86bMYKunnBY
   0BhcRhC9H13g8i/TvbEMBS8B5UEMqZUWaGkeCRnCRlP2zFI7FWfUOq/Uu
   DPXzVp1MPW4DZkBiWIxamV+QfzF9setHH/7SDNONg3wVw91hAwssItPVR
   e4lVtB4qJsUaXtnSa1sweti1avul1ZL7dNvtl0yhuMFIsELtciHHRhyNj
   grt1cIIuCfbZsx+h4CN5cqrePfF7gLO2suIhGO5RRfarndugLf/vbd+Ms
   Q==;
X-CSE-ConnectionGUID: dhq0LvMBQ+SbeGGKCscbqQ==
X-CSE-MsgGUID: 8a9LlwOmQGekzzPceke9SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482876"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="26482876"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:06 -0700
X-CSE-ConnectionGUID: KkJZz6O4SrW69iXt+QA+QQ==
X-CSE-MsgGUID: dfMikm4UR6+Y2DTcJrvcFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="76317626"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30]) ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:01 -0700
Message-ID: <52f10356-ecf7-4c92-b0c3-78f7a63ae85c@linux.intel.com>
Date: Wed, 25 Sep 2024 16:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 12/32] ALSA: usb-audio: Save UAC sample size
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
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-13-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/24 02:59, Wesley Cheng wrote:
> Within the UAC descriptor, there is information describing the size of a
> sample (bSubframeSize/bSubslotSize) and the number of relevant bits
> (bBitResolution).  Currently, fmt_bits carries only the bit resolution,
> however, some offloading entities may also require the overall size of the
> sample.  Save this information in a separate parameter, as depending on the
> UAC format type, the sample size can not easily be decoded from other
> existing parameters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/usb/card.h   | 1 +
>  sound/usb/format.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 4f4f3f39b7fa..b65163c60176 100644
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


