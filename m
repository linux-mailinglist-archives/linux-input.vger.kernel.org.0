Return-Path: <linux-input+bounces-12559-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34412AC3241
	for <lists+linux-input@lfdr.de>; Sun, 25 May 2025 05:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B11011899FD2
	for <lists+linux-input@lfdr.de>; Sun, 25 May 2025 03:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0EF182D2;
	Sun, 25 May 2025 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTc7KhKX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23E02DCBF5;
	Sun, 25 May 2025 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748142267; cv=none; b=UixnZ9PYUH7tAI5BhuR/g0Flrv8MGcrbNeHGk1q5w6bomzU38uvkX3FD9Z1CCoTVj/QqjMoLsGEPXG+LrseZE9afBkrngm+R7IKZih/I5x/NS7FiXyQ7F8iMMFzH7AOyD4fpUAvfLhR+pjjXHK/z2gLvNV7v8TVUBeNp+XMBvPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748142267; c=relaxed/simple;
	bh=3hWkzvQVASt2Z2s2wQ6xtrfbfSWuT32+cxpTyBzejEs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Zj2B1pNSm6GjeHvz9h0ukCC88PSo6aMPsOQjYNg31gOxyZxaYhtCVxbKzg6sj3O8ReKTKUpu+F4AJOcDgJ+rB6O2ooE9cHPF+PAgLUXcyCe4Q1y1wfNjkknKkehuZ3iqeerlbMjpZwQOc3LjcS6VPy4HE3GwZH9PkX8DzsWIcaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTc7KhKX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F19EC4CEE7;
	Sun, 25 May 2025 03:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748142267;
	bh=3hWkzvQVASt2Z2s2wQ6xtrfbfSWuT32+cxpTyBzejEs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mTc7KhKXlAdNlrv9kbNQhlYexI+vs+YJOoe+65hXgJqVfRFIvlyfvMF9xC/ujvhAS
	 rO++QHDDJPqldAVvOzPraO5Xymhs4nsF3/Ecqd7oeiRxx/QdUe1LzqTEVL6V7e2P5v
	 ofJlPzAD6enubIs+764eiYGGV+ciKAKoSyAFYp4SDw1olIzMVx8x3o3KSFaUrfgEE1
	 NuFQJjQie0XOiUjdPj3JXeDrHag4oqv/8WWgh/ro6Pt9ywwaALUTtzGnl3BC3Bt69C
	 3Fxb1haKNvHR49sdacGEkl1HzhxjVJPFJqNSsiO2NMXPrKuOD5fHPgnpTqov4Em8ND
	 y0D662AvrGFTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE21039D654B;
	Sun, 25 May 2025 03:05:03 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <7ev4nuc6gsaaybykmdtf4xufcxl46jjzj6qfgtgx5vjm3eowm7@w7wtvau36a3u>
References: <7ev4nuc6gsaaybykmdtf4xufcxl46jjzj6qfgtgx5vjm3eowm7@w7wtvau36a3u>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <7ev4nuc6gsaaybykmdtf4xufcxl46jjzj6qfgtgx5vjm3eowm7@w7wtvau36a3u>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc7
X-PR-Tracked-Commit-Id: ca39500f6af9cfe6823dc5aa8fbaed788d6e35b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0c22de9995b624f563bc5004d44ac2655712a56
Message-Id: <174814230224.4035660.17039346950444226223.pr-tracker-bot@kernel.org>
Date: Sun, 25 May 2025 03:05:02 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 24 May 2025 18:35:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0c22de9995b624f563bc5004d44ac2655712a56

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

