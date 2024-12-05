Return-Path: <linux-input+bounces-8405-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338A9E4DC4
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 07:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 710B01881464
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 06:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B3B1A4AB3;
	Thu,  5 Dec 2024 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2ZdYOfbI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE9219342D;
	Thu,  5 Dec 2024 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733381428; cv=none; b=tpoJTRVE1HhhUle2RtM4BVxfirXyD3VBk8jnsa3Th75EuQE447N7MfHcU7PrGEhqIWFuMDVpzDn4v4O59VFrfvZfSLPO6hYdxENEhL9oh9sTGs3d4ztYVBnZ09SY/Z56jJ+PgMuY7afIrk9Ywj7gsIZaqjICtbY4G5GH8YTw7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733381428; c=relaxed/simple;
	bh=Iubyq5JqGvti2YlpRaXKl08KsIDXsA26DuLrgdawilg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbIqyJgB+A0uGVtDHMdKHIuR5CX5Fu6q4Q6JReAcvd+sqioU7eaoUOOxDGjL+d7m/Umi5vzhpaux2dEE23agLVmfKf4Hd2HLZ53QvC26uUgrtgRZrOY/Ga+P2m0OJHRBVDUkRBv/g/VWq2dL2y5ol474nsdn1sYnWenW/Xwn/58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2ZdYOfbI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3754FC4CED6;
	Thu,  5 Dec 2024 06:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733381427;
	bh=Iubyq5JqGvti2YlpRaXKl08KsIDXsA26DuLrgdawilg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2ZdYOfbIhdDKBQk9TjllzwXIBvFJgoJtROg8BMzElHezZ88u0b8q4zu+2GnMKvjFz
	 kSdeUgbR9bskivnLAGx1LeG1lZZCDsaQW2vsleUCfhMdvV71QElhmv289xjm9GG7R7
	 o/nX161nVerBvtePEZTkaTkAnxZMPhl2J9hRmTDM=
Date: Thu, 5 Dec 2024 07:50:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.de>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, krzk+dt@kernel.org, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
Message-ID: <2024120523-rifling-skipping-234c@gregkh>
References: <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
 <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
 <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
 <2024120320-recant-tameness-6c81@gregkh>
 <58a561d6-dc10-484e-8214-5e03c4aef66d@intel.com>
 <f9eb5aa5-0741-4198-aeee-beec3ca270f3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9eb5aa5-0741-4198-aeee-beec3ca270f3@quicinc.com>

On Wed, Dec 04, 2024 at 05:15:02PM -0800, Wesley Cheng wrote:
> 
> On 12/4/2024 1:14 PM, Cezary Rojewski wrote:
> > On 2024-12-03 5:57 PM, Greg KH wrote:
> >> On Tue, Dec 03, 2024 at 05:17:48PM +0100, Cezary Rojewski wrote:
> >>> On 2024-12-01 4:14 AM, Pierre-Louis Bossart wrote:
> >>>> Sorry to chime in late, I only look at email occasionally.
> >
> > ...
> >
> >>>>> I believe Amadeusz was still against having the two card design, and wants the routing to automatically happen when playback happens on the sound card created by the USB SND layer.  However, even with that kind of implementation, the major pieces brought in by this series should still be relevant, ie soc-usb and the vendor offload driver.  The only thing that would really change is adding a path from the USB SND PCM ops to interact with the ASoC entities.  Complexity-wise, this would obviously have a good amount of changes to the USB SND/ASoC core drivers.  Some things I can think of that we'd need to introduce:
> >>>>
> >>>> The notion of two cards was agreed inside Intel as far back as 2018, when Rakesh first looked at USB offload.
> >>>
> >>>
> >>> Well, I believe a lot has changed since then, not sure if USB Audio Offload
> >>> (UAOL) was even stable on the Windows solution back then. Obviously we want
> >>> to incorporate what we have learned during all that time into our solution
> >>> before it lands on upstream.
> >>
> >> Great, can you help review this series please?
> >
> > Hi Greg,
> >
> > This series is large and I'd suggest to split it up, what I touched on in my recent reply [1]. Please correct me if I'm wrong, but you mostly care about drivers/usb/* part. If so, the existing set could be split into USB-changes series, ALSA/ASoC-framework series and a third, holding bulk of QCOM-specific patches. Me and my team care mostly about the sound/* part and we don't hold much expertise in USB. I believe Mathias covers this part well though.
> >
> 
> I'm fine to split this into 3 different series if that helps with the reviews.  I was always under the impression that when we upstream things, we need to have an end to end use case within the same series, so that folks get the full picture.  I've gotten feedback where people were confused they couldn't find/follow the code flow, albeit those series were much much smaller.  If Greg is ok with it, I can split it up and have a link reference to the other series.

Yes, a full patch series is best as adding infrastructure in a
stand-alone series that no one uses isn't going to work well.

> I was able to reorganize the list a bit to what you recommended.  So the current layout is xHCI changes first, followed by the USB ALSA and ASoC changes, and lastly the QCOM/vendor specific modifications.

That sounds reasonable, hopefully it lets others review it easier.

thanks,

greg k-h

