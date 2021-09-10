Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8141406678
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 06:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhIJEaj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 00:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhIJEag (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 00:30:36 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF97C061574
        for <linux-input@vger.kernel.org>; Thu,  9 Sep 2021 21:29:22 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id t20so532843pju.5
        for <linux-input@vger.kernel.org>; Thu, 09 Sep 2021 21:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vj1uYgN7EKtDEjfR33S9KtTMQ0E9WsA/K4gye6Lclnk=;
        b=eVbjB4IZaY+WDsQDklFEn/M2wW9pKc5DXjm0ltT7AvBOcIATSAmQU+abqi6ValpoQM
         Pm4b2wjUfTbHmS8O8EMVWoDf17fi5S0b4K8sqVhRArPZsvy8kXXE1sJ+C3uq874LTE8Q
         gtUNu1OB4YkcCKwVOFQp/RFnlZ2C5UkIb0P7wd33juVGKODkKXdx0YlcBTHn25HuOvNZ
         sSiV0t72JF1J/xMVbFe+oTFxIaRF9qyzrYBTf1lL+xhMi6uJ4FXafCRS07m8Xtgkm3sG
         IaFZ4llk9QN5s/gf7zMdexpZb7dbm3VGur1rXhRITGA7tbAc0IxhnxDqiDDUGciFK4rw
         BLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vj1uYgN7EKtDEjfR33S9KtTMQ0E9WsA/K4gye6Lclnk=;
        b=ZTw1lZriYwEAuz4o5UcTqyHxEj1BVqz3pv8avpsqXnDO7FSz+nn/ynoyCvugwMY0eC
         AJQDo7ibXew3VRAbZFJGoFjIFhvrG78L5V/6wXMKzQmmp2cv1fUilt259wapYXecSQgM
         ayrvqsa0RlEpE2+20ANvZtJ/l6svlPZlW6LbWdbbJrh0CTMJZL24KDJOvJgEHCDmAuZY
         CeqsesbM1URKmKXS3+H7MBFP+0NyNbaCSN93B6xrEFFscHwlZiG7DOeiSBxCzOsiwFq2
         1dGOFi8hHhHfshxoHf/cbpy7pD5byokT/6+Y1y/a2WyBRcpxMr96VJ+PKhEUhFqCPbgW
         i7zg==
X-Gm-Message-State: AOAM531X6Lnagl0VwMQvsM4kNExhlLzljA+YDACkY4Bs9qyliNspXbM2
        pNukdzUjZz5rLTeUUwkpB2Q=
X-Google-Smtp-Source: ABdhPJyfd1rzlwNZvUV3+mm1PPVLrXCMvGIRqoHEM3NAtz9SnrEKxTSFmuX9IKE/6u6NHn54orgCVQ==
X-Received: by 2002:a17:90b:224b:: with SMTP id hk11mr7374982pjb.76.1631248162299;
        Thu, 09 Sep 2021 21:29:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id g17sm3594654pfi.168.2021.09.09.21.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 21:29:21 -0700 (PDT)
Date:   Thu, 9 Sep 2021 21:29:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org, m.felsch@pengutronix.de
Subject: Re: [PATCH v5 3/3] Input: ads7846: Switch to devm initialization
Message-ID: <YTrfH3b2RjBEsFQF@google.com>
References: <20210907200726.2034962-1-daniel@zonque.org>
 <20210907200726.2034962-4-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907200726.2034962-4-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

On Tue, Sep 07, 2021 at 10:07:26PM +0200, Daniel Mack wrote:
> @@ -1392,7 +1392,7 @@ static int ads7846_probe(struct spi_device *spi)
>  
>  	err = sysfs_create_group(&dev->kobj, &ads784x_attr_group);
>  	if (err)
> -		goto err_remove_hwmon;
> +		return err;

There is devm_device_add_group() that does what is needed.

Also setting up input device's parent is no longer needed when
devm_input_allocate_device() is used.

I adjusted both, and applied, thank you.

-- 
Dmitry
