Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C36F8861F
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 00:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfHIWfI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 18:35:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:42740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfHIWfI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Aug 2019 18:35:08 -0400
Subject: Re: [git pull] Input updates for v5.3-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565390107;
        bh=JvZc5/oZku1husOLE+vL+Qh3J74no8FcrOekzeB1z/E=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=juA3i42i6jg+Q8aKBBp9PGdlbnD2cpfXBLiKvEBvOXiXFCmMLo8EXrPXLwJ8rPTr9
         5pII884UyN5SA5x1CPS6Xf9G06i2Y8fSGpJBNa8KTwIkW5qMHzghi+OSrO89EbkfYt
         GvAOxpFICW59zt7zC2CWnIR/uy47lyu8eeBTpQss=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190809222030.GA20442@dtor-ws>
References: <20190809222030.GA20442@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190809222030.GA20442@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 849f5ae3a513c550cad741c68dd3d7eb2bcc2a2c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 15abf14202a2fe7e5c5fc0e815587f45de4fd500
Message-Id: <156539010732.10715.18232763227175837639.pr-tracker-bot@kernel.org>
Date:   Fri, 09 Aug 2019 22:35:07 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Fri, 9 Aug 2019 15:20:30 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/15abf14202a2fe7e5c5fc0e815587f45de4fd500

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
