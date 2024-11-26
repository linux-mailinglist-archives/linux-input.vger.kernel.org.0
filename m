Return-Path: <linux-input+bounces-8237-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE13F9D900D
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 02:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D3A5B274E0
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 01:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4C26125;
	Tue, 26 Nov 2024 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5Pq0GQ/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244AA18622;
	Tue, 26 Nov 2024 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732585227; cv=none; b=RapZaqNAlSCBXWS/S3gYDKjC1kPY9T3QZ9qg/ZGQGMJ8V/Onl72X8m0f9S9WqdOG3qiFs1D5E1vMN/FxBPEpnPzpp7AetAp6v5Ht8CQO7WhheQYwj6rKad+SI6xGd0O/LaW3wXdc8WnDlVw5dU2zZ0M9SeRxoDZrbhNXg7N1Q5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732585227; c=relaxed/simple;
	bh=Up1OP+cgtDkaEuth8URug2vt2ibEIDgl78mEzJdlS40=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=o7LXGGQ/EfXknJyALl3Q+9/AIl7BsLIBOGqQYf7cZvfqJOyA2n0ne3ymsn1Ry2CQYHZgCpvHHzrwGyhvV3oQsqNseqc13c70azlv/Ck3Fs30G3St0gbuIRtHlNsLxx/8TBjJUCaxg7UE1BCH9fn/OF2tU+kMri1ADo/3pp8jhU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5Pq0GQ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06578C4CECE;
	Tue, 26 Nov 2024 01:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732585227;
	bh=Up1OP+cgtDkaEuth8URug2vt2ibEIDgl78mEzJdlS40=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=N5Pq0GQ/xd9PbP1QfHJLMbOqR/EOvDV1NtS02eW02M4iUVBgjI2Xf+JHWdL91exbo
	 VIjrqZ2g8vQR42sz2TDt8cUsccxPUBhm7GWfWul1x4SyJVs2+h7QUL3hQgpBQelaUo
	 MPiydREREJsgOfxZ0grzJnmMUV+NiP7IA/sNPLXHtxyzwAwEllnS90DRQnwq+Eenoq
	 EcA0911ssP5xZKF0BJCAaSekljv1f/hkY6QYrxWcTQcNECHV8MlI6URed6OvalgANj
	 c3pJcWmJ2spx0vSe3x1jFuhdE7Hf1M6tFDM0jVSYulxk84bbNHOKascN4rdSCS3cVp
	 VbABP2Y2Z3SxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFD13809A00;
	Tue, 26 Nov 2024 01:40:40 +0000 (UTC)
Subject: Re: [git pull] Input updates for v6.13-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z0PQVxK5T8AFnsJp@google.com>
References: <Z0PQVxK5T8AFnsJp@google.com>
X-PR-Tracked-List-Id: <linux-input.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z0PQVxK5T8AFnsJp@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.13-rc0
X-PR-Tracked-Commit-Id: 0201710ba6308a61f1a775c418fe74b8a31ace08
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e51108c72e8adbcf3180ed40527a2a9d2d0123b
Message-Id: <173258523943.4104378.7780726275356792351.pr-tracker-bot@kernel.org>
Date: Tue, 26 Nov 2024 01:40:39 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 24 Nov 2024 17:18:15 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.13-rc0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e51108c72e8adbcf3180ed40527a2a9d2d0123b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

