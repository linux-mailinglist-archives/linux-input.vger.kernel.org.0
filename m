Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84FD36F07B
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2019 21:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfGTTfY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jul 2019 15:35:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbfGTTfY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jul 2019 15:35:24 -0400
Subject: Re: [git pull] Input updates for v5.3-rc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563651323;
        bh=tUJgYstd3TnpqJUAGBO+/EwEPk6BHAw9XyypVSs7CM8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=C9bwKDKA59MdnG6w6vGGwHCVYUdqDFQe2ljGD4ASYR+lDtCawK4dVKzrztEl3z9/s
         1pvjjdRGiKTqIJI0eb/9tt17MbXoXwzp7W+gK33ESlLHSVSaseTkuddIorIBdsapvp
         a+skDreVLuPPcffoThGxRTE4glTMVDm9pk2EyM7I=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190720191036.GA873@penguin>
References: <20190720191036.GA873@penguin>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190720191036.GA873@penguin>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: c39f2d9db0fd81ea20bb5cce9b3f082ca63753e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f1a3b43cc1f50c6ee5ba582f2025db3dea891208
Message-Id: <156365132322.3883.1631773705752249319.pr-tracker-bot@kernel.org>
Date:   Sat, 20 Jul 2019 19:35:23 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Sat, 20 Jul 2019 22:10:36 +0300:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f1a3b43cc1f50c6ee5ba582f2025db3dea891208

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
