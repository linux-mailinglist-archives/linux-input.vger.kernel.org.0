Return-Path: <linux-input+bounces-16006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A662C4FD37
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 22:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 369884E58E2
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 21:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D14935CBB2;
	Tue, 11 Nov 2025 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RUcNKuYj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C068535CBBA
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762895868; cv=none; b=cbDvl+x2EcGcgAVdSjlzTFZogRHGVp6AtqujznvCPVeW+qWat7KOY2FaioxwnFlOL0RmFWsJRfyAD6MiptlxrX8ti1ELsmpnxjh44EkodNKdmq+4MJCenZFvER4dgNKFdHEI1A/0bXG0oIrzMq8FmBsSyClxRoxO2O77/pfKyi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762895868; c=relaxed/simple;
	bh=EKUsdAwJdrxz602ZVyGp1qIPiRrAcjyZqiMA4kgBrW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGRf4SDeuI6EMw5jlthApBlslKARYvK22cMUbwQuUqQ7cUxwlZeVKLkOu2D7nAYegZSTswO5cm6Quyq/MiXW91ed2o85029yHpGHzSmditcqF+E/gaKHlPoNFdOa0gNOZVgZz6kb0YmuGN+QH0tIvk+f72iwrVJ5xEyffFC3Szs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RUcNKuYj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b71397df721so33464166b.1
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 13:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762895864; x=1763500664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUTN1IPcVAO8kjorL9CBDMgcIux7FnelwiSriuq3hFI=;
        b=RUcNKuYj+b2zzhU+F1qoYThc1unVCBrNw1UqjkDQbC2Iq5mdIPx73Ir1QrLlQaejh7
         IXMHkDeAzfrBIspn1USkxkiA6CNuU+22KVXZaBX35JyOCpilbkMYSTE4bEea4edVgvtw
         r3+W2IYPgiH+M7xJqXvE4duoJ2mJ9AT1ULHjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762895864; x=1763500664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUTN1IPcVAO8kjorL9CBDMgcIux7FnelwiSriuq3hFI=;
        b=mFicFxsJ0dnIl0sAaCwb54ox1RrMBokQ2hcswtAJ/OXXwlJoe3uH2uzgcvF3UMdksQ
         gJhMDzOoRBGqpTjNEHrgSs/5AwqkSvTf914LxQVhJAvCi9TeTLkKu0gYalrZT93T4+EC
         NOwr/lM5goLL1rWvFcihyd3ocYYVZxkopRwXVfaahtdBU6sRMT5mP7pEh5rTA0HbD6nO
         3ABdyNW47Qk2LOa8kgFNmUghZ6Vc+ZXw2dG6Hmmax6+8WNMx0eSAuhiAn5yzGS4fV8OO
         vNs1Q8oXtg7GdB/Ux5yrnttmmtv4PaazgA2yKjsUP0i6q0P7BBbSUsVvFbYm1OOBABWP
         sUvA==
X-Forwarded-Encrypted: i=1; AJvYcCWmCD6g5cEodPzuWPcAi9Nqys7hiklLOmxT0ZKCZ70VIUgcNVjL+hA4I5kEOXa18iZDcovvSmiITyZAZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+NADTEbge2qC4jEz5tpeTaxuHwD8FtMsZhF2prVyXUC3otaJ
	OtKlG6QLFeCkGIWSut1FnU9M7oNPzOmsEvqcAhUYYTmI+z0GLofUc7S/Rs/LnOH981O0anSqdtn
	ZL+EfgQ==
X-Gm-Gg: ASbGnctIXKwW3QdOv7/2IgCMj5plUA1NtW5JXLXVkS8IGbzyoSW6yTOrz63EJCb7WAo
	7C+mcUQ9BGQdNE7yWzWHdAD5CsssYOcn+BvzLOjdj05Ax18D85rH7WigZEPVQ9tlrnFNLiWSIwR
	xkabN1D/IeMNCOmTl5kUXkm6QxzqrRPe0XZdDqkoMM3INKrYupg3DMjgUXvpVGN7ICHTjP1HT0M
	xppIEX1JaxCdp0Vh6o7pNFTO0Xqk9UX1Fogln9ywPATPRsIGZYtH719Zuueb7iXe44CrqdZdbHw
	ua44QQwLyttu+3tvkFJoxE8+oY1NQ5ERwhaov0ZwJ6zYfMRIhtW00xC+t+DQUALB28SsaCSgnfZ
	rDdJKcmqY2l8MBTzqr6R+niCvhbm9RncAGzE+hh0I19sy4Y7OrEFTSsLjvw4Zs/s2MTEo2222FR
	QlKJt4ZK988O4g8ooYa9EbcQ7x7pukML4Mqr5CuVUYgJv0QgETY37gwhADxnVW
X-Google-Smtp-Source: AGHT+IEHW2q9OjqEaq76FXMxATYoxBdNeKuLtY9E7e9u/u8+IaKX3GvOBSYTkUzIBfNH79vAfcbXiA==
X-Received: by 2002:a17:906:c10f:b0:b70:ac7a:2a93 with SMTP id a640c23a62f3a-b7331aaa445mr46430166b.43.1762895864274;
        Tue, 11 Nov 2025 13:17:44 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf4fbf3csm1426192066b.26.2025.11.11.13.17.43
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 13:17:43 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477770019e4so1888605e9.3
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 13:17:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV74AZiorO7LPQw2t0LqeMXxIlpeM5/qH1sldODKC43It1RsosKfcgTuiz2kkMwDibm1E/AQu5JdrZU3A==@vger.kernel.org
X-Received: by 2002:a05:6000:3106:b0:42b:4267:83e9 with SMTP id
 ffacd0b85a97d-42b4bb8f146mr449246f8f.2.1762895862835; Tue, 11 Nov 2025
 13:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
 <20251111093426.2.I47e028c511ad8fc86a44467ae228ba4fc984f7fe@changeid>
In-Reply-To: <20251111093426.2.I47e028c511ad8fc86a44467ae228ba4fc984f7fe@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Nov 2025 13:17:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XJ4G=wqiWQNWO+ho1oZ7AUB4k9Z+zuwUqwDS6W2TxwqQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmh-NdLykWBjDO55hn5GSOnuJolW6S6QQ2-UkYlwdUtYFi0NaIrEDSbp0Y
Message-ID: <CAD=FV=XJ4G=wqiWQNWO+ho1oZ7AUB4k9Z+zuwUqwDS6W2TxwqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: i2c-hid: Add new FocalTech Touchscreen Chip
To: daniel_peng@pegatron.corp-partner.google.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 10, 2025 at 5:35=E2=80=AFPM
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
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

The subject of your patch should probably be a little less generic and
include the ID of the chip you're adding support for. Like:

HID: i2c-hid: Add Focaltech FT8112

Other than that, this patch looks fine to me assuming the problems
with your bindings patch get worked out. You may also want to consider
using a different email address for sending since your bindings patch
showed up in my spam folder.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

