Return-Path: <linux-input+bounces-2223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47355871B48
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 11:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 034C6280EE2
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 10:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1821C548E2;
	Tue,  5 Mar 2024 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atricZjL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D7C53E03
	for <linux-input@vger.kernel.org>; Tue,  5 Mar 2024 10:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709633865; cv=none; b=UJTlUjeYcQYuzqBX++/1qtu/roB91OLF/ITogt4piHSPLjfyeV24YMig42dY1VCpXfFm4X6y1yFTskgCxcD4RKS27HCQfjAHJ6ZwGAgZQr7nKkfP6s8ZsVCyU3lXTBHZ6uHZ8H2+a22Qu6J0Qacon9rTQl5tXDd+sg4/VKqAnRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709633865; c=relaxed/simple;
	bh=BO8aT2K0AnpBOr0QkCkPwFxiTb+pVBTrL/spNAsZygs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRyuW5UoTp9byDd+zAHKrMBzJOP2ecLiNWR2YJanB9WQ8AxhdnplAJzKINqaQng4WWnPFQ/lrP28VCOVp4oiWMx7FJ5KWFMSYf25X+vXgjTJDKLeAHr4N89xLRN2iU0olmjLFwU+h08Wx1OcQqDAIQCeDQ25zSln/pkuVIMif1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atricZjL; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-609acac53d0so17421717b3.1
        for <linux-input@vger.kernel.org>; Tue, 05 Mar 2024 02:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709633862; x=1710238662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bB1ASSHtevkX7qDtnq3HRRs4BcAZEE3eaFkYYtR1taM=;
        b=atricZjLQaxoy7wtobzYCo1Va84aYFttNGd1qHu0ILdyz+daeKFhbDfU9dwvsLIWke
         ll2UILVkpLxtMW0Oh/IxrmZlAGR79ro3q9tin50Llk/FNaFvkJ983bpDDG3D34nqEfIM
         V9TsLx4YjBm420NJrY66P8uzyZZuCutNZmKv48LArA9fEX2MObUhOw8jOUqgs4iRayqf
         VqAauRhDi2BvFyJQOP8TJbmk5xx4tPUUO9JfY7E7W4EymgDjjXscWlTxeREwT0bIbQ6Q
         i7JILaFTr2WLY+AjJK9YWeEerGf0w2InnJHSAkOYFDhlxv7J798eHuoah5neZJXRH4zD
         wLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709633862; x=1710238662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB1ASSHtevkX7qDtnq3HRRs4BcAZEE3eaFkYYtR1taM=;
        b=wukm4ncNKoHHePTupiHgeRSNmymAI8iHzX/8xiBo3IngmxmgtAIHhv3CjBIG4zOjMj
         mCR1aSuDKg/1zTBM7+Bb5qDmmKN+c0ZtZM1x2lTTpnbX8yM5tBBv8rT2t8ivVGOk17RK
         2jz+iS0Xa4echbRB+rJne2CKzoFbZxPgOHfD5GaV9YTDOBziCw8gmFsPU0wdClZWz+By
         UGdaSGVQdtXFp7uVqgTR87VtXvpFBd/bcm3/mKFFbvgOrxSTryEr8OlJPhPTEX/uSD0j
         xFndnKOz16W4C/RfOR5aZBsELs9X9QIaNC/64W9ZyKLwU9XUXsG1347mFF8hrHJ6h+y0
         ESvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs80KUFgfbnAFnVMg/b6W7XiG+ZmzAE+/vnBRyUGEwdrD5o2zPHEtW3XwqQfGpKcXdHYH2ia8oeNXiLGzTdOr4B/ymeUVB/t8/XXk=
X-Gm-Message-State: AOJu0YwHIfQgMiu1RfzNK793RizQBPY1sHTezrzIQ3g5FST8N062ougi
	XieL7DZmG1m8G6PXAm0HzmQ8adrar3J9nRuoY7Z2rSPYKae8jXy8vpuvM3naWfpXQQnUwGelakI
	0Ol5y2sHa3Iokk3kunAjepiI5F/1xgp+T3PtB0A==
X-Google-Smtp-Source: AGHT+IFyMCmGtg6nsCAXmWOECD1n/aaAvY07L67qNbxyZgXXAt2DonlTFrD+IUQew+aehKyU7xVKqo1UPU1mPinyf64=
X-Received: by 2002:a0d:c0c2:0:b0:608:b543:2d3b with SMTP id
 b185-20020a0dc0c2000000b00608b5432d3bmr11059455ywd.18.1709633862285; Tue, 05
 Mar 2024 02:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Mar 2024 11:18:06 +0100
Message-ID: <CACRpkdYa0+6V03LPbr8+h4RJxZxrnrQ=pCcBd8WfL5Jg_tcPEQ@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio_keys_polled - Suppress deferred probe error
 for gpio
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-input@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 11:10=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> On a PC Engines APU our admins are faced with:
>
>         $ dmesg | grep -c "gpio-keys-polled gpio-keys-polled: unable to c=
laim gpio 0, err=3D-517"
>         261
>
> Such a message always appears when e.g. a new USB device is plugged in.
>
> Suppress this message which considerably clutters the kernel log for
> EPROBE_DEFER (i.e. -517).
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Fair enough,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

