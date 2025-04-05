Return-Path: <linux-input+bounces-11545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E66DA7CA58
	for <lists+linux-input@lfdr.de>; Sat,  5 Apr 2025 18:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E15D81896347
	for <lists+linux-input@lfdr.de>; Sat,  5 Apr 2025 16:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C7814B08C;
	Sat,  5 Apr 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP6kaOj7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0DB4502A;
	Sat,  5 Apr 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743871945; cv=none; b=bMJG0klYAP00wcPcWDM+OsGYLY/GvNLe+YB+GAnuYjvydFzFfry2HjFxab1nRayLC7ActDg6g4kOMPXx/+9klbstQejBs5cmqyu0aaR1pbf9nZaENm1AnmfndEYrsVhzT6cekF+zZ6PIy33hxzC58CjYcVjq9XaRKMEug/hUrWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743871945; c=relaxed/simple;
	bh=bOR+VfY6TqkDFm0hn489XWjflDLv0kuxOwfi65ZbteY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MrhZJsME9p7MF0Vzf1I3QoVSIBCRdMvNUyx748/8kvSm6s9yYGANBzBNDeAsJWwx4fqSpkvvxr33pnu/qLYkkXqCwez3nzP6w2aCSFidMePyojRp1YLHIWtvu0W3T5kq9lDYnW3iJ5kXyUqsDwnQVOw16Yk/SiL7cUklgUvrGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OP6kaOj7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB2DC4CEE4;
	Sat,  5 Apr 2025 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743871945;
	bh=bOR+VfY6TqkDFm0hn489XWjflDLv0kuxOwfi65ZbteY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OP6kaOj7oFIdGb5KHGn/wjkoVnQV+XV7MO6VJkugkyg6LAxyQo4qRJGQxmzOa1MgA
	 cowRvKt+XZUC8vmp7FLfMY3awP0rhTtIZHzc+i3IG3cbdz6Tj8NibprUR/rnmgN2P2
	 zqchSHtvJwE2HBpmopHOTu5uoCWvoahqYuP2/EpF++l/ALRxDgDFWc8LkVTSmtwElc
	 urHo+CF+8cOzMSBRR07YAY898lJO2Yozi6vRkadH5aZu8UNgZHr3whkKE8kKHspJDX
	 0kqatuXlIDJlWa4yr54z/5tU0r1Lo1Z/zQFnwt25ZxgJ0q3+bLTgjP2nHHe5nthmgt
	 uspELfwo2df9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71E04380CEE3;
	Sat,  5 Apr 2025 16:53:03 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.15-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_DKFUmQJg8idRsZ@google.com>
References: <Z_DKFUmQJg8idRsZ@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z_DKFUmQJg8idRsZ@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc0
X-PR-Tracked-Commit-Id: 946661e3bef8efa11ba8079d4ebafe6fc3b0aaad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56f944529ec2292cbe63377a76df3759d702dd39
Message-Id: <174387198197.3666769.17506150534736407534.pr-tracker-bot@kernel.org>
Date: Sat, 05 Apr 2025 16:53:01 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Apr 2025 23:13:41 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56f944529ec2292cbe63377a76df3759d702dd39

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

