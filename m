Return-Path: <linux-input+bounces-6284-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E596EE4F
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 10:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 343F6284171
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 08:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD902154C19;
	Fri,  6 Sep 2024 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKhGu4ym"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B1714B945;
	Fri,  6 Sep 2024 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725611920; cv=none; b=LArhmxoNPXK0/gpNhYxzsQuMVUutAuAzqPKqwpzwLfmmUhGZDZ3ARroBL5Y3a8Ym3UpY+GhnTuhGUwef5RCMq2h+ggs7NhLMfZQnGNlKUQ3CtehXWhocD5vqR09yzgLkXMGsDO3wtnM53sSRamfGjTs/UsKKW3gAXe+8JvbHe4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725611920; c=relaxed/simple;
	bh=8raF76XSM3ymus0m9y5pGxcw01NyiiwG5lE+/gP+Tx8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qnDEOi/Zmu/P3OtDk+sWaQkOpSHM9GEvaXOJy/clNRA0Yru6cOMSylAodSrUSPIiS2UPCNVl63Kt6DFyoptB4Km5NyQ1PiHZxlJOYQPEO2NLMmxusL8At4soqYxvr0OupnE7XcfsdRp3cQR0awOAyGpDNAKg1sF+9XrhcljQbSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKhGu4ym; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374bd0da617so968885f8f.3;
        Fri, 06 Sep 2024 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725611917; x=1726216717; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8raF76XSM3ymus0m9y5pGxcw01NyiiwG5lE+/gP+Tx8=;
        b=EKhGu4ymbco3pPfSyjzgkE4CAJBTUDPAcX9vkdlMjfpnGBzRPB1sU8xbJib8NJCNfU
         SAXu8I/Vsh+Ho5LRAfLPGtakV5DnDDjiVsMQRVokQL9noxH5TbQzi/ZFyIMmtXZ2ojEA
         bnOwhskaGbHd1LPTG2lA14HZbb60MKef223jR0ySnOBRbDDfcoQ9RRUmEHZ0gAidChrE
         xvPdNSIRwLq0Hyrpcizn5e1M6xWhXU5dvoAS00oCn+H80+lz/BRvGq1isISV40cSUkAa
         1EceJ1zf+GS9IP3217euktI6/GgopQlMdpXFrrLE6POmwaTnv6DAUxOPHp0WoZHY4/aI
         PYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725611917; x=1726216717;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8raF76XSM3ymus0m9y5pGxcw01NyiiwG5lE+/gP+Tx8=;
        b=lpBnMDh0SFZEz4HRuvrur0mXvVD0DCoraaXhBVLOD61pa9nhOZAn1g94d6f5zYhzo2
         M6dmm8V9FLXkENzu1rqQwwV+VpXRKuzpyftqnjgPeuAnbTPQjYbLE3PB8dDfW9wIFcKj
         hvcuZet3l92lhmnYmRE9azkRrYQU5PizM4C/KY9EdrHZJZsPmYfALoaoFnGXjBl/eEAu
         yeEjctHnjUKSMnJfV+hHAy6igndlVUyz+OMvwjjTmOstOpBnO/o9JMhpU705lb/YHoz1
         fe9i/qcQe0IeTa5NdxRAfF6X4mu2gqJj0cyoHFbpg93vLHJWKJhI7tRkrovApPNMvyXL
         4rzw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Ngn3qGpJllAfFAS9ea+S0a9btdRXy83qrBs4D41ek+QfAAsbC3UwfXQp3W6pe5DBMw2+gADLxGoSn1fA@vger.kernel.org, AJvYcCX5leiMbyjrvF6vXdCwLGpIKAs98weofP2hvC4oguqyS+11djB4a4uauN5YB65WrkzVA4XXmjAXjKlpng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjFJ/OjEXgailcRCGJvw9iayqK2dcRxrdHU4rR61tmBtYcNgJ3
	1L37cX7/uIG/w8nCLJDzusTbvbr78DUZmS7Q9KhMpC9hA0M04vgN
X-Google-Smtp-Source: AGHT+IHlzZPjqXmHzA7hhRy6zi9jyU3PnwqZDCEF37RMM/xjAjbI+PygqX50FiXGb0hOo19HX2MVLA==
X-Received: by 2002:a5d:4088:0:b0:369:9358:4634 with SMTP id ffacd0b85a97d-378895cbb2dmr1224626f8f.19.1725611916464;
        Fri, 06 Sep 2024 01:38:36 -0700 (PDT)
Received: from ?IPv6:2001:a61:341e:1201:c434:b5b1:98a6:efed? ([2001:a61:341e:1201:c434:b5b1:98a6:efed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-375348df4e8sm9494391f8f.115.2024.09.06.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 01:38:36 -0700 (PDT)
Message-ID: <9db96c99c805e615ba40ca7fd3632174d1e8d11f.camel@gmail.com>
Subject: Re: [PATCH] Input: keypad-nomadik-ske - remove the driver
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>,  Michael Hennerich <michael.hennerich@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Utsav Agarwal
 <utsav.agarwal@analog.com>
Date: Fri, 06 Sep 2024 10:38:35 +0200
In-Reply-To: <ZsNcpom_Fm5uCyEj@google.com>
References: <Zr-gX0dfN4te_8VG@google.com>
	 <1bc01e00-7b70-4e90-8060-f3de3ec7afa3@app.fastmail.com>
	 <ZsNcpom_Fm5uCyEj@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-08-19 at 07:54 -0700, Dmitry Torokhov wrote:
> On Mon, Aug 19, 2024 at 11:29:32AM +0200, Arnd Bergmann wrote:
> > On Fri, Aug 16, 2024, at 20:54, Dmitry Torokhov wrote:
> > > The users of this driver were removed in 2013 in commit 28633c54bda6
> > > ("ARM: ux500: Rip out keypad initialisation which is no longer used")=
.
> > >=20
> > > Remove the driver as well.
> > >=20
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > > =C2=A0drivers/input/keyboard/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 -
> > > =C2=A0drivers/input/keyboard/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
> > > =C2=A0drivers/input/keyboard/nomadik-ske-keypad.c=C2=A0=C2=A0 | 378 -=
-----------------
> > > =C2=A0.../linux/platform_data/keypad-nomadik-ske.h=C2=A0 |=C2=A0 50 -=
--
> > > =C2=A04 files changed, 440 deletions(-)
> > >=20
> >=20
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >=20
> > I have a list of drivers that I determined to be likely
> > unused as well and found a few more input drivers
> > that were unused in 2022:
> >=20
> > CONFIG_KEYBOARD_ADP5520/CONFIG_PMIC_ADP5520
> > CONFIG_KEYBOARD_ADP5589
> > CONFIG_INPUT_AD714X
> > CONFIG_TOUCHSCREEN_AD7877
> >=20
> > As far as I can tell, these all lost their last device
> > definition, or they never had one and are impossible to
> > be used with device tree data.
>=20
> I asked Analog Devices folks (CCed) about 5589 and Nuno said that it is
> still relevant and promised to do conversion to DT similar to adp5588.
>=20
> Nuno, Michale, what about the other drivers that Arnd listed?
>=20

Hi Dmitry,

This is not forgotten and I plan to start working on this early next week.

One thing I noticed and I might as well just ask before starting the work, =
is that
the platform data allows, in theory, for you to have holes in your keymap [=
1]. Like
enabling row 1 and 3 skipping 2. AFAICT, the matrix stuff does not allow th=
is out of
the box as we just define the number of rows/cols and then without any othe=
r property
we assume (I think) that the map is contiguous.=C2=A0

This is just early thinking but one way to support the current behavior wou=
ld be 2
custom DT properties that would be 2 u32 arrays specifying the enabled colu=
mns and
rows. Out of it, we could build row and col masks and get the total number =
of cols
and rows that we could pass to matrix_keypad_build_keymap().

The question is... is it worth it? I'm aware that if we just assume a conti=
guous
keymap we could break some old users. But I guess it would be only out of t=
ree ones
as we don't have any in kernel user of the platform data. On top of it, I g=
uess it's
sane to assume that one just wants a contiguous keymap...

[1]: https://elixir.bootlin.com/linux/v6.10.8/source/drivers/input/keyboard=
/adp5589-keys.c#L630

Thanks!
- Nuno S=C3=A1


