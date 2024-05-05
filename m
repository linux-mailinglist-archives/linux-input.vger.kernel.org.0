Return-Path: <linux-input+bounces-3459-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0648BC2B5
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 19:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20F601F211FE
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 17:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09F2374D3;
	Sun,  5 May 2024 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ed24CtLB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BF62C1A3;
	Sun,  5 May 2024 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714929174; cv=none; b=YQwAMmmZkOy2hIFB/HzTPsXt7l6JRx+F6ZrIjV0GEZBBZMaz+amc0fsp1mVHh7REttgh1ODHUsbWJRkNvzvPr2AYyOxSqTkDieIqISCtYs16nIqhqKDYo95VqSdgOd0XiU+dQhsgCP/bkFNuWr6XZ+o4QKzcx8zMQr45HC6KZnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714929174; c=relaxed/simple;
	bh=Q4cBm3A3Bh0oIjbxy0Mzt5mzryLQTcwmq9wZ6cdTsCo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SjkZTsfg2kwWqnw/yN2lvGPXkHWALQtggt1bg+U74zUkKjnnnOMcSXilBopFPP1AonjYVeb17NWsuT8m59YfHOWRI0fnLCKh8ZC1kHVxOVyMu3jJuOXDdwvSTeUAHcTsl+L4psG0rtQPeYmcImjVsoWbRxh3QoN5AJD4EL+12/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ed24CtLB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69B95C113CC;
	Sun,  5 May 2024 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714929174;
	bh=Q4cBm3A3Bh0oIjbxy0Mzt5mzryLQTcwmq9wZ6cdTsCo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ed24CtLBTpBWmdFVymWp3rBDi3c7fyuENTs92iBc0D4Dr8dV4mRxj7GqIv3EXVSNK
	 yVNNZaREyl6xa40ydhexBF9GLWudRcvJigVX0LKQtshShvtUcQkQqdxNBCSkRsikwf
	 hsPolsyKyxXgnOjdTwcyNsv39zB7E+M0Q9tDd3PNl7J4osRGALnS1XiHkLtwU34ffm
	 lDpZ91FMxviHH4MQRU0QQhi+9Xc4j7KYiFv2eH/0VlG0+9ZR4mUiDkn8ZlyKWQMQaZ
	 1CnqCQ261MLgpI7bCQQdTMu5KkmcIW38QRCAnq30vy2NbRL/n0Q2ipdCSRCZrqiLP1
	 9voMRTaIQKqmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 60961C433A2;
	Sun,  5 May 2024 17:12:54 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.9-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zjb8RrOFLHFSk_Gv@google.com>
References: <Zjb8RrOFLHFSk_Gv@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zjb8RrOFLHFSk_Gv@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.9-rc6
X-PR-Tracked-Commit-Id: 0537c8eef4f699aacdeb67c6181c66cccd63c7f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f1d0865002795eb45c49e30a4fbc40f7956b6ae
Message-Id: <171492917438.31500.11069855725465360882.pr-tracker-bot@kernel.org>
Date: Sun, 05 May 2024 17:12:54 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 4 May 2024 20:25:58 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.9-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f1d0865002795eb45c49e30a4fbc40f7956b6ae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

