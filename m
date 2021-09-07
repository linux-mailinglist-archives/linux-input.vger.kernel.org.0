Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C23D40230C
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 07:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhIGF3M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 01:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbhIGF3L (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 01:29:11 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DDBC061575;
        Mon,  6 Sep 2021 22:28:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so799628pjb.0;
        Mon, 06 Sep 2021 22:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xkYVFbnjRXNaVulr+h3N+YQAw1zNtm2NUhsbkh3G6cg=;
        b=a3vuaT8dKMV1Xilu56/NFdrXfcfqM9qQJQbR08EEk8NLpwSiV2A/GExVYHWr4L/2yD
         IpdTFbx0+nrOfrDOfkUriQ6n/TkUx4vnPJTNr1kw5ZLuPyBgEIg1tH5qCxnjQAx9QSV8
         lRFXTywGfKiseKhzyQ/dNi0r1IdhM+AF2ZydXz00tm4vRSGWBUDYoPxPLfAe1heShLKW
         c6NNLsroSlo2X938rqq+8JJqy1BHgCxYNAHGUGODAYMpowGA/vX47YK/irGxptyEMn2M
         QE95jfCRblxMYz93jJHKxiKR8tce3hBAzWNcq3crvb6Jb/kobYUxSB5NbbXaH+A9w6Ri
         FsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xkYVFbnjRXNaVulr+h3N+YQAw1zNtm2NUhsbkh3G6cg=;
        b=p0pQJ8/rpUGjctK7vMmFNPaZzxCtbreb8mvtnBq6JNac8LORRJhy+EP6QhreV5ds1J
         J9dkLPjfBhgdyNgAlfrkihE8bYfRHpapxuEGnDRKP58hX9fA9QFvQGf0r4A0XHBk3GR2
         5RvMkzEHtgp+KunbK9PIMixJjZ+gYJlQDtX0oVxsRRjlus1jLq+u2geBhVwjQWAiEvJT
         ZlT2dFQZk4kaPNQzbXUkzO4GN+DckPfsN5h83Xpls1pQElQva6oTnOIYAoxbCJlMfHb1
         7+9SwnZLCBNjtmAcT0E4NUnlIgVfPdUtlx+OXjAAPj/mBphWVRIjzICX3zmona1Z5q7n
         I8qg==
X-Gm-Message-State: AOAM533roGn6t0TWKm+Mm5LW5CDh6PB6kbXSoLvW4s9T1FwYsiSNHpsn
        HqKm+4C6AHCXeG0i0dGtDos=
X-Google-Smtp-Source: ABdhPJyDvyK8WhtkOVMqqW8j252ZiVFZxynqJf5B6tpQC1edhDGYc81ZIJPHUmeJK1GuHyNilc7w4g==
X-Received: by 2002:a17:90a:4306:: with SMTP id q6mr2663673pjg.202.1630992485454;
        Mon, 06 Sep 2021 22:28:05 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:668f:8a8e:5bc5:fb2d])
        by smtp.gmail.com with ESMTPSA id i10sm9235106pfk.87.2021.09.06.22.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 22:28:04 -0700 (PDT)
Date:   Mon, 6 Sep 2021 22:28:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for WHITEBOX
 Machine.
Message-ID: <YTb4YbVIPeYvHlhp@google.com>
References: <20210907012924.11391-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907012924.11391-1-jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Tue, Sep 07, 2021 at 09:29:24AM +0800, jingle.wu wrote:
> Singed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
> ---
>  drivers/input/mouse/elan_i2c.h      | 1 +
>  drivers/input/mouse/elan_i2c_core.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
> index dc4a240f4489..84b4a678b482 100644
> --- a/drivers/input/mouse/elan_i2c.h
> +++ b/drivers/input/mouse/elan_i2c.h
> @@ -59,6 +59,7 @@
>  #define ETP_PRODUCT_ID_VOXEL	0x00BF
>  #define ETP_PRODUCT_ID_MAGPIE	0x0120
>  #define ETP_PRODUCT_ID_BOBBA	0x0121
> +#define ETP_PRODUCT_ID_WHITEBOX	0x00B8
>  
>  struct i2c_client;
>  struct completion;
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index dad22c1ea6a0..a3edf71982ce 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -108,6 +108,7 @@ static u32 elan_i2c_lookup_quirks(u16 ic_type, u16 product_id)
>  		{ 0x10, ETP_PRODUCT_ID_VOXEL, ETP_QUIRK_QUICK_WAKEUP },
>  		{ 0x14, ETP_PRODUCT_ID_MAGPIE, ETP_QUIRK_QUICK_WAKEUP },
>  		{ 0x14, ETP_PRODUCT_ID_BOBBA, ETP_QUIRK_QUICK_WAKEUP },
> +		{ 0x0D, ETP_PRODUCT_ID_WHITEBOX, ETP_QUIRK_QUICK_WAKEUP },

I reordered this and the above so the entries are sorted properly and
applied.

Thanks.

-- 
Dmitry
