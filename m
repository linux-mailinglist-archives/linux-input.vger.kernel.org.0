Return-Path: <linux-input+bounces-16855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E327D001A7
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 22:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E1D6302EA3F
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 21:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B7D3164B8;
	Wed,  7 Jan 2026 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+kXmI7H"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054A30CD99;
	Wed,  7 Jan 2026 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819893; cv=none; b=a+364ZVeTT+o4gMcvyR2RMcZGsDYAx0M9wiqzPaTVyF5wi+2y2SzzoMT6mWayTUC85nDgE9oqBMQJrJDPV06CaNopd/JuhDwONf9FMlyPloL5Hzjm1hqyDQtwZdxi+YWV+m5xUWkW3Fj3xpmoOrnkHxf5mXh54Uk7CCTxp9L2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819893; c=relaxed/simple;
	bh=6Y2D2EaJ+v6cIk7l04cynZpeBAiPXol7e9xcpLyyaSw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BNcWMnuyWF1bK4lg5QEwDyG9qvKLBAVJXdwLSZrsCitQyXVEBrwnwiYq4PAJJPtOn0oam+hRTiu9nwXL0p5zshFKVB7B9UhEB0xvRSfOrBwJSWcj67dnImmRKNIaESX/42KYwOyirTGMptBQIZkkRDCiZFe27wKldN7HsRpWhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+kXmI7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C244FC4CEF1;
	Wed,  7 Jan 2026 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767819893;
	bh=6Y2D2EaJ+v6cIk7l04cynZpeBAiPXol7e9xcpLyyaSw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p+kXmI7HhdwTyvEor1NkGlb6W8qX+DgBjPvjzNUPOFzPWhQCvWCWDWHwmaUbzhIVP
	 kAFZ7sE/Z9snxr4IG+surSUuWgKYJcQcvCj+pnGnksePAvrb5COlEzc6t5duu1jhtL
	 8E9eQOzuNmdpozuIM17O21WyZ0XBe4MlnS/SVsNzBOylgJvi2gi9jTg45p9z1IhI97
	 GRgv3l/AI4WxU5RLl+KUV9Tep+c3f5z9+blgtE446qle6v/TVvte7Yzg8nFk+i/TAE
	 4Nw8Px3fnX6dM5L0b3purT0k5wITAyZhMjUCcYZrWMIduHFK5gZSkxd0pNrqCyuX5s
	 2Oa8ubSjxsUZw==
Date: Wed, 7 Jan 2026 22:04:50 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Intel-thc-hid: Intel-quicki2c: Add power management
 for touch device
In-Reply-To: <20251222014134.1810253-1-even.xu@intel.com>
Message-ID: <o3q31414-28q1-2q70-41p0-or84391r0q54@xreary.bet>
References: <20251222014134.1810253-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Dec 2025, Even Xu wrote:

> Send POWER_SLEEP command to touch device when system enters into sleep
> mode or hibernate mode to save more power; and send POWER_ON command to
> take device back when system exits sleep mode.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>

Applied on top of hid.git#for-6.20/intel-thc, thank you.

-- 
Jiri Kosina
SUSE Labs


