Return-Path: <linux-input+bounces-13944-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE4B22790
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 903C11663E9
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6D9242D94;
	Tue, 12 Aug 2025 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIY+lz+E"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC9218827;
	Tue, 12 Aug 2025 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003233; cv=none; b=pcH5FVZYd5AtQIVQIYQ9DQfrfnT5ZMsedGmV+/0Qda2kZenb+v8JygP7AMjl5JSu0rKpbwWmSBb5wNmNXvcKyPHbKs6/EtgQavVj7RwAI9hvKpV+MrsAe/89kw+AnqdMsbZ3eO5WBRFFuSf5xTKDzPdqRRJYSU9+lWf4DlWBwiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003233; c=relaxed/simple;
	bh=666ZXj4AcCGhbJLahDGjx1GCcakbB28RNTMrqfv6E4A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T+4M+RPjrdVwV3kODgNPKxkoUjQ7i7266BdRBCntsrxLlyGhZyeUF4kNa88Pt+jl4mButCq+JptYTklY5uP0C5ZlIoXfYWeGXRSci3RwFz2GHuJT/beCadPJN2Y/tYQjcqLFZo3/0F7Hel6Ws7Lg0+Y+ECSA5jX53wW8KKWHtOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIY+lz+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA18C4CEF0;
	Tue, 12 Aug 2025 12:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003232;
	bh=666ZXj4AcCGhbJLahDGjx1GCcakbB28RNTMrqfv6E4A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TIY+lz+ET3rAnLo6IC2MSXSkyN40+y5baa98nZ4mi8hqGfVOmvx6ctMH0Zd2zzFJC
	 V714BBgc9tXAt6G3uRGjF2ypx17i50VgvT0o1szzHhJmU+KjWPeWf/JEQWH08Ds+DN
	 doY38n3tDWyZSOV7vavq0iwxxJL8gN0uUmt3CCUgB43L9bXyBk8X7eqke6pWArvG6G
	 rNa2qDensbtOKY+ppdRMyYMjWM6vfImXKlKRebHuqf4JiY5hS3+f3VAKILt5cTQUA5
	 L0LZAvWkG+ibNC4tM8ITMYiCqw2qfnA6dtSuDq/CkHNUlYWuSgJcBzo4mJPOHc80f+
	 pslRSOpSk7/lA==
Date: Tue, 12 Aug 2025 14:53:50 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
    Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2 RESEND] HID: multitouch: fix slab out-of-bounds access
 in mt_report_fixup()
In-Reply-To: <20250810180924.44582-1-qasdev00@gmail.com>
Message-ID: <6o42n3q5-sq57-q7nq-rpn6-50np33r5ssqp@xreary.bet>
References: <20250810180924.44582-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 10 Aug 2025, Qasim Ijaz wrote:

> A malicious HID device can trigger a slab out-of-bounds during
> mt_report_fixup() by passing in report descriptor smaller than
> 607 bytes. mt_report_fixup() attempts to patch byte offset 607
> of the descriptor with 0x25 by first checking if byte offset
> 607 is 0x15 however it lacks bounds checks to verify if the
> descriptor is big enough before conducting this check. Fix
> this bug by ensuring the descriptor size is at least 608
> bytes before accessing it.
> 
> Below is the KASAN splat after the out of bounds access happens:
> 
> [   13.671954] ==================================================================
> [   13.672667] BUG: KASAN: slab-out-of-bounds in mt_report_fixup+0x103/0x110
> [   13.673297] Read of size 1 at addr ffff888103df39df by task kworker/0:1/10
> [   13.673297]
> [   13.673297] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-00005-gec5d573d83f4-dirty #3
> [   13.673297] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/04
> [   13.673297] Call Trace:
> [   13.673297]  <TASK>
> [   13.673297]  dump_stack_lvl+0x5f/0x80
> [   13.673297]  print_report+0xd1/0x660
> [   13.673297]  kasan_report+0xe5/0x120
> [   13.673297]  __asan_report_load1_noabort+0x18/0x20
> [   13.673297]  mt_report_fixup+0x103/0x110
> [   13.673297]  hid_open_report+0x1ef/0x810
> [   13.673297]  mt_probe+0x422/0x960
> [   13.673297]  hid_device_probe+0x2e2/0x6f0
> [   13.673297]  really_probe+0x1c6/0x6b0
> [   13.673297]  __driver_probe_device+0x24f/0x310
> [   13.673297]  driver_probe_device+0x4e/0x220
> [   13.673297]  __device_attach_driver+0x169/0x320
> [   13.673297]  bus_for_each_drv+0x11d/0x1b0
> [   13.673297]  __device_attach+0x1b8/0x3e0
> [   13.673297]  device_initial_probe+0x12/0x20
> [   13.673297]  bus_probe_device+0x13d/0x180
> [   13.673297]  device_add+0xe3a/0x1670
> [   13.673297]  hid_add_device+0x31d/0xa40
> [...]
> 
> Fixes: c8000deb6836 ("HID: multitouch: Add support for GT7868Q")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> ---
> v2:
> - Simplify fix with a if-size check after discussion with Jiri Slaby
> - Change explanation of bug to reflect inclusion of a if-size check

Applied to hid.git#for-6.17/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


