Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71EB731206E
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 00:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhBFXVq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Feb 2021 18:21:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:50080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229716AbhBFXVp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 6 Feb 2021 18:21:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F1D1B64E56;
        Sat,  6 Feb 2021 23:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612653665;
        bh=9uCqyyRJsteOWolaHrTFSD8XI0887ZvGpQPvVk1eD+U=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=hHNdJIzntpzcxYcAQu5KRWzJaHZXCC8f9v1yiEaZj+Z3wXr1SVbJWCYILUtBmzpQx
         LG46FCD8tDLAx5XpGO1Xf+ag6chkV395+4pmkWAO50LK5i1yywvkrt9coSJ7qg5RXv
         JYGqic0TJPUYjihaAQNcXBqHlzyBgnXZECcg1weaOWWnVOPdGGIWE2d7MyvlUcvTLO
         /TkKrTeNNWr3jgf8TGVooeXwFepYSrj1CuuHilk8pmMg2g+hi2W0XXCfuaeh0aOQL9
         ZyA2dJO3mW3R7o8J+K6wbsX2txrzp6yQb4HKaBN0AIbtnwsS+JNSg6M4l/iIQcNrqQ
         G1xNOH+gYzelw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EBF3260978;
        Sat,  6 Feb 2021 23:21:04 +0000 (UTC)
Subject: Re: [git pull] Input updates for v5.11-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YB37S7x1mvSeERFT@google.com>
References: <YB37S7x1mvSeERFT@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <YB37S7x1mvSeERFT@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 9bbd77d5bbc9aff8cb74d805c31751f5f0691ba8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7c2d18357f2c4d26e727e76245e297ffdbc03097
Message-Id: <161265366495.26028.7327463848594403990.pr-tracker-bot@kernel.org>
Date:   Sat, 06 Feb 2021 23:21:04 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Fri, 5 Feb 2021 18:13:31 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7c2d18357f2c4d26e727e76245e297ffdbc03097

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
