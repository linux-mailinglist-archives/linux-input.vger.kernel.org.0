Return-Path: <linux-input+bounces-8318-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495BA9DF47C
	for <lists+linux-input@lfdr.de>; Sun,  1 Dec 2024 04:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D6FCB210BB
	for <lists+linux-input@lfdr.de>; Sun,  1 Dec 2024 03:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C61A1EB5B;
	Sun,  1 Dec 2024 03:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DsCRGPtz"
X-Original-To: linux-input@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D617C64
	for <linux-input@vger.kernel.org>; Sun,  1 Dec 2024 03:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733022888; cv=none; b=GhcK5BlMdiIcOFr4X9m0t0Rwhhqy1XOM4SyYOhj9bgcH+Fm/5OXm5Hm68kcP818lEtY2zDBG2j6F4urVYaTC1kJwZImnqIX255aK90w3cKxgUoEnRehw5i5p8rcmJrRfwLr+lskxw4LEbY+TJrhiP5IWcwUhsJUj6RJr3ytpeV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733022888; c=relaxed/simple;
	bh=/c9nDbTyDnsTU/IXGr9Y3UwKa6KDl4HSGz7JUK5GUh0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rD1ZCQPjyrhfNzFTs9C9SBqXCJdT15mdgJf+T99hUBNvY6zzvN88NOJSLHRpElr/dZuIw02L4jKJtsu6CJVIRNWsUVbRGJdRY56cnn++8DaPwlTMEDS7gMp7b42Eu8FnJ2HqGpEV9RFfxJhbvE4cI/Ue0qkNJvh15CiysS7PlTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DsCRGPtz; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733022883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7DCEiN8KnkC92T6ACDy+l0PONNF1zjnEOfw/bgxVvw=;
	b=DsCRGPtzEiV7AGKx/3/wcfaJWCWJGKJvdtIaXAb43y7pFpK14Hu4M1LD6Q8ViiMdHRxcCW
	sQuemTLgHRXhY96+OU12ViF7TGwr74055sLMU/Qpub/VclCIkPtPHbIvlKufGzikqQ+Yzc
	1fi7qvIOHd/ht+XlQUyxN3qBv6JFUQo=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
Date: Sat, 30 Nov 2024 21:14:36 -0600
Cc: Takashi Iwai <tiwai@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com,
 perex@perex.cz,
 conor+dt@kernel.org,
 dmitry.torokhov@gmail.com,
 corbet@lwn.net,
 broonie@kernel.org,
 lgirdwood@gmail.com,
 krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com,
 tiwai@suse.com,
 robh@kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
X-Migadu-Flow: FLOW_OUT

Sorry to chime in late, I only look at email occasionally.

>> Well, from the sound subsystem side, the only concerns are the design
>> issues: namely, whether the implementations with two cards are
>> acceptable, and whether the current control of PCM mapping is OK from
>> the user POV.  IIRC, there were discussions with Intel people and
>> others, and I haven't followed whether we got consensus.
>> If we reached some agreement, it'd be appreciated if you can put acks
>> from them in the patches, too.

My Reviewed-by tags were added in the last updates. I am not sure if =
anyone else at Intel had the time to review this large patchset.

> I believe Amadeusz was still against having the two card design, and =
wants the routing to automatically happen when playback happens on the =
sound card created by the USB SND layer.  However, even with that kind =
of implementation, the major pieces brought in by this series should =
still be relevant, ie soc-usb and the vendor offload driver.  The only =
thing that would really change is adding a path from the USB SND PCM ops =
to interact with the ASoC entities.  Complexity-wise, this would =
obviously have a good amount of changes to the USB SND/ASoC core =
drivers.  Some things I can think of that we'd need to introduce:

The notion of two cards was agreed inside Intel as far back as 2018, =
when Rakesh first looked at USB offload.=20

Having a single USB card in IMHO more complicated:  what happens for =
example if you plug-in two or more USB devices? Which of the USB cards =
will expose an optimized path? The design with an ASoC-based card which =
exposes as many PCM devices as the SOC can support is simpler =
conceptually and scales well. This would allow e.g. to allocate these =
PCM devices with different policies (last plugged, preferred, etc).

Conceptually for the simple case with a single USB device, it does not =
really matter if there are two cards or not. What matters is that there =
is a clear mapping visible to userspace so that application can decide =
to use the optimized PCM device, when enabled, instead of the legacy =
one. And in the end, the application is *always* in control in terms of =
routing. It=E2=80=99s really similar to the compress offload path, some =
application changes will be required.=20

>=20
> 1.  Exposing some of the ASoC PCM (soc-pcm) APIs to be able to be =
called by soc-usb (to mimic a FE open from ASoC), so we can trigger ASoC =
DAI ops when USB SND FE is opened.
>=20
> 2.  Proper fallback mechanism in case offload path enablement fails to =
the legacy USB SND path.
>=20
> 3.  Master kcontrol to disable offload logic for each USB SND device.
>=20
> IMO, both the points you mentioned correspond to the same topic.  If =
we go with having offload being operated on one FE, then there is no =
need for the kcontrol of PCM mapping.  If we have two cards, then we =
will need the control for offload device mapping.  Can't speak for =
Pierre, but at least with my discussions with him, I don't think he's =
against the two card design, just as long as we have the proper kcontrol =
that notifies userspace of how to utilize the offload path.

Even if there=E2=80=99s a single card you need to have a mapping between =
a =E2=80=98legacy=E2=80=99 PCM device and an =E2=80=98optimized=E2=80=99 =
one. This would be a scalar mapping instead of a (card, device) pair, =
but it=E2=80=99s a minor change.

-Pierre=

