Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF4A7AC012
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2019 21:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731568AbfIFTDi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Sep 2019 15:03:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37104 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfIFTDi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Sep 2019 15:03:38 -0400
Received: by mail-pg1-f194.google.com with SMTP id d1so3994920pgp.4;
        Fri, 06 Sep 2019 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eP3K9C+a0WJSsOs9mVffcSxyE8S/h9yJQdln/ulQd7A=;
        b=PoiSyRqQ7P7WAM7/fEZmm18vcQ//YPivLqHWC2cvRwMRH8iQ0Zz4/e4O0AX5xM/4to
         QGEqSo3uU41o03uq/FDTZUpWB4he2HmHG9QpdvS29EF5xqWZdz3czz0988fSkfzhzPFL
         E3k0igrfQFCFy0m591XUZ6TL/TS6+ua1s2N7sQEJb5K+Zm24wzOwwdu7wpXYgcoFLN15
         jnUnRcP6ktl8PiYJv6CDBAcp+qVYCs9PhJx7zVQh+kJS5Neise97EXk6HPjiX4TAp6WO
         HlvLvyI999EoQj4O3LAEK2G5Rg8tXHQIyejSvs1pFVsft4IqPzzCDr1Q9+qDEoZEDSbk
         MKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eP3K9C+a0WJSsOs9mVffcSxyE8S/h9yJQdln/ulQd7A=;
        b=PJainBLAC1aPyQxQ1nRHpJv34/6rCS8i8KphNKtdOFnjd5cBONuCNVROeBGCnXqDUY
         UZtLi5V0u0klGUVHKAQ/k5roIpS2+JKCdav7g7V0GQHG36RsDNcNsxjj6pwkcfZzJ2wc
         idSCXMbJXlkXHrPwCBcOmX6H9MUczZ/l3ZVq45w4U8lc+akoKMDCyqkhr/22JB+7tt5G
         caGNd3rdctjTEdQGeEfr04bofGNlVi2iVM9arFv3EuOw3MhDO0WUzcx92ZMdMOCqeYkV
         jd3oL0bWSyuLofasLyE4PXy/We4hrZk3phuPxIEaserm3QhjRiAiiuOX2QT6MH4Kwo79
         +XfA==
X-Gm-Message-State: APjAAAUnCkZA5e4MNEhZiWLfFk2Onc/xQQqOlD1mrnilRl7lvKaGZB+w
        J8T0YA1t13jl78APRIlTViUixqyJ
X-Google-Smtp-Source: APXvYqwDWOJmceMdZV0sbwGP/UBr6whtV3TnUAwdGJtLuFcwGAXpKRJdvfrNBb4JVqw5UpuLzJlK4A==
X-Received: by 2002:a63:31cc:: with SMTP id x195mr9194849pgx.147.1567796617255;
        Fri, 06 Sep 2019 12:03:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v18sm6703309pfn.24.2019.09.06.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 12:03:36 -0700 (PDT)
Date:   Fri, 6 Sep 2019 12:03:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input - elan_i2c: remove Lenovo Legion Y7000 PnpID
Message-ID: <20190906190334.GP187474@dtor-ws>
References: <20190906085948.27470-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906085948.27470-1-benjamin.tissoires@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 06, 2019 at 10:59:48AM +0200, Benjamin Tissoires wrote:
> Looks like the Bios of the Lenovo Legion Y7000 is using ELAN061B
> when the actual device is supposed to be used with hid-multitouch.
> 
> Remove it from the list of the supported device, hoping that
> no one will complain about the loss in functionality.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203467
> Fixes: Fixes: 738c06d0e456 ("Input: elan_i2c - add hardware ID for multiple Lenovo laptops")
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

I suppose this one should go to stable?

> ---
> 
> Note to self: once this gets in, we need to send a similar patch
> to stable, as there are a few stable branches with this PnpID.
> 
> 
>  include/linux/input/elan-i2c-ids.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
> index ceabb01a6a7d..1ecb6b45812c 100644
> --- a/include/linux/input/elan-i2c-ids.h
> +++ b/include/linux/input/elan-i2c-ids.h
> @@ -48,7 +48,7 @@ static const struct acpi_device_id elan_acpi_id[] = {
>  	{ "ELAN0618", 0 },
>  	{ "ELAN0619", 0 },
>  	{ "ELAN061A", 0 },
> -	{ "ELAN061B", 0 },
> +/*	{ "ELAN061B", 0 }, not working on the Lenovo Legion Y7000 */
>  	{ "ELAN061C", 0 },
>  	{ "ELAN061D", 0 },
>  	{ "ELAN061E", 0 },
> -- 
> 2.21.0
> 

-- 
Dmitry
