Return-Path: <linux-input+bounces-6010-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A5965E9B
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D281C1C24E9A
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293D61B29C5;
	Fri, 30 Aug 2024 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amqblwK5"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FADD190471;
	Fri, 30 Aug 2024 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012773; cv=none; b=SNFKL90NfukGVTmNAT/FBFTP6z9WrJvpKSz002F3OMlaOOFGs3h8ECu/uRWoSXmJR5pp+zhcRnamr2quPNdUqN8/dECHriGUJL5zJ7qwe5TvHVJ78ou6XkHJV1GtjJ45299/eRSREgZhLyY3uTXNlbTEQ8hg/ZaqEkjFjbDFasA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012773; c=relaxed/simple;
	bh=UfcqtMrsI4yLwUepfMAYwVCdjBub/4R778PIbcvRnyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1M52ba3c9Fqqmo7zVEsqHPInofxUiPk+g3n9X1P5UQNu6uU37b1ta490EOsrZNsXHnwz+SeyBeh3PDliv8cQMHa1FqWoiTC/mugsLFsAq09fQMzphRCrTljzySe+zBVZHGsaGplGjarNNJfvKI9vjn8POKa4GLQVwjj1o0tBQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amqblwK5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012772; x=1756548772;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UfcqtMrsI4yLwUepfMAYwVCdjBub/4R778PIbcvRnyM=;
  b=amqblwK51CL0jn7IJl5VEO9NaSpQzRxs7oRkrdHh06OE6ZzmUWKZ2wKf
   bvQ4jGBXO4i6t0FcV4ElbS+tpoxHUfFhwxC0uHEk524Ark2E93JJ5NwgA
   iycemXejpydtnKy3pNOHB89QJND02C6YUvt5LY+mW+0ShfcxxZtx5d4XS
   JwOh3P9OIG3jO8sSJ3f1Uj/ku9bt8YaOL+g9agpeIq9EJ1H9mYm37MlNj
   u/36qqOgYFwlf0yX8p2/Ou77ue9q6TsLWja7eZlXEGfokJ8c0IJOgLgZN
   R3phC3XJaLdBYZHpt5tHiyU3AjyoRk5TV3ttOzALr+gOunwZmI/NxnxLV
   A==;
X-CSE-ConnectionGUID: OA8rhl5NQdCJ0LPPlsCQ6A==
X-CSE-MsgGUID: 2bmBcZkoTHSGpmyprPPH7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218933"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34218933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:51 -0700
X-CSE-ConnectionGUID: VE0a1kFVQkKbDhFTrHBt/w==
X-CSE-MsgGUID: p8MSDibSS+Shu+kAlIzg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63481829"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:12:45 -0700
Message-ID: <63b679c8-48f1-4251-8b7e-d38b605e5089@linux.intel.com>
Date: Fri, 30 Aug 2024 11:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 24/33] ALSA: usb-audio: Introduce USB SND platform op
 callbacks
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
 <20240829194105.1504814-25-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-25-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:40, Wesley Cheng wrote:
> Allow for different platforms to be notified on USB SND connect/disconnect
> sequences.  This allows for platform USB SND modules to properly initialize
> and populate internal structures with references to the USB SND chip
> device.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h | 10 +++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 1f9dfcd8f336..7f120aa006c0 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +/*
> + * Register platform specific operations that will be notified on events
> + * which occur in USB SND.  The platform driver can utilize this path to
> + * enable features, such as USB audio offloading, which allows for audio data
> + * to be queued by an audio DSP.
> + *
> + * Only one set of platform operations can be registered to USB SND.  The
> + * platform register operation is protected by the register_mutex.
> + */
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +	guard(mutex)(&register_mutex);
> +	if (platform_ops)
> +		return -EEXIST;
> +
> +	platform_ops = ops;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> +
> +/*
> + * Unregisters the current set of platform operations.  This allows for

Unregister?

> + * a new set to be registered if required.
> + *
> + * The platform unregister operation is protected by the register_mutex.
> + */
> +int snd_usb_unregister_platform_ops(void)
> +{
> +	guard(mutex)(&register_mutex);
> +	platform_ops = NULL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>  
>  /*
>   * Checks to see if requested audio profile, i.e sample rate, # of
> @@ -946,7 +982,11 @@ static int usb_audio_probe(struct usb_interface *intf,
>  	chip->num_interfaces++;
>  	usb_set_intfdata(intf, chip);
>  	atomic_dec(&chip->active);
> +
> +	if (platform_ops && platform_ops->connect_cb)
> +		platform_ops->connect_cb(chip);
>  	mutex_unlock(&register_mutex);
> +
>  	return 0;
>  
>   __error:
> @@ -983,6 +1023,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
>  	card = chip->card;
>  
>  	mutex_lock(&register_mutex);
> +	if (platform_ops && platform_ops->disconnect_cb)
> +		platform_ops->disconnect_cb(chip);
> +
>  	if (atomic_inc_return(&chip->shutdown) == 1) {
>  		struct snd_usb_stream *as;
>  		struct snd_usb_endpoint *ep;
> @@ -1130,6 +1173,11 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
>  		chip->system_suspend = chip->num_suspended_intf;
>  	}
>  
> +	mutex_lock(&register_mutex);
> +	if (platform_ops && platform_ops->suspend_cb)
> +		platform_ops->suspend_cb(intf, message);
> +	mutex_unlock(&register_mutex);
> +
>  	return 0;
>  }
>  
> @@ -1170,6 +1218,11 @@ static int usb_audio_resume(struct usb_interface *intf)
>  
>  	snd_usb_midi_v2_resume_all(chip);
>  
> +	mutex_lock(&register_mutex);
> +	if (platform_ops && platform_ops->resume_cb)
> +		platform_ops->resume_cb(intf);
> +	mutex_unlock(&register_mutex);
> +
>   out:
>  	if (chip->num_suspended_intf == chip->system_suspend) {
>  		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 4f4f3f39b7fa..23d9e6fc69e7 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -207,7 +207,17 @@ struct snd_usb_stream {
>  	struct list_head list;
>  };
>  
> +struct snd_usb_platform_ops {
> +	void (*connect_cb)(struct snd_usb_audio *chip);
> +	void (*disconnect_cb)(struct snd_usb_audio *chip);
> +	void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
> +	void (*resume_cb)(struct usb_interface *intf);
> +};


You're using the same mutex to protect all four callbacks, so how would
things work if e.g. you disconnected a device during the resume operation?


