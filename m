Return-Path: <linux-input+bounces-11452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA2A7761D
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 10:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C43188814E
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 08:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBE01DC9B0;
	Tue,  1 Apr 2025 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RhP/zcmu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EB61E261F
	for <linux-input@vger.kernel.org>; Tue,  1 Apr 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495399; cv=none; b=oHAZFhn69uxxONbNUwJalZ4G9knO2Ed/dLk8iShtM7rU4rzaKjE3VbugRSFnWxBgnfeQJ/ujXOPvRiCper2rPFLkDN6RiNJW4jqCE2NEGKKyZiOnxZjJHtetUY+ZIMvpPgWznpeMNvRW+KJvg5E35JXBcDB+Ea6wfJQ1Rc3PdS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495399; c=relaxed/simple;
	bh=eofPP7zphowVZVkOlN5trgp55mfN8GY1zjDnh4fRLYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evUCKY9BS90ZzGpnwnbsO12FVO1T8XmWKblXen+C2MSqPIKmwfzx8fZxNrHesDg6KY19NAkCGeFHsOqREp7seJKX6/OXiPvkwvaX/IPKfzRCedi5MQBNQ2FuXLcYAZvo2gZSTkXHqlxh7Krqnk52nXd9fgsJ49VQ/QaamQGz770=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RhP/zcmu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab78e6edb99so758005366b.2
        for <linux-input@vger.kernel.org>; Tue, 01 Apr 2025 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743495395; x=1744100195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PrVIKvgnOU4qD+Zbvm9Ig4ON8IklOf3INDhWzvDe65U=;
        b=RhP/zcmuF2oktGZ9djneLZZIv8DrdOmYMf3/9v/fTfCH7S+uZWj9EnvhdKBsULP/Qm
         nUILXTDPXbMbzevmseryy7BN24KkpEI/fRqoJTmd52+43QC3E9Q8aP70xcC+xnCt+OJA
         FzRImPdI7RSFfhrz0i1ugscsLgMtOl/7zZWCCaK+ZAgEOUEvbvUZERnrqc34RuP0sZeG
         cJ2dP1O4+a2xVv7tG0UIdZyPJRKuDJHXNr72Oelmf+x9quujf4dOLk9ZcudasdNmE6mn
         M52YIkQFosR+6ZiaA5KYqpeJ+c63U9/EsXcdSRKRj5+8XZpsUsZZnB1EjYXDaI6exbna
         Aj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495395; x=1744100195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrVIKvgnOU4qD+Zbvm9Ig4ON8IklOf3INDhWzvDe65U=;
        b=qXcpJaDtGGh8Pm0yl1o5BL9IsXkfiM60AigzmYM63hHkAA3B6wJUERGI5Qo4ryLqJf
         wvwVvD2x+/EN+Ry5OCj1tf6W6Z9VyKZSRow0n3sMc+MlXR8bCMkKM4oByK/EfoasNL2y
         6Vb1Cb9NVf56MiZR6M96127WgM3aD03jjHRB+04hVdWHM5xAEuy8aKGmmBYFwcId7Kox
         QC/DemaH4BEhTck5VyKqp7f0akCJhdVHiDgwsJnGfvOukodGyt59GsVbAbtGffomslRS
         CFeb/vP80WFQfKANPzfYI1m4bEI+Ssy1OOK6FXbq+Yyl2zmDfZOVWekOIJAf/ROzAo4p
         Jfcw==
X-Forwarded-Encrypted: i=1; AJvYcCUAj8cq8zpZF1Aewr+T8/jn8Sq5ycgNGrvsNg2pqSmBKQaM5ij15nLMw3SJMBvd/nh6rM38ZeSZvVTLCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdfR7IOjxyRoz5oS8Fn6PS3JL8Z+B+n5noqsDV0B+RcLFH8uRQ
	xoo/t0BOCwUVsmMuO5T0yqRJFrAEbE64izvhNZ4TCBnVSHDHAB7+jOhtcKGOapd9+SIo9sxfc6E
	8
X-Gm-Gg: ASbGnct12F34bg9ce+sHjR0PxGdovyV/5Ai8dxg0boKcHkT5BPMdq9eHqkLof6wxSek
	u0BXUXEEYF4+NuaP5dwczQdhkU9GpxvBwmAkYtVJXWAOjNcNI+3jzrRTa2+1U0F6RM9qYAEvdKV
	WgLNDcESEumh6cT36hRIMyT1BQrr1MbedanBIyQs82Pepvei5KV+aCQ+QgLNzEqv0U9l05Wm2Wd
	p97Xl1Cev/TaL1hw/V/1isbONmvdae9ME2ZKdwAXbTUykFBVN7/miLNA7tAtY+z25pHpGLuvZ4x
	znSjWF3R05scWnEuqSwYdYI/IRbAd+P9Au+1MtmRbdDdNmVm/rT1Wh8=
X-Google-Smtp-Source: AGHT+IH1NMpRelTCtWxZmplIIh8jUgx3dBuQ+5KnEzikK+mjlKQVyUDxOdR2qGWxJmqwwa8QNnWrYA==
X-Received: by 2002:a17:907:868e:b0:ac3:5d68:c519 with SMTP id a640c23a62f3a-ac738c13dcbmr1172846266b.53.1743495395257;
        Tue, 01 Apr 2025 01:16:35 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:ce6:8cc5:6e98:d576])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196f55f9sm738659266b.177.2025.04.01.01.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:16:34 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:16:29 +0200
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
	linux-doc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v36 22/31] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Message-ID: <Z-ug3YFwff8hWIRl@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-23-quic_wcheng@quicinc.com>
 <Z-J2WnrZHP6iMIhT@linaro.org>
 <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>
 <Z-PPlRD7gcUcNvNv@linaro.org>
 <200c08f7-3637-c2fb-2caa-002604b957ed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200c08f7-3637-c2fb-2caa-002604b957ed@quicinc.com>

Hi Wesley,

On Mon, Mar 31, 2025 at 12:52:19PM -0700, Wesley Cheng wrote:
> On 3/26/2025 2:57 AM, Stephan Gerhold wrote:
> > On Tue, Mar 25, 2025 at 04:18:03PM -0700, Wesley Cheng wrote:
> > > On 3/25/2025 2:24 AM, Stephan Gerhold wrote:
> > > > On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
> > > > > The QC ADSP is able to support USB playback endpoints, so that the main
> > > > > application processor can be placed into lower CPU power modes.  This adds
> > > > > the required AFE port configurations and port start command to start an
> > > > > audio session.
> > > > > 
> > > > > Specifically, the QC ADSP can support all potential endpoints that are
> > > > > exposed by the audio data interface.  This includes isochronous data
> > > > > endpoints, in either synchronous mode or asynchronous mode. In the latter
> > > > > case both implicit or explicit feedback endpoints are supported.  The size
> > > > > of audio samples sent per USB frame (microframe) will be adjusted based on
> > > > > information received on the feedback endpoint.
> > > > > 
> > > > > Some pre-requisites are needed before issuing the AFE port start command,
> > > > > such as setting the USB AFE dev_token.  This carries information about the
> > > > > available USB SND cards and PCM devices that have been discovered on the
> > > > > USB bus.  The dev_token field is used by the audio DSP to notify the USB
> > > > > offload driver of which card and PCM index to enable playback on.
> > > > > 
> > > > > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > > > ---
> > > > >  sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
> > > > >  sound/soc/qcom/qdsp6/q6afe.c             | 192 ++++++++++++++++++++++-
> > > > >  sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
> > > > >  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
> > > > >  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
> > > > >  sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
> > > > >  6 files changed, 341 insertions(+), 3 deletions(-)
> > > > > 
> > > [...]
> > > > > diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> > > > > index 90228699ba7d..b7439420b425 100644
> > > > > --- a/sound/soc/qcom/qdsp6/q6routing.c
> > > > > +++ b/sound/soc/qcom/qdsp6/q6routing.c
> > > > > @@ -435,6 +435,26 @@ static struct session_data *get_session_from_id(struct msm_routing_data *data,
> > > > >  	return NULL;
> > > > >  }
> > > > > +
> > > > > +static bool is_usb_routing_enabled(struct msm_routing_data *data)
> > > > > +{
> > > > > +	int i;
> > > > > +
> > > > > +	/*
> > > > > +	 * Loop through current sessions to see if there are active routes
> > > > > +	 * to the USB_RX backend DAI.  The USB offload routing is designed
> > > > > +	 * similarly to the non offload path.  If there are multiple PCM
> > > > > +	 * devices associated with the ASoC platform card, only one active
> > > > > +	 * path can be routed to the USB offloaded endpoint.
> > > > > +	 */
> > > > > +	for (i = 0; i < MAX_SESSIONS; i++) {
> > > > > +		if (data->sessions[i].port_id == USB_RX)
> > > > > +			return true;
> > > > > +	}
> > > > > +
> > > > > +	return false;
> > > > > +}
> > > > 
> > > > What is different about USB_RX compared to other output ports we have in
> > > > Q6AFE? Obviously, we can only play one stream on an output port. But
> > > > doesn't the ADSP mix streams together when you have multiple routes?
> > > > 
> > > 
> > > This patch will limit the USB_RX from being able to be mixed to multiple
> > > q6adm paths.
> > > 
> > > > Also, this doesn't actually check for *active* routes only. It just
> > > > looks if any other MultiMedia DAI is configured to output to USB_RX.
> > > > That doesn't mean they will ever be active at the same time.
> > > > 
> > > 
> > > Yes, the main reason being that that is the mechanism we use to populate
> > > the active offload path within the USB SND card mixer.
> > > 
> > > > I might for example want to have MultiMedia1 and MultiMedia2 both
> > > > configured to output to USB_RX. Let's assume MultiMedia1 is a normal PCM
> > > > DAI, MultiMedia2 is a compress offload DAI. When I want to playback
> > > > normal audio, I go through MultiMedia1, when I want to play compressed
> > > > audio, I go through MultiMedia2. Only one of them active at a time.
> > > > Why can't I set this up statically in the mixers?
> > > > 
> > > > If you confirm that it is really impossible to have multiple streams
> > > > mixed together to the USB_RX output in the ADSP, then this should be a
> > > > runtime check instead when starting the stream IMO.
> > > > 
> > > 
> > > We can have multiple streams being mixed together, but it will get
> > > confusing because it changes the definition that we had discussed about in
> > > the past about the overall design for the interaction w/ userspace.
> > > Although we (QC) only support a single USB audio device for offloading,
> > > there could be other situations where the audio DSP can support multiple
> > > devices.  The assumption is that each MM path is assigned to a USB device.
> > > 
> > 
> > Are you referring to the "USB Offload Playback Route PCM#*" mixers here?
> > They could just refer to first of the configured MM paths, if someone
> > decides to route multiple paths to the USB backend. Looking at
> > q6usb_update_offload_route(), I think the implementation does that
> > already.
> > 
> > I think it's fine that the userspace API for automatically "probing" the
> > PCM device supports only a single path to the USB backend. But if
> > someone wants to bypass the automatic probing and configure a more
> > advanced setup, do we need to forbid that?
> > 
> > Asked differently: what would happen if we remove this check here and
> > handle USB_RX like any other Q6AFE output port? Would anything break for
> > the userspace interface?
> > 
> 
> So I took a look at seeing how the Q6ADM/ASM interactions would work for
> the situation where if user tried to start both MM1/2 streams at the same
> time over the USB offload path.  In this scenario, we see that the Q6USB BE
> DAI operations, ie startup, hw_params, etc... gets called one time for the
> initial stream.  For example, if I start playback on MM1, then that
> triggers the USB BE DAI to be brought up.
> 
> When I start playback on MM2, since MM1 already called
> dpcm_be_dai_startup(), then be->dpcm[stream].users will be greater than
> zero.  This would cause the __soc_pcm_open() to be skipped for the USB BE
> DAI, so I wouldn't be able to check the runtime status at the Q6USB backend
> DAI.  However, we do track current streaming sessions done over Q6 ADM and
> it does save the AFE port associated to each COPP allocation, so I think its
> reasonable to see if there is already a COPP entry for the USB AFE port, to
> fail the open() call associated to the FE DAI.
> 

This sounds like a reasonable approach *if* we have to prevent multiple
MM DAIs from streaming to the USB AFE port at the same time.

It's still unclear to me why we have to introduce this limitation in the
first place. I think the questions from my previous email are still
open. Can you check them again?

Thanks,
Stephan

