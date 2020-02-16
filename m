Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A55160151
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 02:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbgBPBUW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 20:20:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:50340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726389AbgBPBUV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 20:20:21 -0500
Subject: Re: [git pull] Input updates for v5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581816021;
        bh=9gQo8v4pYACRiN+vb3qpavld45PGltE/OWnhfEX5i+8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jF/0z10L5hT0I0+oYOGoHcwRIpiLcAJDd3MGIJUn4BaNnF0xE3bB/Xwz9qCjdc1va
         7vj33shSvEDY/5XuReIzxYhs6YBA6mKFm8CAfqiuZi79ElpR8k6R0Aaj2tLtv2zIj/
         5O3KtYjn9QEPjtHR4q8BF3/+qFEswXSXhdTVOnlE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200215232955.GA107886@dtor-ws>
References: <20200215232955.GA107886@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200215232955.GA107886@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 3dbae15538972c9e1578cb216964c2840361a538
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db70e26e33eef1b148ca1c9f50de92203ec7e82e
Message-Id: <158181602139.2543.14771856880930382668.pr-tracker-bot@kernel.org>
Date:   Sun, 16 Feb 2020 01:20:21 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Sat, 15 Feb 2020 15:29:55 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db70e26e33eef1b148ca1c9f50de92203ec7e82e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
