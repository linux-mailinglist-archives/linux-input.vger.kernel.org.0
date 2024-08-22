Return-Path: <linux-input+bounces-5732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0495A94E
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 03:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3371F22F07
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 01:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7103979C2;
	Thu, 22 Aug 2024 01:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZxEyhtN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9DF6FC7;
	Thu, 22 Aug 2024 01:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724288617; cv=none; b=fQhox9AewM7CToWlUBSd0GpVy53SnjP2ol9TVOojFypO1djXJRHZNqzIiCZfdw3CQBlV502L1wBXnC2MoxqgAKGiJINues54IoUmyO9RIyAEdk+sK77jZLwVyR+7xdRzYqC4xJ1JVGEqT8nC+ocmyxOMumCylEWIPwsl13s4UZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724288617; c=relaxed/simple;
	bh=r7R9se5rg7N5lEUpA8br65l66pmINbKJy+1PiA1DI34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/YqMnHO1fQo3p0R95cZfoFhT2djcmoKNvvgHCOEkxjP28eYnl2APn+UcSyeOQMRurNomsqSdtx9MBO6fbSNyLKlXG+QeiofeZ/vMuH6As+tANMnAkjShjju7KaX4ti+uHcxo8Fz9nBuw8pMbVOG3H/jcbAhNeE+1iQCLS7uogY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZxEyhtN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-429e29933aaso1285705e9.0;
        Wed, 21 Aug 2024 18:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724288614; x=1724893414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r7R9se5rg7N5lEUpA8br65l66pmINbKJy+1PiA1DI34=;
        b=hZxEyhtNIeLYDW7e4UwOyO5F8/tl6uwoi4QzIjrhgfnH5r2eZ/8W77zyE81tO862ZZ
         bvh8OsfanZWXl2zFTWsqBrHNt6kpepo0wXE5QOQjrlWHe1LcVb7RegNeZC22+OlLTihX
         Za9yK37vyhYEo7CiTqVsOh52ys/r+dxVlGTsJUuhuyGJ749NQk7egSE2gWrvFXFrLC+T
         G4+ssxQ17Kf/nUz4GJoXjUSl8D6T9EnLfDi9eCMiHhcYEf0nX4X2Sko0ZgTzqyTxCfpP
         J35mn0z13kg1wT9yHRZf+u77Kv+GUOrYCbwZORfqII3KIeGgHljPsjYRqh8uH7SzAh9o
         ivkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724288614; x=1724893414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7R9se5rg7N5lEUpA8br65l66pmINbKJy+1PiA1DI34=;
        b=pq8/15fRUpNnLceA3pN0yTzD+K4LLKxwewRrOP9yqKs5EcTaGo4S3gbhuon7dPdhMk
         p+VfyVyvFQorKWgeCr8/cx5HLg3nuctfi3/g3RU0LJIVQeEcM3ZhhB9rwhJoXrFNIgzG
         gMH6QbyKGzct+WLCBSyxC2/foWbrFCrLzCWGwCZAKijKPlF4PR8chPqAaFBiQUgcRlUG
         E4uNMcoBsuIIi+96D+gCY2D1RUk0cWNWWezA4er7jkHGIPvFvHIpIzvRDyDIToZHLlnk
         sXgDy849QqNSZF+OCupzoTJ4Ywu2exwuSnVWJqwNpLlCQex5AEPaxO0K9+z9y9gbh+Fz
         /WOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtDU7Ei39Bt4jEOGFPr5KiNcWPpvFtPZsl/68dSEWd7l1jOrO8ZIAjNYpnZnvUbz1jP05q1NIInU0Xa3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8QVH/vJ0+iDYmfxALyK3qLKL1kkO+rgjCqbo+5xPjoa1/weWF
	HGSnalAJyNfO72WSlV5wBOfTh2DY86+yXJDfzjoFmAwVoo+4+YQqtumd7zMrCJNLj9dT7BFowaK
	st9mCGZaIMvNZYjDPHnGXuAWKcy8=
X-Google-Smtp-Source: AGHT+IH1fBTAXa00b57fsi2XRIpPb6JDnEyKgiEwWgWBIxbyUdvujpWQoO3He3Ae+dHnrFmksMRmeFlX3wCeCGgx6Kg=
X-Received: by 2002:a05:600c:4ed2:b0:428:f650:6a4e with SMTP id
 5b1f17b1804b1-42ac5637557mr1666365e9.23.1724288613271; Wed, 21 Aug 2024
 18:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com> <8a4c117b-7cab-4149-a9e7-c6214d6d92ad@wanadoo.fr>
In-Reply-To: <8a4c117b-7cab-4149-a9e7-c6214d6d92ad@wanadoo.fr>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Thu, 22 Aug 2024 02:03:22 +0100
Message-ID: <CALTg27kBYb5+GOwBz4a1-xeM-21DrbUh7eQyNkW9K_m6TdSwNQ@mail.gmail.com>
Subject: Re: [PATCH v3] HID: corsair-void: Add Corsair Void headset family driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"

> Maybe is_wired could be close to other bools below, to improve avoid
> holes in the structure?

Possibly, I put `name`, `is_wired` and `sidetone_max` together, since
they only depend on the device model and are set once.

> Missing newline.

Done

> I'm not familiar with the hid_hw_raw_request() API, but I think that a
> kfree(send_buf) is missing here.

The `__free(kfree)` on the declaration should take care of that

> Nitpick: No need to init.

Thanks, but that `ret` won't be in the next revision anyway

> You could save 2 lines if ret was initialized when declared.

Could I? Wouldn't it get overwritten by `hid_hw_raw_request`?

> devm_kasprintf() would simplify this.

Well that's a lot simpler...

Thanks,
Stuart

