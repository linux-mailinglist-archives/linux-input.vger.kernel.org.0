Return-Path: <linux-input+bounces-16853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AED0014A
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 22:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D14BB3002D08
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 21:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6BC2BE029;
	Wed,  7 Jan 2026 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPlQtxl2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126CE29DB8F;
	Wed,  7 Jan 2026 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819716; cv=none; b=HQ8r2bfyOI6NYEW3XmHcScDm4KV0YwyaGno3arVJH8yxz3tcPaji8mBzveNkVAAIKSlqCUXLgLFwf4GBdfILCNv7C2jnWA713b+5+0BzTsLOLI4CpMOS6UNds0pD/WqY3BKZSx+jcQ6+cYrFXPDxRDRzEZtZaQfJKTZYQCNWaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819716; c=relaxed/simple;
	bh=NFgk+KNjY0hyxx/Lcuyi3jaYoo9P9bFN6MB0H5vauXM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e7peOqc4HSaMpGkMmJEBb3VoEBQUHipxcdu18F6tgxKSJ9KXyapVR5M0BRsLvXIsjHjXvfiVB0KFA/ISCy56TXC4X0FV+D6DdXP8idtZY0scVq1UGB2cNxQjJVUjopJ9KiEaffXi6oI4ze2OgXM4FWb5RgPX0qWQtwFOMOoZOL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPlQtxl2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122CAC4CEF1;
	Wed,  7 Jan 2026 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767819715;
	bh=NFgk+KNjY0hyxx/Lcuyi3jaYoo9P9bFN6MB0H5vauXM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vPlQtxl2gjGyNVlBSIng3eDSMTIOvavG8UKvtVi+eS2IRvtZ5CJRE7MDcLTkBV4Ig
	 5vJDHRzvZH0jcJ2jNX5+BbPkYuwg6kNwDBZbUI5ToM54N/FuABDk2oCkJ5+HXJK30h
	 bVlMgV7AmzlQ8nGr519fShJCADrY5M9WLdiILWxp+2nJN7A+k1ITogXIGjPqt9Pgsi
	 lANNM3T6Y62db26bBr0pU5XEnQmJVtu63Qzoeb2lT6O1TnydAyAcMIYFGKa9R22+zI
	 UvEvlt7WJ19M88rYSJumWFKbr8QpgqTX471wmoCW859Zc8grRK5MmolMwLJ/BHEDx1
	 LEVaECWHVWgoA==
Date: Wed, 7 Jan 2026 22:01:52 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Arnoud Willemsen <mail@lynthium.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Elecom: Add support for ELECOM M-XT3DRBK (018C)
In-Reply-To: <20251207024318.14666-2-mail@lynthium.com>
Message-ID: <9s9q8382-97q3-989p-4924-s46r23p5q3pr@xreary.bet>
References: <20251207024318.14666-2-mail@lynthium.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 7 Dec 2025, Arnoud Willemsen wrote:

> Wireless/new version of the Elecom trackball mouse M-XT3DRBK has a
> product id that differs from the existing M-XT3DRBK.
> The report descriptor format also seems to have changed and matches
> other (newer?) models instead (except for six buttons instead of eight).
> This patch follows the same format as the patch for the M-XT3URBK (018F)
> by Naoki Ueki (Nov 3rd 2025) to enable the sixth mouse button.
> 
> dmesg output:
> [  292.074664] usb 1-2: new full-speed USB device number 7 using xhci_hcd
> [  292.218667] usb 1-2: New USB device found, idVendor=056e, idProduct=018c, bcdDevice= 1.00
> [  292.218676] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [  292.218679] usb 1-2: Product: ELECOM TrackBall Mouse
> [  292.218681] usb 1-2: Manufacturer: ELECOM
> 
> usbhid-dump output:
> 001:006:000:DESCRIPTOR         1765072638.050578
>  05 01 09 02 A1 01 09 01 A1 00 85 01 05 09 19 01
>  29 05 15 00 25 01 95 08 75 01 81 02 95 01 75 00
>  81 01 05 01 09 30 09 31 16 00 80 26 FF 7F 75 10
>  95 02 81 06 C0 A1 00 05 01 09 38 15 81 25 7F 75
>  08 95 01 81 06 C0 A1 00 05 0C 0A 38 02 95 01 75
>  08 15 81 25 7F 81 06 C0 C0 06 01 FF 09 00 A1 01
>  85 02 09 00 15 00 26 FF 00 75 08 95 07 81 02 C0
>  05 0C 09 01 A1 01 85 05 15 00 26 3C 02 19 00 2A
>  3C 02 75 10 95 01 81 00 C0 05 01 09 80 A1 01 85
>  03 19 81 29 83 15 00 25 01 95 03 75 01 81 02 95
>  01 75 05 81 01 C0 06 BC FF 09 88 A1 01 85 04 95
>  01 75 08 15 00 26 FF 00 19 00 2A FF 00 81 00 C0
>  06 02 FF 09 02 A1 01 85 06 09 02 15 00 26 FF 00
>  75 08 95 07 B1 02 C0
> 
> Signed-off-by: Arnoud Willemsen <mail@lynthium.com>

Applied to hid.git#for-6.19/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


