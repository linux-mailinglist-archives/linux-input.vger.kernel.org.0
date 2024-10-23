Return-Path: <linux-input+bounces-7662-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825529AD24A
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 19:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2AE6B221CE
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 17:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B41C1CB334;
	Wed, 23 Oct 2024 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="mJ68xLxi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6860878C90;
	Wed, 23 Oct 2024 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729703668; cv=none; b=kGcLjX3EKlMzik8x0c3zDKKFaTW3wQf5zZaktmBNUztaKJ9rE3PmteQvUn1+yV20hVnKmaMeLFTPm3+3PCgJ3IxWLwB7P7XeZCej5GhbNctPNRSwvahDY0BYoqLNELj3i4IJD3HF/0woSRPY5AE5ZHkJeQMrzgCRJM7xke6IGus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729703668; c=relaxed/simple;
	bh=E8WP7u1+SciiTIGVjmuY1rohvde5naGggge0IzuuUfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amIYrNy+TtaUEvmWbg/M+q4206xSp85Y6nRVIHgMDHXm1slE+FC8OZhse7tmyen3EUEBvqR4isPGXNUmz1UChSC9vCsfJgK78Ny4mdZZu74x3gAd/t8mp07EmdRRjA4tBs/C0s+dP86a44GUa2tMOUZr8Wk1YnOXuWaRxQt7kxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=mJ68xLxi; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C303D2FC0059;
	Wed, 23 Oct 2024 19:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1729703662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ij9zwFvuXFBDoW4kC2rr9WT96DzuvZ7BkBrnd8lgs6o=;
	b=mJ68xLxiO0fLlSPSR4QHJxmpiVn7Hq3tqOWvRVDFGaiTEFqA9tN/klDmyvHYafBn6oglEF
	nlbxBLgcSEXqMuK6aPojPFWytK/ZjV+XK5HeUnL3xph7FnS8JyMlinnj3aIy+PCcOIaBzr
	jCIkaay8FLMnNQYCFGtftmOeS+j+1Ro=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c0791e1d-a63f-40fd-bcb8-5f2eec15c59e@tuxedocomputers.com>
Date: Wed, 23 Oct 2024 19:14:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>, Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <Zxd0ou7GpCRu0K5a@duo.ucw.cz> <35a98b67-d1eb-4aa9-9d3f-025c94cd6b0f@gmx.de>
 <Zxf5u9jgmt9vpz2u@duo.ucw.cz>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <Zxf5u9jgmt9vpz2u@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Am 22.10.24 um 21:15 schrieb Pavel Machek:
> Hi!
>
>>>>> - interface for setting multiple LEDs at once
>>>>> - interface for setting a range of LEDs at once
>>> How are LEDs ordered? I don't believe range makes much sense.
>> Range would allow for efficiently changing the color of all LEDs. But i agree
>> that this can be considered optional and can be added later.
> Yep, setting all of them makes sense. We should probably provide
> backward-compatible interface for keyboards with single backlight, so
> this would likely be LED class.
>
>>>> Personally I really like the idea to just emulate a HID LampArray device
>>>> for this instead or rolling our own API.  I believe there need to be
>>>> strong arguments to go with some alternative NIH API and I have not
>>>> heard such arguments yet.
>>> If you don't want "some alternative API", we already have perfectly
>>> working API for 2D arrays of LEDs. I believe I mentioned it before
>>> :-). Senzrohssre.
>> We may have to support 3D arrays of LEDs, so using a simple framebuffer
>> would likely cause trouble.
> Do you have pointer for device that is 3D?

The example from the spec is a keyboard with lightbars on the side, the we 
actually sell notebooks with similar led configurations (mostly on the front and 
not on the side). Example is the Sirius I implemented which has a not yet 
implemented lightbar on the front.

Another usecase is probably ergonomic keyboards, but I cannot tell you a real 
world example atm.

>
> OpenRGB manages to map keyboard into plane... so what I'd propose is
> this:
>
> Framebuffer
> Information for each pixel:
> 	    present ? (displays with missing pixels are pretty common)
> 	    list of keys related to this pixel
> 	    width, height, length (if we know them)
>
> Pixels map to keys M:N.

How would iso-enter be mapped here?

How would the q-key be mapped relative the the 1-key? (they are exactly halve a 
key offset)

would it be:
~,1,2
tab,q,w

or:

~,1,2
tab,missing pixel,q

Regards

Werner

>
> Yes, we'll have some number of non-present pixels, but again, I
> believe that's not uncommon due to round screens, etc.
>
> (But I'm fine with other interfaces, as long as they are "normal")
>
> Best regards,
> 								Pavel
>

