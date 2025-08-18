Return-Path: <linux-input+bounces-14080-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C078BB299E1
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 08:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9662205C95
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 06:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355EE27702F;
	Mon, 18 Aug 2025 06:40:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C8C276059;
	Mon, 18 Aug 2025 06:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755499236; cv=none; b=aBDmwbulYVVm/6GBQ4Xn7jY1L2B7z9G8A1bReEtrDdRIvSdyBkfuDh5pqPqRWuXQHK03MqyrKl6OEy6NDaQTYBLbXj6cYu4KiD7c/jWd9aoPldwinRkmDR0FXEjkZDpR4UUv6iULKhatakV4tAWUCo86nLJ0FyA5Wvy8eSRnPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755499236; c=relaxed/simple;
	bh=ZNPSJHDL7x42QTeyMZ2fhYWhWF9V+/0mTD4ajdv1MEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1la/eB7f/lPpgGmPZoQPMNkUNY5fH+8AqHc737WAGBejHBXmEGH5+ORtgKXc8nbbKNQXSg8kH8B/tq8WPm2qH9oafSa2PDG9o02jInREPIv0RlD18M6LJQHeZXgdcx96s5LQQ1y+aDn+ZuH3W0FmKFIL/IpV/wzYih6gfnb93I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-53b17194b1eso3125947e0c.0;
        Sun, 17 Aug 2025 23:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755499233; x=1756104033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKvcRxnlGvnl9VkkGLuzs9q0QCOkHomhOUxP/UdVzAk=;
        b=TpkTbe4f6lli42W1yAMm0WM1hMclu1KChzuB5gJqJIv1YClUOyRkP9mdKbKobwRQJz
         8VbsTQk1ckQppLABTxEH4SW9cmh0/jEtarNDBFaeREtO4NhaVR663CE1g0yFFx1iDmsm
         8ltEcU5SrfyrhH6rNq64aR0oT6oJHZYvSN6ZmLadFsjZ2/YABJcSfj7s1Q/fFwD7NTpa
         YIb3XXtdTcrZP6KecyE9kMS1RSIYCmzyiufs1Q4u2YDZTs4kYqU6/UzKwt0yFH1SnGN1
         FUlPrAuGnTN3JhwOc6+oOzevvJYRkDCPgQlwVj1R/sCPPrK64cqPD1SUKr6klOmrBgiK
         gKUg==
X-Forwarded-Encrypted: i=1; AJvYcCUpi44izfnqDC2sZr9w7Xjy7I3uz2tLFXaL3SWk8bLr2BRryruwY9GL4mg/gSgtRyugsx33cyZg+0sWBII=@vger.kernel.org
X-Gm-Message-State: AOJu0YznHESMZqf+boVe+Qr2B4CG/p5hwTAWyKBpBMGhmX/RX/ce+i8l
	bVHToKVzpihvppt2KonTLLEHgzN83c1Hjj658BqjR5Xs4gIlYj8R8QvnxF3HjBqP
X-Gm-Gg: ASbGnctyU7Y3EWDoCvhhviJHV7lwKFWS2yC8xjONSfjOIoc/AyL8e6ohoR472gPp9i9
	CzvOz31VMyfLMIt8LYdmN/HVfDzxRmH+2MgMF8qAXMjL+V1U/Y7jlZrg/qFzd8gV1ooD+Abf9ha
	CedHlAcwWuEyrbtvd0Q+TU3GxO8vc/6WR4wXpFK67eEH12XDem9I5XOq7+M4pQvmSOj7Cd+YK4p
	kLq1/lIU4gPcBMjJPR/zPZvFV/f3faptFYRyv8Gzr+CM8r6/It86+mk+FW25v/6vrE+dsMsliFk
	kRb4YBhz6NKOTTwPKvoB8LVT3DsoWE5xZK7c90SqQg5mx7gKjJPxMEfouyf/I/+ZU/Xbk+GSIct
	yjiaip9RI2FRhypQ7GeYmCnPzp3Pp/ZegdBdFAbS4mFu3xlpUag2FvsNcRqFg
X-Google-Smtp-Source: AGHT+IFG1EeyHMPAE3shbIzbR/HctINML2NHishO1+8HIv05VnVp2mwDbhdIPZRUp2sRJQPvYWc9BA==
X-Received: by 2002:a05:6102:8098:b0:4f3:1d:6b47 with SMTP id ada2fe7eead31-514cb0ac548mr2919810137.25.1755499232712;
        Sun, 17 Aug 2025 23:40:32 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-51713f939edsm560842137.15.2025.08.17.23.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:40:32 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-50f88cd5ac7so2872017137.1;
        Sun, 17 Aug 2025 23:40:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuqyd61sIgZ3VR/VP48AKXdTKnws8wa8vKE6PmAaw3167r2Xg7EGoDTVbgCGkrZUa7nsEjlU4kO1fsgfU=@vger.kernel.org
X-Received: by 2002:a05:6102:418a:b0:4f9:6a93:2a3a with SMTP id
 ada2fe7eead31-514cb1a473dmr2891085137.26.1755499232088; Sun, 17 Aug 2025
 23:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <vaakfeog4twpfpvcwn676arueynbzig2omphl4baqimapj3zvk@7hzkcp4yb3gc>
In-Reply-To: <vaakfeog4twpfpvcwn676arueynbzig2omphl4baqimapj3zvk@7hzkcp4yb3gc>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 08:40:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLsnDXMOcLoTWV_LxXhhR3uf654fLpaWj=xDDLs1NQkQ@mail.gmail.com>
X-Gm-Features: Ac12FXz-w4E2fbIvLzD3FKhrv10zD9sy-mg1WG1prRHa7XSjAE1tiRaJzeVpZ78
Message-ID: <CAMuHMdXLsnDXMOcLoTWV_LxXhhR3uf654fLpaWj=xDDLs1NQkQ@mail.gmail.com>
Subject: Re: [PATCH] Input: matrix-keymap - remove unused keymap_name parameter
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Fri, 15 Aug 2025 at 19:47, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> The keymap_name parameter of matrix_keypad_build_keymap() is used to
> specify the device tree property containing the keymap. If NULL, it
> defaults to 'linux,keymap'.
>
> All current callers pass NULL for this parameter, relying on the default
> value. Remove the redundant parameter from the function declaration,
> definition, and all call sites to simplify the API.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> Robin, Andy, Geert, ht16k33 is the only driver using this API that is
> outside of drivers/input. Would you mind if I merge the patch through my
> tree and not try t introduce intermediate API variant and split
> the merge across multiple releases?

I wouldn't mind.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

