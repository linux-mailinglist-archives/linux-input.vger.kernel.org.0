Return-Path: <linux-input+bounces-1204-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A571A82A050
	for <lists+linux-input@lfdr.de>; Wed, 10 Jan 2024 19:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548331F23463
	for <lists+linux-input@lfdr.de>; Wed, 10 Jan 2024 18:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D56E4D58E;
	Wed, 10 Jan 2024 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FMGBdkCd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24944B5A6
	for <linux-input@vger.kernel.org>; Wed, 10 Jan 2024 18:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2a1a584e8bso454726266b.1
        for <linux-input@vger.kernel.org>; Wed, 10 Jan 2024 10:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704911682; x=1705516482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+79PBe1CaM3kL/+sGAaA8TQXREzbo/JCsExVphnqkI=;
        b=FMGBdkCdEs2wMT13KMcwWPv17EpuhZNsOyUmlaiWdMqRP+uqZYWvlqyHCDEN8nn1wZ
         B5r1umd+1bw95zhaBCXgTOKZt0/p/Kr6RgRKlLc9lBYY/7YCgeKG27bpA4NNkXB/dkja
         7/i3trOn1RIsHctNEvSRQwrZiCBhn6tbOB59A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704911682; x=1705516482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+79PBe1CaM3kL/+sGAaA8TQXREzbo/JCsExVphnqkI=;
        b=tBuXDgEdvX+X4hq5refWNODm/OgzRaTOk7lKJW91aJPAqv/dsar5EWSJgdMnobPLtp
         a+8ivUxIGHT36I5bUxwoXWEtks3iBT8BVRcpm1PQ3xbnrPwC2B/23iCec4lTLCNkHJML
         HMqE3aGd2nW24UX9PYuHTvesc8sqz9u7jk6pIts1Nzz5PwSadYuM2TeV8voP47mAiMba
         Q8F7PBiRHXWPVbqlDouiKSfAIFBk8Sy59RqiPfik9StAvqEiFBu3ntmZtWSwrOvDSo6x
         TyGnULLEkk2EsQLUYNe2A/w1pLVjCi0PZQGT9v+lAoMSPZGNnLjW9x+m8lOURGRiFyE+
         rylw==
X-Gm-Message-State: AOJu0YxkMC/2Y73/yacTdkVhag2ywns5mPBpYnYva93iNcBfH6jvk/kf
	gWom0lYybnX6pHsPFE4nTUVFdWHejvurtLlvreE9pg6bE+J7GeY=
X-Google-Smtp-Source: AGHT+IFrM/yZvJP0v0P5wi1QiVjuUk0TUAkuDct456hCdKoNV1CtY+vIa5WVUBbXUS8qyFsQ0eJL1Q==
X-Received: by 2002:a17:906:1a:b0:a2b:cf2b:504e with SMTP id 26-20020a170906001a00b00a2bcf2b504emr692958eja.147.1704911682063;
        Wed, 10 Jan 2024 10:34:42 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id v6-20020a170906564600b00a2a9ddd15b8sm2359977ejr.173.2024.01.10.10.34.41
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 10:34:41 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5534180f0e9so856a12.1
        for <linux-input@vger.kernel.org>; Wed, 10 Jan 2024 10:34:41 -0800 (PST)
X-Received: by 2002:aa7:cd70:0:b0:557:1142:d5bb with SMTP id
 ca16-20020aa7cd70000000b005571142d5bbmr12737edb.4.1704911680835; Wed, 10 Jan
 2024 10:34:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240103003355.747335-1-kai.heng.feng@canonical.com>
 <CAD=FV=VmGNB5dP5WO7=txNDScNfhCDEsfFFivXqz+PH6rt=x8g@mail.gmail.com> <CAAd53p4gPkbDyNLiYGtcvqWwEgBqVhri+qgh+=Ha0xsVfYy92g@mail.gmail.com>
In-Reply-To: <CAAd53p4gPkbDyNLiYGtcvqWwEgBqVhri+qgh+=Ha0xsVfYy92g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jan 2024 10:34:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WwCL0Z4rOMGD+i2zOTZMz6qi_Ctm_wWC2sbv0STGi8AQ@mail.gmail.com>
Message-ID: <CAD=FV=WwCL0Z4rOMGD+i2zOTZMz6qi_Ctm_wWC2sbv0STGi8AQ@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Remove SET_POWER SLEEP on system suspend
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: jikos@kernel.org, benjamin.tissoires@redhat.com, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Johan Hovold <johan+linaro@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 9, 2024 at 11:31=E2=80=AFPM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> > I'd also note that I'm really not sure what ChromeOS dark resume has
> > to do with anything here. Dark resume is used for certain types of
> > events that wakeup the system where we can identify that the event
> > shouldn't turn the screen on, then we do some processing, then we go
> > back to sleep. I'm nearly certain that a trackpad / touchscreen wakeup
> > event would never qualify for "dark resume". If we see a
> > trackpad/touchscreen event then we'll wakeup the system. If the system
> > is in a state where trackpad/touchscreen events shouldn't wake us up
> > then we disable those wakeups before going to suspend...
>
> Doesn't Dark Resume use wakeup count to decide whether the system
> should wake up or go back to suspend?
> For this case the input report is empty, hence wakeup count remains
> the same after the wakeup. I assumed Dark Resume will check the wakeup
> count and decide to put the system back to suspend.

Ah, I understand now. So you're saying that the issue wouldn't be so
bad (or maybe we wouldn't notice it) on systems with dark resume.
However, even with dark resume we're not in a super great shape. Doing
a dark resume isn't exactly a lightweight operation, since it can take
a bit of time to resume the system, realize that there were no wakeup
events, and then go back to sleep. I'm not a total expert on dark
resume, but I believe that even with dark resume, there may also be
artifacts that a user might notice (like perhaps USB devices powering
up or perhaps the suspend LED on the system showing that we're not in
suspend anymore).


> > It seems to me like the board you're testing on has some strange bug
> > and that bug should be fixed, or (in the worst case) you should send a
> > patch to detect this broken touchpad and disable wakeup for it.
>
> It's desired to keep the wakeup capability, disabling wakeup isn't ideal =
here.
> I'll write a patch to use touchpad specific quirk instead of applying
> the change universally.

Thanks! I'd also be curious if this is a problem for everyone with the
Cirque touchpad or if it's board-specific. I could imagine the
behavior you describe as coming about due to a missing or
misconfigured pull resistor on the IRQ line. ...or perhaps a pull
resistor pulling up to the wrong voltage rail...

-Doug

