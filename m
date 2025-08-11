Return-Path: <linux-input+bounces-13905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB3DB20849
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 14:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCFB542670A
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 12:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2671F2D3229;
	Mon, 11 Aug 2025 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAEwfeDy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248141C62
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754913662; cv=none; b=HI3a/Ya6RC11D/LzPd4dYNJX1X1Pyr36sdT6tYGwjRLH3pmCbqBfY9ige543Bq6MWGZ48JKELzx3Oi2U7wzGV3k4YDM/j8H9r+pe3xHSKauqGVezdYwylHrN8WEqvPV3+fXcoU35s3IbVhmMKydwtdqVHaZj1TDI7FI9MxE4d2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754913662; c=relaxed/simple;
	bh=88dzZzqEtKbbPbVxGM5RDOh0at5b5FE20LfFybVZI9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cHZdntGBFu+s773XxuMLz2dMsjZ8FsPF9ep9/Qw1MOgMQi1+d8pZggky8w92g0NJK1sdJznzmZeCizkOxEVuBRtlp4A1otu/GSCF5C9nh+BZIaAab2YtKB2TTWWu06YHEfBW0iLGKG1EOLVb81jmsSPQRk70y8Itu9lfrAoXPq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAEwfeDy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD95C4CEED;
	Mon, 11 Aug 2025 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754913661;
	bh=88dzZzqEtKbbPbVxGM5RDOh0at5b5FE20LfFybVZI9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hAEwfeDyXp/Du2FhOosLjCVerLn5qHO/04P69C6JDjUTNC1LfDGDAn1h4JAWXu3hc
	 B/ONXrf/W8enUWAhsbAfsJkBSHup2vdblgHKVXkoIsogI0bjhXxUCuhz7JG0Jptc35
	 +HUaS2M+WCT0dO5ckRsvitwzqNiUem4rYINB7jy5T3hkPYEiEfP1Yt2eNIxilE0cZL
	 QQRxr2MwAjULMas/R7yXU79EfLvwtkTMWQIa0im9qIuT0/YfLnX2ZkD2fWNT+OXA/O
	 upPhKkjS4TLwmupKRs1LiFsvHfXOg1dS4rxdpSC7OfSwS3TMb7d6FteXbanHRzgi/I
	 nHknd9vYPRctw==
Date: Mon, 11 Aug 2025 14:00:58 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 4/6] HID: Map more automobile simulation inputs
In-Reply-To: <20250808043017.1953101-5-vi@endrift.com>
Message-ID: <sp9n10pn-0o05-8qo6-32sp-qo23n564547r@xreary.bet>
References: <20250808043017.1953101-1-vi@endrift.com> <20250808043017.1953101-5-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Aug 2025, Vicki Pfau wrote:

> The HID usage tables section 5.3 specify clutch and shifter values that had
> previously been ignored. As the ABS_CLUTCH and ABS_SHIFTER bits now exist,
> we should use them appropriately.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

FWIW

	Acked-by: Jiri Kosina <jkosina@suse.com>

so that it could be merged together with the rest of the series.

-- 
Jiri Kosina
SUSE Labs


