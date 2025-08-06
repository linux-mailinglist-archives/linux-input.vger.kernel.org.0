Return-Path: <linux-input+bounces-13830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD30B1BDC7
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 02:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D427AE616
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 00:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73912EADC;
	Wed,  6 Aug 2025 00:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="TiX0F+P2"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71646DDAB;
	Wed,  6 Aug 2025 00:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754439409; cv=none; b=S8GANHS//rhbLzKUOV9tyO2idnLGiaUZetNCpb/YfCfiQjQyu14PyAjZUfYi/eqI92QaWLm5skgy8uTB4qEbSJV2M0/oqqwoxRlVmJtWffr8puRqSGMnKtsAmiJ7O9WT+w60enY6NjxhPI5z1U7DXlQY3IXDrdmJHH/fuKf+erk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754439409; c=relaxed/simple;
	bh=eo0k5fk31VzWja4brLjy00H1B4D+XJXyA8qqzBF4rtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Za+d/OW6EyjE37ZASoy/CTFzAd1LgozxLxKf5kt7YvOfdpyqXZuUZMOoZh+D28xmX2WeT5SsCtuCoEJS4YBFdzLfiY0Yn8MU9bUXZmiglGamrNCiT3lJXse2b2ABcroQuuGv1POVA+LiSJtp5+P3v5jd5wLmmW00lFUfYJXH7ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=TiX0F+P2; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1754439406; bh=eo0k5fk31VzWja4brLjy00H1B4D+XJXyA8qqzBF4rtw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TiX0F+P2CMpB+e3dXtS9nvaMJNX75rwTcQVB9G6PdE7x6HYe9A+JYEnXxb0s7EH5C
	 kAXxd3GSnwKDoFeIt1Wz7YpMuF8sVJ+HsXEmlc9rxf55ixwXB0sDtFj2YuUcNYTsl/
	 blermp6lI4kwACfSLJ7M7IcTUmlGWB29Pgg9evAcRdSN7mfHG8RTZHny3134e+7DOA
	 UvDA3prspDYzhGgla0RkxDnG3L5lCOcyjSExkznPqx/UEnvz1GOgTylLF4XkhG0ASy
	 jM3/1BZN1ILqBNZtWUAXNCJhH2l4eiwDa/yQjumRZeqSadHU/du75VsZE7s0H51kjB
	 5K0CoM7+6Jeaw==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 011B3A043;
	Tue,  5 Aug 2025 17:16:45 -0700 (PDT)
Message-ID: <c4e5f516-ba90-4c50-8a79-0bffa5b0f1f0@endrift.com>
Date: Tue, 5 Aug 2025 17:16:44 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xpad: Add support for Thrustmaster, Inc. Ferrari 458
 Spider Racing Wheel
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?P=C3=A4r_Eriksson?= <parherman@gmail.com>,
 Pavel Rojtberg <rojtberg@gmail.com>,
 Nilton Perim Neto <niltonperimneto@gmail.com>,
 Antheas Kapenekakis <lkml@antheas.dev>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250805192036.53918-1-parherman@gmail.com>
 <1607cb00-1146-4a64-92cc-65eb91062706@endrift.com>
 <qnu5h6nyigaxdv3m3uxfztrxm6bad6hv6jfnvgbkr5ewhjgplz@dleqh5zzljbd>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <qnu5h6nyigaxdv3m3uxfztrxm6bad6hv6jfnvgbkr5ewhjgplz@dleqh5zzljbd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry

On 8/5/25 1:57 PM, Dmitry Torokhov wrote:
> Hi Vicki,
> 
> On Tue, Aug 05, 2025 at 01:23:39PM -0700, Vicki Pfau wrote:
> 
>> I have a new driver I've been working on for a few months that
>> supports all of this stuff properly, including wheels, that I am
>> hoping to support for the 6.17 merge window.
> 
> 6.17 merge window is closing this weekend so no new drivers can go into
> it anymore, only what was in maintainer trees/linux-next.

I see. I haven't been paying attention to how merge window timing works until now, so that's on me for not cleaning it up sooner for this cycle. My other concerns for this patchset still stand, though.

> 
> 6.18 is the earliest option.

That gives me more time to clean it up and generally get it working better, so I guess it's a trade-off here. It's still missing some features I'd like to get in so I don't have to do significant refactoring later.

> 
> Thanks.
> 

Thanks,
Vicki

