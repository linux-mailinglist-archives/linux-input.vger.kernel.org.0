Return-Path: <linux-input+bounces-6000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A3965E42
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18291C24DC3
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE586196C86;
	Fri, 30 Aug 2024 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRWao7K6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1DC17B506;
	Fri, 30 Aug 2024 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012701; cv=none; b=nDZis1GC6AjJ+BF6rveBqEVBANRkZweiQ3tGNctl5GD6V87tVDPjsy0dX3Od4J8H78dDz9OvTv31bKcyfSZXptxMggaZgTXZY2yzzcn35eX6a93ui6rZfmoYMo2kgpREv0Huul2cn44UzvzXvyeabQnQjA2H7MQuxyAFJW7sxLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012701; c=relaxed/simple;
	bh=l9psxk81nRdSzjW/aRnloNwiDJhvsUtP9o/wLWJZwKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRSlBr8GBK6aqIASoQHecucGiW8dSLJz0COI/7txVk5UzhEpQk1RAdhqMr0kSgedme79afJJ+efsuHUE2LfWag3fy4Aj9JR007cFP3o0m9FF2L17RUHwPPAOqyP0bs22gODx93Cn8Ru928p2FNS5ljygn4J0h7TuaNyQdxwZpQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRWao7K6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012700; x=1756548700;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l9psxk81nRdSzjW/aRnloNwiDJhvsUtP9o/wLWJZwKQ=;
  b=GRWao7K6N7QE19cr3scrOwTeZVPLbaFgXjgdKE19jWb1epcWGJwoGqeB
   3UV4akUIt1TdGAtxD5kBX5PnGRW2OFoNUp4qk6r5B27i4ZCCriZjKXqM8
   47XdaGfQXmmVQpuECUEB5hYtYRu93+qUYWyEG+I4hV1OnxzYySXmTXBcb
   UsXRYQCs0F20qmfVksEp4nFPnHezWkXzVgfvwkoqFfU7eQKDKyi+3YQDd
   BndUnNcCJaIEupe7Ixaa3bRpRRIpvLBvoK5qbVXDg5xH/e+eDWdTdspuT
   OGKmiCXWfBSmaOTLPYSLFsmEZ9OWIALiZ33anreBtZny2puZmLrbSNtAx
   A==;
X-CSE-ConnectionGUID: JTrxNNoHTySImAR2jSRwuA==
X-CSE-MsgGUID: iOjaHHtsSMqBoTwHKHXMSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218740"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218740"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:40 -0700
X-CSE-ConnectionGUID: E7jW+uSASPyOaK0CNUGchw==
X-CSE-MsgGUID: Nx/fGtg6QJ2j9EB7fcvsVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481408"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:33 -0700
Message-ID: <1bcf8eee-7d7f-48b2-aa0f-2c578d4ca79c@linux.intel.com>
Date: Fri, 30 Aug 2024 10:40:59 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 12/33] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240829194105.1504814-13-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Some platforms may have support for offloading USB audio devices to a
> dedicated audio DSP.  Introduce a set of APIs that allow for management of
> USB sound card and PCM devices enumerated by the USB SND class driver.
> This allows for the ASoC components to be aware of what USB devices are
> available for offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

minor nit-picks below if you respin the series.

> +
> +/**
> + * struct snd_soc_usb_device
> + * @card_idx - sound card index associated with USB device
> + * @chip_idx - USB sound chip array index
> + * @cpcm_idx - capture PCM index array associated with USB device
> + * @ppcm_idx - playback PCM index array associated with USB device
> + * @num_playback - number of playback streams
> + * @num_capture - number of capture streams
> + * @list - list head for SoC USB devices
> + **/
> +struct snd_soc_usb_device {
> +	int card_idx;
> +	int chip_idx;
> +
> +	/* PCM index arrays */
> +	unsigned int *cpcm_idx; /* TODO: capture path is not tested yet */
> +	unsigned int *ppcm_idx;
> +	int num_playback;
> +	int num_capture; /* TODO: capture path is not tested yet */

nit-pick: I would keep the order between capture and playback consistent.

> +int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
> +int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
> +void *snd_soc_usb_find_priv_data(struct device *dev);

nit-pick: I would keep the parameter naming consistent with
struct device *usbdev


> +static inline void *snd_soc_usb_find_priv_data(struct device *dev)

same here.

> +/**
> + * snd_soc_usb_allocate_port() - allocate a SOC USB port for offloading support
> + * @component: USB DPCM backend DAI component
> + * @num_streams: number of offloading sessions supported
> + * @data: private data
> + *
> + * Allocate and initialize a SOC USB port.  The SOC USB port is used to communicate
> + * different USB audio devices attached, in order to start audio offloading handled
> + * by an ASoC entity.  USB device plug in/out events are signalled with a

typo: signaled




