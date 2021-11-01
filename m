Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C9C441946
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 10:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbhKAKCV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 06:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57298 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232350AbhKAKBu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Nov 2021 06:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635760756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hfsAd90+4jizRuGcBnuq4ot5/47tw4BZNKDc8svp9+g=;
        b=aDwbjOs+bTdkMLGDwSdmX681w6TYveKbDA5xh3P4SPy+CnPQ2OwP9rzJu+adZ0x93+PpG8
        prLqI7ul+0BI3Sr+Ey32EKMVAt0Wb3DXBXwpL7YGTBhUohrNGDvvYpArek/czyoBfEQd51
        DBdvu/tvaLNlmIhGrFDnhBMUPqKhpfs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-a99SWUfQPrqVUIm92zisnw-1; Mon, 01 Nov 2021 05:59:15 -0400
X-MC-Unique: a99SWUfQPrqVUIm92zisnw-1
Received: by mail-ed1-f72.google.com with SMTP id o22-20020a056402439600b003dd4f228451so15037961edc.16
        for <linux-input@vger.kernel.org>; Mon, 01 Nov 2021 02:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hfsAd90+4jizRuGcBnuq4ot5/47tw4BZNKDc8svp9+g=;
        b=tKWyjIxyZE11ClewJ0y5WZqHJIxGRSk2RrnoxN1wDyL6kmr2alFDoSwuxcXL6xgFNi
         M59nnm+ne8910ze5FpYDywRgRsTBBXh+gbYKyB7wJDbB+xejrasfeTM/j/UA2DcCk3it
         ECxTYRQJWooutRhnsEKdyHNb9qcndKllfB/IvzSe7QWRZHbp5e0OLdGH0A1y/b1MMZfM
         qyWyB0g8Kb7og4EFB4/G2qIq8OBmqlTQYvjh30nCK3A4nUUPAczkkM1H6PObJUjd1ZtD
         JYYZqHMzERoOj3tUoilPFvGF63KGT/latM0YQXX2wrz5RgSVrrmqKsh0xNuottzgRBW/
         B7cA==
X-Gm-Message-State: AOAM532yluq16bvF3AHL7ZD5pDOaufkWeTEfQ0/6VzNM55wcq6BCEg2U
        lf6btHmKx3ED+lGjjUpzYLBvM+cf7rTkVmPLTP7hxV8/C+8Y6SjMZHjxwPjC4y1PUwpl/LAu8FV
        N2I9NREtjImWP0qxC5lG3uEk=
X-Received: by 2002:aa7:de83:: with SMTP id j3mr40456469edv.312.1635760754585;
        Mon, 01 Nov 2021 02:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziGpk6WpH6FTsaUWwlnifY+tohOpCDtMhNBv1GE+RVBp3kKeqI+oP5WfFtBjUYpuANxJFQQg==
X-Received: by 2002:aa7:de83:: with SMTP id j3mr40456447edv.312.1635760754419;
        Mon, 01 Nov 2021 02:59:14 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id b2sm6772338ejj.124.2021.11.01.02.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 02:59:14 -0700 (PDT)
Message-ID: <63ee77e1-dac9-ee09-6e11-4d8a091193f1@redhat.com>
Date:   Mon, 1 Nov 2021 10:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/6] platform/x86: isthp_eclite: only load for matching
 devices
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        K@troy.t-8ch.de, Naduvalath@troy.t-8ch.de,
        Sumesh <sumesh.k.naduvalath@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
 <20211029152901.297939-3-linux@weissschuh.net>
 <20211029152901.297939-4-linux@weissschuh.net>
 <20211029152901.297939-5-linux@weissschuh.net>
 <20211029152901.297939-6-linux@weissschuh.net>
 <20211029152901.297939-7-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211029152901.297939-7-linux@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/29/21 17:29, Thomas Weißschuh wrote:
> Previously it was loaded for all ISHTP devices.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> ---
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: K Naduvalath, Sumesh <sumesh.k.naduvalath@intel.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: linux-input@vger.kernel.org
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  drivers/platform/x86/intel/ishtp_eclite.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/ishtp_eclite.c b/drivers/platform/x86/intel/ishtp_eclite.c
> index 12fc98a48657..b9fb8f28fd63 100644
> --- a/drivers/platform/x86/intel/ishtp_eclite.c
> +++ b/drivers/platform/x86/intel/ishtp_eclite.c
> @@ -681,6 +681,12 @@ static struct ishtp_cl_driver ecl_ishtp_cl_driver = {
>  	.driver.pm = &ecl_ishtp_pm_ops,
>  };
>  
> +static const struct ishtp_device_id ecl_ishtp_id_table[] = {
> +	{ ecl_ishtp_guid },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(ishtp, ecl_ishtp_id_table);
> +
>  static int __init ecl_ishtp_init(void)
>  {
>  	return ishtp_cl_driver_register(&ecl_ishtp_cl_driver, THIS_MODULE);
> @@ -698,4 +704,3 @@ MODULE_DESCRIPTION("ISH ISHTP eclite client opregion driver");
>  MODULE_AUTHOR("K Naduvalath, Sumesh <sumesh.k.naduvalath@intel.com>");
>  
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("ishtp:*");
> 

