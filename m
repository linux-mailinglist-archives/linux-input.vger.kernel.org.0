Return-Path: <linux-input+bounces-7665-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C119AD35A
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 19:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F448283F6C
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 17:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A961CF7D3;
	Wed, 23 Oct 2024 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="L57meQvR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA2D15EFA0;
	Wed, 23 Oct 2024 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729706085; cv=none; b=BWQwLBN6aqaDhdgS5z89TawdUwF30h6uvnX7JMn2IR2O+JVP3Xh0tDtgPlrgytaUi9jRcJ4jiGctoWrzkw+JiHtBGrSVkg73GD1lUY6wMjdvvniKDqM3hyR8BBhIrqd6nO+BEjs3GFJY8lR4xE1tdZ71tEwgVYwMBmTDjirZFWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729706085; c=relaxed/simple;
	bh=FeQrnl/Qbqd5tte+UM4+fj/8ecOkjXc/c7EqWD06SD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZ7EVxe7Zk/FqTi6athZOOHY2FVE4L1eWrsDY7Xk2GiE4pO78x3GSOajNvHbQtGbrEpvwNM8dMGNaDcptMMKoD28VVDsy1Ske/7cmsjKNA8En4qwIAwND4JBOaWkIecjg+NvL+oayvOVOkrEuxDFuvSepQcgLu/ggYSMe0li3NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=L57meQvR; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 4C25D2FC004A;
	Wed, 23 Oct 2024 19:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1729706080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qg6J2ZKjKuT4NxpJxzY+/4uhSMmE1FV8vXNLyqWjSwU=;
	b=L57meQvRSn7NFM0dls4nqJzDyda9eeYwdS3HS23gutt88rjXInhg+hgsce9YkuDFNsHZhM
	r+VvwxPvLdEBP/gpHU0noFZrQ5PyiwOtT3+B0tu1NpWPHygJXhTwahz2jKOLzxmFnLeny+
	t5DMP+scGYbBMOV+Gxm8nW85au0Es48=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <73c36418-34d6-46cf-9f10-6ca5e569274f@tuxedocomputers.com>
Date: Wed, 23 Oct 2024 19:54:39 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>
 <ZxdyQFMRIRusMD6S@duo.ucw.cz> <eb829c6c-cee0-4d65-b9d6-3df7fd1096a7@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <eb829c6c-cee0-4d65-b9d6-3df7fd1096a7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 22.10.24 um 17:02 schrieb Armin Wolf:
> Am 22.10.24 um 11:37 schrieb Pavel Machek:
>
>> Hi!
>>
>>>> Personally I really like the idea to just emulate a HID LampArray device
>>>> for this instead or rolling our own API.  I believe there need to be
>>>> strong arguments to go with some alternative NIH API and I have not
>>>> heard such arguments yet.
>
> Using a virtual HID LampArray already creates two issues:
>
> 1. We have to supply device size data (length, width, height), but the driver
> cannot know this.
>
> 2. It is very difficult to extend the HID LampArray interface, for example
> there is no way to read the current LED color from the hardware or switch
> between different modes.
>
> A sysfs- and/or ioctl-based interface would allow us to:
>
> 1. Threat some data as optional.
>
> 2. Extend the interface later should the need arise.
>
> Looking at the tuxedo-drivers code, it seems that the WMI interface also reports:
>
> - preset color
> - device type (touchpad, keyboard, ...)
> - keyboard type (US/UK)
>
> Making this information available through the HID LampArray protocol would be
> difficult (except for the device type information).
>
>>> Agreed on everything Hans said.
>>>
>>> I'll personnaly fight against any new "illumination" API as long as we
>>> don't have committed users. This is the same policy the DRM folks
>>>> are
>> Well, and I'll personally fight against user<->kernel protocol as
>> crazy as HID LampArray is.
>>
>> OpenRGB is not suitable hardware driver.
>>                                 Pavel
>
> I agree.
>
> The point is that we need to design a userspace API since we cannot just allow
> userspace to access the raw device like with HID devices.
>
> And since we are already forced to come up with a userspace API, then maybe it 
> would
> make sense to build a extendable userspace API or else we might end up in the 
> exact
> same situation later should another similar driver appear.
>
> Since the HID LampArray is a hardware interface standard, we AFAIK cannot 
> easily extend it.
>
> Also i like to point out that OpenRGB seems to be willing to use this new 
> "illumination" API
> as long as the underlying hardware interface is properly documented so that 
> they can implement
> support for it under Windows.
>
> I would even volunteer to write the necessary OpenRGB backend since i already 
> contributed to
> the project in the past.

Just wanting to leave my 2 cents here: I'm in theory fine with both approaches 
(hidraw LampArray or wrapping it in some kind of new UAPI which at least has the 
LampArray feature set).

I also don't think that OpenRGB has a problem with a new Linux exclusive API as 
long as someone is doing the implementation work. After all the reason why 
OpenRGB was started is to unify all the different vendor APIs under one UI. So 
one more or less doesn't matter.

BUT: I already did work for the hidraw LampArray approach and OpenRGB already 
did work for that as well (albeit I didn't yet managed to get the draft running) 
and we already had a lengthy discussion about this in the last thread. (This one 
https://lore.kernel.org/all/20231011190017.1230898-1-wse@tuxedocomputers.com/) 
with all the same arguments.

e.g. Expansion of the API: How should that look like? It would have to be 
basically an own extension for every keyboard manufacturer because every one 
supports different built in modes with different values to tweak.

So I'm siding with Hans and Benjamin on this one.

My only plan for the current patch besides some more code beautification: Move 
the device-sku specific values (key map, and key positions) to a bpf driver.

The question in my mind currently is: Is the patch merge ready with just that? 
Or must the OpenRGB implemenation also be finished before the merge?

Best regards,

Werner

>
> Thanks,
> Armin Wolf
>

