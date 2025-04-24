Return-Path: <linux-input+bounces-11954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B98A9A7A0
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFFA01B8248E
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5127215173;
	Thu, 24 Apr 2025 09:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ea35RHUT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF2215160;
	Thu, 24 Apr 2025 09:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486646; cv=none; b=MYfkK0r25GWySQByW4uJAtBCv2KYGnGUdBC/Af9Lv7T8HoawhXMlgH8Hy93rXKcn1Q2RIO5RTSwZRGf/gXqsW63tButR9lX6C56PQgmMkCo3LC1zhJA541VqpPbHzppF64/ABsGrN5mRCQE+MEIOGQBAR9nu5rMylJFUwWt8fOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486646; c=relaxed/simple;
	bh=7Y+eASNpiqFkr49pRKO3BzO8QH26d7PJVbyrQ8uzyZs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D3XHz4o+Bhys//X5mKlW9p0q6Kl/g4HMauZ2Pyf1vgOu9fhuOY9DFADg9X4ZgkEy1yuO/2+mvSrxyvzyisO0l9FoyAWN8XYnZ3+xllUVWzujl8xV80kcQjlblE5kFKGVyc8LxtIXI5GCUc9ISrxWg9f6W4gEwEg2EoucKdSpkuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ea35RHUT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE34EC4CEEA;
	Thu, 24 Apr 2025 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745486646;
	bh=7Y+eASNpiqFkr49pRKO3BzO8QH26d7PJVbyrQ8uzyZs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ea35RHUTX0pg86MecjFnn4A0mOleORo0yTCFXuUaf7QhDAmtLcePi+5ED07YWSL7m
	 imHAPnsQ7XG7weI0lgLV0RfKUuKyUwtmUnSfH3wSC8aVIDgqgOxUxRK0D2LwXPPl2w
	 yDYSHHBTkQ7GIW2x6DK37cIFJ2EqNe6nxUb2GbjAJ56AsXQJWWENKfCWGIyW5gUT16
	 KKPF9JmIJjOBSttzNK7zlM0tiDAddafQzO+b5nqPS2QdgjKOMRZBaEF4Tx+Gz5rSlb
	 FmXS2OJFIfrsQbbSLlapm70SCcOxOEXxRDmirqzpALAkVZGeqt3jwXw9uO3iaar4+l
	 BSsjRnb52d3JQ==
Date: Thu, 24 Apr 2025 11:24:03 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Lode Willems <me@lodewillems.com>
cc: linux-input@vger.kernel.org, bentiss@kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Kysona: Add periodic online check
In-Reply-To: <20250303123118.31627-1-me@lodewillems.com>
Message-ID: <4610npp2-3rs9-4sqp-250n-n20r5pp044p7@xreary.bet>
References: <20250303123118.31627-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Mar 2025, Lode Willems wrote:

> This patch adds a periodic online check at the same interval the battery
> status gets requested.
> With this change the driver can detect when the mouse is turned off while
> the dongle is still plugged in.
> 
> Tested with a Kysona M600 V-HUB Special Edition.
> 
> Signed-off-by: Lode Willems <me@lodewillems.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


