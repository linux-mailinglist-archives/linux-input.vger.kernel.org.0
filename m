Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B44373C03
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 15:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhEENKX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 09:10:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232733AbhEENKX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 09:10:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3121B61222;
        Wed,  5 May 2021 13:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620220167;
        bh=0Lngo/CwvfKlckO8p23UpFCI16CZFU/wLJjVntoL4hQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=svAQOkXSEy8mLooRYDLhV5H1ER6syXS1xvTg/clkjee+LBwh2S+qRHCG/p2GSkY8s
         c5st8LSuRPFzLXAN521QvX5HYk+q9BZpdtGGoQIbqdBepchyV3jVBLE1vc/EKKd7bU
         8RFxD2MdP24j4ndT8Z9IFH3jtI+u50znnv7yPTBGTvc3Ls968NFQFu5kbSiPjoqajK
         yiXDlPNmfKBBu8wHHq8ik0adNAMdVoczEe34IbLcnq9BlEGb5D6KQjH0HTcrX+flfl
         GTEC0Rh0RVpAPesCrZGI4AjPB5MGU5k6AY8TH1sRrTVl/HDjvQPKWRyuzbWYD3aXOH
         AkfPdCsjN8Oig==
Date:   Wed, 5 May 2021 15:09:24 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Mark Bolhuis <mark@bolhuis.dev>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] hid: Add BUS_VIRTUAL to hid_connect logging
In-Reply-To: <20210503163937.34889-1-mark@bolhuis.dev>
Message-ID: <nycvar.YFH.7.76.2105051509170.28378@cbobk.fhfr.pm>
References: <20210503163937.34889-1-mark@bolhuis.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 3 May 2021, Mark Bolhuis wrote:

> Add BUS_VIRTUAL to hid_connect logging since it's a valid hid bus type and it should not print <UNKNOWN>
> 
> Signed-off-by: Mark Bolhuis <mark@bolhuis.dev>
> ---
>  drivers/hid/hid-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 0ae9f6df59d1..265cbe592374 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2005,6 +2005,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
>  	case BUS_I2C:
>  		bus = "I2C";
>  		break;
> +	case BUS_VIRTUAL:
> +		bus = "VIRTUAL";
> +		break;
>  	default:
>  		bus = "<UNKNOWN>";
>  	}

Applied, thanks Mark.

-- 
Jiri Kosina
SUSE Labs

