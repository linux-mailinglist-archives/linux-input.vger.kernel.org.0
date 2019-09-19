Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D55B835D
	for <lists+linux-input@lfdr.de>; Thu, 19 Sep 2019 23:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404788AbfISVa3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Sep 2019 17:30:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403945AbfISVa3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Sep 2019 17:30:29 -0400
Subject: Re: [git pull] Input updates for v5.4-rc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568928628;
        bh=uaFnLzQBwhA4k9xpomHDaGT9r02uJmtRZ8iEhZl2EO4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=WAqLggofYciyojaZGn4xm2l4/G5J44SwP14GqV51fftIPicOHGo2MxHbgqr6TjdGi
         +fsBGl3Ar+18w6BivYaqllfsK7lmsZdj2kv1psSOB4+orbN2wEe0YwHklUPFeQcA1y
         CeSqYvqAIbWzlfXePtQ7jw0/Si3TBewlPFU/c6VQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190917234004.GA145240@dtor-ws>
References: <20190917234004.GA145240@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190917234004.GA145240@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 0898782247ae533d1f4e47a06bc5d4870931b284
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6cfaf4f86d9d15e5541adb3bb899d0b80f89ec7
Message-Id: <156892862889.30913.1553387579406573122.pr-tracker-bot@kernel.org>
Date:   Thu, 19 Sep 2019 21:30:28 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Tue, 17 Sep 2019 16:40:04 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6cfaf4f86d9d15e5541adb3bb899d0b80f89ec7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
