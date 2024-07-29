Return-Path: <linux-input+bounces-5198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5893FE3D
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 21:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42AEE28434C
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 19:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848B118787A;
	Mon, 29 Jul 2024 19:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rau8zEAd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F6187337
	for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281247; cv=none; b=Jl/4F/VfQQdN9BtQr9qyJUNUJOJLDbk9O5G2Ooa30pI8J/k1A9DfRCdDkCpsRyJ7RrW94x0I5TWZkWvslmi6hRvA9u+czE7HOfTeIrQ0tZYP35wc99pxnsHrU1cBHuWz4KxaVflGOTq8LWFwY3QMRuqWgnC8DeGitb+DI/0Y9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281247; c=relaxed/simple;
	bh=wuV0CJ6b56yl9jpPmCcBO0ysR9/+51iVD3eCn2Pl17c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjYmk4y7P5eUGjPcsnmkhK7aTn4um6v73hkbT0KeMAb35bBzZzDx7pyE85VvwnFd5CO/gKQwBwNRPNcOm3u9XX8wlh6KdlAMBl3+k5KiC/Epq16+k5Ql5qVSXvats/RBQwxtvLq+W0WoDATd1KTn01CQwY8GUpxLB55spl3Ah3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Rau8zEAd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7d638a1f27so97535066b.2
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 12:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722281243; x=1722886043; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSNi0pjVxejT/B7YEh+vGAJOW4I46TVEhUbFiwaZ0+8=;
        b=Rau8zEAdV8TJq8wRN3hgwLVEfS3NFAgQfMMpoVJ1wDygcZRQzxLai+zlP/zYcHJrSz
         IKgR7kHfKzTc9d+UMGsDUSo87tn50BUxQvHFCJXhmnTIM5Llzx7cxzhFWojrXxYjl37i
         ssXHrdPLDWuuGYsiEGa6vw+Zs3IUwFnE9WRf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722281243; x=1722886043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSNi0pjVxejT/B7YEh+vGAJOW4I46TVEhUbFiwaZ0+8=;
        b=HjBQ7AoChf7N9DaHoBGFLuXDbxy1w3aW9FMkhm8s5xdSILaneFGi3+C6ZVN15q8Y7e
         O2UoYHc77cK3wlZkHFaRSq4WZL5QkB18inhOSpEa11gxCBieZ6Ywb4DLgVP7SBInBC6o
         ZLefbtBP/NUJM5xKK13NqDhWPzAHlwS4gSfUA/HcWEL3kEFB1oKqnFIiIpCYrebHkfYS
         9iCk3NgY9SR0BTR26IV9rGr7eW78A6I99QDnXdMHMtQQcWue14Dy4SMzzLAdbuQRNSOR
         9D1eLXNPoHXqc8JsiNENgb/tlBgOqXDQTQGfcWqD7rV6i6uln1npmoCspxf3CzH6vqvo
         HmUA==
X-Forwarded-Encrypted: i=1; AJvYcCUPVnI1oU2MzYVkWevgN3BiQ1vZr11o5uBXEnTVzwzt8z90aIkO2ALPl80FxawNI8D8ALrke3PxeVVpvfiXmEhJ0C3ZwGexH8ffBuM=
X-Gm-Message-State: AOJu0YyVPDhssHf+nc/ilMruV3utsYm3u3SKccBA/e7kLnF4xzWvQ6My
	mwHo+FBZxeLchUU9SoG85scE9QYMsPPtv5+buGRU6Xqp04+2Svor86wgIfXbUP4DS+5xVmsytae
	Sb2+G0g==
X-Google-Smtp-Source: AGHT+IEyNrh1o4IMCkO2rAm0d8sql7uN4Bsg2mesKiXUqIVRYyYCkBnRtBrPoPS/EHRBdQqQfE1AZA==
X-Received: by 2002:a50:c357:0:b0:5a1:2ce9:f416 with SMTP id 4fb4d7f45d1cf-5b023a52f6bmr6226690a12.37.1722281242545;
        Mon, 29 Jul 2024 12:27:22 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac631b0464sm6178231a12.4.2024.07.29.12.27.21
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 12:27:22 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a15c2dc569so3554226a12.3
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2024 12:27:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfdcoZ+L2pyZnseWB2NzDN76DdOGoYBLzwkJkDoomLu/zJKpQ8GT4T3DatNycjzbXV42HfQxNX8GFjbOoLIr8IIMPbUgya+/gMiGY=
X-Received: by 2002:a05:6402:268d:b0:5a2:65cb:7335 with SMTP id
 4fb4d7f45d1cf-5b021d22bf0mr7507356a12.19.1722281241607; Mon, 29 Jul 2024
 12:27:21 -0700 (PDT)
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
 <Zqfg8FW-SFFedebo@google.com> <CAHk-=wg4peLPGB+Lyvdtwxe6nVeprvTbZiO8_=E8-R_M+VyWow@mail.gmail.com>
 <ZqfpgmmLgKti0Xrf@google.com>
In-Reply-To: <ZqfpgmmLgKti0Xrf@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jul 2024 12:27:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgo9iEZ20wB4rOpt6h36Dymudqf6HXww1N094bVoqyMmg@mail.gmail.com>
Message-ID: <CAHk-=wgo9iEZ20wB4rOpt6h36Dymudqf6HXww1N094bVoqyMmg@mail.gmail.com>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Henrik Rydberg <rydberg@bitmath.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 12:12, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> OK, if you want to have limits be it. You probably want to lower from
> 1024 to 128 or something, because with 1024 slots the structure will be
> larger than one page and like I said mt->red table will be 4Mb.

So this is why subsystem maintainers should be involved and helpful.
It's hard to know what practical limits are.

That said, a 4MB allocation for some test code is nothing.

And yes, if syzbot hits other cases where the input layer just takes
user input without any limit sanity checking, those should be fixed
*too*.

"The allocation failed" is not some graceful thing. Large pointless
allocations can be very very very expensive *before* they fail,
because the VM layer will spend lots of time trying to clean things
up.

So a sane limit *UP FRONT* instead of "let's see if this random
allocation succeeds" is always the right answer when at all possible.

                Linus

