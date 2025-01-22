Return-Path: <linux-input+bounces-9477-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D5A197BE
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 18:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00588188D256
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 17:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B10B2153C8;
	Wed, 22 Jan 2025 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W80OyVZX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1B215179;
	Wed, 22 Jan 2025 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567663; cv=none; b=K1E3LV9BkV6dfI57YjdNwmNSwAW6ehhb4kHg/rtNWHa8dtr0Nap3SDnMCX5+vr6rgROujnG7lPwev9vvXx/ftqH6k1M/Orpiaa8xrrh44FsakuhsljvniwZIPBEmQzZjUWVPJISXfw54NLzNiBsNQypjboUp1V9fSxyLUgw1lAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567663; c=relaxed/simple;
	bh=AruiYIPk0+P1omcUmBeZp7B+GTK+VH7y/+jM2mwR2lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nI3QSku8IQOyUe5AM7WW5EyzbugMjR4Sz+GFVZmmdf43rwh1qpXJqK7Tim2tINfzo1kH9C9J3SCEYuYssgAAsqftrT6AtIGKcl1q82mHxAE+J5DehaTq8Jf0CgAgL26IC/CGLIi7nQ+Pkw5/T7NbPKyHB8PrtEgmuNqRoL/jStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W80OyVZX; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e460717039fso3039276.0;
        Wed, 22 Jan 2025 09:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737567661; x=1738172461; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GtyY1cVaBALO0x9itDiGJGSMS4qefrx4wqmN5pEG4Q=;
        b=W80OyVZXKoYp3Az+uucczJ2KixOTmppmFPKU1S00hJZDrX3agW7S2z+oyVrQfBZZNe
         qKi9FOeZOha4O1Zx1MTkN/mFmOhOjd8ABdrONUJ+/scBX+nr5ZXAZs+ZYbaZgst8pp1g
         OAC1ksJV9m/d/P18O4zpursmMWOcDz67izB4JUl4/2CBpQkgiCG5mh2EJDueIKirEMjN
         fWHGJmQL4BqIpPXO1SvK9s2Tj3jToDdwqixokr57kQcU37lYm8J8bMt1sYScKG/oWHGV
         3kDWe0yPgK2Q6xV3eJfKursjFh2/ijd5dKbnyasaRqWblQBSa+PmUcIWSLdUX+lphCYa
         Picw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567661; x=1738172461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GtyY1cVaBALO0x9itDiGJGSMS4qefrx4wqmN5pEG4Q=;
        b=JS/dlJ0w0W5RV8AlQqPXNLzWy5JvNVKzXs4GkFXpm7WHKl552OG5Db1TXrHYTgUbv1
         tUxBA+QYX5V1ym2vGI/RuHjSJI16t2kXPApDgOEOgI4e341KlpHYqdMrQ1pOKGMWvI1S
         wqV7JrL+ZPN/33A6hiuOIffTNaWaDvsYmZs1YuWdPv8jd/QVnJJojDmYrqzUZam/m/A+
         E4S0KUEaZbogzItqismhUfQV9gDmwNEHTB+3jG1rkhSye3nlLWmv1+alTAItw1PTDmVu
         AkF3kBXj8IFybhvVIKYyAGAGiYN+tHzY6d+x1c5NiUeUtWzc0GVS45drkuEvKqPdlBid
         NDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdMT4KS2zxDNz3LDtmDw8X7fcdcvJpmw27anTpSkSp9PH/uGZxtsxxYhVe75caRUJk8zoFxNQQo4Ea@vger.kernel.org, AJvYcCWO0aL4uL/myD9YV03r8jpeGD+vNnFbxSjHAyHPRJU5i8aKIn1VQh0hxbJ4AJDVoBeRdzOouZiGC4mUMsSi@vger.kernel.org, AJvYcCXnevD93LE2tsqBiHj/11ZYP0775sEZgDMrD9E2j9kzsZJebPGRDPDFBaatXv7feQwHuxm9VozF4N/2To0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn4rArKA0sls5qr3t0VM+6JO9FixFpSNcPnEaHb5tEJcw4NS28
	lcEEI4jApjas5515DS4phzDAcKtrh7lK6t/swPyiQJ7hB3sjDofMWsdwxxCOPTnJD4u2CA+N4Rr
	K9cOpsC375t7y7zp/oh21dALfoBE=
X-Gm-Gg: ASbGncs5y6kB8OWuSGYQ5+AXWXjXWxhmAiy2GsqXM0RaeDyBoASSTQMvfmUchjLH/2J
	vrfiM6SpgN1Cfrm0KbHgezMb3Th5HoIjCEFzCzi89hoD61UtKqjCZ
X-Google-Smtp-Source: AGHT+IFd650glm13bU2UYBiJTAE5o7XErEbuE5bAZ5JZaThH06YEG78EurncTUvsjymmBNUVyUAlYia54MjS7SuCnQg=
X-Received: by 2002:a05:6902:10c7:b0:e57:6644:ea3f with SMTP id
 3f1490d57ef6-e57b1051acdmr14913763276.15.1737567661245; Wed, 22 Jan 2025
 09:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118-z2-v5-0-6d38b2582169@gmail.com> <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
In-Reply-To: <Z5CNx9natNYmJ5il@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 22 Jan 2025 18:40:50 +0100
X-Gm-Features: AbW1kvYyP8Dx29asGtYcXu-mkX2Tn_inSrOkAaAFhCNj0HIYUTnNwU_fXtcLL2A
Message-ID: <CAMT+MTRKpgHBVVHoeWGmOqpF9vzZV3CTUdg4d0oOnutubeTFaQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     z2->input_dev->phys = "apple_z2";
>
> Phys is supposed to be unique, however my understanding there could be 2
> devices in the system?

All existing devices have at most one z2 device, and while i do not
have visibility
into future apple product decisions, judging by the current stack, it seems
unlikely for them to make one that needs two of them.

> -static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
> +/* Build calibration blob, caller is responsible for freeing the blob data. */

A comment on a previous version of this patch requested to not have functions
that require the caller to free the return value
https://lore.kernel.org/all/ZAlM2DzMmwzWIZEF@nixie71/

