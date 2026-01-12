Return-Path: <linux-input+bounces-16988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE99D14228
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DC0E3019198
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0626364040;
	Mon, 12 Jan 2026 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKX9CoNz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD662E265A;
	Mon, 12 Jan 2026 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236111; cv=none; b=UEG6trqdrH6D4Wbs5UuHh+g9gW3Otxm6Qn78XR4x1VQhbE0m2Wf7lFSNzyUJVCFY4VmR8GvRKCi2hVq0wj03OXw4syWz6L6bOS53se6gotBCcbjkJGIZ8J8V3vuzRtgrvNTJvX3mUfH95OPHcTi+JglHfplKfmKW85yF77lm4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236111; c=relaxed/simple;
	bh=AsW6iLzbOxIE4f9xpk9DSgCzw93ClJd7fMxcdududho=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ESCB/+V/MgkQmRE4WBoTuXOnGbwvaUPnDlQqMNAQ4zVL0y/rG3mxvi0eyK7rnNy+obb5jGbpdGdNIMfltdIvqJZ9jl4B7hiD9BEkIcWdLrfL+hAkeUW1/hBPlg6vKCBUCETDirWVHPy+iWYYGuvIwfp/mKzfEitcalRQCPuHr4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKX9CoNz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1A9C16AAE;
	Mon, 12 Jan 2026 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768236111;
	bh=AsW6iLzbOxIE4f9xpk9DSgCzw93ClJd7fMxcdududho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DKX9CoNz6OBhgf2nJjaONtvl1cjOd3kxB747pXqOu/CTUaK451hqf1/NMjYu5qVz1
	 0DJDbzL/eHRdS/5+yFB1vAJ3uf5Lj/XjlyXCAZSrKbBclzvt7iB7xpczGEI5t2qhv5
	 VNh7vLJVsCL2ba83u+MA0sMJ+Q71n5ix6dyTeqtFagdtYh7zdvJHZgCkKSiHBXol3A
	 J7Akfs6yfoLRr2L8n7aOdZwjyEfCVyH/H6LStKVVZJ6VYCN1Rjf7OeihIbGybiNka1
	 nBVdT3T5N/wzgOl4zMmxui7BiCQvAOhabXDAlj8HDhdHskAAbjpirBBtaWu8WJeJxW
	 qeBYkEjrHPeqA==
Date: Mon, 12 Jan 2026 17:41:48 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Bastien Nocera <hadess@hadess.net>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 00/12] HID: Use pm_*ptr instead of #ifdef CONFIG_PM*
In-Reply-To: <20260112105500.3664834-1-hadess@hadess.net>
Message-ID: <p75339q9-1r03-n389-92q7-7q9snq091p79@xreary.bet>
References: <20260112105500.3664834-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Jan 2026, Bastien Nocera wrote:

> All those changes should be safe, as similar ones were done in other
> subsystems, but I'm uncertain about the surface changes.
> 
> Bastien Nocera (12):
>   HID: hid-alps: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: appletb-kbd: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: asus: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: lenovo: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: logitech-dj: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: nintendo: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: picolcd_core: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: hid-sensor-hub: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: sony: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: uclogic: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: wacom: Use pm_ptr instead of #ifdef CONFIG_PM
>   HID: surface: Use pm_ptr_sleep instead of #ifdef CONFIG_PM_SLEEP
> 
>  drivers/hid/hid-alps.c                     | 6 ++----
>  drivers/hid/hid-appletb-kbd.c              | 6 ++----
>  drivers/hid/hid-asus.c                     | 6 ++----
>  drivers/hid/hid-lenovo.c                   | 4 +---
>  drivers/hid/hid-logitech-dj.c              | 4 +---
>  drivers/hid/hid-nintendo.c                 | 7 ++-----
>  drivers/hid/hid-picolcd_core.c             | 8 +++-----
>  drivers/hid/hid-sensor-hub.c               | 8 +++-----
>  drivers/hid/hid-sony.c                     | 9 +++------
>  drivers/hid/hid-uclogic-core.c             | 6 ++----
>  drivers/hid/surface-hid/surface_hid.c      | 2 +-
>  drivers/hid/surface-hid/surface_hid_core.c | 5 -----
>  drivers/hid/surface-hid/surface_kbd.c      | 2 +-
>  drivers/hid/wacom_sys.c                    | 6 ++----
>  14 files changed, 25 insertions(+), 54 deletions(-)

Thanks Bastien, this is now in hid.git#for-6.20/pm_ptr.

-- 
Jiri Kosina
SUSE Labs


