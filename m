Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAF86795D
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 10:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfGMIvV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 04:51:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38638 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbfGMIvV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 04:51:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id y15so5342292pfn.5;
        Sat, 13 Jul 2019 01:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=utzqHI/cp2sxXHHGSJtE6rG6UN4H5LVvwlzG1e0NnIk=;
        b=E3e+fGOf5WzyVMJK1i+OYcPdsS2KXoHwHWjszu7ucgYn0PRi/OMCFTFabGi6a23ahM
         PzJRp4d3fKtQZWmA1FRDZ7dESPYI59Fv82teDcusq5D5zVPMzm3RzILxuGk9RSddhqqd
         kqY90nA/Au2rXE7lL4S0XAnId+95PJw21xznabcrNbEL3Lptz3/JZOj6xT0AD/z15qyY
         TVj+Ni4tNQi2f4w3qFX1VLJcDotf0qeE7sXT8oW3IVqAWOOV3d2RATUIgy3i3WeCoZc3
         wJrfWW3kJ7czhNCdvGeEvttjkBxCBdgsRGcdkMAtAOWDQf/aJQ5aG3ynuJHzg4nJasaQ
         fs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=utzqHI/cp2sxXHHGSJtE6rG6UN4H5LVvwlzG1e0NnIk=;
        b=jkwkPv5U6ONRl04KPMk11B/dTm12Ah2CY8X+WUPJSwIfxswqnAh3BtWLoaVCClWknE
         Cz3+//rrBVJVH1n9dQ5O12tUEpdZzK4aAyqnX9ryLqAhqcuRin/sxSqQWzGjhR2TZEtQ
         vyMIn9btZs0SfvpBlJNLFeKr/PIChoYRtnEI8dT7SAZ9tFMk3Ymrr5B0OZQxtKE9r7qR
         mms5Zl8Bf//213I0wiRR0x6g6pYsDAqEVsFwEGsjw9Xktt5AksPb6bnUxptnupKguHd7
         FlckpNNXbHJpAXWP/gX5XJYEdAIPWldp5l3V0riMLqQPpwrDfwl/ZhXVPcVDbhDrMNdW
         hwfg==
X-Gm-Message-State: APjAAAWy6v/bLnvCln3LAX8NAccgJP7RNPLlLrYs2vL16g6hgSSMrTmk
        rlv+2qxUrw8/QuF+7kk90rJL/CO4epQ=
X-Google-Smtp-Source: APXvYqxmq45qH96VXdn42xcNhEqaSMbKfT5R1+v/3U2FGrnBJZAJdld7abkVTuArK0Z4Gnx7+VszRw==
X-Received: by 2002:a17:90a:26ef:: with SMTP id m102mr16955113pje.50.1563007880477;
        Sat, 13 Jul 2019 01:51:20 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a21sm13724324pfi.27.2019.07.13.01.51.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 01:51:20 -0700 (PDT)
Date:   Sat, 13 Jul 2019 01:51:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/14] Input: elan_i2c - Replace devm_add_action()
 followed by failure action with devm_add_action_or_reset()
Message-ID: <20190713085118.GB103820@dtor-ws>
References: <20190708123332.11989-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708123332.11989-1-huangfq.daxian@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 08, 2019 at 08:33:32PM +0800, Fuqian Huang wrote:
> devm_add_action_or_reset() is introduced as a helper function which 
> internally calls devm_add_action(). If devm_add_action() fails 
> then it will execute the action mentioned and return the error code.
> This reduce source code size (avoid writing the action twice) 
> and reduce the likelyhood of bugs.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index 420efaab3860..a8d4f3bd09bf 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -1234,9 +1234,8 @@ static int elan_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> -	error = devm_add_action(dev, elan_remove_sysfs_groups, data);
> +	error = devm_add_action_or_reset(dev, elan_remove_sysfs_groups, data);

Actually, the driver should use devm_device_add_groups() and then we do
not need custom cleanup action, I posted a patch for that.

>  	if (error) {
> -		elan_remove_sysfs_groups(data);
>  		dev_err(dev, "Failed to add sysfs cleanup action: %d\n",
>  			error);
>  		return error;
> -- 
> 2.11.0
> 

Thanks.

-- 
Dmitry
