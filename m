Return-Path: <linux-input+bounces-11800-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515FA8AB21
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 00:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA5447A5D54
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 22:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C64227A920;
	Tue, 15 Apr 2025 22:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgJo06PG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2528127A90D
	for <linux-input@vger.kernel.org>; Tue, 15 Apr 2025 22:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755345; cv=none; b=cPNQQbEbrIgYhuW36DxvVeJvMbMyuJwi92Ia3Wo/je0ZqvN6Y9d0WKBYiOAaiO65JQYqnDw8y+wqwDd9e+S9odpA8U2b7top2fV0pvqCjiW9xzXcSJZHaTeNqjMzgyOWxdpP+c96SSMcfRJHzPfH4ebhQ0UZYxqn6wZvqC9pwYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755345; c=relaxed/simple;
	bh=3IDLTt/ybfWS/Yh/QoGmWJI4cRQW9Qqw72xuwSQQoz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z//ZEDlOJueX9yBxKyqXcyoeyWAfi4N4baR6KHK+k5ea3p0AaZ5fzUI/pfwFJo2L/er3gsF9guO7JIOWAFVjHOeYYwtJ8xXCIHc5adq38oAycbTIaSlajs9T2CD8boBquBLC7v3lVqYXBEwVMt9HsF7pWoSuknSTYBdcW6+lBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgJo06PG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so51505971fa.2
        for <linux-input@vger.kernel.org>; Tue, 15 Apr 2025 15:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755341; x=1745360141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IDLTt/ybfWS/Yh/QoGmWJI4cRQW9Qqw72xuwSQQoz4=;
        b=xgJo06PGDjE/C/mqIWjOtCx+0tQ4IRb+or3O9QwH22qaijmjDXXgIC+KJLlZRXFUTV
         lIRVucqzW0Cdj4mB8TpzbuWFH7NFlOuf8czjP9eTEUKRIqdfYOItvy8N02+wlzXiw+f3
         Lzqpx+0Sz6A6GfVcnWcAK3hlAWh5IQNnA9sFbkCqTkqpi2y/eBs9p3lLjlwf9d7dsFKm
         TH5v2wnS3qbIlHqTAE5c8JEOySBTjuzL0TqfzJ0DJ4gX4PIrs6EROu0+X59Ewl0tr2CY
         WMwnFWHcNGhgAvfl0MLUvqriC80GW8TRApplSAHMMoux5wSMY2X6Q/4or2NOXe3nsP92
         J3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755341; x=1745360141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IDLTt/ybfWS/Yh/QoGmWJI4cRQW9Qqw72xuwSQQoz4=;
        b=OU70IfMlatCXfze38Ps71F56V1DQC1D2UyyiP5uPHs9RekqDvOJlmmI3bjIe9+iLfb
         VHKTsSXFfHoJFTPppJs7TC60wncTZhpQVdqaPZgoL5sSGTH3xfEb1FkNaMJ5unCixeyX
         Oo5UdMZV5D7hX4AIkGSHgKscyGMWU+SEXryrIRRs7pmLGbfJm43HKJSfIedF+QMcDNlk
         wlznlqwq41o/Dbju1joKTJQg/Bq/jVfss6H443o9TAXbayySxyq0BgCtFNDuBcbGclaz
         LaK48J1J8nzpE33hRvJstLlOpZG4lm2JNh8x08Irn1Ix2OZkIl1WnJDw7mORvju/MK28
         VrNg==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZiwmXVitBzIaeYep8qNCXm3ayvv0ATnCAKhRswVG7Snlgh+lN2mY+e5ez9J4BjBkOsPXZZTW1Z8aRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQwKhW6N++ifDM6c7kxSypkfTT7cc/jNeI9CSqDpRure+saL1
	MD9YJFl4eskNa4/8cY9nwowA/UYNokmP77CB7zFBl+QNB24cLRJEWsrwtzetYzQUvL6vSYjy1/C
	rLg02/iwVQOFHV21FohHykN/Tv7YKpAyPCFlShQ==
X-Gm-Gg: ASbGnct5vcbeYUXz4j3IDcZb0mVuL+TQj/oFaXHhkTusYr/tLQ4ulgzh8eldCOTwhDH
	jQ5OzffZApyo1T/Bm04QVhkCNRZ6gviIZzSqyw8n47WRg4F38TZj0LVXCZf1yYhVb4sTfrSn4wf
	Uc63XGAxzDF18g62/U9eaSHg==
X-Google-Smtp-Source: AGHT+IGz291D+ba2B23NSZhprn8muxlxhfCK8P3qwCVwnjg64DejVDMET1qWa0V8mNtq0S/w6O4IvzOXyFabUdyweWA=
X-Received: by 2002:a2e:bcce:0:b0:30b:bce7:80da with SMTP id
 38308e7fff4ca-3107c2a5e07mr1935241fa.9.1744755341129; Tue, 15 Apr 2025
 15:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409-mdb-max7360-support-v6-0-7a2535876e39@bootlin.com> <20250409-mdb-max7360-support-v6-8-7a2535876e39@bootlin.com>
In-Reply-To: <20250409-mdb-max7360-support-v6-8-7a2535876e39@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:15:30 +0200
X-Gm-Features: ATxdqUHsUTdiuzHDBft1cRFTLonjrdMquqGFbjXe9OBWsOq1Lj_ycSHfvYfu6WU
Message-ID: <CACRpkdbN15ZTeeN2Gj24RC8cB=s8ZqeyOtz9fkPSS1fTgwRKhA@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] gpio: regmap: Allow to provide init_valid_mask callback
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pwm@vger.kernel.org, andriy.shevchenko@intel.com, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 4:56=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> Allows to populate the gpio_regmap_config structure with
> init_valid_mask() callback to set on the final gpio_chip structure.
>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>

Makes perfect sense!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

