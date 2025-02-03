Return-Path: <linux-input+bounces-9736-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D865A26618
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 22:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4C1F1649B9
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 21:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F3E1FF614;
	Mon,  3 Feb 2025 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLPU5o9u"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90878F54;
	Mon,  3 Feb 2025 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619509; cv=none; b=EFsi0qH0CJr3uDVRP2FEoWGm3KaorYYC96XX9GsKaYPjEUeB0UsNkPd+z07wnc2Ba3HcQ98bijwx4Gcd1L2l/Su0HRersSkw3GyhQFwhmV2rkcxGo5l/+RF6Stcim9x7+YDFYvCpjOn2CZWSUXlDvxpUpJy6QhOYJ7sY6pqbUQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619509; c=relaxed/simple;
	bh=ONkJZrHrFBNuUcQv4eyEKDaVDxCriWhOsqaF4GbL/ak=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tjLhOY4pCWVIr9x1Vvxa7SleQvcm/RfvljnseAt/UDd5CMIH0yGSL8c9Pcqy9saIwag/1uHAs/b235i73e9fQ6OLTY9tUWJMPfUYKk+GAjJPDNhIG2IGrcMggYwwm/TYkQdEGCNW13MB6YPxsb4qCgB4ap3+SeZcMt9/pZciASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLPU5o9u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C98C4CED2;
	Mon,  3 Feb 2025 21:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738619508;
	bh=ONkJZrHrFBNuUcQv4eyEKDaVDxCriWhOsqaF4GbL/ak=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XLPU5o9uEcxqtXJT/dekqG3EGHvvXdoVvZ6NopnriorTk8A1QWWKz8vrzg6rnWo7a
	 D1cWyRG7Mo6tcb18iAMSyyx9fFHiqbAiIsm4RWD5xt9BSBJT9tpPI8tkBaC9PciLea
	 2sY+6LD5JBhP2PGyq3cPgMJNOfICvKYVDuhOo4fNffdS2kLf9SEEAhoYWSbthm/jIC
	 GsYsxc6wK2XsbmBB5SBfWD8z4K2EBxTDefssjfIKLuJP2a6KlTRnLTxVxN+13oJsta
	 rfWrP7/fBhgePdvA2lO3eIOcmR+SAskYHKiF5aPhbgVgYctobW1RyDAhx7IQfHE5im
	 s4BNTdghPB+kg==
Date: Mon, 3 Feb 2025 22:51:45 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: junan <junan76@163.com>
cc: bentiss@kernel.org, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Fix the bit shift number for LED_KANA.
In-Reply-To: <20241128023518.23372-1-junan76@163.com>
Message-ID: <42on38np-2q38-2nrs-or10-95531pq8qos2@xreary.bet>
References: <20241128023518.23372-1-junan76@163.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Nov 2024, junan wrote:

> Since "LED_KANA" was defined as "0x04", the shift number should be "4".

Heh, this bug has been there for _*AGES*_, and it's a pretty obscure 
driver anyway. Let's fix it though, thanks. Applied.

-- 
Jiri Kosina
SUSE Labs


