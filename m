Return-Path: <linux-input+bounces-9739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8D8A26641
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 22:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B19BB3A4C94
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 21:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8186620FAB2;
	Mon,  3 Feb 2025 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWRIum0q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF0420FA9A
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619866; cv=none; b=PRdU7nHjXnA/eFd5WLZDHIPJYVIcC6EJJoHCNOdYNLC3PceGF2Cr88zAlN+lJXSI7+Yywc5EpyTqWEhLHOZOfVPLwXB71dKuZpyQib3rMrhDLTEuszVYR8ha8jG8NE4BC+VomZ+WxUP103tTiex8ouxLp0VFRepa0eUU9lXb9ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619866; c=relaxed/simple;
	bh=WWjfJqiffcfoGz46mNRzwAzI5e4Kww2dG4v7yX8c5xU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s+cotq1aLlQuhZEhxwE+2fqfBJxweeA3Cz83t1gp2T/rdiP4ru/PDFNCgRUHX60U0eAktZnoYQJbzA4ZOR7jtOSVf15lLFOzy9lMlBCC2wKgSxh6ryT7gYgxjUkwysL6y6AWjpTAKBf90zyUVUu2MRCCPya8BJd29uWQROygHwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWRIum0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65591C4CED2;
	Mon,  3 Feb 2025 21:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738619865;
	bh=WWjfJqiffcfoGz46mNRzwAzI5e4Kww2dG4v7yX8c5xU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oWRIum0qanuke7qbcxEarcy/HYMA51rKOwh41NU+3E79Dwz40BAklLYdhUMbPBi+G
	 j1SSA+M0Gy8i390tMi+6xLz+nL7NGQZB55b+rhbG7/hCiojJhKmsgQJzpRWTdQA8E8
	 9Ji8gNz72WPkso4cEGPH1xxZV93y7UU1iEOV0XTeJrtYfNRhN/lxLZcr/NAAgHNE6z
	 1ue2+46XIttC8d2IhRgdrBCUsbO4fdBr8Jp3+AKOVjeKdRrY49u/60ZTxqb/uBjPDw
	 9kaQUA7uk4m/acC1mzAVSDJVfAiiyQplagFxfKZtumo649LDCgMnergAP2Wu1i76Bb
	 L6fLgfhog6KXQ==
Date: Mon, 3 Feb 2025 22:57:43 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Ryan McClelland <rymcclel@gmail.com>
cc: linux-input@vger.kernel.org, djogorchock@gmail.com, 
    benjamin.tissoires@redhat.com, linux@emily.st
Subject: Re: [PATCH] HID: nintendo: fix gencon button events map
In-Reply-To: <20250117064923.3811-1-rymcclel@gmail.com>
Message-ID: <998r32nn-563n-s322-q816-o2938237r9p7@xreary.bet>
References: <20250117064923.3811-1-rymcclel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jan 2025, Ryan McClelland wrote:

> This fixes the button event map to match the 3-button recommendation
> as well as the redundant 'z' in the button map events for the Sega
> MD/Gen 6 Button.
> 
> Signed-off-by: Ryan McClelland <rymcclel@gmail.com>

Daniel, could you please provide your Ack for this patch?

Thanks,

> ---
>  drivers/hid/hid-nintendo.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 11ac246176ae..839d5bcd72b1 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -457,13 +457,13 @@ static const struct joycon_ctlr_button_mapping snescon_button_mappings[] = {
>  };
>  
>  static const struct joycon_ctlr_button_mapping gencon_button_mappings[] = {
> -	{ BTN_A,	JC_BTN_A,	},
> -	{ BTN_B,	JC_BTN_B,	},
> -	{ BTN_C,	JC_BTN_R,	},
> -	{ BTN_X,	JC_BTN_X,	}, /* MD/GEN 6B Only */
> -	{ BTN_Y,	JC_BTN_Y,	}, /* MD/GEN 6B Only */
> -	{ BTN_Z,	JC_BTN_L,	}, /* MD/GEN 6B Only */
> -	{ BTN_SELECT,	JC_BTN_ZR,	},
> +	{ BTN_WEST,	JC_BTN_A,	}, /* A */
> +	{ BTN_SOUTH,	JC_BTN_B,	}, /* B */
> +	{ BTN_EAST,	JC_BTN_R,	}, /* C */
> +	{ BTN_TL,	JC_BTN_X,	}, /* X MD/GEN 6B Only */
> +	{ BTN_NORTH,	JC_BTN_Y,	}, /* Y MD/GEN 6B Only */
> +	{ BTN_TR,	JC_BTN_L,	}, /* Z MD/GEN 6B Only */
> +	{ BTN_SELECT,	JC_BTN_ZR,	}, /* Mode */
>  	{ BTN_START,	JC_BTN_PLUS,	},
>  	{ BTN_MODE,	JC_BTN_HOME,	},
>  	{ BTN_Z,	JC_BTN_CAP,	},
> -- 
> 2.34.1
> 

-- 
Jiri Kosina
SUSE Labs


