Return-Path: <linux-input+bounces-15578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B63BBEA4FD
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 17:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D199C745533
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 15:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86265330B0D;
	Fri, 17 Oct 2025 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esEOk0jE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A2330B00
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716051; cv=none; b=i71wrodf6wVb40NyEwg18gYlZgjlgV5CkH8BWSYciAs/OLeFzbLwZhGnnMECTdFcDEXDDFdL90O0q76TOodopTqW4dENhihQljbRbkIYLlgZSvBB/UaAf2cU/Q+i6Rb+x5Y4rA3GwLe+RR+Gl3RtowuhlSD/a8ZR479IX7Z2qFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716051; c=relaxed/simple;
	bh=OR+W4KFYahnrdqrd1rRLQvTpoyzVOiQr/lbtuKXbcsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F+5uH4rfqDSTZZf4Az5PtPBp8h9RUwSk5HCWc288FMZ98pG9HLzg9yIQfHZ063NOSYg30KyUQQ2nes9OGq2OrE1q0t/vB1g9INLTnCHjF1SjKOgdxpbhJsucSfs2viI5ZFsl6a2dO2XMQVklhhZrHZKbqA0kEMeiTPR/tcypILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esEOk0jE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C1C113D0;
	Fri, 17 Oct 2025 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760716051;
	bh=OR+W4KFYahnrdqrd1rRLQvTpoyzVOiQr/lbtuKXbcsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=esEOk0jEdqpdkkNVsTN6W0YzHXnRbWA1iJ4dJ4lvc2xbicUI514uYZESgpFnWIBxx
	 T06bl34SQ1tyfbYAhlkQ7aciHFvRi6v2IdUqNCksVmRkQVCGoRYkz1gH/Nmd9BAKUv
	 uk6CaiPWu3GpUxYkn8RslOLaBPeGc9q/em7ko7skKT0epTNw95Gy1Lh9RLKmdzOpQy
	 gVG0BOug3H5WGaqMJqtipoF9RUabVdaOHugUOkj/v6QUqf+jGra4OhQIEZi8c9y5rH
	 QP19wJQQTtOExK3QjYwUdaXRsKiP427xID2zlvG8XdmXZeurPzPWr1YlEwnLdhBA1u
	 jSbFLCgiGIhPQ==
Date: Fri, 17 Oct 2025 17:47:28 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, selina.wang@intel.com
Subject: Re: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
In-Reply-To: <20251010055254.532925-1-lixu.zhang@intel.com>
Message-ID: <36041o9s-7o74-0925-op71-83q3052rn4p3@xreary.bet>
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

Applied to hid.git#for-6.19/intel-ish-v2, thanks.

-- 
Jiri Kosina
SUSE Labs


