Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F2910E4B0
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 03:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbfLBCu2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Dec 2019 21:50:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:34286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfLBCu1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 1 Dec 2019 21:50:27 -0500
Subject: Re: [git pull] Input updates for v5.5-rc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575255026;
        bh=9l4dHkIeah5VsErCWWecA2EyD/7pIboC4NjCJw6Q7OY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=QkMquyH4e87WA4q0/qGJvAPdrg8qbI/av84522vIvO9AKPCKYsi9r1yiAXVZfo+pP
         xcE1Pv34Z0VpueI7lb4bNX4O/TvYp1YK5g6oEXrg35jRqY8cNFqVQ7+RpXcjMkAua5
         pntU6D/iyJau02UI678YTmVzDhoYY9eAq0PyLj/E=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191201020020.GA225595@dtor-ws>
References: <20191201020020.GA225595@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191201020020.GA225595@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 976e3645923bdd2fe7893aae33fd7a21098bfb28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 72c0870e3a05d9cd5466d08c3d2a3069ed0a2f9f
Message-Id: <157525502686.1709.8788003897011032901.pr-tracker-bot@kernel.org>
Date:   Mon, 02 Dec 2019 02:50:26 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Sat, 30 Nov 2019 18:00:20 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/72c0870e3a05d9cd5466d08c3d2a3069ed0a2f9f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
