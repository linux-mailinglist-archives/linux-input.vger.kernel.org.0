Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680911F5DCC
	for <lists+linux-input@lfdr.de>; Wed, 10 Jun 2020 23:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgFJVp1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jun 2020 17:45:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgFJVpY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jun 2020 17:45:24 -0400
Subject: Re: [git pull] Input updates for v5.8-rc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591825524;
        bh=p+R45FFiAN+F2iO/+uCw8wYLbyqei/KLQiNNDjKCKOU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=hy/AlBNe5+pwxGLo1Oh91ZPNPkIH5baHYQ5VLpT11vYoiiFmbyXicW+oBhBAA9W+0
         jVZNl1r9Jj9faVOIXizbqRaxhZyjXoBBVwuRF7GipXl75VKpcq27AXVg/Em+qjTaAz
         a2JnPmO8Q7sH89hGwMAK4+D+f5hF057dn1sjUebc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200610044748.GA177775@dtor-ws>
References: <20200610044748.GA177775@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200610044748.GA177775@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 751ad34fbad74c3ed4a9ede24764b4253d4faa84
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 49f13b0921aaef0d5519358fd9fcc237c1c9124a
Message-Id: <159182552442.4867.16564912340186600303.pr-tracker-bot@kernel.org>
Date:   Wed, 10 Jun 2020 21:45:24 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Tue, 9 Jun 2020 21:47:48 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/49f13b0921aaef0d5519358fd9fcc237c1c9124a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
