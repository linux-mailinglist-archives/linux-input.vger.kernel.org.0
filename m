Return-Path: <linux-input+bounces-14085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6CB2A0BD
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 13:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9F7F7B6938
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 11:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F37319873;
	Mon, 18 Aug 2025 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WZjUANlw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17850319859
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755517765; cv=none; b=bxNcWZhK+m483s1lTqoU2AXRTd8TMPGwgKC3UsPqyDsmJTq33hk9NIaADIM2SW4SJ1d2jaWa4vdas80clcOMt+wYnY8/flNzQdqXZ6SQe87eA6bDn9UOuE/y3cK4IoVKQrDu1LsNL0G1vRfYyPIU9WojkZxJdvhktMplQdAe6kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755517765; c=relaxed/simple;
	bh=ARlBAewBfRE20/WNbTrbbb2F9IZHX0eKedq8fKbjWwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3ex6irRIGT9AzANXO+cCL2JbOttz91YFKkXtk3jTRrsPns8Fd0pjJp9L7BiWxuZ36GwmxXM35Xn7gQV/VD0WVZny+prH5k5bi2yZmntcTPofa3gwkpsXOOYF6HmehkkFtVj+TN1FsgJrIG61mHf4r38ceyc3xEskuvMYCIVJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WZjUANlw; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-74381dddc44so1928415a34.0
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755517763; x=1756122563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBkXPQV0cttwpZ/Oqv6+Tt8UJNgRpyr0OqG6N5z1tUw=;
        b=WZjUANlw7SBJXENZYAVhn0jwTegUOiqGIn1VPBFIiNmgAw00mbNgwYrNosG6CICHW8
         YDL6szMiPPGsEi0QJRJjyMuXv+NehN1gf79Gq4WkqJoHJjWhS8MZAtzEPM5rnxSuWyN3
         +MG5A/ouxRn8sFWUdGAn3EPGFt8b8OwGgrn+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755517763; x=1756122563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBkXPQV0cttwpZ/Oqv6+Tt8UJNgRpyr0OqG6N5z1tUw=;
        b=IAYy82ZG8JndSqcxlKNcsM/KpwiVSlwt6XfNN9Fco82h9yUMoQx7OKdVsGeAWcKSUk
         5eIhVijGKLTEUqlRZu7DXYNI28gyVkrZGww8XAJuod47qVi/iOVyBeQy5z1CY9OrYnz/
         Pctc4e4IuDNrG1diqLfirwY3TyLUs5R+l5wpXBHpyA3B5CdRf666B36eMpg7PP+QhCDa
         7jMki/p86dyLgBu0OIlEbmKfHVhhPiT55AjUuL+sybhLCXFbr5MIyqu56qavzv0I0uq0
         aTda/WbJ7OVyeeEs7ZjQjVPjGkUSw6H6AkTgH5Z6xe5uc+/Rz5RXjFbh6xUqix/02fJT
         +N1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkcivXdX8iFLpeRg6vJwrMyh42DGow3O9VTP/okK6+gds+4V5G5MZimr6BDTZq66SINIG0InYFfa0Ynw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzFMZ935jyhobM6/Yb3CZDhgnkig5uDuLHWLpyofaB5DzeJmrZ
	Fp6izqpglFzEZ2B8cncX1Kdo+ykxRkS4ylVq6NOMcp3MDCC7zyBisLI9VWKgeTM19bPA+0Wpd4G
	zee1zFsBVClUbZWxmtsy878Vpq3tvBaIAb72upNoB
X-Gm-Gg: ASbGnctTUNXqtsaXSEtkoXKCNR9NfzrFZX4jlx+VK64/7kYIJWivC8guYPDac2YpuSF
	mmZETFl+6KhpUpm9ibnlMx1dv8OgXTBWS+HG8QGXFs+hQOrmjerOLPsNiic25Wyw3weEfmyWm/z
	9bNDyJ+CmtDw+8D8eIcW8aBH0S1t1Bss1XaQgnsqu3pFGAa0AgFBQO2wqAAzFru+5p5FRbBb7UC
	7lk7C9F8bjvwXBTT3j9W80S0/DdBNkmFHI=
X-Google-Smtp-Source: AGHT+IGOrevAZMdMR35TQYz9V0RYWV6O5lZuferONAOF8A4s0GktGz1sklzFdvoHdRv/jUxqbIMnIRsYVj7HAlGNmY4=
X-Received: by 2002:a05:6830:1d4:b0:742:bcc6:b9 with SMTP id
 46e09a7af769-74392435e1cmr6007985a34.15.1755517763065; Mon, 18 Aug 2025
 04:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813125132.1319482-1-treapking@chromium.org>
 <20250813125132.1319482-2-treapking@chromium.org> <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
In-Reply-To: <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 18 Aug 2025 19:49:12 +0800
X-Gm-Features: Ac12FXz0AOcX5exZjSyNkDlB3GDDZeIXt2uYcE6IJQgNmruLiB9UCQ3nqe8R-4Y
Message-ID: <CAEXTbpcTJVCqR-NAfddd2H9oLUitcUi3XnX1GQf7hA06-Vx9UQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Fri, Aug 15, 2025 at 8:27=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Aug 13, 2025 at 5:51=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Introduce a new HID quirk to indicate that this device has to be enable=
d
> > after the panel's backlight is enabled, and update the driver data for
> > the elan devices to enable this quirk. This cannot be a I2C HID quirk
> > because the kernel needs to acknowledge this before powering up the
> > device and read the VID/PID. When this quirk is enabled, register
> > .panel_enabled()/.panel_disabling() instead for the panel follower.
> >
> > Also rename the *panel_prepare* functions into *panel_follower* because
> > they could be called in other situations now.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v2:
> > - Rename *panel_prepare* functions to *panel_follower*
> > - Replace after_panel_enabled flag with enabled/disabling callbacks
> >
> >  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
> >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
> >  include/linux/hid.h                   |  2 ++
> >  3 files changed, 40 insertions(+), 19 deletions(-)
>
> This seems reasonable to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Given that this affects devices that we already had support for
> (you're changing the behavior of two touchscreens), should it have a
> Fixes tag?

I'll add Fixes tags in the next version.
>
> We'll also need to figure out a process for landing the two patches. I
> can easily land the first one in drm-misc-next, but then it'll be a
> while before the i2c-hid one can land. Is it OK to wait?

I'm okay with waiting for the next release for i2c-hid patch to land.
Or should will ask the HID maintainers to ack this patch?
>
>
> -Doug

Regards,
Pin-yen

