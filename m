Return-Path: <linux-input+bounces-6002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF9965E53
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4653D1C24E96
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D7319ABA8;
	Fri, 30 Aug 2024 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVEs9cZV"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F390818E371;
	Fri, 30 Aug 2024 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012717; cv=none; b=Y0Zaw6W7Nf3HHZVnCcgFS3/5wLq5PXb7K1Z2I6yYrHbyeHSPo30OMBkkd5ppqsK3v7884/yAx1d48MReSSXghh8Zwsb7LCdVoZ0xuORAXmLqW0DQHdMQi66cV7MaEB6P7UUZfFXkxHC54fCstPdXgSqaBX9Zr88cfZdSNyVzj08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012717; c=relaxed/simple;
	bh=nvwdli/vuJlXs99b/bTWyLUX2OouSS5qT/PZKpNYfC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMx1YMvYKiCRCwkXp2dt8KR7yF0385dUHdQ+DptV7LDUF3KT8wI+oWYGnyxVFuR4COybbvFf+NLHUvXCcDLsI166AmxgHwFGtkhIfqsD78PJcZxF/oxZlyOVDVgQhmNCL17IyWCt6yd/0Pnt0QxP+cFiD9OINjXREf1VY810tTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVEs9cZV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012716; x=1756548716;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nvwdli/vuJlXs99b/bTWyLUX2OouSS5qT/PZKpNYfC4=;
  b=ZVEs9cZVob0DSD7Hc/ESfIO4XwzF1zmbm5FTtYVE/ObISItMNCWp+Ejv
   lM7zu5HzoEUBkFC1YHpN/iUUtDRl/9hnaxnWFyZlwhdUMuqSTTokvXUCv
   wH6HlfsJY1fsuIBIKXcfwTLv8qDEUBW7bLw6k0WtOKTXBAac+XhGbRNMr
   AnrQycO9Z9plpaPvxnvUmjj8Dj5sYx+65lk5aYlr5AY9d4H+bQBzK4Y+2
   tD3G/IeGknD6Pv3Pqr8NCDjEjPkKgztXT199550y5vu0fCAlHQehz2F9C
   1A/fg2tAkIXU76d3YtGJIg1AOLlAFIpCTX0paygMIwUXYzr67RaA2Xto5
   w==;
X-CSE-ConnectionGUID: jmsgDjUDTRKudB7QnWSYFA==
X-CSE-MsgGUID: JpbxrQrrSh6hTmS4RZeaPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218776"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:56 -0700
X-CSE-ConnectionGUID: smPuBLJIRsuikEzaAcvyMQ==
X-CSE-MsgGUID: zk7MvKEdSk6jyRtiUFbE1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481495"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:11:49 -0700
Message-ID: <fe01d7f6-fd85-41ca-9b53-f13cc82096ed@linux.intel.com>
Date: Fri, 30 Aug 2024 10:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 14/33] ASoC: usb: Create SOC USB SND jack kcontrol
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
 <20240829194105.1504814-15-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-15-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Expose API for creation of a jack control for notifying of available
> devices that are plugged in/discovered, and that support offloading.  This
> allows for control names to be standardized across implementations of USB
> audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Some nit-picks below.

> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index b550ee87b748..5c788cbfa82e 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -6,6 +6,8 @@
>  #ifndef __LINUX_SND_SOC_USB_H
>  #define __LINUX_SND_SOC_USB_H
>  
> +#include <sound/soc.h>
> +

nit-pick: move this to patch 12/33


> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> index 8ade2060d8fe..3d5354298206 100644
> --- a/sound/soc/soc-usb.c
> +++ b/sound/soc/soc-usb.c
> @@ -4,8 +4,10 @@
>   */
>  #include <linux/of.h>
>  #include <linux/usb.h>
> -#include <sound/soc.h>
> +

nit-pick: move this to patch 12/33

> +#include <sound/jack.h>
>  #include <sound/soc-usb.h>
> +
>  #include "../usb/card.h"
>  
>  static DEFINE_MUTEX(ctx_mutex);
> @@ -57,6 +59,64 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
>  	return ctx ? ctx : NULL;
>  }
>  
> +/* SOC USB sound kcontrols */
> +/**
> + * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
> + * @component: USB DPCM backend DAI component
> + * @jack: jack structure to create
> + *
> + * Creates a jack device for notifying userspace of the availability
> + * of an offload capable device.
> + *
> + * Returns 0 on success, negative on error.
> + *
> + */
> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +				   struct snd_soc_jack *jack)
> +{
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Jack",
> +				    SND_JACK_USB, jack);
> +	if (ret < 0) {
> +		dev_err(component->card->dev, "Unable to add USB offload jack\n");

nit-pick: be consistent and return the code in the error log as done below.

> +		return ret;
> +	}
> +
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +	if (ret) {
> +		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

