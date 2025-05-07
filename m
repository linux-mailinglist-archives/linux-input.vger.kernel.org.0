Return-Path: <linux-input+bounces-12223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D2AAEED0
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 00:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5BC4E7CA9
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 22:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA179289E28;
	Wed,  7 May 2025 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M2v/eDPy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457220D519
	for <linux-input@vger.kernel.org>; Wed,  7 May 2025 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658179; cv=none; b=Q1GyLWQuqJAquJeMhNj0YIZhD9Ris1E/ZQOhY2xIxKpKdKc+Ga8oygtMb1m3AaKTVcJqMRPFSsp6vF+qtPbKSc5IV/ABXsIpbQyHBJNhJ4rDKfEXsB5EWb5EFdaaBMPzvAKJvFNXpwmX5vqTGOjyCfJt2T20v7DezlbD0K/Zxzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658179; c=relaxed/simple;
	bh=PvDFEE4pldzNMJVI/3qnZNeeXQmAT5KwifJDwZVUP7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kehiUmtrgmSFjEKR6bfWxH6ACBXVnMEhhIud7J5BQYVRX2S7J9Nkz4/fXteOWkTX/Ss7jMa63m5KDmJtzEkWsDgQdgGxDHQ7Q2RNGPY4B2tkMS81HeeXihwN06hGI4Ju30JcPEssDLYIFj9coG35CSviSBxncsA8K8sAOArnXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M2v/eDPy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac289147833so68091466b.2
        for <linux-input@vger.kernel.org>; Wed, 07 May 2025 15:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746658175; x=1747262975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u7YUzks35rR75q6xrog819ITBOZWiyWDzRcGbuvS5Ys=;
        b=M2v/eDPyPR/DicxWmC7aqRxsja0zUyRkJm3piBFx/aevzUsQppjuGxwa9oU/d5oo9i
         b/idagCWcZuRC5GI0ykQLJTTaspI/QTEwku0cM00VAnB9890z9t2uPZ2sQtEzQv3b2Bw
         DZQKWqx36QDhGgvMqatTOU+oFdtKthe48UZ88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658175; x=1747262975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7YUzks35rR75q6xrog819ITBOZWiyWDzRcGbuvS5Ys=;
        b=vluZ4bzb+pE4CshN6UelsclacgFSoPaYVhTohQQNakFijVO0hkZeHboeeIbQbh5LzZ
         I8nSQLokgB+CZBPHjUa8LcaiOTiYdMHJM71zInxd3MOPLa27wbqXL3yS2C2VIdCcLCWp
         ff13CEAxE0hve27ofOtTBza4ifDTWFhMupMoEBq63JD7TQEhwvCDk59wxdLL2W5XqByb
         h44E87xN46+1t3gaeofWWaSC8+fHL1l6gOfeateWUQ4qxhdP6dJuKb5aJ3NcilQHAHR6
         +2r1YYtp/yeGVCdnKbTYEthtGhK/sHvnaNCyKObVShftpGucR6zJmIdk/rRJKUszRofi
         MVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFShCXMFWmVwgLk8TN/3Ro5UxEFAS3+JRKVG0yCY9obWKtJayFLsIzq/TJ+m2VG/y4IYRt3GoX+vczOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJSq0tE/w+oQ7gKALKGisHF/H+IknJ+1nnM9VSMhErFHUVJRHU
	1bUbIkYYvtvyweO1AnaNADqBTk2Spmv903Rx9j7ebA1nRhSXebMMIjNKqEYTu4gCDjIh6QFVg2i
	TTa0=
X-Gm-Gg: ASbGnct3q9FsRuNbxC7yBDWDChwiCTU20EzXQYNXv0bhWdVg1Pe5zcvohGQGN/QW1U6
	AbNrynYv5cIKycwtKIiFizEn0bHpM4RmVZylWHa/zTiRsiZAifc51y6yO1AuNyXDBoRooXhC5wv
	dPIZLj4bWwvIDE3OZu5tTg0PDnT91jh5l0iW7RVGTiRmWsQZGyk6ZGaio6SuwFxHdOgX0Kjz4yM
	q5l545guISx2TsMSRZTQAvgziI4UaUhNWlKeWJHXO6rdljoNxkncJJiejbWD4cTfxHHO9DzEpdT
	ja6x2VaavN3kh/GHQYbaW9acnpSn4wj4qUGRlE6qv05xcXYgas1QR7KvJI1q1TMSfQY5jqGW9Ib
	eDfwYiVOL60hJQfE=
X-Google-Smtp-Source: AGHT+IGVqYHJsE0Upflm4hASilTDE92ZetqnJAF1y3Am7oO4CrqgFUs6CqwOuxlEaTRUDVfEkPCkNg==
X-Received: by 2002:a17:906:54c2:b0:ad1:f6cc:55f7 with SMTP id a640c23a62f3a-ad1f6cc5625mr221832066b.36.1746658175170;
        Wed, 07 May 2025 15:49:35 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1ee72cd60sm208753666b.114.2025.05.07.15.49.33
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 15:49:33 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so511135a12.1
        for <linux-input@vger.kernel.org>; Wed, 07 May 2025 15:49:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxVAL4KsyRi71smOUCr7c6Y0JGEdoHK7vYt5fuz4X6h/QntvwvGgSs0xU6EK0P23awpx3AcT6R3Hu/jA==@vger.kernel.org
X-Received: by 2002:a05:6402:51cb:b0:5fb:a146:8600 with SMTP id
 4fb4d7f45d1cf-5fbe9f46c17mr4622673a12.25.1746658172895; Wed, 07 May 2025
 15:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home> <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home> <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk> <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk> <859b32ca-acd5-43fd-0577-a76559ba3a9e@applied-asynchrony.com>
 <aBvZgk4HFakkw_c4@shell.armlinux.org.uk>
In-Reply-To: <aBvZgk4HFakkw_c4@shell.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 May 2025 15:49:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiuAc-aQn7JCuCc+5w+j=687puyd_TXXbfXOmU8t1C9cQ@mail.gmail.com>
X-Gm-Features: ATxdqUHn2iOL5GJPc8J0WR-WHr68qYXiPYhykRWA16gZ3OPpxUhkY9XMpei6vQ8
Message-ID: <CAHk-=wiuAc-aQn7JCuCc+5w+j=687puyd_TXXbfXOmU8t1C9cQ@mail.gmail.com>
Subject: Re: [BUG] Stuck key syndrome
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Woojung Huh <woojung.huh@microchip.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 15:07, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> So it's interesting that Finn's system is AMD vs mine which have
> both been Intel based systems, and we seem to have exactly the same
> problem. Is it possible that both are using the same firmware for
> emulating an i8042?

Might be a BIOS vendor issue.

> Also what seems to be interesting is that it afflicts specific keys.
> On my old HP Pavilion, it was always Ctrl-F3 which would get stuck
> down (which I use to switch to virtual desktop 3 which has my Konsoles
> on.) In this case, pressing all of ctrl-shift-alt would clear it.

So multiple keys being pressed at once can result in confusion
depending on how the keyboard matrix is set up, and pressing multiple
keys then causes ghost reports.

Usually it requires three keys to be pressed simultaneously - and some
really cheap underlying hardware without some basic N-key rollover
protection.

But who knows what can confuse the firmware.

And honestly, it might also be a timing issue. So when you switch
virtual desktops, you end up doing more CPU work, changing timings,
and messing something up in the firmware in the process.

For example, I wouldn't expect firmware to be great about SMP. So
while the i8042 driver serializes everything with i8042_lock, who
knows *where* the firmware runs.

Maybe we could do something like tie irq1 (keyboard) and irq12 ("aux",
aka mouse) to the boot CPU in the hopes that there's less chance of
confusing some firmware that way.

I have no idea what Windows does, and - as usual - that's the case
that gets almost all the testing from vendors.

> What also crosses my mind is that if the i8042 is now emulated by
> firmware, is there a replacement interface that the kernel should
> instead be using?

I don't think there is any documentation - or necessarily commonality
- for the low-level hardware. I would guess that it's probably some
small i2c controller that ends up doing some keypad matrix thing. That
i2c thing *may* do native HID, but it might easily also be just some
custom GPIO expander thing.

I think the touchpad is usually some i2c device, and it is sometimes
accessible both ways. And there's a long history of keyboard problems
when the touchpad is looked at just the wrong way, so those things
most definitely can interact (because the firmware emulation emulates
both).

It's very hard to find hardware information at that level these days.
It's been decades since things like the keyboard matrix was documented
as such....

                  Linus

