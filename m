Return-Path: <linux-input+bounces-7533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 814EC9A3C00
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35AB21F24D21
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 10:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB04201245;
	Fri, 18 Oct 2024 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSJKqk3L"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882712010F2
	for <linux-input@vger.kernel.org>; Fri, 18 Oct 2024 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248557; cv=none; b=TrU63z1xtJHoRJuRo+BLIjhnruIhvHQv0g2Pn6CewXCNQWHDdjOSS0jHPBs+26BwzIWhWg1tittisyHsKXgbBO9QRKhkHAUSaPk1TbqsF/sBfv9cj9tUfGw84l368uREFGkA26fQNZugRK+dTAdRfy5Vc8CbH8wmkyLsJVfNf2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248557; c=relaxed/simple;
	bh=ik7DM4NiwqM8ENigLD0DxXmNgfgKwGLFxxrAHbngeac=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fv51afOa8FC0l/ivwNev9H2scKqk64E7Lk01x63EZtabGqepzqGWYtu1+uouwB+fPwRDOhrKooop+xSfu+e0/40uhs8UMNtJNMTWAaZxRNHWoQzFkppAj6SR1A6DBWAkH2mq85O+1WdQrJ5yQT/b3T2pe6RoBwuoSj9BOjYzTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSJKqk3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC356C4CEC3;
	Fri, 18 Oct 2024 10:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729248557;
	bh=ik7DM4NiwqM8ENigLD0DxXmNgfgKwGLFxxrAHbngeac=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jSJKqk3LOR97GWPYa5aIkkwMsCSJmWRSxBZlm+3U1W73RIsH9pLBwqPoC8fIL+9ej
	 EUzA8sPZQmvatOG6vsLv6J9SNd7+LR8yHnOxW28X83xc4dOqi2igDxaiN7/ll4PPhu
	 4peWiPXmjMMGY67+0BGPPwtYAyMYO8hwBfHBk3DZBW4f359Ys9a7P8bZlgTfb0gLXE
	 GnnkfbyfHEfvRujiP5fOFzON83Y+lX31N9Jye8aJrXdOS3bUBXUHOdwANA+9hTMR99
	 9lXHlR4dyTxJXH5oyqDgUUrnMIu3bnPM0XXXDeiCNNeTqfrapzew0Lrn34O0i+cyC3
	 8NvulXjz5B6VQ==
Date: Fri, 18 Oct 2024 12:49:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, Erin Skomra <skomra@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, 
    "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] HID: wacom: Set eraser status when either 'Eraser' or
 'Invert' usage is set
In-Reply-To: <20241017183113.631272-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2410181249010.20286@cbobk.fhfr.pm>
References: <20241017183113.631272-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Oct 2024, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> Microsoft defines two slightly different behaviors for pens that are
> being used to erase. The first one, for pens that can be used while
> inverted specifies that both 'Invert' and 'Eraser' usages should be
> set while the pen is in contact and erasing. For pens that use an
> eraser button though, they specify that only the 'Eraser' usage should
> be set (while hovering, only the 'Invert' usage is to be set).
> 
> We used our internal 'invert_state' flag to determine if a pen has an
> intent to erase (whether hovering or not). That flag was previously
> only depending on the 'Invert' usage, which was sufficient for the
> first type of pen (EMR) but not the second type (AES). This commit
> makes the flag depend on either usage being set, and also renames it
> to make its function more clear.
> 
> This change should not normally have an impact on userspace due to
> both the existing driver and firmware design. The driver already only
> determines tool type based on the first event in an interaction (e.g.
> it will see the 'Invert' bit set when the eraser comes into prox and
> then report BTN_TOOL_RUBBER for the rest of the interaction, even if
> 'Invert' is cleared). AES firmware is also careful to send reports
> that work through a set of defined state transitions, even in the
> corner-case where the eraser button is pressed when the pen is already
> in contact with the display (Prox|Tip -> Prox -> 0 -> Invert -> Eraser).
> Regardless, it seems reasonable to ensure the driver's state variables
> match programmer expectation.
> 
> Link: https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-pen-states
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> ---
>  drivers/hid/wacom_wac.c | 7 +++++--
>  drivers/hid/wacom_wac.h | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)

Applied to hid.git#for-6.13/wacom. Thanks,

-- 
Jiri Kosina
SUSE Labs


