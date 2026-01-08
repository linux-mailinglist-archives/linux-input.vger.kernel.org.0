Return-Path: <linux-input+bounces-16877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC3BD03ACC
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 16:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B49EE308DE90
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379CF468BBF;
	Thu,  8 Jan 2026 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNFR5LUv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A634468BBD;
	Thu,  8 Jan 2026 11:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871470; cv=none; b=CveiQjvGaoC2eLOosEqXdBzNJ++3uc5zbCL7XQ+uktiAZtZ12yM3V7Z6TY/gzGtVaaXzf1ZTyY9ldiCoC7WCJbh+T/ZNq7V/HaERyso0sMWPxz+rIx12dvrAre7jWXj1ABeq3acWN/S7zUiVzxAP04j+7kt5dl5d/5mvoSWfXo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871470; c=relaxed/simple;
	bh=97mp8/LxaJWbgyzgbmjKqwdCOOUuXbwqABjT79aGjbc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LwRm0cxPcqwxu39CJ62GtD20OlsBwzs8OJF0/SLaxBMUjl32lAWrpYyqEiVeNE2CxKJMP4TFO/DAb5Zwft+RSmRSBFTw0RHBiRS8odOKR/hcuUQDaAHh/W0BPsmmyrVQtu9ME/rPPppO/Yn842di3B8aPOs7efiIgux9t/bzolo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNFR5LUv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AF9C116C6;
	Thu,  8 Jan 2026 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767871470;
	bh=97mp8/LxaJWbgyzgbmjKqwdCOOUuXbwqABjT79aGjbc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BNFR5LUvxX1dVPiNVH7LZhrRC/8HKL9+kfEIw9AJ6sf4tJeUkhn3RCiivqlRusBDs
	 IpVZmlJE2wwfYTsyl5AU5hy30SJFNOqJmLGks1OLzrrVZ8aIUGpFnUgSxmpd6iEtVa
	 JP95jLKPeGpfi0JHWjnE3abOLLmTrx//fixqkdtkgSVDex3UR7/PTEf+zzi+teke/X
	 EAY5c9wb/2BXS+D4v+dV245EVbedPtBN1NO7Qj+08+4LO+8ApS6t25F65ZZRJ1+/eu
	 qeczuC0diqDte+vaEkneDVNAIez+/vG0OokDiK/jBDZLzWwazZXDkD2pDoGBEOe2JF
	 vzUKLcWddA2Bg==
Date: Thu, 8 Jan 2026 12:24:27 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hid/hid-multitouch: Keep latency normal on deactivate
 for reactivation gesture
In-Reply-To: <9f690ec1-9e8b-4862-b1f2-2b68f9be9fb2@tuxedocomputers.com>
Message-ID: <354s5ns1-1o26-s279-5r1r-o28967pn8np9@xreary.bet>
References: <20251112144837.499782-1-wse@tuxedocomputers.com> <ae75b604-9bdb-430a-bd4d-8e1e669cf4d8@tuxedocomputers.com> <9f690ec1-9e8b-4862-b1f2-2b68f9be9fb2@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Dec 2025, Werner Sembach wrote:

> >> Uniwill devices have a built in gesture in the touchpad to de- and
> >> reactivate it by double taping the upper left corner. This gesture stops
> >> working when latency is set to high, so this patch keeps the latency on
> >> normal.
> Just wanna make sure this doesn't get missed for the 6.19 cycle.

According to my notes, the last thing you said on the v3 discussion with 
Benjamin was "v4 incoming", so I did put this on backburner until I see v4 
... has anything changed there?

Thanks,

-- 
Jiri Kosina
SUSE Labs


