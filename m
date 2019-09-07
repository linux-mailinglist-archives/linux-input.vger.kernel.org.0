Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03BEFAC379
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2019 02:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405541AbfIGAAO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Sep 2019 20:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405572AbfIGAAJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Sep 2019 20:00:09 -0400
Subject: Re: [git pull] Input updates for v5.3-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567814409;
        bh=UaWZFtU9Ab9mseZ6UX4hS+GHMGl8hpfVexJdB7uH0s0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=iZMyjVe56hOpDfAWH3vxJ/yBCoNPwpkKFFJrqRWaqVysRE9bwwnULe7S7xb2NHFtt
         blPjVwd4r2yfm/p66FdxtjyLdqj3U4MV+OK6aH03Jm6GwsbXBFo6kf731kav0ewkqK
         gn+iP848mEqiUPxn/W2UF1CI2YOswXQSmCRJXOck=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190906224827.GA211076@dtor-ws>
References: <20190906224827.GA211076@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190906224827.GA211076@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 0c043d70d04711fe6c380df9065fdc44192c49bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9772152b4b3cd32a1aadf75e3d1a16a072d3e4a5
Message-Id: <156781440893.2933.2000532621333509214.pr-tracker-bot@kernel.org>
Date:   Sat, 07 Sep 2019 00:00:08 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Fri, 6 Sep 2019 15:48:27 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9772152b4b3cd32a1aadf75e3d1a16a072d3e4a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
