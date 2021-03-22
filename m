Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4563436F3
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 04:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhCVDBK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 23:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhCVDBA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 23:01:00 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190A5C061574;
        Sun, 21 Mar 2021 20:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=qm4alaJ0ONglk44PMxJTfj8yrz4xAUaZCHbbZklVcjc=; b=Mco9HoELyVM3vzxO6ajuvwBpPY
        Yr25H7tviw1V98P7EJHYs4m6Gn5YXapQqcdmC0KEjI4+PL65+vPUroTq1lUw5ITMOx5MwDTtmmhTr
        aGxllfDHKifObfDFZUskPD6PRL4+0VfZn0HknhzjbMEHUTCGIG5QTYFK3rzZRyu07QAQZoZX9PSv4
        FWFKL/cLcPdslE8atTZWC0y4jqf+LBQbLKDihcfEuuW/CSJgaISmnoBevsriZu8WYZQagBgp83Csb
        p/oTKQ10+YVgBA3ilaa6flHs8SY1mIqtSFzivXdePOMrBVb0X1p+y0raLonyChTr8EEb6i8FYzjP2
        k+hXpGLw==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOAoK-00AjqY-AA; Mon, 22 Mar 2021 03:00:58 +0000
Subject: Re: [PATCH] Input: Fix a typo
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, hdegoede@redhat.com,
        dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210322022030.3857089-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <713df31a-32a5-e2ec-25d1-79fe14c09a31@infradead.org>
Date:   Sun, 21 Mar 2021 20:00:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322022030.3857089-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 3/21/21 7:20 PM, Bhaskar Chowdhury wrote:
> 
> s/subsytem/subsystem/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/input/touchscreen/silead.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 8fa2f3b7cfd8..32725d7422de 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -486,7 +486,7 @@ static int silead_ts_probe(struct i2c_client *client,
> 
>  	silead_ts_read_props(client);
> 
> -	/* We must have the IRQ provided by DT or ACPI subsytem */
> +	/* We must have the IRQ provided by DT or ACPI subsystem */
>  	if (client->irq <= 0)
>  		return -ENODEV;
> 
> --


-- 
~Randy

