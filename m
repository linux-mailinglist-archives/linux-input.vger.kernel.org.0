Return-Path: <linux-input+bounces-6004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA9C965E6A
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE9EE1C20AB6
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5751A2857;
	Fri, 30 Aug 2024 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGhSuQMW"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630D4189B96;
	Fri, 30 Aug 2024 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012730; cv=none; b=ThaDptoB0URKWPAlct7xy92rukj5CfFK1Vi6Pom2tc50E9nZCxTeSQsAHbE0utZnAuiov87nwzVpKIEG+2cyMLFho7FdG07sBzIPm4elz9KUUiPtlwqH++3rLStZSV67c7dcj9aSyp1TflBdM8wbWlkk21sXspB3cnzkhT2DByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012730; c=relaxed/simple;
	bh=bKLtZa3cKoK9TzUa9TB+LglNmjaV03FoQ0yzMmzbFmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnHE6Q4c8QM1nA/dtMBA3olF9AlHYIvTc3aJN+wJ8uOzbGAVoW4KFX6qw5n199Zf87+t4iGEooTdsOnxY4L+8rnBPSBUCn0HZYhs6bqOw0H/KU1hKLiGQQqUi2YxEaQVq5Zpv1AQOogEIbrXOyV+P4ytB+hHlCqA5BoSqafVuXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGhSuQMW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012730; x=1756548730;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bKLtZa3cKoK9TzUa9TB+LglNmjaV03FoQ0yzMmzbFmc=;
  b=YGhSuQMWJTg9L8NdrujtdwF4tP0GAVitadY4prupovh6R56u+u07iSuw
   ikklTZMDR+CZeSo4ctQtPmb0JRb1ErSm1KOjSuBy3A7EO86Pn3xa8eZre
   qra53aJB7lgjuQ7vwaRVf5jZezPDHZDPtbNP2t235tRmDbO2PZ5Q9RgTe
   36j7HJkBDXcOigzlrtIRSnZIekTFJcRIDAwCFLZ/GWnvJHkbkVCWTdn03
   HYzyXBilvsbB47xhA3bUSqalmwmWnW5FYyqNb0Nq6aEzO6MjHgvtx50sv
   4Owt+9hCODK2Y3S3j0SLVCYZoODiSUeTs2HCAUgwHwm0qz+506GLjqOtR
   A==;
X-CSE-ConnectionGUID: QRwNQNVwQziqYod7Btfk6A==
X-CSE-MsgGUID: WPi8RMOORoCyx2Zm91onYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218816"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218816"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:09 -0700
X-CSE-ConnectionGUID: g37nUHMuRiqbqJGTAPN68Q==
X-CSE-MsgGUID: kFlenFfcQeuihxmEkU1Y9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481580"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:03 -0700
Message-ID: <522dd841-2060-4e7c-b8ce-7e9ea2fa8498@linux.intel.com>
Date: Fri, 30 Aug 2024 11:03:16 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 16/33] ASoC: doc: Add documentation for SOC USB
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
 <20240829194105.1504814-17-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-17-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
> index e57df2dab2fd..8bed8f8f48da 100644
> --- a/Documentation/sound/soc/index.rst
> +++ b/Documentation/sound/soc/index.rst
> @@ -18,3 +18,4 @@ The documentation is spilt into the following sections:-
>     jack
>     dpcm
>     codec-to-codec
> +   usb
> diff --git a/Documentation/sound/soc/usb.rst b/Documentation/sound/soc/usb.rst
> new file mode 100644
> index 000000000000..bd3d9eb86b07
> --- /dev/null
> +++ b/Documentation/sound/soc/usb.rst
> @@ -0,0 +1,429 @@
> +================
> +ASoC USB support
> +================
> +
> +Overview
> +========
> +In order to leverage the existing USB sound device support in ALSA, the
> +ASoC USB APIs are introduced to allow for the entities to communicate
> +with one another.

nit-pick: entities is rather vague and an overloaded term in USB audio.
Maybe "allow the subsystems to exchange configuration information"

> +One potential use case would be to support USB audio offloading, which is
> +an implementation that allows for an external DSP on the SoC to handle the

nit-pick: not sure about the reference to an 'external DSP'. "external"
would usually to a stand-alone device and there's no real need for DSP
capabilities for USB offload, e.g. a regular embedded core would do just
fine.

maybe "allows for an alternate power-optimized path in the audio
subsystem to handle the transfer of audio data over the USB bus"

> +transfer of audio data over the USB bus.  This would let the main
> +processor to stay in lower power modes for longer duration.  The following
> +is an example design of how the ASoC and ALSA pieces can be connected
> +together to achieve this:

> +	int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +					     int direction, long *route)
> +..
> +
> +  - ``dev``: USB device to look up offload path mapping
> +  - ``card``: USB sound card index
> +  - ``pcm``: USB sound PCM device index
> +  - ``direction``: direction to fetch offload routing information
> +  - ``route``: mapping of sound card and pcm indexes for the offload path

nit-pick: again explain how the card and pcm indices are handled.


> +--------------------------------
> +USB devices can be hotplugged into the USB root hub at any point in time.

"root hub" really?

Is this really required? I would think the entire framework would work
just fine if the device is connected to any hub at any level, not just
"the" root hub.



