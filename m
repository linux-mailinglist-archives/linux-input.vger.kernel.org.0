Return-Path: <linux-input+bounces-15330-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC30BC6543
	for <lists+linux-input@lfdr.de>; Wed, 08 Oct 2025 20:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C430B406B50
	for <lists+linux-input@lfdr.de>; Wed,  8 Oct 2025 18:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42438285052;
	Wed,  8 Oct 2025 18:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjWRybVx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4721E834B;
	Wed,  8 Oct 2025 18:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949296; cv=none; b=o1qdurv+rsqN0chby6tyxY/MywLGEa3EDZ9xS5czsSYpn/xaDkSQF9y27sr/5w01DLurOYy3r0yr8m2Ll1q+dyEd4PAopBDseNsWVFvgXdP25zgCwyJ3ea4s3CXFfevf0+AV7HZjhHWbNFWRhRtfD0v6RzmcREHqJ/Wlt6luZgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949296; c=relaxed/simple;
	bh=tp1V94o5yrXzcKqqBfzEKAuqZjo7breuf3jCrnmo2uY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ICjBeOGwfPilXnlbCiEHXMGZ1b/ZHWsmu2o7yrmfd/0nXChD2BZZXnxrop40KehhSy9l1VOzDbDIhWbKno2odwy+MU49Hz5HxNctHdgqtGKwuOoUji9eO8kJkDQwBg6aAkkBZsmZ8Xdlxb/y8rieGrE7Rd8BG41gIvc/v96Tyqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjWRybVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2C7C4CEE7;
	Wed,  8 Oct 2025 18:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759949296;
	bh=tp1V94o5yrXzcKqqBfzEKAuqZjo7breuf3jCrnmo2uY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RjWRybVxw8kpp5E45v259+n7WO2P4zN29M5m4vt99zAO9UQlWFOMfVR/OOHucU+29
	 VD2LpE46u2/DJzofHq4DazMxbsXleuARddyrkPGkWyUkLmGCoykduc7wxVrnlt00nE
	 7tkIc9nnGDdJFYHuAreW+TWmbHa+hJ8qf24xHzqsZPYmDauqykL9g97Lwn5Pj6ucLF
	 6qT3YIQk1mfvBXH5VntTz0HgSe9DZBqsoFVOIo4+w83idShYnTDeYAIEwTl9G/nhTW
	 aesYuRgZgqWxefDAlJnpp3ivCE8DZtKU0gjcuAHjUNWuWSzvUuF6g1+fYjG4B2iKog
	 0eAd5MMPWCKZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3873A4100B;
	Wed,  8 Oct 2025 18:48:05 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.18-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <es25pm67cujd4ufo3uqba5ca3do4mkcw4cdrcdzghrs3tc6azn@d6aejmsh4ywf>
References: <es25pm67cujd4ufo3uqba5ca3do4mkcw4cdrcdzghrs3tc6azn@d6aejmsh4ywf>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <es25pm67cujd4ufo3uqba5ca3do4mkcw4cdrcdzghrs3tc6azn@d6aejmsh4ywf>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.18-rc0
X-PR-Tracked-Commit-Id: 8b87f67b4c87452e21721887fa8dec1f4c6b2b7c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 99cedb6b8f4101e2780f10b9e76d2f346a1e4316
Message-Id: <175994928421.3563654.2135917082340446879.pr-tracker-bot@kernel.org>
Date: Wed, 08 Oct 2025 18:48:04 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 7 Oct 2025 22:23:34 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.18-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/99cedb6b8f4101e2780f10b9e76d2f346a1e4316

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

