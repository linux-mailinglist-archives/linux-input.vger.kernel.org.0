Return-Path: <linux-input+bounces-12596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55D3AC5115
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 16:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91FF716B3F2
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 14:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01085276031;
	Tue, 27 May 2025 14:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YMu/X2AH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="idX/Bz5g"
X-Original-To: linux-input@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263519005E;
	Tue, 27 May 2025 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356929; cv=none; b=GNUPZ8fUY47RzWalwiGLObDRfc/u4FxSYhGW672CwKj7VVcBVH1/q8kYEE6vIh66jOrlOBqEHwby6NmgmNtdOybGzSYgEqQw3bLvfDbVmOwFkzB2pa3e75Zrh+CBbPtIXrCLVtnk4pAxaEehIwLnHW4vy3jpQsNMDlP6jZf0pSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356929; c=relaxed/simple;
	bh=MOQTquOiYjtW1e5l0oNNoSU16XwMR2fQ9/z9D7F3yvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnxkPX8lMHa6N3MshswX73ADTxYujOaMM7+hFonYHrPMZ3IRLctPKa2p8GnJzYkGkYy4BbNF9m8YYo/DFLHkaexjG48ZuJjO1eGyM0fd1zxirwkhXQywgXKKyINPo3GjNnUqe765j+qnYTXR6DHV0Z3xXPcaWN0hU+p8Df45FYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YMu/X2AH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=idX/Bz5g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 27 May 2025 16:41:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748356921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vh0GtLb/Ro7bDE/Iu+FS0sqb8Nr1hUL02cjCHkGR5g0=;
	b=YMu/X2AHwCq8GaB+oFHkv2LrN5ufD3osVAKu0cG1NEqe24amEjMIXVFkGvUqzSlVSu2k0B
	FtefRaXF54fQj7AZba0tCqSP9BwqP2tMz/QJY9F65XXJenLdsetbyFT7aAUY/0F34klng6
	LXspOd6A02gxBeo21QQqgcEuP4R+sTY3RP/xul/hi+c/7MLJWiU4oT06bGMcBb88ms4lwJ
	IpMkQo8EM3Jiptyk2Mowoo/LIbCBnVmzJzxuajXBeuQ0WWCKhCJsKl+bO/ADxx/c/+XO77
	zS1n9NfZQyhEl4V13RAz48ydU6xzRoIELkS/ItLjRUeAPiM5+vtLIDgNw0Sj+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748356921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vh0GtLb/Ro7bDE/Iu+FS0sqb8Nr1hUL02cjCHkGR5g0=;
	b=idX/Bz5g9vlEwoGrjguSpkjCSW9yPyhtB/23GwA3bVwvKweikbbjEtaBzdciETa8c9Q5n7
	YXAFeY/utojEwxDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Paul Cercueil <paul@crapouillou.net>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [PATCH] Input: gpio-keys - fix a sleep while atomic with
 PREEMPT_RT
Message-ID: <20250527144159.Dcstk83c@linutronix.de>
References: <20250526-gpio_keys_preempt_rt-v1-1-09ddadf8e19d@foss.st.com>
 <20250526141321.FcXEgnV4@linutronix.de>
 <661af124-3072-4dcf-b613-ec3e48549626@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <661af124-3072-4dcf-b613-ec3e48549626@foss.st.com>

On 2025-05-27 15:36:37 [+0200], Gatien CHEVALLIER wrote:
> Hello Sebastian,
Hello Gatien,

> Can you elaborate on "This flag change makes not difference on
> !PREEMPT_RT" please? IIUC,this makes the callback not run in hard IRQ
> context, even in !PREEMPT_RT, no?

If you set
- HRTIMER_MODE_REL_HARD
  then the callback runs in
  - hardirq context on !PREEMPT_RT
  - hardirq context on PREEMPT_RT.

- HRTIMER_MODE_REL
  then the callback runs in
  - hardirq context on !PREEMPT_RT
  - preemptible softirq on PREEMPT_RT.

- HRTIMER_MODE_REL_SOFT
  then the callback runs in
  - softirq context on !PREEMPT_RT
  - preemptible softirq on PREEMPT_RT.

Therefore if you switch HRTIMER_MODE_REL_HARD -> HRTIMER_MODE_REL then
it is a nop on !PREEMPT_RT.

> Regarding the need of the spin_lock: gpio_keys_irq_timer() and
> gpio_keys_irq_isr() appear to access the same resources. Can't we
> have a concurrent access on it from:
> HR timer interrupt // GPIO interrupt?

Yes, it could.

> But looking back at the patch, this situation does not depend on
> the HRTIMER_MODE_REL_HARD flag. So maybe it should be addressed
> separately.

Yes, please.

> On the other hand, I should use the new
> guard(spinlock_irqsave)(&bdata->lock);

Yes, please. The other instance already does so.

Sebastian

