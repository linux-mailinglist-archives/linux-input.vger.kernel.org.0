Return-Path: <linux-input+bounces-3200-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FAE8AE9FC
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 16:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172031C221E0
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 14:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABEE13B5B7;
	Tue, 23 Apr 2024 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dEye1Vrl"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F1A7D40D
	for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713884378; cv=none; b=TcXY8M7qAC4/kSquSBDfkU4TUDyloFFxVARgUWmn8HpiRW57NwLcxwT4h84uesowaoLxna7VwgzI8PATecuEsO2UN4x53rXMzA+ZjsmvlIhLJ4vntS5cD4jsre4EQSwIkyzGkMeWUigXdq/e/dOLzYblGCkzVo2l/Oe7mq4VQHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713884378; c=relaxed/simple;
	bh=olfSGTsFnuztaBe/6TGLSCfwwp+edxO3rygKLxl5HZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXHrGUYTsTJHKlqxyNnZRONUAO9RdwcgcGawmUtw6Ikw5q7y/n7M8fP2+Bnm4tV2kSoA6fa6cl2eGk0vscRLz2fw1qgM2FSBKi2Q/TTfKdiVCVyiVc36JKMAqIEHpT1xYG1Six32VEAZDPFr7QaoC7gTio6Wk4BedWEo6Bt/aCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dEye1Vrl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713884375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ie+FYpj1GJEe+9FkFNy/6w/kFm+u4y5scRjGEyrOJXw=;
	b=dEye1VrlG2PTWGHH/p1JlOHiqQEqpDeWpa3wqMQr5Fp4AZJ6fY29JZ9IzgsqQ0QND07PyP
	dmeDNe4u7CwWPkSnuWtfYFfiAZ5uzHbLu0JkGHRNtF+tzG4AFoFfc5HdoXvJofIhfa6N5x
	phu9j8NpvUtC7bMfji8KjqLoqgLag64=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-e4fdZRPUOg2PyxiZl19vUA-1; Tue, 23 Apr 2024 10:59:34 -0400
X-MC-Unique: e4fdZRPUOg2PyxiZl19vUA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56865619070so1931650a12.0
        for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 07:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884373; x=1714489173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ie+FYpj1GJEe+9FkFNy/6w/kFm+u4y5scRjGEyrOJXw=;
        b=kAOv4h2xR4pqA8O54Ke018AJoLTuLo/yYopbCvux+0eoR1uMoxkg/RiIqZMdUJqh+Y
         1dfWuaXfNqnD6V0upqulgmj235XD46wCm7XZa7d6K2zGL0vBsk2oWXcp80zgSWIp+nSU
         UWbQ5l+Jz1FMzvMN5CJZO9ICtTkkedp9GGUVOCJUf7WsiBuKDph8M1l6er+MrIlTorF0
         ymonPOjdlagojmfmgw3KfUg24Ljnw/HdVAKOPKkz6ohr5JIf2V1+48Z7k/H3v9vVfE9D
         grXsdphK2HFquC5NvAnbuevnnfDktGjV1npHhDaxL0GmG40SjnqXl0Igv3IUu0zfrUym
         bB/A==
X-Forwarded-Encrypted: i=1; AJvYcCUzKsg88VePQbd1smEJQ1ZXx5tMzvPQaQGy97BZ8d2Sa5lI3vIgwnHr6nw6AQqcdK8h6MCMI9jxTuTABOYJ1vhcVlsItgvfUyAMNwM=
X-Gm-Message-State: AOJu0YzWXu8BaLzJqK3YS50iz9ndPICHhsnbJjWF3/NdX1K4Bt0FrIoZ
	FoA2zCmpR8FNXetu26WNxLkX/pRdxyhQdbZAKNNx2CfaTeaGEENM9lTs8BSZ4TWUBAI8XXb7T/C
	ec+G2KNWwRQpWSQkgm3W5u2HCyZyRQkWtl3vTyVtbG62BexCiQLRGMkrNV1JTk+BCALwFTZDZ3h
	lCJAcezEzfFMgguMjHLr2GQJ6V7rjrMD4neGo=
X-Received: by 2002:a50:d5cc:0:b0:570:5b72:164 with SMTP id g12-20020a50d5cc000000b005705b720164mr8847180edj.37.1713884373131;
        Tue, 23 Apr 2024 07:59:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx+SFJ52iA64fGz8cP56CJid1VLQQ91ZyiKP07BwcaJus+buR5U7snRiTmt/sE1JslZDX0L1Um1xd3XyxBORk=
X-Received: by 2002:a50:d5cc:0:b0:570:5b72:164 with SMTP id
 g12-20020a50d5cc000000b005705b720164mr8847165edj.37.1713884372794; Tue, 23
 Apr 2024 07:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240331182440.14477-1-kl@kl.wtf> <14d1b38e-0f11-4852-9c52-92b4bedb0a77@leemhuis.info>
In-Reply-To: <14d1b38e-0f11-4852-9c52-92b4bedb0a77@leemhuis.info>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 23 Apr 2024 16:59:20 +0200
Message-ID: <CAO-hwJJtK2XRHK=HGaNUFb3mQhY5XbNGeCQwuAB0nmG2bjHX-Q@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: Revert to await reset ACK before reading
 report descriptor
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Jiri Kosina <jikos@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kenny Levinsen <kl@kl.wtf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 7:11=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 31.03.24 20:24, Kenny Levinsen wrote:
> > In af93a167eda9, i2c_hid_parse was changed to continue with reading the
> > report descriptor before waiting for reset to be acknowledged.
> >
> > This has lead to two regressions:
>
> Lo! Jiri, Benjamin, quick question: is there a reason why this fix for a
> 6.8-rc1 regression after more than two and half weeks is not yet
> mainlined? Or is there some good reason why we should be should be extra
> cautious?

No special reasons I guess. Neither Jiri nor I have sent a HID update
for this rc cycle, so it's still there, waiting to be pushed.
I've been quite busy with BPF lately and dropped the ball slightly on
the HID maintainer side, but I'm sure we'll send the PR to Linus this
week or the next.

Cheers,
Benjamin


>
>
> Side note: I noticed this due to the tracking today, but I also saw a
> user that recently ran into the problem the quoted fix is supposed to
> resolve: https://social.lol/@major/112294923280815017
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
>
> > 1. We fail to handle reset acknowledgement if it happens while reading
> >    the report descriptor. The transfer sets I2C_HID_READ_PENDING, which
> >    causes the IRQ handler to return without doing anything.
> >
> >    This affects both a Wacom touchscreen and a Sensel touchpad.
> >
> > 2. On a Sensel touchpad, reading the report descriptor this quickly
> >    after reset results in all zeroes or partial zeroes.
> >
> > The issues were observed on the Lenovo Thinkpad Z16 Gen 2.
> >
> > The change in question was made based on a Microsoft article[0] stating
> > that Windows 8 *may* read the report descriptor in parallel with
> > awaiting reset acknowledgement, intended as a slight reset performance
> > optimization. Perhaps they only do this if reset is not completing
> > quickly enough for their tastes?
> >
> > As the code is not currently ready to read registers in parallel with a
> > pending reset acknowledgement, and as reading quickly breaks the report
> > descriptor on the Sensel touchpad, revert to waiting for reset
> > acknowledgement before proceeding to read the report descriptor.
> >
> > [0]: https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/plu=
g-and-play-support-and-power-management
> >
> > Fixes: af93a167eda9 ("HID: i2c-hid: Move i2c_hid_finish_hwreset() to af=
ter reading the report-descriptor")
> > Signed-off-by: Kenny Levinsen <kl@kl.wtf>
> > ---
> >  drivers/hid/i2c-hid/i2c-hid-core.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i=
2c-hid-core.c
> > index 2df1ab3c31cc..72d2bccf5621 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -735,9 +735,12 @@ static int i2c_hid_parse(struct hid_device *hid)
> >       mutex_lock(&ihid->reset_lock);
> >       do {
> >               ret =3D i2c_hid_start_hwreset(ihid);
> > -             if (ret)
> > +             if (ret =3D=3D 0)
> > +                     ret =3D i2c_hid_finish_hwreset(ihid);
> > +             else
> >                       msleep(1000);
> >       } while (tries-- > 0 && ret);
> > +     mutex_unlock(&ihid->reset_lock);
> >
> >       if (ret)
> >               goto abort_reset;
> > @@ -767,16 +770,8 @@ static int i2c_hid_parse(struct hid_device *hid)
> >               }
> >       }
> >
> > -     /*
> > -      * Windows directly reads the report-descriptor after sending res=
et
> > -      * and then waits for resets completion afterwards. Some touchpad=
s
> > -      * actually wait for the report-descriptor to be read before sign=
alling
> > -      * reset completion.
> > -      */
> > -     ret =3D i2c_hid_finish_hwreset(ihid);
> >  abort_reset:
> >       clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> > -     mutex_unlock(&ihid->reset_lock);
> >       if (ret)
> >               goto out;
> >
>


