Return-Path: <linux-input+bounces-6005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97764965E7A
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CEDF1F27A78
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD5A1AAE1A;
	Fri, 30 Aug 2024 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB7NqK0N"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69CE189B96;
	Fri, 30 Aug 2024 10:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012737; cv=none; b=p6FHMzGmperJHp2qlB6viwNHTK/iA7/m4oiwRYOVZeg5urKUBCwftdunA2Wk1Du1frBx43EDGXHQoe7XVa9kXLYpQxV9IUBGU6xthXqb6IuOHjHSoQP9nzfvQOOTILxutsbSfSTl26yY65VmJCopK8SGmc7I6M+9pvPAsPPjZjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012737; c=relaxed/simple;
	bh=eyXJHGcT/Na/c2SdMzGXJF5Dzkg07Jkb8wsmfvC9SWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZW8RBGEdFMnPoj+kuNeZewSUGaF3ST9lecV23uaTXz9sGn2MOU91uXsJym/dBzRtW9yOLHJmZ/2MrGVEJIQ0mjz4ubOQtXphs5YPUZyqrzgi90QO8hWHFeYNxuZXKVEjGy4fc6K10v6hZ+ecXIv68Uy+MEb9OaR6aCssTud24I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB7NqK0N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012736; x=1756548736;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eyXJHGcT/Na/c2SdMzGXJF5Dzkg07Jkb8wsmfvC9SWI=;
  b=YB7NqK0NtQDRrpLYsxU7DR9XJfWU7EU6QlvwSdI7u+8Qzd8+OziqKfe2
   4zUkuzq4Vr/r4+Gb+Y3tytApZpTMwY9enAsakQ3YgEPZ/7W/inSXbTUnp
   ZRtfJVPYN/pwunqHa7tJ6Tgs+FUjydaC0UOhvdTv0CTfaeixXjvH3mQxw
   DOsgIdlbTo2wlUqEpQfhk+bP49r/tsovKoL4iBQs2guIqppnUbP/5ooA/
   GSZWa1QX63Jlx8cJHKw6eG455Zi58vUhwToSOSzIfARFtxHt2bOSoRaae
   5CaFi5aEJtqI/x8Z2iJM3uyvYafwWP+s3LBR6ryKVb82a0UIbuZT86BkT
   Q==;
X-CSE-ConnectionGUID: r41HGSCPQT2fG0AlcLFA+Q==
X-CSE-MsgGUID: vel2S5ciQyeBFNwnJN1R1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218839"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:16 -0700
X-CSE-ConnectionGUID: TB+bsB5SSDG33pLIuWM/ug==
X-CSE-MsgGUID: bxrL9ko3S02EoTU7hzfgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481618"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:09 -0700
Message-ID: <ae0ae5f0-a3e9-49b4-95ba-524975d70659@linux.intel.com>
Date: Fri, 30 Aug 2024 11:12:50 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 19/33] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20240829194105.1504814-20-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-20-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback endpoints, so that the main
> application processor can be placed into lower CPU power modes.  This adds
> the required AFE port configurations and port start command to start an
> audio session.
> 
> Specifically, the QC ADSP can support all potential endpoints that are
> exposed by the audio data interface.  This includes, feedback endpoints
> (both implicit and explicit) as well as the isochronous (data) endpoints.

I think you meant

"
this includes isochronous data endpoints, in either synchronous mode or
asynchronous mode. In the latter case both implicit or explicit feedback
endpoints are supported.
"

And now I don't remember how *controls* are handled.

Is this the case that all controls exposed by endpoint zero are visible
in both the regular USB-audio card AND the offloaded card, with changes
mirrored?

It's important to explain so that the volumes are consistent no matter
which path is used. This should be added to the documentation.


> +static const struct snd_soc_dai_ops q6afe_usb_ops = {
> +	.probe		= msm_dai_q6_dai_probe,
> +	.prepare	= q6afe_dai_prepare,
> +	.hw_params	= q6afe_usb_hw_params,
> +	/*
> +	 * Shutdown callback required to stop the USB AFE port, which is enabled
> +	 * by the prepare() stage.  This stops the audio traffic on the USB AFE
> +	 * port on the Q6DSP.
> +	 */
> +	.shutdown	= q6afe_dai_shutdown,
> +	/*
> +	 * Startup callback not needed, as AFE port start command passes the PCM
> +	 * parameters within the AFE command, which is provided by the PCM core
> +	 * during the prepare() stage.
> +	 */

Humm, now this is a bit confusing. Why would you need a shutdown, can't
you use the hw_free() callback for symmetry with prepare()?



