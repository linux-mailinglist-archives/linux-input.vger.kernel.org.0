Return-Path: <linux-input+bounces-13593-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06042B0AA85
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 21:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DA895A7BC9
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 19:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21C42E719E;
	Fri, 18 Jul 2025 19:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="eQjkb3a1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3783020101D
	for <linux-input@vger.kernel.org>; Fri, 18 Jul 2025 19:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752865658; cv=none; b=JuLNVXqNslca8bZAFpB6+3kCh3ZF/hrytmpafY/HVFTBVHBH/lvWLwrigbttFA2gJwcUaF9BftTxokfVx/MR2Khm1Hkt3G9GbVkkVZ/YbCChf1Ri5XodTYPLjxNwgfQtw/KjtZIJhqPkcPvsfFkXPpi9arRzz3xlO5YTjiQQE9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752865658; c=relaxed/simple;
	bh=gKMAOL4E57ZrKNppROw+hMC5sdw+R+Db64LcCmKnZpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlMFU6sV8pTDdZsezG2kLyIGiJLVdy4xNEnRSlcEhWGE8P87qAWXVRIhghhZqYVgzBIcoDaFaY0ZkkCc0o+HA9su8oApOgJAkT2kjVCCA7fcGH4tK5V1T2iPt+A5Ihomi8TKEOnjdeleP/mWLyuSU8Xkc+52y2zt5xSJ8OS6Rrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=eQjkb3a1; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70a57a8ffc3so24368887b3.0
        for <linux-input@vger.kernel.org>; Fri, 18 Jul 2025 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1752865656; x=1753470456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1R+bTONl5hHgbwB0kA7IlpGtYJMtSz84Mc+5SeI9Qk=;
        b=eQjkb3a1Uuqyc+c2/wrLRa1AEaxlXBUVYSs/LymUkid80XcSJg8p9uqlW96rsbvRjv
         rOfgpJE0g70CEkopF8Lv9FwIfVPf1O0D5u027rId15C063vU+Jzy/Mic+YfvPpGQ6UIN
         7oqzeVlh+AvRyFsfASW/Zn6kok7ps8Y5u3yvLEAygrlpmNbX82RA6w9Kq5YVWb72Gl7e
         F/0SETGpJ2h2inwrp1hmSbFfwPi2TULmI82gwoWbWehf8BaNmpQthtv/NP2zv36prJYD
         EMgblzdnb+kXzhnzdkm7MQx3pXKYi1FNSMDl+xdjv59A5/T54d4T5kfXmmdXCjua1FT6
         Izlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752865656; x=1753470456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1R+bTONl5hHgbwB0kA7IlpGtYJMtSz84Mc+5SeI9Qk=;
        b=c66/3FUlIWFNV3RsTTD0q1vxyVd5ahULVDyw12qGvzBJuAo2H06SqdXVm/vBrwHghm
         C6VRsCXaFS/t/1k/M58QZuP1OipWhlUBZeA9pUuMFT00Luurjg8QUQ2x8KT3zZemvrsj
         lICkLMFJBX+vodn+g6ryEqPdjE8S8acxyMOwFxzMjO13ATIEgeCNPBPV3dMbe/9yBeO2
         WVVHKgv943EfmkGJiVBfmipLvh4mS6NtRELKVT+AXtsksi5pex1J9kOajvngvFh3B4fX
         ikY55WrTChglavpE05KwURpLw3xWTV0Dt352R+DEKCRqMsa2GYeJf6VGXx+0ndw7tgb+
         JXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCViPUbTCSIeW47x+QZGMCfHwXV0LB7/zF24YVdyb4pUjn/LUGiE90VYXpk8iK2YqFrBfZrqHSUqHm39Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6DUjsl1w+AbuYL+OH5dsmfdvr7/MVACJ98WiSgRFrfgXHu082
	MgtBw/U5O9dCrH4drEQA3j5/4AWukYq9eWv9F4VyeG3U523Pmejd6vlWq0xWDHF3z7oFSSoTET6
	4AXJNKhXW9FKsZWgjL7dsLb1zsLb3DPnEkwevIUag
X-Gm-Gg: ASbGncvBcor0v3kZX3v7ApzVMn5cadykQyFnrQ8C20jHfVnaAUSrANSllO7RiLBVW3f
	+ovpsxES+67/la6c6lIlZaOiBsSg7WSaEPkRGvYmT0hNA3DochjtndyyYcsHnPQRQlIXB4FUG8I
	gO/KXzrnnCZL51aA+qvs8puebgUrMQ7d9CDUtFro3ilsZFBtkuUoFfq1qGcirBPs3fafcov1qEo
	dJyRA==
X-Google-Smtp-Source: AGHT+IHdu2N0EBK/ErljdlLwrx3ILsLU6lMRBT2UTCrZLdQTvYgxzsQ0wmvhUzUAASF16uNQPk7dLkoRYW4KxZBs8fs=
X-Received: by 2002:a05:690c:6207:b0:718:38bd:bee4 with SMTP id
 00721157ae682-7195235cd63mr51739027b3.40.1752865655992; Fri, 18 Jul 2025
 12:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com>
 <20250521-wandering-tested-porpoise-acbef7@kuoka> <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com>
 <20250529-wise-tremendous-stork-a7d091@kuoka> <CAKMwjwQOBE651A-5VVjwcv5TspO2eNZfgwWzMpTTWxhR3nGKUw@mail.gmail.com>
 <0fb4b411-1b27-43fc-8d48-e5220fc85478@kernel.org> <CAKMwjwSZEhXav2U-bd+JNyVDK3JdJoN1kJjnxpfKXBKsW2XxdQ@mail.gmail.com>
 <DBEDT0OKPYAC.EX6HDQCKUWIS@walle.cc>
In-Reply-To: <DBEDT0OKPYAC.EX6HDQCKUWIS@walle.cc>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 18 Jul 2025 15:07:23 -0400
X-Gm-Features: Ac12FXy7q3q6U50Dg6MYZU_77NgvzE3OW9vAVUYRGRaaMpzgf6mgFEVPfckFZic
Message-ID: <CADL8D3bpVVrswNUvS5nSeQYuZbyPOfMoMFG_JrPSFb9YkNEKdg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
To: Michael Walle <michael@walle.cc>
Cc: Job Sava <jsava@criticallink.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julien Panis <jpanis@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 9:58=E2=80=AFAM Michael Walle <michael@walle.cc> wr=
ote:
>
> Hi,
>
> > > Someone knowing the device should come with arguments whether
> > > other states for this are useful at all. Or not useful and then argum=
ent
> > > that in commit msg for example.
> > The other states are not useful for the kernel. Only the push button
> > has a need for an interrupt handler. The other states the PMIC handles
> > on its own.
> >
> > What exactly do you want me to change?
>
> Because the driver isn't setting the configuration anyway, wouldn't
> it be possible to read the config bits (Register 0x3c, bits 7-6) to
> figure out whether the pin is configured as power-button instead of
> having this property?
>
> I mean, the correct config is likely stored in the NVM anyway, and
> reconfiguring it to another value seems unlikely.
Currently, the TPS MFD driver only loads the power button driver if
the flag is set.  We could put that discovery code in the MFD driver,
but what if the system designer doesn't want the power button driver?
I'm not sure auto detecting it makes sense.

We are basing this on the other TI PMIC drivers and how they are
configured. I'm not sure I want to reinvent the wheel, so to speak.
>
> -michael




--
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

