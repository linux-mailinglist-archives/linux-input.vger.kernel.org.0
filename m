Return-Path: <linux-input+bounces-2849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885AA89B656
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 05:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7319B21EA3
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 03:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D73E1851;
	Mon,  8 Apr 2024 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K11QaQIn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FBBEDF
	for <linux-input@vger.kernel.org>; Mon,  8 Apr 2024 03:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712546310; cv=none; b=bmkaf+WcLA53J8bYaspnvSb/M9V1RQQaPhK6qxWeOj/JwGA0MCh3UkfhKDReZd4MuAriPie2G+CxEpqjZR22WY4de8/AkzCgv2X7nyhP/3g/WUh+8hGpg8a/LDfVLaYzplBerpAo4A/bInqQicVn/mQvqM/jsuyBYtmMB3EkIGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712546310; c=relaxed/simple;
	bh=3ilci9gMyUWIKqfJPT0Xi9ZjjLNpXg7E1hfBAMC+znI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IS4iWDysycyRl6KKSLQvbkjlgAz/1sf7wmSpmBZHv4nfd0exyECs5ieWjnXjzyJUKMVPmooclnrnujUmt701YlCjlLfAEY8VWBpy+4e5bSGPXoepBxE13ug+SlGrzSIWB7sJwTXBgIdhlElb3cl2yPNhaBhvKI9ytI25wSexaTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K11QaQIn; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-69b20ac7d04so646916d6.0
        for <linux-input@vger.kernel.org>; Sun, 07 Apr 2024 20:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712546307; x=1713151107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyQ3gqC4n7s5e/dZCBWNeKChUckyBUUi1w62B96nUuQ=;
        b=K11QaQIn3ldF3cN918Usz24I0uObiEJ2G1r9jfOgkLIrY+GJmjFl9gQo64voX5xOOi
         6liejsybsNHwOMt+3DJohzSHMnaSHF+2fRpbSGNh7mGqMKVtgLgA1t5N1FBS9PQtlLUR
         TeopixYw46L+W2Xty7JGLfQ+d6NHcQNAOaj7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712546307; x=1713151107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyQ3gqC4n7s5e/dZCBWNeKChUckyBUUi1w62B96nUuQ=;
        b=awY2mcDuymsMj+eK+eP9UVbSql5YLNg5ihAuTdDVgBeDW4eHefX/aNt+rtuiAsOvxp
         50fqFqaUnUsPxaj5Vc+Xzbkti6998IEOsmYuvL4katzneGBRDL7RM1Sii84beZ4cVDn9
         LYY7TZHZMk0NT+gLV8qO5pwTOVhjfu+9iwtvvh8AnzSvDLNfmMF6aYmdkT5zf8ojxXyn
         5Aoh0QyQMM6nTlY6sDBu3nno+B10uojT94HXlmU6TCOjTYbtgROX1bpqvyiVAFoBefdr
         6tKPJo0kcw6Eo5bD3qkiYNmhuv9Q3UXl80wQZ5n84Fat+itZz0m6QSp4B2g8fiGSiY4m
         /sVg==
X-Forwarded-Encrypted: i=1; AJvYcCULSdOxq4ZzMAoNeh+dHfE5ghN4YimPhzA+RLjdEqa8QlimKaMa3q0c1YvOQ0WjPpjwTR8Jq1kYE6GfOMVwv0x0UUl0UJUBMgtyCqA=
X-Gm-Message-State: AOJu0Yxv2LA80GQhGXY6EKO6QpeArHLRg/Q7JgRyabOuap3ex/0DRCgE
	DhUlcFCmVJ9WILErl0USovqjd/qlH8brwKcseuUXmKBmZXXn98H+NSGhmhtKpjo28IgPvmwF+ao
	Bdw==
X-Google-Smtp-Source: AGHT+IFjqBOu0B2dcJTkZYWPsPZ2w/ObdmuONOUnN1xi31ZTtZKUyogLlhMtPSIVZakNELTI4VdVOQ==
X-Received: by 2002:a05:6214:1d2c:b0:699:2525:7ec4 with SMTP id f12-20020a0562141d2c00b0069925257ec4mr9019774qvd.14.1712546307236;
        Sun, 07 Apr 2024 20:18:27 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id lw13-20020a05621457cd00b0069b1d8950f2sm510479qvb.101.2024.04.07.20.18.26
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 20:18:26 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-42ee0c326e8so318361cf.0
        for <linux-input@vger.kernel.org>; Sun, 07 Apr 2024 20:18:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQwr4grOftGLPOh1SF/NpKu16m/4jewTQ9im9EoFnoLJk82TMmWWsaUmqCZzj4ymS5lOKNaZyUUsVvi95WvbaJv+151+LMEW8ZpcU=
X-Received: by 2002:ac8:7cba:0:b0:434:77b8:1ce4 with SMTP id
 z26-20020ac87cba000000b0043477b81ce4mr154092qtv.0.1712546305996; Sun, 07 Apr
 2024 20:18:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405102436.3479210-1-lma@chromium.org>
In-Reply-To: <20240405102436.3479210-1-lma@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 7 Apr 2024 20:18:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4kLZMSViOMcUaXEJd8E2avb7wiBx=Y=Uad+04Q5LHXw@mail.gmail.com>
Message-ID: <CAD=FV=U4kLZMSViOMcUaXEJd8E2avb7wiBx=Y=Uad+04Q5LHXw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: wait for i2c touchpad deep-sleep to
 power-up transition
To: Lukasz Majczak <lma@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dtor@chromium.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Hans de Goede <hdegoede@redhat.com>, 
	Maxime Ripard <mripard@kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radoslaw Biernacki <rad@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 5, 2024 at 3:24=E2=80=AFAM Lukasz Majczak <lma@chromium.org> wr=
ote:
>
> This patch extends the early bailout for probing procedure introduced in
> commit b3a81b6c4fc6 ("HID: i2c-hid: check if device is there before
> really probing"), in order to cover devices
> based on STM microcontrollers. For touchpads based on STM uC,
> the probe sequence needs to take into account the increased response time
> for i2c transaction if the device already entered a deep power state.
> STM specify the wakeup time as 400us between positive strobe of
> the clock line. Deep sleep is controlled by Touchpad FW,
> though some devices enter it pretty early to conserve power
> in case of lack of activity on the i2c bus.
> Failing to follow this requirement will result in touchpad device not bei=
ng
> detected due initial transaction being dropped by STM i2c slave controlle=
r.
> By adding additional try, first transaction will wake up the touchpad
> STM controller, and the second will produce proper detection response.
>
> v1->v2:
> * Updated commit message with short sha of a base commit and proper tags
> * Rearranged while loop to perform check only once
> * Loosened sleeping range
>
> Co-developed-by: Radoslaw Biernacki <rad@chromium.org>
> Signed-off-by: Radoslaw Biernacki <rad@chromium.org>
> Signed-off-by: Lukasz Majczak <lma@chromium.org>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

As per my review comments in response to your v1 [1], this seems
reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20240325105452.529921-1-lma@chromium.org

