Return-Path: <linux-input+bounces-10009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90520A33BC1
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 10:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F9401674EB
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 09:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F662210F45;
	Thu, 13 Feb 2025 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YanKuDTp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9C20DD5C
	for <linux-input@vger.kernel.org>; Thu, 13 Feb 2025 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739440647; cv=none; b=kZNpbQQV3curW4+KOkkb0zVW7BOPufT+X5brihBHSBO49KFxxobfyc9hNPNDziBu/LG3G979Qqu+OK4uAJBtlD2+Q1YhS56zSqcI5imDeFo4JFUqfk+3yEVtx5NUDdyPwD3n2QQkqX/7JT/pujAHIqJYfz/yLIbMvnZykMeOnes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739440647; c=relaxed/simple;
	bh=UGc9ObOcc9fiqV8aJE7rZhVXFHRLNN9VsFOqM6VnTkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzPNLKVTt/YVG+DGVmRcnpC8Pzm5rG0wf2xx1T8Pi+FlpwLoxAqDAz1zMm1dwBWfjYGMd9kpiuiO3WuLJdmbrS4iHduie7jxlGmp3unuAJypBu7YNYIIqXLsjB1ASH/1K7Bw8NX921tIBLJjYtvl8Tunr4413WFk1RAY/6+w1ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YanKuDTp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaec61d0f65so169935466b.1
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2025 01:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739440643; x=1740045443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7dDnkFZgua1UqBGscNggAFQGfuNxy2VOU9Ws/6e96UA=;
        b=YanKuDTpXT3WAR1fj0mZuuN8ORjEWwcfELM+8E4+pWYvwttnShGQc2MbdMXlXrpSXJ
         D7SUlnf7oUPAQqgAdmPRyM+GOSojFQBiHHvzVi0uHOpDnhLOc/y6jkt0LhkrsQrk1NKl
         Q7loB54Fd274jpK+c5YGLIGrEnzZhgRZUCQVtY5l5kketTVDZmPCemdtFWfAyGsRPhYN
         kXw4Aij9CI/utHfSDpvdtt4r+TKD3gNFmOpm/Jdg6wJCngyYQIIy8QJtckGoXPBnMkH9
         prNebnEdwYfaRkbMPpPjRnQbzwR/D+Y1xf8PWnBWmAmgMZmlnBeZHhXGnmaNlAFeUTCJ
         rEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440643; x=1740045443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dDnkFZgua1UqBGscNggAFQGfuNxy2VOU9Ws/6e96UA=;
        b=PW0u4cDXgIIiCWWanx1rqGnEXZ4/0oId/HOWau+rk6bJo/xiNuRC68E5kl9ocbRGvJ
         6s0Q+89tQw3sbFvwrgenFGc7NYqxpSPGpUyh+IdpUKaodylrt/SHq9HM7jE8wrzR0jQt
         XRIHbF3bndt7bE7FReqB1BpWxCG5hWjLumjD+ozc8Ved/kXRDdEIXZG+d8ycc1426XGD
         m3QoBeVTKjJvIXN6MASrdu8yYiT8x/plzxSvQLVfAqP3zrwfaOFnzD8psBtv08FL9qH5
         6ymZhPj12SskvNntQAX/oBm8Ui5tCMHVvO+B58iz+AYNbGY9ig1TvpNTTJep4KHgdX7N
         RuTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEy/j5OSwZLRK1S8IdUss8H6VjIERF5Fdxkpudr8TirwezirhWXUXSixi0kzFPVRBR0XbajgIRS16UhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlf1hruprbTB82kch94jnzwvxgzzxkpP5AlRxWLIYGfTkWz4ZU
	GV3c6BjW2SaJz0aANsW23mY1hKYMY7Ia0Wzxd1RVKf02JUcDdq1Nn+NssvoqibU=
X-Gm-Gg: ASbGncvtap6CaL+ojI7weiftp5zWCu4da8yNQUgujymDkpx6p5t+AmyDe9/Rz53DRku
	lRSi7aedEIyVVQsX3Pmw2qYYyrPOn9KJCVXBl88B9Y8bklIM6GL9hLMx4eAdTTtFqPXHvFDYpye
	UkrLYC9YZ/N5jQPVNC2mawdZfJG+6VBO/P49GlgUrQpsz/D7pGoiltXnkaPzWRJEvs5XOtRzrX5
	ccUfGcAJisZ0Nm31CJ1UIILHZ6/H972RnMweXnP9NouWEbHnuaTYsYi7IyztxoliKUppok0zgA7
	uZ0bK+bcjnsbyHH0hJu3Xyo9
X-Google-Smtp-Source: AGHT+IGADwhh1icVC7s+gezl0zQBAJHdG1XGHb5ZLRS19iiprTI4XevZdOeG/8A3plTf3PiJD+eKew==
X-Received: by 2002:a17:907:3d8e:b0:ab7:7c58:7bd0 with SMTP id a640c23a62f3a-aba4eb88d83mr293589766b.10.1739440643187;
        Thu, 13 Feb 2025 01:57:23 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:546e:a2d:e86:b3d6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532580e1sm97477466b.46.2025.02.13.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:57:22 -0800 (PST)
Date: Thu, 13 Feb 2025 10:57:17 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com, robh@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v34 00/31] Introduce QC USB SND audio offloading support
Message-ID: <Z63B_UE61OdrgEJY@linaro.org>
References: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121210518.2436771-1-quic_wcheng@quicinc.com>

On Tue, Jan 21, 2025 at 01:04:47PM -0800, Wesley Cheng wrote:
> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> 
> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes.
> There are several parts to this design:
>   1. Adding ASoC binding layer
>   2. Create a USB backend for Q6DSP
>   3. Introduce XHCI interrupter support
>   4. Create vendor ops for the USB SND driver
> 
>       USB                          |            ASoC
> --------------------------------------------------------------------
>                                    |  _________________________
>                                    | |sm8250 platform card     |
>                                    | |_________________________|
>                                    |         |           |
>                                    |      ___V____   ____V____
>                                    |     |Q6USB   | |Q6AFE    |  
>                                    |     |"codec" | |"cpu"    |
>                                    |     |________| |_________|
>                                    |         ^  ^        ^
>                                    |         |  |________|
>                                    |      ___V____    |
>                                    |     |SOC-USB |   |
>    ________       ________               |        |   |
>   |USB SND |<--->|QC offld|<------------>|________|   |
>   |(card.c)|     |        |<----------                |
>   |________|     |________|___     | |                |
>       ^               ^       |    | |    ____________V_________
>       |               |       |    | |   |APR/GLINK             |
>    __ V_______________V_____  |    | |   |______________________|
>   |USB SND (endpoint.c)     | |    | |              ^
>   |_________________________| |    | |              |
>               ^               |    | |   ___________V___________
>               |               |    | |->|audio DSP              |
>    ___________V_____________  |    |    |_______________________|
>   |XHCI HCD                 |<-    |
>   |_________________________|      |
> 
> 
> Adding ASoC binding layer
> =========================
> soc-usb: Intention is to treat a USB port similar to a headphone jack.
> The port is always present on the device, but cable/pin status can be
> enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
> communicate with USB SND.
> 
> Create a USB backend for Q6DSP
> ==============================
> q6usb: Basic backend driver that will be responsible for maintaining the
> resources needed to initiate a playback stream using the Q6DSP.  Will
> be the entity that checks to make sure the connected USB audio device
> supports the requested PCM format.  If it does not, the PCM open call will
> fail, and userspace ALSA can take action accordingly.
> 
> Introduce XHCI interrupter support
> ==================================
> XHCI HCD supports multiple interrupters, which allows for events to be routed
> to different event rings.  This is determined by "Interrupter Target" field
> specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.
> 
> Events in the offloading case will be routed to an event ring that is assigned
> to the audio DSP.
> 
> Create vendor ops for the USB SND driver
> ========================================
> qc_audio_offload: This particular driver has several components associated
> with it:
> - QMI stream request handler
> - XHCI interrupter and resource management
> - audio DSP memory management
> 
> When the audio DSP wants to enable a playback stream, the request is first
> received by the ASoC platform sound card.  Depending on the selected route,
> ASoC will bring up the individual DAIs in the path.  The Q6USB backend DAI
> will send an AFE port start command (with enabling the USB playback path), and
> the audio DSP will handle the request accordingly.
> 
> Part of the AFE USB port start handling will have an exchange of control
> messages using the QMI protocol.  The qc_audio_offload driver will populate the
> buffer information:
> - Event ring base address
> - EP transfer ring base address
> 
> and pass it along to the audio DSP.  All endpoint management will now be handed
> over to the DSP, and the main processor is not involved in transfers.
> 
> Overall, implementing this feature will still expose separate sound card and PCM
> devices for both the platform card and USB audio device:
>  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>                       SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>  1 [Audio          ]: USB-Audio - USB Audio
>                       Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed
> 
> This is to ensure that userspace ALSA entities can decide which route to take
> when executing the audio playback.  In the above, if card#1 is selected, then
> USB audio data will take the legacy path over the USB PCM drivers, etc...
> 
> The current limitation is that the latest USB audio device that is identified
> will be automatically selected by the Q6USB BE DAI for offloading.  Future
> patches can be added to possibly add for more flexibility, but until the userpace
> applications can be better defined, having these mechanisms will complicate the
> overall implementation.
> 
> USB offload Kcontrols
> =====================
> Part of the vendor offload package will have a mixer driver associated with it
> (mixer_usb_offload.c).  This entity will be responsible for coordinating with
> SOC USB and the Q6USB backend DAI to fetch information about the sound card
> and PCM device indices associated with the offload path.  The logic is done
> based on the current implementation of how paths are controlled within the QC
> ASoC implementation.
> 
> QC ASoC Q6Routing
> -----------------
> Within the Q6 ASOC design, the registered ASoC platform card will expose a set
> of kcontrols for enabling the BE DAI links to the FE DAI link.  For example:
> 
> tinymix -D 0 contents
> Number of controls: 1033
> ctl     type    num     name                                    value
> ...
> 1025    BOOL    1       USB Mixer MultiMedia1                   Off
> 1026    BOOL    1       USB Mixer MultiMedia2                   Off
> 1027    BOOL    1       USB Mixer MultiMedia3                   Off
> 1028    BOOL    1       USB Mixer MultiMedia4                   Off
> 1029    BOOL    1       USB Mixer MultiMedia5                   Off
> 1030    BOOL    1       USB Mixer MultiMedia6                   Off
> 1031    BOOL    1       USB Mixer MultiMedia7                   Off
> 1032    BOOL    1       USB Mixer MultiMedia8                   Off
> 
> Each of these kcontrols will enable the USB BE DAI link (q6usb) to be connected
> to a FE DAI link (q6asm).  Since each of these controls are DAPM widgets, when
> it is enabled, the DAPM widget's "connect" flag is updated accordingly.
> 
> USB Offload Mapping
> -------------------
> Based on the Q6routing, the USB BE DAI link can determine which sound card and
> PCM device is enabled for offloading.  Fetching the ASoC platform sound card's
> information is fairly straightforward, and the bulk of the work goes to finding
> the corresponding PCM device index.  As mentioned above, the USB BE DAI can
> traverse the DAPM widgets to find the DAPM path that is related to the control
> for the "USB Mixer."  Based on which "USB Mixer" is enabled, it can find the
> corresponding DAPM widget associated w/ the FE DAI link (Multimedia*).  From there
> it can find the PCM device created for the Multimedia* stream.
> 
> Only one BE DAI link can be enabled per FE DAI.  For example, if the HDMI path is
> enabled for Multimedia1, the USB Mixer will be disabled and switched over.
> 
> Examples of kcontrol
> --------------------
> tinymix -D 0 contents
> Number of controls: 1033
> ctl     type    num     name 
> ...
> 1025    BOOL    1       USB Mixer MultiMedia1                   Off
> 1026    BOOL    1       USB Mixer MultiMedia2                   On
> 1027    BOOL    1       USB Mixer MultiMedia3                   Off
> 1028    BOOL    1       USB Mixer MultiMedia4                   Off
> 1029    BOOL    1       USB Mixer MultiMedia5                   Off
> 1030    BOOL    1       USB Mixer MultiMedia6                   Off
> 1031    BOOL    1       USB Mixer MultiMedia7                   Off
> 1032    BOOL    1       USB Mixer MultiMedia8                   Off
> 
> tinymix -D 2 contents
> Number of controls: 10
> ctl     type    num     name                                    value
> 0       INT     2       Capture Channel Map                     0, 0 (range 0->36)
> 1       INT     2       Playback Channel Map                    0, 0 (range 0->36)
> 2       BOOL    1       Headset Capture Switch                  On
> 3       INT     1       Headset Capture Volume                  10 (range 0->13)
> 4       BOOL    1       Sidetone Playback Switch                On
> 5       INT     1       Sidetone Playback Volume                4096 (range 0->8192)
> 6       BOOL    1       Headset Playback Switch                 On
> 7       INT     2       Headset Playback Volume                 20, 20 (range 0->24)
> 8       INT     1       USB Offload Playback Card Route PCM#0   0 (range -1->32)
> 9       INT     1       USB Offload Playback PCM Route PCM#0    1 (range -1->255)
> 
> The example highlights that the userspace/application can utilize the offload path
> for the USB device on card#0 PCM device#1.
> 
> When dealing with multiple USB audio devices, only the latest USB device identified
> is going to be selected for offload capable.
> 
> tinymix -D 1 contents
> Number of controls: 9
> ctl     type    num     name                                    value
> 0       INT     2       Capture Channel Map                     0, 0 (range 0->36)
> 1       INT     2       Playback Channel Map                    0, 0 (range 0->36)
> 2       BOOL    1       Headset Capture Switch                  On
> 3       INT     1       Headset Capture Volume                  1 (range 0->4)
> 4       BOOL    1       Sidetone Playback Switch                On
> 5       INT     1       Sidetone Playback Volume                4096 (range 0->8192)
> 6       BOOL    1       Headset Playback Switch                 On
> 7       INT     2       Headset Playback Volume                 20, 20 (range 0->24)
> 8       INT     1       USB Offload Playback Card Route PCM#0   -1 (range -1->32)
> 9       INT     1       USB Offload Playback PCM Route PCM#0    -1 (range -1->255)
> 
> "-1, -1" shows that this device has no route to the offload path.
> 
> This feature was validated using:
> - tinymix: set/enable the multimedia path to route to USB backend
> - tinyplay: issue playback on platform card
> 

Could you share the device tree changes for a board upstream and any
other changes needed to be able to test this series? E.g. for
sm8250-mtp.dts, based on your examples above.

There are examples for qcom,q6usb etc in the bindings you submitted, but
having a full example would be much easier.

Thanks,
Stephan

