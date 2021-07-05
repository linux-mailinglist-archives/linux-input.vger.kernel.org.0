Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1D93BC314
	for <lists+linux-input@lfdr.de>; Mon,  5 Jul 2021 21:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhGET0d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jul 2021 15:26:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:40662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229743AbhGET0d (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Jul 2021 15:26:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F178F61973;
        Mon,  5 Jul 2021 19:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625513036;
        bh=KHOwF2jilzJkZ8G58qKfNoU+iDZm1vr1ifNZiRfIdwc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=S1I0Z9qUMiMhTXpmEhaU6BHM6PY5p6UbTl7/hknLM+/jf7fNCQtkmeIE3I96ntn4G
         4/PKfuYUTzq+TTjY2JsFls6OO10lSuhyZ+rpAvaYa1eoC5Lma88cjY/8OyOV2ECIU8
         q4j4pA1n7u1eNum39P+NndESE9WCPuBmNq/RGcQ3AXG5mla2NRwMLWqMpse0ErRI56
         W9s221w2fR6Wo8DcMQGODF06numYt3ZYcFNZzsq5hWeCIB6s9P2e0466jchZ0UFviH
         sV0a5mDhaMAbsMbCny9BmZaR3w5Md0FGlkTIPm+r+dl+uS4BIrFYsvzTJXA4+LPU7L
         yjluRSuy6fIlw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DF19960A6C;
        Mon,  5 Jul 2021 19:23:55 +0000 (UTC)
Subject: Re: [git pull] Input updates for v5.14-rc0
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YOKiP9QsgXyK8zQK@google.com>
References: <YOKiP9QsgXyK8zQK@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <YOKiP9QsgXyK8zQK@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 818b26588994d9d95743fca0a427f08ec6c1c41d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f89a590b26e34ec7c32fbafaed446e52c3d0c3f
Message-Id: <162551303585.9654.5667796917902159690.pr-tracker-bot@kernel.org>
Date:   Mon, 05 Jul 2021 19:23:55 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Sun, 4 Jul 2021 23:10:07 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f89a590b26e34ec7c32fbafaed446e52c3d0c3f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
