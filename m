Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 080422474E
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 07:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbfEUFIy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 01:08:54 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46848 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfEUFIx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 01:08:53 -0400
Received: by mail-pg1-f193.google.com with SMTP id t187so7910353pgb.13;
        Mon, 20 May 2019 22:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VwtARzhW3+sPdMjQOjr/C1t0rhZF0SWvbxbWPmuVoyg=;
        b=NiJ12r3goSlAJ5AU3US3+PLlOvf87cKeGJI0W5OTXtLx1+1EVhWn7qkmF1nKCjJXFu
         z9qzDzRjTW+5z9sv2adaLcO+WancpcEj9h15n2Atm9lO0lteEcKRgvgU9p3ICqgPeLcv
         lXqyV4YCCatklDZYvQ4pI1eZu2oIOrs0vyiaTOl+Y4pwYcXTcDzV9ufN+Mx6mqxqcxrT
         VQRXUgHnJJITVHPMFmySI7TLz4HLUDx5PYlVoUTHzW8LR+aFu8exAndsjBju8Pb46f5R
         GEm441/wb4FCpe7S/cl3t7Dzth0S5V6FLg6gqfnZirICecfnGo8+kZzkDO/W8Fe5aAqn
         1SEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VwtARzhW3+sPdMjQOjr/C1t0rhZF0SWvbxbWPmuVoyg=;
        b=mFqKkIh1quJ9jqJqN3A/OYHwSVH0Mcyg2PnSQhXfYEwVFnMbzIuUk2Z6kQpjvXePyQ
         mKKr315srPtRx9mlpqFoEqBbtdWgVjvGpY9p5DVfq1SZU9i9DWuOfH2zVaQnhRV1jar8
         Ytvgn/Ad2C8J9r2l8U16U0O478GX4pmZ+0Lipw9w8FOeQeueloQeegRxt4VdFmCjprPl
         CZkddlnnC07aiE6TqQhbY3wVejWGx30S6q7vZ3+fuNlvzqldm8QjfL/EVMOATLvFp1Br
         eqMoZDBQd4A+O3zBfTCND9kefrvR1TD3ABobaY2mJBT1ykTxbnJhk1ICOp652x2WIUfd
         AhdA==
X-Gm-Message-State: APjAAAUS5je0KIpZfuSwWzTnuDPv1Oef4Ckonli3iUttNud0Kn+D0gjb
        /pxjNSB1V4coT0WhDz+MMOw=
X-Google-Smtp-Source: APXvYqz8gQSiTliAkp9vaI2NahFrwbqkJagUaapPaIxuAEI95RogQrRP4MS5iDrUZBQLpSr1K194lw==
X-Received: by 2002:a63:7d18:: with SMTP id y24mr66189590pgc.101.1558415332831;
        Mon, 20 May 2019 22:08:52 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y10sm29529103pff.4.2019.05.20.22.08.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 22:08:52 -0700 (PDT)
Date:   Mon, 20 May 2019 22:08:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Aaron Ma <aaron.ma@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com,
        Christopher Heiny <Cheiny@synaptics.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] Input: synaptics - remove X240 from the topbuttonpad
 list
Message-ID: <20190521050850.GC183429@dtor-ws>
References: <20190519072711.2592-1-aaron.ma@canonical.com>
 <20190519072711.2592-2-aaron.ma@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190519072711.2592-2-aaron.ma@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Aaron,

On Sun, May 19, 2019 at 03:27:11PM +0800, Aaron Ma wrote:
> Lenovo ThinkPad X240 does not have the top software button.
> When this wrong ID in top button list, smbus mode will fail to probe,
> so keep it working at PS2 mode.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/input/mouse/synaptics.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index b6da0c1267e3..6ae7bc92476b 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -140,7 +140,6 @@ static const char * const topbuttonpad_pnp_ids[] = {
>  	"LEN002E",
>  	"LEN0033", /* Helix */
>  	"LEN0034", /* T431s, L440, L540, T540, W540, X1 Carbon 2nd */
> -	"LEN0035", /* X240 */

According to the history this came from Synaptics through Hans, so I'd
like to make sure there are no several X240 versions floating around...

>  	"LEN0036", /* T440 */
>  	"LEN0037", /* X1 Carbon 2nd */
>  	"LEN0038",
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
