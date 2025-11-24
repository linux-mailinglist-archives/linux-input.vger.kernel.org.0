Return-Path: <linux-input+bounces-16300-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBEEC7F184
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 07:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A7BA4E727B
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 06:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE42C2E54A1;
	Mon, 24 Nov 2025 06:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJLiM/DM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEA52DE1E0;
	Mon, 24 Nov 2025 06:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763965954; cv=none; b=A99kCebFYJLtEIyhs0ITi+jYhHltchkUw4OmmPsUzHiyuuVHm9HMdBJp4F/WRQUWYChjjyRRfHicIGV/8SeWHUUSAKVXSAQ2DqqRfOMqKZ/7PmQGVDourVE4JwwOuU8j4pKUMmeFRo1aHrM3WM9i17gzyAKkNk1zOwBgdOlA5XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763965954; c=relaxed/simple;
	bh=dQhFFmxCAv9wePm5UTyKuZcvM90mHOb7S4OnHayx2cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2miwcHs8Ugr1sJRvMdeZFBd7W9uZsUdm8K4MU4UZw1LquY0Xa2v7TswN+JwK57S0wzHqW2UbwXFHWkbqekKUPvz/60hR/SoyUq4p0Nr5+Yeef687qB5JFcY2hg44P73vp+pcXReAPDXdy8hE1xpiKCy+5eeFec6M7U+fZjczNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJLiM/DM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43A5C4CEF1;
	Mon, 24 Nov 2025 06:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763965954;
	bh=dQhFFmxCAv9wePm5UTyKuZcvM90mHOb7S4OnHayx2cU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WJLiM/DMy915oshg+2HUSW4MGBU+VvNl0+bMkL95/io5LNpqKKC8WhzkqRv8vHExm
	 u0Gqv649C1t/EZmsYEq7HHGAucUDrVW8QSvggNE656Y2Jq6ylNc8hAVvqRgVMAY8JW
	 fOGlDzLm55NYyRcpOwBZGDPDysEVlquKu6rqw/FX6SyNWCbTaH8GnXSb57JwtqKsgE
	 Y5h416oHBEp5oPw7gqTXoxIkffO5lEYOhuzkBcjZ0GA5uZMs7SuSIhWZzu/A2liEi1
	 nrSN503tWSb8v9nKxMS7eh5RvVoJOET6NakjIRtQhdWQG5OT+iFe5cH1B1OwKjVfUO
	 r/fvjaZnxePgw==
Message-ID: <6251f6df-d4ac-4681-8e8b-6df2514e655b@kernel.org>
Date: Mon, 24 Nov 2025 07:32:30 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: memory leak in dualshock4_get_calibration_data
To: Eslam Khafagy <eslam.medhat1993@gmail.com>,
 roderick.colenbrander@sony.com, jikos@kernel.org, bentiss@kernel.org,
 max@enpas.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20251122173712.76397-1-eslam.medhat1993@gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 xsFNBE6S54YBEACzzjLwDUbU5elY4GTg/NdotjA0jyyJtYI86wdKraekbNE0bC4zV+ryvH4j
 rrcDwGs6tFVrAHvdHeIdI07s1iIx5R/ndcHwt4fvI8CL5PzPmn5J+h0WERR5rFprRh6axhOk
 rSD5CwQl19fm4AJCS6A9GJtOoiLpWn2/IbogPc71jQVrupZYYx51rAaHZ0D2KYK/uhfc6neJ
 i0WqPlbtIlIrpvWxckucNu6ZwXjFY0f3qIRg3Vqh5QxPkojGsq9tXVFVLEkSVz6FoqCHrUTx
 wr+aw6qqQVgvT/McQtsI0S66uIkQjzPUrgAEtWUv76rM4ekqL9stHyvTGw0Fjsualwb0Gwdx
 ReTZzMgheAyoy/umIOKrSEpWouVoBt5FFSZUyjuDdlPPYyPav+hpI6ggmCTld3u2hyiHji2H
 cDpcLM2LMhlHBipu80s9anNeZhCANDhbC5E+NZmuwgzHBcan8WC7xsPXPaiZSIm7TKaVoOcL
 9tE5aN3jQmIlrT7ZUX52Ff/hSdx/JKDP3YMNtt4B0cH6ejIjtqTd+Ge8sSttsnNM0CQUkXps
 w98jwz+Lxw/bKMr3NSnnFpUZaxwji3BC9vYyxKMAwNelBCHEgS/OAa3EJoTfuYOK6wT6nadm
 YqYjwYbZE5V/SwzMbpWu7Jwlvuwyfo5mh7w5iMfnZE+vHFwp/wARAQABzSFKaXJpIFNsYWJ5
 IDxqaXJpc2xhYnlAa2VybmVsLm9yZz7CwXcEEwEIACEFAlW3RUwCGwMFCwkIBwIGFQgJCgsC
 BBYCAwECHgECF4AACgkQvSWxBAa0cEnVTg//TQpdIAr8Tn0VAeUjdVIH9XCFw+cPSU+zMSCH
 eCZoA/N6gitEcnvHoFVVM7b3hK2HgoFUNbmYC0RdcSc80pOF5gCnACSP9XWHGWzeKCARRcQR
 4s5YD8I4VV5hqXcKo2DFAtIOVbHDW+0okOzcecdasCakUTr7s2fXz97uuoc2gIBB7bmHUGAH
 XQXHvdnCLjDjR+eJN+zrtbqZKYSfj89s/ZHn5Slug6w8qOPT1sVNGG+eWPlc5s7XYhT9z66E
 l5C0rG35JE4PhC+tl7BaE5IwjJlBMHf/cMJxNHAYoQ1hWQCKOfMDQ6bsEr++kGUCbHkrEFwD
 UVA72iLnnnlZCMevwE4hc0zVhseWhPc/KMYObU1sDGqaCesRLkE3tiE7X2cikmj/qH0CoMWe
 gjnwnQ2qVJcaPSzJ4QITvchEQ+tbuVAyvn9H+9MkdT7b7b2OaqYsUP8rn/2k1Td5zknUz7iF
 oJ0Z9wPTl6tDfF8phaMIPISYrhceVOIoL+rWfaikhBulZTIT5ihieY9nQOw6vhOfWkYvv0Dl
 o4GRnb2ybPQpfEs7WtetOsUgiUbfljTgILFw3CsPW8JESOGQc0Pv8ieznIighqPPFz9g+zSu
 Ss/rpcsqag5n9rQp/H3WW5zKUpeYcKGaPDp/vSUovMcjp8USIhzBBrmI7UWAtuedG9prjqfO
 wU0ETpLnhgEQAM+cDWLL+Wvc9cLhA2OXZ/gMmu7NbYKjfth1UyOuBd5emIO+d4RfFM02XFTI
 t4MxwhAryhsKQQcA4iQNldkbyeviYrPKWjLTjRXT5cD2lpWzr+Jx7mX7InV5JOz1Qq+P+nJW
 YIBjUKhI03ux89p58CYil24Zpyn2F5cX7U+inY8lJIBwLPBnc9Z0An/DVnUOD+0wIcYVnZAK
 DiIXODkGqTg3fhZwbbi+KAhtHPFM2fGw2VTUf62IHzV+eBSnamzPOBc1XsJYKRo3FHNeLuS8
 f4wUe7bWb9O66PPFK/RkeqNX6akkFBf9VfrZ1rTEKAyJ2uqf1EI1olYnENk4+00IBa+BavGQ
 8UW9dGW3nbPrfuOV5UUvbnsSQwj67pSdrBQqilr5N/5H9z7VCDQ0dhuJNtvDSlTf2iUFBqgk
 3smln31PUYiVPrMP0V4ja0i9qtO/TB01rTfTyXTRtqz53qO5dGsYiliJO5aUmh8swVpotgK4
 /57h3zGsaXO9PGgnnAdqeKVITaFTLY1ISg+Ptb4KoliiOjrBMmQUSJVtkUXMrCMCeuPDGHo7
 39Xc75lcHlGuM3yEB//htKjyprbLeLf1y4xPyTeeF5zg/0ztRZNKZicgEmxyUNBHHnBKHQxz
 1j+mzH0HjZZtXjGu2KLJ18G07q0fpz2ZPk2D53Ww39VNI/J9ABEBAAHCwV8EGAECAAkFAk6S
 54YCGwwACgkQvSWxBAa0cEk3tRAAgO+DFpbyIa4RlnfpcW17AfnpZi9VR5+zr496n2jH/1ld
 wRO/S+QNSA8qdABqMb9WI4BNaoANgcg0AS429Mq0taaWKkAjkkGAT7mD1Q5PiLr06Y/+Kzdr
 90eUVneqM2TUQQbK+Kh7JwmGVrRGNqQrDk+gRNvKnGwFNeTkTKtJ0P8jYd7P1gZb9Fwj9YLx
 jhn/sVIhNmEBLBoI7PL+9fbILqJPHgAwW35rpnq4f/EYTykbk1sa13Tav6btJ+4QOgbcezWI
 wZ5w/JVfEJW9JXp3BFAVzRQ5nVrrLDAJZ8Y5ioWcm99JtSIIxXxt9FJaGc1Bgsi5K/+dyTKL
 wLMJgiBzbVx8G+fCJJ9YtlNOPWhbKPlrQ8+AY52Aagi9WNhe6XfJdh5g6ptiOILm330mkR4g
 W6nEgZVyIyTq3ekOuruftWL99qpP5zi+eNrMmLRQx9iecDNgFr342R9bTDlb1TLuRb+/tJ98
 f/bIWIr0cqQmqQ33FgRhrG1+Xml6UXyJ2jExmlO8JljuOGeXYh6ZkIEyzqzffzBLXZCujlYQ
 DFXpyMNVJ2ZwPmX2mWEoYuaBU0JN7wM+/zWgOf2zRwhEuD3A2cO2PxoiIfyUEfB9SSmffaK/
 S4xXoB6wvGENZ85Hg37C7WDNdaAt6Xh2uQIly5grkgvWppkNy4ZHxE+jeNsU7tg=
In-Reply-To: <20251122173712.76397-1-eslam.medhat1993@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22. 11. 25, 18:37, Eslam Khafagy wrote:
> Function dualshock4_get_calibration_data allocates memory to pointer
> buf .However, the function may exit prematurely due to transfer_failure
> in this case it does not handle freeing memory.
> 
> This patch handles memory deallocation at exit.

Isn't this fixed already by:
commit 8513c154f8ad7097653dd9bf43d6155e5aad4ab3
Author: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date:   Mon Nov 10 22:45:50 2025 +0530

     HID: playstation: Fix memory leak in dualshock4_get_calibration_data()
?

Anyway, this is a typical use-case for __free(). Why not to use that?

> Reported-by: syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/691560c4.a70a0220.3124cb.0019.GAE@google.com/T/
> Tested-by: syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
> Fixes: 947992c7fa9e0 ("HID: playstation: DS4: Fix calibration workaround for clone devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
> ---
> v3:
> * Address issues reported by checkpatch and re-format commit message
> for better readability
> * kfree() is safe so no need to check for NULL pointer
> 
> v2: https://lore.kernel.org/all/20251116022723.29857-1-eslam.medhat1993@gmail.com/
> * Adding tag "Cc: stable@vger.kernel.org"
> 
> v1: https://lore.kernel.org/all/20251115022323.1395726-1-eslam.medhat1993@gmail.com/
>   
> 
>   drivers/hid/hid-playstation.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 128aa6abd10b..05a8522ace4f 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -1994,9 +1994,6 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
>   	acc_z_plus       = get_unaligned_le16(&buf[31]);
>   	acc_z_minus      = get_unaligned_le16(&buf[33]);
>   
> -	/* Done parsing the buffer, so let's free it. */
> -	kfree(buf);
> -
>   	/*
>   	 * Set gyroscope calibration and normalization parameters.
>   	 * Data values will be normalized to 1/DS4_GYRO_RES_PER_DEG_S degree/s.
> @@ -2043,6 +2040,9 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
>   	ds4->accel_calib_data[2].sens_denom = range_2g;
>   
>   transfer_failed:
> +	/* First free buf if still allocated */
> +	kfree(buf);
> +
>   	/*
>   	 * Sanity check gyro calibration data. This is needed to prevent crashes
>   	 * during report handling of virtual, clone or broken devices not implementing

-- 
js
suse labs


