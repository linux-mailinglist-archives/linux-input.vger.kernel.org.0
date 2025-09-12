Return-Path: <linux-input+bounces-14658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9135B55338
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 17:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE403B40BF
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 15:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580591F8724;
	Fri, 12 Sep 2025 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYyjBc7n"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E46155A4E
	for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690589; cv=none; b=dxBKyvw/FM+iMGxQUvS+e+ArJNljAWCS0PDe6XibzYCbOVx9fs+j9+1m9FMTHBRg9mdiMIXRdUug3Kd1qD4Qz/CRrPAthFO4A1JElSUn0uUA7MthVpkfQVOCa1D3Km7xPBKU2NtJNUDzxJURKRqKar3TAiy/Ffp35LKU+wyN4Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690589; c=relaxed/simple;
	bh=qfQK1KFcYPPJ1CNxRc+Tj2e7dJSTT19/o9KwxjonLy8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uDAanMQ6skH3zhu9EOIgWtRUOLo9D89V2q0vBdUi0ouXWcwWROxbL7skGo9PXB26nVyT+ZSFvAbbjd4tmdUfHt/uG9WO6IA7t0Wal1JdUP5dLTbsa3rRDSY/+Esu5j4QzB5KkJ0wczXagdCo3pfPJ/mr+AQcrlQiYXoHbsqN5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYyjBc7n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B96AC4CEF8;
	Fri, 12 Sep 2025 15:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757690588;
	bh=qfQK1KFcYPPJ1CNxRc+Tj2e7dJSTT19/o9KwxjonLy8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kYyjBc7n7vykUjZ3JOfgzb9kSOr4ZBTmnDMSLfmgl2PPYaE6RmkgcUJ1tpo6B/2ZN
	 +s/RurQVg+52l1l+STIk5RfgKHUfdp4fDqGgMK1eqU9EFJkdEJFr9bwRZmYkhzcDpw
	 9tBx/IZOuxbZfPyI7PjR3yfDG9r0xPXtvYNBe2GtgZcRO8ZvDLGdifGof6uoMQSLaJ
	 LCIYmpK1F3EQWeYcuGW1Rxq6xWuDi1wIApGvqXxKrbsGJl8w4Auiq8KUYm7sQrvn2N
	 Qm3pTEUASmhKasTmWafDS48pl/Kv2TKsFhFc+vNtYUlkOuQUE0QZhHQwaHcfCcKM1k
	 6EsI10YJuPVXA==
Date: Fri, 12 Sep 2025 17:23:06 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: intel-ish-ipc: Remove redundant ready check after
 timeout function
In-Reply-To: <20250821020609.1947237-1-lixu.zhang@intel.com>
Message-ID: <569r4360-2npo-sq3o-19sr-40r1r713716r@xreary.bet>
References: <20250821020609.1947237-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Aug 2025, Zhang Lixu wrote:

> timed_wait_for_timeout() internally checks for ish_is_input_ready() and
> ishtp_fw_is_ready() based on the provided parameters. If
> timed_wait_for_timeout() returns 0, it indicates the status is ready. In
> rare cases, another thread may send a message immediately after
> timed_wait_for_timeout() returns, causing a subsequent ish_is_input_ready()
> check to fail. Since the return value of timed_wait_for_timeout() is
> sufficient to determine readiness, the additional ready check is
> unnecessary and may introduce issues.
> 
> This patch removes the redundant check and relies solely on the return
> value of timed_wait_for_timeout().
> 
> Fixes: ae02e5d40d5f ("HID: intel-ish-hid: ipc layer")
> Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


