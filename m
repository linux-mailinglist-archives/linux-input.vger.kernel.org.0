Return-Path: <linux-input+bounces-5600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B403C953E98
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 02:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D87B1F22028
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 00:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6304B8489;
	Fri, 16 Aug 2024 00:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2AY1jnj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D353BA33;
	Fri, 16 Aug 2024 00:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723769865; cv=none; b=NaK78ISC5JYCt2fAfXbwjM1Kb7WbJ/x1CchBSN84ERI4L5TAiB2+kgVElv+uIhk2J3m0bdeWbwvCNGF1uN6Gom0Q58dnwgTdiXRsr2W2OylLtnR75XRKR0wOos5ebSkkeMcqQZRej+uNwbkOg81A2qqizeXED3ZPxEUus7SdC9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723769865; c=relaxed/simple;
	bh=Te2VjLrEuMk2vMR7p1swSHCJGVuECBgHDst8xkmjL9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7RnUc31oZUKXPWipXOKBRUt3aYPmahHr5sn7LQvB54Jh87c9qFgxywLHj7iAF7wCuzwqLW8m7tsP+a4RSQEoyGSw5kqlGPjtFCgEmIS7wtqCwDgz+lc0nRQgyeP4obBlSclVpcD1klFfKTW81PRW52ZJ276R0aof8uUgRVF/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2AY1jnj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36d2a601c31so767691f8f.0;
        Thu, 15 Aug 2024 17:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723769862; x=1724374662; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Te2VjLrEuMk2vMR7p1swSHCJGVuECBgHDst8xkmjL9Y=;
        b=Y2AY1jnj6uM92IxI3Z3o63h8bFbHfVJ7YHivB+eaxQ13OuMGTnkwiiggL6eo/JzC+D
         /GvUwHhVF0oaX4fO4SdWcnfgzW/1MwqlaBYe2A+3mKilx8SHEOWWVTs+3x1GKG8uH5kp
         j1XfWYVcr4sOMxOuJ7e4YGzzzILv0JoQ8iUzEI9FmW/zB0Sh7X9aqjh27YNT5jzhO+LQ
         Y31lT9FjnNpDw9joqjBqN1V6pRLjU1C+lOk/XvJhTqwZbtzOeY/1cxjLLl7bWuRjtwuc
         ZzydD8DuRwrnjNIfY87W29gDt2hMPxjeTHPTjVpWrN4sW8g7yjNkzk50Q3ORo8/aOXsx
         1KdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723769862; x=1724374662;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te2VjLrEuMk2vMR7p1swSHCJGVuECBgHDst8xkmjL9Y=;
        b=K0Vlv9iq2u3JM8dZhXgBaMpngp+HYxPu85ficI4jvvHCtm5cFRdWwc+Rs88ybWRks2
         +/jBK+dulncEmSE4/lCj0MsnkHV8QsmA+eh8dvVP6mawLPo7p/goDArskB2rLMS/AJbP
         ISnAmV1R3l68VrJNokFeL+7k9n5tx0Db5RsBdmDYYH021ylHpwwzeo1ABm4Ji0H8t8kk
         /fh59KjTJ9OyDvJaNyVtq4QBQRmmP5BO/+R56k4Hs4OUgopFwsgUZT4Iz0GoonLi0ErH
         6jHjfjsXUdupq6NKdyClclGIpLJorDMHExnNK2m96GysPsaRMddcwWTOmiu2CcKF5V5I
         2c8g==
X-Forwarded-Encrypted: i=1; AJvYcCWjye1lq9+HKLpn9uk7qCk//piITdiwSJ10chtaxl6ikqSPYijQZkK3vI1DGnGyWgrGjQ9yeVu0esI6rHGXNis1FAWRFe9yKOUDUaaa
X-Gm-Message-State: AOJu0YyrmGxOHtnC/JubCSRz6Qea1q2nSq4zI6B5bBQ+9FgTBh0pt/AA
	dD5+vlnCPkUhcBpiQjqqTsigSQRUuJscU1LWJqi3jaiH7qIrBprOOjTiSOto7aRhfjYfESyhIrp
	UPtY/BagfdBhfr7Pklh5USBq1poU=
X-Google-Smtp-Source: AGHT+IHIrzJEHY7Kr+5iooCdEWn07k6JLQJms7hPfbM9bdYG2kPp2OXRekN7UxAC0AbNTZH1B9E4MUeD57ZJYiFj18w=
X-Received: by 2002:a05:6000:1006:b0:371:8eaf:3c49 with SMTP id
 ffacd0b85a97d-371946a32a9mr647946f8f.40.1723769861196; Thu, 15 Aug 2024
 17:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com> <da4ca647-6eef-4576-9882-c5ffeddd1f7b@web.de>
In-Reply-To: <da4ca647-6eef-4576-9882-c5ffeddd1f7b@web.de>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Fri, 16 Aug 2024 01:57:30 +0100
Message-ID: <CALTg27k7jMNReN-XxGC+XW6Kw_+N=HB+oKDHX1VAgTuaAoyDbQ@mail.gmail.com>
Subject: Re: [PATCH] HID: corsair-void: Add Corsair Void headset family driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Such information should not belong to the change description.
> It may be specified behind the marker line.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.11-rc3#n711

I was just beginning to think I actually had the format right, thanks
for the link

> Will any enumeration values become more helpful here?

Yes that's clearer, done locally, it'll be in the v2

> Please improve the size determination (or explanation).

That should be 2 bytes, thanks. It doesn't really need to be kzalloc()
then if the whole thing is set, the same goes for the other calls to
kzalloc().
I'll change those to kmalloc() unless there's a reason not to.

> I guess that you would not like to preserve code which was commented out.

I did mean to leave that there for the v1 only to ask if it was
worthwhile leaving, but I forgot to ask about it.
There's a comment ~16 lines back saying to use that exit point for any
failures after that point. It was a reminder while things were moving
around a lot, but I can drop it now if it's not worth keeping.

Thanks for the review

Stuart

