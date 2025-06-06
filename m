Return-Path: <linux-input+bounces-12727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 078BBACFDBA
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 09:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4B721663BC
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 07:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B60A2D;
	Fri,  6 Jun 2025 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lno+lJX8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33AA28468B
	for <linux-input@vger.kernel.org>; Fri,  6 Jun 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196250; cv=none; b=B6AsougYLPSmuCUwkJ28+wRjRTH28wTYtw+aiQj8ken/Nd0GhwPtZxBw87hH1BjnuEqhVpcrHKz6WNCQbWdY1mbrzRPKWLUn17A6uZ2KX+YWUEBBYCDZMan1bmkbtqAdt7eBDygBbwu6rrv6eO5rlI2a60bUVJSI0RKHWKoYkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196250; c=relaxed/simple;
	bh=wPoBJxhkcFhcU1dhyc7aep8kuC84kUm5vq3DmgKJjwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSm1itlQwCqoCrQzDTzkaxMbD5yIrhcyV7BtEVZADZLNlrxiiA21UO0BxbPlRUMg5EGPq1NqPDIRTWX2C9DTk65fMevGksbCRQ1+Rniv0BsZU3Ds0jgDtNewdFrEW8RXQ2Qnu1AR4KsExOEPGk2KwwlfbaM+T+7YpnpuypT5AXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lno+lJX8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5534edc6493so2188592e87.1
        for <linux-input@vger.kernel.org>; Fri, 06 Jun 2025 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749196247; x=1749801047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=;
        b=Lno+lJX8WqJR+mzXAc5AGTxJUjEoAaFEPVXyvQGDidocvtFCUJdAPuIaz57V6+nvA9
         YEbvPLN/g8PHUapmW8JcNIaXJQeBD287qC9hEF+1v9EULlM4lkhcV71GNTfYPZ7iJGwg
         kSVIBqL5imCO/8sn75cF8urdO1BsYJSnk1jvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196247; x=1749801047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=;
        b=LVxGm0OV/3DbXLPtLjlM6f0ThTE2KJbxNv7ZwcAtydpHUp8rN48qacUDMenB6tHwtM
         VSoMmdamrbZ4aPRzh87FanCc8XDVGp3avWM/G+fDXG8Xp0VBdR86GDGVfjJAh8BbM4PG
         rQKwXxmDl7OBzvyCBEsn8bkIGqLoX1W9dIsFYWmsv8PHWyqkuPKTTSPZ7UU2L9H/DkAW
         zH9gNpcoo9GHn9MJMe5NUZ2gsO1dXrnVuqf3aRSYyxqwvzcF5oIKcUT9NdgJO9SozUfD
         oPvlJjvTvONyjCiB5msw5lCwNn3Ltzhyf0uNU8ge99zmOWSpMZF0ip91i7XHe6f8pknz
         MyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIvGXHZ7eE7MFSRa7pr19tXn8gS3rT8mwCd1jHVeDsadJaLjO+Fy5UFUwWPgqrD6THlJvwKbaPlGX2GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2CwLgPYsVDkhQzjGmF7ojApd0CWxkSZZ4Bo8xfjNuxtRP3pv6
	upQa0gUegvyaOA/01O7m0c4XjDQ6baAGa8A4wb+F3MatQ1HTLvSX0QzPS2dwrNPStJuY5NrcPR5
	WZX5ea0c3RcE4Head+XkX+OwALBz4ewMF7rCSgKYWVCeQ/JZT6Ag=
X-Gm-Gg: ASbGncuqyT1yNPXMJkOk8W5DIYiMoDMHi2YURFWCKMmBES6LVaA4sgYZwKLb+LDtB+c
	NTvxU94I1orRN9lXsTaQ9kHV+I78eFImy8CjynwZ7gqUuS0lw732Dm2TPlpLqgMqn4EgSFYJosj
	4gOsSAH7fWmhWAxkq3sJ0Yh1sRseEUs+GCZHq8s7zA7CPwiBw9vxaBiykDGqTk4BloBfq6mdo=
X-Google-Smtp-Source: AGHT+IFbKR4s9CitEfgNJcsl0QhC9Vk4xSWEUHEwXIP7bIcoci9LebkzJqucGfI4/l4+Z99afgP92CHraRrtTZAdj/I=
X-Received: by 2002:a2e:b8d6:0:b0:32a:8846:9776 with SMTP id
 38308e7fff4ca-32ae70d541bmr2192651fa.22.1749196234912; Fri, 06 Jun 2025
 00:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
 <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
In-Reply-To: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 Jun 2025 15:50:23 +0800
X-Gm-Features: AX0GCFt9WzCgD2IIEFQ5utFqrLWuXwM5tZhCHvVXVAvSJ22GZSGtAIfEBPnfCtQ
Message-ID: <CAGXv+5E3bJf0o8y4kve_f+EefKqcOeW99VA_HcgKRm2+Bj+uhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, Apr 29, 2025 at 3:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> > longer boot-up time. Power sequence timing wise it is compatible with
> > the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> > out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> > enumeration, both shorter than what the eKTH6A12NAY requires.
> > Enumeration and subsequent operation follows the I2C HID standard.
> >
> > Add a compatible string for it with the ekth6a12nay one as a fallback.
> > No enum was used as it is rare to actually add new entries. These
> > chips are commonly completely backward compatible, and unless the
> > power sequencing delays change, there is no real effort being made to
> > keep track of new parts, which come out constantly.
> >
> > Also drop the constraints on the I2C address since it's not really
> > part of the binding.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Reworded commit message
> > - Dropped the enum for the new compatible string entry
> > - Dropped constraint on I2C address completely
> > ---
> >  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Can we get this merged for v6.17? Or could you give an Ack so that
it can go through the soc tree?


Thanks
ChenYu

