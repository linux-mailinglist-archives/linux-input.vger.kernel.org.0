Return-Path: <linux-input+bounces-16930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929DD0D3CD
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D685A30194D3
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F221F4C8E;
	Sat, 10 Jan 2026 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoGbRb5R"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665F2AEE1;
	Sat, 10 Jan 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768036327; cv=none; b=Uatu17lBa869gJptuytZr20Vako7hnHPc9jSz2fKGKVAz04efGMfqNWYzq2hl33EILTAxlc6fpmbdoj7vH6Lu8CRNtIrUm7WdLDN5pnFhW8Ux83GV9oQek2CKnT6cUhKGYMzM4vJtRxjCmjIqGBNntq4GU3NO4qAhOG1gHHqKjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768036327; c=relaxed/simple;
	bh=kJpghE33XVw6HFpqV36d90aFqFJx6PjIT5TwkfgZkmo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fwPRKmrl7xCLuzfcKtXzagvn7E46jhzhXyh/XagrD5RTXCYyiMPr/Ok0JDi9dVvRLvNWRoxJRGR1TIbvt+G5cRhQhb1xQzdPb/Gvxsnoi68+72jP3/3+0qC1Lx9PGcVX5rlm+/Ws802MLVnoeZlH3IZMZQXjfTf3MeBSijNmhGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoGbRb5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E15C4CEF1;
	Sat, 10 Jan 2026 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768036326;
	bh=kJpghE33XVw6HFpqV36d90aFqFJx6PjIT5TwkfgZkmo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HoGbRb5RHlWtQjLkluyrJw+TLSz6bCIIol3jOlYuaUbnnT4nlAAlnd3M8lEbHyhPP
	 3xmSv1wIm0XdeD3l5Ju1X6WUHDMpf6jnq70zH2aHqFN+NvDgZ6BnPJ6jDG2uOemTA2
	 IEHsI4Rx7oLXs6iMWlR1+QdNz5c1IwoNGBBDEMg9KonHwYWidmM4j1NDp0hEu8djLb
	 vBdF1bNtJcD6BxMlV7XgsUTY9iusH0nnFvPL3TpcTBwa20XPnm/J68n3IUEHs29tu4
	 cHPU//HuUO4+W2V15cyb1+INcyM+fY7WMPanWc0GtvS7HZd8yYEySNi6g6uA/Z0ON/
	 lq3UKSRUNw0yg==
Date: Sat, 10 Jan 2026 10:12:04 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: PrakarshPanwar <prakarshpanwar@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: EVision: input mapping fix for K552 keyboard
In-Reply-To: <20251205-evision-k552-mapping-fix-v1-1-848d086c43ee@gmail.com>
Message-ID: <n741p55o-rr42-75nr-2395-975o3qs2qo74@xreary.bet>
References: <20251205-evision-k552-mapping-fix-v1-1-848d086c43ee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Dec 2025, PrakarshPanwar via B4 Relay wrote:

> From: PrakarshPanwar <prakarshpanwar@gmail.com>
> 
> Added fix for Media Key in Redragon K552 keyboard
> In Windows, this keyboard F1 Key opens Media Player,
> but in Linux it opens System Settings.
> 
> This commit is a fix for that bug it remaps K552 F1 key
> which outputs KEY_CONFIG(171) now outputs KEY_MEDIA(226)
> 
> It also restructures the input mapping code in hid-evision

Given the fact that actuall keycode *IS* being emitted to userspace (just 
a wrong one), can't we do just with remapping the key in userpace using 
systemd-hwdb?

Thanks,

-- 
Jiri Kosina
SUSE Labs


