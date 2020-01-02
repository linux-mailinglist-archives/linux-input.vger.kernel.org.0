Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9FAC12F1A3
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2020 00:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgABXKx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Jan 2020 18:10:53 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37934 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgABXKw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Jan 2020 18:10:52 -0500
Received: by mail-pf1-f196.google.com with SMTP id x185so22722723pfc.5;
        Thu, 02 Jan 2020 15:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XvwcmHPY3xBaQylUvcjtExsV2WDnCVvAIv7xx9ewrvM=;
        b=Dxzt9YBu8oeqt/j6Eu0JWQqyuJpR1+jeacinGdmNDZ55iC+LG4UjhokanjOyB7djcv
         geMioTAVEbQE9/T2CnfB1uC6yhOIdBiSuG/B7l+cQofZpSrpM557p9rkGNqcWPZab8Ig
         +1ebPWNDYNQmkFDR9tkxM9eIGDUPrFPRJmj8Rm+jXl7qidwDeiCvubseh2nXSFH5PGEb
         HLRPzti/U8fNr2E0GZIssYCmTuhQlidCgB2H4vA/5QPULPRdrVKlHtS/SjV+2V5zQ7oF
         TeV0LbwWuJD5LlVMwM4rlBKOVjWUqWy9/p5CXWmUTAQuBuU42eBFqWi2PYwWI7AJ/NKf
         E3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XvwcmHPY3xBaQylUvcjtExsV2WDnCVvAIv7xx9ewrvM=;
        b=eurR/17qAh0CYFHkRujVpJ07glYacBvSAYTAUqgsqGoDAgCBkWjLxW5jc6TjB4xGzY
         /86/50gBWDSGYPrI1DScZVmAhsezTwIZzB2fTggUs8bv+deLbIdEHpyXdVINOl5L1YpT
         ojPX52SEM8WjwYdjXShpsVcgXaTmQ6pUZkPKl7VT3qJe8ixeCQFlmCLaGbuk0tN1bX2c
         qpQGpSyeIJttPWh/uTU/rOxr+sI2c8ALD6lbqIOdBnVyPZoUc80bMlnyJRL3ezomwwli
         sHEwsv89Z6V2Ll/lXyXVXc3p35P65hca7m9OgzDRLq4OVFHot5F+1QgdpGTrjRtL6Wvd
         uIIg==
X-Gm-Message-State: APjAAAVZxgMUrk/FK+Hq1u0AtKQLNrhfnuBnUcHqeBnjZl2uqySk28Nq
        JQXp6cGOLsO8pVoYtzmplC0=
X-Google-Smtp-Source: APXvYqwSvmaLX95NvO8LIdQ8euTG4ZVQh7OZlfvKpWGv4sL/HQeB/U+QZ/AKjl2E0D+b412ohrAgew==
X-Received: by 2002:a63:e4b:: with SMTP id 11mr92876003pgo.5.1578006651943;
        Thu, 02 Jan 2020 15:10:51 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c1sm66249432pfa.51.2020.01.02.15.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 15:10:51 -0800 (PST)
Date:   Thu, 2 Jan 2020 15:10:49 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH] Input: evdev - convert kzalloc()/vzalloc() to kvzalloc()
Message-ID: <20200102231049.GD8314@dtor-ws>
References: <20191118054727.31045-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118054727.31045-1-miles.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 18, 2019 at 01:47:27PM +0800, Miles Chen wrote:
> We observed a large(order-3) allocation in evdev_open() and it may
> cause an OOM kenrel panic in kzalloc(), before we getting to the
> vzalloc() fallback.
> 
> Fix it by converting kzalloc()/vzalloc() to kvzalloc() to avoid the
> OOM killer logic as we have a vmalloc fallback.
> 
> InputReader invoked oom-killer: gfp_mask=0x240c2c0
> (GFP_KERNEL|__GFP_NOWARN|__GFP_COMP|__GFP_ZERO), nodemask=0, order=3,
> oom_score_adj=-900
> ...
> (dump_backtrace) from (show_stack+0x18/0x1c)
> (show_stack) from (dump_stack+0x94/0xa8)
> (dump_stack) from (dump_header+0x7c/0xe4)
> (dump_header) from (out_of_memory+0x334/0x348)
> (out_of_memory) from (__alloc_pages_nodemask+0xe9c/0xeb8)
> (__alloc_pages_nodemask) from (kmalloc_order_trace+0x34/0x128)
> (kmalloc_order_trace) from (__kmalloc+0x258/0x36c)
> (__kmalloc) from (evdev_open+0x5c/0x17c)
> (evdev_open) from (chrdev_open+0x100/0x204)
> (chrdev_open) from (do_dentry_open+0x21c/0x354)
> (do_dentry_open) from (vfs_open+0x58/0x84)
> (vfs_open) from (path_openat+0x640/0xc98)
> (path_openat) from (do_filp_open+0x78/0x11c)
> (do_filp_open) from (do_sys_open+0x130/0x244)
> (do_sys_open) from (SyS_openat+0x14/0x18)
> (SyS_openat) from (__sys_trace_return+0x0/0x10)
> ...
> Normal: 12488*4kB (UMEH) 6984*8kB (UMEH) 2101*16kB (UMEH) 0*32kB
> 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 139440kB
> HighMem: 206*4kB (H) 131*8kB (H) 42*16kB (H) 2*32kB (H) 0*64kB
> 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 2608kB
> ...
> Kernel panic - not syncing: Out of memory and no killable processes...
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Applied, thank you.

> ---
>  drivers/input/evdev.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index d7dd6fcf2db0..cf5d7d63fd48 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -484,10 +484,7 @@ static int evdev_open(struct inode *inode, struct file *file)
>  	struct evdev_client *client;
>  	int error;
>  
> -	client = kzalloc(struct_size(client, buffer, bufsize),
> -			 GFP_KERNEL | __GFP_NOWARN);
> -	if (!client)
> -		client = vzalloc(struct_size(client, buffer, bufsize));
> +	client = kvzalloc(struct_size(client, buffer, bufsize), GFP_KERNEL);
>  	if (!client)
>  		return -ENOMEM;
>  
> -- 
> 2.18.0

-- 
Dmitry
