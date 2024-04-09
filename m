Return-Path: <linux-input+bounces-2872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565489D748
	for <lists+linux-input@lfdr.de>; Tue,  9 Apr 2024 12:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962C71F24E24
	for <lists+linux-input@lfdr.de>; Tue,  9 Apr 2024 10:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B1641C60;
	Tue,  9 Apr 2024 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RWt+Yv/F"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46247C0B0
	for <linux-input@vger.kernel.org>; Tue,  9 Apr 2024 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712660037; cv=none; b=qRhg7oLthsFk6MxpbO9uBbBMpTFBGK7kQ0vERb2OyG41kmiP21ZmgpfbAQTAf5ZaiJfYpx1MHGnMGFd/ZsMXuWG8EEJ04n0oFgB3PooA8j3D90wJ1YZbYlw+BW3znKmKc0tIILwhortPRLSaxjRrO8t1fZVrFx7Ul9I1+AYHp9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712660037; c=relaxed/simple;
	bh=d9SLtzD51uda5U7BOlp7uyL+uUypQJx04HhbXDep8Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJp56bnMXvJviBdhuyhpi1UzPlsiS2kSrwJPSCiTqdZxKQteR4IFZ0iawD5ds3vFZlug/k6FBkAsQ5XlsyGWtvRUv+E/eNacP82bidng+9ZxRiQe8yDBuOyaSjIFc1KEbin/I3NJx3Y2KC/k7r+zxBCH75HFrh7tm6+U+H3Vz98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RWt+Yv/F; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso8104721fa.0
        for <linux-input@vger.kernel.org>; Tue, 09 Apr 2024 03:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712660034; x=1713264834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9SLtzD51uda5U7BOlp7uyL+uUypQJx04HhbXDep8Hg=;
        b=RWt+Yv/Fxj+ZWLQC+WOj+QgMKzq4mRVGRqw0/4FVaBHH+LxsqQYsbRLeiB29ZdI8F9
         NGvxzHHqaynfid/ubi8TARqqflvGkmZBxn7oIa2sWg050HRQ1YFssNFI76OVc9W/D1c0
         H407Zv6y2glJxKwkBgJHFsdPtDsRbtEkfIgJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712660034; x=1713264834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9SLtzD51uda5U7BOlp7uyL+uUypQJx04HhbXDep8Hg=;
        b=T5RdLHM0FRF7HOpfVh9Q20nxKvoXNskH/ZwoUng91aFw8gniCBK3z9U2ZTLlYyxjUb
         uIB9njjyZCYNXm+99resK65XdMeLmYLvobkV+hinNX/j+xLTN82ZkC8J5vPjp1oTXEaP
         qMrVQt+S/046PkTtVLjt7hfE3ZnrcIfURLxW+wpTUAuhnbSzQSHhsjIWutLU7fhesC8i
         LxtAa5gQSfLC5kM5RKBSg3hGbKEe/pgjuTRWQme96xiIqly9DbWBzGXMzwCL1h2zc8md
         r8o8ksASp0Vp6XXioZ8yHfkQhLL2M3K+Bb5r16WuhrAINzob5VwhE1eEu6I010FCV9B/
         b+2g==
X-Forwarded-Encrypted: i=1; AJvYcCVaJ0EA2TJpKVGwnPRcyEjjmr/2ZSNHjC1m4aHBALuThNY9ka6A2b0MgBWnvdzFS6OeFAr2xi0gwQGnt9javzI7OobDScLYAT4j+HY=
X-Gm-Message-State: AOJu0Ywp2cqr/7oYbRxQcC7ZE9bSJNjGVqeZTxrTJpr1UUL2LuiEES6S
	F1YNKRtORYBt+mK+A6rKpr57WdqIZIacSvEy1cV4Jl/F+v2zutXKBVZTbGXk30gIBBe2+aaMVhN
	JvwcWZqlZLDuyraX0GDUsnQcX2rOT9lCAMZ7Sj9NXOQdNw/0Ykg==
X-Google-Smtp-Source: AGHT+IHEYeRTYFZMvp3NAjb5ImFPXtsX11vnH7B/nWxeaBYxhT1sMC34qXfKvJt+NykMNkOF2q/ZE6fmykGLoAhsU/g=
X-Received: by 2002:a2e:9d07:0:b0:2d8:8b9e:8e9b with SMTP id
 t7-20020a2e9d07000000b002d88b9e8e9bmr4336666lji.11.1712660034170; Tue, 09 Apr
 2024 03:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405102436.3479210-1-lma@chromium.org> <ZhOccGFkTFkUkRUI@hovoldconsulting.com>
In-Reply-To: <ZhOccGFkTFkUkRUI@hovoldconsulting.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Tue, 9 Apr 2024 12:53:43 +0200
Message-ID: <CAE5UKNqufWZfKLAXLcpBYKQpJEVt6jPD4Xtr=Nesh34VkNOETg@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: wait for i2c touchpad deep-sleep to
 power-up transition
To: Johan Hovold <johan@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dtor@chromium.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Radoslaw Biernacki <rad@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,
>
> Can you please explain why this would not a problem for all future
> transactions as well?
>
> If it is, then it sounds like this needs to be addressed in the i2c
> driver. If not, then perhaps the problem is really that you just need a
> delay after enabling the power supplies?
>

The problem is that the probe function calling i2c_smbus_read_byte()
is not aware that
uC on the other end is in a deep sleep state so the first read will
fail and so the whole probe.

In a normal scenario, when a user touches the touchpad (when it is in
a deep sleep), the touch will first wake up the uC and
then generate an interrupt to AP, so in this case the touchpad is
fully awake and operational.

> Nit: move above the 'ret' declaration to maintain reverse xmas style
> ordering.
>
> Johan

Will do so.

Kind regards,
Lukasz

