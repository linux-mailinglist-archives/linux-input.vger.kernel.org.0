Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A468B28267A
	for <lists+linux-input@lfdr.de>; Sat,  3 Oct 2020 21:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgJCT6T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Oct 2020 15:58:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:40626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgJCT6T (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 3 Oct 2020 15:58:19 -0400
Subject: Re: [git pull] Input updates for v5.9-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601755098;
        bh=zvawnXGMy+1m8Gt+Jw6q0TEIecCQtYmRsFgeL+Lap3Y=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=rE+Yyy0bhA18JzHUE/hXLv+2/wajTvkJGadLmDfDkWiHICWwKyQAN325hpAghwrds
         uSdLx47b8N0oUGLho0WQ9zHSxSnCuImuTFTLYg8nCH3nFRybWAGWAxLWlasQa3Jyqw
         qE0iEtvlZ3eKIGxkotL0FT49eXqZeTuKhW2nk2QU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201003045003.GA1936980@dtor-ws>
References: <20201003045003.GA1936980@dtor-ws>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201003045003.GA1936980@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 5fc27b098dafb8e30794a9db0705074c7d766179
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 72af7b411d50eddcfed7611c4510a62dfac3fcb9
Message-Id: <160175509888.27812.7528091599666931958.pr-tracker-bot@kernel.org>
Date:   Sat, 03 Oct 2020 19:58:18 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Fri, 2 Oct 2020 21:50:03 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/72af7b411d50eddcfed7611c4510a62dfac3fcb9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
