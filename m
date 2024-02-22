Return-Path: <linux-input+bounces-2039-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D070885F861
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 13:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3673DB25D19
	for <lists+linux-input@lfdr.de>; Thu, 22 Feb 2024 12:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4854512DDAC;
	Thu, 22 Feb 2024 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYY1WBNQ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF312DD88
	for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 12:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708605555; cv=none; b=dhhyGz+jyJvpXMs05pZcDtu2Sa9PWXFiEYkFbrm9KI9bV97slb6Ak0XFC6KnE7WRQrlegQIehyvgQ+dqzj0/V2Ez9bTIpikiqQlA78GcJtW10n9TFlLe1Orbain3SkTx/Tel34FSJ7K3tzEE5cZYPO52/B+2V2KIlS5Oyc3HXn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708605555; c=relaxed/simple;
	bh=A9/2Z2e/Wolvr+TkJMMv6W92q5TwTKl5h3cwWrEQIqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYDQdI1AoXmCAGqQwe4DtnQELRHbAWN/3icVNW6f+EYVY5RwUSz0Gwfor3qCaKUKOcGkoFZwJo6aCF4pWSw0M6XZiXI3dCouM1MqYvQwUVSoNqeaGNAG6wrEw6gPBy+lsudq67pVcoTrvLVkKyRFwAcxO2GVrMxUdfKizfFEypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FYY1WBNQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708605552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BERBpKjH6+/bGhkBw+85S7JQ5x9o2AKS4RztDXQg4B4=;
	b=FYY1WBNQsrmdLX7uQqyBhoZbZJZicWpzhHetEOO/iIQxkPuhcVXqdMi45Vsh/8ls7opiqr
	L2QmunRpgOAGx7wkkpYiHsKYk7h8hiAsjPfMRQn+LB9NXF76tUKru0wFNmLhbj2ppuGDwh
	uD4yEHZUE2NFJLpNhwRLFDL50SwE2/M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-OHayGgdyOfO-1izvmpFNKg-1; Thu, 22 Feb 2024 07:39:09 -0500
X-MC-Unique: OHayGgdyOfO-1izvmpFNKg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a3ee38c40baso227354166b.0
        for <linux-input@vger.kernel.org>; Thu, 22 Feb 2024 04:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708605548; x=1709210348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BERBpKjH6+/bGhkBw+85S7JQ5x9o2AKS4RztDXQg4B4=;
        b=Vu/qHCsATosmhioRpsXwAOehqZS8ACBxdvLQA4UkPInzH8fiNb66Lqs8bhOs/Xp1FG
         mXncDblzFJsYGcs7iZeHXUequHqm/c+VKiFBUgGdO+KPXpnjpCsk6KS1BlxLwQqPuJLb
         /JAbtuPwBW/qjlTF5KC0NPWApsjdDZj3VePulk4CSzPKSnyvsoVG1sZnK9tWL9gyD9Fc
         fEq/eWUNaVvpbaqW3HrdGtBpJkR7IP2hPhQKWZaZwm1YF7hqSduYDKxxumv9MwP3JfI3
         OgKiSotNpjC8ZYdoyjkRxlcs938v2WB+2aPItUCUF2EIusHyiZMCTwql+Dl7URKC5f8E
         b0JA==
X-Forwarded-Encrypted: i=1; AJvYcCUlA4+2WMaXwGy5Blf/K89wYynRAxV6gQLIOybgLVcUuBVbqzvu6U3DPIv/DYnJPD5IYJm9Q2+xWm090I+FtPKdPahEjSdX9LwPmlQ=
X-Gm-Message-State: AOJu0Yy2WxbpXPs5Q+Ai66MKvzk62105NObnzGo/qFbsF9lqWrHZcobc
	9EqYTvVRWjsFMFUZpJZ094W5YYtQQp/bZvF4dkthLCV5EAQ/8RhUS2R+WNs5Ae1tH1K9piGKawK
	75CavwBqEwGLQorB6/pk+NseuWGEz88cvh8ajB9E+9VLwsj/k343Jp0Rg605j
X-Received: by 2002:a17:906:407:b0:a3e:a3dc:45c9 with SMTP id d7-20020a170906040700b00a3ea3dc45c9mr7716006eja.72.1708605548117;
        Thu, 22 Feb 2024 04:39:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj7dB0iOnvtjM8nL87yde9xp+FwpKAGy0QKGBTz8j82TooN3WqgozN46dnwDBExLoaRc63YQ==
X-Received: by 2002:a17:906:407:b0:a3e:a3dc:45c9 with SMTP id d7-20020a170906040700b00a3ea3dc45c9mr7715991eja.72.1708605547809;
        Thu, 22 Feb 2024 04:39:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lu16-20020a170906fad000b00a3d5efc65e0sm4599899ejb.91.2024.02.22.04.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 04:39:07 -0800 (PST)
Message-ID: <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
Date: Thu, 22 Feb 2024 13:39:06 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v2
To: Gregor Riepl <onitake@gmail.com>, Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/22/24 12:38, Gregor Riepl wrote:
>> This certainly is the most KISS approach. This proposal
>> in essence is just an arbitrary command multiplexer /
>> demultiplexer and ioctls already are exactly that.
>>
>> With the added advantage of being able to directly use
>> pass the vendor-cmd-specific struct to the ioctl instead
>> of having to first embed it in some other struct.
> 
> There's also the question of how much complexity needs to remain in the kernel, if vendor-specific ioctls are made available.
> 
> Does every vendor driver implement a complex mapping to hardware registers? What about drivers that basically implement no mapping at all and simply forward all data to the hardware without any checking? The latter case would match Pavel's concerns, although I don't see how this is any different from the situation today, where userspace talks directly to the hardware via libusb etc.

This whole discussion got started by embedded-controller driven
keyboards in laptops with per key RGB lighting. We cannot just
allow userspace raw-access to the embedded-controller.

So these per vendor ioctl commands will need to do the minimum
to make sure userspace cannot do bad things. But yes complex
stuff like figuring out which LED(s) maps to say the enter key
should be left to userspace.

Especially since this can differ per keyboardlayout.

> To be honest, I think the kernel shouldn't include too much high-level complexity. If there is a desire to implement a generic display device on top of the RGB device, this should be a configurable service running in user space. The kernel should provide an interface to expose this emulated display as a "real" display to applications - unless this can also be done entirely in user space in a generic way.

We really need to stop seeing per key addressable RGB keyboards as displays:

1. Some "pixels" are non square
2. Not all "pixels" have the same width-height ratio
3. Not all rows have the same amount of pixels
4. There are holes in the rows like between the enter key and then numpad
5. Some "pixels" have multiple LEDs beneath them. These might be addressable
   per LEDs are the sub-pixels ? What about a 2 key wide backspace key vs
   the 1 key wide + another key (some non US layouts) in place of the backspace?
   This will be "2 pixels" in some layout and 1 pixel with maybe / maybe-not
   2 subpixels where the sub-pixels may/may not be individually addressable ?

For all these reasons the display analogy really is a bit fit for these keyboards
we tried to come up with a universal coordinate system for these at the beginning
of the thread and we failed ...

Regards,

Hans



