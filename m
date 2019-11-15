Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389BBFE5B2
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 20:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfKOTel (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 14:34:41 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41798 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfKOTek (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 14:34:40 -0500
Received: by mail-pf1-f193.google.com with SMTP id p26so7147212pfq.8;
        Fri, 15 Nov 2019 11:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KxszWDeOWGIWijBL9B0pmi+TzXGhcCKiCV88GoXmYts=;
        b=ix9xhWelBDVLrmeaMb833ads5aVSS8YENH9KOhh4LTYGmwVVhT3RyGN0CXYfbMgFib
         FNru40g4F2quB7EAzfQoMZqboPGsJXOQiTeg3IUR9MvC1OPcIE55VwvU3TKyx35ZJY4H
         xAAh6H1XqCZ+b/aJiP8MAtJCe/Zk4+jNu2xoqmGxoxsJVaWYjVrwb4ALKToqxKcVx+6u
         D0RbPtxcufW8zyAjbHQhcf1zu7Mv4o37Y1u55m1mdTrNdGo3cFK2yMjKd9VjQxKTLNde
         euS1YxNbjiP6M4QxNEcrRaEH2aq8OEOt0oVno5MXuzwHkH8Yv81bh91k4L+0C1Dz6pJj
         e+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KxszWDeOWGIWijBL9B0pmi+TzXGhcCKiCV88GoXmYts=;
        b=TBkfWN+fgarbjFemuc+Ih+VninOxWvlQq51QT74FW88hmM76nCoQwmoqa8X5hblRvP
         yUGPIN/F3Yb3WsQ4QcCCpDQgzqX2xa//tjb5hNrdbi6DWqlwBcQQaKsL5SNrWPaXmqqq
         eyeGKLsQNeH9zXFRPA54s4OhDyrbEDu61rMGsCB16TLylEJi+cwGO40oBmHRXXSizqKk
         XnaxkB6GJ3C+PZ6bPIYUy1ZftCXru2/jfB1xYq7XgfWMZYTNkbAcul9mlDt9E988qxBL
         Q6wEWdTUTRYYNEm+o9mTZyp4U4r8NHTo4Awt2gotRIYldpp6YOrnSUoGBgrEaGDRAkpO
         iG5A==
X-Gm-Message-State: APjAAAUX9o+PRDW2aFbTS7zVYFKo9mm5Np44WP3erBDA1h8mk6pA44Nl
        /LtvySS+v13TT+BMGL+8HtQ=
X-Google-Smtp-Source: APXvYqwRG6vw52uUe5HQdn6dIY5Z9EccMoKVImiOfsEmWVxZNIwL/19Lgb1GiwMkKmO/xOPS3BRpXw==
X-Received: by 2002:a63:e407:: with SMTP id a7mr17566589pgi.92.1573846478340;
        Fri, 15 Nov 2019 11:34:38 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 12sm11435882pjm.11.2019.11.15.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:34:37 -0800 (PST)
Date:   Fri, 15 Nov 2019 11:34:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh@kernel.org, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH] Input: keyboard - imx_sc: Correct SCU message structure
 to avoid stack corruption
Message-ID: <20191115193435.GV13374@dtor-ws>
References: <1573730499-2224-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573730499-2224-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 14, 2019 at 07:21:39PM +0800, Anson Huang wrote:
> The SCU message's data field used for receiving response data
> from SCU should be 32-bit width, as SCU will send back 32-bit
> width data, correct it to avoid kernel panic of stack protection
> when CONFIG_CC_HAVE_STACKPROTECTOR_SYSREG is enabled.
> 
> [    1.950768] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted
> [    1.980607] Workqueue: events imx_sc_check_for_events
> [    1.985657] Call trace:
> [    1.988104]  dump_backtrace+0x0/0x140
> [    1.991768]  show_stack+0x14/0x20
> [    1.995090]  dump_stack+0xb4/0xf8
> [    1.998407]  panic+0x158/0x324
> [    2.001463]  print_tainted+0x0/0xa8
> [    2.004950]  imx_sc_check_for_events+0x18c/0x190
> [    2.009569]  process_one_work+0x198/0x320
> [    2.013579]  worker_thread+0x48/0x420
> [    2.017252]  kthread+0xf0/0x120
> [    2.020394]  ret_from_fork+0x10/0x18
> [    2.023977] SMP: stopping secondary CPUs
> [    2.027901] Kernel Offset: disabled
> [    2.031391] CPU features: 0x0002,2100600c
> [    2.035401] Memory Limit: none
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/imx_sc_key.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> index dd57daa..5379952 100644
> --- a/drivers/input/keyboard/imx_sc_key.c
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -35,7 +35,7 @@ struct imx_key_drv_data {
>  
>  struct imx_sc_msg_key {
>  	struct imx_sc_rpc_msg hdr;
> -	u8 state;
> +	u32 state;
>  };
>  
>  static int imx_sc_key_notify(struct notifier_block *nb,
> -- 
> 2.7.4
> 

-- 
Dmitry
