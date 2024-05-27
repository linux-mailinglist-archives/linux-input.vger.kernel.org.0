Return-Path: <linux-input+bounces-3848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5A8CF77F
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 04:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB554B20D20
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 02:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF43E79CC;
	Mon, 27 May 2024 02:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+szD9Q+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5423D7;
	Mon, 27 May 2024 02:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778511; cv=none; b=DFTv4k9dUBDmgPLEUeHRZ9xXTL84Oks7Id+UOKABclksy9MfDT4RzBP5yrTW17tCr8vwrtSS6mHyqvxP5WW+FIx2stjHvhMP29n1AYPHiCCcPU64dYFESGpOAD+HVeyRtxiehSsUPlwecbztgvYnKQ/m1Va369EQKGjCIv85sB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778511; c=relaxed/simple;
	bh=aZpuLYiE4LlGL9s75mSoBU8PIw58s3XwiPcNNXEzxyU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AGSyDG1rT0tOrgMgKvSr3wXdyu2v2eYjqI34nyYQHyKEfYPVg4qsLLVTjtzv27sNEDG6Wp4xrOo97MNWVHO+kbbDpxFbin1hYBOwxQhORhCYa0SqZfBJxklbJfI/lEootsimE+7sPedualWnAxbUIOPUAnSVq88grfEJWcRagKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+szD9Q+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 307E6C4AF0A;
	Mon, 27 May 2024 02:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778511;
	bh=aZpuLYiE4LlGL9s75mSoBU8PIw58s3XwiPcNNXEzxyU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H+szD9Q+LtPMLJiFIV84z6LgMroAJCfOqJxnywfmKBps5Qi6wlCeb6AR874FXbAK0
	 xDTWZlyGYb/Xlvr55pDLNHQkyUzGhnF2uJXEDHd3Jeukt4e7Z1YRo4G/e8zFoUTcbI
	 2vzDxeBms6pcGq8kcCo7HnmAVs/vyPg1l7xPNJCjnAfkx+eIe8CWbYsGlJAMwgqvNu
	 1HUSxqmzhPoJ00dLKxbZuZA6wHSMKgmnH1cn7YKHhmQO5RDFSrlvUcuITIetozb1TN
	 eQZFTgJ0rnTuo7RhTe4EeU0oju8wBJWd2+6LOjomC8NjdyYFBXWWx/sYGFD0HIe8+q
	 12mqX4IDdhHWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A482DE4001;
	Mon, 27 May 2024 02:55:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Input: cros_ec_keyb - Remove an unused field in struct
 cros_ec_keyb
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171677851110.1901.13316641660823149535.git-patchwork-notify@kernel.org>
Date: Mon, 27 May 2024 02:55:11 +0000
References: <6bab1449c01c4537aa2d9cb4481e1d5da8aa2389.1714546173.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <6bab1449c01c4537aa2d9cb4481e1d5da8aa2389.1714546173.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dmitry.torokhov@gmail.com, bleung@chromium.org, groeck@chromium.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-input@vger.kernel.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Dmitry Torokhov <dmitry.torokhov@gmail.com>:

On Wed,  1 May 2024 08:49:47 +0200 you wrote:
> In "struct cros_ec_keyb", the 'keymap_data' field is unused.
> Remove it.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - Input: cros_ec_keyb - Remove an unused field in struct cros_ec_keyb
    https://git.kernel.org/chrome-platform/c/5128de84d8fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



