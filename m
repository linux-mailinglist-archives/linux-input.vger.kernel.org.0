Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A72D0FBA69
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 22:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfKMVFI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 16:05:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:60560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbfKMVFI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 16:05:08 -0500
Subject: Re: [git pull] Input updates for v5.4-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573679108;
        bh=N4KoZP9EGN4Ef8kYyzhdS4MplEhbCLKbR0EEmiBmrdE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=TLKWxX/7pVJCe2P2ruo07cCatD99K6xzlKRCS4cx2NC8dOK/wep8QKsqPQA2M3gzw
         9FfDhtwEblsd+LZQiPF4ZB6gbSAdgjGj0Tm8i78YDEXmPNT6RnWD9inrbY/pT375O3
         zPTobyrLk+SUhbcqknrMYkKBu8xazXVPy5hGWPg8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191113195809.GA4263@dtor-ws>
References: <20191113195809.GA4263@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191113195809.GA4263@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 79aae6acbef16f720a7949f8fc6ac69816c79d62
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bf929479893052b1c7bfe23a4e7a903643076350
Message-Id: <157367910767.4154.9296883967224620991.pr-tracker-bot@kernel.org>
Date:   Wed, 13 Nov 2019 21:05:07 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Wed, 13 Nov 2019 11:58:09 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bf929479893052b1c7bfe23a4e7a903643076350

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
