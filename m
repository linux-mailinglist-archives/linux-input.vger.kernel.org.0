Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13044079E1
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbhIKRb0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:31:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:49674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233055AbhIKRbX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:31:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5086D60FED;
        Sat, 11 Sep 2021 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631381410;
        bh=Pz3KqSMnLMDy1QbIur/OUZcGjTEd/A2uIXgFMK6BOt8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Iy4Z+2iOwPVvFSDPnbDRAsQHDMT8i6LmcvsNQHhpoRbZMIMsPY81XaGixQdBEU0vV
         OBJiQzao4J6OkJB/W8lX4CQ1jMI9UruqVDmsRcj+XgxrzTG5V9bWYFZi8tu07WoqZg
         gJ3fblEkyfASXnMHqZ7jcNos1psp8j8mCG1e/ozkPmI8qXXhPax+cFWFL2d19aDClv
         96J+qI3VoISY9ABR7Sf5J/VEVSxsmQ7CBBMftjMEIb6atupeh5t/lBcgv8m0Ek8wk/
         Td4h6kst1nRxFyqez7HdN7rwHA6sbXTNJYKfBxLqRi1DoPfVOj/XSMAaX/F24/KLb7
         wKfSTFiQVsxcA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4AD29609FF;
        Sat, 11 Sep 2021 17:30:10 +0000 (UTC)
Subject: Re: [git pull] Input updates for v5.15-rc0
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YTrhWrjCkK8ttRDt@google.com>
References: <YTrhWrjCkK8ttRDt@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <YTrhWrjCkK8ttRDt@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 0c5483a5778fa9910538453b5a9f1a6ed49e95ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 765092e4cdaa8439b969952ec4e6de3b84241f90
Message-Id: <163138141029.31861.14968549032839655907.pr-tracker-bot@kernel.org>
Date:   Sat, 11 Sep 2021 17:30:10 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Thu, 9 Sep 2021 21:38:50 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/765092e4cdaa8439b969952ec4e6de3b84241f90

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
