Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A071C4142A6
	for <lists+linux-input@lfdr.de>; Wed, 22 Sep 2021 09:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbhIVHdP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Sep 2021 03:33:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:42806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231429AbhIVHdP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Sep 2021 03:33:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79A8460E8B;
        Wed, 22 Sep 2021 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632295905;
        bh=GJfxswTas8HMqf4MeuLP21erMt5kueVbW2x0om+Zw3Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=F9THj58mUmhrE4kiF1sRwvDUGS1NFeYUJs4ZIOL7aTwV46riMhA6mFTvn5GOTdGem
         QeDXicWMJyt7USf3usHSOhQF3ZIlMhRDcjlKv6Dax0vp85+SK7g8mZxQ6x5cHRftXZ
         UbJ267TJmLlaqz2YmDykBo5lQqspyJw6IkzFGubGrhgdvbhsQUByc1h3xs+pqwfOVK
         k+KxCjzJtzquEVdUl7X9hk/tZMAw58ZahhDWMr70VyUF/qXs5WV7HDq9jpUhRtdArp
         9J5OQD8uXtXxwM8eXp2mVguw6fmJgbzZvXmS7/yfB6YKyqlhu1KwKPkrKe+StzAoY8
         Z7/KO8jYBy59A==
Date:   Wed, 22 Sep 2021 09:31:42 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Andrej Shadura <andrew.shadura@collabora.co.uk>
cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: Re: [PATCH] HID: u2fzero: ignore incomplete packets without data
In-Reply-To: <20210916163311.11968-1-andrew.shadura@collabora.co.uk>
Message-ID: <nycvar.YFH.7.76.2109220931360.15944@cbobk.fhfr.pm>
References: <20210916163311.11968-1-andrew.shadura@collabora.co.uk>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 16 Sep 2021, Andrej Shadura wrote:

> Since the actual_length calculation is performed unsigned, packets
> shorter than 7 bytes (e.g. packets without data or otherwise truncated)
> or non-received packets ("zero" bytes) can cause buffer overflow.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=214437
> Fixes: 42337b9d4d958("HID: add driver for U2F Zero built-in LED and RNG")
> Signed-off-by: Andrej Shadura <andrew.shadura@collabora.co.uk>
> ---
>  drivers/hid/hid-u2fzero.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-u2fzero.c b/drivers/hid/hid-u2fzero.c
> index 95e0807878c7..d70cd3d7f583 100644
> --- a/drivers/hid/hid-u2fzero.c
> +++ b/drivers/hid/hid-u2fzero.c
> @@ -198,7 +198,9 @@ static int u2fzero_rng_read(struct hwrng *rng, void *data,
>  	}
>  
>  	ret = u2fzero_recv(dev, &req, &resp);
> -	if (ret < 0)
> +
> +	/* ignore errors or packets without data */
> +	if (ret < offsetof(struct u2f_hid_msg, init.data))
>  		return 0;
>  

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

