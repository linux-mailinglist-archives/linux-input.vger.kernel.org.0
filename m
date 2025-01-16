Return-Path: <linux-input+bounces-9266-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8CAA13730
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 10:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A21973A768A
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 09:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578B51D63E8;
	Thu, 16 Jan 2025 09:59:45 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF74145A11
	for <linux-input@vger.kernel.org>; Thu, 16 Jan 2025 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737021585; cv=none; b=rbfGn0DMWwgmdIfeq5pU5AKMJhbLaMvL/Zpu6c/OJmcyr6TgjbPCy4M9sQ2/5l2nj2Gzef1rfdkKGv8m2NY20dUuWf8wSgYC6zQAEX/CRDyu09TcSbJvz7kszGuTIoewwthIVknrbzGLioXgek1NZcMxBr8sPy0Xl0VEf04GQKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737021585; c=relaxed/simple;
	bh=od1pI58m+P4sZPBh2s3vV0Jik1AEqN/9p9cZzAS/90k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wzn3tsR3wlBpiIYVDmt68GiKMrihA/SWpqfLmX04U3VnctsYF/7onLgyTBmbx1LucQvQ+DcGMSkhywdHWFNZ+CHojRLq+yNz9GOcvjvini6X2U6uZwR6YpKJRzaNbWSHxjvi9zylozdJz7KoBWr9n1RVdhaYucQEH7U8q0FNAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shmanahar.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shmanahar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21661be2c2dso11994295ad.1
        for <linux-input@vger.kernel.org>; Thu, 16 Jan 2025 01:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737021581; x=1737626381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/Ltlwj+cBPV8QxbfJcuE+I9jrvSe2XZpWxUaGKqIAM=;
        b=rG+CP0lqRqDFC07dA16pJk2Zn6FpLdcjukdLvaUKSDBGkdQ3WUnevnchZr0qTBdNP1
         IRJdYFpuA0iyj9E9DhdPJS6fYPoIIaRqKE2KwkR2hZjnWT4pLMpFLvPtj6bJSH1ZLwxw
         YotIlSFzsFVGzEZCD+qgliB2GX7OnL/ocWWq8ELN2TBEZBwU90Wjf+QszXxuojdHJEz+
         TpeR38LgvpI9RBN1p2lixY2eAjSQ3ovr0UkgjYEtiuh1ZdljPq0MJIirtJuvZ4wz1qnk
         RHtcHGr1P8kHugGeIMSksjOQc4VkiMocRZO5fPIGmaSamd6y8u8ejbIwDuurWznR36Fy
         M7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUf+8CQU+4/Oh1+KSvQwkuep09GwuCZ5SwFNXnnMjznZ3kpwC0XeKTPQbabATyh1zqk66OKodlyeiZb9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWQ234vjFdJu2Sa0tmVHp6OEXRSaWmvLkl4nmtNjA1iu38k/x
	JggxMu5GuN3jCpmcA/s+soX1oF33pLOPAlEdAoJc5slDmXwXFcGbE+QgzilHXzrzm3t9xLevVXQ
	IdoMsCymwC/bZ3kA6y0LHAtEuHU8=
X-Gm-Gg: ASbGncsTGxZJTjlYpQa3IuPikWgsZa9mupbbksxLR57KK1Mcpc+57jhZcEc2avO53G1
	9DsqoxyAyVPeGVGNT8auCgaiGmY9z6PmXsQk8vQ==
X-Google-Smtp-Source: AGHT+IEesSpKA5o9L3h2I6VIX3gWD6BOlP+IDtveZ+ezdbDInfxDz8rFKAEqTlstUEO9eQaGFwAphcr+I6b/D+Al+rI=
X-Received: by 2002:a17:90b:254e:b0:2ef:19d0:2261 with SMTP id
 98e67ed59e1d1-2f548eae703mr51486541a91.16.1737021581520; Thu, 16 Jan 2025
 01:59:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241223190416.52871-1-marex@denx.de> <Z4VsxKJ56jqQnZGr@google.com>
 <952a79a6-a13f-42b5-a311-13321076686e@denx.de> <Z4haguYzh87Bz8hx@google.com> <d43894eb-3a63-4da8-9f21-d50ec9b93c6c@denx.de>
In-Reply-To: <d43894eb-3a63-4da8-9f21-d50ec9b93c6c@denx.de>
From: Nick Dyer <nick@shmanahar.org>
Date: Thu, 16 Jan 2025 09:59:05 +0000
X-Gm-Features: AbW1kvZE_VU0tMWatFQ0j6NaHhZMqdvaWfYla9lBuJ9eGa1KmUYluoKn4App308
Message-ID: <CADF57Jdt6PjMyj_DbQtUfDUFAv-P24h_r74-Aq0fEx7S+0R53g@mail.gmail.com>
Subject: Re: [PATCH] Input: atmel_mxt_ts - support KoD knob
To: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	Michael <mksgong@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jan 2025 at 03:03, Marek Vasut <marex@denx.de> wrote:
>
> On 1/16/25 2:01 AM, Dmitry Torokhov wrote:
> > On Mon, Jan 13, 2025 at 09:08:47PM +0100, Marek Vasut wrote:
> >> On 1/13/25 8:43 PM, Dmitry Torokhov wrote:
> >>> How about creating separate input devices for these?
> >> This is what I had originally, but ... why ?
> >>
> >> This is a single input device, touchscreen with up to two knobs , so why
> >> would it be multiple input devices ?
> >
> > So as you can see it is hard to express the knobs purpose within a
> > single input device. Additionally (as far as I understand) knobs are
> > not connected to the touchscreen function but rather rotary encoders
> > just happened to be mounted on the touchscreen. They are not considered
> > contacts.
>
>  From the touch controller perspective, they are contacts.
>
> > Therefore I think it makes sense to report them as 2 separate input
> > devices (maybe modeling after how drivers/input/misc/rotary-encoder.c
> > does things).
> Not really, the knobs also act as buttons, so the user might navigate a
> finger on the touch surface to point to an object, and turn or press the
> knob to trigger some action. This is similar to the Dell Canvas 27 knob
> already mentioned above, except that one was not glued to the glass, it
> was movable.

As an observation: atmel_mxt_ts already supports the T15 key array.
This turns an area of the matrix into a series of keys, which the
driver registers and will report in mxt_proc_t15_messages().

I think we see these as being similar to scrollwheels or side buttons
on a mouse - they are very associated with the pointing device itself.

Nick

