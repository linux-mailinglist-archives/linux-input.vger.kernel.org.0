Return-Path: <linux-input+bounces-16114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CECC5B462
	for <lists+linux-input@lfdr.de>; Fri, 14 Nov 2025 05:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5F733ADC85
	for <lists+linux-input@lfdr.de>; Fri, 14 Nov 2025 04:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2531FECAB;
	Fri, 14 Nov 2025 04:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="khJdRPhg"
X-Original-To: linux-input@vger.kernel.org
Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [203.4.137.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFFF27990C
	for <linux-input@vger.kernel.org>; Fri, 14 Nov 2025 04:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.4.137.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093543; cv=none; b=bJWnb/ppJfMNovAdCy+zAq1CZWxo/v7G4YDq2nMGmfR1DkYL3hWylIdPA8E78VeVrIYEAhIkbIK+4nBJgmYcsRaG9jy+9+CN2RxONxJsLEd/TNNIimDhzcZ93iP/o06vryGuqHmkcaGayiRlD5VGDksqOT4TjXW912NAcN7jMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093543; c=relaxed/simple;
	bh=x0fSU5bxCEk2UACHi2tIflekFoLBKv+NGzbidTZ1mK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhXLV0DsxfAw4qulLnUf3w3qFtGZq6Ka2y/0dJn2YzyC+3e+50cT/bjTkrvRwglxsO1HI4ecgsuEhbSPAcW/immkTFxPaWyS4slGlAZ/PFRykq2A+krR5EXBz3CcJT5NaP/Fvsew2j94hp9kGbM1xnrUhBZlnZXQlMpdkGF59/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au; spf=pass smtp.mailfrom=crc.id.au; dkim=pass (4096-bit key) header.d=crc.id.au header.i=@crc.id.au header.b=khJdRPhg; arc=none smtp.client-ip=203.4.137.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crc.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crc.id.au
Received: from mailfilter.crc.id.au (localhost.localdomain [127.0.0.1])
	by mailfilter.crc.id.au (Proxmox) with ESMTP id 7B2986481D;
	Fri, 14 Nov 2025 15:04:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=default; bh=qX85aDsPmt1L9w7kh
	nqA+GeYMH1R5q6MUsmCoAgbeOo=; b=khJdRPhgJVy3R4o529KHSD2uiEmfwaNU5
	0YD1uriWyfTaQZPRXKhEEq2Fme2L89n5SOJIJM5vTyuROwIKtr9Zd2cN2Drt8QYc
	4HCGjU+tT4PIa2yYQfVihoZ1c21Bgey9qO/NN+gAnSzgRCRyVgyDnnCgJsTuWiuE
	VIxqOm6aCkzP5EJa2TFm9H5Ynqlt3HOiA/uqPnp1cR4W9RSAnuf6eY1kTZqrM2Sy
	087dHDsYqDaFoF3su6JjK6jUbf7XiZsAmKrxPQypaY8XuF3Dk6yLuP+0JjwjGTKw
	uwiMgEv+mVBSl7RIZU2JsuIgCMAAohaymlm+um7pg4e7jMqej+yi5SycQa+40jq4
	BVR6Ty1JrL0/JuCNl5pkUczfTyGS6vn2B9Q+VHxUVttqX+dR0WTWStLiPyPi5rMe
	dxpEbquuVwEljHOoaF5A4alYG2y/XGcvsoewkA204oNfuNIbK1PkAejcCbqvu+67
	KO5352645E4gX1lQiEYax/730pnwFBHhSsQekX6IPPe+NwY/ZoyLWnpRSW36mBFv
	mmXg3BbYz6nPQ/0p6/kpJ/2l6OWjOApw4RkDvcVWMC90UQ+JwpokdJVImTABAjbH
	8sW8bUmt0vJkTWUedJ4eCXwpSZLO8Ag9+qDr9XxDu3gLPQ4Q9WWakAx8w8pQaNFw
	ntvKuS0TVs=
Message-ID: <c12cb1c4-2d6c-47c9-835c-898ad83677bc@crc.id.au>
Date: Fri, 14 Nov 2025 15:04:43 +1100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hid_multitouch - random non-responsive, multitouch, scrolling and
 zooming
To: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: =?UTF-8?Q?St=C3=A9phane_Chatty?= <chatty@enac.fr>,
 Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org
References: <2a878c8a-0289-4378-9c32-6eaf57e7dbfc@crc.id.au>
 <d058871a-a2c6-4197-a77c-08edb0ce70b4@app.fastmail.com>
 <fd7e0577-a992-4761-823b-b5fe41a7ee74@crc.id.au>
 <8720ac11-2b1d-4b42-84c8-52407dbda7e7@app.fastmail.com>
 <26b03bc2-b824-4948-9803-5a0b5f08e394@crc.id.au>
 <ed69f310-8a4d-4023-b1ce-72b78e512177@app.fastmail.com>
Content-Language: en-AU
From: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <ed69f310-8a4d-4023-b1ce-72b78e512177@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/25 00:54, Benjamin Tissoires wrote:
> 
> Right now the most valuable would be to test the series at
> https://lore.kernel.org/linux-input/20251008-fix-sticky-fingers-v1-0-760f1f26fce3@kernel.org/T/#m0fba507cbd43acd36bef28151ecb90b7077606a4
> 
> If this work and you want a quick and dirty fix you can then return to the default kernel, and use the BPF from https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/204, the latest version should be compatible with your device, just re-download and install it again.
> 
> But definitely a tested-by on the kernel patch would be appreciated :)

Hi all, I know its been a while - and I almost forgot about this after 
installing the BPF update to test.

That is until I did a reinstall on that laptop of a fresh Fedora 43 KDE 
install. Oh my, what I didn't realise was actually fixed :)

I checked here again:
https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/204/pipelines

It looks like the artifacts that I downloaded prior don't seem to be on 
the gitlab instance anymore.

I grabbed a different artifact, but I'm pretty sure that was based on 
the main branch, so it didn't apply to my touchpad.

I had a look around, and noticed that the kernel side fixes seem to be 
in the works for 6.18.0 - am I understanding that right?

I can see some 6.18.0-rc5 packages for Fedora that I can probably 
shoe-horn into Fedora 43 if that is a reasonable way forward.

What's the best way at the moment to go forwards now?

-- 
Steven Haigh

📧 netwiz@crc.id.au
💻 https://crc.id.au



