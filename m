Return-Path: <linux-input+bounces-12979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FBAAE148F
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 09:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A81D05A12E4
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 07:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8E1226188;
	Fri, 20 Jun 2025 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgLv2uEO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C332253E0;
	Fri, 20 Jun 2025 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750403380; cv=none; b=ihNK/KMCwqVBEHULArn4r2tp3FGfgnk/4C/KDVhATiwsgAmB5x125cjk6kTVpMTC3JNKYJRanE935xOHf5jSqvaOq/GGBdjGfUwIPqcBJ/METK1LovKEG7YAPaPAwecvV4PL91FuEKApq52s89oJ/FLzqjNf/p2rsEVhPhfxdDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750403380; c=relaxed/simple;
	bh=buczXM9TcKcZwQGwqB2wjSqv4KT179kVCnGDwoRveA0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZEU3s2MJc0RwGfZwTwihFyObKrpCUMDM8LOO/sxD+qaN2borWaTu7TeK+bBQdtf++eBaq6V9Pm4M0aq+xPXbsuxvwsAwvb3t7vJ9yZngOujn1XOoJR0IcUnmfyqdN++bSIoA+L2EuH5hNxKe/Ef2ut46Ah0svh8JqFvtnC0X/HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgLv2uEO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94848C4CEED;
	Fri, 20 Jun 2025 07:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750403380;
	bh=buczXM9TcKcZwQGwqB2wjSqv4KT179kVCnGDwoRveA0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CgLv2uEOoe8C/75KcvBjJGJ7XXQ202YfDHVIzAYoMe6+Lx3bY5XEt1t23QmHoTsIL
	 1tb/RKeZ6ZIZowM57tYNSKXq9ZjVGhTnOoa/30vl+mnjl0gDd7aF7g1w9sFisT3CKp
	 szAPsXwBIZNNmucY+/Y0VaqNm/U06z/bEe1lkOP93v7moXRNFCmA1lMJHeITQVZYqE
	 wOWKcRsEg5p4bSEFU0SwJauZWNlKiMREL+wClLlp5AdmY5X38C+NWWNFBNnYy2Cryk
	 VzYW5UCqs1zLsqLjQAjwjpeFyxcO9tcaylLwUUVp2U+5DmpI9M0CF05C58kCEcd9zY
	 HZ7F6MdSwMaSQ==
Date: Fri, 20 Jun 2025 09:09:37 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Li Chen <me@linux.beauty>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: rate-limit hid_warn to prevent log flooding
In-Reply-To: <20250620021506.12624-1-me@linux.beauty>
Message-ID: <446o7on5-8s99-01p9-rq78-4qo9pqo3qpr0@xreary.bet>
References: <20250620021506.12624-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Li Chen wrote:

> From: Li Chen <chenl311@chinatelecom.cn>
> 
> Syzkaller can create many uhid devices that trigger
> repeated warnings like:
> 
>   "hid-generic xxxx: unknown main item tag 0x0"
> 
> These messages can flood the system log, especially if a crash occurs
> (e.g., with a slow UART console, leading to soft lockups). To mitigate
> this, convert `hid_warn()` to use `dev_warn_ratelimited()`.
> 
> This helps reduce log noise and improves system stability under fuzzing
> or faulty device scenarios.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
> Changelog:
> 
> v2: Introduce hid_warn_ratelimited to rate-limit the specified log.
> 
>  drivers/hid/hid-core.c | 2 +-
>  include/linux/hid.h    | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index b348d0464314c..aaba7164a8c9a 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -661,7 +661,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
>  			item->tag <= HID_MAIN_ITEM_TAG_RESERVED_MAX)
>  			hid_warn(parser->device, "reserved main item tag 0x%x\n", item->tag);
>  		else
> -			hid_warn(parser->device, "unknown main item tag 0x%x\n", item->tag);
> +			hid_warn_ratelimited(parser->device, "unknown main item tag 0x%x\n", item->tag);
>  		ret = 0;

While I agree in principle that we shouldn't be flooding dmesg in case the 
report descriptor is completely bogus, I think we should be more 
consistent then.

I am pretty sure syzkaller produce report descriptors that will emit flood 
of "reserved main item tag", but you don't seem to be addresing that case?

Thanks,

-- 
Jiri Kosina
SUSE Labs


