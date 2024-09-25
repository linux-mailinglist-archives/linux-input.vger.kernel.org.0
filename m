Return-Path: <linux-input+bounces-6713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE198635F
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 17:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 789C31F2784E
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D151714CC;
	Wed, 25 Sep 2024 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV/dEyYi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0416DEDF;
	Wed, 25 Sep 2024 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276727; cv=none; b=UCUqzPdzRLQY8R1yUG0+RoHaWvgISE4CFZpt6EWhqLmjdsRfV0Zf72p8MEGCniJPf3yvryLSTY+B1mt8i//Hu91BL7XuCw1lXKznVtjkNjZHYFUTZGu0MB1Vw02My8NlA1RXVXZQC9t5V7xlCyaBB/2pO25gUFrH8SPdh0JSvDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276727; c=relaxed/simple;
	bh=LTFovhotCR3F0gjdRFbbOMrUPSlsAH2Mi6k1oPhssn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwLQGKhzmFDiZCEYOFszKA2iysb2DrWh1nMqY68/cvYapmY/kbPd5ZFbh8SWrcYYsNV+AbbP3/ylTKBQoGbcUiNJ3qY04CWf8SkgEtqMdzX/pS2wKrnzp/jvravR1Sk/qOJ40novOJWHnudjE7c0q9mFzKQVvWg2eNjnMjdEXxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV/dEyYi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276726; x=1758812726;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LTFovhotCR3F0gjdRFbbOMrUPSlsAH2Mi6k1oPhssn0=;
  b=lV/dEyYibagIHuQvOXg5M78AV3oH9/1pbaF41/rpAG1o4xfXp5Yf9vC9
   NdLP3PtytXUqiqbZMd5NGh3zxm1sg4a0H9ruJYXJC8OAtIGLWWwRvuwky
   DST+0k8NlEABCcGRsyscQve21QpYNt03z79P6KForVrF7cyFQmKS91TsL
   spWWGTkhkwkAHBfWMYowWbNZiLItv2ReDTUTu74688YrmNYbLM4S6QBRc
   WHt4aOiQ/d13QZae+tUReW5UDS7xQI8HL6wpitYKWrpDbQfuHnCgL/N54
   7uEt/7LlRaiGcTqyfE3D+be+UNuVXECahP92qlOXGBeKuyibxvoGesaAI
   w==;
X-CSE-ConnectionGUID: BApjExqiTim3RzQByOk0ww==
X-CSE-MsgGUID: iDKTPwRRQ865FqjgcAKOpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482948"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="26482948"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:25 -0700
X-CSE-ConnectionGUID: uBmKSm89TSiRGkjsbpUpYg==
X-CSE-MsgGUID: ELGXt5SjQ5GvFpL3sot2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="76317739"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30]) ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:05:20 -0700
Message-ID: <8bb65adc-e995-443e-80c9-36e9b5d8eee3@linux.intel.com>
Date: Wed, 25 Sep 2024 16:54:28 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 30/32] ALSA: usb-audio: Add USB offload route kcontrol
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
 <20240925010000.2231406-31-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-31-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




> +static int
> +snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
> +			  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
> +	int ret;
> +
> +	ret = snd_soc_usb_update_offload_route(sysdev,
> +					       CARD_IDX(kcontrol->private_value),
> +					       PCM_IDX(kcontrol->private_value),
> +					       SNDRV_PCM_STREAM_PLAYBACK,
> +					       ucontrol->value.integer.value);
> +	if (ret < 0) {
> +		ucontrol->value.integer.value[0] = -1;
> +		ucontrol->value.integer.value[1] = -1;
> +	}

well this invalidates again what I understood from the last patch and
goes back to what I understood initially: the error code is never
returned to higher levels - when offload is not supported the kcontrol
values are encoded to the -1 magic value.

> +	return 0;

and this begs the question if this helper should return a void value.

> +}
> +
> +static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 2;
> +	uinfo->value.integer.min = -1;
> +	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
> +	uinfo->value.integer.max = 0xff;
> +
> +	return 0;
> +}
> +
> +static struct snd_kcontrol_new snd_usb_offload_mapped_ctl = {
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.access = SNDRV_CTL_ELEM_ACCESS_READ,
> +	.info = snd_usb_offload_route_info,
> +	.get = snd_usb_offload_route_get,
> +};
> +
> +/**
> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
> + * @chip - USB SND chip device
> + *
> + * Creates a sound control for a USB audio device, so that applications can
> + * query for if there is an available USB audio offload path, and which
> + * card is managing it.
> + */
> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
> +{
> +	struct usb_device *udev = chip->dev;
> +	struct snd_kcontrol_new *chip_kctl;
> +	struct snd_usb_substream *subs;
> +	struct snd_usb_stream *as;
> +	char ctl_name[37];

that's quite a magic value.

> +	int ret;
> +
> +	list_for_each_entry(as, &chip->pcm_list, list) {
> +		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
> +		if (!subs->ep_num)
> +			continue;
> +
> +		chip_kctl = &snd_usb_offload_mapped_ctl;
> +		chip_kctl->count = 1;
> +		/*
> +		 * Store the associated USB SND card number and PCM index for
> +		 * the kctl.
> +		 */
> +		chip_kctl->private_value = as->pcm_index |
> +					  chip->card->number << 16;
> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
> +			as->pcm_index);
> +		chip_kctl->name = ctl_name;
> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
> +				  udev->bus->sysdev));
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	return ret;
> +}

