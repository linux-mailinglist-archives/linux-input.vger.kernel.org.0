Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B0C1CE227
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 20:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbgEKSBt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 14:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729305AbgEKSBs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 14:01:48 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E7DC061A0C;
        Mon, 11 May 2020 11:01:48 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id b8so4890529pgi.11;
        Mon, 11 May 2020 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pb5iXl3wqExQa7EHKjU8DmEsT4eBBS2CqQJLsRdaD14=;
        b=KAVoLNC6+GSlRUpirLvVWVPtGwMZ71VwUjs6jc7dcoCl4trDkacmzz9Kn9v6kpB9lf
         U1tPEvug6TXzL0dKSOILNf752zE7voqciELhux37RDWKutUbc2LSV8C6R/+JPH+Zjl2s
         Z4PoHEC0+0hHOxG0OFI7lPZpWt3FebKaQrXi056AE22DtTjYlEWdKocHUUtpWL3aHUaf
         mil6Jlcm0ciQRmDFXjM7QyPoNdZXgBFqzuwIeUe2utXoLdS4YP6v3n6Oe/KkcNWEc/Fy
         ncEo+nvnmnGejvOR1ippvG/Q0E5+E3g97Z4cyGGjh4GgsuY2/1j27xqQRsTlUvKxRKgx
         lZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pb5iXl3wqExQa7EHKjU8DmEsT4eBBS2CqQJLsRdaD14=;
        b=ta4kAQYBGgPCzOhhYw2BRTk8slbcLQzUhZbHQhc5ARyVP5ZjCZf/xU/cqO7J5rWyYL
         eq56w6laTOtXgy4iNgGABlmfzXKRVzEVchCULH4CjVQAmlLF/5RxtPr1Vpxagc/S+aKO
         J5QO05nxbUd+M9dXipR2nJqORkGyGj+0E59OpcZFEoKJ37KOMwkSST7rXhSdfVbMvMyj
         ytS9adnXGd/tcGxbr3/tDxe3QVyYen6C2tvpCGS3toh9RnpaqhH27z0ZzJCK4hB4Fzaj
         qJgPAgfuV8aCHAcjK2kvCGIMeC+/fAG6s6JPIEL2lZmqXBkDiYs/VL37PC9V7jBm3/a7
         Dnnw==
X-Gm-Message-State: AGi0PuafCbxwXonmAB59huA1H5l9/oAwPLjlGrd206y4ori3LIvGtlUC
        jJ4iv01bIgTXl8slqSthb0w=
X-Google-Smtp-Source: APiQypJZxKQ0c1FCkM/VXa64n95Eb4YCBB32tClFlbaRbe3jAA3i8b4SNoixF2v/MRI1AlsdV8gxCw==
X-Received: by 2002:a63:801:: with SMTP id 1mr15082540pgi.278.1589220107532;
        Mon, 11 May 2020 11:01:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 1sm9548699pff.151.2020.05.11.11.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:01:47 -0700 (PDT)
Date:   Mon, 11 May 2020 11:01:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Subject: Re: [PATCH 3/6] tty/sysrq: Allow configurable SysRq key
Message-ID: <20200511180145.GU89269@dtor-ws>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
 <20200511135918.8203-4-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511135918.8203-4-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrzej,

On Mon, May 11, 2020 at 03:59:15PM +0200, Andrzej Pietrasiewicz wrote:
> There are existing machines which don't have SysRq key, e.g. chromebooks.
> This patch allows configuring which key acts as SysRq. The value is passed
> with sysrq's module parameter.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/tty/sysrq.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 93202fc24308..ebad9799fdc0 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -604,6 +604,7 @@ EXPORT_SYMBOL(handle_sysrq);
>  
>  #ifdef CONFIG_INPUT
>  static int sysrq_reset_downtime_ms;
> +static unsigned short sysrq_key = KEY_SYSRQ;
>  
>  /* Simple translation table for the SysRq keys */
>  static const unsigned char sysrq_xlate[KEY_CNT] =
> @@ -735,10 +736,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
>  
>  		/* Simulate press and release of Alt + SysRq */
>  		input_inject_event(handle, EV_KEY, alt_code, 1);
> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
> +		input_inject_event(handle, EV_KEY, sysrq_key, 1);
>  		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>  
> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
> +		input_inject_event(handle, EV_KEY, sysrq_key, 0);
>  		input_inject_event(handle, EV_KEY, alt_code, 0);
>  		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);

Unfortunately this means that if I connect my external keyboard to
chromebook SysRq there will stop working, which is not great. If we want
to support this we need to figure out how to make this handling
per-device.

FWIW Chrome OS cheats and simply adds more keys to be handled as SysRq
without removing "classic" SysRq. But that hack is obviously not
suitable for the mainline.

Thanks.

-- 
Dmitry
