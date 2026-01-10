Return-Path: <linux-input+bounces-16931-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DD2D0D3D4
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E27F6301459D
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388521A5BB4;
	Sat, 10 Jan 2026 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi5ClXnI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A7950097C
	for <linux-input@vger.kernel.org>; Sat, 10 Jan 2026 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768036693; cv=none; b=pQq4y7+NkXi+2AvDp3U3Tj/lGNg6bKIMlSp3JXN/Zt3CdaYMZaozqEkDI21nfNQOjfsEy2AZDbyc7kcQPm11YSHD0u8WfroKctXXAegeD2UMrt5OE19axcM8lWSQGDIxPxTJLyRiQEFtjIqVYe7LczVXc3CoyjUBzHEqdRqyXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768036693; c=relaxed/simple;
	bh=CbjcXOREpsTwUdaoTPObowN2w5tgWwep8CBSQ0DmjpQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WbiK5nsQmjCVhI8Wa61Y2f5tQDKY8J2oULYbq5UeCfOvkAqNFb+74Yo6uBFqZaIZpktDhrh/XyzTRSnN6t3oVpxv/xNqm6xx0TL+5+kGREAkBcYITjODw4ocJiZQebXfyAmSEOgJ+JUKx7jjLIjeGbPCR3PZl3UuU6Qtiq3pSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qi5ClXnI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2D0C4CEF1;
	Sat, 10 Jan 2026 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768036691;
	bh=CbjcXOREpsTwUdaoTPObowN2w5tgWwep8CBSQ0DmjpQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qi5ClXnIF9ql9fcjF24/sCO7WciCCA7a1szcj4eLL+37F/9X2ejJv29RUpA9k0bcY
	 xXuiblxDyoxcoBydaniipj4FjwFSpsjsZ0XMabub7StkVQhW0iWvW7cj0xWDxk+oWi
	 FkxOupZ3dmA5Ik9ojZYzaS2WspZ0HLuGbPct+FAgKPGUpYUV4Cy/+mXP4PaKITqpXp
	 Tmg0VWRcK/UsFCbx/EvmqWOnvqTiGdJhD6FlNEgKcG/vUDLffRZPm3+GU19Q5M/0xD
	 Q1A9+nwUTZoe7AIfK2BmmAB8ylioPq0360vxyS+pkA5dF/dGfzcagIKXsx41gsBx7b
	 WAU6nj9+Ibb6Q==
Date: Sat, 10 Jan 2026 10:18:09 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Connor Belli <connorbelli2003@gmail.com>
cc: linux-input@vger.kernel.org, bentiss@kernel.org
Subject: Re: [PATCH] HID: hid-asus: Implement fn lock for Asus ProArt P16
In-Reply-To: <20251209000008.4479-1-connorbelli2003@gmail.com>
Message-ID: <n2708q50-9322-r7rr-5sq9-pnq3n5ossq37@xreary.bet>
References: <20251209000008.4479-1-connorbelli2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Dec 2025, Connor Belli wrote:

> This patch implements support for the fn lock key on the 2025 Asus
> ProArt P16. The implementation for this is based on how fn lock is
> implemented in the hid-lenovo driver.

Applied, thanks ...

> Unfortunately, I am not too experienced with driver development, so I'm 
> not sure adding the handler directly in asus_event is the best solution 
> for this.

... but I've removed this from the changelog, as (a) I believe there is no 
problem with that approach (b) it doesn't belong to the changelog :)

Thanks,

-- 
Jiri Kosina
SUSE Labs


