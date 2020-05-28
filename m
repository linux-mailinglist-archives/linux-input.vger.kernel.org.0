Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7075C1E6D44
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 23:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407565AbgE1VKG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 May 2020 17:10:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:34204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407557AbgE1VKF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 17:10:05 -0400
Subject: Re: [git pull] Input updates for v5.7-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590700204;
        bh=3941+gU7xedwRfnKsIOVIxwJYKxinvxaJd2YC1BSXhs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=LDr8ZATnvDzXodHGQxGRAV6Cj8GMejP3meBELskwFCunKKzM1JPUvFifO5ErGn/s5
         QKmizk3m5eUb3Fg7fA5ejxxsLOUs7qYMNZ86yGgtM7LDHf1PEh+L9Ht+vlZveszSym
         FNArYfpMqRXK8iSJ7A+4q96NvEFggNGD5bOHSjLU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200528044343.GA109749@dtor-ws>
References: <20200528044343.GA109749@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200528044343.GA109749@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 642aa86eaf8f1e6fe894f20fd7f12f0db52ee03c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d16eea2fa5a1ed9bc1788db39a76017916dc7f25
Message-Id: <159070020470.6784.561331822311430707.pr-tracker-bot@kernel.org>
Date:   Thu, 28 May 2020 21:10:04 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Wed, 27 May 2020 21:43:43 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d16eea2fa5a1ed9bc1788db39a76017916dc7f25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
