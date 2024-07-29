Return-Path: <linux-input+bounces-5197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9B693FE18
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 21:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB4921C21CF5
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 19:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54DB15F3E6;
	Mon, 29 Jul 2024 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iij0pBbt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B668F6E;
	Mon, 29 Jul 2024 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722280357; cv=none; b=qXcz9TgG4CsbgylgqyVCKxGVhIQeWNEpPQm4Gy8tzoFo7tL8n2FIO5ybZrR0hkcIpuY5LWdRdN+5nFSq0qGRKZMxOLpaofuYnxH+6K5tYhAoPuH+vJlNI+e6GAesNeVb75afLqUsA+/K8tWYKsHSBsZOi5eUR33UMhhcsAcmWzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722280357; c=relaxed/simple;
	bh=EPD2BDyZu9cDwSZXPB6ps8Mutfj93/PSQZdxDtNgZhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfULMT1nShqMFiI1wUzbAEANKe/1xdB3mfQSE/Qxw9LNA2yuHICqXLG2LQuytdqo+AzcPPRHAIf0wZsB703vnBb6dGfLPxx9gr4ODspKhTL62I1j5EtzRoIbE01UHY8hqg9U1W7KBCyCFFDwonxtPnUOWZKeURQAqPsZZD/MC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iij0pBbt; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-710437d0affso2294675a12.3;
        Mon, 29 Jul 2024 12:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722280356; x=1722885156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTQylAUyGjtxW2RZUn8s2GYIyj34iEsIrUfH2V1cUd4=;
        b=iij0pBbtXSMf+PDSoRlwx1iOU/TebWm892G7zBU6537xNBQwxHfc2SnbOP2rlj+dgr
         EzWCjHTW7L9cd2dqugus5AipzItvJ5KP3WbZH2dLWxaz3YfpGxwBZwzfUQa6z4g+7cos
         3A5WjHIeSX6d88hKL5AL4PsHyusP3/wyRrwkSYq+YAWsbzmepLn51+MHVk2FIno8U1k6
         AZw1SjYqcs/KsL6uztrDwjYVSptGIm0iV7/LXt6uVWCZgCIocIvcQy3SlapSPXaVcV72
         TeoNccs9cG/XmIp/KAh8duu6U+eo65Fq7iEx1ihHPWCmHz95TuWVRcuDuc8Ix2jVJbLJ
         ceIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722280356; x=1722885156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTQylAUyGjtxW2RZUn8s2GYIyj34iEsIrUfH2V1cUd4=;
        b=K9OpyLmGyG+zrm+x0SPBW9ejHu47AuAspl6mWCNIUYbfdpsnro14RFSyin+UzHfkcU
         pYgEPFuJnVTOQnQFMqHOrBovu+SVEBYdqQUPo+ebrq1AmhE0vN0hDm7Qbvmv/1gCQlGl
         48Nsh7WLxYkqYJEFtF0yY6Bku+mVZviwOWlBQLdzy/OSbjix1+Q7fPztbNc7bsnCGc2U
         A/W+6y2+maYLgwZm1We8UVaBmfN6NNnpNq89HdzEWv9MLMMs0Qn7VcD/8787LAFiqAt7
         5UsRaRb3H8UCYTqMyuczvEyt/pQBtDT1ig/Kn4o7HD8gtoTJZw9xJ03o8WzFHgdF2HrV
         F2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCU0163LSb1VB8dkEkTiPwP469aZ9P5AjB6434NNyl0oZ0kW2OjXLEKwIdV7FeSRx5B5I15iPPhYOcNOaASh9fLRn1p66SbauMbrND/8qpvkea+YiOp0QLQiQlNoSsKYfHDHGIO/A7X5oAI=
X-Gm-Message-State: AOJu0YyRysHxuWztwLK3C9tcMfb3P/EPniZMbD+ODKmbR+VBkdstS4DN
	8+gkF1506E9dE/Dce26AhAKFRfUBRyL76zFNe2TjiZdgDTU4KQYr
X-Google-Smtp-Source: AGHT+IEqhfooVsc0hFlfiA/Zg4bzKu2nxSQ35s1YFjSweht9P8+D6ayQSXmuwbCURViaHtHwVQa67g==
X-Received: by 2002:a17:90a:c281:b0:2c9:6ecf:89b8 with SMTP id 98e67ed59e1d1-2cf7e71b62bmr6604126a91.38.1722280325409;
        Mon, 29 Jul 2024 12:12:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f53a:d352:6282:526b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c9c764sm8945844a91.26.2024.07.29.12.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:12:05 -0700 (PDT)
Date: Mon, 29 Jul 2024 12:12:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Henrik Rydberg <rydberg@bitmath.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <ZqfpgmmLgKti0Xrf@google.com>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh>
 <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh>
 <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
 <ZqfYfIp3n7Qfo1-Q@google.com>
 <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>
 <Zqfg8FW-SFFedebo@google.com>
 <CAHk-=wg4peLPGB+Lyvdtwxe6nVeprvTbZiO8_=E8-R_M+VyWow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg4peLPGB+Lyvdtwxe6nVeprvTbZiO8_=E8-R_M+VyWow@mail.gmail.com>

On Mon, Jul 29, 2024 at 11:41:59AM -0700, Linus Torvalds wrote:
> On Mon, 29 Jul 2024 at 11:35, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > What exactly did you do? Limit size of data userspace can request to be
> > written? What is the max allowed size then? Can I stick a warning in the
> > code to complain when it is "too big"?
> 
> Look up MAX_RW_COUNT.
> 
> 
> > So does this mean that we should disallow any and all allocations above
> > 4k because they can potentially fail, depending on the system state? Or
> > maybe we should be resilient and fail gracefully instead?
> 
> We are resilient and fail gracefully.
> 
> But there's very a limit to that.
> 
> Dmitry - none of this is at all new. The kernel has a *lot* of
> practical limits. Many of them actually come from very traditional
> sources indeed.
> 
> Things like NR_OPEN, PATH_MAX, lots of arbitrary limits because arrays
> don't get to grow too big. Things that are *so* basic that you don't
> even think about them, because you think they are obvious.
> 
> In fact, you should start from the assumption that *EVERYTHING* is limited.
> 
> So get off your idiotic high horse. The input layer is not so special
> that you should say "I can't have any limits".

OK, if you want to have limits be it. You probably want to lower from
1024 to 128 or something, because with 1024 slots the structure will be
larger than one page and like I said mt->red table will be 4Mb.

This still will not affect any real users, and will not solve syzkaller
issue as it will continue tripping on various memory allocations that we
are actually prepared to handle.

Thanks.

-- 
Dmitry

