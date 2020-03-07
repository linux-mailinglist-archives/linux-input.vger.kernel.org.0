Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC85117CA31
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 02:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCGBLR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 20:11:17 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34238 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgCGBLR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 20:11:17 -0500
Received: by mail-pl1-f196.google.com with SMTP id j7so1571417plt.1
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 17:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+WQXIuvILhl6uZoZXpldV+cqWiVV/zGpeGEPwThCnX4=;
        b=Myu/bCkVwGz0dA1DSctCsAEn/Fnrg/Pay/haTEEN9RtduAcxtN64Hj8xq+TzespkqT
         OumHOA931lvimkCK3ey9h3Pq/UmxKjaY8ILAE1yeQOnHsK1kJtK/4NEetDjuUoITmUTW
         MUDdop5pVizDm0jPlIBaj85LY3Z5Z0EURdxXhE+LuzwhQoSG2FdtRnzzt19tQn+RabQE
         rbpR1RWb86hb8Bbe3bIcPoNs4ByN8HfDexib3RSbrgne+8BJkKbbh8vkZ3+dlvboy37U
         mfU3q+0QqGHl7X4rUAeo3LO3+zXgYTIlvGbrQtlZHTlyj+DvODBVtWJYQnKz+MxTn8pW
         /PXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+WQXIuvILhl6uZoZXpldV+cqWiVV/zGpeGEPwThCnX4=;
        b=RduP7EB39LH/dI1YIi7cw0Ve4Lfkfv/XS686I9twdf7wtVGeNRPelManYhdfdcKcci
         PYpk/pCEGmLBJMC9ChWlTW03fsBmzmPuN4/H9B0qcGZyuYwyPirrtJ9OQgMyoppYA6A4
         VoIRLb5T5beBkmGI1tbbd8Jbq8UMJ56C8op5DKhNtSp2zUy1hkto3US/Dk81P8coEQjZ
         /pOV1uHN4740UGfCr8irtTV56iTdYCiI0ougzXmnZRWSiMPU8kWMoRrzsCvQk+K3R5gS
         Gu3p3QE3eeFmvPMXEvt0laMoWfZfoUcsIxyK4JCqAaEreIfWIVVMsXb/V5Zhu1MD6FPy
         nN+w==
X-Gm-Message-State: ANhLgQ3TAICCV5JXurxHSRPqmwEwT0bjaTNjabCdVnfFW0RoXB2iDO3F
        5e1wrCuVZVqcEOwWNHtBwGI=
X-Google-Smtp-Source: ADFU+vvq2Ausq01vRi0ZTUPgyYNswckxQcbCOKUhVYyXlwhKab1clBwGv7361p0uATq/gN6rlt3HYA==
X-Received: by 2002:a17:90b:30a:: with SMTP id ay10mr6415455pjb.162.1583543476071;
        Fri, 06 Mar 2020 17:11:16 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id b18sm37923088pfd.63.2020.03.06.17.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 17:11:15 -0800 (PST)
Date:   Fri, 6 Mar 2020 17:11:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v1 2/5] Input: edt-ft5x06 - refactor condition in
 edt_ft5x06_debugfs_mode_set()
Message-ID: <20200307011113.GP217608@dtor-ws>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
 <20200303180917.12563-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303180917.12563-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 03, 2020 at 08:09:14PM +0200, Andy Shevchenko wrote:
> For better reading unroll nested conditions to simple if-else-if.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index d2587724c52a..cb67104c6934 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -666,10 +666,10 @@ static int edt_ft5x06_debugfs_mode_set(void *data, u64 mode)
>  
>  	mutex_lock(&tsdata->mutex);
>  
> -	if (mode != tsdata->factory_mode) {
> -		retval = mode ? edt_ft5x06_factory_mode(tsdata) :
> -				edt_ft5x06_work_mode(tsdata);
> -	}
> +	if (mode && !tsdata->factory_mode)
> +		retval = edt_ft5x06_factory_mode(tsdata);
> +	else if (!mode && tsdata->factory_mode)
> +		retval = edt_ft5x06_work_mode(tsdata);

Sorry, I find the original better, as I read it

	if mode changing then
		activate desired mode (either factory or normal mode)

Thanks.

-- 
Dmitry
