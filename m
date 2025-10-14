Return-Path: <linux-input+bounces-15475-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4C3BD8D41
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 12:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2065A351EAD
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 10:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009A32FCBF1;
	Tue, 14 Oct 2025 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRiKzKI7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC82FC026;
	Tue, 14 Oct 2025 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439403; cv=none; b=AQvZv6JxjlNz782Xpl6gRTzCET6vlIHSSsRiiLcqyQvMePMwBPlLxHaDbdSAoa/zcB3hUbYxVrfTHRDD8tDM7wuGkE2lSlbZP54YDcwKrgEqQprQE99Dd2NdAug/dMiuR+SJ/3htVpHCYFHxxrPO3MWbMoo6TNT3TMcctszfirs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439403; c=relaxed/simple;
	bh=x9g/FCCnC/T1Rqvh2vYAsNK7KgXry/MEYimKfHzjtXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ujv6ovvuQeMzUKardhJTjCUuN/3cWQYfRcfPlPQUJ39m3236yln44RQ66Q76MGbz/dpsVbW0MWCDq6buEDACk5GfQK6fnMmyKsQH7HiPuOy81/DoacLIGu/nruMuYI1fnqu65hkEGBxcuUlE0lsPjkRHgu6jUOSEYgInfsRYL5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRiKzKI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5C3C4CEE7;
	Tue, 14 Oct 2025 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760439403;
	bh=x9g/FCCnC/T1Rqvh2vYAsNK7KgXry/MEYimKfHzjtXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jRiKzKI76NqtZThhovN/scNLRdhtpBhlNgWZgUiClALiYjKQed+NbkjfhwFUKifl0
	 yucMPGBMvx5gJwBNuKp+jhgAukFXRPHUyKzsg9mrXsCydlPLcoiMAY8jB/fei/B4n3
	 fMcOWYPQ0EAKClZMEBw6laigQ3notoG8daA/7vCEhy2efpMgeKGYPANFcoSZ6Vrnhe
	 qEKrO41+XkuE2YseSUMxshPH3l09elGuKGV6ZmfvF7tZHZtHT4+asOg0MEEkJl4G6x
	 dYzjTfIVU0aGQS/RKcTpQBYPejbFMWYSvx7wP4x4ZoZzLtI+zf96o6Yd/T9mv7k4BF
	 wqgurwtrpQTiQ==
Date: Tue, 14 Oct 2025 12:56:40 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] HID: hid-debug: Fix spelling mistake "Rechargable"
 -> "Rechargeable"
In-Reply-To: <20250928210118.242631-1-colin.i.king@gmail.com>
Message-ID: <q7n0746o-2psn-61o4-p1pr-3ns988n4r564@xreary.bet>
References: <20250928210118.242631-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 28 Sep 2025, Colin Ian King wrote:

> There is a spelling mistake in HID description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


