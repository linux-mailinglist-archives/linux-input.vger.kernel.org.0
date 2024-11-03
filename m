Return-Path: <linux-input+bounces-7845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A69BA789
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 20:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2543D1F21491
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 19:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A628316EB5D;
	Sun,  3 Nov 2024 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTqx2cS0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD811632E5;
	Sun,  3 Nov 2024 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730660533; cv=none; b=AQIpdgvYCUsnKp6O7c2uzONiqSeffo6vztmhGTcrPSy4StSTggcEXOzM4dRlIhG3C7zNwmXUlFCD2Dd06va6dyRmN9XoZZzSXJCoaRF4lFmWHXPT4pfNPs+livaEeAGGXTKObx9Xky3c6v9Ej5zWVRrr/GS6aFX5CcExleOFREY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730660533; c=relaxed/simple;
	bh=kuqpL0Se3A8YipUa3Ce3WDKpx8MWcKU0F3kaHYcHvEk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OUKRZW4Dlh4wWhDV4eqw4REe9b5FafmGINqnw9jNM3fZ8WT6tXY46Or1GPbayKiEc7aH0nGEQh+0htI8WH9OkJr7KVULm1RKI7YbBcBSXwKR5rEdsUStb8fWwygqVMq2cnoVF8qTRgaSLgklXzctrN3ibAP208KgoHEgcaecORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTqx2cS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05AEC4CECD;
	Sun,  3 Nov 2024 19:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730660533;
	bh=kuqpL0Se3A8YipUa3Ce3WDKpx8MWcKU0F3kaHYcHvEk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lTqx2cS0GZV3PDFky087sw4A6MXC1nSn9Zyul5B5Faq7LsAodhBaQPcoXQeQjxJai
	 EFoXGq6n2Wnyj/3CCImHPFQ3jitQGEE/ZYiSHbMCpO3YQs7wbURF6r1xu+psbnlABr
	 cWGo52P75GeCMCl7Lnz7GHItYvbDOLgumPYRJxVwiqnxFFnZE+YODQDGLeIm5m6nAd
	 Z2S2Sn1fSbD5JM+3wzzorHGqk/BDqJPViLAG5lvwKTnjNRzEtq+bkodQgfa8OSXBUx
	 ed95ljtNdOAUuHm2tKJHK7DIyxvDuN5gVu1gvLAQ/69DeWdq6sW3ixNysjwMcYbWhb
	 W1D6Y9R+xE6fA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFFC38363C3;
	Sun,  3 Nov 2024 19:02:22 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.12-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZycQ_DEua83lHubu@google.com>
References: <ZycQ_DEua83lHubu@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZycQ_DEua83lHubu@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc5
X-PR-Tracked-Commit-Id: 071b24b54d2d05fbf39ddbb27dee08abd1d713f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 295ba6501d2e83b2e66729dc3a7726f80893c920
Message-Id: <173066054130.3233701.8398315121991523389.pr-tracker-bot@kernel.org>
Date: Sun, 03 Nov 2024 19:02:21 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 2 Nov 2024 22:58:20 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/295ba6501d2e83b2e66729dc3a7726f80893c920

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

