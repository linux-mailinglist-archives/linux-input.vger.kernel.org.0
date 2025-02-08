Return-Path: <linux-input+bounces-9853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25427A2D37E
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 04:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00AF316BA96
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 03:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679F01119A;
	Sat,  8 Feb 2025 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhRbX5Gp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C9611E
	for <linux-input@vger.kernel.org>; Sat,  8 Feb 2025 03:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738985473; cv=none; b=h7yS1veZ4s1wzGQQdixz5NXibeJs4SO6KcsozkdAIvQreWP89GdRJvPDN59+5Ba1KPEnbOWSrFzyUB3dHPtBYjz6NvPl3YEaDgoPnA2qwAW3qousuI9CmuiWU4U30BVOGhU6JkztxjCv9aTtwUAPUbvM0h38xRpgPXrhU5pqOKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738985473; c=relaxed/simple;
	bh=qj8xvAZJ6haVbsHnL3VECrOQZ3I7tBWGyggEZO9W9Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWvTDNs8ngvuLtlhdRoSjOSAauvB+6DNKGLKT8b6SbnPzBAloi/weEwlIDDeU7Fo5CoZk+wjZKTFc/ZsWH9jxqJYLwCAUPMcFbzeVFwr3E1+8UDXIa9klbwZzS0apMCpQdhcsylFtxRY7sxfYC4VKllI9iabOE52yyS+ezNhCyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhRbX5Gp; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so20815566d6.1
        for <linux-input@vger.kernel.org>; Fri, 07 Feb 2025 19:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738985471; x=1739590271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZo9xcqu219RM5Rv+YF9c3b/x+iN+Iuga1ZgPDQaYpU=;
        b=FhRbX5GpycwaxYdHJb3PfZECU3UMai6vSNGkogBn0hwi3G2XDeWYW5l5UMr8F+nZ1x
         9QKyIqKiy6SawFh3MbZUNyOWIba24i+F0UJKEWaxYsDTwdsymvHN72RfS4xoK31dYls7
         KdImwSyIo83P1hBOSetCRjzNLBZZTJTABqdW3i8yuYQ9Y83+DGpQsrK3zML18pPw2flf
         8f0OHhjnO6G/U9JpjFK/FQPq4bY90fqiqN63uk8BscIrDGHJ/E40I/s8EWbu+TmQ0w8V
         VS3o5YS/zPZ+xgT/kJfmpxVVEspmOkO1exVeagC35lWdtd7OlcyPAiMp4bLPWgB8PXTr
         aVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738985471; x=1739590271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZo9xcqu219RM5Rv+YF9c3b/x+iN+Iuga1ZgPDQaYpU=;
        b=k7gpMlnq+ICz6aBxGA6Cq/J2j1UCUFAi28YQ9En+M0IyScOLmJ8b/+j9U5bx26aNb/
         Mis8vP390fAoV1f80gR3cB0PBWyR55LzkRB8lUgcBrZfc/SvSHLnCvEQncsdRYeuJWWf
         8FktalTYv6gmC3kXlaTeojKshkF+ZXkU3a+LV30Tb9GZKZRfaPV554W82XhP2LoHQLdJ
         ZPqF52MuCkVIC39anhfCqWnbHeguzQB8BYmuG+OY7/XD+QPhbdY7idJcjpILFPGzFZj2
         UsniTaWb05bmxUElTXctWECHTy5AG3e06UHVVQ6GDD71FyC0x74JztgziXwK4onPNYaq
         8Igw==
X-Forwarded-Encrypted: i=1; AJvYcCV/gLcAy5BH0qI02cCFT+gLsAOGchlGAyYejNNLmAFarP3pv6W9mypvWuY6Qon09XGUAbsOg69EfjCvPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhW6ajMnKvpz00n8zi/c06EzcxxSVFlzgVSNPpG9Ir5M6p26Z0
	9hv6PqTOWQqEu50zP4m+jijnhzYlFYixKvFMdJ+P2UF94CLGW4QOyw8QSJaxKRlYqmydjn95d8G
	d42NPcEdU2MnVQOcOCJk1v9wEobc=
X-Gm-Gg: ASbGnct8gMsOIpTUXQjU9hT/wIoItR44Q6Q1sH/j0gQVb6OYdpTkYOGhVV1pYWjkkMF
	ZkeoXikqs6iRLjq5qwm9+i5qvZn36Ak7OH4xdg9GNfpzlj4MV/jOlC7UVtxttr4XAI18hJpypMQ
	==
X-Google-Smtp-Source: AGHT+IGUXEsJ9enYI0IL9Mqfu74w3aqp/7fbskOjqmwy17Q9UOIZadZrTh3MCMGwexk3Fm7BKcQ2h9U+tkdICkingr4=
X-Received: by 2002:a05:6214:cc9:b0:6d3:fa03:23f1 with SMTP id
 6a1803df08f44-6e4455eda41mr97934746d6.13.1738985470745; Fri, 07 Feb 2025
 19:31:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205202532.2586-1-dhenrale@amazon.com> <CAEc3jaDtBwBdH2sqMFqR+0C+GeNJ5-p0JB7ruxwfmnB9CnfuZg@mail.gmail.com>
 <1o20q453-5qop-52r6-ro2s-on09q503p3sr@xreary.bet> <0848r6p4-9npp-nspn-86o9-9s8n7p9q9pn9@xreary.bet>
In-Reply-To: <0848r6p4-9npp-nspn-86o9-9s8n7p9q9pn9@xreary.bet>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Fri, 7 Feb 2025 19:30:59 -0800
X-Gm-Features: AWEUYZncu4njStIcwwvjmVyEtzw2iVlOhzysNJ4AuN0uGOv6N5dSAAmiNHa2Geg
Message-ID: <CAEc3jaDJck+qeX+tcOLHzwxCKEnE1i9dVHtcX6C18Cd++WuaOQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Enable playstation driver independently of sony driver
To: Jiri Kosina <jikos@kernel.org>
Cc: Alex Henrie <dhenrale@amazon.com>, roderick@gaikai.com, 
	roderick.colenbrander@sony.com, linux-input@vger.kernel.org, 
	alexhenrie24@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:27=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrote=
:
>
> On Fri, 7 Feb 2025, Jiri Kosina wrote:
>
> > On Wed, 5 Feb 2025, Roderick Colenbrander wrote:
> >
> > > Hi Alex,
> > >
> > > The change in general looks good to me. It had been an oversight.
> > > While add it, I guess also include the PS5 controllers in that list a=
s
> > > well.
> >
> > Can I take this as your
> >
> >       Acked-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > ? I can do the PS5 change myself on top.
>
> Nevermind, I see now that Alex sent that one as a followup already. Can I
> stick your Ack above to both of them, then?
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

Hi Jiri,
Please consider it an Ack for both patches:
Acked-by: Roderick Colenbrander <roderick.colenbrander@sony.com>

Thanks,
Roderick Colenbrander

