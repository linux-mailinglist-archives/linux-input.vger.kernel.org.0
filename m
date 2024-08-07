Return-Path: <linux-input+bounces-5405-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74682949FC5
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 08:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9A131F22046
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 06:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B301B32AC;
	Wed,  7 Aug 2024 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU/c+cie"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1371B32AA
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 06:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723011815; cv=none; b=Kf8Zh0BV3RljQdCrCXRjSXeUX7XYpEN0VxhcIZ1r7R2IF8Xnzri3QJvlBEH88h6c/ZeyCqRJ9vbmq9X1JbIDrvENQBqePsfxDsCuuBvWUsVXrUF4m5eH7Z/OJp2QhtU4IrUxw6fbN+hhGLuICisKWnsKuPtXIIlKbQD4/CkchPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723011815; c=relaxed/simple;
	bh=xGsY3Vrz4FtE+K2xYGiUaPDaFRsXdYn8fHGqVPAJH30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HS6/y++lfB3WaZDkyUz6URw5AFvEdQJssjqWo84Wobh2osiTaW3Eh2JavE8QzQ/D7smnnw4JMRCmTZfMk7F4PE378oquwgKDI1iFjGYqjgfdtdA6UoDZmzgBwvKsj0iTRgmV/R9WC9gyMLF9hgicu+jMFT0AK91qJNYSk9wGGH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU/c+cie; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a156557026so1542885a12.2
        for <linux-input@vger.kernel.org>; Tue, 06 Aug 2024 23:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723011811; x=1723616611; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KV26LjNG4dc9VMyD4kDyGUPZzUqEKdLPH1JMh3i2cWI=;
        b=NU/c+cievas3QIlcZM17GOgKapZlguUs3Cj5zR4YaaASEj3XHTwbn7xxOxRx2uEJo+
         6yZ9k1UDnEwiqFdM188jCTgvYI+h4tynPF9Dvye7sLUYdQrgUmWAPMqs4hWbuBwhgp0/
         ObU45ncmAmPOVYUBKIenNq6dFel5KyH7JEUlPqTs8T9j1q4oeF9Yg5z+3A5AVGfpp1yh
         i67KhWRcqy+ISUGC66BHq91NT1uXssgRh9sdAe8OPJxUEqoOlfo5qek0sR88vQsoUPcQ
         LAadteavbEhq8fmVO7ttqkpt8+ujtkA8t0Jl9mlLfbtApZsQTFFEYGof4VhYOk1sahKF
         ST1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723011811; x=1723616611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KV26LjNG4dc9VMyD4kDyGUPZzUqEKdLPH1JMh3i2cWI=;
        b=c3cMHRh39TkAPQsrupYMgX1v2rQ2TPGjwDS29SvMFfT4eKeHk20s6w8QX4jnET/Ard
         RW2Eo7fGplctRb94reNZ1QeBbOX3/rIJQ4OWoA5AWLCTg+mQVTZljy2U4bUOZE6ZoPiA
         uHzBaOAi6WIGvxtX4NXLXRMZoCRHV6iTKhmVJll306cB7z0RkAlJDEupGKs3WHfCP6pG
         IO4tXcROIpqSPdqXV2xKIKVqv37R/8l5RvUGrIZCw23Jjiqrf5lyUzyj2dxgT8le7cmp
         2B0zP50z5W1I+LwOy2WZyB7/J0aR/ZrxUUcmkU87Tb03ql1F1TT9OrTeHneG+IWZ7gk2
         uY/A==
X-Forwarded-Encrypted: i=1; AJvYcCX5E0E1NwYKTNkwPKVuJpB2iKN6JURDp92dI3RNo/1zaQfDf/gdSFrAA+3Y4nAzrOuB/cc3Mo2GyXtQXChcOxujiLbGab8S94ZK1S4=
X-Gm-Message-State: AOJu0YxnyvCeHDACfq4qlf6Epk7SCFkz2W6BhWLhcuvoRsG+F7lpQ7W0
	SaSkwEZ6UvhHki5i5s5NdK254k6FbBk36v10jIsAovNp0trdrP517ra+6TCOnGll5bnJtMWhBJG
	zyLNLhUuIzc+zglAEtwAa4SsfCuB+CnixrTo=
X-Google-Smtp-Source: AGHT+IHMLZoi81Lv+qcUHtDVTT6suC2qXwzoW/kO6ViO/MrhRjQiXo/WdE9jS1qOvMYCECwkdkPRWMtalymz33Ma7w8=
X-Received: by 2002:a05:6402:2032:b0:5a1:3b03:d0cb with SMTP id
 4fb4d7f45d1cf-5b7f5ccc39cmr13115666a12.32.1723011811112; Tue, 06 Aug 2024
 23:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com> <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka> <ZrL0KD9yDnfHMbL-@google.com> <20240807051708.GA3551201@quokka>
In-Reply-To: <20240807051708.GA3551201@quokka>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Wed, 7 Aug 2024 08:23:18 +0200
Message-ID: <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, bentiss@kernel.org, 
	linux-input@vger.kernel.org, cpuwolf@gmail.com, oleg@makarenk.ooo
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Aug 2024 at 07:17, Peter Hutterer <peter.hutterer@who-t.net> wrote:
>
> On Tue, Aug 06, 2024 at 09:12:24PM -0700, Dmitry Torokhov wrote:
> > > > > > 2. Can we consider using something other than EV_KEY? For example we
> > > > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair to allow
> > > > > > transmitting key number and state of keys that do not have pre-defined
> > > > > > meaning. Here we are losing event deduplication and ability to query
> > > > > > full keyboard state, but I wonder how important that is for the devices
> > > > > > in question.
> > > > >
> > > > > The same problem rears its head in the EV_ABS and EV_REL range, so
> > > > > fixing it for EV_KEY doesn't necessarily fix it for those.
> > > > >
> > > > > MSC_PROG_KEY/VAL pairs would make it difficult to send two button
> > > > > updates in the same frame without an SYN_MT_REPORT equivalent.
> >
> > I do not think that frame notion is that important for keys. It is
> > typically important for a pointing device state.
>
> true, I remember a conversation years back that frames aren't
> consistently implemented in keyboard drivers anyway which is the reason
> libinput sends (most) EV_KEY events immediately instad of waiting for a
> SYN_REPORT.
>
> > > > All in all, we've had people using this patch (but increasing KEY_MAX to a
> > > > whopping 0x4ff) for the past few years with no adverse effects. I've been
> > > > using a custom Linux kernel with this patch on my Arch machine since about
> > > > May, and didn't notice anything, even when compiling with debug flags and
> > > > following and filtering dmesg.
> > > >
> > > > So here's the thing I'm most curious about. Is this something, you'd just
> > > > want to resolve differently, to make it nicer and more logical, or is this
> > > > really something that would break everything and doing it in this way will
> > > > never be allowed/merged? That would make a lot of us sad :(
> >
> > We need to figure out not only how to handle your class of devices, but
> > also allow extending number of keys that do have certain semantic
> > meaning. Peter raised a lot of questions that we need to answer.
> >
> > But I wonder, these devices with large number of buttons that do not
> > have predefined meaning - do they have to be a single input device? Can
> > we create N input devices if we exceed the "trigger happy" range, all of
> > them mapping to "trigger happy"? That would mean that userspace would
> > keep track of key assignment on per-device basis.
> >
> > We already split HID devices on per-apllication (not userspace but HID
> > application) basis, and also when there are several USB interfaces.
>
> Honestly, I'd vote against this.
> re-combining input devices into a single device in userspace is a pain.
> The split per application in HID is mostly fine because they're
> usually physically different devices but I recently ran into the issue
> with the uclogic drivers where various features are split across
> event nodes. Thse devices have the ring on one event node, the buttons
> on another, etc. Nothing in (my) userspace is currently set up for this
> and it'd require a major rework in many places to be able to handle this
> properly. And it requires that rework in every userspace stack, possibly
> special-cased on a vendor id. In the end it was easier (re-)writing BPFs
> to get the expected event node behaviour than dealing with the split.
>
> A device that arbitrarily splits makes this even more difficult - which
> one of the event nodes has buttons 1-20 and which one has 21-40? We'd need
> some other magic somewhere (e.g. hiding in uniq) and some digging around
> in udev to figure out which ones are part of the same device.
>
> I'd rather not go with a simple-for-now solution that makes everything
> in userspace more complicated, forever.
>
> Cheers,
>   Peter

Yes, I would also say splitting is, unfortunately, out of the question, because
of the intended use-case of joysticks and other gaming devices. Most games do
not handle multiple inputs and only allow for one device to be set up at the
same time. This means, any buttons not present on the first device would simply
be inaccessible and the end result would be the same as now.

It seems like we're stuck between a rock and a hard place, but at least one
thing makes this easier. Even if a new usage shows up, it doesn't really
matter for games and especially sdl. Given button must just work, and it's
designated usage is of no concern. For all intents and purposes, it's just a
random name that may or may not show up in the binding settings.

Moreover, all these usages are lost in the proton translation layer, and most
games are played with it's help nowadays. For the Windows games behind wine,
these buttons don't have any special meaning and just have numbers.

While I understand that a new usage might show up someday, I wonder how
likely it is in the near future. TRIGGER_HAPPY range was added about 20 years
ago? For me, as a 27 year old it seems like a lifetime ago.

I guess my point is that if we were to increase these button ranges in ANY
different way than increasing this limit, we would still need massive movement
to get all the software to handle these new cases, if they ever would actually
care/have resources to do so.

Tomasz

