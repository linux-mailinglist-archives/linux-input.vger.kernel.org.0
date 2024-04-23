Return-Path: <linux-input+bounces-3207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E52CA8AF813
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 22:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AF8D1F23BE9
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 20:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8212BD0F;
	Tue, 23 Apr 2024 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GGcpfzFY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4E142E60
	for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713904652; cv=none; b=WTVoreOYCNCQT4bFh4qoE7mTi63L7ZOcwhFSX1Ka6m2hzmNePJlkoS8gpzfp1r+y4aNOsBTYvp2HubYcT8riWqYnb2ygwTydcDg9dXGXVKBmOYSFbkTY0W4AFaqXisP8R+VfXP3tOEAJ8bCfK8vCetJt6yJ1wBZGgXSzetrRL/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713904652; c=relaxed/simple;
	bh=rfhmOs1XODOFJs1l4DWhrD2bkxios+soWFbzgeUP8Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUgVpk0qLzG3mcsfFefkgMm8ycWL40pOZQpgNG7OlSAPASoUtMJaAjaurnicpTqmgSv4xJ4HVUU3/34soD5FRnUhoro85dhYfbO33Hkr3zf9G+WFNChX1LrAQxdIWALuT/3T+L8i1dwm4YWzlU8AbO7cGPGBRFH2Sbpeh5lXctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GGcpfzFY; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-434c3d21450so31354451cf.0
        for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713904648; x=1714509448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8Z4Xephtak0B6Z0C10bXQoxaaScZEGJ8HuSBBJAqAk=;
        b=GGcpfzFYUJLBQnGwSWyhreb9yGqz7lbtwpIgktXrvLVkfuvg7TR1hSgevNYM5o8fSw
         0hWI/PJImoPnWf2/NEzwsFT0YHTJiRw/BFgL2TB/VOCic+WezZ9A3mrJCzMSUH3jkSOo
         PbeqMME/OMN0P1zVcHGsRElSpFyiIuJj75cIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713904648; x=1714509448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8Z4Xephtak0B6Z0C10bXQoxaaScZEGJ8HuSBBJAqAk=;
        b=cARHwLqMD+i0uYGZfh4Nv6LTcPYni7gfOs4SAV7sZASg3FMuNVEpaeLUgGoYZPFby5
         tWhPzv9GfV0qXbEp/Jiisc3FeEbINlwWBHatbRHU1kiKCynms8H+QpQXGP3uWRZQiqp4
         nPIBEkjCsdtlaOuwRUZoYohJIb13aBXFnDOZgIWQ/fQSg6ofH8AxuTDOhb8k0+l6v22J
         sxF370C/Nlz6xhtsBQQ/dfjNQjPfZGF93s9v8Nqm5R/KfWv1CpfOEsOvMXDfStLrIdNn
         UFgRQL7UUT3ne3vo23f/rwiMwRWHaNkzq2NY8GndqjkXISoDsakpZd0QlOzRNUARri5d
         lDpw==
X-Forwarded-Encrypted: i=1; AJvYcCV8kWxk+y0waNqJzRB4fgXNJNLX2qtERiOkRcgBuYLlKaDSrV4QAg5d8/zcsDDdapVz+++DpY/bJMdBT15zpAjVzO55m+EAU8776sw=
X-Gm-Message-State: AOJu0YzcrGwu93nhIpE8Ce567lHLD59bnNaEhyPMLixV9qSCA2WfMAEg
	U4ooMkpBHPLP81oYpLxQvXLJuyf8BDo4SRkjtq4c6YHIIUHu6SOvTaipk0OI//YUOAergtnE6Vg
	slu+e
X-Google-Smtp-Source: AGHT+IGG4bybNkS8k+9McfHgfSpd95T3LgFnxaPUfOzHu6MIOVFYMU326h7+D873NkBw/G9KYu43kg==
X-Received: by 2002:ac8:7f81:0:b0:437:bef3:aca8 with SMTP id z1-20020ac87f81000000b00437bef3aca8mr746524qtj.13.1713904648191;
        Tue, 23 Apr 2024 13:37:28 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id jt56-20020a05622aa03800b00434ec509ce9sm5505980qtb.46.2024.04.23.13.37.27
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 13:37:27 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-439b1c72676so30781cf.1
        for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 13:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwsn0jb/cRijaHhBzVQUVE89sur4eMM9BAS4CttY87DmJANtIAv7ZZJ5kFWiaX61IMaxVmcWWh0KzqxcCpOPFCvzU+wEMX6bl7iF0=
X-Received: by 2002:ac8:48c5:0:b0:439:9aa4:41ed with SMTP id
 l5-20020ac848c5000000b004399aa441edmr71354qtr.16.1713904646630; Tue, 23 Apr
 2024 13:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423134611.31979-1-johan+linaro@kernel.org> <20240423134611.31979-5-johan+linaro@kernel.org>
In-Reply-To: <20240423134611.31979-5-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Apr 2024 13:37:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XP8aCjwE3LfgMy4oBL4xftFg5NkgUFso__54zNp_ZWiA@mail.gmail.com>
Message-ID: <CAD=FV=XP8aCjwE3LfgMy4oBL4xftFg5NkgUFso__54zNp_ZWiA@mail.gmail.com>
Subject: Re: [PATCH 4/6] HID: i2c-hid: elan: fix reset suspend current leakage
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 23, 2024 at 6:46=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> @@ -87,12 +104,14 @@ static int i2c_hid_of_elan_probe(struct i2c_client *=
client)
>         ihid_elan->ops.power_up =3D elan_i2c_hid_power_up;
>         ihid_elan->ops.power_down =3D elan_i2c_hid_power_down;
>
> -       /* Start out with reset asserted */
> -       ihid_elan->reset_gpio =3D
> -               devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_=
HIGH);
> +       ihid_elan->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "=
reset",
> +                                                       GPIOD_ASIS);

I'm not a huge fan of this part of the change. It feels like the GPIO
state should be initialized by the probe function. Right before we
call i2c_hid_core_probe() we should be in the state of "powered off"
and the reset line should be in a consistent state. If
"no_reset_on_power_off" then it should be de-asserted. Else it should
be asserted.

I think GPIOD_ASIS doesn't actually do anything useful for you, right?
i2c_hid_core_probe() will power on and the first thing that'll happen
there is that the reset line will be unconditionally asserted.

Having this as "GPIOD_ASIS" makes it feel like the kernel is somehow
able to maintain continuity of this GPIO line from the BIOS state to
the kernel, but I don't think it can. I've looked at the "GPIOD_ASIS"
property before because I've always wanted the ability to have GPIOs
that could more seamlessly transition their firmware state to their
kernel state. I don't think the API actually allows it. The fact that
GPIO regulators don't support this seamless transition (even though it
would be an obvious feature to add) supports my theory that the API
doesn't currently allow it. It may be possible to make something work
on some implementations but I think it's not guaranteed.

Specifically, the docs say:

* GPIOD_ASIS or 0 to not initialize the GPIO at all. The direction must be =
set
  later with one of the dedicated functions.

So that means that you can't read the pin without making it an input
(which might change the state if it was previously driving a value)
and you can't write the pin without making it an output and choosing a
value to set it to. Basically grabbing a pin with "asis" doesn't allow
you to do anything with it--it just claims it and doesn't let anyone
else have it.

-Doug

