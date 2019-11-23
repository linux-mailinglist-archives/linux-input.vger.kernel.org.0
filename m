Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22611107C42
	for <lists+linux-input@lfdr.de>; Sat, 23 Nov 2019 02:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfKWBPF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 20:15:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:49462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbfKWBPF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 20:15:05 -0500
Subject: Re: [git pull] Input updates for v5.4-rc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574471705;
        bh=3cCDZ7Aab+avY448nOgtXlRbJlhODSWrSt52FXxMvvM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=DerLHexYVW5JVKd5NmrjLy1EKx/+xpVZ8jxpJVYszr9vj4lnhdys0rZjlASf+Q7h3
         xVCxqBML97DlZ39w39QOjCY60q/qiQS7J9ZOmANmmftlRInaZeRPsVYfdK+Qlpim28
         HoMVFRuFUNaXnonjM6X1jxtpcG5yGmBAaAWz2duM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191122232320.GA37127@dtor-ws>
References: <20191122232320.GA37127@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191122232320.GA37127@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 8791663435e7fea896d8ca0f56fd64976d2089ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2027cabe6afea5d471401ec704b65ce18f958fdc
Message-Id: <157447170497.10539.17089975416012265968.pr-tracker-bot@kernel.org>
Date:   Sat, 23 Nov 2019 01:15:04 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Fri, 22 Nov 2019 15:23:20 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2027cabe6afea5d471401ec704b65ce18f958fdc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
