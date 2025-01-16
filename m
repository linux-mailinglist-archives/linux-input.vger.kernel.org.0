Return-Path: <linux-input+bounces-9322-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07190A146CD
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 175EE7A10AA
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB7C1482E8;
	Thu, 16 Jan 2025 23:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gJgDXXZU"
X-Original-To: linux-input@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCE725A627;
	Thu, 16 Jan 2025 23:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737071455; cv=none; b=NgxGf9HVhABToOaxoQEgAZWeROxMUQUaypHgHuqDvw9toa0lk9X4oUdJK/9n6guqC1b5vvdOLiPjKm3Mx/D4FAcwWHqEXNNfGWWoiH2qEEErpFEstto7Rls0vjTAj6O9U7uWoq0Ol74ej5Hcoi61eFOdq7W21pKQQNgsbYj0BtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737071455; c=relaxed/simple;
	bh=hntKlccZ0+vTTnbH4nYBuRl8J8JBvhj6Txfzb7AmzFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUc1PxoACnENrfObYg80FHdQfvo97n6ywy3ApGuChHDIQtF5kz5ZrLUHOQI3ELcz+FhkMrar9AFeLDK+ZVV2EMPB0/1gwR32jurQDUP8Qr3UCmFWIGM44copERSc2wRxjqToqZTCDmz/kg5nEG3UbvmwsicXrd1Up9jRM9dZdX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gJgDXXZU; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=h1euKZsqlyA9o+zLDbUkPmhPu6QJIkwhOh4RkeH8xqM=; b=gJgDXXZU2lFrY9x/47l2GXd3Lt
	XYeSnqIelBUb1ejrn2Z2xrb8df4a23k+wBCJoUFNEF+vgMRkjcaO9zQ1AP/Pgd4sbP1M/Kb31BPoJ
	itxUEK3cU/e+48ekmb1x4iJdFOJ5PtyUUr84/jlgpzK9Ies+JiFQUrbWvEfTO5xklv+R+AtBogsrO
	twHuhLvm+fPGTBUWvXQcx2Fd2xI4OopCTEYq0eGl+bxJewxCI6HjeVBGXBHckkdHC3/xpdpRhwqKt
	TrCg3+iH1yKgWAaJLjMroyy5mTsSBf5envZilJAHpS6fP5aWQ3Ujg+PHf4baabwXrSUNBTSEd+ja1
	vzLzBDjA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZdM-00000004HMh-2Kwa;
	Thu, 16 Jan 2025 23:50:44 +0000
Message-ID: <b7cc0405-afda-4d88-ba8d-f0222220a272@infradead.org>
Date: Thu, 16 Jan 2025 15:50:38 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v33 14/31] ASoC: Add SoC USB APIs for adding an USB
 backend
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
 <20250116232824.3748438-15-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250116232824.3748438-15-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

There are a few kernel-doc problems here (see below).

On 1/16/25 3:28 PM, Wesley Cheng wrote:
> Some platforms may have support for offloading USB audio devices to a
> dedicated audio DSP.  Introduce a set of APIs that allow for management of
> USB sound card and PCM devices enumerated by the USB SND class driver.
> This allows for the ASoC components to be aware of what USB devices are
> available for offloading.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/soc-usb.h |  97 ++++++++++++++++++
>  sound/soc/Kconfig       |  10 ++
>  sound/soc/Makefile      |   2 +
>  sound/soc/soc-usb.c     | 220 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 329 insertions(+)
>  create mode 100644 include/sound/soc-usb.h
>  create mode 100644 sound/soc/soc-usb.c
> 
> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> new file mode 100644
> index 000000000000..bd4c5632bb62
> --- /dev/null
> +++ b/include/sound/soc-usb.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __LINUX_SND_SOC_USB_H
> +#define __LINUX_SND_SOC_USB_H
> +
> +#include <sound/soc.h>
> +
> +/**
> + * struct snd_soc_usb_device

    * struct snd_soc_usb_device - <some short description of what this is>

Same comment applies to other structs below.

> + * @card_idx - sound card index associated with USB device
> + * @chip_idx - USB sound chip array index
> + * @cpcm_idx - capture PCM index array associated with USB device
> + * @ppcm_idx - playback PCM index array associated with USB device
> + * @num_capture - number of capture streams
> + * @num_playback - number of playback streams
> + * @list - list head for SoC USB devices

All of the struct members/fields above should be separated from their
description with a ':', not a '-'.

Same comment applies to other structs below.

> + **/
> +struct snd_soc_usb_device {
> +	int card_idx;
> +	int chip_idx;
> +
> +	/* PCM index arrays */
> +	unsigned int *cpcm_idx; /* TODO: capture path is not tested yet */
> +	unsigned int *ppcm_idx;
> +	int num_capture; /* TODO: capture path is not tested yet */
> +	int num_playback;
> +
> +	struct list_head list;
> +};
> +
> +/**
> + * struct snd_soc_usb
> + * @list - list head for SND SOC struct list
> + * @component - reference to ASoC component
> + * @connection_status_cb - callback to notify connection events
> + * @priv_data - driver data
> + **/
> +struct snd_soc_usb {
> +	struct list_head list;
> +	struct snd_soc_component *component;
> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
> +				    struct snd_soc_usb_device *sdev,
> +				    bool connected);
> +	void *priv_data;
> +};
> +


> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> new file mode 100644
> index 000000000000..3b8e47e3f469
> --- /dev/null
> +++ b/sound/soc/soc-usb.c
> @@ -0,0 +1,220 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include <linux/of.h>
> +#include <linux/usb.h>
> +#include <sound/soc-usb.h>
> +#include "../usb/card.h"
> +
> +static DEFINE_MUTEX(ctx_mutex);
> +static LIST_HEAD(usb_ctx_list);
> +

[snip]

> +/**
> + * snd_soc_usb_allocate_port() - allocate a SoC USB port for offloading support
> + * @component: USB DPCM backend DAI component
> + * @num_streams: number of offloading sessions supported

There is no num_streams function parameter.

> + * @data: private data
> + *
> + * Allocate and initialize a SoC USB port.  The SoC USB port is used to communicate
> + * different USB audio devices attached, in order to start audio offloading handled
> + * by an ASoC entity.  USB device plug in/out events are signaled with a
> + * notification, but don't directly impact the memory allocated for the SoC USB
> + * port.
> + *
> + */
> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
> +					      void *data)
> +{
> +	struct snd_soc_usb *usb;
> +
> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
> +	if (!usb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	usb->component = component;
> +	usb->priv_data = data;
> +
> +	return usb;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
> +


-- 
~Randy


