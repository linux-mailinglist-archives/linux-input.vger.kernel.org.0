Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D72A1BFAD
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2019 00:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfEMWzS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 May 2019 18:55:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:59244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726774AbfEMWzS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 May 2019 18:55:18 -0400
Subject: Re: [git pull] Input updates for v5.2-rc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557788117;
        bh=+gf1h8W3KpbcxjSSgm9Ph0okPPUPu3xAtR4MIBwY+GE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=SXO1st0eRmtpXiMaMX3eGiFxKzZAsbYVQisFYInBrAJfgghKYDm6C5doVESzy8bRI
         nI9zlIa+FShgaxDP/p8XDARLCgJ0Ej4xoBaakmn7aeWmS6nFNUB/OcQKm9GNwJxvu4
         58QKSdrtfZ/xI2vO1MUZgbHjv4JHZinxzkfOfQ/Q=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190513201235.GA87488@dtor-ws>
References: <20190513201235.GA87488@dtor-ws>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190513201235.GA87488@dtor-ws>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 14e0c7317ed58bcd15af5c3d09818ee0f2e3984c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0aed4b28187078565cafbfe86b62f941d580d840
Message-Id: <155778811767.1812.6866475534635795487.pr-tracker-bot@kernel.org>
Date:   Mon, 13 May 2019 22:55:17 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Mon, 13 May 2019 13:12:35 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0aed4b28187078565cafbfe86b62f941d580d840

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
