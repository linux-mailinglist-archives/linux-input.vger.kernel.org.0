Return-Path: <linux-input+bounces-13852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CEEB1D205
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 07:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CBBCA4E3601
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 05:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227BA2222D6;
	Thu,  7 Aug 2025 05:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNQk9ZFC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E47221FDE;
	Thu,  7 Aug 2025 05:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754544611; cv=none; b=cov0QKp0Zvkz1XZByVCVTxAZQKsq5TsaQE6m/BvEP770rQHdJueH3Zn4KaibbZ+o0hcMWIV4o78zIYhcIqPAELwHCMZW7WEdf+GDx8X9yylisE/78uK9WJdo+6w1MwfJJ4dhvA9N4fIRwhIAYieg1on/Py9537ukf6vaUVpkX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754544611; c=relaxed/simple;
	bh=pCvzds38Ad31TyUoBBs0E0B/dIJ8Y//UK/MVHvmrZR8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=isSOJQxWAfBxnFMOTqmjjo72lx+PiOsYi16rLwfsYhFMoLdF6Os7632qbQUy1cvIXi5Hp1DWg7cYObfl1soWVs+JS68iMrTPh4kcoP2iCBKzyRiHp/JX4eHBSR9QSlnZcifRIXpbe6uZ8mN5es7t4QJIwBqGrBnWFBK6rNh03GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNQk9ZFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08CBC4CEF9;
	Thu,  7 Aug 2025 05:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754544610;
	bh=pCvzds38Ad31TyUoBBs0E0B/dIJ8Y//UK/MVHvmrZR8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WNQk9ZFC0/U3Y8mQsBz9FKm/a0VN2D5sX4zA/L9ov1ovbjSMu9lDHdjoN/YjutOu5
	 lRbJkecnysp7aoXkttqnffGtvnoMpdkl5ms9iS5OQ+7OiTf4uR+eG8MUeSZvHOzYfj
	 l0nqQSFLa/JPOdXbclrikotdHLxuBkJLQJ4D5qsXgn86G2mOEHeribznC4PefHgH/N
	 DmceZ0i25XszzT0ylbchz81wFGoQiJwW6+6eBgt7ZkoD5cS46v6U4zNEIUPdaAx0l0
	 ziL4n5l7j+s+O1pYhn3G3p+hWSG8lZTrzIZvTL6EzHU+A0JYZGuYMvnDMZnpTd62bb
	 888htJJ6UzbVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BDC48383BF57;
	Thu,  7 Aug 2025 05:30:25 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.17-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <7ool7vscmhygq3jtks25bxhxbm2aijk6wp3cpy6njoifw6b5ri@2le5vfs3ztzo>
References: <7ool7vscmhygq3jtks25bxhxbm2aijk6wp3cpy6njoifw6b5ri@2le5vfs3ztzo>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7ool7vscmhygq3jtks25bxhxbm2aijk6wp3cpy6njoifw6b5ri@2le5vfs3ztzo>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.17-rc0
X-PR-Tracked-Commit-Id: ab93e0dd72c37d378dd936f031ffb83ff2bd87ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e64f4580381e32c06ee146ca807c555b8f73e24
Message-Id: <175454462447.3059740.16526507247379175805.pr-tracker-bot@kernel.org>
Date: Thu, 07 Aug 2025 05:30:24 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 6 Aug 2025 21:25:21 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.17-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e64f4580381e32c06ee146ca807c555b8f73e24

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

