Return-Path: <linux-input+bounces-6035-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7472E966F35
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2024 06:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A57C31C21BE0
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2024 04:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6E6136E37;
	Sat, 31 Aug 2024 04:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="op8cSH3A"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288CE136E28;
	Sat, 31 Aug 2024 04:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725077515; cv=none; b=AS/w//F/yZFYYXh1W2tS/1OURbbzcgIFqk3c+ZwMd0h8zg3HlDCnf/VAxTErS4ll3zMEyCUFEYW7DatwvbXC88MNANpUlwT1pmWOOQmm+N+X++EmCaGUqURAYkNuuOEIorI+8e/iEPDBrzP4KkPuL1eQFEePSyrvpwatdzPZGWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725077515; c=relaxed/simple;
	bh=dLgE+FVx0adyGeMGlfD51XiUz+mF2tH98fFCgRSuH/Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GU3/idptIvW5CTEw7yffzkcfzirC02zIbChrKlB0CIFknkHRnoQpDdb+Dkuf99iLIz9pkIVLP1IMzZUbuoWt26TrzEOvDZYDO0pf5XqF5kE20BbCT62lQ9ul6PNDPzFR7Jda49iUUd6xFYn9V9wY9xmYnNToTNm3qCBjsMLqWho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op8cSH3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089FEC4CEC0;
	Sat, 31 Aug 2024 04:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725077515;
	bh=dLgE+FVx0adyGeMGlfD51XiUz+mF2tH98fFCgRSuH/Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=op8cSH3AbMxAdo5LeOdPuPSrcA7fe83SqM2eYqHh7WKbwfewuGiFXkgv1A+s3svGh
	 tBZZXh4W6JzPLYBv2RUHpgvuEjL37ugSevU++iIb2f2hrGOOt6GotyqjHfCBcnfBA2
	 Mf0Wc+f0canT3uZ2q8uEthoK7xi1t/2kiip1Np01sf4f1pJWswU7UNmSXlbcLg06Up
	 47Fzzh6H7cWoth12biZ7/E612Tw8DFVDZP41SsPDJJBH5vZ1uixT9p4TBEWxXBw/wQ
	 /i+uaiUSDBtxK+s5yQtv5ze9Qml47zb5ZUcUnN5dLlLEysx7jAS1r+z7GmYksmf4zo
	 2iolzOwQ0KMpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3D13809A80;
	Sat, 31 Aug 2024 04:11:56 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.11-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZtI7F8X59jgrGp_7@google.com>
References: <ZtI7F8X59jgrGp_7@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZtI7F8X59jgrGp_7@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc5
X-PR-Tracked-Commit-Id: c472d33bcbf7a1ed3710efe93822b5e94eabe18c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1934261d897467a924e2afd1181a74c1cbfa2c1d
Message-Id: <172507751518.2790816.13776451835494059353.pr-tracker-bot@kernel.org>
Date: Sat, 31 Aug 2024 04:11:55 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 30 Aug 2024 14:35:19 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1934261d897467a924e2afd1181a74c1cbfa2c1d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

