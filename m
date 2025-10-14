Return-Path: <linux-input+bounces-15479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03635BD9B3F
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 15:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0BFF19C0020
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 13:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8520314D0A;
	Tue, 14 Oct 2025 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mgh06RUG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7882314B85
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447978; cv=none; b=KZK61wKyImEOwaUfYlwOUvJBWh6eE4foXYRcmOEoCXJWOEPoKxZYWjD3vQ6Rvrokh4BswG65lQMDcDZ5ANxE2QnV92IXla727GXik5puR210Ceg/4bd9nC1AWH7fPGg04HG8wbM8JNXLhXfM9robAvhe1+fJMztyqAI5pHljscE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447978; c=relaxed/simple;
	bh=C+MRmBjk1J2z2iRkv9D2ngOWos9+6YL3a2PnfTpw618=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BuQJzDtEO8BSJFY8w6OJZQXri8cnuXo7HeW0O3GC4JZRASIYS0BHsqvPwiyX+oqCSA4WULfbIwiJFLlC3hx9oWBD1lFta1GY/1tkdz0wHLSb8P3Epk58oi3dD60ZAOwtLvuqtkQnv028zJLVXLC4rWoTkY0vk0XpvZZsIB6ZCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mgh06RUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6408C4CEE7;
	Tue, 14 Oct 2025 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760447978;
	bh=C+MRmBjk1J2z2iRkv9D2ngOWos9+6YL3a2PnfTpw618=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mgh06RUGHYsHSbYdhfaSz+jzkOPybukaIFwSbIN6tqgcDZNEtHpmRwyhHaSWQvuHd
	 EoBYVvI1iCZJBQtD1ACteToVIz2yytS/OJfeLLzr1g/qyRsV5Xv3eKuW1ctTGEUkCQ
	 b5vOgAIIcehmQYqD4Htxf38PwgrdRhn0hdaJlhZF7f25swCAqfvpZmvswBidDdjp3q
	 86xiA8Nj+4EW8jWxTW9upCPuX2wdaGwTx62q8/55kU3CzLjnHFxVBoLXweIZEVi4ii
	 MJTwG5/p08Q+cvZT0XDSwbEyy0Ga2fOlCHWpFvgyZZXrEdVA+cWrOo+CSpV/d9XDSC
	 Nz2Ijv0+suiLg==
Date: Tue, 14 Oct 2025 15:19:35 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, selina.wang@intel.com
Subject: Re: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
In-Reply-To: <20251010055254.532925-1-lixu.zhang@intel.com>
Message-ID: <0r41p984-7qq4-4qp9-s175-1o8q6o7999o8@xreary.bet>
References: <20251010055254.532925-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Oct 2025, Zhang Lixu wrote:

> During suspend/resume tests with S2IDLE, some ISH functional failures were
> observed because of delay in executing ISH resume handler. Here
> schedule_work() is used from resume handler to do actual work.
> schedule_work() uses system_wq, which is a per CPU work queue. Although
> the queuing is not bound to a CPU, but it prefers local CPU of the caller,
> unless prohibited.
> 
> Users of this work queue are not supposed to queue long running work.
> But in practice, there are scenarios where long running work items are
> queued on other unbound workqueues, occupying the CPU. As a result, the
> ISH resume handler may not get a chance to execute in a timely manner.
> 
> In one scenario, one of the ish_resume_handler() executions was delayed
> nearly 1 second because another work item on an unbound workqueue occupied
> the same CPU. This delay causes ISH functionality failures.
> 
> A similar issue was previously observed where the ISH HID driver timed out
> while getting the HID descriptor during S4 resume in the recovery kernel,
> likely caused by the same workqueue contention problem.
> 
> Create dedicated unbound workqueues for all ISH operations to allow work
> items to execute on any available CPU, eliminating CPU-specific bottlenecks
> and improving resume reliability under varying system loads. Also ISH has
> three different components, a bus driver which implements ISH protocols, a
> PCI interface layer and HID interface. Use one dedicated work queue for all
> of them.
> 
> Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>

How serious / widespread / easy to trigger is the issue? My reading of 
this is that it should be merged still in this cycle (i.e. for 6.18), but 
I'd like to have that confirmed.

Thanks,

-- 
Jiri Kosina
SUSE Labs


