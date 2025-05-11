Return-Path: <linux-input+bounces-12266-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA359AB2A51
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 20:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41BE0171C33
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 18:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0662609E7;
	Sun, 11 May 2025 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCqAInlB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E318BC1D;
	Sun, 11 May 2025 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988770; cv=none; b=PBT1PxCN1kgcggjZ2JuPc4ztYuVZFV5jRR8Olg4vlfH+iAt036NeuXFY1ri9IkDTn5kjz7korpun+5jCgVlEcCbOYzIIyMGWO92WqzRxmYoBMO2XiMm4w2sc0M4ZtxHQHw+z2KF+M9LthZsCTfGQtRryxauxAVOpmKfljFvCSAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988770; c=relaxed/simple;
	bh=ZfXzB02LgJ0xtMwX1jsz8TaLgIxcVEOVNFT7SIKJGvw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=peZ64BXQUktgDmifO/FitgwuVqBifL7HC0WP1SR0vNTM9ejItLEzBzcx++9NPdO+bhUBu18U73VwhCEtK8icTclpRbKREMSWvHRWqnkl0B8Is/BKf7tQKdXSZLrU+kAxoIm+2uQeBdLZzzLAO12eeKvIuf/vXd56lw8NqKCZJJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCqAInlB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F15C4CEE4;
	Sun, 11 May 2025 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746988769;
	bh=ZfXzB02LgJ0xtMwX1jsz8TaLgIxcVEOVNFT7SIKJGvw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gCqAInlBC19qZj2QU7HECTx85l7i4UHoQIPUgLJLuIm3Gmy/xf8I7YWxVE+BMs9BF
	 R4q53l0mlbEJ4voVgE/dKDu745gc9MeQFHs1J3SYROES6yMeL7fY7uiYZJnhM5quTx
	 96VRjJHn9r3xkzK/RcCWfzDEX1QxCm93Z7UaFTeJpo82xXc7iyCBKJ0IagFWmZcBNM
	 n06tBAB+USVgah2A3jiGIhPNhdLSEg6n/TGOzCP73zswPmIZsdMTeWOyN2AhW+m3it
	 NN2moG9WtGrKuuhWbQg0mOo4m0QvjVoBTXv+Edyrb7nXVxv63uZhLEtD37xZlVJQNm
	 6tqq0ahTDOPtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF9AE380AA79;
	Sun, 11 May 2025 18:40:08 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <vjfoxhbcvltgxbmmnjfnqllyrynjwh2cpraylma644hyhlv5jh@dzbn3dmblhyq>
References: <vjfoxhbcvltgxbmmnjfnqllyrynjwh2cpraylma644hyhlv5jh@dzbn3dmblhyq>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <vjfoxhbcvltgxbmmnjfnqllyrynjwh2cpraylma644hyhlv5jh@dzbn3dmblhyq>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc5
X-PR-Tracked-Commit-Id: 93406e9d024058b3bf487656ddd0ac552e5a366e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fea9123979fe892f41ca39d9d0226c1e193b0880
Message-Id: <174698880758.21126.15445338407905688362.pr-tracker-bot@kernel.org>
Date: Sun, 11 May 2025 18:40:07 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 May 2025 23:31:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fea9123979fe892f41ca39d9d0226c1e193b0880

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

