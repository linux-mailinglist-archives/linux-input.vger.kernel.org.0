Return-Path: <linux-input+bounces-4722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1191CA1D
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 03:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7334C282566
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 01:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575E83C30;
	Sat, 29 Jun 2024 01:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx34cpwm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA162A2A
	for <linux-input@vger.kernel.org>; Sat, 29 Jun 2024 01:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719625955; cv=none; b=LVca1fpbODn9F9pOQyj38xjBt4t3jBqU9xMzrRYmc+ynMYBgE3BhX3btrTuMI6yQEj56NDwX5CAN3BXN10QR+QXFYlIoWbc7/Y96Xw0KydFR8+/FIM8hOwPDI7ukDDnVuCkF10eg2WRh2plVujUduvNNyqjP0rkmwKEX1DRTCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719625955; c=relaxed/simple;
	bh=Q9Eg2/V3ftY8NJ901Sa+07hZYopaTlOI+wT1RtgrWuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvsqUysbGUg8BBdXyPvTnA0VndrNZwM8vOCun1XZHazaX2N2aIYiWmAy0sg8ZYeOK/soutmzPZW4rTE2XVmYRDrtEjwz9JnhKXP2YbPof732TOnFoqKlLZj3qp35ECbx61KAKgluFvF85ETKCnuSO07ScX9d66joGdUXEUXvZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx34cpwm; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-643f3130ed1so10823167b3.2
        for <linux-input@vger.kernel.org>; Fri, 28 Jun 2024 18:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719625953; x=1720230753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGgmjvBoy8Cn9G/3ypoGENG1ukPY8Zw/4jQ4d+wQx7g=;
        b=cx34cpwmxI3ernfm7nCr/+Thv+ekeQcAyXb+9ET0VGziV9NfmHEB2Vt5mjgYOvxNaR
         MUPywmkD6hngaH+i5BlG7QKjz3R1k1OtXmyzUrE2rkdm1fVW7q214opFCD+nvShZdHoA
         J3pmtAf8C0yoWuCdCTcR8Z1CPozcWE1zIazxtjgdA0eq1PiYE9aG+m5VuaMgFQdDMUYd
         voZhHGSKTT5hfyOmWb+OgL1z5n3UH0vd6K6gkqktp6hvPf9V4yN940Qyy61RCGjYxKDA
         R2zqfSPjZqB1MZOGbo6it5QAtXUoaupE5jqwpcrasEtbEjo2d7SJDGZpXAA5NxPmLacU
         Y9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719625953; x=1720230753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGgmjvBoy8Cn9G/3ypoGENG1ukPY8Zw/4jQ4d+wQx7g=;
        b=P4LLJLQuJyRxSzsiJ0gQtJZm9uJW8nvF7qPO8entyTNkeoginVaFeT64HCekE9Wzih
         TrLtQ8h4uKoqmyrUq+x4IFtJCimVjSLZu7nhdy2H+6Z1MAMg7xM+8e8mkDnxcE3ZOx6D
         vkE23yb/Th8yd3hQYTJAUbq10swVWeDXLp2V3iSzSjqHiLXKRn6QGcTUYzhIYozjDdHg
         s5cSoZErVwdj5ope7K5VgtePiHM4Ol3HK5OkJWI+xhDneh7fxihnfzUAXZrkofXNjQgJ
         DkNoWAHcZjFfOaFd8jJrx/YR6YxVISqmaApJpLZmmfDLLUk2Z5HGr6L78RPECLZTQe7Y
         HrFw==
X-Forwarded-Encrypted: i=1; AJvYcCUw/01U4yH5UHAZtprSrBtzvN7gu61F5T7G25TdX3jHOwnJ5AE1sWz3uzdPHyH6Rm7q9O24e2iPYb45+w2tt2a4EAR5rimV2y9LeZE=
X-Gm-Message-State: AOJu0Yx6ihhns+3F5fWXiJBIesb/z1LX2JYNUsVBWulMbNPGXsXPyrzX
	s2MxoINWkZ4lFUfWJRYXSlZX6p/M97Lhf1YoRPaN2HYICVQ4AbBxNLXWAxzEyeaxM3LpDzrumvU
	qDIKl9NvSSsD51TCJfQ0sUpQRvpw=
X-Google-Smtp-Source: AGHT+IGihIJVwh/6hapLFsizAK0zYdjUO04c2I3gN7DtFYwyvppQD1wyy4aeImCByBf8QAwPvHT/IshVLa01ri45z3Q=
X-Received: by 2002:a0d:e695:0:b0:64b:630f:9f85 with SMTP id
 00721157ae682-64b630fa02amr28371077b3.12.1719625952803; Fri, 28 Jun 2024
 18:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624065359.2985060-1-zhoubinbin@loongson.cn>
 <ZntY8UO-VIW3reL4@google.com> <CAMpQs4LmAc6_-2KHEnZsnaMdbUWVTE_zhDK8W4GEtnBJyr0AUg@mail.gmail.com>
 <Zn9Mw-vLZeUcCS8b@google.com>
In-Reply-To: <Zn9Mw-vLZeUcCS8b@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 29 Jun 2024 09:52:21 +0800
Message-ID: <CAMpQs4LV5eNp19aFX5Bm-e5oD-Y_pvMOfy18rkFYsN45kVUXPQ@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Add driver for PixArt PS/2 touchpad
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 7:52=E2=80=AFAM Aseda Aboagye <aaboagye@chromium.or=
g> wrote:
>
> > > On Mon, Jun 24, 2024 at 02:53:59PM +0800, Binbin Zhou wrote:
> > > > +
> > > > +static void pixart_reset(struct psmouse *psmouse)
> > > > +{
> > > > +     ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> > > > +     msleep(100);
> > > > +     psmouse_reset(psmouse);
> > > > +}
> > >
> > > What is the reason for the 100ms delay here? Is it to prepare the
> > > controller for the upcoming reset? If so, could it perhaps be
> > > defined as a macro?
> > >
> > Yes, the 100ms is required for the upcoming reset.
> > And we just use it in this one place, do we really have to define it as=
 a macro?
>
> Got it; could you add a comment stating the requirement?
>
> With regards to the macro, I wouldn't say it's necessary, but they can
> make things more readable in general. I'd say for this case, especially
> with the comment, it's not needed.

OK, I see.
I'll add a comment to explain it.

Thanks.
Binbin
>
> Thanks,
>
> --
> Aseda Aboagye

