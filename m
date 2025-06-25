Return-Path: <linux-input+bounces-13030-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26CAE7B81
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 11:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB5D1656E6
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 09:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DA8286422;
	Wed, 25 Jun 2025 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="rTnJhQCf"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F371EA7CF
	for <linux-input@vger.kernel.org>; Wed, 25 Jun 2025 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842407; cv=none; b=G/tq42V76lw22cXFrAl36/gLC9UrfU3ktpW2bjUWefvcSqFvp5FGy1ur7gY2fRVDNcmj3zn0bYjh/dfqkIOQ3vPhyCndMlbqbJFt+0mN1P6zbQRhBpt+UlSRwk+ZebWMGptGSc5h/H6m8mpM7OR98xDAGsCyylJBnrxmp6ptzXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842407; c=relaxed/simple;
	bh=HSpdkq72Px0xetP/0z+N3WieYqQ5EeVGs+k/WNFX6T8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=inLDxEylui2ZopXRl0SAuCvzpFBU6RZhk/dmPdS4S/CprkoNvL+A6dO30b5hSIm9OUvLb6w3g8InN3I5IfgCtG7SuoViQBgZvUrqenO0LpqUaiRXUvJbSw+jFEdzvaVIF9S5T03UNJWKxUsvr4vvpBT39dNLdSOeCZI8FOFMmuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=rTnJhQCf; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1750841872; bh=HSpdkq72Px0xetP/0z+N3WieYqQ5EeVGs+k/WNFX6T8=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=rTnJhQCfTbSKWaaHNZmz8+E/FPw4dillc1kKhukyAx/ohfVC3Aqv59+qvgMvob2an
	 gkUj5n69lgpxmvLQwkEZCEaQCQJcWmXrPzQb2Hn7DAWR1ltZSTMvfQazGTlbTgEbfq
	 xWk83CT1huqvG9emWUotugq0y8CeE7y4O0O0IIAUYWsnejS7M6SA8ba3PpzJOa7nY1
	 1igcTNJ2hz9GMSr+4HywO80/Xx0wZ2OvcflhEbSRxPUNzYg9vQsO3VY6A/7AvOadM/
	 irabfUEYmpMIAu3nujdmVdOovAPe9/FJ97x/x5j3rU8V8YoE7eekcZ33eaDXkqo3ig
	 wU6IT/cWGwFHw==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id B5A23A028;
	Wed, 25 Jun 2025 01:57:52 -0700 (PDT)
Message-ID: <625ccbb5-4bd7-4d09-8422-e111c2ab407a@endrift.com>
Date: Wed, 25 Jun 2025 01:57:52 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding more ABS axes and BTN spaces to evdev
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>, bentiss@kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <d04aee95-df86-4863-bd54-b9d7957199c7@endrift.com>
Content-Language: en-US
In-Reply-To: <d04aee95-df86-4863-bd54-b9d7957199c7@endrift.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello again,

On 6/16/25 7:34 PM, Vicki Pfau wrote:
> Hello,
> 
> I've recently been doing some bringup work on some flight stick and racing wheel controllers and have run into a few issues with how to expose it to userspace that I'm not sure the best way to solve.
> 
> For flight sticks, the protocol I'm working with allows for up to 64 buttons on top of a set few, as well as up to 16 axes. There doesn't appear to be good spaces within within either ABS or BTN for these. Though I don't know any devices that use that many, I am worried about the space for axes especially. Though I can probably fit a few after ABS_MISC, but really not that many.
> 
> More directly important, though, is the racing wheel controllers. The protocol specifies four types of axes and one thing that would fit fairly well as an axis: accelerator, brake, clutch, handbrake, and shifter. It looks like Windows treats the shifter as a series of buttons, one for each location on the shifter, but that's a little less desirable than using an axis for it in my opinion. Regardless, there's no good place to map clutch and handbrake. For clutch, at least, I would assume the best approach would actually be to add a new axis: ABS_CLUTCH, perhaps at 0x1d. Would this be a good idea? And if so, would adding ABS_SHIFTER and/or ABS_HANDBRAKE at 0x1e/0x1f also make sense? Barring that, I can use a few ABS_MISC axes, but that is perhaps suboptimal for conveying intent to userspace programs.

I realized while looking at this again that 0xb-0xf are also unused, so perhaps ABS_CLUTCH at 0xb, ABS_SHIFTER at 0xc, and ABS_HANDBRAKE at 0xd.

> 
> I looked around other devices in the kernel to try to figure out what prior art there was for this stuff, without much luck. I saw ABS_RUDDER in use in a few places, but it wasn't quite clear to me what that's being used for without the devices in question. I'm also not clear on what the HID driver does for things like this.
> 
> How should I start moving forwards with this?
> 
> Thanks,
> Vicki

If I were to go about doing this, should I just put it as one of the patches in a series with the first use of it?

Thanks,
Vicki


