Return-Path: <linux-input+bounces-5406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C417B94A319
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 10:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7B8D1C21C4A
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 08:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCB51C9DDA;
	Wed,  7 Aug 2024 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ2ogUaF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173001C823E
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 08:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723020191; cv=none; b=jW3OkWUe4hWD22cmvjquqgGQx/5298Vhdp37kUpwvl8WvRKCdbK2K0yyMaXPMbH9D1Rl/yDa+eMXgLqkDIk+yoMp3x8fUjDIWdEbgOBv07kY5+B3zfC/0AldVHZPnk5xZ7dWoIgr157YIKHtJGP9EgLLhSW6g1VQ6VRFxtI32Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723020191; c=relaxed/simple;
	bh=eyF++OJgsEQRcpfdd094ENptQ28jWnocuHbOCGv8dbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EW1cdLY6FITS9p4G/uSnRnYO/llJ8oOoTPEPis3SC6YQW0OkQzQ9+ApR3OTZsat4CnYA9bN8RYUepaBQ/06J4z6zqRgXjohpixKDEL+D6du5H8Tm0FeKUxc9xyAoj8+CNpTL6TV6eQUQ/AGL6XKpaV5SxntLx/Ibj+lSi2kMi88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ2ogUaF; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a5809a3bb9so233132a12.3
        for <linux-input@vger.kernel.org>; Wed, 07 Aug 2024 01:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723020188; x=1723624988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14YwkFg5zPnG5oTRA2TFEQsWtMHgl40ig9SrfC+Du88=;
        b=YJ2ogUaF0uCtDl1PLCngQXtAhYRnu3YO+MZvKEY8XT6uB9CdWOQajHIxd5EH6xrqCF
         +cRgPwTGOY1ZJH+I7JtlldaSC59oybn05cq5IHgUMzWePKK9X7+Hmd2oAGRF2m0p6pCP
         ouYgUJFZvvK9oeaBbEsnXLuxsue/Jbv9ldPNwvX60Q2r4tw6TT4OZ6IwgsMwaoHXN/SH
         QLl1UA5Vt23F+FcJfkubnQRKwr2VdzojFi8hJe9nTU9riORgx+Z9AaD/Qd8lYjhL4pMI
         1krLb5GBMJgUkyh6nTa2oFVJsB9DC2/Iocanp5HQlpJcApPWWcfHl8r0uo2URvKuR9rd
         tQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723020188; x=1723624988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14YwkFg5zPnG5oTRA2TFEQsWtMHgl40ig9SrfC+Du88=;
        b=LLjXiYpdg8hsr4j4gVHEQ2XuTPPGOf9w1MQNcHiZRAY245WK6hrcaTdoFKb/7LBZ3Y
         MF56JJTdX7XO4+4KSHZ1fzWM7LpEvEdInIVh/3e9Q6MytdXu3lRlhJmqp0k+AeW8KJg5
         IZFwYXqb0nPzoLdKMy+aFfDzvAfKkrDmaLfbfH58zXXsELQ/+RCtvI6NxuhAm9Nor7SV
         WyL/RbLd+dGh174mwmPkBsKH1kz3gGIrcNwvzQ1Ox/gZhvB9G1slHvb6mbbF3K/An3WW
         pSRlMYZ7SuZGRDPO20tp6UM6o+d1c0UzyHlEOsrne5MTNZmG9MTlixeSdPct3faSD5kx
         GONw==
X-Forwarded-Encrypted: i=1; AJvYcCXTHhpF1UuDBYDMWPENZGzvwrTpCf9XyZSDQJe5xcxQtF5Gt9D/TL6KUscHY0iByLB1NvDCwpr07Qnsog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbJTsFL3xgSdrke9Xx2luIA9bpc0w8ib3NOXaRMVkEoxRTgx2L
	6wmYwwX2XqENv1m9ln5RzCsR8kvAA1uik82b4gJ6gtfBZDRffAXwakqQux1BRyP3WliRNTYitTY
	1GFL2vhcRL0CjYqe4XrWGxzGOsMI=
X-Google-Smtp-Source: AGHT+IGWspvuVURpArdviBuIhzLWvqfn9mvsPVZvkhwqMNZqxbxXm33t89Vnrd5viwRwVrdFOodjV+gi/xVqAkr8Qno=
X-Received: by 2002:a50:c181:0:b0:5a1:c63c:7d7a with SMTP id
 4fb4d7f45d1cf-5b7f3ada1demr6655253a12.2.1723020187758; Wed, 07 Aug 2024
 01:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com> <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka> <ZrL0KD9yDnfHMbL-@google.com>
 <20240807051708.GA3551201@quokka> <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
In-Reply-To: <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
From: Wei Shuai <cpuwolf@gmail.com>
Date: Wed, 7 Aug 2024 16:42:56 +0800
Message-ID: <CACa7zymOLKZE03xQMGG3ZS=sJLrjAN1Xk6MKkZuCKzmpS4pPVA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: Peter Hutterer <peter.hutterer@who-t.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	bentiss@kernel.org, linux-input@vger.kernel.org, oleg@makarenk.ooo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes, agree. either way, will be a revolution.

At least, for me as X-Plane flight simulator gamer, a small change in
expanding the key max number can make my device work immediately

Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com> =E4=BA=8E2024=E5=B9=
=B48=E6=9C=887=E6=97=A5=E5=91=A8=E4=B8=89 14:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 7 Aug 2024 at 07:17, Peter Hutterer <peter.hutterer@who-t.net> wr=
ote:
> >
> > On Tue, Aug 06, 2024 at 09:12:24PM -0700, Dmitry Torokhov wrote:
> > > > > > > 2. Can we consider using something other than EV_KEY? For exa=
mple we
> > > > > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL pair=
 to allow
> > > > > > > transmitting key number and state of keys that do not have pr=
e-defined
> > > > > > > meaning. Here we are losing event deduplication and ability t=
o query
> > > > > > > full keyboard state, but I wonder how important that is for t=
he devices
> > > > > > > in question.
> > > > > >
> > > > > > The same problem rears its head in the EV_ABS and EV_REL range,=
 so
> > > > > > fixing it for EV_KEY doesn't necessarily fix it for those.
> > > > > >
> > > > > > MSC_PROG_KEY/VAL pairs would make it difficult to send two butt=
on
> > > > > > updates in the same frame without an SYN_MT_REPORT equivalent.
> > >
> > > I do not think that frame notion is that important for keys. It is
> > > typically important for a pointing device state.
> >
> > true, I remember a conversation years back that frames aren't
> > consistently implemented in keyboard drivers anyway which is the reason
> > libinput sends (most) EV_KEY events immediately instad of waiting for a
> > SYN_REPORT.
> >
> > > > > All in all, we've had people using this patch (but increasing KEY=
_MAX to a
> > > > > whopping 0x4ff) for the past few years with no adverse effects. I=
've been
> > > > > using a custom Linux kernel with this patch on my Arch machine si=
nce about
> > > > > May, and didn't notice anything, even when compiling with debug f=
lags and
> > > > > following and filtering dmesg.
> > > > >
> > > > > So here's the thing I'm most curious about. Is this something, yo=
u'd just
> > > > > want to resolve differently, to make it nicer and more logical, o=
r is this
> > > > > really something that would break everything and doing it in this=
 way will
> > > > > never be allowed/merged? That would make a lot of us sad :(
> > >
> > > We need to figure out not only how to handle your class of devices, b=
ut
> > > also allow extending number of keys that do have certain semantic
> > > meaning. Peter raised a lot of questions that we need to answer.
> > >
> > > But I wonder, these devices with large number of buttons that do not
> > > have predefined meaning - do they have to be a single input device? C=
an
> > > we create N input devices if we exceed the "trigger happy" range, all=
 of
> > > them mapping to "trigger happy"? That would mean that userspace would
> > > keep track of key assignment on per-device basis.
> > >
> > > We already split HID devices on per-apllication (not userspace but HI=
D
> > > application) basis, and also when there are several USB interfaces.
> >
> > Honestly, I'd vote against this.
> > re-combining input devices into a single device in userspace is a pain.
> > The split per application in HID is mostly fine because they're
> > usually physically different devices but I recently ran into the issue
> > with the uclogic drivers where various features are split across
> > event nodes. Thse devices have the ring on one event node, the buttons
> > on another, etc. Nothing in (my) userspace is currently set up for this
> > and it'd require a major rework in many places to be able to handle thi=
s
> > properly. And it requires that rework in every userspace stack, possibl=
y
> > special-cased on a vendor id. In the end it was easier (re-)writing BPF=
s
> > to get the expected event node behaviour than dealing with the split.
> >
> > A device that arbitrarily splits makes this even more difficult - which
> > one of the event nodes has buttons 1-20 and which one has 21-40? We'd n=
eed
> > some other magic somewhere (e.g. hiding in uniq) and some digging aroun=
d
> > in udev to figure out which ones are part of the same device.
> >
> > I'd rather not go with a simple-for-now solution that makes everything
> > in userspace more complicated, forever.
> >
> > Cheers,
> >   Peter
>
> Yes, I would also say splitting is, unfortunately, out of the question, b=
ecause
> of the intended use-case of joysticks and other gaming devices. Most game=
s do
> not handle multiple inputs and only allow for one device to be set up at =
the
> same time. This means, any buttons not present on the first device would =
simply
> be inaccessible and the end result would be the same as now.
>
> It seems like we're stuck between a rock and a hard place, but at least o=
ne
> thing makes this easier. Even if a new usage shows up, it doesn't really
> matter for games and especially sdl. Given button must just work, and it'=
s
> designated usage is of no concern. For all intents and purposes, it's jus=
t a
> random name that may or may not show up in the binding settings.
>
> Moreover, all these usages are lost in the proton translation layer, and =
most
> games are played with it's help nowadays. For the Windows games behind wi=
ne,
> these buttons don't have any special meaning and just have numbers.
>
> While I understand that a new usage might show up someday, I wonder how
> likely it is in the near future. TRIGGER_HAPPY range was added about 20 y=
ears
> ago? For me, as a 27 year old it seems like a lifetime ago.
>
> I guess my point is that if we were to increase these button ranges in AN=
Y
> different way than increasing this limit, we would still need massive mov=
ement
> to get all the software to handle these new cases, if they ever would act=
ually
> care/have resources to do so.
>
> Tomasz

