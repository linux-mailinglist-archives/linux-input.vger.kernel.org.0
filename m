Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4342AB123
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgKIGRE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIGRE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:17:04 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352F4C0613CF;
        Sun,  8 Nov 2020 22:17:03 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id u2so4209926pls.10;
        Sun, 08 Nov 2020 22:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fJkt5w8YHserwDljB0ksv/8qO8ONh2Ty6PEvhBrLLy8=;
        b=MI9igAEG47w4JxkXOkUdS+urCmo8faaNCC7lV+iyVZFPSv0/aedjZYoYLDtO0empDp
         2Q29cnePueEtdxMe7IR+jqQlVaDLg+mfjDGPsWfvCb5LX8wtuwC5Xv6FZm7gc25e6TwO
         i1/XW9cmGsoSoXNPRdj1Id3iCPO7B4RRA0h+HxuvsUhNS7uL08NgoummjOudpVnBdwlx
         jQSQEZyYY2ZRhYInp+HbKnLgh8c/DMIP7QkoRcz18BkUs6BFAHrwG0a3Af4XfgiV/aw1
         6juamAuph14KOpzY9hRoOevZCg9hXE89flVMnZVpNkFuDNx33SvgSD+dbJVXrSHKNbGm
         LyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fJkt5w8YHserwDljB0ksv/8qO8ONh2Ty6PEvhBrLLy8=;
        b=CIuMXvau9NWpSXP32xpoYSBCJfklQ8zbXypnldTqfJ1eDOVuRvrHQHQ6z5NCFxF1VJ
         cKsbNp05E5f07qYKL2VjCPx4jXolmUvfQWKP6grtRcCtrEzEi1wi136XbGdhGofql+g2
         PkhVfvh4n/vaDWO9ef/anqsmVFt+6+h7No1ExF93wrcb9q53jMPHRUfWTjlFnQ2M8JIm
         8DfgSD+cR57ajHf241mm2HopwqIDJg3iUrhmtq1cNhKaSkyV7lYVecxeoVfqxc83/OWZ
         Zkth75YeeG2p3T9HSZ/TSvodpeVIpmpHYLesD5V3atCsH5ZiVWmjVTdrYNRQIyKe27+D
         VrPg==
X-Gm-Message-State: AOAM53157fijHE429LfXdnjdSwW98R3cOQs7y8JBsXPPoVTKtut+rxDw
        FzkF5n1tIS+zmHE0lhWOQOA=
X-Google-Smtp-Source: ABdhPJyFGGSMtpbIhosFah+cp8m7lqZK5li1VH/DVIkfjYPlITi6N5Vz1oetEAQQ8Qr/z5Dajy4lKA==
X-Received: by 2002:a17:902:ba8b:b029:d7:e6da:cd21 with SMTP id k11-20020a170902ba8bb02900d7e6dacd21mr2040175pls.38.1604902622756;
        Sun, 08 Nov 2020 22:17:02 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g15sm8960506pgi.89.2020.11.08.22.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:17:02 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:17:00 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 18/20] input: misc: drv2667: Fix formatting and add
 missing member docs
Message-ID: <20201109061700.GK1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-19-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-19-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:25PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'input_dev' not described in 'drv2667_data'
>  drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'client' not described in 'drv2667_data'
>  drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'regmap' not described in 'drv2667_data'
>  drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'work' not described in 'drv2667_data'
>  drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'regulator' not described in 'drv2667_data'
>  drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'page' not described in 'drv2667_data'
>  drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'magnitude' not described in 'drv2667_data'
>  drivers/input/misc/drv2667.c:109: warning: Function parameter or member 'frequency' not described in 'drv2667_data'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
