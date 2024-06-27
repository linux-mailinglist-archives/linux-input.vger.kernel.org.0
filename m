Return-Path: <linux-input+bounces-4656-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 003D4919CEF
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 03:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326631C20929
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 01:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB79D613D;
	Thu, 27 Jun 2024 01:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHxm45Wx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8031E5223
	for <linux-input@vger.kernel.org>; Thu, 27 Jun 2024 01:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719451469; cv=none; b=aO6itpSYAU5pvJ/d5KB+8rKRptnre2Mm86pvm7BpaxPdpXhjH4QCJIGe/ov1+hOs9+WJuBgKbcJsf5IZhak8X0GgSooen7X50zknX7P+B+a9ht5QaYQdMOmJXuLWuLGbNfv8exs4rWYfVyWESdxl3pxl+8h75dbHmu2d2brbhuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719451469; c=relaxed/simple;
	bh=okDc0cuuSIf1l57t41xUr1c3wyqQiWoF0TYgoxrGvZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbuMhuItEyE8SN5Joq8r5YERNLMF8nwUS8wqH4olHG4dvrnGu5nG+bOFgEcWPmnoe/xeKXRHoZOgD7PxK3BKchlDCP7w/LGGlGXwvEn9im/v53Ku87lS0pH2fajofnUYvmI9zdrg67GSb303OdrUyo81Dlv4MmEW9vQ+7Mrdej8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHxm45Wx; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfef5980a69so7277283276.3
        for <linux-input@vger.kernel.org>; Wed, 26 Jun 2024 18:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719451467; x=1720056267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ495YCxMt4o91NvscAPBM2TalAX8peDvOQUdp9mfNM=;
        b=lHxm45Wx5+vvE5PJWFs6fjid3+tr0d0S31aNXbtjbLdIuIQvuj39jKLme2AWNaA62e
         HJW5/9nkudwhk3VwuoMLQ/0riRx2i+mUdgDgcADjR0ViXihjPkWo7KnWT3vq9chdAzDA
         45GTHhhEKtPgpyiGYXFxgWa7+BR94747b87oJV5LXrG31FVBpmG/lFb8JBdB55DsykP0
         J+M4Y9n0xY6jeVXhrz7iT1AYP91fAD1Zv/pX8btL+0vOmFieW4F9Sv5kkeSA+uqXCOks
         7hO0Xzik5SlxIrmNcbouf5Wc7O72Yyov9FzaYSj8AUWPmB4IAK2oYmxBs0OLb5YUr8xT
         n1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719451467; x=1720056267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ495YCxMt4o91NvscAPBM2TalAX8peDvOQUdp9mfNM=;
        b=pQRyna4YkKN+0W08dxstqhsR7Y1YdaAND3OkbkFRvLJdHvghe6E+9PoY2WkH1pOFWh
         h4/Vn1Hcy1435K9DdolPbXxGk+t0oQQXO43IQDYFt3icA9fizdfeXey++NKyoyb1q1Im
         BNUBTQS14jRhoJq2su/GKRMzyiEMe6qs2aqIVc4Aypk8sr3nvI15Z1s0wUr2/tWTpvQM
         LF/f+s287RmZFAci0O72NjwLWbyTsWbYy90EfBcyfFl1zIQZJ2fAjmg+Y9zCjXwhNyDJ
         Bq3/yhbEaa/Bz3QpHIsx6JmRYoD4dJ4pgWb7MczxlnVAnVuJzA+I4Ypd8l3KWfpWEjGw
         LiHw==
X-Forwarded-Encrypted: i=1; AJvYcCWzkIYk/0Xmz3xh3hs15EunOEc66dTVGYVcN0mpIpUIC/xgw+YXlzDtrxPH6Xm/ZFRRJv3JcDzQpm/IeCLgzMyfoaWKdxLQYJStQQI=
X-Gm-Message-State: AOJu0Yzt4FErxciRqtB1966NgFbjNWqF/k2936QDNa0vG74WSVoOrtO8
	e904VsSgpDLwu+XFuqpTVnVH2rwMPdi8qKdEVPtdaaKKsH62/Q6tT+bKy7olTjzbfHDR2AqBidM
	qpDa5oYHK+5HAUnny/Inc+MBHsTk=
X-Google-Smtp-Source: AGHT+IFkbsKkE4eIdwmpwrHuPJ7AxQ9Qobpf6xJndRYc2VFOHv/mARlgbNaq9J+7rK980jSYUSqF4ZONkDO3+0gzOCQ=
X-Received: by 2002:a25:bfcc:0:b0:e02:2c19:493f with SMTP id
 3f1490d57ef6-e03010b11ecmr11725682276.57.1719451467316; Wed, 26 Jun 2024
 18:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624065359.2985060-1-zhoubinbin@loongson.cn> <ZntY8UO-VIW3reL4@google.com>
In-Reply-To: <ZntY8UO-VIW3reL4@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 27 Jun 2024 07:24:15 +0600
Message-ID: <CAMpQs4LmAc6_-2KHEnZsnaMdbUWVTE_zhDK8W4GEtnBJyr0AUg@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Add driver for PixArt PS/2 touchpad
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Jon Xie <jon_xie@pixart.com>, Jay Lee <jay_lee@pixart.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-input@vger.kernel.org, 
	Xiaotian Wu <wuxiaotian@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aseda:

Thanks for your reply.

On Wed, Jun 26, 2024 at 7:55=E2=80=AFAM Aseda Aboagye <aaboagye@chromium.or=
g> wrote:
>
> Hi Binbin,
>
> On Mon, Jun 24, 2024 at 02:53:59PM +0800, Binbin Zhou wrote:
> > +
> > +static void pixart_reset(struct psmouse *psmouse)
> > +{
> > +     ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
> > +     msleep(100);
> > +     psmouse_reset(psmouse);
> > +}
>
> What is the reason for the 100ms delay here? Is it to prepare the
> controller for the upcoming reset? If so, could it perhaps be
> defined as a macro?
>
Yes, the 100ms is required for the upcoming reset.
And we just use it in this one place, do we really have to define it as a m=
acro?

Thanks.
Binbin

> Thanks,

>
> --
> Aseda Aboagye

