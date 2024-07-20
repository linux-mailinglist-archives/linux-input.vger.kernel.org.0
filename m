Return-Path: <linux-input+bounces-5102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EDB937E62
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 02:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D89141C2157B
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 00:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938C85A7A0;
	Sat, 20 Jul 2024 00:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6FuOh2m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF8C5A4E9;
	Sat, 20 Jul 2024 00:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721433951; cv=none; b=beYV1GTq4DkO4d/m3Kc5Rp7QG7ppEbo4/KymF3jBZuBmxc9aPdJXjxSvnx2UFm29+ey2niu6fHlbDwb/nZ0EFTz4DsmlK5SXziwJYbpC1f1u7VULV1n5xx6LYLB3IDG86jov3N6fXwcBRxwziO4CcoWGg8yFgf/kyxDmwE7MJ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721433951; c=relaxed/simple;
	bh=pvG0czPzHFM4ORiAcMrKxY+J1FA0rAEhv0hfu+a4Tz0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BhgElyIBZFbU6nRYsVluhV+hkjXesqOkxl3HW/kEohtBpXJ5rLZFI3lSaMr/gfaRq+8G6MnKDa96ePysxLH8ZhZUE/P5IpBd1ad7h2aHaH2UdhBbgfsI8UbGX4kobjQFugO8x4wslWhcRc9nYyjnmtgscnwwznmVnBMNnJPpPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6FuOh2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BB76C32782;
	Sat, 20 Jul 2024 00:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721433951;
	bh=pvG0czPzHFM4ORiAcMrKxY+J1FA0rAEhv0hfu+a4Tz0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p6FuOh2mn2C+Mn31TKqfkM+qHfFkbFPpUphqwZdm4Xc3YhuApwScT4TB++l+u0gUi
	 H3dbG+UuXUvH2LiDcrN4Qy0Nc8mTPxMeIwRWlnVHX+VnEAmPoOqbxJaDAJFSpxUi1b
	 tvCvKGgaUMeeQsFlasYYjZcixleeS1kFmRItfaeR7+BlgWDuY4XpoqPJJumHNQO7PX
	 w0Ibevv3oSKBKycVRYVMVXYJtBonmRNtBvZC1qpbkCilUE5ea60BZbRA9cT1Tif1GQ
	 5/t+Hxriq5vu3UlON3Unpp84Rf39DLwsS7cM0Iv7DvvNrFF5iZpEsFzs11LWV/pZBY
	 V+bKvGArJTLew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42B3EC4332E;
	Sat, 20 Jul 2024 00:05:51 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.10-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZniqQuGkosZYqIYE@google.com>
References: <ZniqQuGkosZYqIYE@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZniqQuGkosZYqIYE@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc5
X-PR-Tracked-Commit-Id: 0ca1323c6aba8fd9309ca33a4bf57c1c9fc06171
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 866a5c7e2781cf1b019072288f1f5c64186dcb63
Message-Id: <172143395126.25682.14546224235350071565.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jul 2024 00:05:51 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 23 Jun 2024 16:05:38 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/866a5c7e2781cf1b019072288f1f5c64186dcb63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

