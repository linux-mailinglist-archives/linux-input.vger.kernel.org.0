Return-Path: <linux-input+bounces-3849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB968CF7E9
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 05:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B9C281525
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 03:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CCA1A2C35;
	Mon, 27 May 2024 03:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1MuILI/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E5379F5;
	Mon, 27 May 2024 03:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716779226; cv=none; b=MhZS4zgcJfmQsrD2VWDrOuldlqRRcVrQ2kKeHiiTNMD1gU3VZZZsF+d51/r9SeE5lyM0FebCmnCOm1LWQP6SD7OeMKQsUxAc4hF9Ab9qEY32VHx6Go2fcrLbf+JIiBeSFuOr3PDGEMo8v6vBYmnEwa2UDKm6Z3T3kGJK2lOTscs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716779226; c=relaxed/simple;
	bh=mkomIXN6pzO9hx2rumxV0LvfWlO256pCZqTQ8w4ZMdI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m5iE5OnWyPDkHFWuAj8Tro3cwocbPa+82mXB/uYiwCgoZVNUXK/H4DlZPC6X+PM2Fim2TxtaHDQPq/1VVEDjYSrKA6pk6z1j+95RX4GHWQ+gHozwqyNTgWduBixLsjHdEEop7HQrurOTQL8ZKzU1UigXzvbw4N0VjUxppcAa0XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1MuILI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09702C4AF0B;
	Mon, 27 May 2024 03:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716779226;
	bh=mkomIXN6pzO9hx2rumxV0LvfWlO256pCZqTQ8w4ZMdI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s1MuILI/d20Z7r2wAbDepbguQer2hhl+fXrJiYW9S6ABVevaZXgV70GpB5Uw9nYIc
	 7DtuE7pWhbvOBAOugNN9HwSCayO4A3Kt1aak+xsBhM9gd+DeQQOZUgWw+rrEsoRrQi
	 9d2G+1vAKCI5New51Elxi/1RRsYfReHmLrVesrlmVWxSi5kIFRIzGT3/a917Ugnz9V
	 FfqVpIjt/lvJeVRRRbwxmBWOybeykpJiN5sOUFvmsDYKgKPdjVAwNjvb5mFlKFiFR6
	 O24k9xUlVXXvlQtEplj11v43p5mPiDoq/sK0CDDGL3WnoG3HG4AQEOOQjXw9rjO/fv
	 1/9Xy53k8eSpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ECA59D4F15D;
	Mon, 27 May 2024 03:07:05 +0000 (UTC)
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
 <171677922596.1901.2861363430804951826.git-patchwork-notify@kernel.org>
Date: Mon, 27 May 2024 03:07:05 +0000
References: <6bab1449c01c4537aa2d9cb4481e1d5da8aa2389.1714546173.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <6bab1449c01c4537aa2d9cb4481e1d5da8aa2389.1714546173.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dmitry.torokhov@gmail.com, bleung@chromium.org, groeck@chromium.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-input@vger.kernel.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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



