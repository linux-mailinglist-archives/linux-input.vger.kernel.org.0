Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4129721FD83
	for <lists+linux-input@lfdr.de>; Tue, 14 Jul 2020 21:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbgGNTkF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jul 2020 15:40:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729829AbgGNTkF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jul 2020 15:40:05 -0400
Subject: Re: [git pull] Input updates for v5.8-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594755604;
        bh=pcuKZNaNufkGLHLNWD8QpG9rGBl7RWapF2nTKQpekvc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=mzOWRcJMRTiDaHxP9rQQDoAD9PFEsJ1zPEh9/OU8USUNpZvCZUL9iSSSJfniKrLiJ
         wUxoMyRuR+w/MUdzaGDG7/f02ixet9JW52aXIHcQhuf6hzSBbJ+gmM8ia4pT3Q3V0P
         jKoF0gHDaDvhKBoT8my/Fs7uMEqiX/T159cOYPRU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200714002748.GA1477546@dtor-ws>
References: <20200714002748.GA1477546@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200714002748.GA1477546@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: a50ca29523b18baea548bdf5df9b4b923c2bb4f6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9919e11e219eaa5e8041b7b1a196839143e9125
Message-Id: <159475560462.23655.616523737761639070.pr-tracker-bot@kernel.org>
Date:   Tue, 14 Jul 2020 19:40:04 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Mon, 13 Jul 2020 17:53:32 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9919e11e219eaa5e8041b7b1a196839143e9125

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
