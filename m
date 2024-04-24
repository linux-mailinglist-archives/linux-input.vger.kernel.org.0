Return-Path: <linux-input+bounces-3238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250788B0770
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 12:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6A49283CB7
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 10:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F14158200;
	Wed, 24 Apr 2024 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d5QjoJCT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC413DBB2
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713954885; cv=none; b=ltvK2twJbNnszL69Ql0myw4h8+vwt4ohOQy3AuuWPXquBnIhJ/fQvgJyZudbCwM4mKsgpfDLFRma2cSyQt1mzoJk6vJrZGEkQ4hOQ0BC3PGcAooqeNWnvk8PVhf7oUCmVWzGnFGDNLo/qHtVXHqeAeVlwN5SIkdYaYMY44168Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713954885; c=relaxed/simple;
	bh=YTGioqHw4bG0d3wWLA0C6k3sKtV4jev6rrEIMgbLhO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/GLrOhF3xIgkFCvR1KfHBAoefMgF2w7WG+hphb6ALhN00I7v04YBCVq3NGhwY4aEejcyqTaGpwcBWuLE2TFkYwAbMk7REYU2rxmXLmxfn3WX1dwecNdUqlcTmbcHuS8/yjs6IEVdz3xfVJQpNad1WIQFmSsTdgl8EnySVgEm1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d5QjoJCT; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2de2f5ca076so18064361fa.0
        for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713954882; x=1714559682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTGioqHw4bG0d3wWLA0C6k3sKtV4jev6rrEIMgbLhO4=;
        b=d5QjoJCT4tGPOUizncdMovUNpMyoBw50xu8aeFD05oztfFAcqdy3Bdul0lreOWRwCo
         /IZUPO6onAUVtXA5+RVzgIc5ZrLbM4AmKZ42OLHrE3wX9eLtEUX89LX59CaisXGvLJc/
         Mq+zwfEP3QqhcR2gtyvJ8GE3qKWIDXvLWmcZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713954882; x=1714559682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTGioqHw4bG0d3wWLA0C6k3sKtV4jev6rrEIMgbLhO4=;
        b=hkzJ5SRvF5ZtvXZHJSaoLJD2Bk9g6QdQjgHmjqSfodjsL1KbOdnsVr3KId/ihua+6x
         SyoK+ZcR6/0INP/HeNyUeQ51qmA1Op6bthiRKRtnD+wPJoz9Fhl6m3FBQmSBO+gsLn/d
         F5MJ/NIclGNCeOODqd+aDN7w2/flU0O4EWHMcdv7NyMM9U4W6MAl32CojaUj/+GcrpgB
         58AZ/RVRPCnR4FDunjPEhv0Gr880RYZyVkI/CgJWQpcpHwa02iVxOqQPEudc0LR6ecz+
         g1EIntPdblgJbVfptpAz/PybQeibPtNt3jvzyTnXj5WcvPkRh1KJcddsGlZuP9TZdg5g
         y/UA==
X-Forwarded-Encrypted: i=1; AJvYcCWbqW68erldbxUFbMPnWdwN3JaSxuVLWcqVB0affrOv73NfjKkPF/kNbscl2uHzbknHHA0sLFfPuhKmeQcPbZiZPHGXJekABWkD1SY=
X-Gm-Message-State: AOJu0YzAGdoZZbmQV3loJYVqPx9Lyjbzk4gWiLjbYKGE6MzpSzoXVJsq
	LEEw4ef8389L1gCRACKV62Z37lWkh7t+4CKzvUeR6Zdwx/ZvDfuYX9oPHQPsriTD5+gwihiKaGe
	Fr0laZnIZTIetptO99kCX0O67ItbdKzaLmAhl
X-Google-Smtp-Source: AGHT+IH1SKEuMcbXbVaOT7b6LPKCdH0Hxd/9lwuaSIGld/FRJW7iu8EV/TAGnf3V8FIPftxocbi/e/dy8Ket9y/FUsU=
X-Received: by 2002:a2e:3c0b:0:b0:2d8:5e21:8ec5 with SMTP id
 j11-20020a2e3c0b000000b002d85e218ec5mr1359535lja.48.1713954882016; Wed, 24
 Apr 2024 03:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423122518.34811-1-kl@kl.wtf>
In-Reply-To: <20240423122518.34811-1-kl@kl.wtf>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Wed, 24 Apr 2024 12:34:30 +0200
Message-ID: <CAE5UKNpSNtPbdMKDb7pDTpSiCNndkYP7KC+m6xSd6aMMQvQ2tQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] HID: i2c-hid: Probe and wake device with HID
 descriptor fetch
To: Kenny Levinsen <kl@kl.wtf>
Cc: Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dtor@chromium.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Radoslaw Biernacki <rad@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 2:26=E2=80=AFPM Kenny Levinsen <kl@kl.wtf> wrote:
>
> This revises my previous patch[0] to add the sleep STM chips seem to
> require as per discussion on the original patch from Lukasz and
> Radoslaw[1]. I had initially tried without as it had not previously been
> needed in the similar logic in our resume path, but it would appear that
> this was simply luck as the affected device was woken up in that case by
> "noise" from other sources.
>
> To reiterate, the idea is to add the retry that Lukasz and Radoslaw
> discovered was necessary, but do away with the dummy smbus probe and
> instead just let HID descriptor fetch retry as needed, aligning more
> with the existing retry logic used after resume while saving some noise
> on the bus and speeding up initialization a tiny bit.
>
> I added Co-developed-by tags, I hope that's appropriate. We should await
> an ACK from Lukasz on it fixing their hardware quirk.
>
> [0]: https://lore.kernel.org/all/20240415170517.18780-1-kl@kl.wtf/
> [1]: https://lore.kernel.org/all/CAE5UKNqPA4SnnXyaB7Hwk0kcKMMQ_DUuxogDphn=
nvSGP8g1nAQ@mail.gmail.com/
>
Hi Kenny,

Your solution works as it should - I have tested it on my Eve with
enabled debugs and
the retries works as expected with power-on, reboot and suspend/resume path=
s.

I have also disabled cros_ec_i2c driver to be 100% sure it doesn't do
any i2c transactions on the bus
and again the touchpad initialized successfully (with a retry) on all paths=
.

So you can add:
Tested-by: Lukasz Majczak <lma@chromium.org>
Reviewed-by: Lukasz Majczak <lma@chromium.org>

Thank you Kenny for your work :)

Best regards,
Lukasz

