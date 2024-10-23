Return-Path: <linux-input+bounces-7661-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F339AD128
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 18:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7CBD1C21F14
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 16:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652231CB326;
	Wed, 23 Oct 2024 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="bXOrI+Gp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB2D1CB334;
	Wed, 23 Oct 2024 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701543; cv=none; b=N/v+T6uKAP6QvBqHnuikV/nFyTXbFKtXNfX6zsbnHTataHKBuV6Zcztl5M/8NVBGogOvKUZ7R68dCGkrQPK9ggfYR2rhtDc6j785CIVKqjCrSkbewTeJZHyI2jD/KCY16rmErYcTVKAi7/pQhEEYL8+ESQ9/TCGCcOjC5kKC33c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701543; c=relaxed/simple;
	bh=+ST3KTcIniVHqkkNviVk+Y9y6iICjWEfZxLErDAg0hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRsSGuEOeyWYAbdsfeFa8z25S2ZI/TCE7LAUwd8TOeN3c0WxGrSYl7hLfFo9IMm+jFfvBr9/I1vT0mUjMoYhnszzfqQvwwgZW8aM52RfAINKvn8ZfUC1iB/qVIWDBQQCGVwXZCTF0OgJEFEienBYj1bw8qCHr7a40A/g2NkmXtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=bXOrI+Gp; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8E2802FC0059;
	Wed, 23 Oct 2024 18:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1729701530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qiQI9gPCZD8o3BwnJMzsmwHDB3fnS00qb76DJ3bQLGY=;
	b=bXOrI+GpHBr4zEnl09G31WUIukro7azzzzx5JD4Nb7nnGE8oNQjBFwGKUJ5f6tAM/DD//m
	Q+MnyJ1V5ZLNSAkVRKLE7e4+dqs56dQ7Vj3iHzkCK2eEKoTACh6NQCF0rAX7FunR0yDLRq
	Os43wW3qIK1ykuE906hADe6q2q9J3d4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b849b2af-1778-4da0-90ea-198a6da89166@tuxedocomputers.com>
Date: Wed, 23 Oct 2024 18:38:49 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Benjamin Tissoires <bentiss@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 22.10.24 um 11:47 schrieb Pavel Machek:
> Hi!
>
>>> Sorry for taking a bit long to respond.
>>>
>>> This "illumination" subsystem would (from my perspective) act like some sort of LED subsystem
>>> for devices with a high count of LEDs, like some RGB keyboards.
>>>
>>> This would allow us too:
>>> - provide an abstract interface for userspace applications like OpenRGB
>>> - provide an generic LED subsystem emulation on top of the illumination device (optional)
>>> - support future RGB controllers in a generic way
>>>
>>> Advanced features like RGB effects, etc can be added later should the need arise.
>>>
>>> I would suggest that we model it after the HID LampArray interface:
>>>
>>> - interface for querying:
>>>   - number of LEDs
>>>   - supported colors, etc of those LEDs
>>>   - position of those LEDs if available
>>>   - kind (keyboard, ...)
>>>   - latency, etc
>>> - interface for setting multiple LEDs at once
>>> - interface for setting a range of LEDs at once
> How are LEDs ordered? I don't believe range makes much sense.
For LampArray the spec suggests (but not requires) "row wise" starting in the 
upper left, however the spec does not specify how to handle with double row keys 
like iso-enter or half-key-downward offset arrow keys like they exist on some 
notebooks.
>
>>> I do not know if mixing sysfs (for controller attributes like number of LEDs, etc) and IOCTL
>>> (for setting/getting LED colors) is a good idea, any thoughts?
>> I wonder what the advantage of this approach is over simply using HID LampArray
>> (emulation), openRGB is already going to support HID LampArray and since Microsoft
>> is pushing this we will likely see it getting used more and more.
> There's nothing simple about "HID LampArray". Specification is long
> ang ugly... and we don't want to be stuck with with OpenRGB (links to QT!).
It is the only vendor agnostic approach to complex userspace lighting control 
atm. And what's the problem with QT?
>
>> Using HID LampArray also has the advantage that work has landed and is landing
>> to allow safely handing over raw HID access to userspace programs or even
>> individual graphical apps with the option to revoke that access when it is
>> no longer desired for the app to have access.
> HID raw is not suitable kernel interface.
>
>> Personally I really like the idea to just emulate a HID LampArray device
>> for this instead or rolling our own API.  I believe there need to be
>> strong arguments to go with some alternative NIH API and I have not
>> heard such arguments yet.
> If you don't want "some alternative API", we already have perfectly
> working API for 2D arrays of LEDs. I believe I mentioned it before
> :-). Senzrohssre.
>
> 								Pavel

