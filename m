Return-Path: <linux-input+bounces-16525-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08729CB25A7
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 09:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBA2E3001FC3
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 08:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C03C2F7ACA;
	Wed, 10 Dec 2025 08:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsAMZHuE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326B91F872D;
	Wed, 10 Dec 2025 08:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765353898; cv=none; b=fI1M34DDqEEKwwrNAXo0lemBxkWSZf0lxc1mcCUzw2KZ/oXooLYCXTK4rXSygByv20sxXhRqRH53B6UlpcjdK0xNTM/IlDd+jOtqhcD8qHKcAY3ZrnWAifkZSjj5AZgTLUpROwx//leataiMLexf6wOrFfngY1oop8oMUUx0460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765353898; c=relaxed/simple;
	bh=ZfcpHsJXIXuH8uwLYJ3o7hgZJO8l6c5ariNCjmtg5A4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PRq39Vrh238LyoAwA9jyb8TrutWtAgMHUjZkZcUznJYlcKJ3ZRtOLIP5UvHRV4agDFRkrTjtUcruQtOI18vUzqK7Mt0Au8PcovsIcxexky+LqhIgT3AfDmKKA8siBBDHP4Em9JX36lTKxx6KAsMgwuOBrhKvvnd5hNx8w/VaZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsAMZHuE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12425C4CEF1;
	Wed, 10 Dec 2025 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765353898;
	bh=ZfcpHsJXIXuH8uwLYJ3o7hgZJO8l6c5ariNCjmtg5A4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KsAMZHuEVuk4wsZq1jRhVaW5i3ndtIn7NEHSWQnSzDMhheYh65T962JngtPAJrrbh
	 DslRnkXRpNGV4DpEFaRN+z7OEVXxzRt+jbqZcmnjJF5UH4ubybhUV+c4ERK36IvjlR
	 pzakY66dDiGcScoYt2CPHf4MiTcWZDiXDRZvjquGl5Gx+DeQV/QmCgrtjW+2rOhmOp
	 i4Bi1EzrYyol5lY7g9nmyXJYThTntj07vH4NiNENmWORfqvF/Zfu2dn8J8nRkeL+YX
	 1so/veJup9gyWGq4bCoGn2CBkGFTdpWkE8re8eiggahKNy6g8Kgag0z1gG94DELjSa
	 b62NXbVb3hSmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F293A3809A18;
	Wed, 10 Dec 2025 08:01:53 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.19-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <ahdv5kw3t7sz4ilpxmle2aeh5pswv3nellocrxnuearvnx2jfo@6wvkgcur7akw>
References: <ahdv5kw3t7sz4ilpxmle2aeh5pswv3nellocrxnuearvnx2jfo@6wvkgcur7akw>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <ahdv5kw3t7sz4ilpxmle2aeh5pswv3nellocrxnuearvnx2jfo@6wvkgcur7akw>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.19-rc0
X-PR-Tracked-Commit-Id: 429c4727011ead99129b14dc9ff4c87a747a50ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db28b8ae363b9d05ab3779127514d2e81fe03ab1
Message-Id: <176535371266.496531.18061019137047811083.pr-tracker-bot@kernel.org>
Date: Wed, 10 Dec 2025 08:01:52 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 9 Dec 2025 23:03:37 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.19-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db28b8ae363b9d05ab3779127514d2e81fe03ab1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

