Return-Path: <linux-input+bounces-14992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9695B9351F
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 23:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85CC13A65BB
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 21:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3510D199920;
	Mon, 22 Sep 2025 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QjaE+TQE"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043634BA39;
	Mon, 22 Sep 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758575106; cv=none; b=RlQ2KfQ1zu7oeMQoSknKS5hnpB/xjZA3DOUQKfJBvX5+dgNQ9ueAIftcI9alkLg8xnJjU8HL59JunvP0jRI8kAeIKv51iiAuqOkczxS31uX+0eL+IA5oQKLMQmWvZK9b8lTeR12yfqp09uIgv7ZyGOIzi4+Mk7Qo7c82r6pQN94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758575106; c=relaxed/simple;
	bh=vpBcaWsjGqbDpSHHt1W2LxOyEjaSm/FPKdq14nz7mvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZNiNd/A4VF8twkEHnP8Ko6tmx7mEcP0xLQtsYjcc+K/9YidlhPUu+s4ymqTHjI4PsghEttv20E/IpAjL3V9phR1B7wXRNeKkRrpeEPXT+Sx1Z4JgtkYP8gzfWfiYoRldXgGlNJ6wU0Qa18WQLl0RUwxzX9MNDo6bc2bk5Z/l5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QjaE+TQE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758575101;
	bh=vpBcaWsjGqbDpSHHt1W2LxOyEjaSm/FPKdq14nz7mvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QjaE+TQERtcV5essLTA1cK8oI1gGbdbl8JSZ3EkCH2pGY/qLYYpf8Q+6mf3QjSSQu
	 SRGBcbUsqrNhWffDaxSvyZdtkVMIMJ5TnUy/6jPYSpKBF+Co/rJ97b+XyNCxdfy1G1
	 469npwaeptlEWST3ZzrSgAcYTvknmhUZJ+26lAeuuEk+FtGpIl/MC2jJiLZsUksDbO
	 l8c//oVsH3gXm84MtfkRSWfwBYTxsVVCnZpRoyEbl+9hhgqm9REs3eBj0N3CItZ/C1
	 b/qBpSabpPSHto92pZ5thoxZhqZu7frJ3ect4ikX95U8S6XjShCrhoYcjOhNbm8Eaw
	 QEMbmNDMxQ2oQ==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7176817E032F;
	Mon, 22 Sep 2025 23:05:00 +0200 (CEST)
Message-ID: <e9c9685a-6c8c-4f2b-a89c-e20cbbff370f@collabora.com>
Date: Tue, 23 Sep 2025 00:04:59 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] HID: playstation: Simplify locking with guard()
 and scoped_guard()
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 kernel@collabora.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <20250625-dualsense-hid-jack-v2-3-596c0db14128@collabora.com>
 <dor5e2ugnp4k5iava3uwxltttrfopkqoo23uex6xdu5rcz6rqt@7ett6gqco32m>
 <7fp3kik4b6wtzp65ir3bz5bw5r5qrjzi2nahwxkszjfptmsuyb@eoja4452cryb>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <7fp3kik4b6wtzp65ir3bz5bw5r5qrjzi2nahwxkszjfptmsuyb@eoja4452cryb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Benjamin,

Thank you for reviewing the series and sorry for my late reply, I've just
returned from vacation.

On 9/17/25 5:21 PM, Benjamin Tissoires wrote:
> On Sep 17 2025, Benjamin Tissoires wrote:
>> On Jun 25 2025, Cristian Ciocaltea wrote:
>>> Use guard() and scoped_guard() infrastructure instead of explicitly
>>> acquiring and releasing spinlocks and mutexes to simplify the code and
>>> ensure that all locks are released properly.
>>>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>
>> It looks like the patch is now creating sparse errors:
>>
>> https://gitlab.freedesktop.org/bentiss/hid/-/jobs/84636162
>>
>> with:
>>
>> drivers/hid/hid-playstation.c:1187:32: warning: context imbalance in 'dualsense_player_led_set_brightness' - wrong count at exit
>> drivers/hid/hid-playstation.c:1403:9: warning: context imbalance in 'dualsense_parse_report' - different lock contexts for basic block
>> drivers/hid/hid-playstation.c:1499:12: warning: context imbalance in 'dualsense_play_effect' - different lock contexts for basic block
>> drivers/hid/hid-playstation.c:1552:13: warning: context imbalance in 'dualsense_set_lightbar' - wrong count at exit
>> drivers/hid/hid-playstation.c:1564:13: warning: context imbalance in 'dualsense_set_player_leds' - wrong count at exit
>> drivers/hid/hid-playstation.c:2054:33: warning: context imbalance in 'dualshock4_led_set_blink' - wrong count at exit
>> drivers/hid/hid-playstation.c:2095:33: warning: context imbalance in 'dualshock4_led_set_brightness' - wrong count at exit
>> drivers/hid/hid-playstation.c:2463:12: warning: context imbalance in 'dualshock4_play_effect' - different lock contexts for basic block
>> drivers/hid/hid-playstation.c:2501:13: warning: context imbalance in 'dualshock4_set_bt_poll_interval' - wrong count at exit
>> drivers/hid/hid-playstation.c:2509:13: warning: context imbalance in 'dualshock4_set_default_lightbar_colors' - wrong count at exit
>>
>> (the artifacts are going to be removed in 4 hours, so better document
>> the line numbers here).
>>
>> I am under the impression that it's because the 2 *_output_worker
>> functions are not using scoped guarding, but it could very well be
>> something entirely different. Do you mind taking a look as well?
> 
> Turns out it's the mix of guard and scoped_guard that confuses spare:
> https://lkml.org/lkml/2025/6/8/74
> 
> the following shuts down all of the warnings:

Indeed, I think that would be the best workaround for now.  At least I couldn't
find anything better while experimenting with latest sparse commit 0196afe16a50
("Merge branch 'riscv'") - which is still almost 2 years old btw.

> 
> ---
> 
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index d2bee1a314b1..36f3ac044fdc 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -1274,9 +1274,9 @@ static void dualsense_init_output_report(struct dualsense *ds,
>  
>  static inline void dualsense_schedule_work(struct dualsense *ds)
>  {
> -       guard(spinlock_irqsave)(&ds->base.lock);
> -       if (ds->output_worker_initialized)
> -               schedule_work(&ds->output_worker);
> +       scoped_guard(spinlock_irqsave, &ds->base.lock)
> +               if (ds->output_worker_initialized)
> +                       schedule_work(&ds->output_worker);
>  }
>  
>  /*
> @@ -2626,9 +2626,9 @@ static void dualshock4_remove(struct ps_device *ps_dev)
>  
>  static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
>  {
> -       guard(spinlock_irqsave)(&ds4->base.lock);
> -       if (ds4->output_worker_initialized)
> -               schedule_work(&ds4->output_worker);
> +       scoped_guard(spinlock_irqsave, &ds4->base.lock)
> +               if (ds4->output_worker_initialized)
> +                       schedule_work(&ds4->output_worker);
>  }
>  
>  static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, u8 interval)
> 
> ---
> 
> There are also a couple more of manual spin_unlock_irqrestore which
> would benefit from the scoped guard mechanism.

Oh, my bad, I somehow missed to mention in the commit description that I
intentionally omitted those residing in {dualsense|dualshock4}_output_worker()
as the functions do already contain plenty of long statements and adding yet
another level of indentation would affect readability in a negative way.

I've just checked it again and it doesn't really look that bad.  Consistency
should be more important, anyway, hence let's convert them as well.

Regards,
Cristian

