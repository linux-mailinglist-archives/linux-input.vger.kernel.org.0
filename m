Return-Path: <linux-input+bounces-15473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2DBD8AF4
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 12:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84783A16C2
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 10:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AFD2ECD14;
	Tue, 14 Oct 2025 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+JCb+i7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94E916F265;
	Tue, 14 Oct 2025 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436563; cv=none; b=Tht7IfS8ox9HRr26neWSNKGlz8lN3/CxULMYcn09mSSI77jVZIq/1S4uUypkZjEuxLp4ARy6Gdx9vBxStQqwnNZpTdqL8eqYIfFIIx+huoZ0PBk+fepg0G6g0sC3s4mT1VtQqvUwMmpWXcI1HhPwP/htbXB3HjP/LhD0gSksOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436563; c=relaxed/simple;
	bh=W37S352CfKeea2CBnBHGkpGg8QHm8dDfVCIMfTKxZP4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VS6bwYLhCekWpqTFFHr1ixhCbtqFoAKEZY/IQM4oLomh7sPp1jB20ZM0kwrBU3P2bGuh8w2NUTarp3qMei1Ji4iJfBWvl296lBaSPOl0a+LF0P61Zl47UwwsaSgSEOLIXmxeVckPiHT4VsVZ8L/uSsxLbuCiJPCRCCrEHnkaIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+JCb+i7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E59C116D0;
	Tue, 14 Oct 2025 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760436563;
	bh=W37S352CfKeea2CBnBHGkpGg8QHm8dDfVCIMfTKxZP4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j+JCb+i7/wZREOWrhm+/OceAwL4X0jFDOzFaG/0pESmYUwnzACPWyw+2BA7sOwwyj
	 wbUBAqaOAoTM91FVF5deM3ALiWPV5jKiB5xFQQyDKIlT022USXftWjJcXjTzPTQOFp
	 QDQ7CcBPiNTKGllpTsgrzUGnDXxdmWXFPp4757dA+hPLZxabEc9FhapiPh04i/CprX
	 YgJvc3wTlCxN+zFxu0TeuWTU1riQUFIsPCLlenzQK9oE71STqMdyVaaIXs9Bf2C24K
	 zfZjDTUjh3IPS/yHUix+lRvFwCz5YZRnKH54nzsecaRm8VTK16jNy2XSK7ZahDNhmw
	 S4l4FjqOgPjKg==
Date: Tue, 14 Oct 2025 12:09:20 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Jonathan Denose <jdenose@google.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Thorsten Leemhuis <linux@leemhuis.info>, 
    Randy Dunlap <rdunlap@infradead.org>, 
    Lucas GISSOT <lucas.gissot.pro@gmail.com>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Kconfig: Fix build error from CONFIG_HID_HAPTIC
In-Reply-To: <20251013-hid-haptic-kconfig-fix-v1-1-b1ad90732625@google.com>
Message-ID: <r8116qrr-5n80-01s8-92o0-88n8q14007s9@xreary.bet>
References: <20251013-hid-haptic-kconfig-fix-v1-1-b1ad90732625@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Oct 2025, Jonathan Denose wrote:

> Temporarily change CONFIG_HID_HAPTIC to be bool instead of tristate, until
> we implement a permanent solution.
> 
> ---
> Recently the CONFIG_HID_HAPTIC Kconfig option was reported as causing
> the following build errors:
> 
>   MODPOST Module.symvers
> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
> 
> when the kernel is compiled with the following configuration:
> 
> CONFIG_HID=y
> CONFIG_HID_MULTITOUCH=m
> CONFIG_HID_HAPTIC=m
> 
> To resolve this, temporarily change the CONFIG_HID_HAPTIC option to be
> bool, until we arrive at a permanent solution to enable CONFIG_HID_HAPTIC
> to be tristate.
> 
> For a more detailed discussion, see [1].
> 
> [1]: https://lore.kernel.org/linux-input/auypydfkhx2eg7vp764way4batdilzc35inqda3exwzs3tk3ff@oagat6g46zto/
> 
> Signed-off-by: Jonathan Denose <jdenose@google.com>

I've moved this whole block above the --- line and applied.

Thanks,

-- 
Jiri Kosina
SUSE Labs


