Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2101430E1F
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 05:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhJRDYn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 23:24:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230336AbhJRDYm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 23:24:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 145B360F14;
        Mon, 18 Oct 2021 03:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634527352;
        bh=AGukUyG1GP4t/Au51w335txaw2lbvyZ03XKu7U0S/AI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PHCaiMkRaCpcO/78u3rphVvp1af6LPcYQbngv8NehkrP1+LZd70zNdjei4fnW263o
         TY97mF5YNIIyIMbLGtvpNHH5W6IACZnR5Skztra9acjyoDUuIavPMy+LtgBhk9P9Aq
         TYAjWBywzwvWX7FMMXIcOdaEijXeebh+N+qC8ekpdJbfesxluGvYgDYPZ9/AhgG/Gs
         K7DeoZr/7qH8SE+brmUUjRq1zDSFxWoDzyMguSSoNNuUfQ2jkfj6dbJX1UNH2wBFsb
         V+8Yg42ctfRO/cvVmbuzaRN/+j84FzJOU2QTh8gjpzNwRXKxfUXmbKkPXV6MlWyXNo
         zYGZrXt5NxlFw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0EB7C6095B;
        Mon, 18 Oct 2021 03:22:32 +0000 (UTC)
Subject: Re: [git pull] Input updates for v5.15-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YWunpuIgc3ODHhVE@google.com>
References: <YWunpuIgc3ODHhVE@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <YWunpuIgc3ODHhVE@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: a02dcde595f7cbd240ccd64de96034ad91cffc40
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12dbbfadd8f4e54607463414b06f9416a5c6d981
Message-Id: <163452735205.4914.9671756313497558562.pr-tracker-bot@kernel.org>
Date:   Mon, 18 Oct 2021 03:22:32 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Sat, 16 Oct 2021 21:33:42 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12dbbfadd8f4e54607463414b06f9416a5c6d981

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
