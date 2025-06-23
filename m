Return-Path: <linux-input+bounces-12994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F9AE379C
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 09:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485AF1627F8
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 07:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916621F5820;
	Mon, 23 Jun 2025 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WS4BNiJG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EC11E5B71
	for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665561; cv=none; b=GAxwsdL+iGHPh/MUX3xDIBHKrA3KNZ0hNcXOz4n5bMgFeozmB+eXxBPztVPb2LP85awyPoG8A0arFOSNNChNaKewxbKBFmQyCJHlpGjba20PTJu+c2YgP1sqk8tO2aF6YC+ZN6atWzwEzvEaTS+djzMpVAsBPXvvEV4WzrwbqYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665561; c=relaxed/simple;
	bh=pjCYEu+T8+MSu+Y4AtQlwN2m/aFPkSagdtGGVLNEyiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6HBzAeJmxLZBG9E1v03R2IMpL/IRSUsQ8aGr8WD6E5kHKrBKA4Qdbby9p+0LVAcI3nd6kvnEnvpoXttj9sCmlYK0sVipxezts3Wiu5/aH2ON9HLD9kLGJufDAAERwGnMsLOPwRnBO4E7ZSJZ0moA1UkaKdhMZfvA06g2CkPaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WS4BNiJG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b584ac96so4019768e87.1
        for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750665558; x=1751270358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smoBqfSuZnFdhyBkSJPUgnQLJaDXAPEi9w2rGP6B9Xk=;
        b=WS4BNiJGbaMckDcZ+88ElGm2nnREtxUBndMHfSjZxhoGecjKP44OJZQPiOsw+8ob4m
         p96j5AIGl83hj6q2u3Z6du1ilBLJy1QAw20X0je3mRaOyWXDTRQtgwtazU8LLSdMdS2+
         pn4kIaFhxXroseFGRuGhYVdfbLTNRsxz2umEmc113Ebmydn0IOCJ3E575EA7jK1lIDdJ
         /1hLkykLQu5AmFqlqyybG3ZGCzA5ff7/+Zq7vzdtTf3dp6vY1f5csXjBqGndv1gyDUlO
         YZ7ZCMZNMiUyBMEgmrRASrduhnM1JaHXLkwzYJ54gBEZvl/PDx19/p6u7y6CwggKUWbg
         p7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665558; x=1751270358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smoBqfSuZnFdhyBkSJPUgnQLJaDXAPEi9w2rGP6B9Xk=;
        b=SB++NDfEMn41TF0yozdcbwJ7D4KomFqGycI163uCMxgBXlUsGaU7MEYO/YiDUpIcyE
         vewnnt2eKE7bxJP9rL7MwleNVZLZ39QP9K5pbYY2dAddRj+j4kmWjjdXjKM26xMOLl3v
         8HGg6gkV9QHAV9jOJoj7vynn0BeupL3uWhlaIMEte8MFQAj/VUrJB8v2uxGJB909AmE3
         hEqc/XBEC7LFS/AbhCl4gNzUiVDq2Mtt5ByaNxpl1exssrHmRZXXfvGIvfzewBVtUSvf
         7AXOPdItgUiis3iEI4G0yfIsRPOtSLKitryKLcQumN/UZwLmY0feZyoZilDD/EC+6TV2
         tcKg==
X-Gm-Message-State: AOJu0YwAalWgk12R/pu1x1umcDjrcuQuZJAJOZdNKlhHtmyyrSmy8t3j
	FSLxuvlz9Hv3J7HlQr8CRfNIazuOETuUdJdomn71hTIRU2CbvkygcgEDBqKJcWFd5YPdZxqZ+a8
	W5ezOfa+0SUr/gT/hWxG5b4GOLCGYNaU0hrQoCRUi+A==
X-Gm-Gg: ASbGnctsNS7wiNoMKap/rd7OmBx7Bn7hDoKAtKkORK5B6c6yX6LKAEUuyrfBuxwbAsV
	WDFHmXb6DL3KajEQd+8d/1wKXmGLdxfDEgGHQNfXSScLd6VjrppOMVEwRDb8za5Jvf0muwcQa0g
	7zNIKe/pBVBD0Lgxo3Tg7uiwvrEfoMr7nl4VzXpX/mlRXFjgehTjyu1uwQTbQnQg6GCBlH19TX8
	w==
X-Google-Smtp-Source: AGHT+IH+6LTwSV3jwUqV3aPvfnzYjXE5iOgYqlBgzZnEHwJGAvMDmVnjyWJSTqk2dHdZCzhIYeV1I8Q3DyqdMFZFHSI=
X-Received: by 2002:a05:6512:1056:b0:553:b052:aa8a with SMTP id
 2adb3069b0e04-553e3d259afmr3639343e87.55.1750665557990; Mon, 23 Jun 2025
 00:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:59:07 +0200
X-Gm-Features: AX0GCFvWIu5ZKsG_6ucxVHVp5MEFaQgRXOfRuK6Ma_rPpGs558LExeSTdVQ0gY0
Message-ID: <CAMRc=MdAKpmVNQe=5yrGkVdmbfZ-Bsh_0p3-mrifEF2x1SVBhw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Input: convert GPIO chips to using new value setters
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Never got any further feedback on this series last cycle. Resending for
> v6.17.
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the GPIO controllers under drivers/input/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (3):
>       Input: ad7879 - use new GPIO line value setter callbacks
>       Input: adp5588 - use new GPIO line value setter callbacks
>       Input: adp5589 - use new GPIO line value setter callbacks
>
>  drivers/input/keyboard/adp5588-keys.c |  9 +++++----
>  drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
>  drivers/input/touchscreen/ad7879.c    | 11 +++++++----
>  3 files changed, 18 insertions(+), 13 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250331-gpiochip-set-rv-input-bc12818c5732
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Dmitry,

Could you please pick these patches up for v6.17? They already missed
the last cycle and we're on track to complete the conversion in the
next one so I'd really appreciate these going upstream in the next
merge window.

Bart

