Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0EED1AF4F7
	for <lists+linux-input@lfdr.de>; Sat, 18 Apr 2020 22:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726850AbgDRUmZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Apr 2020 16:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgDRUmY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Apr 2020 16:42:24 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5BE1C061A0C
        for <linux-input@vger.kernel.org>; Sat, 18 Apr 2020 13:42:24 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id h11so2388890plr.11
        for <linux-input@vger.kernel.org>; Sat, 18 Apr 2020 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xWTSjyhXxBMoJ/WbGMybRP7zBr9vUx6vEk0OQtwopCM=;
        b=I0fx3rPwyfp2HKwH1glIcbYVHbDUHYYRmwmg1VuCW4VG5PFjnx+1MhcoxN16QWMiBz
         2dpZPvlsiu81BIdAVVrjWBUKNpGA2Z556Tlp+Gb5I4IHfQecllpWRp27MTtEKQTfysAZ
         JqjegMWgNciMWqLaKL2fAC9orb/3I5zJ9YyyUin0was1KSr2LbLMLdzPCOrZb5eleUv7
         ar3bFbkrDoQXDgSQy7aAI+A8hlCw38uLd3qteJywlZmRjAScZlttdbNnPZyu9Pna2Y2Y
         sFbndFFmCKWx3U+a/2sneRazr3zLTF5o+zGt15dcVYn65Gg4Q0lF3ON9MHOCQL3lOCW3
         Qmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xWTSjyhXxBMoJ/WbGMybRP7zBr9vUx6vEk0OQtwopCM=;
        b=ZbcEwEiKYShrXLbTHGqYaMwyUeHzrAFFDAt0/AVFe4cxtUMSfqLUfKkCu0cJ5WlWnD
         ICvSq+1oNagpoNjqldU6p6tkdkIltKm2hfPK3fNhSyhldljsXJtIoVFTpk1HQN6fsqyq
         k9R6RrIdcINzRaO2RreBaG2kt/j50wiehCQX22EYifHM6AnAf4bJon8uRELBmIxKFcRd
         XWDQ9g/nzUbllSyZ7PnlEdkSdEJx3idtLBLxM+rd2OMsDzSY/bEWCPc5C67Gzew9TJGL
         KJKrr+f9P5lhFcJWFFHQ0s+4FUfzSDtowRlR43XSNMvL+ODXpRGqi2TOInYL4cf64BA2
         kU3A==
X-Gm-Message-State: AGi0Puai4UMNXUQq/OnD+aKZmIOsblXUgMoZYLlhfd6YndW2Ey6fjIAz
        rnTzhrEHxu+y0pxeuWTh+F8=
X-Google-Smtp-Source: APiQypJt6SXR0xb9vzr9jjF7j9gLqkHEGEPRwsMUKyT0FYobNGcBrmOedPrrCetYHd1wmw9ft/pUgA==
X-Received: by 2002:a17:902:a40e:: with SMTP id p14mr9165904plq.297.1587242544121;
        Sat, 18 Apr 2020 13:42:24 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id h27sm8321527pgb.90.2020.04.18.13.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:42:23 -0700 (PDT)
Date:   Sat, 18 Apr 2020 13:42:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH RESEND] Input: Delete unused GP2AP002A00F driver
Message-ID: <20200418204221.GA166864@dtor-ws>
References: <20200417203059.8151-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417203059.8151-1-linus.walleij@linaro.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Fri, Apr 17, 2020 at 10:30:59PM +0200, Linus Walleij wrote:
> There is now an IIO driver for GP2AP002A00F and
> GP2AP002S00F in drivers/iio/light/gp2ap002.c.
> 
> Delete this driver, it is unused in the kernel tree
> and new users can make use of the IIO driver.
> 
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/input/misc/Kconfig        |  11 --
>  drivers/input/misc/Makefile       |   1 -
>  drivers/input/misc/gp2ap002a00f.c | 281 ------------------------------

Don't we need to delete include/linux/input/gp2ap002a00f.h as well? (No
need to resend if you agree, I can adjust it on my end).

Thanks.

-- 
Dmitry
