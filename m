Return-Path: <linux-input+bounces-5807-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9895DA38
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 02:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7A1BB22D2F
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 00:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7659F15C3;
	Sat, 24 Aug 2024 00:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5ror8iy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C8195;
	Sat, 24 Aug 2024 00:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724458770; cv=none; b=cBadw79JQK9xqFfrHpNrF70xT5SnQx7uuFcmA6zkwue/hddq+GegsACkNKEkytv5W/kzxmUubZX55mORdno++iOVZAEVzGn/fMqM0/FI1MBSzyleu4v8h88MossvpHNdOXpg9LHBztmz9SDurMpyKamwjFqRuaK0PASTJVd63ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724458770; c=relaxed/simple;
	bh=EsT28CcROPma3m2lpicj+C2jrYjfMTifWMEQ1sDAkuI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Bqfa4edIyp0ltlTyh4FxblvEznr8vG8dYptblXo/ttzbwwmp/kQtWy6Jhss4d0u6nm5sHeEthAk1M4xamzHL6g/zkgIxjIsP13GJ+IqBnX/1X4+qkuNgHDrOVLoGBCXplWgYJA/d5qLh0lVKO6c0slG41KywdsuScYbJyseoxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5ror8iy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34396C32786;
	Sat, 24 Aug 2024 00:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724458770;
	bh=EsT28CcROPma3m2lpicj+C2jrYjfMTifWMEQ1sDAkuI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=o5ror8iyTg8KtdQ4/0CnjT0C4NiNdsH2YVE8RnAYTyX7+3pOaWB7a+2Z7GAMfxwxU
	 5BO9UNvWksOx4ZqdEiDO2AWTDQCQn2uAUyYmeNXUwZap2IkTzXatumMovFpOYR5FXN
	 gojYnqrRQY9nsCgOzVz8eSYCJHv4kiiSUTfLAFeHv2cjI0+wuLZ6zCtPGmJ9KjvUE0
	 cEaj0VehInVfgyfJKjUbkn3RXZGLTTpJCa6U/tRlPIyiC01rxmvhhrxp8Xg2j+5Npn
	 nUTBgYUvEvoZiOHYI8FaKwN6Fu6r5NdTSGJS4EBud3C3pzun4QD/pDz/criPOf7AAw
	 YBuEb6BlbkrRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34A683804C87;
	Sat, 24 Aug 2024 00:19:31 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.11-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZsjxnTwQWOaTnPpY@google.com>
References: <ZsjxnTwQWOaTnPpY@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZsjxnTwQWOaTnPpY@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc4
X-PR-Tracked-Commit-Id: 4e870e6bbec5c41c0d8b253282dca9465fbf5044
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7eb61cc674ee0f597e7954d38e4e08fe8c5b19ba
Message-Id: <172445876967.3119442.2903821825834311564.pr-tracker-bot@kernel.org>
Date: Sat, 24 Aug 2024 00:19:29 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 Aug 2024 13:31:25 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7eb61cc674ee0f597e7954d38e4e08fe8c5b19ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

