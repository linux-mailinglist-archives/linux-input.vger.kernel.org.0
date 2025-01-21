Return-Path: <linux-input+bounces-9416-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D4DA17EA8
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 14:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1A5188375C
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 13:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC22A1EB2F;
	Tue, 21 Jan 2025 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4OO14IT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19521196;
	Tue, 21 Jan 2025 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737465373; cv=none; b=PmBou1C8BQvbZ6IbdLTQoDh+rYW5fMmU1zbQwa1m8Gf/B3InQTl1R8owo9vu7SupYDx6/gzJJDycHjetIkngdtFrta/y7krnM8oU5NaTLmSKNny7895aodDKcdFqyhPpyh6TqYLKCn95abVeugnim+LjyjqBQSIenNAyA20Oioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737465373; c=relaxed/simple;
	bh=N+QjFtP5562SqHLpPFEYo6uRTFgDurqy8yixqC1ZIL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZGh0m21Yj9TGsdIXlx5nXMAr9oRSvhONexU4BGDHfPlEIsBWTXL0C5SayghaDYQ6NZi3TTQdDOrSBBIfedSu+5VP5+7kWLPbonVLnHljRT0GXwFif9OGwoCyXcWdZEO3hYt2I0aIykeaFowyiI4QR3HRk1HbXX3ey7VJKSGHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4OO14IT; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3be7f663cso1160782a12.2;
        Tue, 21 Jan 2025 05:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737465370; x=1738070170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HX9cEL/geQg3qGJlzOztxBk7CpkiUOl3WL8Vp7HyPvc=;
        b=i4OO14ITe3nnkf56rdahiqJW6x2dyDZWlWf3eUFwCk7/b7JnZpn9oQ1C7ORvDLW4on
         EjZTgsKGgvkTUAF61FZEcyhvHKBy5RESm5x7pl09g7lP47MuFYnggOfk0LUns1mCF8Ov
         IHhjaEfchv1s3ZqVCdcJVymoV7OpW2qYYUzrtdZY6pEXLuOjkN+tuINPbT+d9i32a3ee
         ih3LV78upBUHNCc9OCAUmrENxJWxE4pBaeDXwMWyiGZm6bRd9ji2UQv1WKNSrA6ZNf/f
         ExzfEQLTjJLr6yvQZxEwcewTgqh70LjfzROkiNCRBcCzKTLgbKX5t4EEIfPAphJP8YMh
         /P+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737465370; x=1738070170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HX9cEL/geQg3qGJlzOztxBk7CpkiUOl3WL8Vp7HyPvc=;
        b=sjDOCphSOhSCI6qwOvzyFUlgHQPtO7crgToxovwETUezp7oCO33v6zojkzNUG7bQd4
         q4VGEVR04huhYzSvCG6nhXgJwa42JoicKXgiqvxb8Rvi86bsi1pSN479fGBonFmIZcTY
         dqIzq1uh5F6XERF/anxWxaigfaSKwfks8tsUnTGPm6cDHAqpZRgaMThREvt8ra2hlSxP
         4+DegQ0iQC+MuHa2JPe870ToxSpfUwfV6/GIFQZ3f0eKvWX9YjbSMS80ef3KKW53luR0
         v9MPEidGcm6kCnGNGfms+4gmuS9pTOB+78TQKDYpyOgCzCZ8mDn3Psr6ZBeXbNkLslRg
         BQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCULXKU1zKbWu1yrFlAZ5cjbE0OfAX0S6bE3eKAzZIZMdUm7oV24cVgfX06MXfIguZ5/aBX47xn+62UMHA==@vger.kernel.org, AJvYcCWuY7fUXHQB7jVUcSL1N95pb7IOta6Nxib1E58mgE0myCsArjrf4Q/WmPYlMO5TIWjfX/QpniepUbN3@vger.kernel.org
X-Gm-Message-State: AOJu0YxcarXJh/5T1ZOWtHjGDeZlOXLS0lfLdZPnoPTdsFDUCtyrxnzI
	Og55MjFk72C7lu6dUToXmadmRCgXIMBzH1TgGzter9RgVxxgErvqNrpZtAXXiVBw+xeNgebkLTt
	8i1VXZVIlFbbG5lmts3k/QCNbXTk=
X-Gm-Gg: ASbGncuvxJrNVdd8wAWC1BE5I/gtHivqbQCB6Z4WsMB8KtkhO9iIip75U5sRDkhuz1w
	HMBRQZLvB8tRoPfhRiFjQVanNIla2v6wJdqInAi+koEvj/RWnxA==
X-Google-Smtp-Source: AGHT+IGE4QHr9G73D8zQkvDDQ8mEeqKeS2Tfq4nFuFSzm66zIYMnYfUlUlGPFEuD9rv5XZ6qTrUdtOnjhHL2ihE2bFs=
X-Received: by 2002:a05:6402:241a:b0:5cf:5ff9:2a34 with SMTP id
 4fb4d7f45d1cf-5db7d81c82amr5862471a12.5.1737465370151; Tue, 21 Jan 2025
 05:16:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-3-tomasz.pakula.oficjalny@gmail.com>
 <a7df5090-ff71-44d9-83e3-442876522c74@suse.com> <CAFqprmzt2+dngxVDEiLNmR1AmjU0d0AvsebrSz0Y9w23BJ+8Aw@mail.gmail.com>
 <88f81117-a7a5-417b-87d1-a443732c59bc@suse.com>
In-Reply-To: <88f81117-a7a5-417b-87d1-a443732c59bc@suse.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Tue, 21 Jan 2025 14:15:57 +0100
X-Gm-Features: AbW1kvbK0X2_3WMfCYP2T_O3KZ6AXrBziYDWtwxZL4-GNmMOpd1DlVPdPT3LeqQ
Message-ID: <CAFqprmzMDJ+0fwoAtAq4V6j4cSFfTyftNZE2-TENSqQgSd3rtw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] HID: pidff: Do not send effect envelope if it's empty
To: Oliver Neukum <oneukum@suse.com>
Cc: jikos@kernel.org, bentiss@kernel.org, anssi.hannula@gmail.com, 
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org, oleg@makarenk.ooo
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jan 2025 at 14:01, Oliver Neukum <oneukum@suse.com> wrote:
>
> This boolean statement stems from a common result, not from a common
> logical reason for acting so. This is clear because if the first half
> is true, you are returning itself.
>
> This statement would be so much more clear as:
>
> if (!needs_new_envelope)
>         return false;
>
> if (!old)
>         return needs_new_envelope;
>

Okay, thanks for the clarification!
I'll simplify and include this suggestion in the next version.

Tomasz

