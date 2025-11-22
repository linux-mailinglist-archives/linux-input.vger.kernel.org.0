Return-Path: <linux-input+bounces-16299-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F9C7D58C
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 19:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C5944E7493
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 18:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB5729AAE3;
	Sat, 22 Nov 2025 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnkgdeyg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0240B29A33E;
	Sat, 22 Nov 2025 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763836224; cv=none; b=ArKjsTDO8SlDZjuZTgCMgNlcCLafZZdaS8ZiA3pq5WTlYHs4xBgiEOS4KcRQMVxrO02PP644Bf+OUCUImBDV3PwGenlPOlCMjEGq2jJBb2cQD2qDatJztsQReg68z/jn1DXEsMvVYiv5Pzez9rtCQaNBo9TkHGKfy6TbptcHX2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763836224; c=relaxed/simple;
	bh=95moZ6Hz/5885Xx3nT3RQj4ZC3J7kv4qH44xRJZ1eGo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=EyWmg+crS8TyLzAjlhOJT/eOT42iEwbUjA6wV/Uu4B2OTKaTP2Qq659jI4V0fl9NnRSqQAIJTIWrpvkh6pUL+lDL8J66RViLOftjgf1P0QsqDliQz3fdCBRo4rFfrFnEk+Vmq3BD5bOrLU8/B1QucZ2CW3dBNUyJj9SqcFrn/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnkgdeyg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611E6C116D0;
	Sat, 22 Nov 2025 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763836222;
	bh=95moZ6Hz/5885Xx3nT3RQj4ZC3J7kv4qH44xRJZ1eGo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fnkgdeygBxPcezXinP/tgje86UpRwxizF2M9d2IeQEYS0M7ShAsEBDXvJNHA7XAqn
	 4U9ltrU9Ak0dyibeGQWw4j6kVJKoKSvwISssrC0zQj9KA4eT/UggcZRhKlR8YD3ee7
	 siRM4q7yCNg/Qqs726XH/xWtZWMLyVvNy4/Br3EEHW8NtVUPrkSZGB/APk1dgA7SqX
	 y0+GpxZ6FVne7rz27pDuBQ+r6P3CF2yOnc8EqYe3+H8lG2IoVK2tWXlwc2QMVj6Vbf
	 5Gl/R+hgdfod7hQ4RP5/WV0X8jxpO5as9QorTytd8mrbhbd82CmxHwTeZ5K8054Wrv
	 8Q+1nkgKnTo0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0D3A82577;
	Sat, 22 Nov 2025 18:29:47 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <s7ye6uffvflxyk543emnmjsqyjc6d22scy6qcr52zegssmdtwj@wswhzowey34g>
References: <s7ye6uffvflxyk543emnmjsqyjc6d22scy6qcr52zegssmdtwj@wswhzowey34g>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <s7ye6uffvflxyk543emnmjsqyjc6d22scy6qcr52zegssmdtwj@wswhzowey34g>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.18-rc6
X-PR-Tracked-Commit-Id: ae8966b7b5bd69b86209cc34bcca1ba9f18b68e6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebd975458deada5eadcc9f4e0f63fc4ce6aa90ea
Message-Id: <176383618617.2850055.12498253648219123118.pr-tracker-bot@kernel.org>
Date: Sat, 22 Nov 2025 18:29:46 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 21 Nov 2025 22:47:12 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.18-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebd975458deada5eadcc9f4e0f63fc4ce6aa90ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

