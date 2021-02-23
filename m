Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F58323461
	for <lists+linux-input@lfdr.de>; Wed, 24 Feb 2021 00:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbhBWXqg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 18:46:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:53166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232764AbhBWXhB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 18:37:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A093364E77;
        Tue, 23 Feb 2021 23:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614123380;
        bh=v/WReijX7+TVxKDhY1/E8rG3lpj5YXVTe3Z9BOgvvU8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qdW4upXyHdOEbdlhc3UEqyIlVBuErSBu63ncg4LZS07XbZ/+AwweokDnD5Obh+ffN
         txhUw4TDIudVYPbXQCPgBWbBlfTk3KntE9/+T5XVRZEUkfo3PkkWKjL5X4avdZ53qe
         ug67Qk8X/fSMUE2iMheIfNMSqdeQ72A5APRnTNbTSwwMiGxXjDR2A81LaN8XXMUhpk
         wPSQI/u8CeWLEjnBJCcxySoD7wbsVCDl+E2oF9E0/4lUMLM1A8sn1uTQLMWZomAEvN
         g2Sgq7ndcEkjo3Ixa156IPLM81y6zuwy8sjw+q8uqy2T/0eYacfY7UlJcZD4rxmtRl
         8HXYZrf2KJyDA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 987E160176;
        Tue, 23 Feb 2021 23:36:20 +0000 (UTC)
Subject: Re: [git pull] Input updates for v5.12-rc0
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YDV/YAJ/eNezR3jR@google.com>
References: <YDV/YAJ/eNezR3jR@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <YDV/YAJ/eNezR3jR@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus
X-PR-Tracked-Commit-Id: 1bff77f41a805b16b5355497c217656711601282
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e0fbd25bb37e7bb1f5ad9c9f7e5fc89152aec87e
Message-Id: <161412338061.20258.13412728536562584773.pr-tracker-bot@kernel.org>
Date:   Tue, 23 Feb 2021 23:36:20 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pull request you sent on Tue, 23 Feb 2021 14:19:12 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e0fbd25bb37e7bb1f5ad9c9f7e5fc89152aec87e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
