Return-Path: <linux-input+bounces-7402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF899E99B
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 14:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FF33B25456
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 12:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5413B1EBA1D;
	Tue, 15 Oct 2024 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJkymGs8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2658D29B0;
	Tue, 15 Oct 2024 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994825; cv=none; b=iqdsHp/V15DH1p7P2jxHqzBWrWw0nEDlRsrjDBRYcjv9JAQaHhX0nYbePrghTkttQfJ0d8UkuGu5UYqMNKn8Ek7KBgdKiFDaPVaNBOwwCJ1B48QTNPgsbMjTPUO4820oP5xdRvcYp9VpEAL1ay84EquLCUDimESIz1IKufc5Uc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994825; c=relaxed/simple;
	bh=J3XcQcWQMfT43WX1MCPAGxpvnrd+g9EPEM5cz1VWY2U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GLjH63CTlDUWEEQEfypyx0QpmH5v9c4QFbUl7HDznnQ28E/to3RKNV4Swn8LRDES49GOmjAivFn0SNfV/MD2nX50iMOEcnEK2hzNUknV5PkWD32lDc1GM8BTAfvlg6/wmSEJrK+AZuFdHApRgAYKu4+CrzTsu3fkfEfbOcJLFVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJkymGs8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FDCC4CECF;
	Tue, 15 Oct 2024 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728994824;
	bh=J3XcQcWQMfT43WX1MCPAGxpvnrd+g9EPEM5cz1VWY2U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pJkymGs8gX00h3/gx9xw5iwYkirHwsQVe+vjc3o/Uig9u9myyipCEI6OTKU5+BSyn
	 Rhg4Zk2M+ybn14g8aR/coqZzE8uBuBSJt2jID19dSC++gUMzaL//G3EtgVqmJemKVM
	 g6HVX1SylgnW6N+oF4rnAFEIgSC2DGsXZWuQxEs8e/ehQYMC7Yh2ru85gIeCzQC0a4
	 BHV8bjQnX0k1xIkZS4yN17+9YK5F5972UZvblK6jc2QptOgx/fF9tFpGZvdkzKWS5A
	 Rpr0gLFzXEsqwxSDbPvp52Zv5JiNzzYLePdjp99dYUWOKwhmloHnXWN5nfCRTZwK7g
	 XAcKTg435TRew==
Date: Tue, 15 Oct 2024 14:20:19 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Thomas Kuehne <thomas.kuehne@gmx.li>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] HID: debug: Remove duplicates from 'keys'
In-Reply-To: <20240905184351.311858-1-andriy.shevchenko@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2410151419110.20286@cbobk.fhfr.pm>
References: <20240905184351.311858-1-andriy.shevchenko@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Sep 2024, Andy Shevchenko wrote:

> Duplicates in 'keys prevents kernel builds with clang, `make W=1` and
> CONFIG_WERROR=y, for example:
> 
> drivers/hid/hid-debug.c:3443:18: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>  3443 |         [KEY_HANGEUL] = "HanGeul",              [KEY_HANGUP_PHONE] = "HangUpPhone",
>       |                         ^~~~~~~~~
> drivers/hid/hid-debug.c:3217:18: note: previous initialization is here
>  3217 |         [KEY_HANGUEL] = "Hangeul",              [KEY_HANJA] = "Hanja",
>       |                         ^~~~~~~~~
> 
> Fix this by removing them.
> 
> The logic of removal is that, remove...
> 1) if there is a constant that uses another defined constant, OR
> 2) the one that appears later in the list.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/hid/hid-debug.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index d5abfe652fb5..618ebaa3bfc0 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -3214,7 +3214,7 @@ static const char *keys[KEY_MAX + 1] = {
>  	[KEY_VOLUMEUP] = "VolumeUp",		[KEY_POWER] = "Power",
>  	[KEY_KPEQUAL] = "KPEqual",		[KEY_KPPLUSMINUS] = "KPPlusMinus",
>  	[KEY_PAUSE] = "Pause",			[KEY_KPCOMMA] = "KPComma",
> -	[KEY_HANGUEL] = "Hangeul",		[KEY_HANJA] = "Hanja",

The problem specifically with this one is really there to fix a typo 
someone did at some point in the past. See b9ab58dd8e771d ("Input: fix 
misspelling of Hangeul key").

So I think we should preserve it somehow.

The remaining ones seem indeed to be duplicates and I don't see a problem 
removing them.

Thanks,

-- 
Jiri Kosina
SUSE Labs


