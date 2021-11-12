Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6628D44EE0A
	for <lists+linux-input@lfdr.de>; Fri, 12 Nov 2021 21:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbhKLUpW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Nov 2021 15:45:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:52804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235610AbhKLUpW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Nov 2021 15:45:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 060F7604DC;
        Fri, 12 Nov 2021 20:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636749751;
        bh=pm63a4Kwb5TmcRA+XXaUYTRasggy//Yne/0RPY4uH2o=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=V8hzG6FJImnw1akT6lPjSNX2YZE9TM3HbZPWpnw0gEGzclp9KxlPS9RJLr5SOW4RY
         r1qIpUOEoyAd80BRjqHJLCg0BIXDjh2j8viWvPxAJZyLCVlia9CsOLQlowSpQoG4Gf
         q1odHrxGaIUF38YEVe7G/uqU5O41ndJHNXAylQ7ph7TvBN3NEJ2kNB4OPUnm5tbF1O
         qQfYsRr2FI4iS9mYnrAV/BPU1f8nmLgod3dDajN2pkR6skJ5CB2IbVtGq9FTA7etn2
         93JaVq+xCPuYP3ENlrFjJXp8kOO2g7OBA+yYbIcnowyynelIm9dXZUkXwe43oDJ98F
         kZMkh27rJ2Gog==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F151D608FE;
        Fri, 12 Nov 2021 20:42:30 +0000 (UTC)
Subject: Re: [git pull] Input updates for v5.16-rc0
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YY4HIiDhEjGHXyGm@google.com>
References: <YY4HIiDhEjGHXyGm@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <YY4HIiDhEjGHXyGm@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: efe6f16c6faf724882ddaba2eda8830a87bcc2b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f78e9de80f5ad15719a069a4e6c11e2777122188
Message-Id: <163674975098.4802.18057390856237257674.pr-tracker-bot@kernel.org>
Date:   Fri, 12 Nov 2021 20:42:30 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Thu, 11 Nov 2021 22:18:10 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f78e9de80f5ad15719a069a4e6c11e2777122188

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
