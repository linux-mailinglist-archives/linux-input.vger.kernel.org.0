Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BFD40BAF4
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 00:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbhINWJ3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Sep 2021 18:09:29 -0400
Received: from gateway32.websitewelcome.com ([192.185.144.98]:27459 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231559AbhINWJ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Sep 2021 18:09:29 -0400
X-Greylist: delayed 1347 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Sep 2021 18:09:29 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 47CAD16112F
        for <linux-input@vger.kernel.org>; Tue, 14 Sep 2021 16:45:43 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id QGFLmQbClcEL1QGFLm2v7m; Tue, 14 Sep 2021 16:45:43 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2vSlWpDlgQ1WCtKW+iJxypZWQ+3srQCmJtCimsZZbKQ=; b=ccvX3c8vYx2soiyQjSD3Y3K9ld
        9n8goroyewasfqmu9ivOOmOTa9INFz7yHnPJ9azhVmUGNyiekWz9n/lTDaBAAJuN7TXnRQnQewfra
        yLoOnkE78oNRJR2Dt8+zAiXw/iUMCXDZPWQiDx8DCpCova0lD/z5VLA83pYB8s0ZJz0pAqCGlp4Tz
        JaRPSkMp/vCIeWhkRSJOGwpOh6FbNWPWAxjwL8JbFfGGOBjbORla0GnVQ9kHpwVOfjCErxqoD0XVl
        x279Qwh5Mjb2yhVQHWf93gTuFWGPWS2nccT1D3QueiBPvKXsaQiE12MeTd1YhutRZJDtmVAXyDsBh
        FPleGuxw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:35226 helo=[192.168.15.9])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1mQGFK-003opJ-Uw; Tue, 14 Sep 2021 16:45:42 -0500
Subject: Re: [PATCH] Input: omap-keypad - prefer struct_size over open coded
 arithmetic
To:     Len Baker <len.baker@gmx.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210911112716.10067-1-len.baker@gmx.com>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <32777a69-297a-f68a-d0c3-e5920035531b@embeddedor.com>
Date:   Tue, 14 Sep 2021 16:49:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210911112716.10067-1-len.baker@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1mQGFK-003opJ-Uw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.9]) [187.162.31.110]:35226
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 9/11/21 06:27, Len Baker wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the struct_size() helper to do the arithmetic instead of the
> argument "size + count * size" in the kzalloc() function.
> 
> [1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
> 
> Signed-off-by: Len Baker <len.baker@gmx.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  drivers/input/keyboard/omap-keypad.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
> index dbe836c7ff47..eb3a687796e7 100644
> --- a/drivers/input/keyboard/omap-keypad.c
> +++ b/drivers/input/keyboard/omap-keypad.c
> @@ -190,8 +190,7 @@ static int omap_kp_probe(struct platform_device *pdev)
>  	row_shift = get_count_order(pdata->cols);
>  	keycodemax = pdata->rows << row_shift;
> 
> -	omap_kp = kzalloc(sizeof(struct omap_kp) +
> -			keycodemax * sizeof(unsigned short), GFP_KERNEL);
> +	omap_kp = kzalloc(struct_size(omap_kp, keymap, keycodemax), GFP_KERNEL);
>  	input_dev = input_allocate_device();
>  	if (!omap_kp || !input_dev) {
>  		kfree(omap_kp);
> --
> 2.25.1
> 
> 
> 
> 
