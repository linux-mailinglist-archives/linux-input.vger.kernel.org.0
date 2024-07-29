Return-Path: <linux-input+bounces-5196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDE793FD9D
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 20:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013541F23194
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 18:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973EE18734F;
	Mon, 29 Jul 2024 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GbGHhenI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8F118734B
	for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278541; cv=none; b=JalI7UwDxmS3YXh+beiEL2pms+ODjsFxRR5aWsBGqYL0TWSDE/IaWiAU0zbPto5uNT1x0SmO4fm7s7fK00ZNc+RgBB755MtQKe/QQggdyUrSWdHo8P3Q91jlfn2z/dX623WwYRA6ttNKh65OY2w5+wJA6Y+HeS3qOjSz1gnoXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278541; c=relaxed/simple;
	bh=unNEJBSNZl8c6hb823gGumAEfjr/onUrnN1stss1aq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUUCfUnNbPweNivoDd+2nQbZo/S4L7Nr4Ng1S74aZd99nlsbOIFn8DTXeAHp2qHHwg52qUFRVwriOPHs5JS8HRES/7OL/btWx5wl1ZmS5ItguHX17KElQa//LiFyPaRWs9ZWbP1DB9GuMhBy5m0Tq4JhxKaS54ElvVnBK0QfCrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GbGHhenI; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so50211051fa.3
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 11:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722278538; x=1722883338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XDj4us5e5J6V09EbQPW2TDQPIfHZ6uBuhUg+jXxPP+c=;
        b=GbGHhenIVi46QwAlC7kBnr5q5pcpnU8vWJK8jSQjLN7grgmwfDAZR9gQrglm6Q3HfI
         3g1qdZodH+32qdQzoyXy8QGL19YW4qpedU0rdlM4zItm7tyCFXr6TDUDgEVOWg2TWVeT
         ZsgPZHCGQ1ECys0yK71p0tUez0A+7gm+Ethik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278538; x=1722883338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDj4us5e5J6V09EbQPW2TDQPIfHZ6uBuhUg+jXxPP+c=;
        b=nZbbEb+C3YeelvrVZTk1DvKWBXTE0K0gfFJFHBp4rK6jkDMZA13UBxWkTH6y4uGk+s
         QZce1ZDvNHaCSScZzqCV2ga05A29AzmZV9j/d+hkH1SJIymfDT9SHcv54ya6olIHIFyN
         W+fJ0Sk2phWnqhGmPtEG5plTnYM2yHTtRYlT5E/slHMYVDfeQbT8x04EPqVPac7kTtPU
         x96mkq6axObmJV1yKtMmPcJAt5NTpnzyET3BQW89/UUCDgAekVH9rjOqutKLOLzC1SqO
         smKD6F3J8/Wm1k65adFGWwVQhzsKt2wo8D7ciNa1CJ+Jc7Q0iF30TbG0VX9zJKTk4ElL
         v86g==
X-Forwarded-Encrypted: i=1; AJvYcCV8C2bPrqDSpJeJwFZ1JJvhm8tSubkvaNR3cuE9kSeeSAZPLumLyAqvW29G5dgW9WViYMdbtffo6JSz7ApFctk6ZF1flGXh3ZhGC8Q=
X-Gm-Message-State: AOJu0YyQ3Q8v7d8lLxpUbFXKSCmmzLltTnO7WUMXVcT6kydiSql5DFb9
	cxebELMr/05acDA0AueUOpUUq4zPimPo3yYyrFsxDtxAcIHYKZ8U5m+9sTY935cPB1TtId29nKo
	T9HZQLw==
X-Google-Smtp-Source: AGHT+IFCPHFtLRB4xuLCOc8V/mHpb06D4k2iUzb9o3tgmODvWbFwjJpD+r63LhaiNinENgR1Uc22pQ==
X-Received: by 2002:a05:651c:a10:b0:2ef:2e8f:73e7 with SMTP id 38308e7fff4ca-2f12ee2fcdfmr65439351fa.47.1722278537623;
        Mon, 29 Jul 2024 11:42:17 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63590592sm6099065a12.25.2024.07.29.11.42.16
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:42:16 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a156557026so5559583a12.2
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 11:42:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0BSM3xqZxTx7lhMh0IrdnzH8x/hbt+L8aHaaoXI0xK/w2UfAu08D8BhampetuM3Wwv6Lh24Ne/UvDbj2S17KtqZYgBriopRHU9Jc=
X-Received: by 2002:a05:6402:5113:b0:57c:c3aa:6c68 with SMTP id
 4fb4d7f45d1cf-5b020ba5bb5mr7729634a12.20.1722278536394; Mon, 29 Jul 2024
 11:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh> <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh> <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
 <ZqfYfIp3n7Qfo1-Q@google.com> <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>
 <Zqfg8FW-SFFedebo@google.com>
In-Reply-To: <Zqfg8FW-SFFedebo@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jul 2024 11:41:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg4peLPGB+Lyvdtwxe6nVeprvTbZiO8_=E8-R_M+VyWow@mail.gmail.com>
Message-ID: <CAHk-=wg4peLPGB+Lyvdtwxe6nVeprvTbZiO8_=E8-R_M+VyWow@mail.gmail.com>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Henrik Rydberg <rydberg@bitmath.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 11:35, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> What exactly did you do? Limit size of data userspace can request to be
> written? What is the max allowed size then? Can I stick a warning in the
> code to complain when it is "too big"?

Look up MAX_RW_COUNT.


> So does this mean that we should disallow any and all allocations above
> 4k because they can potentially fail, depending on the system state? Or
> maybe we should be resilient and fail gracefully instead?

We are resilient and fail gracefully.

But there's very a limit to that.

Dmitry - none of this is at all new. The kernel has a *lot* of
practical limits. Many of them actually come from very traditional
sources indeed.

Things like NR_OPEN, PATH_MAX, lots of arbitrary limits because arrays
don't get to grow too big. Things that are *so* basic that you don't
even think about them, because you think they are obvious.

In fact, you should start from the assumption that *EVERYTHING* is limited.

So get off your idiotic high horse. The input layer is not so special
that you should say "I can't have any limits".

                Linus

