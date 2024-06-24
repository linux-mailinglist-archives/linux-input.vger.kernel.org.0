Return-Path: <linux-input+bounces-4604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AAA915697
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 20:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 205CC1F21AC9
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 18:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCF81A00EE;
	Mon, 24 Jun 2024 18:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tm/UGS7v"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032461A00CE;
	Mon, 24 Jun 2024 18:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719254514; cv=none; b=OH/vu9BckacBNn0Js4RTDYUC7PxOmafWRzWl/eQyuUeoUYU+HboDmwUxsk+xpY7hMdY2LaC6jiShIaUROvGojG9jPoNmDrFcMyomAKYYo8AOz3GVxACMWcNArAarOBUjjI6ITFytLzkhb85iPfLO+xe1bY301UgwVSh9rm7uBgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719254514; c=relaxed/simple;
	bh=rACcYoyXB2VIAZGsjje4+yo1HRIVSqjKGrWGAqXqR5Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VM4hKouSOYbEvt+OHhNX3nuak+g9VxkoKyQB0yNH/15B9WgpQ3fYEThFjVlyUdklI0PpeSprKB9n96MED8q3dyBW8PH/9RhrYs+sWYYt3hdotAA5y9ltSSeWhyhafwZoM2BCwCuoOQSYPajRbe88WGZK6pikGufFV9bMrPdirSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tm/UGS7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FE82C2BBFC;
	Mon, 24 Jun 2024 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719254513;
	bh=rACcYoyXB2VIAZGsjje4+yo1HRIVSqjKGrWGAqXqR5Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Tm/UGS7vYo2uGf6XIy+qLFgjWeVxOAMq7HMcq8/C0sKuaBOod4J46xyc710e/UFir
	 YpksxfHc8YARgnvrpQ+6SQwzcjNTLhDxYeiQtF9SeqIptvf0TrDp25XFqwa/JvKLx5
	 +dEB6iZWT5oPJ8pv2cNLvEotZ8eKE+/khMBZxXzG+kXtOeV/i9QalODV8iROQoBAB5
	 ghZ3AkfoAVvYtCi+D0bjBJCTMsoIvFjtzgeH5krDECjsHQVXBtHc/eu8Qa7leAsCuP
	 2Slil0Z7GcqHz162eL9tAD9wwh2ujdobvjVZk0ozJ/T5jgA5Iy0gyMJtTzlLcByul2
	 IY8F0VT7Mw83g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8241BC43612;
	Mon, 24 Jun 2024 18:41:53 +0000 (UTC)
Subject: Re: Re: [git pull] Input updates for v6.10-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <Znm5EzNHCk_g4puh@google.com>
References: <ZniqQuGkosZYqIYE@google.com>
 <CAHk-=wj730guvRzh4wo16Cq8tq1D1tyD8ub4CiBxV4Bk0Kq_-g@mail.gmail.com>
 <ZnmX1XeOzU1NfgrY@google.com>
 <CAHk-=wh3ZpDhHseFjYf96CcgTSRoZtjbf41hoBCyfQJ=N+oMng@mail.gmail.com> <Znm5EzNHCk_g4puh@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Znm5EzNHCk_g4puh@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc5
X-PR-Tracked-Commit-Id: 7c7b1be19b228b450c2945ec379d7fc6bfef9852
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
Message-Id: <171925451352.7868.7438341554773105194.pr-tracker-bot@kernel.org>
Date: Mon, 24 Jun 2024 18:41:53 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Jun 2024 11:21:07 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55027e689933ba2e64f3d245fb1ff185b3e7fc81

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

