Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A464542E10C
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 20:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhJNSWi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 14:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbhJNSWh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 14:22:37 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9585C061570;
        Thu, 14 Oct 2021 11:20:32 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso5406793pjb.1;
        Thu, 14 Oct 2021 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tVpl94ml/Bx/IZjIBe2wxz6kc0O9x/ko5fdf+Bkw9eY=;
        b=NnJI9p9ZCFqWHT7WFXYfr0jSXJ7JsvsiXdgzUBsZ7Y1DXoPZl9C+UmnPMSNB7KIQ7o
         E/DVr91QLth2rcqovMDf3BbyuFD+oF8ndmn1uk/W676ytkwcCFR29sdoGvY0E9ssrRFf
         Hr6HEWGIurOOVhlva6Y0/5Y8ZWfRhSf9IqR4T6+sKgcE8Q7oolcEl+LTT8nx8DWJhSkz
         FV6S/ajDi/BZds2eaqRJMbbzF/qYaedqLeq1QsAtU/j5jLJ0+DAgTRFqxxRp5hWIsEV+
         Ynbp6WnZ9lLTifCzpr/2LToYNUdjHcrX2k3n8YVBt/xbcxsIWQ1T77DVv3FVWpwnBv4c
         bvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tVpl94ml/Bx/IZjIBe2wxz6kc0O9x/ko5fdf+Bkw9eY=;
        b=eQm0t3yGarX4PEBrGaeUimkhwwmaqWma84mPtcKfeVRge3yO/zU+h7jL5+rO60zdMt
         hZV6z0I7I5j1KWAWl8dAY+cWLeR9BAPs4/PCv8iBHHoDRMazNb9wmCL0nYqBCSTIY2lE
         JNONr/fcqBsQ1VFoPOm/zKMe+37byKpgs1KeMnAVFt62IY2JuJpJ7xUwaX+lSCo1PjaD
         XPXdu+QXTnc7edkdtDZ9eUbc9vRo0ucBjeuZs5AYZSNnxJH4O6SPDxko9LTK9uu+Yu3+
         bw2LRdrJtBRBpBSy5hVRUTliPISPMmXKEi8+zwHqshqKA+D40xsxhwXLG5v5BcQrAhrH
         qY4A==
X-Gm-Message-State: AOAM533hu3HRL/4L2wgXqMGnOV9mS295lJLuxnOExVwF+W1Gfb5KAYm+
        JoQKjX9HAeyuxp3VCMJATLo=
X-Google-Smtp-Source: ABdhPJzZf3/GLs1psGjdo3mLRAfknuhmMmxbJeDF2+yDhN5G0rTKl5AS9cotNDMYlj2sOUaGxz+PXg==
X-Received: by 2002:a17:902:a40c:b029:12c:17cf:ab6f with SMTP id p12-20020a170902a40cb029012c17cfab6fmr6603013plq.71.1634235631986;
        Thu, 14 Oct 2021 11:20:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:9bf4:9cc1:5626:5bbc])
        by smtp.gmail.com with ESMTPSA id y17sm3151383pfn.96.2021.10.14.11.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 11:20:30 -0700 (PDT)
Date:   Thu, 14 Oct 2021 11:20:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     lianzhi chang <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWh07Lnr7WIGoLjh@google.com>
References: <20211014071627.23256-1-changlianzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014071627.23256-1-changlianzhi@uniontech.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi lianzhi,

On Thu, Oct 14, 2021 at 03:16:27PM +0800, lianzhi chang wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.
> 
> Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> ---
>  drivers/input/input.c     |  7 ++++++-
>  drivers/tty/vt/keyboard.c | 30 +++++++++++++++++++++++++++++-
>  include/linux/kbd_kern.h  |  2 ++
>  3 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index ccaeb2426385..43c09700bf68 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -25,6 +25,7 @@
>  #include <linux/rcupdate.h>
>  #include "input-compat.h"
>  #include "input-poller.h"
> +#include <linux/kbd_kern.h>
>  
>  MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
>  MODULE_DESCRIPTION("Input core");
> @@ -472,8 +473,12 @@ void input_inject_event(struct input_handle *handle,
>  
>  		rcu_read_lock();
>  		grab = rcu_dereference(dev->grab);
> -		if (!grab || grab == handle)
> +		if (!grab || grab == handle) {
>  			input_handle_event(dev, type, code, value);
> +
> +			if (type == EV_LED && code < LED_SCROLLL)
> +				update_value_ledstate(code, value);

No, we should not be putting hooks for tty/vt directly into input core.
The code in drivers/tty/vt/keyboard.c is getting all relevant input
events and should be able to keep the led state synchronized. Please
keep all the changes localized there.

Thanks.

-- 
Dmitry
