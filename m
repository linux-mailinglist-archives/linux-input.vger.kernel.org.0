Return-Path: <linux-input+bounces-12532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC327AC0BF1
	for <lists+linux-input@lfdr.de>; Thu, 22 May 2025 14:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D76C6500C50
	for <lists+linux-input@lfdr.de>; Thu, 22 May 2025 12:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C9228BA81;
	Thu, 22 May 2025 12:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o9a92RWa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2C628B7CC
	for <linux-input@vger.kernel.org>; Thu, 22 May 2025 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918149; cv=none; b=Yzd3c6jxFXR/4Lkq4vbyMKv10HNzCo6Lmbbvz18JgfRRRpBk1nbTnyiEwO3Jb+WMu+UJgthNM3VDDI3XRkYoxUKVywfoQIpIsfReEiC8b1KHGhDfESfS/8Bwn32l+ebLPhStn0JHPsVLVg3ue47plLi9Rf3ZiN/vu6GrUNNHU74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918149; c=relaxed/simple;
	bh=Z0gHB0HaajNHKCYvI4wM/4KBuF4dU3pH/6e4JlH8Fug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqbU+kBfE4Z3QEtmv53KhjlkXtoGOVMDoVxFZwkxb6K0cxHu9PQDutGXvHcHGiikjOlp6DZSbCjWeZ78zgsaIQQoxpiIAphLcv9gxCA95o93+hxiIxkSfUc6+LCp+1CtUQz+o5pg7VvQUNDIJW04PzKlW1ccbswSRQZKXdnCoKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o9a92RWa; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32805a565e6so80784061fa.1
        for <linux-input@vger.kernel.org>; Thu, 22 May 2025 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747918146; x=1748522946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0gHB0HaajNHKCYvI4wM/4KBuF4dU3pH/6e4JlH8Fug=;
        b=o9a92RWaZbEQYf355kFx4er209zmHK9J6PloQmPpe9wSN6GxUYpJvgIOfxUdBeqkMz
         lqbgHsvs5xGzCM3BjywJMcEzMQG9NmIumS4sdbI2wWZW5/5Z9LURGhCeXkv5Jk0579an
         ojugdZyQ1noe/dv/3k/7VPlPYMyXZHxGVNjmQYJNY6Ry2IxHzHr8gMj69rj8f5hBAknI
         mTMpnlGlqiYzQF9GmvjN7CUPvbVlA+99c94pwGeDMrQViIkZvUq9hBusLRjYNj2v6Tg7
         Tdh2ZEIkritbVRbOU3gDuVt1jCmzt+erqGWmVgRePPLh/m3WQOvfd7KCdcxrOvUMUgzj
         LnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918146; x=1748522946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0gHB0HaajNHKCYvI4wM/4KBuF4dU3pH/6e4JlH8Fug=;
        b=beE34ZkhJoH2c2Sm6E0NaJGGosGsvgRvhFnzFEpr9vZZML5c5MITNoaCqRTwIOY8pa
         CvV+bmtngoEebwE+GeQYYBe65h9b/q0fhBBinSg+IMm1V6mx3gVIfESQxKcmuNlhfeS/
         Z8T/ywhXe+0gzfxodiJGzpggBh2WIjrsyNQws2GX5gy6ij4UqNUbowKc3cBDVmwQAucq
         U94mcMCxE1nqD9k9pYgR7DVrghhSeYxgMBqgquMMNcULzWNi1WmjHH7INM6xCRFKFs9n
         eiLINCBck2V5l/YRcrJPVWMqrruPeoat/ZjK1ifp1zg4IbMOb5e4GZqmv1bTHWo2TGCR
         S8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXHLplBWUTTPaiAKZxTHc3L5RKSRbkKdUvF0POplJ8jeYPVvYu3zq8H9PQZXsrRxjrJT1y+lrRnNEIgRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4eA0hq0if3S/0bC4b2/7op3VdrXVLWyPdDrVENsmzYLeDkWk0
	9DslwmHhEuylARqWRoZnO8AbFX5MLbBv+vZ44/yoXXb+wgSbfdEz5AkhgRXDNWB6T06W1qzTk77
	zaPj1+2Hmy5l/j1ZZjYAnTFZ4gnEzXCvfRAPb4lwf4Q==
X-Gm-Gg: ASbGnctQ4qAfmas08UD2cPOtvbUSas0cqgGDR8YuQIhUD/pnYvb073lYYAVKP/UrgO0
	kfnHZff3hOXal9Z07SYnwjmYrnWrGLcKy5ndu+Fif3jc8aRruNrevw7kV/WyyKuMhqL+d+L3bFH
	jn0fhdOxiF/3doYv0Y9RFmU4DDQdNM8eNyscFVpd8a3YdNpEPbYNtvOym6w+2sdIdJ
X-Google-Smtp-Source: AGHT+IEFpkVZ1pANxMRMncXMFAgbz8vtOXm9cMnMDXn+P/zwa3GMV6fwieHhRebAmrvNsxI2CFwNRESS/Z3OsyMMYI8=
X-Received: by 2002:a2e:ad0a:0:b0:328:c9c4:8ca5 with SMTP id
 38308e7fff4ca-328c9c48e0bmr79614541fa.9.1747918145922; Thu, 22 May 2025
 05:49:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-mdb-max7360-support-v9-0-74fc03517e41@bootlin.com> <20250522-mdb-max7360-support-v9-7-74fc03517e41@bootlin.com>
In-Reply-To: <20250522-mdb-max7360-support-v9-7-74fc03517e41@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 May 2025 14:48:55 +0200
X-Gm-Features: AX0GCFv8lXaIP98_tb3AUEaw6F5hqrO5BzvfYNqwXrM92x6w85A4_uKntjzv-9Q
Message-ID: <CAMRc=Md4Pf-fazcioaE0vjojWzBXu=MiypE2e=hYHBi8zQO06g@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] gpio: regmap: Allow to provide init_valid_mask callback
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pwm@vger.kernel.org, andriy.shevchenko@intel.com, 
	=?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 2:06=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> Allows to populate the gpio_regmap_config structure with
> init_valid_mask() callback to set on the final gpio_chip structure.
>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

