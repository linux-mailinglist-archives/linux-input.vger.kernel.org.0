Return-Path: <linux-input+bounces-10836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C818A60F67
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 11:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B85D83BC9F1
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 10:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1C81FCFD3;
	Fri, 14 Mar 2025 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdch8sUn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972F71FCFE3
	for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949708; cv=none; b=F2w/SYiR05He4EdRtk5XXhybfcJ1I3GSKSGYZV934cTUbe/7FRTSCAUPhqtBF+Qb6Efo5LndepEQro/moqdo5LR6lDp4e5grNLtYdsvIweTGQ/HROvOL5n0UtXP2QgBPIBUEBRWz8fNxMqGHSefxg5DOBGaWRDDulCPYaqF+I6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949708; c=relaxed/simple;
	bh=XIpCWEJtNCIGCcSRjvUMMAFsp4KmagBzuNVM5BTwhsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbOHUdkF5wNOa4LCBXstWH/bJqLvbxyWiYhw8KIPGXhq39anzRZG+cy3kOJUax6ph+NXyE5N6lGyIcpBxzeVDlK46HA8fx5IZnD9Gh5fu6hhIlzB+Y1AL4Po2rX8eNY6p6gc6OY2ba8U0kNokqtW/xcgpepPWqvsXfQ5fgY9A28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdch8sUn; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499659e669so2193181e87.3
        for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741949704; x=1742554504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIpCWEJtNCIGCcSRjvUMMAFsp4KmagBzuNVM5BTwhsU=;
        b=sdch8sUn0m3ZUuXHazJ6G51yTLicPv0gbfRoH2b8IJ5OA7B8t9p1D8Q9arfe9he/YQ
         MtEPe44ujMdJJ/BplAywwFwbKUfTfZvPuIsTZZj5vVdPstVdvYY3Yd13O3pPvsIMAUg0
         nSaHm856SOFBygvWdGSlk+AaKAccYk5QClHUBl/jlr/HEGtsWTo3CSsyE53VO0Ft4I14
         WRbOlgeXZDoK0vySL2q4s9cBdeTs/rIVilH+cc5U9aTv3VzQuHOcIPN9bA9tTEGFvUFl
         2IGULBHWU57F7AthPy5p/rd4vhZeYUdBTU6jp5bTfPMQ7LrLZ/VuCSHoIybQkY7orcu2
         PtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949704; x=1742554504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIpCWEJtNCIGCcSRjvUMMAFsp4KmagBzuNVM5BTwhsU=;
        b=RcuZPVixy7hAhD9YcM36XRHC7zE445f0eUbN7L7IiYnvZqLIhqpzEEdyZFvACEimzv
         Q3AkeWMMkA8v+tARCkKbhrNQJAFkVr+rxBDUEXaSoC5IQw8YeE1nfwHQaywRljkG2CPs
         i/tf9TrqqEOx32aH6/3UlODTcHinnDWoY9TJhKC1f1UJpxhmOM3cBTQe8gksyPk4aKao
         7BcpGdbnAu51hi6jsf/sg26fiEQO9+PhC3k+mGzP1ygOAUpMkDgZmntzF5bak5ssTQ8d
         SZ0z8A88dtGDJv5KKvorAeUA8YyKwQEQ5lmFUZbo66ken9+cpDGrszFW8uv1bG4XQ9+/
         ZhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPlI81Dp2uVuuOJZFstDHoLCAN8nxJC22BBYNPJNbXCRx0SQRNbGhn7xuoGwPOXmgR0oL7jbGu0O7Vow==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsdaja2TqnZhc1ydXZDiCAHmy5VXn3gKW3g9CVoZryGdrYsH5p
	+tD8IGCEk+SgoopuzjwhuVCuzZBgW5cCwW9VOmCjKEgZKClRWuUA2iGUx0NvsH6WyxEgDog7wwJ
	eY8PLcfhRY9KTr+YiSpcoV5yMjoXRl7FROz6UrQ==
X-Gm-Gg: ASbGncuDz88hJ8CmMfmwqSuelyUh87+KzgTTj3TER0nzlQUIKa9GqpspHEQHLiElHi5
	V22O6Mtd09W9Zjx5atY4Oh061D7tnRdctmWgifFGIJ/lz52cgx3YhFKcuV3vmf+rt50R0TREGJ9
	lRAVu6Or1zjzyCFGFkB0ng/Wg=
X-Google-Smtp-Source: AGHT+IHKqO2wuQsD20shcKJtT1g24wSPoOvFTAbujcg70cpsAoOwYHT2ffsYZ6WR4VBvcwwrqMsnJJ4lBJxDq0iv4ro=
X-Received: by 2002:a05:6512:280d:b0:549:7d6e:fe84 with SMTP id
 2adb3069b0e04-549c3c977c1mr524438e87.53.1741949703593; Fri, 14 Mar 2025
 03:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-dev-adp5589-fw-v1-0-20e80d4bd4ea@analog.com> <20250313-dev-adp5589-fw-v1-11-20e80d4bd4ea@analog.com>
In-Reply-To: <20250313-dev-adp5589-fw-v1-11-20e80d4bd4ea@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:54:52 +0100
X-Gm-Features: AQ5f1JrPxPh4c4bYA0cvnXpc2tJw16dQM_pzuKi8siw5LSsCNQbWwLPz0jdlU_0
Message-ID: <CACRpkdahKt0gCfL_pyAMZW9rReJ+X8dyRk25hdvq6gf_QpBPzw@mail.gmail.com>
Subject: Re: [PATCH 11/18] gpio: adp5585: support gpi events
To: nuno.sa@analog.com
Cc: linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 3:19=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> Add support for adding GPIs to the event FIFO. This is done by adding
> irq_chip support. Like this, one can use the input gpio_keys driver as a
> "frontend" device and input handler.
>
> As part of this change, we now implement .init_valid_mask() as we can't
> blindly consume all available pins as GPIOs (example: some pins can be
> used for forming a keymap matrix).
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

