Return-Path: <linux-input+bounces-7282-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99999952D
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C6A4283D98
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 22:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074581E882C;
	Thu, 10 Oct 2024 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4CULXzt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF031E8829;
	Thu, 10 Oct 2024 22:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599093; cv=none; b=Wh4HouWb91k+bJahSqLuf/Z+mYJ2dN+fJC111fx1vJnSymBOgbvZUvPjF25GW9wtEQyYAMmM1QzCy9fw4M0POagHd8/8Pj9QEfUYIx/P0IuXE0JAtbR3S9DWeUV02+Fy9vxc+IiLXvs2EzH6nSLTUykVv0cLOYeQGxpiy+SIB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599093; c=relaxed/simple;
	bh=EKsbnf9mUcRRkS47SOr4tSrOs3etmgqIWhCS2/QU4dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/pvWMfj8c2jFGzeHNJ9Ehi4HxCorfkNgqvyBaUOYKLnglR7dh6BPQSh4sJnFKwbJwowtTIRiacs/kVD/LeuzOOrIyPT46tburiXYjTTWOnTZpzH87BoesXL3xr5BXBpouYIQcWUEz/akA4oO1cOXhPkGUG5Q0PrvmzDDAfBzKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4CULXzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077ACC4CEC5;
	Thu, 10 Oct 2024 22:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728599093;
	bh=EKsbnf9mUcRRkS47SOr4tSrOs3etmgqIWhCS2/QU4dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o4CULXzt5eVTD6F4bhRjtHSWGn+r+OtRB3ztzwRUXMYWD2W3ijffJFjzdYgQhq1J2
	 NBIRlH8s3MOVF3ZyXVmmmIwfH/hqaE8kqroO3l3cUmd3ALhANaLxTn2jsO58FZne8p
	 XN2+cnzf4DWAejoV9CcbstgycWDAn8pJombm0TifUG5meDvdnQbNLHKlCy6S/nv9SR
	 ZTbOuFzgaToEe6qD2B6aQjmk1PzjL4IK/KlgBtLE4Wpu7TwNn7TrnNCpoWpm2ZaN0Q
	 bxn4zjPQL5xbwGHtYWYnI5f8hoxT4ygiFCvzgNCoABoL1uqfGeBhNDS4nS3AT6QQk5
	 9u56FvBqabQNQ==
Date: Thu, 10 Oct 2024 15:24:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] HID: simplify code in fetch_item()
Message-ID: <20241010222451.GA3571761@thelio-3990X>
References: <ZvwYbESMZ667QZqY@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvwYbESMZ667QZqY@google.com>

Hi Dmitry,

On Tue, Oct 01, 2024 at 08:42:36AM -0700, Dmitry Torokhov wrote:
> We can easily calculate the size of the item using arithmetic (shifts).
> This allows to pull duplicated code out of the switch statement, making
> it cleaner.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/hid-core.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 988d0acbdf04..00942d40fe08 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -754,35 +754,32 @@ static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
>  	}
>  
>  	item->format = HID_ITEM_FORMAT_SHORT;
> -	item->size = b & 3;
> +	item->size = BIT(b & 3) >> 1; /* 0, 1, 2, 3 -> 0, 1, 2, 4 */
> +
> +	if (end - start < item->size)
> +		return NULL;
>  
>  	switch (item->size) {
>  	case 0:
> -		return start;
> +		break;
>  
>  	case 1:
> -		if ((end - start) < 1)
> -			return NULL;
> -		item->data.u8 = *start++;
> -		return start;
> +		item->data.u8 = *start;
> +		break;
>  
>  	case 2:
> -		if ((end - start) < 2)
> -			return NULL;
>  		item->data.u16 = get_unaligned_le16(start);
> -		start = (__u8 *)((__le16 *)start + 1);
> -		return start;
> +		break;
>  
> -	case 3:
> -		item->size++;
> -		if ((end - start) < 4)
> -			return NULL;
> +	case 4:
>  		item->data.u32 = get_unaligned_le32(start);
> -		start = (__u8 *)((__le32 *)start + 1);
> -		return start;
> +		break;
> +
> +	default:
> +		unreachable();
>  	}
>  
> -	return NULL;
> +	return start + item->size;
>  }

I am noticing some interesting behavior when building with clang, namely
some objtool warnings and a failed boot when LTO is enabled, which I
bisected to this change as commit 61595012f280 ("HID: simplify code in
fetch_item()"), such as:

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig vmlinux
  vmlinux.o: warning: objtool: hid_open_report() falls through to next function hid_parser_main()
  vmlinux.o: warning: objtool: hid_scan_report() falls through to next function hid_allocate_device()

With LTO enabled, the warning becomes:

  vmlinux.o: warning: objtool: hid_open_report+0x21b: can't find jump dest instruction at .text.hid_open_report+0x40f

A bare unreachable(), especially in the default case of a switch
statement, is generally considered harmful in my experience, as it can
introduce undefined behavior, which can mess up how a compiler might
optimize a function. Commit d652d5f1eeeb ("drm/edid: fix objtool warning
in drm_cvt_modes()") and commit 3764647b255a ("bcachefs: Remove
undefined behavior in bch2_dev_buckets_reserved()") have some good
commit messages talking about it.

Getting rid of the unreachable() in some way resolves the issue. I
tested using BUG() in lieu of unreachable() like the second change I
mentioned above, which resolves the issue cleanly, as the default case
clearly cannot happen. Another option I tested was some sort of printk
statement and returning NULL, which some maintainers prefer, even in
spite of impossible conditions. I am happy to send a patch with one of
those changes or open to other suggestions.

Cheers,
Nathan

