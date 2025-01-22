Return-Path: <linux-input+bounces-9481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 640F4A199D5
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 21:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E20188DA74
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 20:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E26218AA3;
	Wed, 22 Jan 2025 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3b/zbAE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3BE216602;
	Wed, 22 Jan 2025 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577437; cv=none; b=bk71OlrpLQg+UME/Pap+eEZx+/2Z3I+c8bcQe+LSBmHvHhtclsQ8adX2UqIMOj/oIMVApo9OqnbwMfRYQAAX7/8zABKxUFt1VtQ5YqgYjoUUttQ05mLHNtluVggV7vym8uUozQQwG6yOl9FQpfatnX4HXtxyErdCH0lo37uNjYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577437; c=relaxed/simple;
	bh=x5gQbONZ6ezzrzD/47E6jgzE7hTyahIBQ6ZERKAliXg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rhklzKC+cRQAwtJkoJR/s4TNUjZel1RsMNwG3I/eo2n6tbWL66TP7JLZh4UeXxNIk/0uU3fRVYsK0FMYl6aClbHj+yZ9LqSWkmGjGd50MSze3mqWBmJo7KxBu+pEutcz57Zd05ScV1B5CRAZTwlXYWm8sf3bThpmk2f6n4xmbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3b/zbAE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F7AC4CED3;
	Wed, 22 Jan 2025 20:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737577437;
	bh=x5gQbONZ6ezzrzD/47E6jgzE7hTyahIBQ6ZERKAliXg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=u3b/zbAE6TamZeNNOMItA7JsklRLnszPSazal8030PcIoGaKU2BMKamOL3kdfO7Jz
	 BqoU4rGWClmG1iJo+awjzAPDm+ET8SSwRrWJedvylTcIQ1eA00oo92bPdhkAMYBXnF
	 XlIIB0f9R90Z6NO0RvCVnG/thwjfahnkugStNpMTSBtwB+L8LVyLf1XohRCuQvU4vR
	 SsqiK6Z6ynPsfxik+hdjeU12+P/pJ15Vj8/lIUxISqKk1kNalRnbUKvH/J5vf8A58l
	 ocvooNpBwAmQ+6C8OmFZ17D29V1JEz7omyGBUyjGfSPt9LEcKR03F8Y+n3IuWagJ0z
	 hHG8C5xT7aDgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C52380AA62;
	Wed, 22 Jan 2025 20:24:23 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.14-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5AaJFUUpzp4VgOo@google.com>
References: <Z5AaJFUUpzp4VgOo@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5AaJFUUpzp4VgOo@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.14-rc0
X-PR-Tracked-Commit-Id: 25768de50b1f2dbb6ea44bd5148a87fe2c9c3688
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88e969fc18a25ab3ffe554a1c2e8e45c8ade6d3e
Message-Id: <173757746195.807501.6496044073406120620.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 20:24:21 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 21 Jan 2025 14:05:24 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.14-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88e969fc18a25ab3ffe554a1c2e8e45c8ade6d3e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

