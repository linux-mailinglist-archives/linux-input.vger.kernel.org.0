Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1FD14932B
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2020 04:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgAYDuF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Jan 2020 22:50:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:43336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbgAYDuE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Jan 2020 22:50:04 -0500
Subject: Re: [git pull] Input updates for v5.5-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579924204;
        bh=3z4VRZpuYCnF7+IYyemF/zTO/q7yPBWYjsOJB2jFNQk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Y405lkgtFAohqS6c/4U8JjfcpW3jQ538fGt+SCzvc/C0wGY2CjZEd4CUGk7IZNHie
         55Wmjj/dyBptGXkh/vCMZzHQWYoWMPJHOrcRzKeNRlnBueKsZLx5JfLOy1BRTVzWBm
         cPp+URtAkAEcuASq4vp4otQECHCIytQIkR3L1qSs=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200125010152.GA14053@dtor-ws>
References: <20200125010152.GA14053@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200125010152.GA14053@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 996d5d5f89a558a3608a46e73ccd1b99f1b1d058
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5d359b0ac3ffc319ca93c46a4cfd87093759ad6
Message-Id: <157992420430.29990.10383776359695540341.pr-tracker-bot@kernel.org>
Date:   Sat, 25 Jan 2020 03:50:04 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Fri, 24 Jan 2020 17:01:52 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d5d359b0ac3ffc319ca93c46a4cfd87093759ad6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
