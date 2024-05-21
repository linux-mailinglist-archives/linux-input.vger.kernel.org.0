Return-Path: <linux-input+bounces-3751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7778CA729
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 05:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FD511F218A0
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 03:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB7318040;
	Tue, 21 May 2024 03:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMhc7n/a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0817722
	for <linux-input@vger.kernel.org>; Tue, 21 May 2024 03:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716263745; cv=none; b=f+yQmhTfUCj0n4NnOtmmtqpGLfG7rwYILjHV87WRlEKOqrHMDTW4tndV8yriXReyAC5ZcyEeM3d9e4KXu7g1gNii5MkjelGDmemgzqaahLWHzjJ+yyQXk8vNk1hw8XXQFUhH2kJs/pDxO5bnH7JsAD+nPddE+6XsbfPsA/4vVik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716263745; c=relaxed/simple;
	bh=bbD3KapDN+EeLs2p7Olx+ECrtwEiBhEogRJzOYwGdpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Diq+uS8+eOUjpoDCo75JirbUL0kanQP7651mi9xzyESwiV6QocBp39jEErrW5yUZ3TyDroOiVteTP9iXC5JDozAriRZUCV6mzjr8S5c49gr6sq5A+kqmiDNzZAtvKaBTdNiF3voPv2JYQuY0+eEfUJav+vsKHviG8mw9VPabocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMhc7n/a; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5750954fe30so415751a12.3
        for <linux-input@vger.kernel.org>; Mon, 20 May 2024 20:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716263742; x=1716868542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbD3KapDN+EeLs2p7Olx+ECrtwEiBhEogRJzOYwGdpo=;
        b=BMhc7n/aqGTC9shJv6rLXpHg05U/ALwR48mrGU+zLQpNkeScnFzaWmdrdkT+5mSFJb
         BwejS++e978dU0Zja1lDAMSGP5bfZqcgGnbiFf643NlPJ8MsP8o7Mwg2Iw2TVRhVyHVs
         vK8N5LFN/vgb/pw3Lv39VQ/Af8ZATYT0RLrxLlmK8fybEl3v/kHUuSIFTs51zHadssg3
         fL8X4WxDR6xBqcJOrLW8IxIf9QLiWswJK+tHEdlyP2hMTcU6cMTCbBwcvOhOcJTVaAfB
         oeUjNl1yxyNBKWd09ppkFnWAkdcEeiwWcWoEbcxRy3IV7TRxrZo6qlYKkqFQQIpHKmx6
         9S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716263742; x=1716868542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbD3KapDN+EeLs2p7Olx+ECrtwEiBhEogRJzOYwGdpo=;
        b=G8CDu0gcfkAXYRc0AH0tR5sgISucgeDNO/UV050a1P/pMqjfnix/EuFODTivzy4G+Q
         aLC262XpHm1dWfYFsMG87h19DefzeqW0gKP1yei/EYtpygu1QukcFp1DmS6nGBRZH2O3
         fOh5bFwmCbWYvuWqwLV8sbcF2zn4i26ummlXXa1Z8FfJBXjLa6ASXOsQO6lkww3at5sk
         yyfukUVNEBMEIpINUcatwxzimTcRSBBP5mN6G0T6g9HRWH7GpD8qKUeOZYjV1/jB5FFA
         WZbMuodLz6rJdeF+8WCcRnXKqvDps3Sb5TV6ksY7IXPOcygFWJPsUa3UIdDN1hAkhoKR
         GTsQ==
X-Gm-Message-State: AOJu0YwEuk1Gdf50OUCQzgJUlpr5j7wV91tc4GivBRBdM+xgf/cjChtm
	mCo/lI2AXAfL50NQeLErJ+kEMJmaaItTzH/jAdFR5P+VvDpC/Nnzfr2meM4NtV6slTMVC0gzCI4
	oZybLfO+AJggwJXWBUrTJIrja7H/V98cR
X-Google-Smtp-Source: AGHT+IGq9+cjPya6EXzz5qBEls9OtKCmirfD/VCQ4uydBNGCx3D//Y7s5tBIRfS/P+Wz9xC6S1xa3e+E5wTeB1fK1wU=
X-Received: by 2002:a05:6402:26d3:b0:574:ffa9:7f7 with SMTP id
 4fb4d7f45d1cf-574ffa9095bmr11710080a12.2.1716263742347; Mon, 20 May 2024
 20:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510234332.139038-1-Joshua@Joshua-Dickens.com>
 <CAF8JNhKKCCwRzUxookmv9VUecT37fR8psoz7uSVBQqDhnYEBgQ@mail.gmail.com> <Zkvcs0yg1ltamZPY@google.com>
In-Reply-To: <Zkvcs0yg1ltamZPY@google.com>
From: Ping Cheng <pinglinux@gmail.com>
Date: Mon, 20 May 2024 20:55:30 -0700
Message-ID: <CAF8JNhKqAOvxo3C1SaecaVP0uj4QeYpttybBgq_Jw7n18MLpcA@mail.gmail.com>
Subject: Re: [PATCH] Input: wacom_w8001: Check for string overflow from
 strscpy calls
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Aaron Armstrong Skomra <skomra@gmail.com>, 
	Jason Gerecke <killertofu@gmail.com>, Joshua Dickens <joshua.dickens@wacom.com>, 
	Joshua Dickens <Joshua@joshua-dickens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 4:28=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

Hi Dmitry,

> > This fix is the same as [1]. Without checking the return value,
> > Wolfram's patch [2] fails our downstream build script. I'm adding my
> > r-b, if it makes any difference ;).
>
> Could you please tell me how exactly it makes your build script to fail?

We got an "unused-result warning". Jason made a temporary workaround
at https://github.com/linuxwacom/input-wacom/commit/e83a9bb3e48d2d1b52ec709=
e60f73b9960d568e5.

> My concern is that the warnings are not actionable and therefore pretty
> much worthless.

The return value tells us which strscpy call(s) didn't have enough space.

Cheers,
Ping

