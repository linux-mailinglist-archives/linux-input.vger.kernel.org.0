Return-Path: <linux-input+bounces-13361-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A00B0AF6EE1
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 11:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAB771C81967
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACEF2D46D0;
	Thu,  3 Jul 2025 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcGj+7Do"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5B62D3753;
	Thu,  3 Jul 2025 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535335; cv=none; b=dj3FqdCN86/DXYuc0TZKEndq9ME37MVOl5gYtvv9752uuUp76gUI9uTsuljxQDb9EWL0SJSCMn+GXhjgzWJv9sRL1wp9M67O8e8vcwigOBKlJzQn+ETdl7/RN827bJxyc3T93Q21q59wdK0mmDbmXFlDTcB7Z0C/lr73GZ6XfZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535335; c=relaxed/simple;
	bh=Mr8rEE1SehkpgnbhYVhX3oVr5Y5k+OUCdyP33hfA57s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uiHmdW4gp+MALrCCEHvLOw5iDh5Ku2CNb7aPpyZeLGJQpRKcgM2egSV3Qz6s81dCo9L8PWJsAzeA+ofwCN4+NO88j3PQgK6pAWDHAGUAm72yNERvAtQjSCizkufcfJhIUUYu2kD23RK2YSZ2Sfoplv+L5/GpZ78I/6pjyBenUEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcGj+7Do; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64EEC4CEE3;
	Thu,  3 Jul 2025 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751535335;
	bh=Mr8rEE1SehkpgnbhYVhX3oVr5Y5k+OUCdyP33hfA57s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FcGj+7Do7ylnNKOh56Wz2o45TvYG9v1lTSHRbtPdSYsJcRqyBeODAJRV++DPDzkHP
	 OFDyA0FqtNtvz7zZkLqlelKkyLMmMyHDvqmS0uUasKtg2kGnYm56OKKKUnOs72x+cl
	 C/hHVtI6PNRBJJCgkPfjWHRKPMN++V4lkgUe0lWkbByxTBS8LxnJyZdKKgfM1mOzw0
	 C5ml2S/7U1WJP+qsiSDYi+Z0aLeE76mbtH9Y3jidiOLsgh3qmCoarPT7ePlljcruYE
	 bicHyaA1jhiANDK+XuziRWLIMHgLhGH7wJZbYNu+TZDXIpzVlqMk6RlSdFTsCYtemd
	 q244yLpMCtuXQ==
Date: Thu, 3 Jul 2025 11:35:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: bentiss@kernel.org, gargaditya08@live.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] HID: appletb-kbd: fix slab use-after-free bug in
 appletb_kbd_probe
In-Reply-To: <20250624125256.20473-1-qasdev00@gmail.com>
Message-ID: <no8r8855-p577-q694-srr5-31n49n2o9qr5@xreary.bet>
References: <20250624125256.20473-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Jun 2025, Qasim Ijaz wrote:

> In probe appletb_kbd_probe() a "struct appletb_kbd *kbd" is allocated
> via devm_kzalloc() to store touch bar keyboard related data.
> Later on if backlight_device_get_by_name() finds a backlight device
> with name "appletb_backlight" a timer (kbd->inactivity_timer) is setup
> with appletb_inactivity_timer() and the timer is armed to run after
> appletb_tb_dim_timeout (60) seconds.
> 
> A use-after-free is triggered when failure occurs after the timer is
> armed. This ultimately means probe failure occurs and as a result the
> "struct appletb_kbd *kbd" which is device managed memory is freed.
> After 60 seconds the timer will have expired and __run_timers will
> attempt to access the timer (kbd->inactivity_timer) however the kdb
> structure has been freed causing a use-after free.

Thanks for reminding me of this one in the other thread. Now applied to 
hid.git#for-6.16/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs


