Return-Path: <linux-input+bounces-13604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7753AB0B6E3
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 18:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38CED1899743
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 16:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E051221D5AA;
	Sun, 20 Jul 2025 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6GoqTYd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DA6339A1;
	Sun, 20 Jul 2025 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753029050; cv=none; b=MziVppbu2OzVYPyjeyXclHOL2bBwsegZhG2xmZ/INoWoDDPF+CiZJIhxW27Ms8dfHxVc35o5X2A26cu1L/nJdZ+1eG++Lm3JGFrLyAAcHhvAqBPlJKfV1KuPuQaB9CZkY+FidNiR3tR0IahpaBqyaiH06uq2gV9HGEsh98QmmAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753029050; c=relaxed/simple;
	bh=ZQiMItIkS9nnNtRrr8suvVQfjOc/i3BniNeHZYrWmPw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dqTXyVjs5/IFSewr779j0S5hjHbyvqTB+R8QaVvAuJ2XCdzYOY5RaWswtX0wPs0QlyWnKXd/bjNtFQLb9XEcl3QnOcPetuXjaPToEt86ODsabymxMaQdzgEaNpWtjZHUVZoWM52L1E/yZ2quzA7URX+PMaNLyfp5ufyMggRV0BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6GoqTYd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98231C4CEE7;
	Sun, 20 Jul 2025 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753029050;
	bh=ZQiMItIkS9nnNtRrr8suvVQfjOc/i3BniNeHZYrWmPw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=K6GoqTYdjaDfJhhFRi3Vm+fdr6dIdTekls/W+v/nDTnqDrcypyf+RIvmqLRVmWD7D
	 tGWBufYhsUzLdkXKBzBQxlROHQlYmaTFUasr14+PU2nf8Ov1RiSf3Cu9iwA+8o8ALv
	 D333x0deFNIRBUDEV+TpIHIAeqlicouBr8E+BlJoBq8kq3ORv4lrZ8/i/G8/Ns0sy8
	 IGyX8YBUrvzTQNdrTfM8DquqyTuwC1ZI3kU3vrJbIIDVVl8xsI2KJ5K5219RN2GtbP
	 LjRGJtxsRt1pxl1aXf4/yjxY6pd1VubsN5N3Vo+tzPQUCaobTPQAB7b4hNk471AW9c
	 GN/mFTglTxCZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB066383BF51;
	Sun, 20 Jul 2025 16:31:10 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.16-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <uruhwvbzi2umwaqurp4scxx5ekqng66as7ffxatvckhcoxnafj@qizaztn42o4e>
References: <uruhwvbzi2umwaqurp4scxx5ekqng66as7ffxatvckhcoxnafj@qizaztn42o4e>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <uruhwvbzi2umwaqurp4scxx5ekqng66as7ffxatvckhcoxnafj@qizaztn42o4e>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.16-rc6
X-PR-Tracked-Commit-Id: bcce05041b21888f10b80ea903dcfe51a25c586e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e2e9e161997ad0b44e37c82824fcab4e0a1e261d
Message-Id: <175302906957.3241589.13572084620334515049.pr-tracker-bot@kernel.org>
Date: Sun, 20 Jul 2025 16:31:09 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 19 Jul 2025 22:21:09 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.16-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e2e9e161997ad0b44e37c82824fcab4e0a1e261d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

