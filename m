Return-Path: <linux-input+bounces-16106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336BDC59900
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 19:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 107E53A8A6C
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 18:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17EC315D5A;
	Thu, 13 Nov 2025 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nku4BofP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DFB2F5A07
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763059648; cv=none; b=uXmkB5IuLB13sjgubSRKYFj0smN/4MKBqzZpFeaqCf0Vnyq0kDn5dkSlOGANvk1MfChBCsLNPy3y0HFY3qb6OIDvxR+zY67GCgLeXNShHUHXFk7TgaFhw1Gfu8m1Jph3E/DZNRwEyR8MSLMi7s1PTlr2nOfcfTERE2jtb0Z4zSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763059648; c=relaxed/simple;
	bh=m/TMgIwaPkUbXfwT5NIqlaTMIB8pf+yolwgjLBXes/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEK6ge9j24Sm0+VVjaqmaqbGxuTMRLVO50BaixAGCKrjLLsmc4jzDLzanpr0EeIvmLmtD1yL6V7gN0zVJYeEi3J0DL4N93478h8JA4y9WtOa1s4fVD7/7AvqfXe3du26XIf+wc0FMy4EtbsjcMr7oH/6Rg3uzA3DyuYKgxBg3wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nku4BofP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b733707e0b5so173226266b.2
        for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 10:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763059643; x=1763664443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pa5zOAGn4vfPtNLql7ISD9NlwOeK3Bkse1UUyaDWYw=;
        b=nku4BofP8TJlw9gdqTYJlDAe4x2O2ELI496I43r7+z18+FT/O2Dhx6Gqz33Q+Ne40r
         pmnznF6Zso4tegI8rd1h6DWmT+sOwJ1grL+5jmVnRDuD9u9/EYpr65Z5KvW27aMAOnLJ
         tCvz5eVRlfPHFEx4Hovrdw2O85qA3PxRhfVas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059643; x=1763664443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6pa5zOAGn4vfPtNLql7ISD9NlwOeK3Bkse1UUyaDWYw=;
        b=phRMBUr9KFzlj8unk77meg3bE3j+nxhJrDXLmq77Q05te7WtE08Hir+kJLPEE/Tcur
         IbPAsVaa9uqKttNxEnJNzl0byELYue2bkCGXVh8AxS5/8Vw7U1SnnY/XcDjaj+TvL4T6
         IFaz8n/OF4shR5G9d1aAfWa37ZjACbZLPVx6PADZ4dkNQ7NN+64SQLNL6QPxfm2aBn79
         qxavK/iaQxgNW3W38iFFykfs2NuGKV+OwCVbrjtzNqlW12IlTWwejC3ASQ1Q1VakoTGE
         KlFeg7+860+0Jd3ddsM6QhDIRtPfiUyY4ocOYGnzM/ICtEGvJ/wUoEZu3SWEK5jvNKSX
         FCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1mHLbAmFirmyU63QQuNFwVIbS4Yq4badye/GVHwhE7kyyDAxW90U+UAvfHx1urVZDtvt88XVsNetqRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcOH7/4vmZakVPC8SiCgILM8F5gEtIL7sOyqQ10PU9T5b9Iv28
	RP0jy+tv1COonawoxGL6x0ozJmD4sibBPP64BuHLEbcCmHT0vbCwo0h2UwZ5b6orNrUaJ+tctNw
	3LpSYdR7U
X-Gm-Gg: ASbGncuifH5C7j9+tHtAxVRhCRduE4XZ1KzsQm9wNx61eN7OaIkpGnesYkYezBDk4Eu
	sHD4n4m3hw+7lqIZVD33HF/R5U4My6ao3xrgEmvDx/OP/Q3xi84vvrnSnczVnwI77QrTB1tFwW+
	vvUhapRh2PpS34x4mnGZJ1gfmjeLUmLKyQ+V24L1lq3M7+i7PJCGNbR9VIx7Gv+hfjlf/MkD4bw
	QUyQWfhHeyhfpf5LoKNt7uXD6u4NX5gpIWiUgpqH+tUVZ0kHw8QmVV+nynu/5Uw8i+A0LXHwJbv
	FcuvycK2vlTDPlQECz1JyFZ5YPfqOgFetsc9XTkIftDvoD9RBwXGyoEHrFCnuEfBkD4/3ykVANu
	D+GBvNwkLBnvLkw15Eh6LNb6WLfwuCV987cURHszj3EIFYnhGrGxX0osqIucg6gtVo1jPHZLD12
	3taDNkaPxHMzX6jz4SEelHZL81zpnha3iFGvB4yh/U+QWbbCxU/mwkJwIXKrZKtB3l2U2TsQM=
X-Google-Smtp-Source: AGHT+IF7i8P0FYViBQUDoZKnux5MTsrdcd+ruxQsS0AXprdeVTxCjGZpFtWEoHuE/hgICe3ffK0rPA==
X-Received: by 2002:a17:907:2682:b0:b5c:753a:a4d8 with SMTP id a640c23a62f3a-b736796b442mr28895966b.62.1763059643329;
        Thu, 13 Nov 2025 10:47:23 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734ff75e4fsm212921066b.12.2025.11.13.10.47.22
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:47:22 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471191ac79dso12798555e9.3
        for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 10:47:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUf2Y34/WRr6wjf/eJNDip3oovqQBMaepfasaZisMZSkcE6p0m1lqkYJJyffCLhcCkZdOwgNuJIOGJTZg==@vger.kernel.org
X-Received: by 2002:a05:600c:1c19:b0:46d:5189:3583 with SMTP id
 5b1f17b1804b1-4778fe128d4mr5655535e9.0.1763059641794; Thu, 13 Nov 2025
 10:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113140004.v4.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
 <20251113140004.v4.2.I47e9f0b76399e6009854dec06420c20e68e23116@changeid>
In-Reply-To: <20251113140004.v4.2.I47e9f0b76399e6009854dec06420c20e68e23116@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Nov 2025 10:47:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V1XDg4xeyNsonO=Vnqtr_h_t-6THVSN94OwnAc0rL0xA@mail.gmail.com>
X-Gm-Features: AWmQ_bmudWlj27QvceuHdnhfsgBSCMlgVO4gHcVjnbaop7V-bBcQI7Hn-P8apkc
Message-ID: <CAD=FV=V1XDg4xeyNsonO=Vnqtr_h_t-6THVSN94OwnAc0rL0xA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] HID: i2c-hid: Add FocalTech FT8112
To: daniel_peng@pegatron.corp-partner.google.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 12, 2025 at 10:01=E2=80=AFPM
<daniel_peng@pegatron.corp-partner.google.com> wrote:
>
> From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
>
> Information for touchscreen model HKO/RB116AS01-2 as below:
> - HID :FTSC1000
> - slave address:0X38
> - Interface:HID over I2C
> - Touch control lC:FT8112
> - I2C ID: PNP0C50
>
> Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> ---
>
> Changes in v4:
> - Move change log of v3 under "---" correctly as below 1 item.
>
> - Modified the subject to include the ID of the chip as suggestion only.
>
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

