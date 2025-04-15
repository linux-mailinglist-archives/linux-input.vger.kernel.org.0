Return-Path: <linux-input+bounces-11763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D3DA896C6
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 10:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 380247A4B12
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 08:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0769F28B4F6;
	Tue, 15 Apr 2025 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H40CaPJL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A428468C
	for <linux-input@vger.kernel.org>; Tue, 15 Apr 2025 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705917; cv=none; b=UGF347THBEPJNU8G78DXXZgOUXvzJnHBpkGPBddJOkEXuAvf9MWkW83+L/UnARci+XJYdtcO4fWvPPjUJXzNaxoI/RiWVDogRd6gO6wsMB5hWkwveyqa7JV78RQyPlD1m1lI/Sd9GFauF4Wm9YFt0el8n8er2famXHgqbKK3Qek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705917; c=relaxed/simple;
	bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ny5lh8VP5hThIGAwu15yyhpPbJhtGgcz0NTCVspspjq3oR34LvyLhykpoPyYuUG/fankei5QQUycB7lvx2qC0p8UzGFSiZ4QNRHa8t6uiv6Ee4yIGdacmbj4sK6s5FQtp1vxsW62H91fjvccnwnmIa07ce1mFnFmz2+a3KQUHvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H40CaPJL; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c091b54aaso47263491fa.3
        for <linux-input@vger.kernel.org>; Tue, 15 Apr 2025 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705913; x=1745310713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
        b=H40CaPJL8XETrIfg/KZlt4culzIj5IK3oUjUHAxBXbc5jY5TtDcMWxUxU/kTV1LokD
         4Ko7Y3yIhouQNwWAhH8+X4XxwC4exAdT1SDkr4Gbww9C3jY7iec2RYV1DfBsEuwYxSbi
         8k4jTzIV+izcINn7vCinToOaIEi8G3iziolRI803AQenJS9/99W9mCXiaT9yyLazwMgX
         25t9/05lBajlqbaI93eAeZL3s6V1IwCOR1KP4yYVb8GHGfVqwon/5cMGDOt0FQ6voe3d
         pgDH7RZ8krS52135oNmV14Ov8DCxaZ6vkoqzKyqk0ygb1v24JVRKJrpuj+Z9HfkgefTt
         4L5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705913; x=1745310713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7riYPHIhu0uBRv6x+RWfsJSyYqOl1MEa443E4KREd8=;
        b=AgRiz9usiDI6H7jUv7dihwKrVusL5xxFn7cZvAd1JzWH5e7Pmv+/4jRFf70G1gLV4I
         xh/UiLeJxvYbVEi9W1AELf2yzsBzfvZznHh2V2mrq7C9a7/jeegojHU0Ds32hyIa8miQ
         Zm7g9WS052HtdIKTQqT0r2Qic6Lf9ScYAeYvVSzBNHypm7TOnxwlm9esPtS/okaOj6Rk
         sHG5Dcfd4ZRcM3Kt/WcmSiBATs1XX/TBZn48v0BXVzLw4TqIirhQ8AlLpf/K+pr/Tv0a
         13VSeixUMOtID+8vW6/cG5OdZB2a8O2VjyaKQ+Bl0+AaJpyU5HiJu1UqfWlLFbM5dt7r
         juDg==
X-Forwarded-Encrypted: i=1; AJvYcCXH5o0LrZlrCDdhK5o/Wa8UMy+HfBu88vRGt7F9C0EaQ6ymu+XPPUoj3QaJVqBBj8skyhfaZBNUl1wTzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPin20HROfUBJUBVyykowM5tN/sRyADYzoMSc17jr/kJSgCcVh
	SN4W402uoGK/GA5JapQ3t8MHfmihSZab/lmGya/+9cPokRuHnUMB2XetgjOCbYLos7b6HePXI6R
	WQeC4IIBcITEmaBENEyCJjqROS/r45dC4Bg9Ty3XBPxeaRhKooWE=
X-Gm-Gg: ASbGncsgdYoRU6oMsjner+ACwXVXife2z4UCNEzqZ/UiFQ/lGRuiH1zwS6P18jYezHV
	AvsvcAWzIkNGG10GST7AEw6sePB14s7NEKsb2efmaCbCpgXx3BLSJJ+mr43PDxuUZQ6gaBxfj3G
	IYMPcu9wDP6h8iwX0FS3pT0Q==
X-Google-Smtp-Source: AGHT+IGH1ng3eemaLiy2FccAdv5wmGCyisWcTNC6F3IB//KuZUZl3sZBa6JyDHfOEAGA9K0ahHlVeoeGPs038wmjQjk=
X-Received: by 2002:a2e:bd85:0:b0:308:e803:1180 with SMTP id
 38308e7fff4ca-31049a7e306mr51922881fa.31.1744705913598; Tue, 15 Apr 2025
 01:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:31:42 +0200
X-Gm-Features: ATxdqUGjreib7Xgx47uV3zG2PDCmOkCmRcW5QPy9tyBeeK1O7_SOAKwD-7sRSTE
Message-ID: <CACRpkdb0Dy7m51R7ssrAHvs-PEiyEV0V19NHLPUbKqt77znQgw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Input: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:19=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the GPIO controllers under drivers/input/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

