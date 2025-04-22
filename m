Return-Path: <linux-input+bounces-11916-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC83A96390
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 11:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72143A8379
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 09:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD791EFF80;
	Tue, 22 Apr 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="027B8Z6j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C61EB199
	for <linux-input@vger.kernel.org>; Tue, 22 Apr 2025 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312535; cv=none; b=OtVDGFS+6m6tM/2oiK0190MXykyq2jQtRQ21AnmZmIe6XdNjVxMCdZcOEvla86FaRdefTjLI9ETRSshGB+H2tAv39vZ8Pq78qHhG5vKrUteg5wKfpMY5fTfkNZgnX8hUe9fMLHfFb8NQ1t+sGXLq/QyZevTZdDqIrQM6aN795XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312535; c=relaxed/simple;
	bh=dc4xZ3axdxlBmzoeUihfiSwNKtoX4SuR4oNDF5k5NTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJjzEuTZFmENMtzdUN7NhYuYn+4gAEiddFGUUBnoYgRUCaSpn1E8+xv1SjX80iFS+308KXFglJVqvoDFrB3guhTNQhGgRRZ7N+oMtwwiiRT9P23zhPyhjWjvrUrFMiddowBqnUMMVEv2q1fkEXBKTwJjFXdgITTbZ4Ih6v9OZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=027B8Z6j; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db3f3c907so44214821fa.1
        for <linux-input@vger.kernel.org>; Tue, 22 Apr 2025 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745312531; x=1745917331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc4xZ3axdxlBmzoeUihfiSwNKtoX4SuR4oNDF5k5NTc=;
        b=027B8Z6jYlj4S+ujHVi12BHBpykJkHuSDloRBE6V5FhH8FQhOdPxTp+ucpj9IuVIkv
         DpcSTQbGIAYL+Lfo6zWNX3n75lSD95HF571XLTnDyX/2kH8J7uiMbHLI6c4oP3jiN8dq
         vGujJdt12N8Mik+ZdyAalwD1jgtzH6O+xS/0Xwj7PgIt7rx+EZCfrbMjG33kXD82SZPi
         ekY1k9itD53wLASNI4EdePI7psmcF8xeFUgH22qez2v0nOT4CXEPtEWbpXoUkiBcoE6r
         9Kh+rg5B4qz1PwFyHpZqyOW2li2SqCYMMhh94+0kfNN6B6IE6zJiQdoYaSe/jFZpwDTL
         /cwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312531; x=1745917331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc4xZ3axdxlBmzoeUihfiSwNKtoX4SuR4oNDF5k5NTc=;
        b=VzpMCCEcYi6S/VCPdvY7upVLaREGD22aKvJ7LkYJuDDVl6T7I7PlQMP5N6DnLokwTj
         AMS122j8UVp0bdNqk/aJRpX739kMBbWq4BQVDsbjgDy0A8qQQ62hirFdWUE0LwptwsV8
         TlnJY667z4bIHysv9IycX/qExcrKydx3j2mr7+000VMIX/SAjujTe/RKLl6guL3kyWbr
         UeCtMXii2CA5vDaNI47ZOvzqVISywXuWJt+Ji3ZYZGmJ9LSEOk5yp/RKZSCCxtTv730O
         OoJf6G+GsqDevd/6fj2X79u8yuV2QvuKfv9lH8dS88JsAFX+/bzcCzc8oXBqv1Vkqp1j
         3MaA==
X-Forwarded-Encrypted: i=1; AJvYcCWTixwPzP1yAEsCgHLAV6or64JLwwtG8JmhzlMvSZGkoofOVn5tnKu9HTKJo3CDrFZZ83g+6w6ZtMwCCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGZsXmeBDfroNLF+0nuPsEYldjc2M7FXflB+yVTdYCNNSmP9MU
	Ix38y70RPZQO7Kqp52PYfFKlqZqyfZkLYWG7K4QnnUKNlDA/8AXpv/MUhHrMU2ZRfoSpzfaKlsq
	MGqSNJe440O9O+kbmT8Lu24JBBWP9pvulw/W/CQ==
X-Gm-Gg: ASbGncuXTnfUSkL/7oJ8PPEpftvr4m7fCbzFvbVCnsYxweikQiViH8/hbRbHzID4rKJ
	mqA1zbsNPuUJ1i4BWgnEF58Exee46UTWLMN/UNBvuWYta/oDQasVFoSysdxrwPrJJzy4uDYgnqL
	Mo0ES8rPW1RCIcqrKoIwvU6Rb9O8lXXEu7/G7fnG4gBRtVOImg+G3hTA==
X-Google-Smtp-Source: AGHT+IHXSN/8gRyaTry5GtiHwesoyr/kZzwfBfVcH37VqAhFNMUYYlznpyD7bdjOzOI5Q3wO1WKwnhzNohwl7Ztd4W8=
X-Received: by 2002:a2e:8e8c:0:b0:30b:f469:47ef with SMTP id
 38308e7fff4ca-310905bacd4mr38362531fa.23.1745312531271; Tue, 22 Apr 2025
 02:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
 <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org>
 <4cd7b1ea029f7cdb6312f61b1008116b58b85efe.camel@gmail.com> <CAMRc=Mcd=6tgk-NwqrSxes96tkV1PmxKFNwDV==XAUkLtDKj-Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mcd=6tgk-NwqrSxes96tkV1PmxKFNwDV==XAUkLtDKj-Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Apr 2025 11:01:59 +0200
X-Gm-Features: ATxdqUHl6k-99FjEYSZJEDU0K_B9nBaJmH013ky1sQlNl-LzWnGU-Cxp14xGbos
Message-ID: <CAMRc=MfBsyovZ6dVLZcDC37aTG1XeGvTMaUTRGfUcEhkVXHyng@mail.gmail.com>
Subject: Re: [PATCH 3/3] Input: adp5589 - use new GPIO line value setter callbacks
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 2:31=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Apr 15, 2025 at 11:06=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.=
com> wrote:
> >
> > On Mon, 2025-04-07 at 09:19 +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > struct gpio_chip now has callbacks for setting line values that retur=
n
> > > an integer, allowing to indicate failures. Convert the driver to usin=
g
> > > them.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> >
> > Let's maybe drop this one? I'll send a new version of this [1] that wil=
l drop
> > this driver...
> >
> > BTW, I can already change my v2 and use .set_rv()...
> >
> > [1]: https://lore.kernel.org/linux-input/20250313-dev-adp5589-fw-v1-13-=
20e80d4bd4ea@analog.com/
> >
>
> Sure, as long as the new variant is used, I don't care.
>
> Bart

Dmitry,

Can you still pick up patches 1 and 2 please?

Bartosz

