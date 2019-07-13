Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB9D67C4A
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2019 00:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbfGMWuN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 18:50:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:38140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728026AbfGMWuN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 18:50:13 -0400
Subject: Re: [git pull] Input updates for v5.3-rc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563058213;
        bh=Y+GYeqqDpJ2uey0JE0m69siazJO7gOJvgJebEeHmI6Q=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=KZYZzx33ILg7U3xyVmLNtRUnkVL1YLtEpvPN/ekMsznDxwhPLGDyh4k/NkZLaC0ax
         MI1N64RbN1XCjDkVfusyPmcXu+98D2Mr1t0Ly303vmGW5fjrgnPrUb+t7Zp0uMIUlB
         2WGb1HoRbH9UCZ/gl+TXf3qv6XNNWYwavWWNV/QE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190712052744.GA138448@dtor-ws>
References: <20190712052744.GA138448@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190712052744.GA138448@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 597473720f4dc69749542bfcfed4a927a43d935e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 073c916bc00571d8662b89a294eba265481b6fbb
Message-Id: <156305821313.12932.5709874322750112158.pr-tracker-bot@kernel.org>
Date:   Sat, 13 Jul 2019 22:50:13 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Thu, 11 Jul 2019 22:41:58 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/073c916bc00571d8662b89a294eba265481b6fbb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
