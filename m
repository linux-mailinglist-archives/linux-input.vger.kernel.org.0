Return-Path: <linux-input+bounces-16179-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E9CC6AD5D
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C189D3650AF
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092B3393DC8;
	Tue, 18 Nov 2025 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPWlcgQt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4814377EB7;
	Tue, 18 Nov 2025 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485389; cv=none; b=X0eGzNHxnrt4+bEgHrHwVOUzi8i9iFQzw5pojMTYUwauQFMxWW63pEW/BHb47jVj3k9QD8+8+eQ5kj8+BxYIcQy4WCrEh9DE4ENXF1pRw22WAH9v0s9Q5uO7TB21tX0Wa0kXqTVtP/pHarfGZEg2QPiGtXDqGOajW5fnYFoffPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485389; c=relaxed/simple;
	bh=kzigPgK7gN3EMMbZob1ww9/r0jexC8gkrTib3f9oqmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Uq+ejvErI10/VEg/Ja9zUmAOJjsqGTjLaRf+uay7nDmqRWIfvGs0T319HkMflEJpRhTrguvhde7e5QTViXWVY5vwRSnyD5Pun67yBzQTHKBjHofDkX/gGv4PQ9m44VSWcFvalsfnHiquRfPOmpAunlwKpjF8i63vMFyrQKd6iI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPWlcgQt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2ECC4AF0C;
	Tue, 18 Nov 2025 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763485388;
	bh=kzigPgK7gN3EMMbZob1ww9/r0jexC8gkrTib3f9oqmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WPWlcgQtVVF4BtsDJn9UNAnqM2fyzVDoBBdAxRCXaJNOHFkLdozr9O4fEJQBsAu6e
	 R4m3yhSvPnTcjf/xnz4j/YshFz3+dkrhULc/rpsLZYmDEYDG2E7egwW5GEbxT/IGVp
	 GTvTERMwUEERLnWRktzRgVEkgkHJqd1QO9Dt2mSDqEgL8qBh1z48tC2wtUNXuz3x03
	 bmyUTS3dzkvrpzi3s69KzeWEVAtMY/WRFovzWUy/nKPkFxr15vuFfqv3npyoMMU++J
	 Rqx7hQL9hu4fWU4/qSy0iU9fm8fkRlxHZU+Jx+IAOUYedvsf+uA3WLDj6ejCYY0ndK
	 KxDfEj5UWuMkw==
Date: Tue, 18 Nov 2025 18:03:04 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Atharv Dubey <atharvd440@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com
Subject: Re: [PATCH] HID: mcp2221: fix slab out-of-bounds in
 mcp2221_raw_event
In-Reply-To: <20251103182543.42451-2-atharvd440@gmail.com>
Message-ID: <s9n4rooq-o7o8-o470-9028-q841574n0q9s@xreary.bet>
References: <20251103182543.42451-2-atharvd440@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Nov 2025, Atharv Dubey wrote:

> Fixes an out-of-bounds read triggered by malformed HID input reports.
> 
> Fixes: 3a8660878839 ("HID: mcp2221: add support for MCP2221 HID adapter")

The commit hash and the commit name don't match.

3a8660878839 is a Makefile update to reflect new kernel version, and 
commit with shortlog "HID: mcp2221: add support for MCP2221 HID adapter" 
doesn't seem to exist ...

> Reported-by: syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>  drivers/hid/hid-mcp2221.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index a9fd7648515d..c97f0acbac8b 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -945,7 +945,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
>  		switch (data[1]) {
>  		case MCP2221_SUCCESS:
>  			if ((data[mcp->gp_idx] == MCP2221_ALT_F_NOT_GPIOV) ||
> -				(mcp->gp_idx > 0 &&data[mcp->gp_idx - 1] == MCP2221_ALT_F_NOT_GPIOV)) {

... nor does this code.

What tree is this patch against?

-- 
Jiri Kosina
SUSE Labs


