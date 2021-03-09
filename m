Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936B3331C57
	for <lists+linux-input@lfdr.de>; Tue,  9 Mar 2021 02:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbhCIBiD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 20:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhCIBhv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 20:37:51 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8974C06174A;
        Mon,  8 Mar 2021 17:37:51 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id jx13so723598pjb.1;
        Mon, 08 Mar 2021 17:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zkWlKxbyx+sVkq98HfkrWeDXZlDaVe9hGssoZDf3e+k=;
        b=LXkzos6pxxHONe1mBJsCtD17IEboFA7FeUBY0Af3cRV0zWuMgDoEAM/lJYzXghNpJ+
         fdkGlt+4JWoNo+ZOQA35ejF+F9JCbYpI3aWMeg6MjFmeT7lQ2MUEqecBEuhP15uhl6Vw
         X/242/C6Wbk869p4R/cQkEvWDI2sgF4wRa2pEi4Ghhm0XI8Bi3sPyM7fOQrr/L7XaZwm
         Ji/2hGv1VawRfaDJbBC6WgAUuazt+PW5ET3zjKeQBVj0l4qRwnEBol4fxTo1SEO4naLC
         xYJO051sK5OHgWjrd31ZNm0lHGTsIYfwceOcz/CTDIMOJWUef9alAkPob0xWM1Qrn5PK
         lwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zkWlKxbyx+sVkq98HfkrWeDXZlDaVe9hGssoZDf3e+k=;
        b=cNf2O6uwMOsTfAeLtZj+vSfOBId78rE7GwPrsZvd92L4Cgu0LluADD/Q4InoiFOp0y
         pMuqVu2hF8jyBqbi7q8IZ/9APe97LWX4EylomGvE89wXJH8SPX7lawQ+NyZbocLFYmhp
         nfkjthZFPwTZnHbQUdsc4f6FX0oKvfRpwEEMe7W3tQa8IRBgvbS3BtX1dWka1mKdBz8A
         tUa9bJTll2vCU/Mjm/+/eA/7yrewZVvqPthSIDZXEhGfS6GIKS7pLnZMoTas4IoAlaAf
         q0nvU/orEDUeszOpg5k9GOUVmXprdOL11qgTAFfd1DvCcgaLil/KFHiQOjKljRQYjqfL
         RVUQ==
X-Gm-Message-State: AOAM533iLkbitpZHL9kMer/MmUarIb67nJnr6TtTsWXOJV+Gd4f2Q7/i
        541bJi04V6X8Pg6qdj9leL8=
X-Google-Smtp-Source: ABdhPJwETOxx/NdGFdjwtagBqgTpBSSPBb2ki3mZ7E+NQ9aPFUC3gcxPEkRDyRoz4vJXpb/f9TIe8Q==
X-Received: by 2002:a17:902:e889:b029:e6:4c9:ef02 with SMTP id w9-20020a170902e889b02900e604c9ef02mr14286646plg.1.1615253871127;
        Mon, 08 Mar 2021 17:37:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id w8sm11115919pgk.46.2021.03.08.17.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 17:37:50 -0800 (PST)
Date:   Mon, 8 Mar 2021 17:37:47 -0800
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     jingle <jingle.wu@emc.com.tw>
Cc:     'linux-kernel' <linux-kernel@vger.kernel.org>,
        'linux-input' <linux-input@vger.kernel.org>,
        'phoenix' <phoenix@emc.com.tw>,
        "'dave.wang'" <dave.wang@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev ices
Message-ID: <YEbRazfF0iTreYYz@google.com>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw>
 <YDx8M4Rhdi8hW4EO@google.com>
 <1614647097.9201.jingle.wu@emc.com.tw>
 <YEGBeWHRfL4gN9pX@google.com>
 <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw>
 <YEGJ7z479pqyBW1w@google.com>
 <005401d71161$ef9b20e0$ced162a0$@emc.com.tw>
 <YEWXcV62YpxbBp9P@google.com>
 <005d01d713f8$e4b715a0$ae2540e0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005d01d713f8$e4b715a0$ae2540e0$@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Mon, Mar 08, 2021 at 04:56:14PM +0800, jingle wrote:
> Hi Dmitry:
> 
> 1. missing "i<" 
> +	u32 quirks = 0;
> +	int i;
> +
> +	for (i = 0; ARRAY_SIZE(elan_i2c_quirks); i++) {
> 
> -> for (i = 0; i<ARRAY_SIZE(elan_i2c_quirks); i++) {

Yes, you are right of course. Was this the only issue with the updated
patch? Did it work for you otherwise?

> 
> 2. elan_resume () funtion are different with at Chromeos driver.
> @@ -1384,7 +1422,7 @@ static int __maybe_unused elan_resume(struct device
> *dev)
>  		goto err;
>  	}
>  
> -	error = elan_initialize(data);
> +	error = elan_initialize(data, data->quirks &
> ETP_QUIRK_QUICK_WAKEUP);
>  	if (error)
>  		dev_err(dev, "initialize when resuming failed: %d\n",
> error);
> 
> -> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/ref
> -> s/heads/chromeos-5.4/drivers/input/mouse/elan_i2c_core.c#1434
> -> error = elan_initialize(data);  this code is in elan_reactivate()
> function at Chromeos driver.
> -> Will this change affect cherrypick from linux kernel to chromeos?

Yes, we would need to adjust the patch for Chrome OS and have
elan_reactivate() to call elan_initialize() with appropriate argument.

Thanks.

-- 
Dmitry
