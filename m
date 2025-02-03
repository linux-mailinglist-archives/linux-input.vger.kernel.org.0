Return-Path: <linux-input+bounces-9707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2EAA256C2
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 11:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9160F161BEA
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 10:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E6B1BEF8A;
	Mon,  3 Feb 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDwB0XbD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543BE38F83
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738577874; cv=none; b=Z4+2RD0i8GGqDUDI73yHLzHGWS3fTFi3Qwkng6Df0b6ke9g/oF+/lBG7kmlEHohWm5NMpipi4v4igj6o/Dwt22evxTPOvD8wnNphfHzqMXs7i5I79KyGgryVZWnbh9m4ehfszqVWMJUNUQUWymqLOWqNkd4Ovten04RoCU1WZUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738577874; c=relaxed/simple;
	bh=rmK0ntli1FdiD2wANbKF7BYqJwlUrb4P759zHdS+N/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tTuN1T9Tqk79YJF71gIaEprUBmg2LYUDaEZBhU1G9K5xIFoaIO+a45lZ8LzgzZXNlnUg9l4FmK3+SyUvUucuqgxDJeXozfSv2dz/9vfIlwuNz1r/eGGpIe5ygo7ThuwcACxo5VYrGjVH9ga3AvLuzpIXLjKplI3iiEGJlO512Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDwB0XbD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F0CC4CEE0;
	Mon,  3 Feb 2025 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738577872;
	bh=rmK0ntli1FdiD2wANbKF7BYqJwlUrb4P759zHdS+N/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QDwB0XbDG7zlBKE2m2DvWCbBhDviD9fNPWXkn2jRHl88qXxq6xqJ7cCwoVTwG68P8
	 n9nf+MjzIr++sbP/K3NSZtT6LQWvLzh+ORuJ99QmhlAyPeNwzFqf3QZhCgicyikLFn
	 xoVNhOTioPaPxK/+K3enoTB4pWkgYes8hl3HaG1HPg29W0tvSy6m98rxOlSdx5nJPS
	 ertlbJpyd8wtrgFQaBE0EHDZ5NbnqF2hGKH55ZBw+dL7Miu/2Gi7aD/lkxFtbv6UtS
	 ostD5D0L/ac3+iAqPTEYac5ip6+Od4/18A8ecj/gSrdkgycqbawu3LOHGqV0ET1V0V
	 Fl2xnKp7PoL8g==
Date: Mon, 3 Feb 2025 11:17:49 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Subject: Re: [PATCH] HID: hid-steam: Fix issues with disabling both gamepad
 mode and lizard mode
In-Reply-To: <20250116012816.3478021-1-vi@endrift.com>
Message-ID: <5s2nq40n-so5p-o2o0-rpn2-7n89prp18880@xreary.bet>
References: <20250116012816.3478021-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jan 2025, Vicki Pfau wrote:

> When lizard mode is disabled, there were two issues:
> 
> 1. Switching between gamepad mode and desktop mode still functioned, even
> though desktop mode did not. This lead to the ability to "break" gamepad mode
> by holding down the Options key even while lizard mode is disabled
> 
> 2. If you were in desktop mode when lizard mode is disabled, you would
> immediately enter this faulty mode.
> 
> This patch properly disables the ability to switch between gamepad mode and the
> faulty desktop mode by holding the Options key, as well as effectively removing
> the faulty mode by bypassing the early returns if lizard mode is disabled.
> 
> Reported-by: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/hid-steam.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


