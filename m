Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89B91BD073
	for <lists+linux-input@lfdr.de>; Wed, 29 Apr 2020 01:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgD1XKY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 19:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726044AbgD1XKX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 19:10:23 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD617C03C1AC;
        Tue, 28 Apr 2020 16:10:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w3so89668plz.5;
        Tue, 28 Apr 2020 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vofm21PZH1pw7v6LaX0gc/oJcO0nhMFI7Prv0sy1TXA=;
        b=mGR6f5gFMQGKkibLEPxRgwv4WHJ+usAUvOAu0DEKXwCUHhfVKSHxNrpaOKjfuisywv
         u99MldIDb+yq42iZleHTkQG15em+Cq/V8QBvYkq1YkVLAJFMqRBI2RttUmM/mgIq9xTQ
         9C6OoboHo1PqmHeXMzJIKLWh2ExtZWUbo/K8Sza0wMvdCe6KPHOEjUgvke8a6qqDjd1L
         GCaU0Dcd/rHDY+QSWMy6EG1mPzbYBSdpOt9nP//D17JGMgMQkGy5busk6Pnj+HR7lxT1
         9zebMP70KfkdRhX4nexVqRlaZ3IXJ6XIokV9lwu3AD/kcKq3hqeDewhNpX+GH+j3xkhR
         X4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vofm21PZH1pw7v6LaX0gc/oJcO0nhMFI7Prv0sy1TXA=;
        b=W5reLrkKhqZ4yjQig9/lCC05GnzQRXW7Xkmsruh0VBtgsxaU1DMj7h3sqWnRa3dQR7
         DS74ZUf2ll2B+i0yBxrd31gnapjjx58/8P8P1FWr5D3+04FnYTXJXI2ei+rpx3+V5obl
         JlDg+JLc25HV/bSyLY+RjlyfC3Dhzr2FWIUpoJKbJuAFh71k+Bak8eh7lfiwWG1iLhEV
         fG38Hiu6ZE0XWcwTVHGhP8BYFDTAJySNwUxP9+oYrJ2C+XlUln4vbChk/6+oI1oUVEHi
         gGDdTKKtUnlpiHU+7ATTfP4CHMTWwTkh11kKvO0yvII3Vwx8oiyX+V5Qo5J7ER4kLeZO
         W7SQ==
X-Gm-Message-State: AGi0PuZSkQC5+4M8R/1OO3GJB9P4/ePSbNKclfo5Hogp4KVu2j1Uky9M
        Cpc6lg0RKg9ylc0oCuX5ZeM=
X-Google-Smtp-Source: APiQypJD5d72NHyMgSFqHuc6EW4wsLS8A1IYdUwwqU/m7Ommdnaz1baFawPzDASp7jKZhXYtLcMSeg==
X-Received: by 2002:a17:90a:db83:: with SMTP id h3mr7732927pjv.87.1588115423366;
        Tue, 28 Apr 2020 16:10:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id c80sm15814127pfb.82.2020.04.28.16.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 16:10:22 -0700 (PDT)
Date:   Tue, 28 Apr 2020 16:10:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Evan Green <evgreen@chromium.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] Input: synaptics-rmi4 - fix error return code in
 rmi_driver_probe()
Message-ID: <20200428231020.GX125362@dtor-ws>
References: <20200428134948.78343-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428134948.78343-1-weiyongjun1@huawei.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 28, 2020 at 01:49:48PM +0000, Wei Yongjun wrote:
> Fix to return a negative error code from the input_register_device()
> error handling case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_driver.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
> index 190b9974526b..bfc08d7b25d0 100644
> --- a/drivers/input/rmi4/rmi_driver.c
> +++ b/drivers/input/rmi4/rmi_driver.c
> @@ -1210,7 +1210,8 @@ static int rmi_driver_probe(struct device *dev)
>  	if (data->input) {
>  		rmi_driver_set_input_name(rmi_dev, data->input);
>  		if (!rmi_dev->xport->input) {
> -			if (input_register_device(data->input)) {
> +			retval = input_register_device(data->input);
> +			if (retval) {
>  				dev_err(dev, "%s: Failed to register input device.\n",
>  					__func__);
>  				goto err_destroy_functions;
> 
> 
> 

-- 
Dmitry
