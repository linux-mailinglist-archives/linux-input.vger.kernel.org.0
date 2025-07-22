Return-Path: <linux-input+bounces-13627-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49FB0D414
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 10:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBF0A16FCD9
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 08:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573E928B3FA;
	Tue, 22 Jul 2025 08:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cRzDdcVo"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7DD1A08DB;
	Tue, 22 Jul 2025 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753171425; cv=none; b=lW3hEdYGes+zQ+8OwbfvBAEATiC/OteS2pVvSwI2pJpIGgzzENCsCpTaxmGjA/87Qfsh1b1FXckwYvn4dZjfh2HWJa7I1JwmmAzUeHDG+eL9Jzbv/+oilGtomDlujqPBUVpDFbhR3I+xo8ysADQcmxeQdNoqTo23cW+6JXeYLbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753171425; c=relaxed/simple;
	bh=eA5+R3iRC7uAyv27hJikbJ/sFtKe5209YIS/BB6b0Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4C6YnTj2jtNLJJBkDq90L0ZHwkCP8G09Fnj/DsCi071sUgT9PZ33zP/o6ZhO8f/1w9I8Qf/veLhju+AQhTUkAjvlHJNkw31kSwj77Wo1mKyHKehYShtj6UBDEg0TnzV+P7pZDVpCkBzErU6lvH3x6Cqt5avgHIrOvh/wSDpmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cRzDdcVo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753171421;
	bh=eA5+R3iRC7uAyv27hJikbJ/sFtKe5209YIS/BB6b0Jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cRzDdcVocvsJghmCnE5+VnYD+se8tc+UV3iDdlrLynN4FNiBQDYQ+24C1ffvVNGlO
	 G49rfXo5VlXIKVxuUAEUH3+CzdrNao7Dh9VJ8z9orXUR0C16id79LaeAtHXMqFY11H
	 wKgrljXFfLv6ikIrPWIGQSxOrJ1pN0FGxSbaD8MdruCsK36v0JbThIXKxtUtcyUEQC
	 b7Jd9EdE+vgyQOJuYxUD9PFg6EYpqLZWaoxJKxJ3/ISckjVk2K+u0P+iYVW8v6YmM/
	 +tELXzmHixGv/B/H9UYqISa1R01YY2uc2gK+TpyHeMeMLgFUzKaaLaGLJcK/yYlHQG
	 KPmB0+mfHGa0g==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D46517E0DD0;
	Tue, 22 Jul 2025 10:03:41 +0200 (CEST)
Message-ID: <ab1c06b1-9b79-426a-a43b-cf5a89688770@collabora.com>
Date: Tue, 22 Jul 2025 11:03:40 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet>
 <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
 <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
 <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
 <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roderick,

On 7/22/25 9:18 AM, Roderick Colenbrander wrote:
> Hi Cristian and Jiri,
> 
> One thing I forgot to bring up is whether it is best to have the audio
> plug logic have its separate input device or have it be part of an
> existing (e.g. main gamepad). The patch currently creates a separate
> input device. Originally we added multiple input devices (gamepad,
> touchpad and sensors) due to axes and button collisions really.
> 
> For this feature there is no collision. There are not many devices in
> the kernel, which support these audio EV_SW. I see for example the
> Switch 2 controller has a mini jack port as well. Some xbox
> controllers too (though audio not supported in the kernel from a quick
> glance or at least no HID or xpad driver features for them).
> 
> I don't have a strong opinion yet. Initial feeling was perhaps have it
> on the 'main' input device. But on the other hand, I'm not sure what
> software is normally listening for these kinds of EV_SW events. What
> would be listening for this like a pipewire?

For now this is going to be used by the usb-audio driver which contains a
quirk [1] creating the jack controls for headphone and headset mic,
respectively.  This will further setup an input handler for each of them in
order to intercept the related hotplug events.

But it can be also used directly from ALSA/pipewire, e.g. for monitoring,
hence it think it's best to keep it as an audio dedicated input device.

Regards,
Cristian

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/sound/usb/mixer_quirks.c#n540

