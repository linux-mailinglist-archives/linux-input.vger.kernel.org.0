Return-Path: <linux-input+bounces-16658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742FCD4656
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 00:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A530D30056D7
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 23:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A07212550;
	Sun, 21 Dec 2025 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YVaEmdF9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AF815ECCC
	for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 23:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766358355; cv=none; b=Pnfw3x30et70nlCQbrOu6huLag06POHbjES25H+kVa9b5BRy3erMcSbNS3zZnDsqnfjBxJfb17EPyodkAYD5o+mwJl9hO8fFQUodlhn7NwjYHm4xYHhJOOaZ44rqabpPYHlAG+XkyVaDHMHz68Pc/2MTV2W0qAyJgDPFdlQ9OM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766358355; c=relaxed/simple;
	bh=jk1lUELykvEluyZxuBevTLCY0S38KmnlYyr8/TZobD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UV7Zze30KajUyy+Qm3O6J+jDQRZUOV6U6fSoz9Bra8dLFHaq3dtmeeNEVGWGxalU75LkBxj+ZHsY3NK2pGETdAkIDQ3JlHaOgA9aZvJph3NQ39knGgXUuYhwvcKo0HcCsy0ct+N3J6JIPJgeTkj98OhdEQJpeiJ9wwkzaDwd28g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YVaEmdF9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b728a43e410so614644366b.1
        for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 15:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1766358350; x=1766963150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ue9TNNYc5E2g2OPwyAp6G7iV6EfQuxxnr9iNYSGMwrc=;
        b=YVaEmdF9Srt2rWGBuREwCGex5ZhA/DcoSWItBt7F8gct12U8JaZInhzIhO8cXoGEt5
         vphb5VEuVQzkYq6qyNpBjSMuYiR0s4rFjFQywkb+ELKAWEJvylYyTwBF37ShaDJwwwwZ
         P7LRP3zETWoT0APtNy2FPzK5wawWpzIYKL4qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766358350; x=1766963150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue9TNNYc5E2g2OPwyAp6G7iV6EfQuxxnr9iNYSGMwrc=;
        b=gdMtb1T8RWgIvHcSr7eClQeyMXINxsS3zxFMIh7WlgGDcpPssh+Qa/fNu2QzTlw2s5
         v96hHjwerD0RHY5KRaO/461deFwNhLQIurCxCX8nu+rZTbolV58kWtogfAMykXAQNR3H
         3Cn9UsUbuug5qyrnkBtPPcTuyguoTF+eMaCgIl2YUKGkPYIIDWqMdrINdN2WLiOtzf3E
         X6RPg7P/Bmkr2/YmsVNUS6VEiqf6IAEcfRQmHdLi6l35HFyaLnyu2qb8pcbeBu7IIEGy
         2Ff0JPk7j/rKaEdTiuUTB5xWwqALa1GnP202ZOHlfBL5RNG6KfDjhH4FU/K9t/2fdQLS
         0qSA==
X-Forwarded-Encrypted: i=1; AJvYcCXi58w1ceytbjMKIbryEiGkBya8NucWPAxSpnanyEPBICJMkJrMBclAStgRJg6WiwWbUcqLi/o5ThtgTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys+pv1v/wqmFaYZY62eZFJEQ1PSeW3phf5Hq60deiLKOIp81aj
	BeATeDqoPxZQHwpTmkg+jzTG8VNKVWJ0IZghS8Rcwt//UXN0/GpHYaZPL41FR8hCKAGtJmtsXSZ
	+T2ZD
X-Gm-Gg: AY/fxX65+mVzKgB1nsu5TrAedmN9dWvhedamSM50GOo28IbH8Uv7bU7lDsKnt/eyVt5
	TtT6d/KPyyViNxIJ4Re5bamHW4lZ2wGvkKbt6ZwTnXMrd2lK4wsmg9dz8p6FgaRAV/KCSOAar+/
	aXdQMN0sGHA6K9pxMJcR11iWWwK7ctmd0i44i8PawneQFton12DWTwiMB8b9k9my723fc2xv+KN
	M2iWitinStRUsZJBwkbyygu4odGn5wTxyo3dXJQILufekkDKlND8hROYSs7o6Rh2K3L7MZfBYHA
	8z2ZBC9NX6hq7eLxI9c3+hGk51IAeJDnVRywm6S2EgsB5n23Mi6b02VVLv3UP0dJyn3aLPgNftu
	Cxr76IdIKpy9H/7cgXkhz95agIEWW5JRuGVaXmbixD97dNq45qoqyt6eGZYYSS+nb8HYtp+Fi5H
	wMpeZFk4SDDQ6AsKO9bPE/sp/AO+KUkvg7A4TbohtC88Wl0qs839VrfvzJEjuMQVx0mdEd4eU=
X-Google-Smtp-Source: AGHT+IGq61ky0X2/l2avkkOOMNhC56T8DZkBdRLJL1qoAachztH39ehjmIwHKvkvQs/2Ck4kHRpzvw==
X-Received: by 2002:a17:907:7703:b0:b80:3fc0:834 with SMTP id a640c23a62f3a-b803fc0088dmr618583166b.10.1766358350426;
        Sun, 21 Dec 2025 15:05:50 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm907401866b.49.2025.12.21.15.05.49
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 15:05:49 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7697e8b01aso640070366b.2
        for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 15:05:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyHKzgYySAK2xDFZh4wrIO1B5pYOOLmFX0d2+InyrRjYltdsz6tatvy3PFkmgU6rM79VsTygsPm7dslA==@vger.kernel.org
X-Received: by 2002:a17:907:9622:b0:b70:af3d:e97b with SMTP id
 a640c23a62f3a-b8036f0f18emr961091966b.17.1766358349414; Sun, 21 Dec 2025
 15:05:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <lxy277le4ku73e5xf4yawoviapa5ii3msto7wjgzl3o5fmwnrr@3bcntrq7tk4i>
In-Reply-To: <lxy277le4ku73e5xf4yawoviapa5ii3msto7wjgzl3o5fmwnrr@3bcntrq7tk4i>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 21 Dec 2025 15:05:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wghOVD4usUy9Jowte5OXN_mnVJgHHMYyTS0O3KvR_J12g@mail.gmail.com>
X-Gm-Features: AQt7F2q488fTLz8WfDNUWekgdVmwSIyu2MRuOPqX9R2ySV5Z3XPxQP5uneuc4hI
Message-ID: <CAHk-=wghOVD4usUy9Jowte5OXN_mnVJgHHMYyTS0O3KvR_J12g@mail.gmail.com>
Subject: Re: [git pull] Input updates for v6.19-rc1
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Dec 2025 at 00:40, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Please pull from:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.19-rc1

   return -ENOSUCHTAG;

Did you forget to push?

             Linus

