Return-Path: <linux-input+bounces-14703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869AB56A48
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 17:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A66B1189B369
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 15:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34442DAFA7;
	Sun, 14 Sep 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKENvc1e"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74D82D9ED8;
	Sun, 14 Sep 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757864589; cv=none; b=GOhvxpgFaLdvoFOpmYggnJwu6pkkJONLZF9b/ju7VvAy+uh05KLnmvaxNvUYUcvz2CmHvgLSYsWIgcZsbudPDp04C7ZnJQxEmgQD/Sne1Wy5WLMslzkJpbY1MHjhn8AqoRHnQF8P8+yr43kr/nQQ6ttXDbH/+xpQMqbAxFa02nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757864589; c=relaxed/simple;
	bh=9001B5HaZrz6Q3CQIwyU+IspGpd28KUY6na6wCKgS30=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KrNmt8B5tIwIkNy03AsVR46pzoK4MuVI3RUxkx5lQodn+3uaMnDXwqs2YydfjMBITkf5hlDj/n1PGpPyaSvMXtPCGM5fttY3PCVLfj7RdVkVI3HvhXXKZRMMKj6PfU+Keio5YwOGEa5aRlt2P7H+12tj65iWOzpPOstw4T0JoyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKENvc1e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E81C4CEF0;
	Sun, 14 Sep 2025 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757864589;
	bh=9001B5HaZrz6Q3CQIwyU+IspGpd28KUY6na6wCKgS30=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eKENvc1euTfQDDtUosUmW9N/Ml0ta2mxHd+kD/tw94UaBISYCMGF6QK5cl1LF2uW3
	 BhkJzH4M3v0YlDdfMtnB/mXPmgEAJ2uBjUaqtIpHpFBBlpc34kDzRJoOLelWlqE60l
	 xd+Z9q6c7QJoGP32e/KjJEvGbCVaaiob1VN4iU0LqnfojmiROMS1SrbCHNlQBC0nDd
	 sKMQhtMIZqXlOcgmIp5VQT4I1lnukAl9wyABQPOoqQ1J3gaU80w1Ci9ZvQu6LA29i5
	 d7HPptvclwYhFx83DL4j2mWycvs/FiwYftl2+ysMzRuslJTUfPsmDaY6tP9UW1PS2C
	 oaXGGIe+swD/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF7E39B167D;
	Sun, 14 Sep 2025 15:43:12 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <pr27r442uxseunxtnoko5fquveeb2qg7kxue7uht4marr45ais@ce4alsq7hatm>
References: <pr27r442uxseunxtnoko5fquveeb2qg7kxue7uht4marr45ais@ce4alsq7hatm>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <pr27r442uxseunxtnoko5fquveeb2qg7kxue7uht4marr45ais@ce4alsq7hatm>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.17-rc5
X-PR-Tracked-Commit-Id: 30989f67650cbf8dc763f7c22e3a210f70a8d7d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 563b3f6ef521895045117055bf3ee08fbe27a8a7
Message-Id: <175786459138.3496327.2667667875447283955.pr-tracker-bot@kernel.org>
Date: Sun, 14 Sep 2025 15:43:11 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 13 Sep 2025 18:20:39 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.17-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/563b3f6ef521895045117055bf3ee08fbe27a8a7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

