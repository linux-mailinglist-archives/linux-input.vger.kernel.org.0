Return-Path: <linux-input+bounces-11223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6BBA70171
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 14:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2738456BE
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 13:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AAD2641F0;
	Tue, 25 Mar 2025 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAajHxx8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8719E83E;
	Tue, 25 Mar 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742907165; cv=none; b=auo3oJrTSrsegcWxksY6zuuxgNA7SiL7RNwk0kJkLX8FS823yIq8Su0oG1cbft+FiiFMhK63++nx+9uHNN6vq4aF3wKnF3w+9POv3joqecZHZOYHUivy5aIE7k7ZAf6nf1QRmm657DyUfSkOHJ9i1IxBa9wjkVbp6OgL6abXvbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742907165; c=relaxed/simple;
	bh=lfa/8ta4vYPO/+JeucS0YpPl8uLr+Mk0WRA+iVH7hUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HtaLGQembPxg1Yr5WZLCESPVyvkGWqU4zWPBXgaroXhds9eXNXi/hg+DK0r5QfdrGMKD7b0HZDfCvhHuqVNJVVbQZq/U7IUYnTTob/RES77HBoxexHbhwAv0R3TlVdk9YFkOMeajXAJEdMtGWIFEcCuuAwKo/n2PVYjcazcweTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAajHxx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE642C4CEE4;
	Tue, 25 Mar 2025 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742907165;
	bh=lfa/8ta4vYPO/+JeucS0YpPl8uLr+Mk0WRA+iVH7hUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nAajHxx8XWm+QvC5X6u+BaKdw7/t6NBuVoB1Diqqau7NGm8MeWXevmFahioXrGcm3
	 mrYlBE8Yv/tSoWFC0LC6Cqbn3JOYHJy/GIyq7vIU52ojzDxSPIj6wcvrh6H4FuIbz+
	 F0F3y+GiBzthZ4mIzTY4HJCAWYuP5r0AQinzrbFDquwetB13wsTtxbt27PDZtwNCpU
	 UVbXJIyT1n8fGsi1Db/0F17tHg3YlDWSOnUluN33QtmNCbmjYOEbQoODZQ2OovTRGR
	 E9lO3JTjS/ToSivdOMBTXelL9iwMpF/YxfiBRrsSsbjwLMh8kuEuHQSVXUadJfC+UC
	 cQvaPTR2/NTVQ==
Date: Tue, 25 Mar 2025 13:52:42 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc: "bentiss@kernel.org" <bentiss@kernel.org>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Aun-Ali Zaidi <admin@kodeit.net>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND 0/5] HID: multitouch: Add support for Touch Bars
 on x86 MacBook Pros
In-Reply-To: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
Message-ID: <67829qr8-op53-7q0s-n858-9psq5sqopo45@xreary.bet>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Mar 2025, Aditya Garg wrote:

> Hi all!
> 
> This patch series aims to improve the Touch Bar support for x86 Macs.
> 
> Recently, the hid-appletb-kbd and hid-appletb-bl drivers were upstreamed
> into the Linux kernel [1]. They enabled the Touch Bar to display a
> predefined set of media and function keys, exactly the same it does on
> Windows Bootcamp.
> 
> Now we are about to get support added for the DRM mode of the Touch Bar
> as well [2].
> 
> The DRM mode enables the Touch Bar to act as a second display,
> just like macOS. So now you can add a widget, put a clock or anything
> else on the Touch Bar as long as you can develop a daemon.
> 
> Now via these patches, in the DRM mode, we can use the Touch Bar as a
> touch screen. The Touch Bar seems to be not compliant with the HID spec,
> thus via these patches several tweaks have been done under the cover of
> a single quirk, MT_QUIRK_APPLE_TOUCHBAR.
> 
> For the case of T2 Macs, apple-bce [3], the driver for the T2 Security
> Chip is also needed for all the peripherals, including the Touch Bar
> to work. It is still WIP, and will be subsequently sent later to the
> appropriate tree. Till then, I'll suggest for get the driver from [3],
> or more preferably, get Linux support from https://t2linux.org/.

Benjamin, could you please Ack this series?

Thanks,

-- 
Jiri Kosina
SUSE Labs


