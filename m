Return-Path: <linux-input+bounces-5194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C320C93FD36
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 20:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5F2A1C2198A
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 18:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B158380BFC;
	Mon, 29 Jul 2024 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PtgIEXHr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B20878274
	for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722276983; cv=none; b=DWJP5VEIaSofGi1/69hoLE1dEdylLYj5YzQaTCULMwRhgx6MIywkBqvOD+2xfo7rJ6MzN66LQW52Ll/50bzrM6Vktk2egsTB8nyrhHFSekmcYmulZCe3ijGSLOZmVrrZyDcbmnT8DWma9cpI8jqLl+pDfw0dalOYYFJZXmaB3Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722276983; c=relaxed/simple;
	bh=LIl46PKiTuHOChuDuKYcVHWM3SfkOTD1oJCyG3S2s8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWCbEX318KEH4Wbur4lBTUqUm1s9VGAHk5z8GCo6tOdJkIa506qlTBKvFgzRPGbxFLT9o5UT0/7OP4UKOWXFfcv+WW/WdET3zRA1z18KGEz0RskZ0vJN+STd5y7j+ku4htoiUJ6Y25Ox6X89EQ4/mFWBzIieyISK5PUhS5AdI1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PtgIEXHr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a81bd549eso344947066b.3
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 11:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722276980; x=1722881780; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jB5fkTKm2Ww7Qd11d11d2YKMGg7fRbgq/CgiCr/mNrM=;
        b=PtgIEXHrsC/ambMOc4KlVO6WKzcp5n5TPO2WBAi2Yyafb+PNaMSij3d138Q3gU/EBU
         PpXRZZYF52v6dkv0w65M2TLLbVzL6GvruyQusx0oR9Pz3zi8KGEfM75AAvNpK+/y7IKB
         OEVTbfLeIta81i1ADMZ+gN+6ATpbFKGTweoA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722276980; x=1722881780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jB5fkTKm2Ww7Qd11d11d2YKMGg7fRbgq/CgiCr/mNrM=;
        b=HXD75M03IOB8Sx9sDoa+doADhq9hw1612VOtVPLJCXviHh+Yyi+9dwjF6Qte2N0/xX
         LYKyo7wVl3XxAVXBLluvXnMOHFiZoc3nCXZigRCFKggV4CIwluefViQV8dBEvBrduIjW
         NvsVV7vpNQw4DJ10PbrGwY31viEW06IVtL0XK1eYurrRBKtbgp0xz+ozJtmIymDBGKRS
         gAjG5xeo6Jg31425yDGEBLNZwi7tGc8G8mCnEhwStdCa84BpvW9HOtWIQcCyiBK+wg4c
         diXPnwN72pqVGyzpVyaEJYaiZB/vR4N1L/Ku/SniB0TWB7MRiJClaSyutAN4xJA+QgjP
         tF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4p7C/XMLUS3xa96RNA8xnvT+J3X3hqoJlGqgPsR/nGMgqxvcGFWFpn6px7bze3mLhERqwjkxxmdLcDO3AqElHAI7YvIdh6IbHZ7Y=
X-Gm-Message-State: AOJu0YxHUHZKzCytwli5j0/MNQwHbFuOOCEtx1HNXUYv826zhgB+CUVJ
	sMTAkp1OKvitLEgJVHCofhzaLz/bW9dmL1TPizenfOOd0aHB+muu+QBk2cDEfigri4msOWLRlOW
	tYh4SxQ==
X-Google-Smtp-Source: AGHT+IGUXQ+PT+3aYDMGQ2/DS6DoXAUJsR+x8l0gt4KSY8D8XuBWV0dG8SVrDXYGuyzrEqbKzGbFiA==
X-Received: by 2002:a17:907:3d9e:b0:a77:e1fb:7de9 with SMTP id a640c23a62f3a-a7d3ffaddc4mr591854366b.5.1722276979804;
        Mon, 29 Jul 2024 11:16:19 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad4348bsm536335566b.118.2024.07.29.11.16.19
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:16:19 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so6141051a12.0
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 11:16:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuHGQSj2WDjr6/l+xxdV35V/f/EUqzOLhwvFAzhSKb0AsKUXGBU2Dw/4x+DOp4crdLbubn3JfWfuz8unr3ZOVHlVoFU+M8YwgjtSc=
X-Received: by 2002:a50:a695:0:b0:58e:4e62:429b with SMTP id
 4fb4d7f45d1cf-5b0224ceb1cmr5305382a12.33.1722276978788; Mon, 29 Jul 2024
 11:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh> <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh> <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com> <ZqfYfIp3n7Qfo1-Q@google.com>
In-Reply-To: <ZqfYfIp3n7Qfo1-Q@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jul 2024 11:16:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>
Message-ID: <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Henrik Rydberg <rydberg@bitmath.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 10:59, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Can I write a gigabyte of data to disk? Terabyte? Is petabyte too much?
> What if I don't have enough physical disk. Do we "fix" write() not to
> take size_t length?

Dmitry, that's *EXACTLY* what we did decades ago.

Your argument is bogus garbage. We do various arbitrary limits exactly
to head off problems early.

            Linus

