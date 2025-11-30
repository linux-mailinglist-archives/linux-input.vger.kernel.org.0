Return-Path: <linux-input+bounces-16402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF553C94BAC
	for <lists+linux-input@lfdr.de>; Sun, 30 Nov 2025 07:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D4DF3A4C0E
	for <lists+linux-input@lfdr.de>; Sun, 30 Nov 2025 06:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD2419DF4D;
	Sun, 30 Nov 2025 06:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="PZr3ERNP"
X-Original-To: linux-input@vger.kernel.org
Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [203.4.137.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919F17B50A
	for <linux-input@vger.kernel.org>; Sun, 30 Nov 2025 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.4.137.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764482510; cv=none; b=XYg8WLObmoW/DVcK/2R9gcTvYA3L3Jmb/gw7Otp+z3m3cFahf7AcPy1hqXmKNexRrY6XEceVrr9+wXIf5YelTZ/r+hussoAm79sUgQXiFL3kNKhEIJvj3FUyuDZGbYVYb3FX1ki8EuJKLQOw7l8CzelMO26RjU6bG2/b3S2BJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764482510; c=relaxed/simple;
	bh=/Wqq9mYaMmlFA+JetYeljZKMqZeHQH9BUjm2/D2m0zA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VP1R6ZvJLGC4QGk5BmlNXDRHWA4V1Q9I1/bMNULmwkEcGQSvth8Q+IuZA7X9tyNw+4wzexCyuTI6r7zubObK+FkLJEjEtCVg/Nr3zX+y47Rcf32b0cw4xSof74Gkdygdl+MF/ObogOBN4h+rEfYhnu57YQxSoTv1qQ4KW81rxmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au; spf=pass smtp.mailfrom=crc.id.au; dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b=PZr3ERNP; arc=none smtp.client-ip=203.4.137.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crc.id.au
Received: from mailfilter.crc.id.au (localhost.localdomain [127.0.0.1])
	by mailfilter.crc.id.au (Proxmox) with ESMTP id CE74C6234A;
	Sun, 30 Nov 2025 16:56:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=default; bh=ayW6z0HbArOyRYAHM
	U9e0RInxa9PZL4jXI4mTXp7NEA=; b=PZr3ERNP6gmR8rTsqT2FCGnTWS27QqWNg
	zhn0HLi/LtUIoczS3q+yarzZorbeWX6Ef9ZchdEn2EsQmxMAPDDy90nQW/cIbtAT
	C1rpDCKQykggWqMcQ/JQzjzdp6QSnXiP9iSavUYHNOIgg1o37OH5RJNODI+o1JtS
	xE/HmVnjI0y9RbH6arhSavb04zoODjlw0VgbT7svluQA59cFfzPrUPBmVbqh//Hr
	SpnUp6ixZo9LtyZCGG+3EkcQ0v54yobX7VZE5IlzQsEvr4toW2R+OVxXfJ2XOFXJ
	HeNSeI1kG3QcGI+htLs89J36csRoFBEhNpyzHAWPjzrTiHfMZnprt7C1/lEwiMdp
	5H8Cz3E0ExtLs4WdaROkTyRYe3Rq9aQZ/TJO6zGL/k16Pvq8/drFVwAc7xiz4Qvd
	02oQ0pRaTQpcoW2+I2JFcxbR22uvmuYo/vqsUpuoq61kl8bmhBN6FkCFeU7LBLBP
	dLqoz6OVjR8hUw5rKfgVFL1i23+Kqmh9deXcVUWN4Qvi31FHIZ3jDxiH9g6EYpMX
	Xnqff5KiJ6iPszGCPGOp2XVjSE9OZo22ZGW+73tyJZ2pjltgIRGeHiOdZjNQdSWL
	FTOEcSooILGH0DzEvX6vDIzO8r4RxxegAqT+g3vSGMZw7VU+8UpouE0b9FuE16A7
	IeJ8sRXsGg=
Message-ID: <39dc624d-4578-4d1a-80c0-4c1a11f0e2fd@crc.id.au>
Date: Sun, 30 Nov 2025 16:56:36 +1100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hid_multitouch - random non-responsive, multitouch, scrolling and
 zooming
From: Steven Haigh <netwiz@crc.id.au>
To: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: =?UTF-8?Q?St=C3=A9phane_Chatty?= <chatty@enac.fr>,
 Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org
References: <2a878c8a-0289-4378-9c32-6eaf57e7dbfc@crc.id.au>
 <d058871a-a2c6-4197-a77c-08edb0ce70b4@app.fastmail.com>
 <fd7e0577-a992-4761-823b-b5fe41a7ee74@crc.id.au>
 <8720ac11-2b1d-4b42-84c8-52407dbda7e7@app.fastmail.com>
 <26b03bc2-b824-4948-9803-5a0b5f08e394@crc.id.au>
 <ed69f310-8a4d-4023-b1ce-72b78e512177@app.fastmail.com>
 <c12cb1c4-2d6c-47c9-835c-898ad83677bc@crc.id.au>
Content-Language: en-US
In-Reply-To: <c12cb1c4-2d6c-47c9-835c-898ad83677bc@crc.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Just wanted to follow this up to see where we're currently at.

Thanks in advance.

On 14/11/25 15:04, Steven Haigh wrote:
> On 11/10/25 00:54, Benjamin Tissoires wrote:
>>
>> Right now the most valuable would be to test the series at
>> https://lore.kernel.org/linux-input/20251008-fix-sticky-fingers- 
>> v1-0-760f1f26fce3@kernel.org/T/#m0fba507cbd43acd36bef28151ecb90b7077606a4
>>
>> If this work and you want a quick and dirty fix you can then return to 
>> the default kernel, and use the BPF from https:// 
>> gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/204, the 
>> latest version should be compatible with your device, just re-download 
>> and install it again.
>>
>> But definitely a tested-by on the kernel patch would be appreciated :)
> 
> Hi all, I know its been a while - and I almost forgot about this after 
> installing the BPF update to test.
> 
> That is until I did a reinstall on that laptop of a fresh Fedora 43 KDE 
> install. Oh my, what I didn't realise was actually fixed :)
> 
> I checked here again:
> https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/ 
> merge_requests/204/pipelines
> 
> It looks like the artifacts that I downloaded prior don't seem to be on 
> the gitlab instance anymore.
> 
> I grabbed a different artifact, but I'm pretty sure that was based on 
> the main branch, so it didn't apply to my touchpad.
> 
> I had a look around, and noticed that the kernel side fixes seem to be 
> in the works for 6.18.0 - am I understanding that right?
> 
> I can see some 6.18.0-rc5 packages for Fedora that I can probably shoe- 
> horn into Fedora 43 if that is a reasonable way forward.
> 
> What's the best way at the moment to go forwards now?
> 

-- 
Steven Haigh

📧 netwiz@crc.id.au
💻 https://crc.id.au



