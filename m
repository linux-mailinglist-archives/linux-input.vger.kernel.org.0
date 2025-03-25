Return-Path: <linux-input+bounces-11252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B656A70835
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A377216CC23
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF3419EEC2;
	Tue, 25 Mar 2025 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRch+M7M"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B7B84FAD;
	Tue, 25 Mar 2025 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923789; cv=none; b=tp6Hi691jpRjevCsppcSeWB4fowlux+oYYRU8Q1nrIrChTZBLGSF8BzkonGIj2SunVfELxYN0ntWmQ70zuccKtNqzi/8ftSzKHIyagZlQ0/o/zy9f6oS+ej5xYlRE49t+NeLvWhj0oAsF3+iE/IkIc+2otrs3drHjHyDh8AO+EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923789; c=relaxed/simple;
	bh=BWhodHSI+9yK6kenSRuoJmYMWxeAmWE0pnPItawj8KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGSrbTvAYj0IfULCxiIug2k3AXiSj33wBiC6RGrJWzbz2PvKDClE5NJgCGr1mclJbWBDXawDVqf9pGQF8LvWgcVFIqq5jrZUKkSGYdTW7M1Y7G7mhOzkVJVSvAJCUIx8ds0xTJvr7uKZW9LmY3JhEj1V1QRST7gVxwc15306S4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRch+M7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8422C4CEE4;
	Tue, 25 Mar 2025 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742923788;
	bh=BWhodHSI+9yK6kenSRuoJmYMWxeAmWE0pnPItawj8KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRch+M7MnA3RfGsLGSq09H/FM5LJ9tHz/GouR2XC/1ngxLJ0X2ylbxwJefF0kJs1S
	 jTQbsOi5n0TJFmh4z70D4SsZM/YxQZl4dBFWTsAR/7Z4Bb4xhtVIPu4upPDZfif2qI
	 DAdAiymzWL9BP5Q6MIsyh6GR0WPernBw1/kcyT/LTlhuZZU1Rli+d1r5osNCuTGR/z
	 qzgk+4Nc3qW6I5ibxADok3BlEG1icz6Z+7vhz0RUXt0wKHhJYcysBQTrPRik8heC6G
	 YnkJ43Rc0tlVamkaVZvs0b1j/ts3oN8ownJCNhLpIMZ1xCQep+4PSTMO7bHYKKv2Rw
	 Ey01zBf1Mp9wQ==
Date: Tue, 25 Mar 2025 18:29:44 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <adityagarg1208@gmail.com>
Cc: admin@kodeit.net, benjamin.tissoires@redhat.com, gargaditya08@live.com, 
	jikos@kernel.org, jkosina@suse.com, kekrby@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, orlandoch.dev@gmail.com
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple
 Touch Bar
Message-ID: <bzb6rk7q7rs27kbonihpfftkgueievpux7vpqjgrgsud5pf5g2@tuxymj7vk3it>
References: <02F14282-87DB-4EF8-80EA-3D0887F3C30E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02F14282-87DB-4EF8-80EA-3D0887F3C30E@gmail.com>

On Mar 25 2025, Aditya Garg wrote:
> Yes I can move hid_find_field to the original location as well. But, I would not want to devm_kzalloc as well unnecessarily if the touchbar is in the basic mode instead of drm mode which will cause this -ENODEV to be executed right?

It shouldn't matter. hid_core calls devres_open_group() before calling
.probe(), and calls devres_release_group() on failure. So yes, we'll
allocate a piece of memory and release it after, but it's not something
uncommon.

Cheers,
Benjamin

