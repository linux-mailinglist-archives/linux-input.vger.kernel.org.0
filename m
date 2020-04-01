Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FADC19B6E9
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 22:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732441AbgDAUXm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 16:23:42 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35874 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732385AbgDAUXm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 16:23:42 -0400
Received: by mail-pl1-f193.google.com with SMTP id g2so437597plo.3
        for <linux-input@vger.kernel.org>; Wed, 01 Apr 2020 13:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J9jFxg4FOKBKyPijq3ZWQk//durFqhEYIb9+ZwygHKM=;
        b=b6tvnUleB5bF/SgtAXanDQP2fdUbOWc6WzlA8/6GDwiFXBRtYkelmqcXdg4k8RbDnl
         smR+qoKML8p9Tr5eUMdwiAkrgP0n5AjeI0w7iGxDmpaFTRHL1P5ItA/QStzfvMd3GVt1
         h+aiAKKZqt6yhTE+7jagSuI3flWZlyQxcAe+xOrzJ8unUq8NmEo2Rr9jh4rhxFFU9qHp
         aeTNZ65IfvrinoifoIsUG1DHC/wpw8m50eWeHge5AbYBDECbWTcssy7gByPBtdLayXyX
         +TWFEOvBUsT3wpHqdru8PzD/7Kpq/ij4d0I195WzOGJOT7E//PNAqgOdCifLD8j3LKPM
         z4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J9jFxg4FOKBKyPijq3ZWQk//durFqhEYIb9+ZwygHKM=;
        b=NVnW4WzIfjXP3RDDp4NUqzcfkJWiqa85TaKeq5y+oYa/I7DRf1qBxNrEQjsmoB5A78
         WQZelR9mVABppV30zN6DmiXKwP0X2EUzkZSpsOG2327DZAq/airbdPL0OqFjAVWaFt0w
         TkCfPUmhn/tC1SUaPpJoMDO41bJP/69mwvYLbjrQmoO0PtZ3QhSijg2XcRuC/s/azTTY
         +2/8n4v+2pjwlZjpkDMBORFKeujP1qAhVaFt57Wgi4jUnzlvKECQ0ifIgvDMXomYi5wf
         X9JY21KHFkkwRMIlufIsb3rrad1HF03awyZR5XNuBL0Oj5/oxv+d25Ge/6qcIvXUxgEg
         1EJw==
X-Gm-Message-State: AGi0PuYTAlOnsHExEq72fGviBe18AdEdeV4tSctQIICYOEBk5jwbj+l7
        6ifk3vA9LedZFkPbUrXIyK0=
X-Google-Smtp-Source: APiQypLLxPwhsutTutJqg5dGtnVcZ2Rbgs6bJWvtDX9aC89WmMGUG6wH9Unu8QD3PsPvh0J5mgq6/g==
X-Received: by 2002:a17:90a:be18:: with SMTP id a24mr6590728pjs.92.1585772620526;
        Wed, 01 Apr 2020 13:23:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id ck3sm2260869pjb.44.2020.04.01.13.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 13:23:40 -0700 (PDT)
Date:   Wed, 1 Apr 2020 13:23:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add Acer Aspire 5738z to nomux list
Message-ID: <20200401202338.GM75430@dtor-ws>
References: <20200331123947.318908-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331123947.318908-1-hdegoede@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 31, 2020 at 02:39:47PM +0200, Hans de Goede wrote:
> The Acer Aspire 5738z has a button to disable (and re-enable) the
> touchpad next to the touchpad.
> 
> When this button is pressed a LED underneath indicates that the touchpad
> is disabled (and an event is send to userspace and GNOME shows its
> touchpad enabled / disable OSD thingie).
> 
> So far so good, but after re-enabling the touchpad it no longer works.
> 
> The laptop does not have an external ps2 port, so mux mode is not needed
> and disabling mux mode fixes the touchpad no longer working after toggling
> it off and back on again, so lets add this laptop model to the nomux list.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you. Also marked for stable.

> ---
>  drivers/input/serio/i8042-x86ia64io.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
> index dc974c288e88..08e919dbeb5d 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-x86ia64io.h
> @@ -530,6 +530,17 @@ static const struct dmi_system_id __initconst i8042_dmi_nomux_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo LaVie Z"),
>  		},
>  	},
> +	{
> +		/*
> +		 * Acer Aspire 5738z
> +		 * Touchpad stops working in mux mode when dis- + re-enabled
> +		 * with the touchpad enable/disable toggle hotkey
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5738"),
> +		},
> +	},
>  	{ }
>  };
>  
> -- 
> 2.26.0
> 

-- 
Dmitry
