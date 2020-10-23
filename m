Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C12E2979BB
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 01:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758790AbgJWXmP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 19:42:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758779AbgJWXmP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 19:42:15 -0400
Subject: Re: [git pull] Input updates for v5.10-rc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603496534;
        bh=ZB2icJbzEIVseELIlD7fbk/bDYUbxeLenma9nxr1oCU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=1ataTDlF6xoP7+XXapeN7tbpbQSfTMY6c6eUxwizRoSV+BuF87mWuL0Y2GpVHAEB/
         43R8fPMQa9pPX8uXRn9Ddg5Ch/l2hT6ohYLT7CKvUm+MEEptCD1cJrE1PkKwD8vTwE
         TrvOS0RbdhwMq18KjxkOWn5eUJRBSPRQtUzGtd0c=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201023045421.GA2205724@dtor-ws>
References: <20201023045421.GA2205724@dtor-ws>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201023045421.GA2205724@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: bb0bc0cfeabc0d6865865e8d3a601bea6711f951
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd7e8c996f5aba542f416ee6d19e91fd3668674f
Message-Id: <160349653444.22217.12971150119313974490.pr-tracker-bot@kernel.org>
Date:   Fri, 23 Oct 2020 23:42:14 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Thu, 22 Oct 2020 21:54:21 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd7e8c996f5aba542f416ee6d19e91fd3668674f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
