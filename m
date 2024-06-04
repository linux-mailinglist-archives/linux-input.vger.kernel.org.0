Return-Path: <linux-input+bounces-4065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A531C8FAD62
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 10:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4BE1F225BE
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A11F1420DA;
	Tue,  4 Jun 2024 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmgUPz2V"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FF12A1C5;
	Tue,  4 Jun 2024 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717489285; cv=none; b=NP0SjPJ+P1ZNNVt8ck3YloweX/2rOMx7Hb6EcfMOhZAJXj3LvihGB2qczWAwqGai25/+2eVFG4MEirHnZryQQxMzfTjOxSyDn6bCH3hyJt3FIEIsHK0o0j4sCYUHqVX4rlYZINunl/rc2WPXVvRfBI8D6ljRp5wpSWbvDxd/lRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717489285; c=relaxed/simple;
	bh=tlI25W4DE2nYLkasA4v4U+4M++rc/Sj3aTcfd0rVEH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iRfGKrs26R+pBgI8V2dNvVWuX/6kWWEW4Iafi1kMquBdHLvjd7jJ4Dj93YWNplmSuUR2/QN3IKwWxPtGPJS25ZRP/5H5Ye7tY1tt+3fgZAbraONg3bA0GXh/d/sK/BmZ9kAnPSY4uSr1ugC/ooP/G+P5HoaNbwqr0hnYWwjtVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmgUPz2V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19521C2BBFC;
	Tue,  4 Jun 2024 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717489284;
	bh=tlI25W4DE2nYLkasA4v4U+4M++rc/Sj3aTcfd0rVEH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rmgUPz2VwGZs0qyQMr4wz+DAAMYU7BMBomeNMHxcZU3oLpQljmjL8Um06K5iXeDOX
	 q3fTwdJTfc5ou/98WRGcHTkHjTZZYfEGc4Il1dXiC0mlEr327E/wNQc5FAGuMcKWJx
	 BQxslO64zAAmdKKmd0Y+FvRSJ6QynXSyT2c3DGq5ptmCFBlG9gcHwPrq+iAP8kuR92
	 YKlpuaml0OWpCOKM8uA7R+7UUkiWM8iOqgw6wGQwjN+JsagWFVW3NioaAfU9lc0y7K
	 STFW8pILMWwfHyLYRtI3vLM5Z3yROe3YDpReE9vPckwa4spJljSD8U8DGSK0+ixjvk
	 lk+dXsWQP76gQ==
Date: Tue, 4 Jun 2024 10:21:21 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc: "Daniel J. Ogorchock" <djogorchock@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Martino Fontana <tinozzo123@gmail.com>, 
    Ryan McClelland <rymcclel@gmail.com>, linux-kernel@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: Fix an error handling path in
 nintendo_hid_probe()
In-Reply-To: <9e599978852f9a2f30f9523edfd220dd1e25aa63.1716735907.git.christophe.jaillet@wanadoo.fr>
Message-ID: <nycvar.YFH.7.76.2406041021130.16865@cbobk.fhfr.pm>
References: <9e599978852f9a2f30f9523edfd220dd1e25aa63.1716735907.git.christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 26 May 2024, Christophe JAILLET wrote:

> joycon_leds_create() has a ida_alloc() call. So if an error occurs after
> it, a corresponding ida_free() call is needed, as already done in the
> .remove function.
> 
> This is not 100% perfect, because if ida_alloc() fails, then
> 'ctlr->player_id' will forced to be U32_MAX, and an error will be logged
> when ida_free() is called.
> 
> Considering that this can't happen in real life, no special handling is
> done to handle it.
> 
> Fixes: 5307de63d71d ("HID: nintendo: use ida for LED player id")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


