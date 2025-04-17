Return-Path: <linux-input+bounces-11818-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 098E0A919B4
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 12:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 545617ABA6C
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 10:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2602F2309A6;
	Thu, 17 Apr 2025 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cz7pvpMn"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB822F3BD
	for <linux-input@vger.kernel.org>; Thu, 17 Apr 2025 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744886940; cv=none; b=NApsNNYAIRB6vHJGkq7OBUHDPPtj3WIbPZ5qxUNzAK661HwFZKySHvlLdDFyDnNo2LfvyodVU1UWk3XaL02LnzNwRjLpMQuvz7bnmpaKQ/blmfZm7N0D/kjD2foHKDM2DcISuwNA7z42gAl7A1Gx413Qz7RX3PUXUelBOmjzJL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744886940; c=relaxed/simple;
	bh=U/xu7g/tpiSu6tYud1zSIanwoZzW3itFHEiQEEE1/PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRPpXFlB8jlsl47Ap/D+gcnR1y2SzowWQZ871fPvq8/Ra4C88L7Sfqg/fib7IPuknBMAYd04Ed2ZPHepWnlKzXUHc/uYbEv4FdaK1FGZc5KhfKxpA64xR9M/U/e9ejs5jweGa1/BHWJcQbJjAs+yC91wYiFlWTpMHLB/3kCSBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cz7pvpMn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744886937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHCAXS4O6jNna+NuRjPkc2qWIFeJXBPms5Egizd4OVI=;
	b=Cz7pvpMneVpkNN/46AW7KOypZJGYMOd+xrHC27IMKvOJoM+ONMr3dX2+McFLQhyj6V9GJx
	jwj/TIUxIbzKuadMWkH3NcS/jeaf2EH2u0639ZhK6ZIcVcO5KfNU/PyziNTzuAKMJBc/Fv
	juKTMEHGE/pSVjN83nQVb4pdD2nEqVs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-HitMlry_P5i2qqcwcDpiYg-1; Thu, 17 Apr 2025 06:48:56 -0400
X-MC-Unique: HitMlry_P5i2qqcwcDpiYg-1
X-Mimecast-MFC-AGG-ID: HitMlry_P5i2qqcwcDpiYg_1744886935
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3d3cd9accso36258666b.3
        for <linux-input@vger.kernel.org>; Thu, 17 Apr 2025 03:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886935; x=1745491735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHCAXS4O6jNna+NuRjPkc2qWIFeJXBPms5Egizd4OVI=;
        b=vqkDoj5EHQrx2Eip34UrHaOt4AGS0abpIRm+k9sWOD/uWlxXec5rS6oGj5aaMKXHWR
         oiNsOA7oXcwQcmfbwlvgs8RbLe7sWNFgH/tZ1PR/wLw8GlhLJY9bnyeIFILlGD4OippG
         DIXG0BwWkyr1hdMAOkeFsKcnMHMhc+rCdbf0OUdFrY7DnuJbyFlMeq4sP82qu1TEfUTH
         gB+UJpCb1wZNJTtmuQKZmTku41vQbZlIj9JBgHWuYY4cTbt6m1zcbeCnS/0CMPz5V3it
         lTekE6cQBnmuyW1KCEjJOkl6AkdxcWojNW8JSQw0Q48+4BH7stW1eInPiytSq1r/ZbJV
         TEUQ==
X-Gm-Message-State: AOJu0YyS9ADaLAVAWn9v1zgPeVKY5zpyjZlu3nwSvW3PWuPp1J3Abu75
	bf3RqIozWxGzraOiWNiJ1xA+8EWgU23h4EiQA+iBDLfXHWWuhD6mUK3WV7yZKCS64woEG6ZtIAt
	pW6o9SmQazt477TMhmxxeW7Fz1iRTimGGPTwRBTQMQ1a4c6K7LveSnncqNUU3
X-Gm-Gg: ASbGncvT/+FQVeL4rLHEwJvBSRYVY0Hqphub/7Jm16oPv7uSU1lJU6Tp1SwCozRAh9Z
	l6xi6zx6eD+4Ov5/snxe2yrvAlkkeYv/aBlyTurxy295S0isel+VKV6ox1xJjrMD72M+X/78S+b
	VavZb7jzP26SpQbrWjCtXsjhhSDRlWHXYmLYtaSsoaLeGENBFfuCs0a+PJYLJBeWXbTsgasjI5K
	TBrkW4FMMYc15itkdzkfLAN5Q+1snA4ySjNGkx/ktQYKpTC83wqePRA8RSpmf8qeblUP0cyHX7S
	RKMAXoDGXYEl54DZLzRDOlNwE4r2VKsiXgzKXVEPI4X/A/dN3jvMVQqIcse9zr9RLX6XVnOBeqr
	Z5GbcmkV/BEWI1jloayWAjxIbP6SqIvrwEeZWZ3LiYT34IAt7/6ebZzCiHduI2Q==
X-Received: by 2002:a17:907:db02:b0:acb:168e:c257 with SMTP id a640c23a62f3a-acb42963a55mr517749066b.26.1744886934771;
        Thu, 17 Apr 2025 03:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvyoFCzYeQl53sz+VlHt368Wv/+PY39/vYwvSEoPT3GrqVpbziUWDay7AbmSHvsQT9fkpHBw==
X-Received: by 2002:a17:907:db02:b0:acb:168e:c257 with SMTP id a640c23a62f3a-acb42963a55mr517747666b.26.1744886934390;
        Thu, 17 Apr 2025 03:48:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdeba02sm277157366b.69.2025.04.17.03.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:48:53 -0700 (PDT)
Message-ID: <b9d8244a-df90-4bd2-bfd4-3539b4ad6d5e@redhat.com>
Date: Thu, 17 Apr 2025 12:48:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
To: Mario Limonciello <superm1@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Armin Wolf <W_Armin@gmx.de>
References: <20250417013722.435751-1-superm1@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250417013722.435751-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario,

On 17-Apr-25 3:37 AM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
> to lock the screen. Modern hardware [2] also sends this sequence of
> events for keys with a silkscreen for screen lock.
> 
> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
> emitted by driver to META + L.
> 
> Link: https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec [1]
> Link: https://www.logitech.com/en-us/shop/p/k860-split-ergonomic.920-009166 [2]
> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v3:
>  * Emulation in the input core instead
> 
>  drivers/input/Kconfig |  8 ++++++++
>  drivers/input/input.c | 19 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
> index 88ecdf5218ee9..ffb4163fe315f 100644
> --- a/drivers/input/Kconfig
> +++ b/drivers/input/Kconfig
> @@ -174,6 +174,14 @@ config INPUT_APMPOWER
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called apm-power.
>  
> +config INPUT_SCREENLOCK_EMULATION
> +	bool "Pass KEY_SCREENLOCK as META + L"
> +	help
> +	  Say Y here if you want KEY_SCREENLOCK to be passed to userspace as
> +	  META + L.
> +
> +	  If unsure, say Y.
> +
>  comment "Input Device Drivers"
>  
>  source "drivers/input/keyboard/Kconfig"
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index dfeace85c4710..08a857cea0c5d 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -370,6 +370,13 @@ void input_handle_event(struct input_dev *dev,
>  	}
>  }
>  
> +static void handle_screenlock_as_meta_l(struct input_dev *dev, unsigned int type,
> +					int value)
> +{
> +	input_handle_event(dev, type, KEY_LEFTMETA, value);
> +	input_handle_event(dev, type, KEY_L, value);
> +}
> +
>  /**
>   * input_event() - report new input event
>   * @dev: device that generated the event
> @@ -392,6 +399,12 @@ void input_event(struct input_dev *dev,
>  {
>  	if (is_event_supported(type, dev->evbit, EV_MAX)) {
>  		guard(spinlock_irqsave)(&dev->event_lock);
> +#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
> +		if (code == KEY_SCREENLOCK) {
> +			handle_screenlock_as_meta_l(dev, type, value);
> +			return;
> +		}
> +#endif
>  		input_handle_event(dev, type, code, value);
>  	}
>  }
> @@ -2134,6 +2147,12 @@ void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int
>  
>  	switch (type) {
>  	case EV_KEY:
> +#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
> +		if (code == KEY_SCREENLOCK) {
> +			__set_bit(KEY_L, dev->keybit);
> +			__set_bit(KEY_LEFTMETA, dev->keybit);
> +		}

Shouldn't there be a "break;" inside the if?

Since KEY_SCREENLOCK events will never get reported when
CONFIG_INPUT_SCREENLOCK_EMULATION is set, I think it would
be netter to not set it in dev->keybit ?

Regards,

Hans




> +#endif
>  		__set_bit(code, dev->keybit);
>  		break;
>  


