Return-Path: <linux-input+bounces-7557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2A09A502D
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 19:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16FD8B20A5A
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 17:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B17918D629;
	Sat, 19 Oct 2024 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C16snsNC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599D81891A9;
	Sat, 19 Oct 2024 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729360437; cv=none; b=usvQqAWESQ8TrahFedHhDsvUQRr1qcPuii7nVOvSe71MVTS4Tn4gETIPdQKTfgWrj06HPhfjWqnDEE/A8e7NS2/ChrjMk8fRCe6LEPti1vqiKrgXTZoP35oknjDAKltOwi5ONpsyKsGHY3p62T4SQ4J+rLolutMWizkODAqlZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729360437; c=relaxed/simple;
	bh=CUxZZ7g3YwwZk8QoJwzYhmLSYCo9Bj8leGRbrYhf2is=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SamGDjp9C7A/OnqwCBq+3SW5LLyKSagiUUBNWtME+TRlmMwL+RHJQA91pmPqGrsDoZhzCuaH1dmdc/BxDLAoscmBNb1vqhsKbP7flhXQFw5Yz2XvDYszG7rwAfIaQGJIGWhO4Yv1wMSqXam6lyaFPhQCV2GSWLt/Q3fgPkGK/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C16snsNC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE678C4CEC5;
	Sat, 19 Oct 2024 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729360437;
	bh=CUxZZ7g3YwwZk8QoJwzYhmLSYCo9Bj8leGRbrYhf2is=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=C16snsNCdqRVx8SZyhRfoGM/99nnwQs86wFSAjo35LuM1gh5wDuQbV90VmrIWiqwa
	 Hy5/oQp1SqBf5/DS7M4a8NkXeBOMSYFXv1diem7rKnNO1+y+t7LmrcyKx1zjyGVfjw
	 kPjB3IzzYVtM7nO7/ZUnhfktFoLDj4oO6/Gsojjg2ax/sl4zVY5/IGglWlnI5GlOpW
	 2AjfKb7bhZuUlIl9bXw753brrv6Zcrema9DkZsMZvgvjuqSNMUT113LtzHhq7INYdd
	 bbffVU0PxZGfaYoH6z7s26pHhb1ZiNQV2jDYl2Yvv/8R/VVL+ztqllP2X5YD60wV9d
	 QaQ9xt4/fEBag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBA243805CC0;
	Sat, 19 Oct 2024 17:54:03 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.12-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZxMlEQ8nV_0l6MqH@google.com>
References: <ZxMlEQ8nV_0l6MqH@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZxMlEQ8nV_0l6MqH@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc3
X-PR-Tracked-Commit-Id: 2de01e0e57f3ebe7f90b08f6bca5ce0f3da3829f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f9e4825524aaf28af6b2097776616f27c31d6847
Message-Id: <172936044265.3448898.9774471618815502061.pr-tracker-bot@kernel.org>
Date: Sat, 19 Oct 2024 17:54:02 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Oct 2024 20:18:41 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f9e4825524aaf28af6b2097776616f27c31d6847

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

