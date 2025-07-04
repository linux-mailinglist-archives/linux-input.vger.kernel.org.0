Return-Path: <linux-input+bounces-13383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E40AF99BC
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 19:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1E35A7849
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 17:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024F92D8375;
	Fri,  4 Jul 2025 17:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMyF57ss"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9252D8371;
	Fri,  4 Jul 2025 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650570; cv=none; b=HOefG0xWAmnpvbgRyrBpnKj9ISG+SZYHbc8B7IMGkwgAKiKqjcXK35ezskbmKvL5wboitXLKLVs+RMOz3s3HMKAEzfo9mRnPTiUuPrMDIFR4sQLw0/as2xZhkaApvzPAUuuIx86i6Nbw7msrT76FWezHExapDgp7lgfaLHE5zu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650570; c=relaxed/simple;
	bh=D1TjRJZ6DDaEjXyWJf+fcNYEEjSOefryIwBwA4wrDvY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DshxjXHrDXI+Eq2H6EMnA4l0vuLa9fM5xUY4/CdhPttDDK8H0z3t6dvmo6tzugh5Im8BJeuHRBJXpvzb1zh6UvIcVQnX8Bec9u8UZZhM2X/f4Ge4VzsQHK1ooNOVO1sw9Pde+Z5JxwJGoSm0JyzaV0ID1Li+m61D2/UJR+nMesU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMyF57ss; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CAEC4CEE3;
	Fri,  4 Jul 2025 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650570;
	bh=D1TjRJZ6DDaEjXyWJf+fcNYEEjSOefryIwBwA4wrDvY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BMyF57ssMYKMB5UHcf18bKqIcQKxsRewi+vN02rNMUVNeCcen+BfvC4L8v5VNd3Yd
	 T+IF6P8dpCBEd4b29H/veJbKH6Fa8kvp1t5EhXce6jKvFmWNdeHUx6uy0CAreL7C1b
	 gs6tOxYmWKHHBf81LgtpxD/PNWEPGtou5lRfP/O9elpS1ZPRa65fUu5djD/EeQmpYn
	 WgZo1SRfVEBwuj7jKRZaXaDtay2nE6C8UyCheFUM0mVjPT0R/88nOOI5imz8k10jY/
	 /8N9s5zKzDA3AM1QNwGCfr6Bdgp3o4mPIXo5riDWQqv/BdZ+orRwElk9q5irlaezwY
	 XVmH+lzarzi2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFAB383BA01;
	Fri,  4 Jul 2025 17:36:35 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <rl7tuutaftwo35bvpsdwkd2fg223yzxef6wj4ufwdz3eu2pjaf@ky6ht3qo6g6o>
References: <rl7tuutaftwo35bvpsdwkd2fg223yzxef6wj4ufwdz3eu2pjaf@ky6ht3qo6g6o>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <rl7tuutaftwo35bvpsdwkd2fg223yzxef6wj4ufwdz3eu2pjaf@ky6ht3qo6g6o>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.16-rc4
X-PR-Tracked-Commit-Id: 4cf65845fdd09d711fc7546d60c9abe010956922
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d46971e0b6f574059d167ddda1355ed301a0bae6
Message-Id: <175165059472.2287194.3502026881822228987.pr-tracker-bot@kernel.org>
Date: Fri, 04 Jul 2025 17:36:34 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 3 Jul 2025 22:31:36 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.16-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d46971e0b6f574059d167ddda1355ed301a0bae6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

