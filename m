Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40DCD24757
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 07:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfEUFK4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 01:10:56 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34642 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfEUFK4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 01:10:56 -0400
Received: by mail-pg1-f193.google.com with SMTP id c13so7941828pgt.1;
        Mon, 20 May 2019 22:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kkYf01LP30D0utff0lCbSD9SE0YxlVSxUd1EAcLYvc8=;
        b=LCLUrf7sui2JKRW/Qltay9QC1x2pVc+Uz85WQs4219VP/xPAbA/hoLgDMVRQ0r4zuQ
         6K8wDOwa8M3LLzl6e9FHGxsBtUotficZXju6A+QoBflNw2jgm7gKTiT+MyT4Cf35n4+F
         V7Qm0dqQoLHAfA7PfHyLRG+WyLq4a07rkZm6UxamQaF39TAkk3KqbR0g8sv0UQVijkxg
         y4sDxHAOMNBB0MgagXUZJkqzlMU6ES5dDHYEn69jrjlEzg/OHzhDnQ1cDWtRRw4+yeP8
         j6r5n0IgoJwjl0g80CPVZ55rVgBKtLJWbE9A5EsBBRPQwSE5GkaTwjkdiaZxJteYuNBP
         YvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kkYf01LP30D0utff0lCbSD9SE0YxlVSxUd1EAcLYvc8=;
        b=F4+l4VFN99GTHOcRr5eKe9l/KWIX6WbN6sNbbdXxEFx2QO6+oUpoUD8OUxOBEa9gNi
         KJLOSkK9WeK3d0kSF4wDaAow4DJv4Jr1Ksr/9QKwPl926r5V70fPo3MUZdHEywZYXajM
         sKXHKdDU4+sJxz+7u5mnFzrqI/4nRsLF4A2Ks8Cbu4XeIVjYKmLNX5+FA7b3D8by6Qsh
         ylRbFSnEVW7PZaaBL0lc+v08vSgeqx3cWVCCq3NiMKCfLY/QH5qgg6agU14LzFHePhLa
         Ek0jxRfiiwFtPmxk15w0mdsO7Mx4LwxVBJbRz3W3puCFTcqPRohXrK27CV8Li6txPN82
         CAzw==
X-Gm-Message-State: APjAAAXtm3ctRC0mv+0KtBodm2bqyFipoF4hpWKX9aOvBVOJtoMwce0D
        u1fxOvBtQGQ8Y7kkzvRptug=
X-Google-Smtp-Source: APXvYqwzDjoHq9UMC7IKLfv10YND8GWx2ezpPdI3vOzDtVAH7e0zhDrdkPtpH3J+fhhiTxtoTh6WLA==
X-Received: by 2002:a63:d4c:: with SMTP id 12mr66792569pgn.30.1558415455889;
        Mon, 20 May 2019 22:10:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v64sm24503777pfv.106.2019.05.20.22.10.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 22:10:55 -0700 (PDT)
Date:   Mon, 20 May 2019 22:10:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Aaron Ma <aaron.ma@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH 1/2] Input: elantech - enable middle button support on 2
 ThinkPads
Message-ID: <20190521051053.GD183429@dtor-ws>
References: <20190519072711.2592-1-aaron.ma@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190519072711.2592-1-aaron.ma@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Aaron,

On Sun, May 19, 2019 at 03:27:10PM +0800, Aaron Ma wrote:
> Adding 2 new touchpad PNPIDs to enable middle button support.

Could you add their names in the comments please?

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/input/mouse/elantech.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index a7f8b1614559..530142b5a115 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1189,6 +1189,8 @@ static const char * const middle_button_pnp_ids[] = {
>  	"LEN2132", /* ThinkPad P52 */
>  	"LEN2133", /* ThinkPad P72 w/ NFC */
>  	"LEN2134", /* ThinkPad P72 */
> +	"LEN0407",
> +	"LEN0408",

These should come first - I'd like to keep the list sorted
alphabetically.

>  	NULL
>  };
>  
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
