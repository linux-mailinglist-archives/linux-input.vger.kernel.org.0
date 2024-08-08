Return-Path: <linux-input+bounces-5450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0D794C384
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 19:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CF82B21AE1
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 17:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C26B190692;
	Thu,  8 Aug 2024 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mi4Qqzlm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3A190477
	for <linux-input@vger.kernel.org>; Thu,  8 Aug 2024 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723137581; cv=none; b=OmaTQId6WqiqAri2BRwxixDILMA88WsF51ORe5q5vy61Kt9FEfiyWxGVBeEFrWviWviDf/NEtj4/gWl4Y9q1pa6vzdiZw5Qghg4pW1GHn3aXkbtdM9rFlLfx/46RmSFL6oD9TTzpVlfigp9BasOT6Tgeqj2nFFzM0prijPnWTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723137581; c=relaxed/simple;
	bh=lsuG+EZA1Vx6q/Fv+7s0/FIoUtMR0zl1+rBKVZ9ncjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjSKe9B7jHg31lR+pWVoTwCamXRud0yHfPYWmjoBhsazWwfBnHnDJtVK0Q3dLKnhk/6D5JJ1ukkMinmME5JJq/VkEPjC1mw7L9I6aNR7ebIK7vLAUkSVdzppQAtV4DUvy0ZnuLWyCulHp9BggWzcd/3C0ZESdJBMLK5gMYEY1cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mi4Qqzlm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so2603246e87.0
        for <linux-input@vger.kernel.org>; Thu, 08 Aug 2024 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723137576; x=1723742376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsuG+EZA1Vx6q/Fv+7s0/FIoUtMR0zl1+rBKVZ9ncjk=;
        b=Mi4QqzlmnWnYrsL/30VZ0EmSEMy46eBdPIqWbgldrMQkp7SCz7aafBKTybKcR2szIS
         GdH2pZ3SjIIIl6zc17+CY9O8NVErW32AqBUXzsnVBlrC+sVyLWR6JIbXkbS+upIKlZzC
         UBljqI6kYVRn43kP2zgSIRYKizLZopUAzRQ74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723137576; x=1723742376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsuG+EZA1Vx6q/Fv+7s0/FIoUtMR0zl1+rBKVZ9ncjk=;
        b=TfAbzv6MJOY+0WQXyz11fhzuoL1p+fMASzhToVYYyTV4wClGa8KHk5IIrvD51InaCn
         y+yZ0ICwer4HJstT2J/gfzsTbTDi7HIsHRK5ZHiz5tDay69cZIjE/0dXj2a1YVgRiUPJ
         fb/zTSW80+A8RfTz6nBDFx3zTKf+oba+Aw27wRAjLYMBuqUe3jaoTUbf8pRD9wFxntpQ
         9yFETn7inVJAF9tg5yLrM4X+GBtMb0vFIW1M8XEZXPSE2Tew0sfmfii6wyMjeAt4f1Ti
         iJoDmS5562mHFtFppLN2V++Esk3A69jMRwmuPKwBmPD8xap4kKn0g1esKeJleo+jzc0x
         uCGw==
X-Forwarded-Encrypted: i=1; AJvYcCWQIoT6/eWCx2n9QFOGtWoq9oVYfqYEy949phKghE5VyiW33xHRYQaWDlKGodxJXBWVyV/NpZacuyWVJUlX2b4Hf8kxWaLrsYGtXrM=
X-Gm-Message-State: AOJu0YwJGXNgXRA8E+MDwgsWXO3+4jIRYVsAa+jse8OouiW+2bBk6F2Z
	Xm0D8WuLiGPAxO77MMYn0OwcpY0cIMZS00ev8xGW559CD9M9kfRiI0coXzUh+VZdWOfup6fCIEA
	gBw==
X-Google-Smtp-Source: AGHT+IEkc7w5Jdl8mI77b9rNLQU77YbFs/HPYJiQxuTvMB1lT2MCyQzJRlosdr0Jlseow+JRMUwElg==
X-Received: by 2002:a05:6512:114c:b0:52e:8071:e89d with SMTP id 2adb3069b0e04-530e5876a42mr2305237e87.40.1723137575500;
        Thu, 08 Aug 2024 10:19:35 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcac58sm763523366b.35.2024.08.08.10.19.34
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 10:19:34 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428063f4d71so435e9.1
        for <linux-input@vger.kernel.org>; Thu, 08 Aug 2024 10:19:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrs3719awLZeJR5cn7KDgW7Tut+rbHTW0JqGTj8ZxcTiRHO/EVMy0XHXnybS5kgNwmAh5kEGYffbThiSe8b0ENH+/0cqu4hj8eQWA=
X-Received: by 2002:a05:600c:c14:b0:426:6edd:61a7 with SMTP id
 5b1f17b1804b1-4290aa8f28emr1775535e9.7.1723137574029; Thu, 08 Aug 2024
 10:19:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618084455.1451461-1-charles.goodix@gmail.com> <ZnlGDCcNch475wWA@ux-UP-WHL01>
In-Reply-To: <ZnlGDCcNch475wWA@ux-UP-WHL01>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Aug 2024 10:19:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkHaH_oUojLCozh-C27GUaCgr_6V16_0XKJw86p5wmFQ@mail.gmail.com>
Message-ID: <CAD=FV=UkHaH_oUojLCozh-C27GUaCgr_6V16_0XKJw86p5wmFQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] HID: add initial support for Goodix HID-over-SPI touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org, conor@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	hbarnor@chromium.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 24, 2024 at 3:10=E2=80=AFAM Charles Wang <charles.goodix@gmail.=
com> wrote:
>
> Gentle ping...

Looks like Dmitry had some small nits on patch #1. Maybe folks are
assuming that you'll send a v6 or at least respond to him about the
nits?

-Doug

