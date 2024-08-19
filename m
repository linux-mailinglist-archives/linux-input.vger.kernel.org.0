Return-Path: <linux-input+bounces-5684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F995731C
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F75281A88
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 18:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85E0188010;
	Mon, 19 Aug 2024 18:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2IHntWo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41F8184535
	for <linux-input@vger.kernel.org>; Mon, 19 Aug 2024 18:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724091867; cv=none; b=M5POAjgRmFO8zRv2H7d4A2vMalKQhRF+f8uTJTJLLdimv0taPKe1ZEHRWoFifhy5ap94OjIibJsFMfdS/ScoX40IgO23oisYE0M1Xt3mBikv5pGeGKITrkWvn63uUVSl7Zqtek3kpyXITmaTgwlORGohkd/UCCAmprbv9uOT8A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724091867; c=relaxed/simple;
	bh=qaSV56H2cMk+LIKlqNSuQUxlco64MLuHLHHnI5lK/U4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mfWOcfnFsgIqYgTX7KWNhGuLJzcM5s93CQkbqlGiYboSuZKJ60HSL5XW+6Yzp/X0g8VhtbUymrtyesc75M04hY+N7y758c6i5IeCM21MvEhAe8koJ/ZUF9QP3elb6nRu2fQWHXZ7yPfDxTeXsgLcwi/3ZXH3hsKc4bA3pCjBGRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2IHntWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86F0C32782;
	Mon, 19 Aug 2024 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724091867;
	bh=qaSV56H2cMk+LIKlqNSuQUxlco64MLuHLHHnI5lK/U4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X2IHntWo7f5xekXg4jF2DRY0QtT870QUl1mQaLgKz+R9gkjcCbQow/sjjylVqkwux
	 jS2Nh4qMCEp/ZOiKmJooEw2dFTVnopAc5TujjkeRdXQhXyQZCd+CGWZHtwGMBU+hly
	 S6grpUZZyayh/uy8zMwjw8KSuKqUgxGdit0hVWDWyqxj5YmThNMcEYdMVgn7U1D1YS
	 aSE7FtLWyrNzaKEQHmbWZd+plG6Jazf6EZuDbII7z3WNVfnCt844plV497p4vUE5KT
	 XpMfWJXu+tUul2A/gwwRtHAYNJicXv5df1lBu7bq6ajawHPtGrhQjO7/50FG0Eqzuy
	 Xe0j55rA8HSeQ==
Date: Mon, 19 Aug 2024 20:24:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Joshua Leivenzon <hacker1024@users.sourceforge.net>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH] HID: Ignore battery for ELAN touchscreens on ASUS Zenbook
 Duo 2024 UX8406
In-Reply-To: <ME3P282MB3003F909C26E93990148A82AA4822@ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2408192023430.12664@cbobk.fhfr.pm>
References: <ME3P282MB3003F909C26E93990148A82AA4822@ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Aug 2024, Joshua Leivenzon wrote:

> As with other ELAN touchscreens, both screens on the Zenbook Duo 2024 report
> false battery status.
> 
> Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>

This patch is not needed after [1] lands in Linus' tree.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.12/elan&id=bcc31692a1d1e21f0d06c5f727c03ee299d2264e

Thanks,

-- 
Jiri Kosina
SUSE Labs


