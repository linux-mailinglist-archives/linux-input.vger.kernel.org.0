Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6862B3211C3
	for <lists+linux-input@lfdr.de>; Mon, 22 Feb 2021 09:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhBVIIj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Feb 2021 03:08:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbhBVII2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Feb 2021 03:08:28 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAC9C061574;
        Mon, 22 Feb 2021 00:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=Tr1ML1nr5oksMQv9KAcH0/1j9EyorwBVbrTZIi5dm7Q=; b=GMIURamVFWbPlGldFnkn9UjeIR
        7QCCKOgZf2pEfTnLGRQKw1Q6kuUZJgfFd0PUnSV1RbXyPbrjPbkZBTsrkGnwrsHmhgIzcTHBMyWDK
        Ota8t2vmyf40yFBfFJPUzEhOprfhZ+6VYn/V76LpQLyS9b3diYTIPOMK3FeGLquaqWa+3+6QvFmLU
        l+tfb7AC+zaOiyu6pK8LwRhomgmsTMWiHUdSxB+DZ+f+s9AbKiAJco0XRFRSFXgEsN2MaXmaijWJY
        8cvk4Lyk2yAyE54F/QDi3YkHGhQflfDi3+d0j4me1+KyKji4f+Am2k0Wn5p0gDs0anmprm7z1wD/9
        5Uo0hJ6A==;
Received: from [2601:1c0:6280:3f0::d05b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lE6Ft-0001kQ-48; Mon, 22 Feb 2021 08:07:45 +0000
Subject: Re: [PATCH] drivers: input: mouse: Change postive to positive in the
 file alps.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, pali@kernel.org,
        dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        colin.king@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210222075439.32201-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <97932a41-0d3b-adaa-3b08-35c6e81763ff@infradead.org>
Date:   Mon, 22 Feb 2021 00:07:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222075439.32201-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2/21/21 11:54 PM, Bhaskar Chowdhury wrote:
> 
> s/postive/positive/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/input/mouse/alps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index b067bfd2699c..4a6b33bbe7ea 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -986,7 +986,7 @@ static void alps_get_finger_coordinate_v7(struct input_mt_pos *mt,
>  	case V7_PACKET_ID_TWO:
>  		mt[1].x &= ~0x000F;
>  		mt[1].y |= 0x000F;
> -		/* Detect false-postive touches where x & y report max value */
> +		/* Detect false-positive touches where x & y report max value */
>  		if (mt[1].y == 0x7ff && mt[1].x == 0xff0) {
>  			mt[1].x = 0;
>  			/* y gets set to 0 at the end of this function */
> --


-- 
~Randy

