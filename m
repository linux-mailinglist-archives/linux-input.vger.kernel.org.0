Return-Path: <linux-input+bounces-6353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F09A97155B
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 12:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C4B1B2293E
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 10:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF2B1B0104;
	Mon,  9 Sep 2024 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1D3seyA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2E13C914;
	Mon,  9 Sep 2024 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725877837; cv=none; b=WpqnB4GG+yYMUPA7fd4C+xU+G4FtOtWOW84FGL/VI17o0r9Bh8uyUr0Y4cqht1gHadRuVFOBE5l0GWmz1nUw18vHmml/CsG7PEi/tXbJM+b2/NNQzYGTSA0aUPSnv0hCL0gdUuh7uxSaLseN/G6w0Yr58R5C5z45OHDfxt5u6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725877837; c=relaxed/simple;
	bh=ZbqPhUIryw2LmYxJgLpyibo9LuXhwTESiaUyP7LkMKs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SJcwIh5gg7w3b5Ri7wGtPzUJ+LxlptUykSx8KWy//kkGe6zLpTcnLU1b7pnd3P488v9FcjaK6AvxrXFe5zWQA+L6Re+4ZNvuPht5Rd5jvAo86zvedQp/cdJnUywyaUmJVHt2ny9DZEsrDTxD3w1l0VP0PDoy8Md8f4JBeJ8azz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1D3seyA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso37512415e9.1;
        Mon, 09 Sep 2024 03:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725877834; x=1726482634; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZbqPhUIryw2LmYxJgLpyibo9LuXhwTESiaUyP7LkMKs=;
        b=h1D3seyAoVMQn4/GpjEwtG8OGQGXVvLmVXTZTIsg4YEMBGDERb86nMlJmcdlAYcu9W
         n61MLz4hcSsNInlNAjcmGWKsz2+WlbL/++AZG1WgrmptEOz9mPM90hqebDhWCZM9OCRk
         OszINtYe3eIHrHG+abSPbCtvoNNtoaOSEAvlRRQTY3mDDJv+Wvb9l+yGXlJ1+PxV7XT7
         uH+jYpUNgr2Dmsmj2cSiCszZ4B/f/leK9WU4g0trY7n2HC34yORDzWPYevzpRMFrv8gv
         wHFNO36eIxDADRPC87scdFHC7uvljf4WNRl9KOvBBzuw2o238T9Jc21w1BTijsAHihWg
         u+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725877834; x=1726482634;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbqPhUIryw2LmYxJgLpyibo9LuXhwTESiaUyP7LkMKs=;
        b=kn7KkjzZsZ4uSAD5Xv+7Y+bsHeTNyMNDgGk6T0lq+zgym8ubvONDrQnfNW2ZRhTvxS
         YQfqYz6aTITlluDKGRQxByx1hK/6gp2g4Y+r03NP75d1pVWC/Qh8Uhs7waIipQvWBJLn
         IJg0NG/5s69C47LcLjfLQrMPmuqNN+zIf+SEjtyPcmw6fQprADaYKOXG9SL/oaB67uMb
         9shYnXJloXKx/b21yJyB8ygQHvWG8XUQfZ22Z8N8FcKZvO01mrUQ2brKBh7R4X7MkP+a
         kMZJdelwBPPaO7SUizRCXSaypweEsyEV6RUSqkei7J3wug8QMbVZwnRDvrynzSZNcxvq
         t2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCjrDf7RcsxN4ULgkkH/yAnErJVRAEBdtClGOHorXRL2MbyHXNXQD6a/2TuBtyRRU8Uu/UcXEiUad78A==@vger.kernel.org, AJvYcCXY87Z3mRRxYOUVRfo5J9b1nSYSr9HsxuDHkYmfXKgsX6781cWf5nBu6B20SbrioiwJwD5T2MUohCmVITC0@vger.kernel.org
X-Gm-Message-State: AOJu0YxiEJV+YuHHiFaD2bo0OuAU6GhJGqeZTKrFwgW0bUsvlyVQKHyx
	iKiLhu6p6025Vk2MVeB7c4GkN0XqrfCfcK9rTZCU31XzkpeYa4/O1uY1O0QzDo8=
X-Google-Smtp-Source: AGHT+IHjhTu+7s8p8WOP5yY5vKVanqaFjwVL1FvL48w7D1zVd2hbTmUGMdl2tdGJmxdDG2wAHwl8UQ==
X-Received: by 2002:a5d:4687:0:b0:374:c2e9:28bc with SMTP id ffacd0b85a97d-378895cb7admr7099629f8f.21.1725877833490;
        Mon, 09 Sep 2024 03:30:33 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d3687sm5663088f8f.71.2024.09.09.03.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 03:30:33 -0700 (PDT)
Message-ID: <d120435769b4ada07c9377bc5659c234dd35e636.camel@gmail.com>
Subject: Re: [PATCH] Input: keypad-nomadik-ske - remove the driver
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Hennerich
	 <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones
	 <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, Utsav Agarwal
	 <utsav.agarwal@analog.com>
Date: Mon, 09 Sep 2024 12:34:41 +0200
In-Reply-To: <ZtszE9A-576SmvsX@google.com>
References: <Zr-gX0dfN4te_8VG@google.com>
	 <1bc01e00-7b70-4e90-8060-f3de3ec7afa3@app.fastmail.com>
	 <ZsNcpom_Fm5uCyEj@google.com>
	 <9db96c99c805e615ba40ca7fd3632174d1e8d11f.camel@gmail.com>
	 <ZtszE9A-576SmvsX@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-06 at 09:51 -0700, Dmitry Torokhov wrote:
> Hi Nuno,
>=20
> On Fri, Sep 06, 2024 at 10:38:35AM +0200, Nuno S=C3=A1 wrote:
> >=20
> > Hi Dmitry,
> >=20
> > This is not forgotten and I plan to start working on this early next we=
ek.
> >=20
> > One thing I noticed and I might as well just ask before starting the wo=
rk,
> > is that
> > the platform data allows, in theory, for you to have holes in your keym=
ap
> > [1]. Like
> > enabling row 1 and 3 skipping 2. AFAICT, the matrix stuff does not allo=
w
> > this out of
> > the box as we just define the number of rows/cols and then without any =
other
> > property
> > we assume (I think) that the map is contiguous.=C2=A0
> >=20
> > This is just early thinking but one way to support the current behavior
> > would be 2
> > custom DT properties that would be 2 u32 arrays specifying the enabled
> > columns and
> > rows. Out of it, we could build row and col masks and get the total num=
ber
> > of cols
> > and rows that we could pass to matrix_keypad_build_keymap().
>=20
> I'd ask DT maintainers but in my opinion we could add 2 u32 scalar
> properties to specify row and col masks (either enabled or disabled,
> whatever is more convenient) and then indeed we could figure out the
> resulting size of key matrix and use matrix_keypad_build_keymap() to
> load it.
>=20

Alright, I'll see how it looks like and DT maintainers can then comment on =
it.
I'm afraid they can complain about the masks (for not being super user frie=
ndly)
but I think key arrays should be acceptable. I'll try the masks anyways...

- Nuno S=C3=A1

>=20


