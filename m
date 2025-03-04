Return-Path: <linux-input+bounces-10542-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62137A4EEE8
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E2D616FBDC
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5C7204F61;
	Tue,  4 Mar 2025 20:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXApZhyT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3071C84D7;
	Tue,  4 Mar 2025 20:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121789; cv=none; b=rej9G5eV5m7VXAPfLw2sCctAZcCyiqqBWUFTNKQSC2+UXyvASNskz+A0Uc+rjW8/2pJuLZko0y9KBfKzhBZrep1CJPfcw83JpyWQGC+XEl96erHe2gQWy+FEzgZ4qLyHStNWgr7yjcmRZuIYc5cIYyHV/vlR/HYX9TEAnvPxVlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121789; c=relaxed/simple;
	bh=1Avo1J1t/55foolZqszBHMkSIlhzUvvxah+3+Q5by1o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bzZxGQVURo3iMl/Ce9grxeeJAcZH6QOjZ9n94TJbdkBauNyzhfU0WZJOo08oW6ohBhcBTYxkeDONHN93j9gZ2+fnZI7L/PjyKcVHBG07zAfrmejo6EArV6JxMa4rHL5Gu2dcHWuyKDIxLurL3qaldF/H2FUBM337uHUjBNSuT1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXApZhyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5BBC4CEE5;
	Tue,  4 Mar 2025 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741121789;
	bh=1Avo1J1t/55foolZqszBHMkSIlhzUvvxah+3+Q5by1o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SXApZhyTz5vv9wzRJoXczuOEVj7QwpGl+xE+oChVkj99OVOC+nKeJbb9O5J3i5AS1
	 sh1Jl7awqRzxXB122sCCzUa5IRRTN8TFMGqClySmfEynCcjnWyKU7f99eNCZfiaCA0
	 LjSUzbhvPwUZGEJyIBUXCbzp71o/PzSFen0jCvXPanD1jWRi5qr/GSEzPsiaiqGLMD
	 5VPm4mFzchDw6WPATpKr9pHJKoZLBdQfM+OV2GrMEM7lUgtnyvEY0nx88ODmJWAoeD
	 bT9/a/9FAYXj7pPQcuaYoFvc2xYLO+fWDa40ofUmbbfy2DS8vDwvvunyFBbpvFgSBl
	 2XOYFIXGS24nQ==
Date: Tue, 4 Mar 2025 21:56:26 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Luke Jones <luke@ljones.dev>
cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com, 
    ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org, bentiss@kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v3 0/2] hid-asus: asus-wmi: refactor Ally
 suspend/resume
In-Reply-To: <20250227085817.1007697-1-luke@ljones.dev>
Message-ID: <878o9n16-33p1-orpr-q957-91ns25pp4804@xreary.bet>
References: <20250227085817.1007697-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Feb 2025, Luke Jones wrote:

> This short series refactors the Ally suspend/resume functionality in the
> asus-wmi driver along with adding support for ROG Ally MCU version checking.
> 
> The version checking is then used to toggle the use of older CSEE call hacks
> that were initially used to combat Ally suspend/wake issues arising from the MCU
> not clearing a particular flag on resume. ASUS have since corrected this
> especially for Linux in newer firmware versions.
> 
> - hid-asus requests the MCU version and displays a warning if the version is
>   older than the one that fixes the issue.
> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> version is high enough.
> 
> *Note: In review it was requested by Mario that I try strsep() for parsing
> the version. I did try this and a few variations but the result was much
> more code due to having to check more edge cases due to the input being
> raw bytes. In the end the cleaned up while loop proved more robust.
> 
> - Changelog:
>   + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
>     - Adjust warning message to explicitly mention suspend issues
>     - Use switch/case block to set min_version
>       - Set min_version to 0 by default and toggle hacks off
>   + V3
>     - Remove noise (excess pr_info)
>     - Use kstrtoint, not kstrtolong
>     - Use __free(kfree) for allocated mem and drop goto + logging
>     - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
>     - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
>       correct the message.
> 
> Luke D. Jones (2):
>   hid-asus: check ROG Ally MCU version and warn
>   platform/x86: asus-wmi: Refactor Ally suspend/resume
> 
>  drivers/hid/hid-asus.c                     | 111 +++++++++++++++++-
>  drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
>  include/linux/platform_data/x86/asus-wmi.h |  15 +++
>  3 files changed, 215 insertions(+), 41 deletions(-)

Hans, are you OK taking both patches through your tree?

Thanks,

-- 
Jiri Kosina
SUSE Labs


