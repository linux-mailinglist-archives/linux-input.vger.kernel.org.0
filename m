Return-Path: <linux-input+bounces-11501-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B168AA7A8FA
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 20:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D39D17651A
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 18:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF3C2528F9;
	Thu,  3 Apr 2025 18:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fzKYrTp7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1BE2512CD
	for <linux-input@vger.kernel.org>; Thu,  3 Apr 2025 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703263; cv=none; b=BAxGBKzbMTqND2WuSQPLo9/WnJz8T1AFBuCLJvshDO5D4poiecAtaCUgcZkDcc4dNSuCjORiD+cMj1DUJS8+W5TLuTsoaPgkBSHqlSoA+wlu+O4C8bNZHJfqL1IahFLjiMKXPI828ggufyYVvmq8KP617HxyHD/UXattg0rw3ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703263; c=relaxed/simple;
	bh=4ykLBjACoxxDUxdlJXisDPXYF8nh2gUm3OaYFAIuPzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gX/+QzBgfuaTdRDdin0yffmjqc7uDb3zxRrveIWChD0vqWCzWH/9gUtxjQThC/KiYQws/V7Vf58oIofs1C5MnQmzTh/SXo4hsMcDcxYHFhVcOUMzRV/qC2hJAs8fvmmqCkKIpopiqAqWb4N9QUS4ywswOM58QhlmEw+Qc8T1oIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fzKYrTp7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac25520a289so202143866b.3
        for <linux-input@vger.kernel.org>; Thu, 03 Apr 2025 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743703258; x=1744308058; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tSbwwWBv1wP8PbIZ+XWDV3wTTpk86HKdHfJh/sgtPqQ=;
        b=fzKYrTp7dOL5qWy88xrqe1l5Yg/5suE4Kw+gr9ptP5FnFbfpC1KEytLIg2tW6Hc42a
         z1X4w33/H6lXblDYCHLs/TDA5OhE5HMRMjlN3lBhpWGLhCdvci0t73BF5XTIXgMRAIHG
         MOBi/Z5KgITPknK9r+kyz7C/OWMlcMtcld4h9kWEGUvFWk0AXWGIgjeuHH1XZf4/EnBl
         nrgaRwAWqDmTKLCSY9rZqjxCQdIUHB8t1r7MMDaZoHdJDmm45q0EFxFS8w9LicSQXG+h
         L0tOaiRA7D5MCh4afHq128xrRDDXqS6+uDgjNyhS50zXrbi7Ap9IiNsxkkP4qiwd7jr6
         kmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703258; x=1744308058;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSbwwWBv1wP8PbIZ+XWDV3wTTpk86HKdHfJh/sgtPqQ=;
        b=bAfagQzzZcEb/ycN/QJrtEjZ/9Xt9Q4woO5xj6lekDhOma4/V89kq5jdWXbsYlOC/p
         rcSwGYPH2m7nc7IzgnOsBmmmQtEJUltUm18ix4PXEsFjyiaPSIVgPqgcX3qjIYD6ONH4
         Br7mbPDYowQMX+nyZz+R2kyniiTYCMI4KqK+gBuuf4UskeeOWx9p9/Pnh6qhGSTNhZuo
         xduetXiv29DOGq9KIi9oHzLEXAQqe+wtRKdGVe7YQ9ecpCsMgaEYJ0BAk33eAY2TItHH
         nGFGz8u/w/l5TAO5rJTCncrxK3r0DLsmHaqnxZQp+HjXIyyAVEfratXj4/n1+skyXyXr
         8C5A==
X-Forwarded-Encrypted: i=1; AJvYcCWEMfVb07qUBqUF90RPDBwIIXcZBlBzOeLxVGYnt/DkcRA29nr0rcP+C6A7DZiTomYJs3RtNECIBQ9s7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJof0gVVwbszUt/JVCLM8p/rZ8UD1Tv0DXRCCBSpk3duvPCWg5
	6Ocfbl6+gPXT5Qsjqa01rZIN4izhLKJ9H/47ciUZ/Ht5Exy+EKVNyRr8/4vDOiM=
X-Gm-Gg: ASbGncva4vIsmuKfP5mN8BMkiX7ZfTNeeXuUvO0fkjOe2jtY8FrgCPK0LV0J3B9VfQO
	OFzYVjSMFSW3tkf0q9xdhL/YeqHYV/RG0lrHqJVYLGkNsc+nVxtchuwb6Y3K0+C5TNU+GPMnhkW
	CIh0LN8SdZKBxp8ssG86uXnVA26t0kdFCJvnYYzefpTckxP8WZi8BniMl/KKQ5rVXuWAiP+ib8G
	c3i6TlRXKfgeEHKgfI7TJUmadzp2+VAk2pceObNjP6cK6ckGCa4UyboP5FVrjSWO1G5eBiZo9Yd
	GIOpakHXJ68M6FYPOfZk5NAGN/DB76jd4Nr+QbvFgmv73e1W1S5QKWBm
X-Google-Smtp-Source: AGHT+IFtxX3dMcxR7VWG+baPGO4m1vEAQrXum/smjPjgDcoAfwBKUaOeaH+qj6m5wwvVWLE/r+QQPg==
X-Received: by 2002:a17:907:9443:b0:ac7:1350:e878 with SMTP id a640c23a62f3a-ac7d1beea51mr37620366b.46.1743703258138;
        Thu, 03 Apr 2025 11:00:58 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:6802:e744:38a7:72ee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfee2591sm125555666b.79.2025.04.03.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:00:57 -0700 (PDT)
Date: Thu, 3 Apr 2025 20:00:52 +0200
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
Message-ID: <Z-7M1IeKNk6ZBayS@linaro.org>
References: <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>
 <Z-PPlRD7gcUcNvNv@linaro.org>
 <200c08f7-3637-c2fb-2caa-002604b957ed@quicinc.com>
 <Z-ug3YFwff8hWIRl@linaro.org>
 <378af3f1-b5b0-4f7a-ab62-f5c891feb7b5@quicinc.com>
 <Z-1MtJjfVbUQFron@linaro.org>
 <7d5fd3bf-c33e-4274-938b-2fb93c4b39d8@quicinc.com>
 <a9e281d6-59c0-3615-9851-c33752b0620f@quicinc.com>
 <Z-6Q_gaWsWyZcpLz@linaro.org>
 <e1eac325-233e-43eb-9ca0-9746893462d7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1eac325-233e-43eb-9ca0-9746893462d7@quicinc.com>

On Thu, Apr 03, 2025 at 08:58:11AM -0700, Wesley Cheng wrote:
> On 4/3/2025 6:45 AM, Stephan Gerhold wrote:
> > On Wed, Apr 02, 2025 at 05:54:45PM -0700, Wesley Cheng wrote:
> >> On 4/2/2025 5:23 PM, Wesley Cheng wrote:
> >>> On 4/2/2025 7:41 AM, Stephan Gerhold wrote:
> >>>> On Tue, Apr 01, 2025 at 04:47:41PM -0700, Wesley Cheng wrote:
> >>>>> On 4/1/2025 1:16 AM, Stephan Gerhold wrote:
> >>>>>> On Mon, Mar 31, 2025 at 12:52:19PM -0700, Wesley Cheng wrote:
> >>>>>>> On 3/26/2025 2:57 AM, Stephan Gerhold wrote:
> >>>>>>>> On Tue, Mar 25, 2025 at 04:18:03PM -0700, Wesley Cheng wrote:
> >>>>>>>>> On 3/25/2025 2:24 AM, Stephan Gerhold wrote:
> >>>>>>>>>> On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
> >>>>>>>>>>> The QC ADSP is able to support USB
> >>>>>>>>>>> playback endpoints, so that the main
> >>>>>>>>>>> application processor can be placed into
> >>>>>>>>>>> lower CPU power modes.  This adds
> >>>>>>>>>>> the required AFE port configurations and
> >>>>>>>>>>> port start command to start an
> >>>>>>>>>>> audio session.
> >>>>>>>>>>>
> >>>>>>>>>>> Specifically, the QC ADSP can support
> >>>>>>>>>>> all potential endpoints that are
> >>>>>>>>>>> exposed by the audio data interface. 
> >>>>>>>>>>> This includes isochronous data
> >>>>>>>>>>> endpoints, in either synchronous mode or
> >>>>>>>>>>> asynchronous mode. In the latter
> >>>>>>>>>>> case both implicit or explicit feedback
> >>>>>>>>>>> endpoints are supported.  The size
> >>>>>>>>>>> of audio samples sent per USB frame
> >>>>>>>>>>> (microframe) will be adjusted based on
> >>>>>>>>>>> information received on the feedback endpoint.
> >>>>>>>>>>>
> >>>>>>>>>>> Some pre-requisites are needed before
> >>>>>>>>>>> issuing the AFE port start command,
> >>>>>>>>>>> such as setting the USB AFE dev_token. 
> >>>>>>>>>>> This carries information about the
> >>>>>>>>>>> available USB SND cards and PCM devices
> >>>>>>>>>>> that have been discovered on the
> >>>>>>>>>>> USB bus.  The dev_token field is used by
> >>>>>>>>>>> the audio DSP to notify the USB
> >>>>>>>>>>> offload driver of which card and PCM index to enable playback on.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>>   sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
> >>>>>>>>>>>  
> >>>>>>>>>>> sound/soc/qcom/qdsp6/q6afe.c            
> >>>>>>>>>>> | 192 ++++++++++++++++++++++-
> >>>>>>>>>>>   sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
> >>>>>>>>>>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
> >>>>>>>>>>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
> >>>>>>>>>>>   sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
> >>>>>>>>>>>   6 files changed, 341 insertions(+), 3 deletions(-)
> >>>>>>>>>>>
> >>>>>>>>> [...]
> >>>>>>>>>>> diff --git
> >>>>>>>>>>> a/sound/soc/qcom/qdsp6/q6routing.c
> >>>>>>>>>>> b/sound/soc/qcom/qdsp6/q6routing.c
> >>>>>>>>>>> index 90228699ba7d..b7439420b425 100644
> >>>>>>>>>>> --- a/sound/soc/qcom/qdsp6/q6routing.c
> >>>>>>>>>>> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> >>>>>>>>>>> @@ -435,6 +435,26 @@ static struct
> >>>>>>>>>>> session_data *get_session_from_id(struct
> >>>>>>>>>>> msm_routing_data *data,
> >>>>>>>>>>>       return NULL;
> >>>>>>>>>>>   }
> >>>>>>>>>>> +
> >>>>>>>>>>> +static bool is_usb_routing_enabled(struct msm_routing_data *data)
> >>>>>>>>>>> +{
> >>>>>>>>>>> +    int i;
> >>>>>>>>>>> +
> >>>>>>>>>>> +    /*
> >>>>>>>>>>> +     * Loop through current sessions to
> >>>>>>>>>>> see if there are active routes
> >>>>>>>>>>> +     * to the USB_RX backend DAI.  The
> >>>>>>>>>>> USB offload routing is designed
> >>>>>>>>>>> +     * similarly to the non offload
> >>>>>>>>>>> path.  If there are multiple PCM
> >>>>>>>>>>> +     * devices associated with the ASoC
> >>>>>>>>>>> platform card, only one active
> >>>>>>>>>>> +     * path can be routed to the USB offloaded endpoint.
> >>>>>>>>>>> +     */
> >>>>>>>>>>> +    for (i = 0; i < MAX_SESSIONS; i++) {
> >>>>>>>>>>> +        if (data->sessions[i].port_id == USB_RX)
> >>>>>>>>>>> +            return true;
> >>>>>>>>>>> +    }
> >>>>>>>>>>> +
> >>>>>>>>>>> +    return false;
> >>>>>>>>>>> +}
> >>>>>>>>>>
> >>>>>>>>>> What is different about USB_RX compared to
> >>>>>>>>>> other output ports we have in
> >>>>>>>>>> Q6AFE? Obviously, we can only play one
> >>>>>>>>>> stream on an output port. But
> >>>>>>>>>> doesn't the ADSP mix streams together when
> >>>>>>>>>> you have multiple routes?
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> This patch will limit the USB_RX from being able
> >>>>>>>>> to be mixed to multiple
> >>>>>>>>> q6adm paths.
> >>>>>>>>>
> >>>>>>>>>> Also, this doesn't actually check for *active* routes only. It just
> >>>>>>>>>> looks if any other MultiMedia DAI is
> >>>>>>>>>> configured to output to USB_RX.
> >>>>>>>>>> That doesn't mean they will ever be active at the same time.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Yes, the main reason being that that is the
> >>>>>>>>> mechanism we use to populate
> >>>>>>>>> the active offload path within the USB SND card mixer.
> >>>>>>>>>
> >>>>>>>>>> I might for example want to have MultiMedia1 and MultiMedia2 both
> >>>>>>>>>> configured to output to USB_RX. Let's assume
> >>>>>>>>>> MultiMedia1 is a normal PCM
> >>>>>>>>>> DAI, MultiMedia2 is a compress offload DAI. When I want to playback
> >>>>>>>>>> normal audio, I go through MultiMedia1, when
> >>>>>>>>>> I want to play compressed
> >>>>>>>>>> audio, I go through MultiMedia2. Only one of them active at a time.
> >>>>>>>>>> Why can't I set this up statically in the mixers?
> >>>>>>>>>>
> >>>>>>>>>> If you confirm that it is really impossible
> >>>>>>>>>> to have multiple streams
> >>>>>>>>>> mixed together to the USB_RX output in the
> >>>>>>>>>> ADSP, then this should be a
> >>>>>>>>>> runtime check instead when starting the stream IMO.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> We can have multiple streams being mixed together, but it will get
> >>>>>>>>> confusing because it changes the definition that
> >>>>>>>>> we had discussed about in
> >>>>>>>>> the past about the overall design for the interaction w/ userspace.
> >>>>>>>>> Although we (QC) only support a single USB audio
> >>>>>>>>> device for offloading,
> >>>>>>>>> there could be other situations where the audio
> >>>>>>>>> DSP can support multiple
> >>>>>>>>> devices.  The assumption is that each MM path is
> >>>>>>>>> assigned to a USB device.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Are you referring to the "USB Offload Playback Route
> >>>>>>>> PCM#*" mixers here?
> >>>>>>>> They could just refer to first of the configured MM paths, if someone
> >>>>>>>> decides to route multiple paths to the USB backend. Looking at
> >>>>>>>> q6usb_update_offload_route(), I think the implementation does that
> >>>>>>>> already.
> >>>>>>>>
> >>>>>>>> I think it's fine that the userspace API for
> >>>>>>>> automatically "probing" the
> >>>>>>>> PCM device supports only a single path to the USB backend. But if
> >>>>>>>> someone wants to bypass the automatic probing and configure a more
> >>>>>>>> advanced setup, do we need to forbid that?
> >>>>>>>>
> >>>>>>>> Asked differently: what would happen if we remove this check here and
> >>>>>>>> handle USB_RX like any other Q6AFE output port?
> >>>>>>>> Would anything break for
> >>>>>>>> the userspace interface?
> >>>>>>>>
> >>>>>>>
> >>>>>>> So I took a look at seeing how the Q6ADM/ASM
> >>>>>>> interactions would work for
> >>>>>>> the situation where if user tried to start both MM1/2
> >>>>>>> streams at the same
> >>>>>>> time over the USB offload path.  In this scenario, we
> >>>>>>> see that the Q6USB BE
> >>>>>>> DAI operations, ie startup, hw_params, etc... gets
> >>>>>>> called one time for the
> >>>>>>> initial stream.  For example, if I start playback on MM1, then that
> >>>>>>> triggers the USB BE DAI to be brought up.
> >>>>>>>
> >>>>>>> When I start playback on MM2, since MM1 already called
> >>>>>>> dpcm_be_dai_startup(), then be->dpcm[stream].users will
> >>>>>>> be greater than
> >>>>>>> zero.  This would cause the __soc_pcm_open() to be
> >>>>>>> skipped for the USB BE
> >>>>>>> DAI, so I wouldn't be able to check the runtime status
> >>>>>>> at the Q6USB backend
> >>>>>>> DAI.  However, we do track current streaming sessions
> >>>>>>> done over Q6 ADM and
> >>>>>>> it does save the AFE port associated to each COPP
> >>>>>>> allocation, so I think its
> >>>>>>> reasonable to see if there is already a COPP entry for
> >>>>>>> the USB AFE port, to
> >>>>>>> fail the open() call associated to the FE DAI.
> >>>>>>>
> >>>>>>
> >>>>>> This sounds like a reasonable approach *if* we have to prevent multiple
> >>>>>> MM DAIs from streaming to the USB AFE port at the same time.
> >>>>>>
> >>>>>> It's still unclear to me why we have to introduce this
> >>>>>> limitation in the
> >>>>>> first place. I think the questions from my previous email are still
> >>>>>> open. Can you check them again?
> >>>>>>
> >>>>>
> >>>>> So I checked with our audio DSP folks, and they mentioned there isn't
> >>>>> technically a limitation from mixing multiple ADM streams from
> >>>>> their end.
> >>>>> My observations are as follows:
> >>>>> - Using tinyplay to open and play on different FE PCM devices
> >>>>> (ie MM1 and
> >>>>> MM2), both streams are audible on the USB headset (intermixed).
> >>>>> - If starting playback on MM1 first, before MM2, then once playback is
> >>>>> complete on MM1, the ADM close is also affecting the MM2 stream.
> >>>>> Basically, MM2 stops when the MM1 audio file is completed.
> >>>>> - Due to the abrupt/incomplete closing of the MM2 ADM stream, looks like
> >>>>> the audio DSP is not handling that case well, so subsequent
> >>>>> playbacks fail.
> >>>>>
> >>>>
> >>>> Thanks a lot for testing this!
> >>>>
> >>>>> I did find a possible reason for this, and it seems to be due to
> >>>>> some code
> >>>>> unrelated to the USB offload path directly.  It looks like the Q6ADM is
> >>>>> currently built in a way that you can only route streams to a single
> >>>>> endpoint, even though we do have reference counting for each
> >>>>> COPP profile.
> >>>>> So even after the first MM1 ADM stream completes and the PCM device is
> >>>>> closed, the MM1 ADM close callback will issue a q6adm_device_close() for
> >>>>> the USB AFE port.
> >>>>
> >>>> Yeah, this sounds like a bug to me...
> >>>>
> >>>>>
> >>>>> I made some test changes to account for the refcount before issuing the
> >>>>> q6adm_device_close(), and that seemed to work.  Once the MM1
> >>>>> stream closes,
> >>>>> it allows for the MM2 stream to close/finish before issuing the command,
> >>>>> and that allows for proper cleanup of the audio data.
> >>>>>
> >>>>> IMO, I would like to keep the initial behavior (ie, blocking the
> >>>>> additional
> >>>>> stream open from the kernel) until I can get some more testing done, and
> >>>>> figure out if this is the correct approach.  If it is, I can submit a
> >>>>> follow up series to address it.
> >>>>>
> >>>>
> >>>> I'm fine with this approach. My only two concerns/comments are:
> >>>>
> >>>>   1. Let's make sure we don't waste too much time finding the ideal
> >>>>      approach to implement the additional blocking, if this will likely
> >>>>      end up getting removed again anyway.
> >>>>
> >>>>   2. How can we justify making this change only for USB? Your analysis
> >>>>      sounds like the issue applies to all types of output ports. This was
> >>>>      exactly my main concern with the check you added in this patch:
> >>>>      I would expect QDSP6 treats all ports exactly the same. This means
> >>>>      we should add this additional check for all the output ports...
> >>>>
> >>>
> >>> Fair points...I will extend this check across all ports until I get back
> >>> with seeing how we can address the mixing situation.
> >>>
> >>
> >> Sorry for replying again.  I think I'll at least limit this to the playback
> >> path only for now.  I'm not sure how the behavior yet is for the record
> >> path, since I don't really have that use case to test with yet :).  I will
> >> see how it looks like when the record USB offload is done.
> >>
> > 
> > FWIW, I tested this on MSM8916:
> > 
> >  - MultiMedia1 -> PRI_MI2S_RX
> >  - MultiMedia3 -> PRI_MI2S_RX
> >  - TERT_MI2S_TX -> MultiMedia2
> >  - TERT_MI2S_TX -> MultiMedia5
> > 
> > 2x speaker-test to MultiMedia1 and MultiMedia3 (pink noise + sine wave):
> >  -> Audio playback correctly mixed together
> >  -> Playback aborts for both when stopping one of the processes
> >       Write error: -5,I/O error
> >       xrun_recovery failed: -5,I/O error
> >       Transfer failed: I/O error
> >  -> Kernel log:
> >     [  585.679421] q6routing 4080000.remoteproc:smd-edge:apr:service@8:routing: Found Matching Copp 0x0
> >     [  587.917135] qcom-q6adm aprsvc:service:4:8: cmd = 0x10327 return error = 0x2
> >     [  587.917378] qcom-q6adm aprsvc:service:4:8: DSP returned error[2]
> >     [  587.917409] qcom-q6adm aprsvc:service:4:8: Failed to close copp -22
> > 
> > 2x arecord from MultiMedia2 and MultiMedia5:
> >  -> Both processes record audio as expected
> >  -> Recording aborts for both when stopping one of the processes
> >       arecord: pcm_read:2272: read error: I/O error
> >  -> Kernel log:
> >     [  646.125612] q6routing 4080000.remoteproc:smd-edge:apr:service@8:routing: Found Matching Copp 0x0
> >     [  654.247867] q6asm-dai 4080000.remoteproc:smd-edge:apr:service@7:dais: command[0x10bdb] not expecting rsp
> >     [  654.815474] q6asm-dai 4080000.remoteproc:smd-edge:apr:service@7:dais: command[0x10bdb] not expecting rsp
> >     [  654.825568] qcom-q6adm aprsvc:service:4:8: cmd = 0x10327 return error = 0x2
> >     [  654.825955] qcom-q6adm aprsvc:service:4:8: DSP returned error[2]
> >     [  654.826013] qcom-q6adm aprsvc:service:4:8: Failed to close copp -22
> > 
> > => Both playback and recording are affected. As you suspected it's
> >    unrelated to USB.
> > 
> 
> Great, thanks for confirming both paths show the same issue :).
> 
> > This feels like a bug to me rather than an intentional limitation. If
> > you can share the fix you made I can test it here.
> > 
> 
> Change I tried was fairly straightforward.  Sharing it below:
> 
> diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
> index fe719c4c32b3..7880fbbe815f 100644
> --- a/sound/soc/qcom/qdsp6/q6adm.c
> +++ b/sound/soc/qcom/qdsp6/q6adm.c
> @@ -578,12 +579,13 @@ int q6adm_close(struct device *dev, struct q6copp *copp)
>      struct q6adm *adm = dev_get_drvdata(dev->parent);
>      int ret = 0;
> 
> -    ret = q6adm_device_close(adm, copp, copp->afe_port, copp->copp_idx);
> -    if (ret < 0) {
> -        dev_err(adm->dev, "Failed to close copp %d\n", ret);
> -        return ret;
> +    if (kref_read(&copp->refcount) == 1) {
> +        ret = q6adm_device_close(adm, copp, copp->afe_port, copp->copp_idx);
> +        if (ret < 0) {
> +            dev_err(adm->dev, "Failed to close copp %d\n", ret);
> +            return ret;
> +        }
>      }
> -
>      kref_put(&copp->refcount, q6adm_free_copp);
> 
>      return 0;
> 

Hmm, yeah it looks like we need some reference counting for the
open/close operation. I think checking the refcount like that is going
to be prone to potential race conditions though. I'm not sure if we can
guarantee that q6adm_close() isn't called concurrently.

I played around a bit and came up with the two patches below. I think
those should be good. Given the "Found Matching Copp" code path, it
feels like this was the intended behavior all along. I can post these if
you have no objections. You could then just go ahead with your series by
removing the check I originally commented on in this patch.

Test results with the two patches below:
 - 2x speaker-test: Audio playback mixed together correctly, processes
   keep running independently, can start/stop new processes
 - 2x arecord: Both processes record audio as expected, processes
   keep running independently, can start/stop new processes

Thanks,
Stephan

From 0a74bded47436f6dd52bfed8a420c5cb84188f50 Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 3 Apr 2025 19:37:50 +0200
Subject: [PATCH 1/2] ASoC: qcom: qdsp6: q6adm: Finish initializing copp before
 releasing lock

---
 sound/soc/qcom/qdsp6/q6adm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 1530e98df165..b4879cac76a6 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -408,9 +408,6 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 		return ERR_CAST(copp);
 	}
 
-	list_add_tail(&copp->node, &adm->copps_list);
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
-
 	kref_init(&copp->refcount);
 	copp->topology = topology;
 	copp->mode = perf_mode;
@@ -419,6 +416,9 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 	copp->bit_width = bit_width;
 	copp->app_type = app_type;
 
+	list_add_tail(&copp->node, &adm->copps_list);
+	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
+
 	ret = q6adm_device_open(adm, copp, port_id, path, topology,
 				channel_mode, bit_width, rate);
 	if (ret < 0) {
-- 
2.47.2

From 8e0cab2b66b053f3008eb2e117dcbec72b1a467c Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 3 Apr 2025 19:38:49 +0200
Subject: [PATCH 2/2] ASoC: qcom: qdsp6: q6adm: Add reference count for
 opening/closing copps

---
 sound/soc/qcom/qdsp6/q6adm.c | 71 ++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 28 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index b4879cac76a6..b073980bb967 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -51,6 +51,9 @@ struct q6copp {
 	wait_queue_head_t wait;
 	struct list_head node;
 	struct q6adm *adm;
+
+	int open_count;
+	struct mutex open_lock;
 };
 
 struct q6adm {
@@ -396,35 +399,43 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 
 	copp = q6adm_find_matching_copp(adm, port_id, topology, perf_mode,
 				      rate, channel_mode, bit_width, app_type);
-	if (copp) {
-		dev_err(dev, "Found Matching Copp 0x%x\n", copp->copp_idx);
-		return copp;
-	}
+	if (!copp) {
+		spin_lock_irqsave(&adm->copps_list_lock, flags);
+		copp = q6adm_alloc_copp(adm, port_id);
+		if (IS_ERR(copp)) {
+			spin_unlock_irqrestore(&adm->copps_list_lock, flags);
+			return ERR_CAST(copp);
+		}
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
-	copp = q6adm_alloc_copp(adm, port_id);
-	if (IS_ERR(copp)) {
+		kref_init(&copp->refcount);
+		copp->topology = topology;
+		copp->mode = perf_mode;
+		copp->rate = rate;
+		copp->channels = channel_mode;
+		copp->bit_width = bit_width;
+		copp->app_type = app_type;
+		mutex_init(&copp->open_lock);
+
+		list_add_tail(&copp->node, &adm->copps_list);
 		spin_unlock_irqrestore(&adm->copps_list_lock, flags);
-		return ERR_CAST(copp);
+	} else {
+		dev_dbg(dev, "Found Matching Copp 0x%x\n", copp->copp_idx);
 	}
 
-	kref_init(&copp->refcount);
-	copp->topology = topology;
-	copp->mode = perf_mode;
-	copp->rate = rate;
-	copp->channels = channel_mode;
-	copp->bit_width = bit_width;
-	copp->app_type = app_type;
-
-	list_add_tail(&copp->node, &adm->copps_list);
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
-
-	ret = q6adm_device_open(adm, copp, port_id, path, topology,
-				channel_mode, bit_width, rate);
-	if (ret < 0) {
-		kref_put(&copp->refcount, q6adm_free_copp);
-		return ERR_PTR(ret);
+	mutex_lock(&copp->open_lock);
+	if (copp->open_count == 0) {
+		ret = q6adm_device_open(adm, copp, port_id, path, topology,
+					channel_mode, bit_width, rate);
+		if (ret < 0) {
+			mutex_unlock(&copp->open_lock);
+			kref_put(&copp->refcount, q6adm_free_copp);
+			return ERR_PTR(ret);
+		}
+		copp->open_count = 1;
+	} else {
+		copp->open_count++;
 	}
+	mutex_unlock(&copp->open_lock);
 
 	return copp;
 }
@@ -570,11 +581,15 @@ int q6adm_close(struct device *dev, struct q6copp *copp)
 	struct q6adm *adm = dev_get_drvdata(dev->parent);
 	int ret = 0;
 
-	ret = q6adm_device_close(adm, copp, copp->afe_port, copp->copp_idx);
-	if (ret < 0) {
-		dev_err(adm->dev, "Failed to close copp %d\n", ret);
-		return ret;
+	mutex_lock(&copp->open_lock);
+	if (--copp->open_count == 0) {
+		ret = q6adm_device_close(adm, copp, copp->afe_port, copp->copp_idx);
+		if (ret < 0) {
+			dev_err(adm->dev, "Failed to close copp %d\n", ret);
+			return ret;
+		}
 	}
+	mutex_unlock(&copp->open_lock);
 
 	kref_put(&copp->refcount, q6adm_free_copp);
 
-- 
2.47.2



