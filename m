Return-Path: <linux-input+bounces-9250-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF7A129DB
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 18:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4D5188938E
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 17:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFDA1CF28B;
	Wed, 15 Jan 2025 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2/Cg94D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF0B1C4A1C
	for <linux-input@vger.kernel.org>; Wed, 15 Jan 2025 17:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736962208; cv=none; b=ps2u0ehikkoUhZvGXtq5WPpREinADfpUFjebDHMX/gJkTLaOg7hUKKuNz2aBLklW6Y+Un6sbAsWRJdewnK9kvHNTsOawVTZKuu1bqySGFJhv+/Rs1y2X0N6RNpdUi8HnAbQSeZBZsusirPSYKSQfoLiF98oemktmUBU4xquc/XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736962208; c=relaxed/simple;
	bh=YrxxC26OPbHUnfGvf1N8jCffGyJncW5YUB8e3QsfJSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTpvOTzO86tuIRCQdyDzYHxjJ03E8xF15RGA1cwJNmR3TzG1BbVHebnIOt+o1UZ55jKSt/wt7veDPFemHyw9CeRlvEKteOfHV0RQHVHfZDHXZqlE/667mqc9SoWaD+fsi8FKcLiJw4ecZw6/Cw5aj0879+P0fJjB/aLUKtMnTio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2/Cg94D; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso11735057a12.0
        for <linux-input@vger.kernel.org>; Wed, 15 Jan 2025 09:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736962205; x=1737567005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrxxC26OPbHUnfGvf1N8jCffGyJncW5YUB8e3QsfJSY=;
        b=M2/Cg94DvI2FsIKuvaYaJRe1g9V6LBCQVqlHObNK9QdOygXE7Pi5MA1GBKhet3colQ
         oExczjIgI7r+b+vzCmTCySr/Yjb139M96iUg0jc9e7Rf7cW5DsfR3OEd0AhHNp/ZJGcP
         k99NNwXJ0z6AkfhierhWvkS24b3j+lpjuAaAWweVYJZdXMHJ3W6jdPsajNz3V1qVrnhp
         XWg32qc5vjwEnoZtSiBkNYx1d9qCumbQPu6R+7aP4YJlLBpWujk+d7id24+j6YrPP3vs
         P3KQe09XdoXMTtrUT2DW3Q5xOrb9Zl0eSEc7w592KNlxlgbfexoPf+SHMf7p193rk4Yz
         81mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962205; x=1737567005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrxxC26OPbHUnfGvf1N8jCffGyJncW5YUB8e3QsfJSY=;
        b=ChhSnB8+uj3QlBvmrfk6OxTxMMBc4fAh6eWRukCMaXevfuZ3ZfrWSN+X5eyU8KalN+
         UJ/3MSjEltzKeGPyEgFm5e1PCA4DLI/6pn2mRkQu5XH7e65YJ+708y/vZvSWXoD6mrqQ
         BAs72iLm4Zli95w4fdg22DL3h/9/cnSWWIksLGoAbrucYFydFP7BEyfWXq2k/AwNcWed
         vtd8QcaStTYbaiVzTyshefOWfnLy2t0h2K48rM5QkSbUV50fAb9tz8FFd9J8OGcyLq0e
         +ULY3z7Aq8AlP5dKxQHQ635H0ot+ApMedOB2xgfMcCCU9LTI4+xyO0+sSeyPzzNj/911
         XA+A==
X-Forwarded-Encrypted: i=1; AJvYcCV2LcC5Up731LGH60Ysq5oI93Hoz4FTJ4splxy3oDkYeTkP/aCMH/N0DBoUZ4gve/3lcPX4oD8wUoXf0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXHJG58qC3qxE12XJGTgK/pjSlrdLKP8JkQIvNMvhTPIykzgL
	r/sM/Qu58/vX7oej5S8IDauOLnrAsSkMFRhXNTbcSG4VX+qwQOHix/tNXP5Ui8FPuc+79EqXTVr
	9vHeOz/eEDD1S8OA2I+8P6iR59u8=
X-Gm-Gg: ASbGncuNi1+WMkA1GL5JlW8sa7KHl9iLe+iBkQj9/PfZoqNwFqyV1iLMrKoZBvpFkTO
	7AmGV5hDkNIU4nc2do8aoEGVcwqKIBidBTuSplh/f
X-Google-Smtp-Source: AGHT+IE094QoWqY9LeBDsMzSGYUiUA4bfvRJt9lEQrL4tX+twRmDKAsIh4pat4wnC5eyv2cAcWgRVDXrG25evvpzKnw=
X-Received: by 2002:a05:6402:50d0:b0:5d0:e410:468b with SMTP id
 4fb4d7f45d1cf-5d972dfb862mr25330134a12.2.1736962204572; Wed, 15 Jan 2025
 09:30:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225155507.30288-1-eugenyshcheglov@gmail.com>
 <2f88805c-7f4e-48a6-bcda-29a15879825b@endrift.com> <CALepYkLaAfRW1OvCOoj9-+xUXDtUUW6rf+tVPLjSX2o3VEOaSA@mail.gmail.com>
 <cec5ed7c-5f35-4d65-99a3-92abe63c5b24@endrift.com> <b97ec85d-75aa-4ddd-8baa-683628260863@endrift.com>
In-Reply-To: <b97ec85d-75aa-4ddd-8baa-683628260863@endrift.com>
From: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Date: Wed, 15 Jan 2025 19:29:53 +0200
X-Gm-Features: AbW1kvaEYeHRAZu0kR0kOlUnEy_kpAJcAn4IqmB9Haq74RYmaJRH532f5aZmBE0
Message-ID: <CALepYkJP3nRSQxC40VPmTUcy2d7vRo5NGAHCJCNZgTLBg_sumw@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-steam: Fix Lizard Mode disabling
To: Vicki Pfau <vi@endrift.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vicki!

> Apologies for before. The timing was very frustrating as I had intended t=
o take the week off, and it'd been a while since I'd worked on this driver,=
 but I wanted to address this immediately. I decided to look into it furthe=
r because it sounded like you did in fact find a bug.

No problem at all! I'm glad I was able to properly address this
question, and it's now in good hands, you have a better understanding
of how this driver works, and you=E2=80=99ll definitely be able to create a
better fix.

Thanks for your response!


=D0=BD=D0=B4, 5 =D1=81=D1=96=D1=87. 2025=E2=80=AF=D1=80. =D0=BE 06:32 Vicki=
 Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Eugeny,
>
> Apologies for before. The timing was very frustrating as I had intended t=
o take the week off, and it'd been a while since I'd worked on this driver,=
 but I wanted to address this immediately. I decided to look into it furthe=
r because it sounded like you did in fact find a bug.
>
> On 12/26/24 9:24 PM, Vicki Pfau wrote:
> >
> >
> > On 12/26/24 5:54 AM, Eugeny Shcheglov wrote:
> >> Hi, Vicki,
> >>
> >> First, I should explain the motivation behind this change. I'm a devel=
oper of a gaming platform based on SteamDeck. My app runs in kiosk mode, an=
d the system boots directly into the app, so I need to be able to read Game=
pad values by default.
> >>
> >> Let's ensure that we are on the same page and that I understand the dr=
iver behavior correctly.
> >>
> >> There is one hardware mode: "Gamepad" mode (probably we can call it so=
mething like a "Full" mode), where all inputs from buttons, pads, and switc=
hes are processed. "Lizard Mode" is a possibility to filter input, right? S=
o, if Lizard Mode is enabled, it gives us a
> >> possibility to change modes between Gamepad (full input) and Desktop (=
mouse/keyboard only) by pressing the "Options" button OR automatically when=
 the Steam client is opened.
> >
> > This is not at all accurate. Lizard mode is handled by firmware in the =
controller board itself and when enabled emulates a keyboard and mouse in a=
ddition to the gamepad controls. If lizard mode is disabled, then that emul=
ation is disabled. Game/desktop modes are handled exclusively in the driver=
. They do different filtering of inputs based on if the evdev node is open =
or not. I forget the exact specifics and would need to review the code. If =
you want fine control over how all of this works, you can open the hidraw m=
anually and parse it. The format is well-documented in the driver, and open=
ing the hidraw disables all of this stuff (though you will need to send the=
 heartbeat manually to keep lizard mode off--it automatically turns back on=
 if a watchdog turns off).
> >
> >>
> >>> Switching between gamepad and desktop modes is already blocked when l=
izard_mode is disabled. See line 1053 in steam_mode_switch_cb.
> >>
> >> No, it doesn't. Mode switching happens on line 1052, right before the =
"if (!lizard_mode) return" condition in the steam_mode_switch_cb.
> >
> > Oh, yes, come to think of it that should probably be on the other side =
of that early return.
>
> You were correct that this was broken. I'm working on a more minimal patc=
h to fix just this and another related issue I discovered in the process of=
 retesting this.
>
> >
> >>
> >> Logically, the "lizard_mode=3D0" option should disable the possibility=
 to filter the input. However, when I tried setting "lizard_mode=3D0" on my=
 SteamDeck, nothing changed except that the mouse was gone, along with the =
haptic pulse during mode switching. I'm still able to switch the joystick i=
nputs on and off.
> >
> > Yup, that's because lizard mode is literally just the keyboard/mouse em=
ulation. Since without that desktop mode is useless, it disables the mode c=
hanging. Or it should. It looks like that might not be handled entirely cor=
rectly, as you just said.
>
> Indeed, as you described, turning the joystick on and off even when lizar=
d mode is disabled is a bug.
>
> >
> >>
> >>> All in all, this patch doesn't actually "fix" anything.
> >>
> >> Well, in that case, what should "lizard_mode=3D0" do? As I mentioned b=
efore, on my SteamDeck, it only disables the haptic pulse and "desktop mode=
" functionality like mouse input.
> >
> > Vicki
> >
>
> After I do more testing I'll submit the new patch. It's pretty minimal, o=
nly a +3/-3 diff.
>
> Vicki
>

