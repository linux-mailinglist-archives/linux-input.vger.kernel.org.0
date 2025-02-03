Return-Path: <linux-input+bounces-9696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097DA25648
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 10:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C56188878A
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 09:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BFF1FF7DC;
	Mon,  3 Feb 2025 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRUc6G6+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0E91FF7C5;
	Mon,  3 Feb 2025 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576322; cv=none; b=AojEyEPYioDeEyr35f0w5tTexeIMzqbeWzZDxYA759gm2eJ3cq5y3bN3HFGem8Xoax3GhbaJ8OtDrZEeRxYhsTwzP0JwR8CYhUFTvFMZatB4wSU2G0jP0Gb20Z4U1hETAC+9qCm5KEer5JGnjHVt64IvbPoB8LMekVfBxYCPWfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576322; c=relaxed/simple;
	bh=I0KMMmpyE5DZlJ+WDUuR5PUPci0wxPrWePLARBPU3d0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RK/r2p5k0TdlWU2KvCvBbTJCptk4FizY07/2q2xbF1z8P3C+uLdpju8MiMljqprDplQ1Szmr94AhLggNfXzMpjobnyals5U8ySOne2dbl4lGx5SPrtVGSB6c7rMAW9bM1Hsx2kKwGqEh7jBgZVlQ1M+hGFM1rdODqUDP9d24LFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRUc6G6+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D366C4CED2;
	Mon,  3 Feb 2025 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738576322;
	bh=I0KMMmpyE5DZlJ+WDUuR5PUPci0wxPrWePLARBPU3d0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dRUc6G6+rkKQk4Jo64DsS9eqK4LNbHutgS8JQUbGg+ETsPgeTanS7faVFUZK6Epzg
	 ITNN0PhNDF0yy7XaPc+UwHh6Tw+XIL+b5u3/WjoK/unFHhjEcLK/kphEI5uKaKHETi
	 yK81aqVaKGo4Squ7Rvttx5GVsOians48W7AumEqOMpLfhptASKtxdlhlhM8P1M7If5
	 +g9D8N/3o8vQZWPBbIP2BU5BgI2nZav/1QH2f+fwFAvVkRP/8gDgXwxVqDpH08Pwz+
	 uC5VEtn/MH9ZgI5krMef43MJPiMCH296U7+ohvBWRgH2l2bC61kpOjo16Zw6gbXE5E
	 2pwZsg307balw==
Date: Mon, 3 Feb 2025 10:51:59 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
    bentiss@kernel.org, kangyan91@outlook.com
Subject: Re: [PATCH v3 0/2] HID: corsair-void: Fix various memory issues
In-Reply-To: <20250121200017.33966-1-stuart.a.hayhurst@gmail.com>
Message-ID: <1q80p6s0-os85-so63-76q5-98orq2rp1q1s@xreary.bet>
References: <20250121200017.33966-1-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Jan 2025, Stuart Hayhurst wrote:

> Fixes a use-after-free and a struct without an initialiser
> 
> Hopefully I got it right this time, sorry to everyone
> that got some extra emails
> 
> ---
> 
> Stuart Hayhurst (2):
>   HID: corsair-void: Add missing delayed work cancel for headset status
>   HID: corsair-void: Initialise memory for psy_cfg
> 
>  drivers/hid/hid-corsair-void.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


