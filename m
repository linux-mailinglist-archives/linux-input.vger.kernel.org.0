Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA5F628B1D
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2019 21:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387415AbfEWTzW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 May 2019 15:55:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42222 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387408AbfEWTzV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 May 2019 15:55:21 -0400
Received: by mail-pg1-f195.google.com with SMTP id 33so707514pgv.9;
        Thu, 23 May 2019 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ov8W75TETIIhrb7PLZgvB0T529nH+1XtURSj91jvV5g=;
        b=eik15vTz8yba/0+/Uixcb3DnvyedjS/9VPDmbbVGkKDM407EPb8txewgOmDssJQEar
         auMO4f5PCN/dY8KCqkvYmUx247tYY5yo2tx85lgGwuLzJRCDstVqZnPfWG6/wLZrHvuA
         sxSfdgPlrz4VFRw8xL58xPwoMAuEOeWjI1aSza+muPnbEmq3yrJvT+w4iWv+6578NdS4
         bWN1qNlUi89LfQy9Jz7Lz+K5qJ+3HSLjdZZfjMrBGdCJfWmTy0px2xCdkquooGVZUhOo
         kxDCKE9xaTUh20iLZnvVeG8NQQp/SAzALn8Xl1uuNDUptIuOweaRKdx5vq5OwjEv4Usy
         UaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ov8W75TETIIhrb7PLZgvB0T529nH+1XtURSj91jvV5g=;
        b=ULXds4+9WmOoZXkJxXE8bCA6bHXZOFrq0r7mOvcRnE8RrwhWbql3w16JjL84MJsKFl
         9PxbGuz/EHPViysw6lZFruGFYDRumIPj9ocncLhtS0nCMFI13Bx03ZnCJwb9qzHGLuhc
         39o+Qygpj8e8v0TcDL6wmGvijVuXaootKxv/YPeJZzIOEZZY2qtP/GvU4Gs4k6vesntF
         BKHbU4BCyAmE3chvj/gnp+OpkXYQ8ouxh2gpKBAo/xdhHoU7F5Aoaf7gtWrLGZWFlDze
         53/nNPvF3W8I71XbNdio+RVn8U5sVmgQHKd8RrLkUoFbzowYG3oXhi/R9VSngl1XB04Q
         l7bA==
X-Gm-Message-State: APjAAAWRYiMDMqGzf3JlfVHIuINAtBycI3RZs1MXGLicRpFLSBcZoYVK
        hEDSnS1ToPe1MTWq4QMcZoaFZr8Q
X-Google-Smtp-Source: APXvYqwjhSgywYjq5+Riagp67CM64t59478zb9hwhA1cFViYzPtCaDhLNnFRSrHHA9nuob/i0XvMaw==
X-Received: by 2002:aa7:8157:: with SMTP id d23mr79731075pfn.92.1558641320707;
        Thu, 23 May 2019 12:55:20 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s2sm249860pfe.105.2019.05.23.12.55.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 12:55:20 -0700 (PDT)
Date:   Thu, 23 May 2019 12:55:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Smith <danct12@disroot.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: silead: Add MSSL0017 to acpi_device_id.
Message-ID: <20190523195518.GA176265@dtor-ws>
References: <20190523190659.3117-1-danct12@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523190659.3117-1-danct12@disroot.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 24, 2019 at 02:06:59AM +0700, Daniel Smith wrote:
> On Chuwi Hi10 Plus, the Silead device id is MSSL0017.
> 
> Signed-off-by: Daniel Smith <danct12@disroot.org>

Applied keeping Hans' reviewed-by from the previous version; thank you.

> ---
>  drivers/input/touchscreen/silead.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 09241d4cdebc..06f0eb04a8fd 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -617,6 +617,7 @@ static const struct acpi_device_id silead_ts_acpi_match[] = {
>  	{ "MSSL1680", 0 },
>  	{ "MSSL0001", 0 },
>  	{ "MSSL0002", 0 },
> +	{ "MSSL0017", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, silead_ts_acpi_match);
> -- 
> 2.21.0
> 

-- 
Dmitry
