Return-Path: <linux-input+bounces-3512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A608BD6C0
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50B972835C0
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE409158D7B;
	Mon,  6 May 2024 21:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwIsxMYG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE115B57B
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 21:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030242; cv=none; b=Fhr5DgwvXsB61WJHBUHCiIC6Z4rnEFPI1oxOso8X+uoTET7KnSQOJphc4lo+MqvTHaeu1bpJOku9aVdfKTZ4L5s73k3uS9UY10VNmM33zO+geCiHbJUlLOvxu+SzbU5JEkHs9EbBCh34FIdv2FgEjypPM7RLf60jeBJ4U3XKPVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030242; c=relaxed/simple;
	bh=iO8RhOMqoNFk79HklPWrvpmlvbofvBwqwkzgJ+2B1So=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iHZRVUm8eQJ7Ke+kzQ1sEYUHwZEEQkmwHoWA+Akh2UNzjMoE8tivykt1DM+wwUJ6bUlccWJdclARKNKyZs9wALtfqKpUGXkvE5kstAjZWyuwsgyuDs5sUf44AYEiqrp0bAYNprLyD/bKh0hajgURdGRK81gDA6dhtBaLTF0kPRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwIsxMYG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A4AC116B1;
	Mon,  6 May 2024 21:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715030242;
	bh=iO8RhOMqoNFk79HklPWrvpmlvbofvBwqwkzgJ+2B1So=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BwIsxMYGv8BN1BrTA8Uxam+uPC7leR2MeZsxcnIAq5de7Dnie3yfLNyYVb02XD2YV
	 kauLPkmXZhWz1j5W6EjanPAAh34+PaQzCg/R2KorxZeFD6YVpq8SpguEpFJu90R7fp
	 lNfhJSOjs1i0IcIfvysX5cwnF3/UiyiQASXnUMgI2/sCPUjSCEZqGu9dtE6f6mJ9mS
	 jggiiPHYZ6W2UooQfn80gsP+FXjguBeOX2sSa/aDQCpw/f2Q8CHLoW70I6VhS9QSrv
	 ieA+Elw3XIMkfcV3/cpAl6r73rQFz/7pWmmYd3shgkbaFbUPnPWQwg9hLyE+35vveY
	 9qpsjps+cHgXA==
Date: Mon, 6 May 2024 23:17:19 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Kuehne <thomas.kuehne@gmx.li>
cc: bentiss@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: hid-debug: fix Moir -> Moire typo
In-Reply-To: <Zhp4o/lIvW3bJ2kF@black>
Message-ID: <nycvar.YFH.7.76.2405062317090.16865@cbobk.fhfr.pm>
References: <Zhp4o/lIvW3bJ2kF@black>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 Apr 2024, Thomas Kuehne wrote:

> This adds the letter "e" to fix hid_usage_table' HorizontalMoir and
> VerticalMoir entries.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


