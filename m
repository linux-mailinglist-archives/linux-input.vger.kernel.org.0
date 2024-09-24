Return-Path: <linux-input+bounces-6657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2FC984C1C
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 22:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FAC21F24A52
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 20:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158C613B2A4;
	Tue, 24 Sep 2024 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwTrG1Kz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96467140E34;
	Tue, 24 Sep 2024 20:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209273; cv=none; b=lmsk+p1sQW7Mp0V3LSzHxXhIuVbOwpFkMt3z4UL1VJgX6fCqj/yEUH4uoCzrK6msmMGrv0QLgpaw1jvYeCv4xeyrkOuXgcE3qfelCSJ2eJlrYZKlLISaBh5eCE9DXCqbZ5YWSbZHkBmtoATy7nBKZh3LN2wM+GiZeeGFz5JijQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209273; c=relaxed/simple;
	bh=QraEg121eTTuk3fkjbAK9b+CVswQFMw04myP2r9npRI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fYvK9P9Z2n2zdVIEuNcYsU6NCShC02NkFA4QFf9rMUDT+F3TfsXBNAcvDpGdqSMuNyEefZ5/UdiG21qs+j6dLdDZvPETV+qc5zCQ8iS8gSK5ewNAFxXRpyWKeWLiRGlCVQSm+n4DOVtG1sbRBx6lYvpD7Vb2nFPeKlAE6kuXt6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwTrG1Kz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBFDC4CECD;
	Tue, 24 Sep 2024 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727209273;
	bh=QraEg121eTTuk3fkjbAK9b+CVswQFMw04myP2r9npRI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HwTrG1KzJXzf2CrEarsLSRxraugJ3Mayuj3RwrrrtpJXAoL14FPMhswxM1BE+WwF/
	 XVIDcEQFzDuLAmRSGGW2m7Y1X75ABu8RqeIB46x/VYxDIr+2axBNwBqs9v9K9n2M64
	 qpt4fOJ+BLB3edcXKjeANe/9S9Q0RMiO2XUr/QPbbP2ptMAOlGNzvNaJxu3RSQzca9
	 TtqqCpfT3oY4PPlNedR2qn0lrUe3061xOxNWHYxFxj7crHI9kFYesooTGeKqGewVJ+
	 0+8XzHsrWIeGugrMh7qvYyJX4+UPiiOf85hLmLVxBUBNSs1zsc0CHu4YYHXh/F7Fr8
	 u64hYFagVH1Zg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE6D3806656;
	Tue, 24 Sep 2024 20:21:16 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.12-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZvKbeSkzyedREmXi@google.com>
References: <ZvKbeSkzyedREmXi@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZvKbeSkzyedREmXi@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc0
X-PR-Tracked-Commit-Id: 358800b702506c829c8ce21c125420d2abce2090
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ae2940cbcb332aee3c9d9a0bb0f2d7dc6a82e44
Message-Id: <172720927556.4186044.10095395177160304097.pr-tracker-bot@kernel.org>
Date: Tue, 24 Sep 2024 20:21:15 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 24 Sep 2024 03:59:05 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.12-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ae2940cbcb332aee3c9d9a0bb0f2d7dc6a82e44

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

