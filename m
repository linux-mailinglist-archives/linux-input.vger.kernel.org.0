Return-Path: <linux-input+bounces-1297-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6E830E0E
	for <lists+linux-input@lfdr.de>; Wed, 17 Jan 2024 21:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E00C7282C20
	for <lists+linux-input@lfdr.de>; Wed, 17 Jan 2024 20:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90926250EC;
	Wed, 17 Jan 2024 20:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j+XBGsN2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08E250E8
	for <linux-input@vger.kernel.org>; Wed, 17 Jan 2024 20:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705523745; cv=none; b=uGcOMPQDHRZW4/KL6h6M5yrkfBgK3/rMTm3r8orFOs1yiPWeezNmDUUlbX3YSeZGihBzPka2Iig2o9FP/SCg4QqOcvS3yqb8Z55zwxeMmnsOQWD16Kr8DsBwgexS7XucYKPJA0ZixyQhPOIBQWLIbKwUYGAsB7yCSp+FDpAKVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705523745; c=relaxed/simple;
	bh=y80k3jEI2jUrrgv1S97EjSMTB/Tm8rDIE+8TZZV8vDk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=ngEM813WOxNlk+58BE/w+S//W+hhzDuiwTdLCIMErIFfkAJLR5QuWuSWnTrxwgbFFSjKd8zX/mzXdAB9vpkLA95S5Bm+PxuDFFgjkCZ5/vTYDz0S75nCs0jX6azvK/0aih8hPwrXaZJS888wP9vsRDguk5GCPcYAn+5+0i1cuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j+XBGsN2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50ea98440a7so12345014e87.1
        for <linux-input@vger.kernel.org>; Wed, 17 Jan 2024 12:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705523741; x=1706128541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H34ysvL6GHeCyXKHhC6fgd3ArjBS9lz3Dbeq0+BNUM=;
        b=j+XBGsN2ozDi9opI2LCqn2H3otCiNO7rrLVSgcyy27kKO4N5R2U+jqIHFUHT9V5QGz
         Zw4qzt8vXK2Jcb2eh/UMW7QG9lhssCJwgqbhCwGvG346Ao9VWPch4iMeEWLyBpxHfJ5Y
         PaP5WGKCJv+OdMHGRyGUG3iiJFVkmyHS9GKic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705523741; x=1706128541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0H34ysvL6GHeCyXKHhC6fgd3ArjBS9lz3Dbeq0+BNUM=;
        b=S9NQRuMW5GKm/XHEclpkexK0qqkXDMDYQ0/13qm2Kj4oxhmhvaS5DiVJxee2NfDf1G
         MJ40CJFrkiB+vM/H/ML6aIAKtmINRaBdjFiOi3WYzfq4KZaoXZ2XI/9u8qGwVbd8KeNA
         3Uu28Lbxs+xqSw/YFwdUwClgGECzyTPrxX6T9mPV1WdHg8317mu/lIa0DqyDgz4AMdnM
         2hGZthiYpmO3OOyyN5uXcvC5e1uEQ0IWXJ0qEQdFokKXNEHJ7NgsfT6UHf6qxCvjoF4n
         JAIShPWrHJr+fXJK8GMMsTS+M7taJzPmD/j6gCFwMNUGeA355025fIS9uqg92Gwi41uo
         9Lew==
X-Gm-Message-State: AOJu0Yw2kNbyg+BGW2Ig/cblCQFGOzTsqFryfvDJ54SupPO/NXvtkL0B
	WFjJ6j9abeBj4/oDmwbYM/kSk/cPpyMZzUDomPrKOM1mW6R+v7w=
X-Google-Smtp-Source: AGHT+IGWVu2b3TsLg7hnIR1FFIhgjvgRogQ4tzz1TiJzGWPt03qQnCCtjREPumBurmQT1dmVGncWAw==
X-Received: by 2002:a05:6512:6d0:b0:50e:8e75:3eb7 with SMTP id u16-20020a05651206d000b0050e8e753eb7mr3398152lff.51.1705523741049;
        Wed, 17 Jan 2024 12:35:41 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id o11-20020ac24c4b000000b0050e8223688fsm362211lfk.30.2024.01.17.12.35.40
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 12:35:40 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50edf4f4aa4so4581e87.0
        for <linux-input@vger.kernel.org>; Wed, 17 Jan 2024 12:35:40 -0800 (PST)
X-Received: by 2002:a05:6512:4008:b0:50e:a70c:d0da with SMTP id
 br8-20020a056512400800b0050ea70cd0damr143487lfb.0.1705523739612; Wed, 17 Jan
 2024 12:35:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115045054.1170294-1-kai.heng.feng@canonical.com>
In-Reply-To: <20240115045054.1170294-1-kai.heng.feng@canonical.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jan 2024 12:35:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VCoB_uBontRk3WVn-nqzZnutSMCHBpdBqNOFwrYv=8xw@mail.gmail.com>
Message-ID: <CAD=FV=VCoB_uBontRk3WVn-nqzZnutSMCHBpdBqNOFwrYv=8xw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: Skip SET_POWER SLEEP for Cirque touchpad
 on system suspend
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: jikos@kernel.org, benjamin.tissoires@redhat.com, 
	Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 14, 2024 at 8:51=E2=80=AFPM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> There's a Cirque touchpad that wakes system up without anything touched
> the touchpad. The input report is empty when this happens.
> The reason is stated in HID over I2C spec, 7.2.8.2:
> "If the DEVICE wishes to wake the HOST from its low power state, it can
> issue a wake by asserting the interrupt."
>
> This is fine if OS can put system back to suspend by identifying input
> wakeup count stays the same on resume, like Chrome OS Dark Resume [0].
> But for regular distro such policy is lacking.
>
> Though the change doesn't bring any impact on power consumption for
> touchpad is minimal, other i2c-hid device may depends on SLEEP control
> power. So use a quirk to limit the change scope.
>
> [0] https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/power_m=
anager/docs/dark_resume.md
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
>  - Use quirk instead of applying the change universally.
>
>  drivers/hid/hid-ids.h              | 3 +++
>  drivers/hid/i2c-hid/i2c-hid-core.c | 6 +++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)

This seems OK to me. As per my repy to v1, it doesn't feel fully
explained what's going on. Why does it only wake the system without
touches if you put it to sleep first? Is it truly a hardware quirk
with the Cirque touchpad or is it a bug on the board you have it
hooked up to? In any case, perhaps it doesn't matter since you said
you measured power here and, on this touchpad it doesn't seem to save
significant extra power to go into sleep mode. ...so I guess I'd be OK
w/

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20240115045054.1170294-1-kai.heng.feng@canoni=
cal.com

