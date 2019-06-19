Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF0854C120
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 21:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbfFSTAH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 15:00:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbfFSTAH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 15:00:07 -0400
Subject: Re: [git pull] Input updates for v5.2-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560970806;
        bh=ZgZVTjeTzTGUzg2AGgT3SEiXGd4PdCUPlIAf6oTehhs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=RPfXO8sHQ4RBTqg4zrrMghCa+g1hX1jjXLeoISgRBrUmxM3IuEcP5H+3R8rn0/xY5
         tzgIgSdrHTGJfD/g8NXlbqnOixFTpRhWPLF9yNTy2VO4cqrSKeH8oi4Pbufj5CFeBY
         ACJN7D5HKlofCQ95X4rN13e0VXWKpUBZC1HhEqsI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190619001640.GA62849@dtor-ws>
References: <20190619001640.GA62849@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190619001640.GA62849@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 9843f3e08e2144724be7148e08d77a195dea257a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b6920ba26e1f24b949b9ca3bb782c7fac8be633
Message-Id: <156097080658.11094.10153677521407620995.pr-tracker-bot@kernel.org>
Date:   Wed, 19 Jun 2019 19:00:06 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Tue, 18 Jun 2019 17:16:40 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b6920ba26e1f24b949b9ca3bb782c7fac8be633

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
