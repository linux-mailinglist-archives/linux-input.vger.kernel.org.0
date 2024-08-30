Return-Path: <linux-input+bounces-6016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12598965EC4
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 12:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD15228C7B3
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 10:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4103C192D66;
	Fri, 30 Aug 2024 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXZyuVjL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69D1B81CA;
	Fri, 30 Aug 2024 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012814; cv=none; b=D3l0L7fLsVVRRASCtnr4a0/SFN6nuJOJnyWfNvkk6NLY7YtK2t5vAGfg0l3inzH3i2ibB2hejib0zSnvdfumehM/ipzayYoAqE39tTC8KHXnXJjeujrUlCBsd8IyQElWOd7LcvGJeTspzTe8blMLRZz2pqBWOmOTG650Jdg5pIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012814; c=relaxed/simple;
	bh=dQXMhFDkjliFhmplZpCGpyMLGcjFXo2Jfh64aGjcXMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDs7DqhEa56rZghML64nsNSzhQeTQTOghGpZsURabk/sVuqZuYdp+nDQ1aCF/+Ojk8e7/S4FB56iJNd6wPP+YiypZSbBdwLRA8hqzg+ucpZIuP7B9tH4KT3w9vf7j+2KUm8wXlXXSsl8YXGg8v6W8E6LqzqkrGUiEXyrwSsfEuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXZyuVjL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012813; x=1756548813;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dQXMhFDkjliFhmplZpCGpyMLGcjFXo2Jfh64aGjcXMw=;
  b=kXZyuVjLmPwTgZ9wavnuwsXI8E04akYpYiK3V38xP92XJ3FAxgBl9Ml7
   crWAlMctIkVI1+9qFoxNYzfoaUwiqnCKSxrbmc4NN4KgdXvBt5ML4k9Ov
   PuIGh5OntWTBAMhYwVXIp79uWwUDmhVPiuvmoDQZjbUtxhs+YPaQYO0y7
   4YoQ1L/CSnWb9Go3qL9AJw1J6eCmLVsu6ViSXvPBY0PRJqe8uUuR03EON
   0TDhB8JK2+kRwTG/0GcjOoXwOB4iotN3pHm2KTDvNUEWzyNpPzXaqRGFf
   HtgF6b8carAiQfWZ+HEffsMK6O1b9hGnUHBT8TheejpLTMxh3Hmstcm3z
   Q==;
X-CSE-ConnectionGUID: Nfj1Ifa8S6mdOdFO5iMZdA==
X-CSE-MsgGUID: pX50qCKLQgW/ro4x2J813A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526439"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="27526439"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:13:33 -0700
X-CSE-ConnectionGUID: jZv7umMAQTa+WZQnioMLSw==
X-CSE-MsgGUID: TeO4kTqySN6J2+ljLQaQ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68013163"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101]) ([10.245.246.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:13:26 -0700
Message-ID: <b682bd8f-2743-42cf-b51f-1444faf4635f@linux.intel.com>
Date: Fri, 30 Aug 2024 12:05:58 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 31/33] ALSA: usb-audio: Add USB offload route kcontrol
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
 <20240829194105.1504814-32-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-32-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/29/24 21:41, Wesley Cheng wrote:
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> and PCM index the USB device is mapped to for supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.
> 
> It is expected for the USB SND offloading driver to add the kcontrol to the
> sound card associated with the USB audio device.  An example output would
> look like:

this is very odd, the offloading driver adds a control to another card?

That seems like a rather important layering violation.

I thought it was done the other way, the USB audio card created a
control that would point to the other card/device.


> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> -1, -1 (range -1->255)
> 
> This example signifies that there is no mapped ASoC path available for the
> USB SND device.

but that control would not even exist if the ASoC-based driver isn't probed.

It's become really hard to follow, I've been on all this for 1.5hrs and
losing track of the design.

> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> 0, 0 (range -1->255)
> 
> This example signifies that the offload path is available over ASoC sound
> card index#0 and PCM device#0.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/Kconfig                 |  10 +++
>  sound/usb/Makefile                |   2 +
>  sound/usb/mixer_usb_offload.c     | 102 ++++++++++++++++++++++++++++++
>  sound/usb/mixer_usb_offload.h     |  17 +++++
>  sound/usb/qcom/Makefile           |   2 +-
>  sound/usb/qcom/qc_audio_offload.c |   2 +
>  6 files changed, 134 insertions(+), 1 deletion(-)
>  create mode 100644 sound/usb/mixer_usb_offload.c
>  create mode 100644 sound/usb/mixer_usb_offload.h
> 
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 5cc3eaf53e6b..e3fbf9541d0b 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -176,10 +176,20 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config SND_USB_OFFLOAD_MIXER
> +	tristate "USB Audio Offload mixer control"
> +	help
> +	 Say Y to enable the USB audio offloading mixer controls.  This
> +	 exposes an USB offload capable kcontrol to signal to applications
> +	 about which platform sound card can support USB audio offload.
> +	 The returning values specify the mapped ASoC card and PCM device
> +	 the USB audio device is associated to.
> +
>  config SND_USB_AUDIO_QMI
>  	tristate "Qualcomm Audio Offload driver"
>  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
>  	select SND_PCM
> +	select SND_USB_OFFLOAD_MIXER
>  	help
>  	  Say Y here to enable the Qualcomm USB audio offloading feature.
>  
> diff --git a/sound/usb/Makefile b/sound/usb/Makefile
> index 54a06a2f73ca..2f19f854944c 100644
> --- a/sound/usb/Makefile
> +++ b/sound/usb/Makefile
> @@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
>  
>  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
>  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
> +
> +obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
> diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
> new file mode 100644
> index 000000000000..16e2fd634684
> --- /dev/null
> +++ b/sound/usb/mixer_usb_offload.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/usb.h>
> +
> +#include <sound/core.h>
> +#include <sound/control.h>
> +#include <sound/soc-usb.h>
> +
> +#include "usbaudio.h"
> +#include "card.h"
> +#include "helper.h"
> +#include "mixer.h"
> +
> +#include "mixer_usb_offload.h"
> +
> +#define PCM_IDX(n)  ((n) & 0xffff)
> +#define CARD_IDX(n) ((n) >> 16)
> +
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
> +
> +	return 0;
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
> +EXPORT_SYMBOL_GPL(snd_usb_offload_create_ctl);
> diff --git a/sound/usb/mixer_usb_offload.h b/sound/usb/mixer_usb_offload.h
> new file mode 100644
> index 000000000000..3f6e2a8b19c8
> --- /dev/null
> +++ b/sound/usb/mixer_usb_offload.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __USB_OFFLOAD_MIXER_H
> +#define __USB_OFFLOAD_MIXER_H
> +
> +#if IS_ENABLED(CONFIG_SND_USB_OFFLOAD_MIXER)
> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip);
> +#else
> +static inline int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
> +{
> +	return 0;
> +}
> +#endif
> +#endif /* __USB_OFFLOAD_MIXER_H */
> diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
> index a81c9b28d484..4005e8391ab9 100644
> --- a/sound/usb/qcom/Makefile
> +++ b/sound/usb/qcom/Makefile
> @@ -1,2 +1,2 @@
>  snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
> -obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
> \ No newline at end of file
> +obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index a7ad15404fd1..5b9262a116be 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -36,6 +36,7 @@
>  #include "../helper.h"
>  #include "../pcm.h"
>  #include "../power.h"
> +#include "../mixer_usb_offload.h"
>  
>  #include "usb_audio_qmi_v01.h"
>  
> @@ -1703,6 +1704,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>  		sdev->card_idx = chip->card->number;
>  		sdev->chip_idx = chip->index;
>  
> +		snd_usb_offload_create_ctl(chip);
>  		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
>  	}
>  


