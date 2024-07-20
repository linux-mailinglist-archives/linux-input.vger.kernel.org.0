Return-Path: <linux-input+bounces-5103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A316937E68
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 02:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28A4AB2156D
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 00:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E15714293;
	Sat, 20 Jul 2024 00:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1i63+DO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C82125CC;
	Sat, 20 Jul 2024 00:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721433956; cv=none; b=HlgGBUw4PRMo2yAr0VVxkf7u1IU8zv08y3NWOD52KB9uVQJinqZq1DEV0kTJSsIlAhfUAgAKhoS3B9TQHjlGkZXN6pNDne62Jrz8n63fotcs0jbbTXqwOQIPDHJ5/hrXHzRATXA55qs24+08r5YYlYHOnOCEclkTF49m9RpthyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721433956; c=relaxed/simple;
	bh=LQmQDrlftSnKuu9mw2wQ0yMZbHGXzl0/IRg0Z4kXMqY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OoaQJJjJtwd16fOxLZ5+bwjmfCWV9glbXQEN+HsB6TJJUbWrSXRXoTqX7b0jQdpKgzg3WCM+/Qy1tjaVad23YjuQ0vPh7oqT+H+tQcEuoDkSp+gXhHcGPfO52bouK6aNCevZEVvXNrjgsk4GCa54F+S0F4J8lsY3jPTK7Dc0X6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1i63+DO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D10EC32782;
	Sat, 20 Jul 2024 00:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721433956;
	bh=LQmQDrlftSnKuu9mw2wQ0yMZbHGXzl0/IRg0Z4kXMqY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m1i63+DOWwhP9N1jADy0MjJmYC62yU+jZEAXlmudbfd/K8UPCSeybOcTCZFBfI/L4
	 sHP+/M9NflBxfytxgsHfUC+ZL+laA3ghPVEcLa7hQuzDN3qrgw/tUff8e44SO9JFej
	 QLGAHLwWNsRaSUiYgcWV+fDHJoZ3ja6Dm0D+Yl3YeCBQdDBY6AD8gqGaknLkJ2YdS4
	 L+glbdiCXPI35w8fQALT0LZj2IBBzx+HS3X/nvoC3UF/tqRHvFRvFrtc1fEg30FY8+
	 YjmZGuOXQ1ohRcZZMqPXtugQ6V5c0jCZzvKn6Vku+Cbsxy+S+IBC319Ms7P93PpPgS
	 xhGQ0+bg3oh5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41618C4332D;
	Sat, 20 Jul 2024 00:05:56 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.11-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZpqftagN_230ClsS@google.com>
References: <ZpqftagN_230ClsS@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZpqftagN_230ClsS@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc0
X-PR-Tracked-Commit-Id: a23e1966932464e1c5226cb9ac4ce1d5fc10ba22
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74
Message-Id: <172143395626.25682.12010481405168451470.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jul 2024 00:05:56 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 19 Jul 2024 10:17:41 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

