Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A85324A66
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 07:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbhBYGIi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Feb 2021 01:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbhBYGHd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Feb 2021 01:07:33 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9994C061574;
        Wed, 24 Feb 2021 22:06:40 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id gm18so2868857pjb.1;
        Wed, 24 Feb 2021 22:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gLMiJeUjalZkYJEsEztHLrMQq6aeNFOX4t5werauuzQ=;
        b=hIxtuTiEQGoKq/xG3yD7M0s/hrF1tCnTt2/HW1InQlg5pQT5sdhLbI8Ak7BIDJLKyl
         Af6inJAPRta0d7gCRSorzL7JjvZlCQAH/lv92fMFVjI1UE2edceDktb7U4FCuX3nZoex
         rU7/vw+J20r0j5pVWEIuigcugcmgZTR2lchtLyd1QwCh+7ogfNW9NPlx4dqrkdiSrES0
         Z4k4WSa4hjUHsdde6fQiUi5dby0/Kc/cY8TrZGN+D1gQnZ2bb++cwEKXzAdDv6bqhM/o
         WQGQ47xV3WDS9r3SYt40AkoGp+Mca4SJRd4K6Mbmzwh2cdkrw62ZVA9YB+QuXzugm9J1
         qNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gLMiJeUjalZkYJEsEztHLrMQq6aeNFOX4t5werauuzQ=;
        b=e/W7fh+fOMWnsK21CDjEHaVkr+17u+LdWA+FUjllozVsZu3L5dOW9+47f0HgfYQFBc
         hkUHBS+fxt1kb0fEHQW21KbJppflo6lf5buTdGD8wJzeWEV8nxRtKMcpuOwpJehLy6HI
         P4LeKFr3cUcnpzZBaBTWRcS2vPoIP/d22N2hVrJTuj8MckmJOeIs/p/znU1VRKuZQ3HJ
         m0WNdXgKzYQdaiwtBA9xfMtD36YFOdkTXLxXfe0CadP/mbUlogeObvWsH08IefI+9dd4
         CjCDucghi9HX70CUUUeaPjoVWyVQeZZaLA3wIKyIOCSDWfuNlI5JLfequrO79YhYZapV
         YrWg==
X-Gm-Message-State: AOAM532j4Qz1oi3FhvltkOTOshvlEoO+Ar7Qzgbr/dU1b4vlnzvPZBxk
        3mhMoHL93uZrDq6x2YY2PF5GEr6sbOw=
X-Google-Smtp-Source: ABdhPJwi69mKIAM2yRm71CZyl4Wj3k9RYODs1zjU2kD1s7KlLOks46kPTh7MXJkSe7PD9CcXYLXUNw==
X-Received: by 2002:a17:90b:104b:: with SMTP id gq11mr1688636pjb.80.1614233200133;
        Wed, 24 Feb 2021 22:06:40 -0800 (PST)
Received: from google.com ([2620:15c:202:201:552:720f:2933:5745])
        by smtp.gmail.com with ESMTPSA id r20sm4270752pgb.3.2021.02.24.22.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 22:06:39 -0800 (PST)
Date:   Wed, 24 Feb 2021 22:06:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06: Replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <YDc+bJCePYQF1W83@google.com>
References: <1614156206-94124-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614156206-94124-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yang,

On Wed, Feb 24, 2021 at 04:43:26PM +0800, Yang Li wrote:
> Fix the following coccicheck warning:
> ./drivers/input/touchscreen/edt-ft5x06.c:697:0-23: WARNING:
> debugfs_mode_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Thank you for the patch, however reading the coccinelle script not only
we need to change the attribute definition, but also use
debugfs_create_file_unsafe() to register it. I do not see the 2nd part
of the change in your patch...

> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 2eefbc2..12bbc58 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -694,7 +694,7 @@ static int edt_ft5x06_debugfs_mode_set(void *data, u64 mode)
>  	return retval;
>  };
>  
> -DEFINE_SIMPLE_ATTRIBUTE(debugfs_mode_fops, edt_ft5x06_debugfs_mode_get,
> +DEFINE_DEBUGFS_ATTRIBUTE(debugfs_mode_fops, edt_ft5x06_debugfs_mode_get,
>  			edt_ft5x06_debugfs_mode_set, "%llu\n");
>  
>  static ssize_t edt_ft5x06_debugfs_raw_data_read(struct file *file,
> -- 
> 1.8.3.1
> 

Thanks.

-- 
Dmitry
