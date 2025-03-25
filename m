Return-Path: <linux-input+bounces-11176-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8ADA6F447
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 12:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C11573AAA57
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 11:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D957E2561BD;
	Tue, 25 Mar 2025 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+r+GtQX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15A255E4E
	for <linux-input@vger.kernel.org>; Tue, 25 Mar 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902535; cv=none; b=IcLY4fqVNbUEimLWvutStWTbbB2uRDw/pdLkyqVXFdoXqCHIkQKL00euz8MgaZZJGpI8J+XjwSgpfIMYPYj3SNB93PcMyUraJsOPhuV76g1Z7hsrKMY5bBq1I6t5iPMie0gTX+uYe72nZtH6bJj5yTywf4eC13+vS5vHcmgTTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902535; c=relaxed/simple;
	bh=axTyly0sCljhfwwpNOgHFHjTCGh51MkgyOh1E0/Iq9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqOSZqDc5uvBnbFMlR3t7rnhi7bhhBNCSq3JrojlbgokbZZQ/w7fYo492a54l6YJHmuP6olEeFjF4vepnEagArmS3jBoH6TGbhZl6pY6848gKn/pHFjdO7sH6R6FXpafv96WDPImkfOwx6ln7j9qb5A9Aegs2Psnp7jt6c/yvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+r+GtQX; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso7993787a12.0
        for <linux-input@vger.kernel.org>; Tue, 25 Mar 2025 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902532; x=1743507332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ona5OctVpUFMXPABaOF+C6CD5ocYKvVWSnGYTcvi3Ao=;
        b=h+r+GtQXpnstt+dpx91SPRhxJK+ciZQbkP/kAR/PPsE8hEIhQ0ZpdykjVXTcItvQCI
         wUJmlUs0ePLMrv1a3IfCn0DNwBhrA7w77wVIMXxdv2oVYkBt02TL0QYkDUZh4tGG1Pb8
         71P2ZYp2wamyXKTNYf0MWC3pPYEIRHhi3WPcsXrS8eEr0pUT+iRfDHuQioLRFtB8vylJ
         4JA7Nfnj3zNfv9+Q/IW61CoPeZEi/JAJQjU8nQ/jIxsM5E5LDcyQj2t7iLKwDUSCV82U
         mXFWxL7YC7p9yapECODixfe2Jic1x72RpS0swBCpQylapWHWFWCU72fuBXkabYSw2R6y
         ngoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902532; x=1743507332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ona5OctVpUFMXPABaOF+C6CD5ocYKvVWSnGYTcvi3Ao=;
        b=l5ZNGxPBK7hUlf45Y4d7ATQ7Pihnbw2E1rgVvvzCRcVZkNiA/6Vgzmv4ZDG6Ub7Jm/
         //XdVIcINpeN9ZeejQ3NSJDQip+qGm0z9jcC3pNKJn0q7LO4F4j+NedQd2nl5NxAMooL
         fd/x8r3jo9CSug3+qy/3Eo+b0nAzK83nYzcRbB8bGRQ9ipMaRCg1XdH6RHXTQBJGFFnO
         Wp8gxBSMzl60fDgsSE3y5zBNUgM5An6y3Q9A08s2cw8aA1wnLOPw/f4k7+CSzZGgb4bZ
         04i1+styWB5ABi1I0wquslP9ajqXr3YUJELsYoYRyVYV4fS4m2v5o+ORWW2caCDvvklA
         d2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL4mhkSn5s6oIT0iiX40Dw5W2sp7PPLsAWBfw8zbRXOAuZTX91g0KV0Nh2hj5QfkfA2vETdAjTGWgvNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWBrtCqB15X2Ve6ty2MhR4mpl/fLpj5rezevhsiys7vvJIhyLe
	o6gbgJ9GK8SBpsblKeMQIh+tFtFsrw7Evmsc2ubLtUhCTaQP8qZtkIfmsF/weFM=
X-Gm-Gg: ASbGncvGIDoRnoTglLs0tWasWVAtFYUULpZ+/GosQxRR1Vz3t3kAewaWSjJRVl38Kfn
	Ytw/SK4MsWXRFvfWCWCLlYReOmLJ2pRw61TLTXsKFjX3/ztobzbovIY05tGKOydIIGaGSi84yv8
	4Mwbg5OiqAkgLMbcpMEFYBMBjfJ1Sl/0AuYyhI/ayT1HYZnPOkR4EtmNDCuobjHe6VMarAPSNve
	cLF8RghDU20z6w93+MecHLmVPETEPyrv6r1rNklftu78Co+jt1Oh4277nF78MzIa0iw5PC/VCOP
	r/2xekBBIDS67QYXit4OXxyRrXa5VYyLe/N9NBLDT3v6t3awnSqQxz8=
X-Google-Smtp-Source: AGHT+IFKpEsb4p3LWlHWOKvoJwQ3AF5kC9F/GUq8MdsIh3ud5GODZ+3OVezWTIFKtb7E9DO2qBLkNg==
X-Received: by 2002:a17:906:c144:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-ac3f2117cb7mr1775900066b.15.1742902531711;
        Tue, 25 Mar 2025 04:35:31 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:f88a:e8d5:82b:cbb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64b06sm848323766b.94.2025.03.25.04.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:35:31 -0700 (PDT)
Date: Tue, 25 Mar 2025 12:35:26 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v36 30/31] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
Message-ID: <Z-KU_o_LE3PO6J2y@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-31-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319005141.312805-31-quic_wcheng@quicinc.com>

On Tue, Mar 18, 2025 at 05:51:40PM -0700, Wesley Cheng wrote:
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
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 6daa551738da..7d8833945711 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -176,9 +176,19 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config SND_USB_QC_OFFLOAD_MIXER
> +	tristate "Qualcomm USB Audio Offload mixer control"

This looks like a "bool" and not a "tristate", since the ifneq in the
Makefile below ignores whether this is a "y" or "m".

> +	help
> +	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
> +	 This exposes an USB offload capable kcontrol to signal to
> +	 applications about which platform sound card can support USB
> +	 audio offload.  The returning values specify the mapped ASoC card
> +	 and PCM device the USB audio device is associated to.
> +
>  config SND_USB_AUDIO_QMI
>  	tristate "Qualcomm Audio Offload driver"
>  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
> +	select SND_USB_OFFLOAD_MIXER

And I think "SND_USB_OFFLOAD_MIXER" (without _QC suffix) doesn't exist
anymore after v30? I see there was some discussion around that there.
Is this supposed to be "select SND_USB_QC_OFFLOAD_MIXER"?

If yes, isn't this option always selected if SND_USB_AUDIO_QMI is
enabled? In that case you could just drop the config option...

>  	help
>  	  Say Y here to enable the Qualcomm USB audio offloading feature.
>  
> diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
> index 1eb51160e2e5..1efe1b90be7a 100644
> --- a/sound/usb/qcom/Makefile
> +++ b/sound/usb/qcom/Makefile
> @@ -1,2 +1,6 @@
>  snd-usb-audio-qmi-y := usb_audio_qmi_v01.o qc_audio_offload.o
>  obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
> +
> +ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
> +snd-usb-audio-qmi-y += mixer_usb_offload.o
> +endif

Thanks,
Stephan

