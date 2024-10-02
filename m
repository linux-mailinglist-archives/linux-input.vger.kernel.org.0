Return-Path: <linux-input+bounces-7029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0392698E3B9
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 21:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA3021F217E0
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 19:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311E12141C6;
	Wed,  2 Oct 2024 19:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY9WkCDr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5181720;
	Wed,  2 Oct 2024 19:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727898707; cv=none; b=e9bRJtdprTG85ZYXGV8/ffuMQIS12Ply8x39ujeunNjThRHIWF3CVL+BE08QS8V2W/AEsc5Z49KOSE37v4f2x51TMelOjUdaS4NgVEaNKN738QHhBfG37INxQMkllMANpuVKP8Q/415PgHrcJJ0C2LisPj1xNqmSfZekOssSgJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727898707; c=relaxed/simple;
	bh=JMgmu5Cqir9feF6Iz0/3BLe7dWS9AhjO0n028pUTa2w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=H5YjiuSU6BgK+DRdwdrqs+/PUNDcJwsbWgm0yzfClYSNNlfzuU5eeXg6AU4DRfUj/DzHEQPMP+f+EqZmS44thPFDUvA89kMug9JjaKAZinFZCivDoHxtfspSbrMXoOuv73UjQwJAcriRsxxgjLg0jAHIPXzRIFALYKpBT7lbsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY9WkCDr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A5DC4CEC2;
	Wed,  2 Oct 2024 19:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727898705;
	bh=JMgmu5Cqir9feF6Iz0/3BLe7dWS9AhjO0n028pUTa2w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bY9WkCDrANWMg+M9J5PzAeHpVxFTbCS831VIuBWvoSACsZKh5bpyMTmx/l4fNldAd
	 m7GL7FsGqOO0iv+Bx9qklklI97adnKFae/+9lRFW/1HwRIlrmJ0iTpcF4Ovf56wMzB
	 3M4DZ+PcPVVANYUDQoEnzEAUHJXruaf4mwq/RHpc2YmWl9mOou0T/JqMOZH5su6AaK
	 h5+dPJ7nJXGyQ0S/1vi3lM2C/Q9Bw7QAew+tcstbmvU/FryZ/uC3FsQLTvLiN5LbDD
	 e0VELR784OLNloxOM4itDauURcwSxRcK+sAajiYg8yc9g08CGy08oFXpFRzPndb5n9
	 2+O1s2cX7V9vA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB635380DBD1;
	Wed,  2 Oct 2024 19:51:49 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zv0L62ULdkkweejQ@google.com>
References: <Zv0L62ULdkkweejQ@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zv0L62ULdkkweejQ@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc1
X-PR-Tracked-Commit-Id: c684771630e64bc39bddffeb65dd8a6612a6b249
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d2746a208ea5faaaccf9a5e97ad214cff0942f5
Message-Id: <172789870862.1292614.4503913280668349933.pr-tracker-bot@kernel.org>
Date: Wed, 02 Oct 2024 19:51:48 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Oct 2024 02:01:31 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d2746a208ea5faaaccf9a5e97ad214cff0942f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

