Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195E03611D3
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 20:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234538AbhDOSPY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 14:15:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233955AbhDOSPY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 14:15:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DF0B8611AB;
        Thu, 15 Apr 2021 18:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618510500;
        bh=Ww3ZmuUAyt6XEiZ4Nzj0O6W0cefYruATjqt3Talg4Zs=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=OepsrKq75D1wI5Zp0BAeggNkk8avEqmNYRU+CJl1kPBcBufL27DsWPQq1Xrez9+w7
         a8TyzLYmMxkzIjVgDeQimamUplQsuYylJUrMDSQPo5O7xDXZDphFfe3SM68qmeky/V
         4lYTIRh0itLPHaXjnxBA3JQCCZWpW8SfyFyc9sLoN/HclQAWi4U6K1F81yExZRZSWI
         JKy7Cy2l9QtWfPvHhxfbLpC15CfIuSpfCcGfOogrMBNKMUxZ86DFxhmIpeq2apmWzh
         xGYP+Uk3yUz4lkcVfHs30gCGwxFtkCzegvn5vUmHmvV7eMSIFhbFRw3MqiFbfMSf9H
         Nmd3w1jgeFYoQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CC1C3609AF;
        Thu, 15 Apr 2021 18:15:00 +0000 (UTC)
Subject: Re: [git pull] Input updates for v5.12-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YHfO5AMF3PwmEBhR@google.com>
References: <YHfO5AMF3PwmEBhR@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YHfO5AMF3PwmEBhR@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 56cfe6f820a6315291eb5a1b82bb49633b993d3b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1df01322f00a0aedd4a589597ce9c0b680ae6068
Message-Id: <161851050076.16434.14633569827105948552.pr-tracker-bot@kernel.org>
Date:   Thu, 15 Apr 2021 18:15:00 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Wed, 14 Apr 2021 22:28:04 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1df01322f00a0aedd4a589597ce9c0b680ae6068

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
