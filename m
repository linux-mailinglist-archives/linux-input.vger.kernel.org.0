Return-Path: <linux-input+bounces-12590-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBA7AC4115
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 16:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF6567A1710
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1422420E03F;
	Mon, 26 May 2025 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kweY6+yN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cWDL0IpV"
X-Original-To: linux-input@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D1C1F4CA9;
	Mon, 26 May 2025 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268813; cv=none; b=BA1+oxA2ZFN97SpT0jQpcKAK5spJrQkeENE2Hy+lqMvmT2MyySf3f8c/KjLtLAim1SCtXDzgjnLlrlMIPUzxn13oA26o+VgUFvM6iwhAPGAjPLXg460/gC0keVfH157fg9hE9ElZRVEo4puHQY9I8ssQFQwjPjrJQB2wU7zAkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268813; c=relaxed/simple;
	bh=f/owXgw9ScffIZ00lD0emc5hYUqH3HyegNXO81QgkG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2NfzUc5R4H8/dFZZqBC0U438wp4+xshgh+BwzqV6iqwMfWsLi1HevXzlD6nneIhmhlWH77cr6K/rtlOTGreO59fOFEB/+uQAYWk/YJicyuLzMadpZSEmpLizZg4oXqgpuldSTx1UWXcCKb3h50Gk/GqHzx9xwOLQySveoVvOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kweY6+yN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cWDL0IpV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 26 May 2025 16:13:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748268803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uhU0WO2dQAMWj/kzo5RVQUeOaaIgHRmgMITsK6Sw2ys=;
	b=kweY6+yN8B68AUYrYcqV1Qi+ANpB+ee5JbUG4f2L6shs3fvVQ363hZNENe+HgoV9sfC2Ok
	au11olbnNO9xp91XlKORj6KgM4aYwE+1Pc/teowAikr+LhjVQ9rYyG60BQHV0uLGzS8fbK
	wxiVnb64sM06R89wPQqgjGeaxoZ6Leav86sP47YanFjD8J9rwQN8ucLk3Z70q1Ak5EJMT3
	W6pfnA0LaleufYo97QCGxt88/0AFjeBlXzAoOjYdD5/u9ToQNwJhFbbIY0TNntn+1JxSaC
	PCkyiJeN78NWC6N/0xLklh0AzOGZVfAVhq9XO3CbWdFTJjm06V7IIYx796sBGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748268803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uhU0WO2dQAMWj/kzo5RVQUeOaaIgHRmgMITsK6Sw2ys=;
	b=cWDL0IpVJmoFSU7EMfTMYxeuQrgWPOhe2U3BErDJBl4Is3vzkkXnvBJmg9Lom81NAZlZFZ
	tPh+RJXesfcHoiDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Paul Cercueil <paul@crapouillou.net>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [PATCH] Input: gpio-keys - fix a sleep while atomic with
 PREEMPT_RT
Message-ID: <20250526141321.FcXEgnV4@linutronix.de>
References: <20250526-gpio_keys_preempt_rt-v1-1-09ddadf8e19d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526-gpio_keys_preempt_rt-v1-1-09ddadf8e19d@foss.st.com>

On 2025-05-26 15:56:29 [+0200], Gatien Chevallier wrote:
> From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
> When enabling PREEMPT_RT, the gpio_keys_irq_timer() callback runs in
> hard irq context, but the input_event() takes a spin_lock, which isn't
> allowed there as it is converted to a rt_spin_lock().
> 
> [ 4054.289999] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> [ 4054.290028] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/0
> ...
> [ 4054.290195]  __might_resched+0x13c/0x1f4
> [ 4054.290209]  rt_spin_lock+0x54/0x11c
> [ 4054.290219]  input_event+0x48/0x80
> [ 4054.290230]  gpio_keys_irq_timer+0x4c/0x78
> [ 4054.290243]  __hrtimer_run_queues+0x1a4/0x438
> [ 4054.290257]  hrtimer_interrupt+0xe4/0x240
> [ 4054.290269]  arch_timer_handler_phys+0x2c/0x44
> [ 4054.290283]  handle_percpu_devid_irq+0x8c/0x14c
> [ 4054.290297]  handle_irq_desc+0x40/0x58
> [ 4054.290307]  generic_handle_domain_irq+0x1c/0x28
> [ 4054.290316]  gic_handle_irq+0x44/0xcc
> 
> Considering the gpio_keys_irq_isr() can run in any context, e.g. it can
> be threaded, it seems there's no point in requesting the timer isr to
> run in hard irq context.
> 
> So relax the hrtimer not to use the hard context. This requires the
> spin_lock to be added back in gpio_keys_irq_timer().

Why does it? This needs to be explained or it deserves an independent
patch/ fix. This flag change makes not difference on !PREEMPT_RT and so
should be the requirements for locking here.

> Fixes: 019002f20cb5 ("Input: gpio-keys - use hrtimer for release timer")
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Sebastian

