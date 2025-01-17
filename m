Return-Path: <linux-input+bounces-9324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E48A146F2
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 01:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39BA43A7A69
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0142D25A620;
	Fri, 17 Jan 2025 00:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rX5nGKaZ"
X-Original-To: linux-input@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3A417E;
	Fri, 17 Jan 2025 00:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737072524; cv=none; b=POWLdTWlxTvN4BisefIWkpGJsLpYzLYYiluuN3ifUaV5NADd07NsuTBIj807M1YimuGe9ZUYLIaNkA7VKPZeXBQS8jrggyoRdZ9cqZrE4JRYFSJHwczqRpFZwOmuhAwYxUHUNuCYKrc1Kw2lHHBk7DrIRPW5Bcz9AlJ7gyeo0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737072524; c=relaxed/simple;
	bh=ksYVTRWxcEHcHZ0+srUSwUKDhqcqlo0TZkMejxJKSHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+7BoKNIIpvB70sy1tlNy1y/61a6SYwwm94347eHrn1xGCcCwGWujYN/J0sZz0v0u2W/tYCDbvqw8pY1BH+VSX7o0jPDbm8najfiG3BS4IFC6BL46Q+OgcieezLcXKOBg5QibA6Ktx5EhczXiTK9gM6REzvb8d6fpUsxVUr+jsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rX5nGKaZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=UYO3M403ia0fAhJeqoUBl093r6JxaO53iovKZf1FzmE=; b=rX5nGKaZ++Ewt+aBX/gLBQTjN+
	wRT9UN/kl2zNNwTn99/rXn/vjKvTVZvmh7T6wPPN6J3E4ZsNV5e8xoAXSab2hzPrQz4Pj+1iFNY8L
	wYTJMZNcNOCcjewa6UvuW1Z9ubFTcQ4avZz7IU1v4YX1iWifs0W9JwboWbVllrq8e3IqLTFQd4Dcv
	R8Asq0SrB1S2oeMyb+fZ2HN7co75buWgL09YV14YfsK2l6+IriYAGKS5FHNpkXHK2xq6xbbgVbqrg
	EUTnhan75+Bz91jTIa+kb9/M6ZFI4jBfiUhrHEkDPBgiETzPvhhA6s53iqeD/bqueshB680CanXbi
	a4NsvBPQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZub-00000004Tuu-34Hr;
	Fri, 17 Jan 2025 00:08:34 +0000
Message-ID: <9c266af7-b377-4f3e-8a6d-f7d4fa44d465@infradead.org>
Date: Thu, 16 Jan 2025 16:08:27 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v33 30/31] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.dev, Thinh.Nguyen@synopsys.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
 <20250116232824.3748438-31-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250116232824.3748438-31-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/16/25 3:28 PM, Wesley Cheng wrote:
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> and PCM index the USB device is mapped to for supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.
> 
> It is expected for the USB SND offloading driver to add the kcontrol to the
> sound card associated with the USB audio device.  An example output would
> look like:
> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> -1, -1 (range -1->255)
> 
> This example signifies that there is no mapped ASoC path available for the
> USB SND device.
> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> 0, 0 (range -1->255)
> 
> This example signifies that the offload path is available over ASoC sound
> card index#0 and PCM device#0.
> 
> The USB offload kcontrol will be added in addition to the existing
> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
> the USB audio device specific parameters are still valid and expected to be
> used.  These parameters are not mirrored to the ASoC subsystem.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/Kconfig                  |  10 ++
>  sound/usb/qcom/Makefile            |   4 +
>  sound/usb/qcom/mixer_usb_offload.c | 158 +++++++++++++++++++++++++++++
>  sound/usb/qcom/mixer_usb_offload.h |  17 ++++
>  sound/usb/qcom/qc_audio_offload.c  |   2 +
>  5 files changed, 191 insertions(+)
>  create mode 100644 sound/usb/qcom/mixer_usb_offload.c
>  create mode 100644 sound/usb/qcom/mixer_usb_offload.h
> 

> diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
> new file mode 100644
> index 000000000000..2696eb145ef5
> --- /dev/null
> +++ b/sound/usb/qcom/mixer_usb_offload.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/usb.h>
> +

[snip]

> +
> +/**
> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
> + * @chip - USB SND chip device

Use ':' instead of '-'.

> + *
> + * Creates a sound control for a USB audio device, so that applications can
> + * query for if there is an available USB audio offload path, and which
> + * card is managing it.
> + */
> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
> +{

-- 
~Randy


