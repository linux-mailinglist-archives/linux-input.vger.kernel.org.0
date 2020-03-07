Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E12C17CA26
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 02:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCGBIm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 20:08:42 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41232 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgCGBIm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Mar 2020 20:08:42 -0500
Received: by mail-pf1-f195.google.com with SMTP id z65so1927034pfz.8
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 17:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qBqdIJvCwDLfJZ/t2TuWiVmBTN7s7FKHEFbbfyzH03E=;
        b=R0HANwwTNgEQ3nNJWV+LODRUNNQYeehCCpnn4MgzEqiPFMn+5gMjL51T78XoJMnpXg
         mSAqhqa4geoVOM9Sr1ID3InlArdvSFnitEQTjZFRxdpIlJozWIE5Isqdemegnts1nHAV
         Ewldbg+1zrmtEC5MSquSYdmNmtxYFjJi+c+5nr25IlGvQq5dQ2go/M9kA8IuzXoRtSe/
         svsyu+nJzmzFptHEnC9ZK4i6lJGyhBJuk7E4QKI2CWWdiPyANRvh580QulB02aA6Yv6u
         TR6wid7mXIExqAXZwCgOmbtd0HLloucv2ii+V53mMChRotrR2Tak4ARlzXXFEg/fgw7M
         lxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qBqdIJvCwDLfJZ/t2TuWiVmBTN7s7FKHEFbbfyzH03E=;
        b=VZnWhW3vsq26NVndiMwVQnCMuYC1413h3mfLNJ2bTbxRKcFQnCNq9mis8vvWKWQQIv
         yKPi7CNmaIzirEJVyJOebVuxqn1G881fVS30CSRA0cTLQPCwPGShOp4yoDeYzTeK114p
         sAfkSkkMy+4l3CwvTUoeDzc9q2OxHweW5bwbwy5PG4a81g6ZyUcfTz5Ue7PMMhlriNgZ
         M7ak/tJxXFuvtOl4p7n7vU6lTTFVHZEt5a1uy1C3DP6RAZbxR+ybLLI0Pza9bbUlBGJv
         C/pTC8ctot1nAUljRMbnpptdNE1eiWB2tzy6yWevXujOSR7OTk7JbX/jPzKsZZfsd00R
         hoWA==
X-Gm-Message-State: ANhLgQ3TU132Ac+fmyFvRSV8Rjd7uIwutbVn2XoCSbM/m/b17qPWt1y6
        cB6KAC+iJc259gq9+Wz6x/b9OJ0j
X-Google-Smtp-Source: ADFU+vtEep9QjTn/CXeDh6dCOC1X0lGxHCb8TcUNkpIpMXz4FvOTz5OjAq21H//Miswwu+AknM7R5g==
X-Received: by 2002:a62:820e:: with SMTP id w14mr6756289pfd.59.1583543319566;
        Fri, 06 Mar 2020 17:08:39 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id m9sm3530007pga.92.2020.03.06.17.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 17:08:39 -0800 (PST)
Date:   Fri, 6 Mar 2020 17:08:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v1 4/5] Input: edt-ft5x06 - do not try to allocate too
 much memory
Message-ID: <20200307010837.GO217608@dtor-ws>
References: <20200303180917.12563-1-andriy.shevchenko@linux.intel.com>
 <20200303180917.12563-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303180917.12563-4-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 03, 2020 at 08:09:16PM +0200, Andy Shevchenko wrote:
> When mode switch happens we try to allocate too much memory in case
> when num_x and num_y are being assigned to their maximum.
> 
> Since the resolution should come from property in such case, reassign
> values back to num_x and num_y to prevent too much memory allocation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index a05c6b597d43..1023d4134b8d 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1178,6 +1178,13 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
>  
>  	touchscreen_parse_properties(input, true, &tsdata->prop);
>  
> +	if (tsdata->num_x == U16_MAX && tsdata->prop.max_x &&
> +	    tsdata->num_y == U16_MAX && tsdata->prop.max_y) {
> +		/* Reassign num_x and num_y from properties */
> +		tsdata->num_x = tsdata->prop.max_x;
> +		tsdata->num_y = tsdata->prop.max_y;

No. num_x and num_y reprsenet number of electrodes on a given axis and
we should not be assigning maximum coordinates to them.

Moreover, the factory mode can only be activated on M06, where we do
read these values from registers, so we will not be allocating too much
memory. If anything, we should add error handling for
edt_ft5x06_register_read() when trying to fetch num_x and num_y.

Thanks.

-- 
Dmitry
