Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF5537617C
	for <lists+linux-input@lfdr.de>; Fri,  7 May 2021 09:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhEGHwn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 May 2021 03:52:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:39866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235799AbhEGHwn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 7 May 2021 03:52:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AA22961431;
        Fri,  7 May 2021 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620373903;
        bh=54w0k5sqcPlMUtrAtS0ClNSU/LGrv7FQXtkFcE2NjJ0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=gMvVlCp6UXUsqAU3zHP00uxb82LLFe+i/pnRLnmF1q6lGf8YPqrxx4OoJs2v5ss3y
         zii/pPsOn8MW6ExWDvqaF5GjW4H/XVmmcbTpb5UtRtnR1UaYsQ05M6GEIyTWo/Wcok
         QRw07c8By52SbEiiF0CRo+AUeC5D/7ZCe8za0Ns/DBEO86N8BO7EnOfB4TtEOoag9L
         031iaV+LtxL1aHAdWyQOeMmwCi9Jx2dQAOc1G5ZuKPL9f0UUwbe+AYgO20utju+7Xj
         +49tnkSMrtNyEhx8/+86GXKhG7S62FUfVr4Ct9Pd4Rb884raqSKbwk1yHEvw+g9dJZ
         57OqeQl/P3Onw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A489C609AC;
        Fri,  7 May 2021 07:51:43 +0000 (UTC)
Subject: Re: [git pull] Input updates for v5.13-rc0
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YJRsc3LxpkFNTknm@google.com>
References: <YJRsc3LxpkFNTknm@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YJRsc3LxpkFNTknm@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 05665cef4b745cb46b1d1b8e96deaa25464092d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aef511fb91b6efb2d355c2704cf979f3202d310a
Message-Id: <162037390366.26493.3264925485074967088.pr-tracker-bot@kernel.org>
Date:   Fri, 07 May 2021 07:51:43 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Thu, 6 May 2021 15:23:47 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aef511fb91b6efb2d355c2704cf979f3202d310a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
