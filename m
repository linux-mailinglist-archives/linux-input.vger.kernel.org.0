Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FE12AFCCF
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 02:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgKLBeD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 20:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgKLAhn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 19:37:43 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA34DC0613D4;
        Wed, 11 Nov 2020 16:37:42 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w6so2904879pfu.1;
        Wed, 11 Nov 2020 16:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mM9QG86V38tLRA60VPmwtkAR+Znxn+9PIF+rI2nOlIY=;
        b=jGX4gTpi4pVihMOdKX/6tH9in1Jo9ery0yzFMEOf9KQeAMg4w0zuUmGry5KNXGY+DS
         04SEIGtu3FHUVZ6Q3i2LH5+qYvg6ngXGkw8/n/0444hh8Tds2uQuWuHC+etuLeqx4Rqo
         Gx1hocfoBTGU3MppVZsrOilc/9ivXc0ebxNzbooY4b23l/e9bjE2Jgqfd05zepO3CFUp
         bmbGpHI9DllMRTvm1gQtiCnvExv9REVyLB/jylkxMW30fQDP2JasZrbFWBOavW8YdT/t
         uxFOuwEoK49xH2cdhfAb0F/dK7zbOXo48nid9QZqIzXhaI1UcdW7/I2+xZGQHVsqOQYN
         m96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mM9QG86V38tLRA60VPmwtkAR+Znxn+9PIF+rI2nOlIY=;
        b=i6zlC1S/grXKbxKO1q10qlD0UWMx+j+8QPsGFNfNnHfpK3n7+txYwBxHodZwHDVOiX
         It+/rltAqtab1gJtwOskuzOWjb0DfW17gipgCl9TF7+rTMaCcFP2iay5LFXaAoUb7FLk
         cHgGSYcAWvd5dOhHvemis/OwoNenJLePZbV8BFhoXFdLnNKIbbf2JVTMBy6qwcxpJCCH
         8EZhetObrB1WcUqYAoJ33XZzq/0UW57sEN+qWZeDZjtsAtcfljcLUpt+HcUKobvWzyte
         uPi078YUSq46gAUhJogp4OTR6dM02l9D7Zd0jn17Dnoc9/cf+ItK11fhMqujyZUm/BVv
         s9rQ==
X-Gm-Message-State: AOAM532iMSgnIef3+4PXPq8Nu/wyLwnwUYVK1iqFKIDJLco1ERuZo/Wp
        qVdYFOk73b7fNm4HU/C/W+A=
X-Google-Smtp-Source: ABdhPJwwUP/3YiRKPA/36oGI5gQoClu23rc118P24HOIH+2zQqSYwKLzEPkhy2rbrWyHL4lTpKzL2w==
X-Received: by 2002:aa7:8518:0:b029:18b:cc9c:efab with SMTP id v24-20020aa785180000b029018bcc9cefabmr21951853pfn.39.1605141462317;
        Wed, 11 Nov 2020 16:37:42 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b80sm4047441pfb.40.2020.11.11.16.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 16:37:41 -0800 (PST)
Date:   Wed, 11 Nov 2020 16:37:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] Input: adp5589: use a single variable for error in
 probe
Message-ID: <20201112003738.GZ1003057@dtor-ws>
References: <20201111084833.40995-1-alexandru.ardelean@analog.com>
 <20201111084833.40995-2-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111084833.40995-2-alexandru.ardelean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexandru,

On Wed, Nov 11, 2020 at 10:48:28AM +0200, Alexandru Ardelean wrote:
> The 'error' & 'ret' variables are used. This is a bit of duplication.
> This change replaces the use of error with the 'ret' variable since the
> name is a bit more generic.

I really prefer variables that carry error codes/success and are used in
error paths to be called "error", and "ret" or "retval" to be used in
cases where we may return actual data.

Thanks.

-- 
Dmitry
