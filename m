Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493E335ABBB
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 09:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhDJHlv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 03:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhDJHlu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 03:41:50 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD00C061762
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:41:36 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id c17so5733056pfn.6
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fmmg78Sl42MbdiclrruvhikRdn3OFmqgIlFuSut1Jfc=;
        b=jlSyuQHV3VQhZ84q3Ex/INWI3E/UTA+wgW9YS5VDd7j1FBYYm5klU/QLysIhZC4nZ2
         8B8ezB1LeZs5UkBxPU1+FnBn48jK5ChTf9rlyqoTUo58kIrcWMeiqqOYZuDwIQwaZ7Cr
         rgli97Amy6ArZpLUkIXgkA9PVVHVVAmjtsNQtY+q5Sqt+Li2WnhKVNenG60kI/Rp+AX2
         N+SepGYKpfH+J4ebGG7m6u2ih09OIw62+bKAwu36I7OQY9McbYuI9btU12XvcG8wrTna
         0OTO90oB2Dbm6IomqzdsZLRTCT+lAZLhc++4Hny9OSDKzjAv+W2kMxJPlHz6LCKZy+SE
         9HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fmmg78Sl42MbdiclrruvhikRdn3OFmqgIlFuSut1Jfc=;
        b=Y30OMRm/QDnSHP138iJ2oXPjq9L2CghADsGflbJLfNhKDtipvQHicqv6iWMyVqkxDd
         MNwm7NQFbcSrPhsljqa9i+l0936hOIfpZvchqRJ/LzTMUColzP2BWXHgGNZ/AxSD6/jZ
         vRID1OhRwTQAJtYQ/iKfHYbaqVpCXR/WZ8T2OjObX0NekyQ0IGW4JFaxIGamTirv+4mS
         4EvZkaMU7oB4dOq0yc/LTE4Cb4Trzl4VuKtQrYxwldkauy1XjRNEju/CBikwW+fJ9lWG
         Bq9szLNBrt1WnY758+f2r6KWucELDKh4VrP+qRxYsID7T7Wxtlbs1GB9hM9tKba7eDfU
         bM5g==
X-Gm-Message-State: AOAM531wMECzb+mQHxJFDEmQ8pUp7SxYfOCLcC2RNwhFQeID1tttMPNX
        TxuNWrFb+BAjH81+1sZhuusur3QTk+Q=
X-Google-Smtp-Source: ABdhPJzN5ccfd/s50pKZ7s6BDx6q2loUYP8OVf9nXwixD+cd5XF8FUWIL6IqhdJEWbMY5aFeoE9YWA==
X-Received: by 2002:a05:6a00:72b:b029:218:6603:a6a9 with SMTP id 11-20020a056a00072bb02902186603a6a9mr15150053pfm.78.1618040496254;
        Sat, 10 Apr 2021 00:41:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id t205sm4491514pgb.37.2021.04.10.00.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 00:41:35 -0700 (PDT)
Date:   Sat, 10 Apr 2021 00:41:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 8/8 v3] Input: cyttsp - Flag the device properly
Message-ID: <YHFWrdYMSmnLAm2V@google.com>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
 <20210408131153.3446138-9-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408131153.3446138-9-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Thu, Apr 08, 2021 at 03:11:53PM +0200, Linus Walleij wrote:
> This device is certainly a very simple touchscreen so
> we set INPUT_MT_DIRECT.
> 
> The sibling driver for CY8CTMA140 also sets
> INPUT_MT_DROP_UNUSED and experimenting with this driver
> it clearly does not hurt: the touchscreen is working just
> fine so let's set it for this one as well.

This is not a good justification, and INPUT_MT_DROP_UNUSED is
essentially a noop if the driver does not use input_mt_sync_frame().

I dropped INPUT_MT_DROP_UNUSED from the patch and applied, but I would
appreciate a followup patch switching the driver to INPUT_MT_DROP_UNUSED
and adding input_mt_sync_frame() to cyttsp_report_tchdata() and removing
manual release of inactive slots from there (the "used" bitmap).

Thanks.

-- 
Dmitry
