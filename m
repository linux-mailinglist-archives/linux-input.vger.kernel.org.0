Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC823759D9
	for <lists+linux-input@lfdr.de>; Thu,  6 May 2021 19:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhEFR6g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 13:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236341AbhEFR6g (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 13:58:36 -0400
X-Greylist: delayed 394 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 06 May 2021 10:57:37 PDT
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7570C061574
        for <linux-input@vger.kernel.org>; Thu,  6 May 2021 10:57:37 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4E29282CF3;
        Thu,  6 May 2021 19:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1620323460;
        bh=C6yCPpUWXAi0DVvdZQUaoYiB8D1I4xa96ndWeNJAlGA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=P0WVQ0AqyheslvKtzYtyC3CIzju4ET50kWE5oJgWubVINJJiJXzvuDRhWWFZ1g2Y0
         iFEuVK9iMYDFCG5r5mKUtEd0Msk9iLeOBdQ6U2sqlNejMbRJrF7dpxHIeBfNy3zG+J
         wjGFhzvMHqlDZAiYLP7mq9D0IkGqRMBZud/s7Zx/+Uefye7KXvbirUKOsYs0UMQ/nI
         S9shER37i+EZEvknf0wiq3anB+y/GVqRZnvWbwW9Cg6RBBXMiaG8Ty0RwHeVHQ8u49
         ccN0ifDvo/lwJy2RhwAHYl9vfMSBxd3KmENmH3XxJwu/aShNfrHtF1qhWioXlCNWCN
         HsPDKvohykcvQ==
Subject: Re: [PATCH] Input: ili210x - add missing negation for touch
 indication on ili210x
To:     Hansem Ro <hansemro@outlook.com>, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com
References: <DS7PR19MB44212FCE6607B2C7978AB612DD589@DS7PR19MB4421.namprd19.prod.outlook.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <a07a1804-28cd-bd07-f3cd-3307be433534@denx.de>
Date:   Thu, 6 May 2021 19:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <DS7PR19MB44212FCE6607B2C7978AB612DD589@DS7PR19MB4421.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 5/6/21 7:32 PM, Hansem Ro wrote:
> This adds the negation needed for proper finger detection on Ilitek
> ili2107/ili210x. This fixes the polling and coordinate parsing issues
> (on Amazon Kindle Fire) caused by returning false for the cooresponding
> finger on the touchscreen.
> 
> Signed-off-by: Hansem Ro <hansemro@outlook.com>
> ---
>   drivers/input/touchscreen/ili210x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index d8fccf048bf4..30576a5f2f04 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -87,7 +87,7 @@ static bool ili210x_touchdata_to_coords(const u8 *touchdata,
>   					unsigned int *x, unsigned int *y,
>   					unsigned int *z)
>   {
> -	if (touchdata[0] & BIT(finger))
> +	if (!(touchdata[0] & BIT(finger)))

This makes the behavior consistent with the other ILI21xx touchscreen 
controllers too, so I think this patch is OK, thanks.

It would be nice if you could add Fixes: tag, so this could get picked 
into linux-stable too.
