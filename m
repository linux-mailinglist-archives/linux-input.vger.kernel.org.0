Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D32DE151265
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 23:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgBCWfP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 17:35:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:56404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727392AbgBCWfP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Feb 2020 17:35:15 -0500
Subject: Re: [git pull] Input updates for v5.6-rc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580769315;
        bh=OdXnKk8xZuFWn28me6CYnTCNQPT4PzHn/1+A3LxEiCo=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=lO+VCDdr9Ktg8PK+WwSfvif7hTu6vWG2vuo2JN6L6XkO1Zz/EEwsGYNOuX7MvnLn0
         k5VnEUgNn4KW1b2lIm1b5dfxib8xsV2jrBk3rQ5y0m5TarwzDTp1Oemg6mrjKEp+jn
         8k0xu5JmaMFczgdWwdOkVr9lolC+n2AWBDiY2TZc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200203193344.GA202502@dtor-ws>
References: <20200203193344.GA202502@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200203193344.GA202502@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: b19efcabb587e5470a423ef778905f47e5a47f1a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe70da5a325c1ac860d463ca802dae6a8bb05e21
Message-Id: <158076931501.15745.15795073890100012985.pr-tracker-bot@kernel.org>
Date:   Mon, 03 Feb 2020 22:35:15 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Mon, 3 Feb 2020 11:33:44 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe70da5a325c1ac860d463ca802dae6a8bb05e21

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
