Return-Path: <linux-input+bounces-3510-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F4D8BD6B9
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B85442835C0
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AC915B553;
	Mon,  6 May 2024 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkEVFJMv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C767EBB;
	Mon,  6 May 2024 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030094; cv=none; b=GQUaDrnQo+dcu+2EfWTYtWRCZZn6lYDWGYen//vwX4e1dZCEG01bHK6t9GVErG9CJ7kSc5HoIWrQNiwUN1Mn+6hmLwUIq+yu1QO1afgjIjwwWsThB4RzG2QcjEtyPb9ZodZLwUgBBjUt3FWwa66Yj+xO4ZP/YI1LAPBfNYNckXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030094; c=relaxed/simple;
	bh=DL57WJ3pgMltw3b3vtF6CqcoODcClGWM1tPYWrB6ufs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JMIhny23eIJZ+fmqW9EtdXmhAzcpVtTIl8C/0iBRmmvOXl5KYVhexOMBiZcDAr0cAA5sSeeJKB3WEzA4lPoZdxke9I+sS8MWPr0Uq/WBeYPjKyHfWxjGQpeFKpPa40aMi8intwsT22iG8rw3u3kWceL6zLzagKHdA3jHUCejOFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkEVFJMv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A040C116B1;
	Mon,  6 May 2024 21:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715030093;
	bh=DL57WJ3pgMltw3b3vtF6CqcoODcClGWM1tPYWrB6ufs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fkEVFJMvvfBE4FLaDKgmhIZdFRqcm0MINC4dfL779WW6YQUA5CAwBEHcgjpv0nc5S
	 qmrs4aA9QqlXwf1dpdrzNWbnMonzkWXqJkqk1cnTlviHTDHCdWLvWmPybEIc/HI3rK
	 T7DTWsksngI1p1oJhoHm41PKL5UdsVsAh0e7aCewf2T1jxLx8hiPpS0k+YwsxcNVuY
	 O4qPtvC6AkyCpkJlr4j3JntuOny9A7pooH2BPMEKZSRhXULK6g55Sd43+gkmOsg42w
	 qypX39T0j2ePhKk6N8T1Tpqlf3pPdPf9kZtomuYYAYLhSAQcgKUkq769m5bfIsGREm
	 g3fOVQi9ID8cQ==
Date: Mon, 6 May 2024 23:14:50 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Sean O'Brien <seobrien@chromium.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Add quirk for Logitech Casa touchpad
In-Reply-To: <20240429180804.1.Ie7e8d0ba595f9e39f71cbe4ab3468f79c00b4581@changeid>
Message-ID: <nycvar.YFH.7.76.2405062314420.16865@cbobk.fhfr.pm>
References: <20240429180804.1.Ie7e8d0ba595f9e39f71cbe4ab3468f79c00b4581@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Sean O'Brien wrote:

> This device sometimes doesn't send touch release signals when moving
> from >=4 fingers to <4 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
> of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.
> 
> MT_QUIRK_FORCE_MULTI_INPUT is not necessary for this device, but does no
> harm.
> 
> Signed-off-by: Sean O'Brien <seobrien@chromium.org>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


