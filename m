Return-Path: <linux-input+bounces-5631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357595600C
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 01:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F10FFB20ADC
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 23:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D96C154454;
	Sun, 18 Aug 2024 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/NLNcE4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D778443AA9;
	Sun, 18 Aug 2024 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724023041; cv=none; b=DLBbgU4mEexxkPvofZl/I9bna4qYeEN4dsZAUETLnYIE6rZ6oWRp8BeoMlZugP3YrbQVQtnug+CmUMdINGzqU0QcYEjxXkXSwDNaEI5D3vAjA70sXKcDPfnFyfBAB+NdCcBEJbStgwkjXgTNIAzvR3i3OdbHBUYq7TGv9/kfgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724023041; c=relaxed/simple;
	bh=mjzCCkkb4ZbTcGqwXgP3YjGJHkuaJAiVlLqdbaVyKDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyT8mkHYBdWqtUEveLZtt1mkazz9l2SRjnmf8jrBX5oNZCC4sTOoCbCDMFSUQ/5mrKDBzMcAd71LoJNN86ZOJUCv/r7ufk9xPCNxIlLoemTWc5/aMQeCsXLRUnqFj7SmY2mOvqxwW2WzCfTalylyoB9s1ZM9eLGHWcsylj0DKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/NLNcE4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428141be2ddso28519895e9.2;
        Sun, 18 Aug 2024 16:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724023038; x=1724627838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjzCCkkb4ZbTcGqwXgP3YjGJHkuaJAiVlLqdbaVyKDc=;
        b=N/NLNcE4L99kRpQFIgZU04oPx7036Nlmll/jVdRQYVIELhYVu/h+kct+MoZ5KfJcJK
         hadgn1YUKiP7Wl/V9mufy6v1pyRU44bsh6rwACoVY3KABEttrHK942/QNwihe+3L/fIg
         fTkHg/TecrqSfHqN37b4hEZ/Wbt/AQDnVRgJe92Jbdoh1szleMSVo3HYfPBZnJa+yusW
         upXueAipMdoweMPmtpGx8Rx4fqCQGLAyQ1u2c40kv/2YvyaEzzzaN3dv7zToQ870y+ic
         08im5RTaMZn/kOsyZiOG9K02yr43ln3dne5uZZKsCAzTSLtCMWeOVDmt6COeOgxCeXwF
         bxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724023038; x=1724627838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjzCCkkb4ZbTcGqwXgP3YjGJHkuaJAiVlLqdbaVyKDc=;
        b=IAR8Dgz8JSbmweMoHHZk+U1102ECc8reY8qEKNit12nMS565PINeyxxKUZpGXnRRj6
         8o9xQuR+HLtAbFA183Qr6fbqrhqQ4mNKljm1o20O1C+NGVySc2cMG7cinbDIlzQPgcNa
         trOEwdKXZMk9WBKuAOvi2SLId3S84vBNEM0CNmw7AFDeIaaTG4MAbolLSLnJLLGe19Xm
         3wBaoh7EuZjb6VhJi7HbUwqQKfiCa6T/jUY83FQeJWV2AdsfUiOGSGgX2cFl7IMUD+Az
         a0ENCyViRfb+cBgdZUrM6ghymhWKNL22O0DE/GfpTIcZXHBrKAliBprC99BCqQR/t0Ew
         NDUg==
X-Forwarded-Encrypted: i=1; AJvYcCUy6Dkk5WFH3qaYffvbn4wlGUSfi1yN55tWPghiupXCr3tBaTZjqziOAI9fyvKG4a2x1qlA8K9eudLlw+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMU+e06Vqae+6DgyIcyMlP9caLUiSokZ2MitJ7/eRSIn/YYdP
	iUAGlY26yv5x+BQOsVNUBA/VIgdVQLwH3lWycyylD+CXyjsWnTrmbnF5M8X0Lorh8q0Wioi6fZc
	F0sQX2Ucnpa1Q/26eRuNnWpNK1eY=
X-Google-Smtp-Source: AGHT+IHxy2T6UXAIaEhVrq0qGQdA+4TZ7OKvTtoKVdPKod9Ha1x5vNYL7if0QlAQp7T8bwTr+/wSdP7Gcge59JT5ckA=
X-Received: by 2002:a5d:58fa:0:b0:368:3717:10c7 with SMTP id
 ffacd0b85a97d-3719431e872mr5310398f8f.4.1724023037477; Sun, 18 Aug 2024
 16:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com> <aa331200-205e-4b00-ae02-343c96c52ae8@web.de>
In-Reply-To: <aa331200-205e-4b00-ae02-343c96c52ae8@web.de>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Mon, 19 Aug 2024 00:17:06 +0100
Message-ID: <CALTg27kAMd-0tQdJ+k4Ur9i=kZ0qY_vffhm3ZT+_CX6tD_874Q@mail.gmail.com>
Subject: Re: [PATCH] HID: corsair-void: Add Corsair Void headset family driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> How do you think about to distinguish properties any further for availabl=
e
> device attributes?
> https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/driver-ap=
i/driver-model/device.rst#L38

Sorry I'm not sure I follow you're saying

> * Are these really changeable?

The receiver firmware version wouldn't change during the device's
lifetime unless someone wrote a firmware updater for Linux, even then
it would probably reconnect
The headset firmware version could theoretically change if you changed
which headset is paired, but I don't have 2 headsets of the same model
to test this

> * Can the macro =E2=80=9CDEVICE_ATTR_RO=E2=80=9D be applied?

Done, also applied DEVICE_ATTR_WO

> > +MODULE_AUTHOR("Stuart Hayhurst");
> Would you like to add an email address here?

Done. Thanks again for the review, I'll submit a v2 with the changes so far=
.

Stuart

On Sun, Aug 18, 2024 at 2:12=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> How do you think about to distinguish properties any further for availabl=
e
> device attributes?
> https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/driver-ap=
i/driver-model/device.rst#L38
>
>
> =E2=80=A6
> > +++ b/drivers/hid/hid-corsair-void.c
> > @@ -0,0 +1,851 @@
> =E2=80=A6
> > +static DEVICE_ATTR(fw_version_receiver, 0444, corsair_void_report_firm=
ware, NULL);
> > +static DEVICE_ATTR(fw_version_headset, 0444, corsair_void_report_firmw=
are, NULL);
>
> * Are these really changeable?
>
> * Can the macro =E2=80=9CDEVICE_ATTR_RO=E2=80=9D be applied?
>
>
> =E2=80=A6
> > +MODULE_AUTHOR("Stuart Hayhurst");
>
> Would you like to add an email address here?
>
> Regards,
> Markus

