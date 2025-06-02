Return-Path: <linux-input+bounces-12689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC236ACBB5E
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 21:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 016781892EB8
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 19:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769CB2253A9;
	Mon,  2 Jun 2025 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Un0xGbfT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D663CF;
	Mon,  2 Jun 2025 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748891840; cv=none; b=L53gbDIBFWS+s5iHStLekwfWiARzZ/+m6OLHMWWX5i0h6ikx0/OVGV2aKhLwjuoXY9NoYSGS5WYYGTxwJYgYqwnK9OvSXES/eTQELhElzBmtcXiQJcZJZORRhECpaXyfRJRaK+/akuusiRbWyZpNIW8I2zTbJPPQalvijYQZmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748891840; c=relaxed/simple;
	bh=V0M9Et82dIM92ydZ1N9eJZnj6ejTyaxm5EY/6noh4i8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=sS6GHY/T0ktM66NcCGjxJKKo6fapuQ9t4qyrBA6pB9UtLYntfnGzGLop612+4nmL98BrT5t+tDGS3i/ap2K3FffK8Cpdb4sZEEchCxvKUUr5Fc25P9Cw4RVykJjfUPCwAOm2HTbg10orZNFjR/iCjtf12EXC2tkCc4E+p3JfyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Un0xGbfT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6783C4CEEB;
	Mon,  2 Jun 2025 19:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748891837;
	bh=V0M9Et82dIM92ydZ1N9eJZnj6ejTyaxm5EY/6noh4i8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Un0xGbfTtMQJ/IcJkLr4zyjM1Xugv2y7xc/3gcuz2PRuFfrrq8teOqxRs9UuuE1kU
	 +RS2dBqEYb9Fb2yek0zDptSJTvpnslN9lZk/3dXNUDr77ggmbm3Ia+dte0i+czH3ph
	 A3dyaPRN1G/7OPhx+iiAdoBv0Bi27f3ljY2why/2pIIXXsc1W767nvvx0qFRwua7CW
	 Efj25dKlX88yxaLS+qufb+enuJHK72l3vNETWi0fT3v3KyyWmVbLPD2g0O9elS+r1Z
	 8Qwzql8LjFDEcUWygDqqvhZ3adSKZgZoOg8s9HM+m/U/cYKNs5gcjBhCmqxz7LTqEy
	 BUzu1gJDVzmfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFB0380AAD0;
	Mon,  2 Jun 2025 19:17:51 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.16-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <66fexopj4i5izpsalnoiqxy4ufbexlcax5yqs7iqvzdpdfjwww@6wiq5a6ubmak>
References: <66fexopj4i5izpsalnoiqxy4ufbexlcax5yqs7iqvzdpdfjwww@6wiq5a6ubmak>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <66fexopj4i5izpsalnoiqxy4ufbexlcax5yqs7iqvzdpdfjwww@6wiq5a6ubmak>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.16-rc0
X-PR-Tracked-Commit-Id: 4f9786035f9e519db41375818e1d0b5f20da2f10
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d00a83477e7a8f55c9f9d0c6768901f28b1b9d87
Message-Id: <174889187017.877155.11958381161972732361.pr-tracker-bot@kernel.org>
Date: Mon, 02 Jun 2025 19:17:50 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 1 Jun 2025 21:57:04 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.16-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d00a83477e7a8f55c9f9d0c6768901f28b1b9d87

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

