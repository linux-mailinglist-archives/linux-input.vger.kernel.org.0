Return-Path: <linux-input+bounces-10074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919FA3718D
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 02:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B5317A2FB0
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 01:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6266DA2D;
	Sun, 16 Feb 2025 01:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgW311Fn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AB4C70
	for <linux-input@vger.kernel.org>; Sun, 16 Feb 2025 01:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739668152; cv=none; b=bt15P16fGk4QAAkwtSY2FMroQ3r9N5WjY3Il/AIwLIp3IAjIdSwn3HgpheWOYqclIJivlvoaT6Y4/kmWmf1oCkM9MgF/PnChgWOgz3BVAA9hREbVVCY0kG0kMxmWht3giLkvfIVTiHgp/bOzRrTnpF/TnGRBuDQDpvLrXTwOeAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739668152; c=relaxed/simple;
	bh=HcHVkLAqtjsJ/7gwMSJe6SCnYdWmFQ6PkDMXvaWKywk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAwpfkbJ2kwFqjhVW9/HuMBypYVgShYul11OecT5fiK449q90IumjUoQ6qqAvnmUzQc5LkJQ28RFp7dXJJhG28H+LOlStn2tllnbRQZG2netqQMhgyc2t7Nzn9E2OwhFrzawgHqKB/x1rUXn14A9PtBfujS7yY1HC++eyKbDqS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgW311Fn; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e46ebe19368so2468712276.0
        for <linux-input@vger.kernel.org>; Sat, 15 Feb 2025 17:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739668149; x=1740272949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcHVkLAqtjsJ/7gwMSJe6SCnYdWmFQ6PkDMXvaWKywk=;
        b=bgW311Fnc5SudviYl5N3FF1PqbaasfkoHFJfj319E5aZKpmyVh94zVFun+od9DOw3m
         1uidcUrfKqSdupB+AJPWE9lX4S2vPzGSKIJR9JgGykH/tPgSqE1uUQ3VlXaMaBgn1PjP
         7vKCbt5phu3gG/8NWdWUi1Z330K8rPQVw0CvwQ3f35aTww+CSOXIxvNeqGTZZ+mGvyNf
         wChBvLfPwtlQCeE07xT7Q1uKUdaR8I0FmUO/dVj/Zm0H61kVOFAPzkXMIF45J6838TX0
         JRFeTHZXtZ+mp/9f2GRLk45YQVESpxtNwRvPkOwGhzIuQCxhy1Hruk1Ss24EYWPg0uPc
         6VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739668149; x=1740272949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcHVkLAqtjsJ/7gwMSJe6SCnYdWmFQ6PkDMXvaWKywk=;
        b=pLlkJVtb090ghg8qkYL5O0/tQSxOgi8IoJzmxMbiaNRcDBgQb2efzJqUB8s3PGtW3M
         S04iuu5XUVtIC6Zsb4AkY/JrZe91bV+3FeVA34SjmEDccx+xJFNAry4V+axVeqT+eMIi
         LuXk9qHhR1rb+Bg2FfIsg3zrlYq3Jdg+ZnhY0ibETxt2kq+2h9m3wEPCOvmwAfw5u8Wa
         Jxbfn86jwxSQ4gQLMM8QLOtVxYHv1CBQZ2CBPh2vzGtq7JyuV4FuX5adqwuh346tArE5
         aWQe49lpdJQmga7MRAbvA1yHQqeRN1MnxAeol50bCkqN8oyf0f231oi/P95x/aPkxibX
         bwDg==
X-Gm-Message-State: AOJu0YyA6ciZnqdJuawMVohUExq7jDInmL6erQWHLPiQyXtTfKZoeUZp
	an/C5oexgPU2RM4OWhEY4FKlNTABuYcl7ml/PhVi0GU9NyKh2z4lWeQsoy1WczkoIs5vw+mb9he
	pISeS1Xb7XOv7bb4MWmaTrBbTTLM=
X-Gm-Gg: ASbGncsExPfU5h7t/50OiYS3NX+jx51LB4agLJGXoYY9QiCP5ZkegagyqgWol9T7Ttc
	OyPw5uXEM6IHCBnB74CDVAo8rc7xHs5CEdeLPNq7Ym487SWKgBIHnUkXP4G6pijDO2kY/rSSM1Q
	UTZxrF0yDSEAn6sKRR2pkCVoBw1tT+HqE=
X-Google-Smtp-Source: AGHT+IHPPJajh5/GQSy57HwCa7+f8JJnTmmZWtjETIoZ4Z2shtGXIl9eqNpFXDSwE7uURGIRqBaWqB8v+qOS7fO12j0=
X-Received: by 2002:a05:6902:845:b0:e59:dbac:d993 with SMTP id
 3f1490d57ef6-e5dc9043ed6mr3687030276.17.1739668149084; Sat, 15 Feb 2025
 17:09:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com> <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com>
In-Reply-To: <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sat, 15 Feb 2025 18:08:32 -0700
X-Gm-Features: AWEUYZnPEWMKnGWw1kzvVmR0zAjEB5ZIoTnE4F7Qyp5WmO_NYlkVb7z31ren8kM
Message-ID: <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "jkosina@suse.cz" <jkosina@suse.cz>, 
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 10:44=E2=80=AFAM Aditya Garg <gargaditya08@live.com=
> wrote:

> > On 12 Feb 2025, at 11:06=E2=80=AFPM, Aditya Garg <gargaditya08@live.com=
> wrote:

> >> On 17 Jan 2025, at 11:42=E2=80=AFAM, Alex Henrie <alexhenrie24@gmail.c=
om> wrote:
> >>
> >> The Omoton KB066 is an Apple A1255 keyboard clone (HID product code
> >> 05ac:022c). On both keyboards, the F6 key becomes Num Lock when the Fn
> >> key is held. But unlike its Apple exemplar, when the Omoton's F6 key i=
s
> >> pressed without Fn, it sends the usage code 0xC0301 from the reserved
> >> section of the consumer page instead of the standard F6 usage code
> >> 0x7003F from the keyboard page. The nonstandard code is translated to
> >> KEY_UNKNOWN and becomes useless on Linux. The Omoton KB066 is a pretty
> >> popular keyboard, judging from its 29,058 reviews on Amazon at time of
> >> writing, so let's account for its quirk to make it more usable.
> >>
> >> By the way, it would be nice if we could automatically set fnmode to 0
> >> for Omoton keyboards because they handle the Fn key internally and the
> >> kernel's Fn key handling creates undesirable side effects such as maki=
ng
> >> F1 and F2 always Brightness Up and Brightness Down in fnmode=3D1 (the
> >> default) or always F1 and F2 in fnmode=3D2. Unfortunately I don't thin=
k
> >> there's a way to identify Bluetooth keyboards more specifically than t=
he
> >> HID product code which is obviously inaccurate. Users of Omoton
> >> keyboards will just have to set fnmode to 0 manually to get full Fn ke=
y
> >> functionality.
> >
> > Regarding the the fnmode=3D0 thing, could you test this patch:
> >
> > -->8=E2=80=94
> > From e2b2ef3f579800f11ee293fb45838a4004ccaf23 Mon Sep 17 00:00:00 2001
> > From: Aditya Garg <gargaditya08@live.com>
> > Date: Wed, 12 Feb 2025 22:57:58 +0530
> > Subject: [PATCH] HID: apple: Add quirk to disable fn key on some non-ap=
ple
> > keyboards
> >
> > ---
> > drivers/hid/hid-apple.c | 54 +++++++++++++++++++++++++++++------------
> > 1 file changed, 39 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > index 49812a76b..9d4cbe636 100644
> > --- a/drivers/hid/hid-apple.c
> > +++ b/drivers/hid/hid-apple.c
> > @@ -42,6 +42,7 @@
> > #define APPLE_BACKLIGHT_CTL BIT(10)
> > #define APPLE_IS_NON_APPLE BIT(11)
> > #define APPLE_MAGIC_BACKLIGHT BIT(12)
> > +#define APPLE_DISABLE_FN BIT(13)
> >
> > #define APPLE_FLAG_FKEY 0x01
> >
> > @@ -89,6 +90,19 @@ struct apple_sc_backlight {
> > struct hid_device *hdev;
> > };
> >
> > +struct apple_backlight_config_report {
> > + u8 report_id;
> > + u8 version;
> > + u16 backlight_off, backlight_on_min, backlight_on_max;
> > +};
> > +
> > +struct apple_backlight_set_report {
> > + u8 report_id;
> > + u8 version;
> > + u16 backlight;
> > + u16 rate;
> > +};
> > +
> > struct apple_magic_backlight {
> > struct led_classdev cdev;
> > struct hid_report *brightness;
> > @@ -152,20 +166,6 @@ static const struct apple_key_translation magic_ke=
yboard_2015_fn_keys[] =3D {
> > { }
> > };
> >
> > -struct apple_backlight_config_report {
> > - u8 report_id;
> > - u8 version;
> > - u16 backlight_off, backlight_on_min, backlight_on_max;
> > -};
> > -
> > -struct apple_backlight_set_report {
> > - u8 report_id;
> > - u8 version;
> > - u16 backlight;
> > - u16 rate;
> > -};
> > -
> > -
> > static const struct apple_key_translation apple2021_fn_keys[] =3D {
> > { KEY_BACKSPACE, KEY_DELETE },
> > { KEY_ENTER, KEY_INSERT },
> > @@ -364,6 +364,10 @@ static const struct apple_non_apple_keyboard non_a=
pple_keyboards[] =3D {
> > { "WKB603" },
> > };
> >
> > +static const struct apple_non_apple_keyboard non_apple_keyboards_disab=
le_fn[] =3D {
> > + { "Omoton" },
>
> You could try replacing Omoton with OMOTON as well here if it does not wo=
rk. Alternatively, you could try logging hdev->name for this device and put=
 it in this table to get the correct name.

On the Omoton KB066, hdev->name is "Bluetooth Keyboard". I think I saw
that name in Blueman and assumed that it was just a default for when a
keyboard has no name, but you're right, that string must be coming
from the keyboard itself. After changing "Omoton" to "Bluetooth
Keyboard" in non_apple_keyboards_disable_fn, your patch works!

Unfortunately, this keyboard is even more messed up than I realized.
It is indeed sending different key codes depending on whether or not
the Fn key is held. For example, F11 and F12 are Volume Down and
Volume Up by default, but ordinary F11 and F12 when Fn is held.
However, I was wrong about F1 and F2: With or without Fn, the Omoton
_never_ changes F1 to Brightness Down or F2 to Brightness Up. I
managed to pick the one bad example: All of the other special keys
(Esc, F3 through F12, and Del) are translated internally, but not F1
or F2. That also means that I was wrong about the Fn key not doing
anything in fnmode=3D2. When Fn is held, all of the special keys do
become ordinary keys in both fnmode=3D0 and fnmode=3D2, except for F1 and
F2 which remain ordinary F1 and F2.

When connected to macOS, the results are similar: All of the special
keys are special keys regardless of whether Fn is held, except F1 and
F2, which by default are always translated to Brightness Down and
Brightness Up like in Linux's fnmode=3D1. If the setting "Use F1, F2,
etc. keys as standard function keys" is enabled in the system keyboard
settings, all of the special keys change to ordinary keys when Fn is
held, except for F1 and F2 which remain F1 and F2, just like in
Linux's fnmode=3D0 and fnmode=3D2.

It seems to me that the best way to support the Omoton KB066 would be
to give it its own key translation table that has F1 and F2 and
nothing else. But on the bright side, pun humorously intended, we
wouldn't have to change the default fnmode. Just like on macOS, F1 and
F2 would always be Brightness Down and Brightness Up, unless key
translation is disabled. But unlike macOS (and the current state of
Linux), we wouldn't undo the keyboard's own Fn key handling for the
special keys that it translates internally.

Circling back to the original problem of distinguishing between the
Apple A1255 and the Omoton KB066, changing an Apple keyboard's name in
the macOS keyboard settings also changes the name that it reports to
Linux. Because "Bluetooth Keyboard" is so generic that someone might
actually give their keyboard that name intentionally, if we add
special behavior to look for that name, I think we should restrict it
to PID 022c. For example, we could add the new quirk flag to
USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI in the apple_devices table and
then clear the flag if the keyboard's name is not "Bluetooth
Keyboard".

Thanks for the help!

-Alex

