Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5EB4031FD
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 02:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344780AbhIHAyB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 20:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343915AbhIHAyB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 20:54:01 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9DAC061575;
        Tue,  7 Sep 2021 17:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=kAIjmxfZZa/cYhmVo2ffRv+Sadvx5QANbTzlROnRP6Y=; b=0p+83hwSv7f9gOnWZEteq5liHX
        Wgpxw2KvW98NOPO0Sy+QO2uRqyLGsTurOmyAXNgOHuEO3q6xXl5k8RQcRRgrTDCSJq39ffemiGY3Q
        afrNVXzr2V+MdF9oWigmM/FzpqgRCpWNdkSkdKTKDR7tNQx44Tup9pOv+Ar7uaAT7ZsZsK0DKrZTU
        /cUYAkmYx3q24Pz3sjXEQyFBrvPUUXsjDo15tSZ/lREXEip9tMtEWFRy37koGs/fTQUnpifcPH3Jt
        P9cfImoM0DZ5bCEn2gDWyRdxCOqHfpYmmagKmMNIrXrNmdTjRI2RXkIWdSmV3yyYcmdsxekpqUsjo
        wK9yVjOA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mNlpd-0056Wy-Fz; Wed, 08 Sep 2021 00:52:53 +0000
Subject: Re: [PATCH v3] Input: analog: Always use ktime functions
To:     Guenter Roeck <linux@roeck-us.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907123734.21520-1-linux@roeck-us.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <15bf8c00-3a38-a1bd-8214-6f45608db3f0@infradead.org>
Date:   Tue, 7 Sep 2021 17:52:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907123734.21520-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/7/21 5:37 AM, Guenter Roeck wrote:
> m68k, mips, s390, and sparc allmodconfig images fail to build with the
> following error.
> 
> drivers/input/joystick/analog.c:160:2: error:
> 	#warning Precise timer not defined for this architecture.
> 
> Remove architecture specific time handling code and always use ktime
> functions to determine time deltas. Also remove the now useless use_ktime
> kernel parameter.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Avoid 64-bit divide operation
> v2: Drop helper functions and use ktime_get() and ktime_sub() directly
>      Drop 'speed' variable and use NSEC_PER_MSEC directly
> 
>   drivers/input/joystick/analog.c | 103 ++++----------------------------
>   1 file changed, 11 insertions(+), 92 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

thanks.
-- 
~Randy
