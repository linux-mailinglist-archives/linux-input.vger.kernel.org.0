Return-Path: <linux-input+bounces-15272-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CBBBBF36C
	for <lists+linux-input@lfdr.de>; Mon, 06 Oct 2025 22:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B10A94EC4C7
	for <lists+linux-input@lfdr.de>; Mon,  6 Oct 2025 20:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCD22DD5E2;
	Mon,  6 Oct 2025 20:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLcuykQW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC02DCF50
	for <linux-input@vger.kernel.org>; Mon,  6 Oct 2025 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759782912; cv=none; b=f5Fy5T5zt41asgIwAanI69M1ynsE90/Ud9u6XZ2LCmm4t5P3KC96HexNO4U/l20bdN4Lswl37XGIj9Hyl0C2u1alfxctuLa1S4Ig+2d90TpOlyQ7wOpuQPJHa4LGtAs/3aqUiRaQN9KcWgzD3urA2PecC2WwmQgImfogmwBHi40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759782912; c=relaxed/simple;
	bh=wRqM1wL0rtVZzWbUB1vZjAZ//+DX1ksR98VvmNXh1Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aj0NB/1BKUwtM2gmBegLjdwse0nahaGMqw1QAc6dowD7KIVJhIzFQzdSDEA5yrU8uV0jd9ZHa25QLd1CSaP90OLBDuhJKsMOJnG9+GnAInIkyd7IngvPRAB/tcoAvoypFRHpM2DnhuYFRApyWElhXDRZOr8VZerEJ+suGJGo9uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLcuykQW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso40490625e9.1
        for <linux-input@vger.kernel.org>; Mon, 06 Oct 2025 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759782907; x=1760387707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8A8mrbjHOp4I+EQv9aLZuINyxZFXeZgTqLUL4/gbts=;
        b=JLcuykQWTX1qhWoGcyL4rEQ654Dn8fEafHNnYaDb6dJmDejlYhMexc8dmKE0V+67KA
         VXeK/+jdcGamwSsNrowIARdasb/A3kfrVP+mYMrjG2fMDyohKFx1OR/CBHF/NQieDvTm
         nYhYkQLV5FmuVpoGFvxSlH9sEY7KtEtF6AA69dHyfafQLyW7FbgGfvjK7QzAsZKhJRxF
         6b1Bh3dSp4xPjBWSZAhhNHoWPX4ZTv1vyvmhV1EfLHKX0+BMy3LeCJPJ/qPM7TxeZzUu
         gAvPPXnbv8/OFMtna0TOzl2h/DsQ3zNdQkpQ+LVjhXyApki4ODJMjXgeiBA/a3ojS0nY
         rm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759782907; x=1760387707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8A8mrbjHOp4I+EQv9aLZuINyxZFXeZgTqLUL4/gbts=;
        b=RZBBfy+sucxSZBpNaweV6VX/Di+ZhV/CzLtABqMiNAwV/dchUdYQuXq8uwNvCEGvRG
         hIeIl7OIS1WV7Nfk17XUMTd91qEXqW7krKu5QevGsuxeTzL+3sA3sGsCcQnhO3F+fUEP
         T9qoflSjnDhgC3nM8tLaZPR2Q+VYj6rZp3Vqm+BxIz6EoJdn5g5dKoiIYKhlVuMYn8Hi
         UPiOiJoFyhKOOBMhVJSHChggUr7oQKlA37UgEqN6ZDKm/xZ1KM7ahZvPCkAOm87k7k0t
         5MLg3TcTeWBx/QVXBbtYqmQCRHfzdyfBaMpmqfNA3H9ec73/N1yHUeG2EQmTAsxpr0hE
         uWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEKZ0UKGe1BlWtWfM2nTlq51gj97Kf0iU4sAcISTpxaQTCbil3pqnKcoyzVSG3CBtHgpWFXSp5ybUy2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSpyjbV0bXI9AWQj3sx2SQAxLKtwEhoBPdU1XBw5npuELyoST9
	X0t8sldRbf/duiHqt0yfmNLK8lHaxNmvyraSOW4+rtxyVHtpF+yQs85C
X-Gm-Gg: ASbGnctox+XeUskBsdIffxecJNF5w23vJIbFxLCULR8tEfMK2cjfHlSiAG9b/RyuM8z
	iS27D1tloa6AQfV2Kt6T2n4KZ+Dq3kXcs37HInJ6zghShVenPSmh8UrEhgcyzLNNm3CXmsFwWEI
	Y6vBhqGWRHs9KaRUg+3b20vROYDgGcjvfmpVKh1LdrVkp0s9BZoCSsO5gxmFMHr/N7L4/WMaa3T
	ivKts/8G+DxOzJGRBHOuLh2nPyDTjnY8ll+NNDeEl3yc1bpIki1+0G+qUQggamPoT5847+0by7a
	vs/xmHGt0j/foUbwd3as1Lh8qxrA4hj78hmLEzjek5rjaMRvQip+4Gjg/h5Yv10kMn1jRfoGuO3
	Ysr1jkPRXeAOtbpD2VU8SXduTt5aBbjjhha+8PCCshhUUB6kEOm5kto09eyzWKpAfDVyXu03isf
	CwSo50f36IiGg4
X-Google-Smtp-Source: AGHT+IEnzSpQE+ROtayFnE2b4dPjTQF2CaZO9TdUfVNFcX6ejR4aNYCswD7XdVH/ajIMwYylIXY+YQ==
X-Received: by 2002:a05:600c:2287:b0:45d:d86b:b386 with SMTP id 5b1f17b1804b1-46fa29f13dfmr4596085e9.14.1759782906754;
        Mon, 06 Oct 2025 13:35:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723591fcsm172334545e9.10.2025.10.06.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 13:35:06 -0700 (PDT)
Date: Mon, 6 Oct 2025 21:35:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Eliav Farber <farbere@amazon.com>, dave.hansen@linux.intel.com,
 peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, james.morse@arm.com, rric@kernel.org,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, sean@poorly.run, jdelvare@suse.com,
 linux@roeck-us.net, linus.walleij@linaro.org, dmitry.torokhov@gmail.com,
 maz@kernel.org, wens@csie.org, jernej.skrabec@gmail.com, agk@redhat.com,
 snitzer@redhat.com, dm-devel@redhat.com, davem@davemloft.net,
 kuba@kernel.org, mcoquelin.stm32@gmail.com,
 krzysztof.kozlowski@canonical.com, malattia@linux.it, hdegoede@redhat.com,
 mgross@linux.intel.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 sakari.ailus@linux.intel.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, jack@suse.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 dushistov@mail.ru, luc.vanoostenryck@gmail.com, rostedt@goodmis.org,
 pmladek@suse.com, senozhatsky@chromium.org,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 minchan@kernel.org, ngupta@vflare.org, akpm@linux-foundation.org,
 yoshfuji@linux-ipv6.org, dsahern@kernel.org, pablo@netfilter.org,
 kadlec@netfilter.org, fw@strlen.de, jmaloy@redhat.com,
 ying.xue@windriver.com, shuah@kernel.org, willy@infradead.org,
 sashal@kernel.org, quic_akhilpo@quicinc.com, ruanjinjie@huawei.com,
 David.Laight@aculab.com, herve.codina@bootlin.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-edac@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-mm@kvack.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, tipc-discussion@lists.sourceforge.net,
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v2 07/19 5.15.y] minmax: simplify and clarify
 min_t()/max_t() implementation
Message-ID: <20251006213242.3462e746@pumpkin>
In-Reply-To: <2025100648-capable-register-101b@gregkh>
References: <20251003130006.41681-1-farbere@amazon.com>
	<20251003130006.41681-8-farbere@amazon.com>
	<2025100648-capable-register-101b@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Oct 2025 12:47:45 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

(I've had to trim the 'To' list to send this...)

> On Fri, Oct 03, 2025 at 12:59:54PM +0000, Eliav Farber wrote:
> > From: Linus Torvalds <torvalds@linux-foundation.org>
> >=20
> > [ Upstream commit 017fa3e89187848fd056af757769c9e66ac3e93d ]
> >=20
> > This simplifies the min_t() and max_t() macros by no longer making them
> > work in the context of a C constant expression.
> >=20
> > That means that you can no longer use them for static initializers or
> > for array sizes in type definitions, but there were only a couple of
> > such uses, and all of them were converted (famous last words) to use
> > MIN_T/MAX_T instead.
> >=20
> > Cc: David Laight <David.Laight@aculab.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Eliav Farber <farbere@amazon.com> =20
>=20
> Eliav, your testing infrastructure needs some work, this patch breaks
> the build on this kernel tree:
>=20
> In file included from ./include/linux/kernel.h:16,
>                  from ./include/linux/list.h:9,
>                  from ./include/linux/wait.h:7,
>                  from ./include/linux/wait_bit.h:8,
>                  from ./include/linux/fs.h:6,
>                  from fs/erofs/internal.h:10,
>                  from fs/erofs/zdata.h:9,
>                  from fs/erofs/zdata.c:6:
> fs/erofs/zdata.c: In function =E2=80=98z_erofs_decompress_pcluster=E2=80=
=99:
> fs/erofs/zdata.h:185:61: error: ISO C90 forbids variable length array =E2=
=80=98pages_onstack=E2=80=99 [-Werror=3Dvla]
>   185 |         min_t(unsigned int, THREAD_SIZE / 8 / sizeof(struct page =
*), 96U)
>       |                                                             ^~~~

That constant seems to get (renamed and) changed to 32 in a later patch.
I'm not sure of the rational for the min() at all.
I think THREAD_SIZE is the size of the kernel stack? Or at least related to=
 it.
The default seems to be 8k on x86-64 and 4k or 8k on i386.
So it is pretty much always going to be 96.

Linus added MIN() that can be used for array sizes.
But I'd guess this could just be changed to 32 - need to ask the erofs guys.

	David


> ./include/linux/minmax.h:49:23: note: in definition of macro =E2=80=98__c=
mp_once_unique=E2=80=99
>    49 |         ({ type ux =3D (x); type uy =3D (y); __cmp(op, ux, uy); })
>       |                       ^
> ./include/linux/minmax.h:164:27: note: in expansion of macro =E2=80=98__c=
mp_once=E2=80=99
>   164 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>       |                           ^~~~~~~~~~
> fs/erofs/zdata.h:185:9: note: in expansion of macro =E2=80=98min_t=E2=80=
=99
>   185 |         min_t(unsigned int, THREAD_SIZE / 8 / sizeof(struct page =
*), 96U)
>       |         ^~~~~
> fs/erofs/zdata.c:847:36: note: in expansion of macro =E2=80=98Z_EROFS_VMA=
P_ONSTACK_PAGES=E2=80=99
>   847 |         struct page *pages_onstack[Z_EROFS_VMAP_ONSTACK_PAGES];
>       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>=20
>=20
> I'll drop this whole series, please do a bit more testing before sending
> out a new version.
>=20
> thanks,
>=20
> greg k-h
>=20


