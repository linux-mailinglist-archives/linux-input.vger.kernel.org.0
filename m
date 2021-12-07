Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C75346B3F0
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 08:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhLGHe7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 02:34:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbhLGHe7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Dec 2021 02:34:59 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BF1C061746
        for <linux-input@vger.kernel.org>; Mon,  6 Dec 2021 23:31:29 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id r130so12647362pfc.1
        for <linux-input@vger.kernel.org>; Mon, 06 Dec 2021 23:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6nLvbjupngxfBXZ8TAXmJA0YBCO+Y2SDz7EjIW0Fu+k=;
        b=VJIoq6JdVluONsjF/m9VV3Q0Fp/5hWzaypGIScCwr9bV3edZZBi0dxzzfh9lGY5zkv
         9MIjuR/tkD/QVaXRpEyLqryBiarmMKBxjMgovJZuT5gBHlYgaYOuRL3u/64eQQq+C59g
         y4nGMoVIJ9A2vMc1I0uNbb6rfs+xjif5U1OCVRLFuohmO5o6/h0EKPWxVTuyWb8BnvHo
         T68iW2V2woIiI5oTxeC9SnfXSo71OaanOdTLEenNcUNK3OUeXF8qBecpk5z+wIWmjQ3w
         hZXKEqghcS5vEjrexja+Hrf+KG9sGwA+1EBWssrCc7ZuNLpopkPmlzvZRDnS2gGA+UHB
         1ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6nLvbjupngxfBXZ8TAXmJA0YBCO+Y2SDz7EjIW0Fu+k=;
        b=ZLeRmN0P5uLPF3VWEeVEGt0s49+vSOllmESjv9S3UME8yK4ecH3r4iToS8QsZvadIy
         WdWl6ShQK/11xccPa2I5xS34VHA14FZzzqRgNK60wuL33p48z0JERx7QVUwDO1C80KUZ
         J85WDENPe+HDI+1JlpTLLheD8nEgpbM4PXy3tG6VP2mh3OGN3c07A7zpeWf3nZQVrjSf
         C6VJD6HOMP/+oGhG6J0xtdYOs1A1uKkIkMGjD7cIl+hv8b5nZojwNGnBVV3TLbLzU2Hx
         26b+ZuGBk+rJ06nu0rVXCecSjhGyER8TnCKB45DlGzpnhgvg9HbY3qkHHmin4KRiL3Xo
         H27Q==
X-Gm-Message-State: AOAM532uzFQLFsU4qq3qfom1yp1eFRR3FOOflpLnx6IUEVTEYIPpoKsE
        70kwxtlZCyUURAfxsEGigi0=
X-Google-Smtp-Source: ABdhPJzSNL/ZzhpznVPOTreVYXLXk3xhebtJJXjgcEVHq6+VuajBYS18F7GSayTp7xhTRHMbUYIFNA==
X-Received: by 2002:a05:6a00:2349:b0:4a8:d87:e8ad with SMTP id j9-20020a056a00234900b004a80d87e8admr41456844pfj.15.1638862289163;
        Mon, 06 Dec 2021 23:31:29 -0800 (PST)
Received: from google.com ([2620:15c:202:201:25b0:d110:b844:ea00])
        by smtp.gmail.com with ESMTPSA id h6sm16218504pfh.82.2021.12.06.23.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 23:31:28 -0800 (PST)
Date:   Mon, 6 Dec 2021 23:31:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/4] Input: goodix - Improve gpiod_get() error logging
Message-ID: <Ya8Nzkh+VwcQCUIi@google.com>
References: <20211206164747.197309-1-hdegoede@redhat.com>
 <20211206164747.197309-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206164747.197309-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Mon, Dec 06, 2021 at 05:47:45PM +0100, Hans de Goede wrote:
> goodix_get_gpio_config() errors are fatal (abort probe()) so log them
> at KERN_ERR level rather then as debug messages.
> 
> This change uses dev_err_probe() to automatically suppress the errors
> in case of -EPROBE_DEFER.

I really believe that dev_err_probe() is wrong API as the providers
should be setting the reason for deferred probe failures.

Could you simply swap dev_dbg() for dev_err()?

Thanks.

-- 
Dmitry
