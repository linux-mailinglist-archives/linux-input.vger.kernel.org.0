Return-Path: <linux-input+bounces-10535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB8AA4EE9A
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724833A9B96
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B221215F7D;
	Tue,  4 Mar 2025 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtCgS7lw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F9F1FECB4;
	Tue,  4 Mar 2025 20:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121005; cv=none; b=fTelnAEYmzvlohpqzVZ47BwSYmJFg7NYh4jjq0/NuMWEum+ISHJbZii4AXlggcTqJe7TUgri0gZcoukLqp/OiLIbFMVC6fEP6xyEsm9LTFqG3o6bdiU2fi9Vd9Z8QVBgjEmvD4PTN0IJCOxPmxLBs0zGxnfsxWWZzojZmEdSqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121005; c=relaxed/simple;
	bh=8DIvWFvqlQVCU/zQtOV3Zt/hbEL7NTNFD1TrAd7eF5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qMfbCSJJVf1z7q3MSfM/ccd53cHnaIH7AZ9XW0wpS4v4dtGf5fJQxDeZRuc7YF9a/PSOWG+re9Gyh1rsYFTNBMVmCljXHKKYFuqR9L2x6v4P47aJc5hOiF7FUfNneUW/smn9nU8txS/2AJWYTh55K3A8FO8nenaYdjhc5TDX2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtCgS7lw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174C7C4CEE5;
	Tue,  4 Mar 2025 20:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741121004;
	bh=8DIvWFvqlQVCU/zQtOV3Zt/hbEL7NTNFD1TrAd7eF5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PtCgS7lwcNLAwe7LQjXBVq/Up23ka2Cwzfx+jBlNJg90+LI/qMnq8Z+xsUCe2LZbE
	 Mhd85qgUxdRD22CBnr63O4GEQJQkqbakwqRKvXFZAmVL/BORNk3SUGmCrhAAkqTJKJ
	 uWVPzo5qu0nDa2mzT5qLvWwSjHgnmqHpHVptY6IoXuiL4wJWRjBKtAN82hVXC4aolL
	 iCbz5KV32rgw4wLuvirc38mNeQOrXEBB/1RW83XATcqt1NPub6y0DYmD8GyA/FYdJX
	 AGHcNNNL80BZbjvlF0eodSI0M9SzO7vWFjcTPfMNTBBcr2UaCpT5LVzjGwhoEQd2JV
	 EocT+1Qpx9n9g==
Date: Tue, 4 Mar 2025 21:43:21 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, anssi.hannula@gmail.com, oleg@makarenk.ooo, 
    linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/5] hid-pidff fixes and PID compliance improvement
In-Reply-To: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <p9qr7p76-3o7r-225p-8rrp-o4p6238r0n1o@xreary.bet>
References: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 25 Feb 2025, Tomasz Paku=C5=82a wrote:

> Based on top of current hid.git#for-6.15/pidff
>=20
> Another batch of updated to the generic USB PID driver. Apart from
> realigning two function names with the rest of the driver, clamping
> LOOP_COUNT value to the logical max to fix some errors.
>=20
> Infinite values were previously hardcoded to 0xffff but the standard
> actually calls for the max possible value for the presented field size.
> If the duration is not 16 bit, but 32 bit 0xffff won't work as infinite.
>=20
> Setting infinite value works now by computing this value from report
> size. We still need to look out for 0xffff as that's the max possible
> value we can get from the ff API. 0 was never actually defined in the
> Linux kernel as explicitly INFINITE but it seems like it has become a
> de-facto standard.
>=20
> After pidff, I'll (at least try) working on extending and updating
> the ff API as it lacks some features and could be considered incomplete.
> The biggest issue is that there's currently no way of obtaining effect
> status or sending device control commands.
>=20
> ---
> Changes in v2:
> - Fix the direction name in the fixed direction comment
> - Fix set_device_control() and implelemt missing device control commands
>=20
> Tomasz Paku=C5=82a (5):
>   HID: pidff: Rename two functions to align them with naming convention
>   HID: pidff: Clamp effect playback LOOP_COUNT value
>   HID: pidff: Compute INFINITE value instead of using hardcoded 0xffff
>   HID: pidff: Fix 90 degrees direction name North -> East
>   HID: pidff: Fix set_device_control()

This is now queued on top of hid.git#for-6.15/pidff. Thanks,

--=20
Jiri Kosina
SUSE Labs


