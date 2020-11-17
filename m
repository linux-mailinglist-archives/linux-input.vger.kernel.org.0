Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EBF2B6F9C
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 21:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730334AbgKQUHb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 15:07:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:34640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbgKQUHb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 15:07:31 -0500
Subject: Re: [git pull] Input updates for v5.10-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605643651;
        bh=2lJaL9pgvbvN1qWujF2f3onYqc24ZO80Lapm/v7hvOE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=nxSu//AEbA/MI0+4hND3uca4tXrNSCfYjkk1aBiq416uANBnkXQjgdiTD7p/FxevS
         ybO8RL8JiIpsB7sQfhZgnK3BmUGp2wItmsN2w/W6044MnjFL18uvVUMMx+VywENDpQ
         n4oO/R1fZTmbDkh5cP8q/heK2VCs2I+D5Af0Ahh4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201117192351.GA2362934@dtor-ws>
References: <20201117192351.GA2362934@dtor-ws>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201117192351.GA2362934@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: ae3d6083acf60116d4f409677452399547ed2009
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0fa8ee0d9ab95c9350b8b84574824d9a384a9f7d
Message-Id: <160564365113.18868.2185837603247309895.pr-tracker-bot@kernel.org>
Date:   Tue, 17 Nov 2020 20:07:31 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Tue, 17 Nov 2020 11:23:51 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0fa8ee0d9ab95c9350b8b84574824d9a384a9f7d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
