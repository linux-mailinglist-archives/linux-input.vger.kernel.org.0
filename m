Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A151AFD2D
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 20:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgDSSXB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 14:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgDSSXA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 14:23:00 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9775C061A0C
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 11:23:00 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id a6so2770425uao.2
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
         :content-transfer-encoding;
        bh=OkSXlLd1OI6YTd2bVj1Y/vakCv0k00Q6ubPQGf9tb58=;
        b=Afs/bhMEDq2p1dCZuoTJywON2+IgPM8lLUhQ9O0GtNPjL0aIWgaI5nzl7Ukcrlbwrt
         F0uRHV3C8VvOViv3vFJV/yd9EuepaKKEA+Nl4fPLLJxobSZFPSjvWg5uceQDZlus1/dV
         KxQi8p7LBLMA4exdiEosaT1uuuPCwnJ7gB0bIsARwJDFptIPXTPEyLoUCHW21hja2pA/
         lz7o/HRAQRJtMH1QW9ZYe/UJkC0uYonnOL/rrDqHSHphKHp5k4DuaztWRJ465OiLtrhB
         LIvJYJXB4Clbe/dIg9Lh+Lsc8EwEHo09YRpuG+j3Lw+duGVleSvE3sPS9pJe+sqamBM6
         qlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc:content-transfer-encoding;
        bh=OkSXlLd1OI6YTd2bVj1Y/vakCv0k00Q6ubPQGf9tb58=;
        b=XlegEozGHaL3bYbTl8wMf7hISVHo8UaXAHCWVMLGaiGxQeh7+tZ0Mboe1W+HwDp4EM
         ddkvF5LN675pOQl69SXq/rYG+L45Jhl5cistAUBp1BMI2Tssk2pBzA9NWuSlaGB2EOyQ
         LNtiSCCIVscuw+O3L/7gxyh2BCjJce+y59r1p+c7tHudFyEkYWqc8Qay/8SNV6dViJ8A
         xK/MBhRHne+8bi3K60zJMwBxN+uwvwXrxpZjrrCzp4y4RtyvljLazMqqIebd5i0VwNjr
         j9AHI9LqnevsZ/Tbo4ip+QVE4YWEWZxO8ygML/M+xc+ABN/R/E0oyV0fE05y/0EjG/SF
         sJcg==
X-Gm-Message-State: AGi0Pubz8jp2GrytOC6mQ9oM+652MUxbrDlA8qpRm2DxlhVc+NsDJT8y
        Sbbj6c676Mvb2DqaqTgbuemoI6sUhBIvgJBvt8s=
X-Received: by 2002:ab0:375a:: with SMTP id i26mt6009963uat.120.1587320579776;
 Sun, 19 Apr 2020 11:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200419041651.GD166864@dtor-ws> <20200419074624.9955-1-priv.luk@gmail.com>
 <20200419180136.GK166864@dtor-ws> <CAJmEJMzzFO1G=iQy=EfwQ89iWMjpcpupBjBkG29aigqYsc36bA@mail.gmail.com>
In-Reply-To: <CAJmEJMzzFO1G=iQy=EfwQ89iWMjpcpupBjBkG29aigqYsc36bA@mail.gmail.com>
From:   LuK1337 <priv.luk@gmail.com>
Date:   Sun, 19 Apr 2020 20:22:48 +0200
Message-ID: <CAJmEJMxDsPmOpYHYYzUXYxknFe6Uwo6OuF+=Q3bzUmqxK3Psag@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - Update xboxone fw2015 init packet
Cc:     LuK1337 <priv.luk@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I had this issue with official Microsoft Xbox One S Controler (model: 1708)=
;
It might also be firmware version related as I recently updated my firmware
to the latest one but I'm not sure about that.

(also sorry for duplicate msgs that you might have received from me;
I'm new to lkml)
On Sun, Apr 19, 2020 at 8:14 PM LuK1337 <priv.luk@gmail.com> wrote:
>
> I had this issue with official Microsoft Xbox One S Controler (model: 170=
8);
> It might also be firmware version related as I recently updated my firmwa=
re
> to the latest one but I'm not sure about that.
>
> On Sun, Apr 19, 2020 at 8:01 PM Dmitry Torokhov <dmitry.torokhov@gmail.co=
m> wrote:
>>
>> On Sun, Apr 19, 2020 at 09:46:23AM +0200, LuK1337 wrote:
>> > From: =C5=81ukasz Patron <priv.luk@gmail.com>
>> >
>> > Appending { 0x05, 0x20, 0x02, 0x0f, 0x06 } to
>> > xboxone_fw2015_init fixes an issue where the
>> > controller is somewhat stuck in bluetooth
>> > mode until you plug it into Windows PC.
>> >
>> > Signed-off-by: =C5=81ukasz Patron <priv.luk@gmail.com>
>>
>> Thank you =C5=81ukasz. Could you please tell me what device(s) have you
>> observed the issue with? I am a bit worried if this may interfere with
>> other devices that currently work fine with the driver. Cameron, Mark,
>> do you have any concerns here?
>>
>> > ---
>> >  drivers/input/joystick/xpad.c | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xp=
ad.c
>> > index 6b40a1c68f9f..894fa81f717a 100644
>> > --- a/drivers/input/joystick/xpad.c
>> > +++ b/drivers/input/joystick/xpad.c
>> > @@ -455,7 +455,8 @@ struct xboxone_init_packet {
>> >   * or later firmware installed (or present from the factory).
>> >   */
>> >  static const u8 xboxone_fw2015_init[] =3D {
>> > -     0x05, 0x20, 0x00, 0x01, 0x00
>> > +     0x05, 0x20, 0x00, 0x01, 0x00,
>> > +     0x05, 0x20, 0x02, 0x0f, 0x06
>> >  };
>> >
>> >  /*
>> > --
>> > 2.26.0
>> >
>>
>> Thanks.
>>
>> --
>> Dmitry
