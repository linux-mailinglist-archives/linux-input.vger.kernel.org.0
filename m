Return-Path: <linux-input+bounces-11492-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A63AFA7A3FA
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 15:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8040A1736FE
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 13:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66B124DFEC;
	Thu,  3 Apr 2025 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fHEFyBHy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4002E1EA91
	for <linux-input@vger.kernel.org>; Thu,  3 Apr 2025 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687944; cv=none; b=CwITuSXzz2huAjedxBgt/iaDjmnRr27LH7Sve7htH3uJmzj5Iv6ZW8R/1xd0DkvTeV69JxOREmYTYBaehwRQNjTu3NISCmfGVRkClvx105m7RPjwr8F47kGA30waO0y2uWX/jtDGeM6qndc7TwH7yRpeGWBq6Osu1bndG1g8lvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687944; c=relaxed/simple;
	bh=8uZOaB3XL4Rca7seSQn+Gm+0/WTG+eyEdSlzWfM6Wg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QM5mh5hi3YBckN8b6HKjNLEDxU/Hivv0P4qN7xIBWhVNU9q8hjjXD/21k2Pb/fpd1erRVRdtddHrA3NklPnf4eJtuDkWF9kVMFJzxA2PYZnjx3boSahwCrSja+MP/UEXFaJNwjhEZEBUwk27kG5Bz3h39Q+sSa+NZx+kPLSnSLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fHEFyBHy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25520a289so152519466b.3
        for <linux-input@vger.kernel.org>; Thu, 03 Apr 2025 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743687939; x=1744292739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cr793r41iLU7dfgEv3QP/6LDnLnqUyvj30c5my6SOB4=;
        b=fHEFyBHy+T2mYnEFDR2YM2AvQUaXpO6fqUhkn3lsv0fiQb2pvqCdSVwAnaqIzw99eV
         f4gD5X/yNJ9LUgTkK3V2MhCQTHDS/B2uCkN9b0sl5/xqHa3o96Xnjc+ALt5B3C4nLoYd
         PfVJjEfXBNCJ5VTAkV9sB6RVkiK07+seSutjk75AjzIUqEIPIxR2W1AkGZ7R7vCE/Lvd
         c5B4Wb5C8jM5rxrwtxmkRfBjD3YQRf/iGJJgCYNVwVlB5KMNMjWPBR05TB9NYB54HxQl
         5o/xPUKvH5BxoV6c4Xf+l7qYSyvZ3kaJ3XPG5yZLSnMZ1nqYNtZmgnGTqJkNcNai6UNW
         Zrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687939; x=1744292739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cr793r41iLU7dfgEv3QP/6LDnLnqUyvj30c5my6SOB4=;
        b=QIW8Uxu7Lg0A4/JlocA/w01GHlxlcaF4oxFohiqI91EmO7EU9+oPW0n5RArR8XY4ss
         GepWfopy39LO9A31DRxs5v+JOrqVlxD24mqf5uC2fomlIvSJZwP7gK1qRffFFxbKMsn6
         r/LWo0xEzQBGNhyZJpUXxs67kNhpMKgUkV1eBqYNMnF39qPrKLoeXQ6/6FbG53WaQEC6
         WeNE8lzZczauAPzvaQ6r7D4dnozr+kyAmt6mju6SYmNBPuR9CGLtrQZAcTj4TFL+YMVp
         Ji3DSVXt+r5zZGMj3iJONqwl3SYbSVdnK2h2wup7XJGJ8kfxyTO45dcyzDNt/ftsmO4c
         DdQA==
X-Forwarded-Encrypted: i=1; AJvYcCVubVgZ69BRsK3+4iWxH+co8MLewZHaO/GIDgwEs9ZYDKYLIbH7rkp8q8O8UIEEjnuZCnV5aeSPL7LX+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB5S7vt6uNFLrh6ERn0rkocD2W9PaxPGbzxly36r6AU4726Gqj
	0tqpoA8PIs+NAXKMlo1ZACyvXT7uUDbetcItNTjNWZAoNpSoaGy8mb+cjsAQVv8=
X-Gm-Gg: ASbGncux/PA91XNtmDxFUreU98Y0CUPwXPgOlKoN4y+wTG6VIv1//81E+gjGTCLsSIj
	DJWkQynaPXGYi9enHmwJ00TdF4g2QLGz3swg6qwAN9PQh64qWtfDz73NS2jjzPToO+2LwsaX6iP
	Ck75onfM/k+PGnbaRlBEelAeNFU0lhXNWYKgZtn9rsn48ZhN4erOQlW3jnUvWuv6i8nt0rpvuDF
	Jo+OwAmroJ433/u5u6CcH/Pymn/4uM41Be5+vJNiFs57QFbdqGE6wo04LKGkKQxnqsbu1oKtR1U
	vSCrHHUCLopMhQ5Je8+igWZoPcHgxxaBJZjuBzEjgIguU4XSa8s9IQ==
X-Google-Smtp-Source: AGHT+IF//3IBO5z0G/LcU7f4aIfiWkLgmO+c0MqrXdW2Xp2UeJO5AUxdPIs/ZFKUItaMKSYPNkwxow==
X-Received: by 2002:a17:906:c10f:b0:ac1:ea29:4e63 with SMTP id a640c23a62f3a-ac738a42854mr1611031366b.26.1743687939323;
        Thu, 03 Apr 2025 06:45:39 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:ad69:6cf:36b:ebdd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01857fbsm96782066b.149.2025.04.03.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:45:38 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:45:34 +0200
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
Message-ID: <Z-6Q_gaWsWyZcpLz@linaro.org>
References: <20250319005141.312805-23-quic_wcheng@quicinc.com>
 <Z-J2WnrZHP6iMIhT@linaro.org>
 <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>
 <Z-PPlRD7gcUcNvNv@linaro.org>
 <200c08f7-3637-c2fb-2caa-002604b957ed@quicinc.com>
 <Z-ug3YFwff8hWIRl@linaro.org>
 <378af3f1-b5b0-4f7a-ab62-f5c891feb7b5@quicinc.com>
 <Z-1MtJjfVbUQFron@linaro.org>
 <7d5fd3bf-c33e-4274-938b-2fb93c4b39d8@quicinc.com>
 <a9e281d6-59c0-3615-9851-c33752b0620f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9e281d6-59c0-3615-9851-c33752b0620f@quicinc.com>

On Wed, Apr 02, 2025 at 05:54:45PM -0700, Wesley Cheng wrote:
> On 4/2/2025 5:23 PM, Wesley Cheng wrote:
> > On 4/2/2025 7:41 AM, Stephan Gerhold wrote:
> > > On Tue, Apr 01, 2025 at 04:47:41PM -0700, Wesley Cheng wrote:
> > > > On 4/1/2025 1:16 AM, Stephan Gerhold wrote:
> > > > > On Mon, Mar 31, 2025 at 12:52:19PM -0700, Wesley Cheng wrote:
> > > > > > On 3/26/2025 2:57 AM, Stephan Gerhold wrote:
> > > > > > > On Tue, Mar 25, 2025 at 04:18:03PM -0700, Wesley Cheng wrote:
> > > > > > > > On 3/25/2025 2:24 AM, Stephan Gerhold wrote:
> > > > > > > > > On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
> > > > > > > > > > The QC ADSP is able to support USB
> > > > > > > > > > playback endpoints, so that the main
> > > > > > > > > > application processor can be placed into
> > > > > > > > > > lower CPU power modes.  This adds
> > > > > > > > > > the required AFE port configurations and
> > > > > > > > > > port start command to start an
> > > > > > > > > > audio session.
> > > > > > > > > > 
> > > > > > > > > > Specifically, the QC ADSP can support
> > > > > > > > > > all potential endpoints that are
> > > > > > > > > > exposed by the audio data interface. 
> > > > > > > > > > This includes isochronous data
> > > > > > > > > > endpoints, in either synchronous mode or
> > > > > > > > > > asynchronous mode. In the latter
> > > > > > > > > > case both implicit or explicit feedback
> > > > > > > > > > endpoints are supported.  The size
> > > > > > > > > > of audio samples sent per USB frame
> > > > > > > > > > (microframe) will be adjusted based on
> > > > > > > > > > information received on the feedback endpoint.
> > > > > > > > > > 
> > > > > > > > > > Some pre-requisites are needed before
> > > > > > > > > > issuing the AFE port start command,
> > > > > > > > > > such as setting the USB AFE dev_token. 
> > > > > > > > > > This carries information about the
> > > > > > > > > > available USB SND cards and PCM devices
> > > > > > > > > > that have been discovered on the
> > > > > > > > > > USB bus.  The dev_token field is used by
> > > > > > > > > > the audio DSP to notify the USB
> > > > > > > > > > offload driver of which card and PCM index to enable playback on.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > > > > > > > > ---
> > > > > > > > > >   sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
> > > > > > > > > >  
> > > > > > > > > > sound/soc/qcom/qdsp6/q6afe.c            
> > > > > > > > > > | 192 ++++++++++++++++++++++-
> > > > > > > > > >   sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
> > > > > > > > > >   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
> > > > > > > > > >   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
> > > > > > > > > >   sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
> > > > > > > > > >   6 files changed, 341 insertions(+), 3 deletions(-)
> > > > > > > > > > 
> > > > > > > > [...]
> > > > > > > > > > diff --git
> > > > > > > > > > a/sound/soc/qcom/qdsp6/q6routing.c
> > > > > > > > > > b/sound/soc/qcom/qdsp6/q6routing.c
> > > > > > > > > > index 90228699ba7d..b7439420b425 100644
> > > > > > > > > > --- a/sound/soc/qcom/qdsp6/q6routing.c
> > > > > > > > > > +++ b/sound/soc/qcom/qdsp6/q6routing.c
> > > > > > > > > > @@ -435,6 +435,26 @@ static struct
> > > > > > > > > > session_data *get_session_from_id(struct
> > > > > > > > > > msm_routing_data *data,
> > > > > > > > > >       return NULL;
> > > > > > > > > >   }
> > > > > > > > > > +
> > > > > > > > > > +static bool is_usb_routing_enabled(struct msm_routing_data *data)
> > > > > > > > > > +{
> > > > > > > > > > +    int i;
> > > > > > > > > > +
> > > > > > > > > > +    /*
> > > > > > > > > > +     * Loop through current sessions to
> > > > > > > > > > see if there are active routes
> > > > > > > > > > +     * to the USB_RX backend DAI.  The
> > > > > > > > > > USB offload routing is designed
> > > > > > > > > > +     * similarly to the non offload
> > > > > > > > > > path.  If there are multiple PCM
> > > > > > > > > > +     * devices associated with the ASoC
> > > > > > > > > > platform card, only one active
> > > > > > > > > > +     * path can be routed to the USB offloaded endpoint.
> > > > > > > > > > +     */
> > > > > > > > > > +    for (i = 0; i < MAX_SESSIONS; i++) {
> > > > > > > > > > +        if (data->sessions[i].port_id == USB_RX)
> > > > > > > > > > +            return true;
> > > > > > > > > > +    }
> > > > > > > > > > +
> > > > > > > > > > +    return false;
> > > > > > > > > > +}
> > > > > > > > > 
> > > > > > > > > What is different about USB_RX compared to
> > > > > > > > > other output ports we have in
> > > > > > > > > Q6AFE? Obviously, we can only play one
> > > > > > > > > stream on an output port. But
> > > > > > > > > doesn't the ADSP mix streams together when
> > > > > > > > > you have multiple routes?
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > This patch will limit the USB_RX from being able
> > > > > > > > to be mixed to multiple
> > > > > > > > q6adm paths.
> > > > > > > > 
> > > > > > > > > Also, this doesn't actually check for *active* routes only. It just
> > > > > > > > > looks if any other MultiMedia DAI is
> > > > > > > > > configured to output to USB_RX.
> > > > > > > > > That doesn't mean they will ever be active at the same time.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Yes, the main reason being that that is the
> > > > > > > > mechanism we use to populate
> > > > > > > > the active offload path within the USB SND card mixer.
> > > > > > > > 
> > > > > > > > > I might for example want to have MultiMedia1 and MultiMedia2 both
> > > > > > > > > configured to output to USB_RX. Let's assume
> > > > > > > > > MultiMedia1 is a normal PCM
> > > > > > > > > DAI, MultiMedia2 is a compress offload DAI. When I want to playback
> > > > > > > > > normal audio, I go through MultiMedia1, when
> > > > > > > > > I want to play compressed
> > > > > > > > > audio, I go through MultiMedia2. Only one of them active at a time.
> > > > > > > > > Why can't I set this up statically in the mixers?
> > > > > > > > > 
> > > > > > > > > If you confirm that it is really impossible
> > > > > > > > > to have multiple streams
> > > > > > > > > mixed together to the USB_RX output in the
> > > > > > > > > ADSP, then this should be a
> > > > > > > > > runtime check instead when starting the stream IMO.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > We can have multiple streams being mixed together, but it will get
> > > > > > > > confusing because it changes the definition that
> > > > > > > > we had discussed about in
> > > > > > > > the past about the overall design for the interaction w/ userspace.
> > > > > > > > Although we (QC) only support a single USB audio
> > > > > > > > device for offloading,
> > > > > > > > there could be other situations where the audio
> > > > > > > > DSP can support multiple
> > > > > > > > devices.  The assumption is that each MM path is
> > > > > > > > assigned to a USB device.
> > > > > > > > 
> > > > > > > 
> > > > > > > Are you referring to the "USB Offload Playback Route
> > > > > > > PCM#*" mixers here?
> > > > > > > They could just refer to first of the configured MM paths, if someone
> > > > > > > decides to route multiple paths to the USB backend. Looking at
> > > > > > > q6usb_update_offload_route(), I think the implementation does that
> > > > > > > already.
> > > > > > > 
> > > > > > > I think it's fine that the userspace API for
> > > > > > > automatically "probing" the
> > > > > > > PCM device supports only a single path to the USB backend. But if
> > > > > > > someone wants to bypass the automatic probing and configure a more
> > > > > > > advanced setup, do we need to forbid that?
> > > > > > > 
> > > > > > > Asked differently: what would happen if we remove this check here and
> > > > > > > handle USB_RX like any other Q6AFE output port?
> > > > > > > Would anything break for
> > > > > > > the userspace interface?
> > > > > > > 
> > > > > > 
> > > > > > So I took a look at seeing how the Q6ADM/ASM
> > > > > > interactions would work for
> > > > > > the situation where if user tried to start both MM1/2
> > > > > > streams at the same
> > > > > > time over the USB offload path.  In this scenario, we
> > > > > > see that the Q6USB BE
> > > > > > DAI operations, ie startup, hw_params, etc... gets
> > > > > > called one time for the
> > > > > > initial stream.  For example, if I start playback on MM1, then that
> > > > > > triggers the USB BE DAI to be brought up.
> > > > > > 
> > > > > > When I start playback on MM2, since MM1 already called
> > > > > > dpcm_be_dai_startup(), then be->dpcm[stream].users will
> > > > > > be greater than
> > > > > > zero.  This would cause the __soc_pcm_open() to be
> > > > > > skipped for the USB BE
> > > > > > DAI, so I wouldn't be able to check the runtime status
> > > > > > at the Q6USB backend
> > > > > > DAI.  However, we do track current streaming sessions
> > > > > > done over Q6 ADM and
> > > > > > it does save the AFE port associated to each COPP
> > > > > > allocation, so I think its
> > > > > > reasonable to see if there is already a COPP entry for
> > > > > > the USB AFE port, to
> > > > > > fail the open() call associated to the FE DAI.
> > > > > > 
> > > > > 
> > > > > This sounds like a reasonable approach *if* we have to prevent multiple
> > > > > MM DAIs from streaming to the USB AFE port at the same time.
> > > > > 
> > > > > It's still unclear to me why we have to introduce this
> > > > > limitation in the
> > > > > first place. I think the questions from my previous email are still
> > > > > open. Can you check them again?
> > > > > 
> > > > 
> > > > So I checked with our audio DSP folks, and they mentioned there isn't
> > > > technically a limitation from mixing multiple ADM streams from
> > > > their end.
> > > > My observations are as follows:
> > > > - Using tinyplay to open and play on different FE PCM devices
> > > > (ie MM1 and
> > > > MM2), both streams are audible on the USB headset (intermixed).
> > > > - If starting playback on MM1 first, before MM2, then once playback is
> > > > complete on MM1, the ADM close is also affecting the MM2 stream.
> > > > Basically, MM2 stops when the MM1 audio file is completed.
> > > > - Due to the abrupt/incomplete closing of the MM2 ADM stream, looks like
> > > > the audio DSP is not handling that case well, so subsequent
> > > > playbacks fail.
> > > > 
> > > 
> > > Thanks a lot for testing this!
> > > 
> > > > I did find a possible reason for this, and it seems to be due to
> > > > some code
> > > > unrelated to the USB offload path directly.  It looks like the Q6ADM is
> > > > currently built in a way that you can only route streams to a single
> > > > endpoint, even though we do have reference counting for each
> > > > COPP profile.
> > > > So even after the first MM1 ADM stream completes and the PCM device is
> > > > closed, the MM1 ADM close callback will issue a q6adm_device_close() for
> > > > the USB AFE port.
> > > 
> > > Yeah, this sounds like a bug to me...
> > > 
> > > > 
> > > > I made some test changes to account for the refcount before issuing the
> > > > q6adm_device_close(), and that seemed to work.  Once the MM1
> > > > stream closes,
> > > > it allows for the MM2 stream to close/finish before issuing the command,
> > > > and that allows for proper cleanup of the audio data.
> > > > 
> > > > IMO, I would like to keep the initial behavior (ie, blocking the
> > > > additional
> > > > stream open from the kernel) until I can get some more testing done, and
> > > > figure out if this is the correct approach.  If it is, I can submit a
> > > > follow up series to address it.
> > > > 
> > > 
> > > I'm fine with this approach. My only two concerns/comments are:
> > > 
> > >   1. Let's make sure we don't waste too much time finding the ideal
> > >      approach to implement the additional blocking, if this will likely
> > >      end up getting removed again anyway.
> > > 
> > >   2. How can we justify making this change only for USB? Your analysis
> > >      sounds like the issue applies to all types of output ports. This was
> > >      exactly my main concern with the check you added in this patch:
> > >      I would expect QDSP6 treats all ports exactly the same. This means
> > >      we should add this additional check for all the output ports...
> > > 
> > 
> > Fair points...I will extend this check across all ports until I get back
> > with seeing how we can address the mixing situation.
> > 
> 
> Sorry for replying again.  I think I'll at least limit this to the playback
> path only for now.  I'm not sure how the behavior yet is for the record
> path, since I don't really have that use case to test with yet :).  I will
> see how it looks like when the record USB offload is done.
> 

FWIW, I tested this on MSM8916:

 - MultiMedia1 -> PRI_MI2S_RX
 - MultiMedia3 -> PRI_MI2S_RX
 - TERT_MI2S_TX -> MultiMedia2
 - TERT_MI2S_TX -> MultiMedia5

2x speaker-test to MultiMedia1 and MultiMedia3 (pink noise + sine wave):
 -> Audio playback correctly mixed together
 -> Playback aborts for both when stopping one of the processes
      Write error: -5,I/O error
      xrun_recovery failed: -5,I/O error
      Transfer failed: I/O error
 -> Kernel log:
    [  585.679421] q6routing 4080000.remoteproc:smd-edge:apr:service@8:routing: Found Matching Copp 0x0
    [  587.917135] qcom-q6adm aprsvc:service:4:8: cmd = 0x10327 return error = 0x2
    [  587.917378] qcom-q6adm aprsvc:service:4:8: DSP returned error[2]
    [  587.917409] qcom-q6adm aprsvc:service:4:8: Failed to close copp -22

2x arecord from MultiMedia2 and MultiMedia5:
 -> Both processes record audio as expected
 -> Recording aborts for both when stopping one of the processes
      arecord: pcm_read:2272: read error: I/O error
 -> Kernel log:
    [  646.125612] q6routing 4080000.remoteproc:smd-edge:apr:service@8:routing: Found Matching Copp 0x0
    [  654.247867] q6asm-dai 4080000.remoteproc:smd-edge:apr:service@7:dais: command[0x10bdb] not expecting rsp
    [  654.815474] q6asm-dai 4080000.remoteproc:smd-edge:apr:service@7:dais: command[0x10bdb] not expecting rsp
    [  654.825568] qcom-q6adm aprsvc:service:4:8: cmd = 0x10327 return error = 0x2
    [  654.825955] qcom-q6adm aprsvc:service:4:8: DSP returned error[2]
    [  654.826013] qcom-q6adm aprsvc:service:4:8: Failed to close copp -22

=> Both playback and recording are affected. As you suspected it's
   unrelated to USB.

This feels like a bug to me rather than an intentional limitation. If
you can share the fix you made I can test it here.

Thanks,
Stephan

