Return-Path: <linux-input+bounces-10861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2645CA6333F
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 02:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464383ACC7E
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 01:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CB054673;
	Sun, 16 Mar 2025 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bo7IIcG9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4B245C18;
	Sun, 16 Mar 2025 01:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742090307; cv=none; b=SMOceCRWIOZzjudKgYNMIb/GzxIE6I5yzR9LDBmH93J9NrH/NQ+57z6hj5BbhvewNotuKIhg9+kbUWhk8KiPb/gbqJr8gcb5GigvA8LbMclTmviNsZiJXnVv/eSe76phoSzk98DYyyxKrLLZ64XHKQ8n9Oy8DuJzHh4LhUAyOaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742090307; c=relaxed/simple;
	bh=ee3g8qfjI5nuKVpAMRDbFYvRZ/ZWFphZy2P2A8f1cQA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cm4ckxW+ANb/K7zyf6mtFwAZielxx9OdHH05VEUMpQqfgHJTYgIyhrJB7fOmlHsYVQlZQsQGplm0EMirIw+Nb6oI//SaQwFOQqiJMNhL22Cqz4gDNm1AUKrDMeocgjmFeE0QPeM6ZSMS87A+HhHxhm9B6Gbi6FghCoO5Iz5BnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bo7IIcG9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7C8C4CEE5;
	Sun, 16 Mar 2025 01:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742090307;
	bh=ee3g8qfjI5nuKVpAMRDbFYvRZ/ZWFphZy2P2A8f1cQA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bo7IIcG98eq36obMXe65d6+eRmUTwCHm3tS7D+0xB73pmjwDe8U5nYzmfk1UKDwhu
	 SC7QY+dnEu1BNQQ31LDjQG4JfwaBxyvYsG3/SyRpmA06RIE5KYlh2fEwLzCc525Jpg
	 fKamfoMYB8YbzkjixdEPOvriCwOnQxIWvGuUmGJ4KW4C+1ciAmMaVgWK3s9A9rA4AI
	 Y0pcK1t8XusGnDN4aftTMma1fKTET/gIzC/t+LTk4ybEZpYHpyk8y06sl4F/6NBU1U
	 /0K/KOWVtVCyN9W6lDLXflNBV3JfryjRFzDcFqehThMJzUzkY+nPvDCOjAUuJd0z4N
	 PV2t4fabhM09w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD64380DBDD;
	Sun, 16 Mar 2025 01:59:03 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z9Ym1Da9oT9CdxVR@google.com>
References: <Z9Ym1Da9oT9CdxVR@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z9Ym1Da9oT9CdxVR@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.14-rc6
X-PR-Tracked-Commit-Id: fd10709e28d2fa9015667aee56d92099fc97aa0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31d7109a19f66dbce2ad3dc377343d734cdfa346
Message-Id: <174209034244.2697047.621009150416853053.pr-tracker-bot@kernel.org>
Date: Sun, 16 Mar 2025 01:59:02 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 15 Mar 2025 18:18:12 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.14-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31d7109a19f66dbce2ad3dc377343d734cdfa346

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

