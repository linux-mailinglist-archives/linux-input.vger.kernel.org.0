Return-Path: <linux-input+bounces-15470-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA6BBD8994
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822293A02EA
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB4827FD62;
	Tue, 14 Oct 2025 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf+uCwh6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D96222587
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435728; cv=none; b=afD9xCPvx6weFKksTvU0Cgh28sNq1WTLLbQjxovNG63ujLJZrFToXapJCo8Pl9NDxhu4EpB2NTxQi3kyI6AoISEjqBuH4CoY7F2ytkNQqVBVeHzZH+0rd/9JXd9u2RXPbgFAyvT9GkFuJfO9b16Os+EwJZ8GVGP2IWp4BLe4Nwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435728; c=relaxed/simple;
	bh=rpyRMEZGrtLlBOEkPjhcbex6ZTLlHPz2zj3SJIY+hek=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OkiXWqT4hVgYAonElMXehxEKvByU6qbOF6JWeaycTCANJbdz44gH7wcBxXoVkIk+kKfyEVqjUO51d20VxY4BDTvwW/BBBTzFD063a4d9pw/yW5iiO3K2PPMx2BmqkWZFnhrmLSNc4wq5DaCstwPtfQ03Kb6MaUmE1pO4lNWNT2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qf+uCwh6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46924C4CEE7;
	Tue, 14 Oct 2025 09:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435727;
	bh=rpyRMEZGrtLlBOEkPjhcbex6ZTLlHPz2zj3SJIY+hek=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qf+uCwh6CP+8pThwqDkKJWm1l5szTcCr2I4YnkY74+H/QGu6JfNzPltIqRw4Rqi0X
	 bELVhE1002BKYDfre4/vDFHT8XBse2UsDmqxthREvaZWEGqCgYGvSLbvNn8Q7FYE4J
	 6Kw6dwGRA5I4j2B+rfcKgg2K/40YbyxtW4GS218DmH+x+ViWkFd2F6ov6NoXaXP/XW
	 WoLVQbqgtP4HiaJZcbB6UhkAu7XyujDP0BqNqFCxH/sitkHGP/8257Fb6xNoWl89dG
	 YbaUJHaWsuQov+5pN4bNodiu1cwKglIpSMq6nED4LAFeC1l53Sve2z3nEzzKZW5mqW
	 ifutb7bxwudQw==
Date: Tue, 14 Oct 2025 11:55:25 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
cc: stuart.a.hayhurst@gmail.com, linux-input@vger.kernel.org, 
    bentiss@kernel.org, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH] HID: logitech-hidpp: Do not assume FAP in
 hidpp_send_message_sync()
In-Reply-To: <20251002193025.2066319-1-mavchatz@protonmail.com>
Message-ID: <5q70718r-r5rr-7p53-3567-977332039p99@xreary.bet>
References: <20251002193025.2066319-1-mavchatz@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Oct 2025, Mavroudis Chatzilazaridis wrote:

> Currently, hidpp_send_message_sync() retries sending the message when the
> device returns a busy error code, specifically HIDPP20_ERROR_BUSY, which
> has a different meaning under RAP. This ends up being a problem because
> this function is used for both FAP and RAP messages.
> 
> This issue is not noticeable on older receivers with unreachable devices
> since they return HIDPP_ERROR_RESOURCE_ERROR (0x09), which is not equal to
> HIDPP20_ERROR_BUSY (0x08).
> 
> However, newer receivers return HIDPP_ERROR_UNKNOWN_DEVICE (0x08) which
> happens to equal to HIDPP20_ERROR_BUSY, causing unnecessary retries when
> the device is not actually busy.
> 
> This is resolved by checking if the error response is FAP or RAP and
> picking the respective ERROR_BUSY code.
> 
> Fixes: 60165ab774cb ("HID: logitech-hidpp: rework one more time the retries attempts")
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


