Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9ED3D4A8F
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 01:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhGXW1g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 18:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhGXW1g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 18:27:36 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89C7C061575;
        Sat, 24 Jul 2021 16:08:06 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id i1so7323028plr.9;
        Sat, 24 Jul 2021 16:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WdebXrH85o+8zWEjcgZzEgIqVLFXxqV+JxAWcNA0IFA=;
        b=X2WzRRoGIloEKx2dAvGcYkBsodA4wmgjDK2TXcd3kqwxEPXei5lZWZG9FH2dlfI0Cm
         tw3N9wLT1uwc0IKoQfCoyRmd4d76Pj1HqNoOFoMtmHRkKwXaruzp8dC6ZvCVSaEgS+gh
         pJhd4jXA4QqzVBeBl/AdGmBgL3pGdGv/KLVf5NoBqVyUxCiYr/N3oo0M3M2plAJtkd2u
         72rA+TCVrTweL0rows6Dc/EcPWzLFuK7ujvAmoQJksXnEKQD/IvP7gHFyBUGrxMsj3bt
         1Dg2ASPC+5EJ1RS9dW17jpAFgn2gJsOgYEnDaZjL2sMndYM/cYnrw3rWM6b1HjABgLEj
         LJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WdebXrH85o+8zWEjcgZzEgIqVLFXxqV+JxAWcNA0IFA=;
        b=b+aqgX2pSpXIMhYo8YAxFJl1hh2AWVCyOgSITc3IRskh0qqNa+8pkKg9YBbHly0EZk
         UIbyDhOTq6JHbx14bJIBE3SMJLKV0T5kxqEvlCGs5nXi7G8agc2FlXfAKfvzh6WuFrv/
         giDvtPQw4roLp6k3PqOD0IAF4sU1B+Ta8OhPqLFoKu4aQzp13pCzZ74DaV3eU8ZJmJdu
         Rqx9Xx0sevX5F+Yu8/j4x4nv9WKoK1reM/Vaap2vzT/FcoRp8ToxJObDchVhyqRc5iHI
         AhR+50BVufaQlF2Vxiwl9zCTY7EZP0MoR5ytQfPVuZplHtNiUUwR0cO54awx6R54Fclf
         7sxg==
X-Gm-Message-State: AOAM530tCr5TzM/fA35f0lDOpSC0v2KaSw7cbFaPDwoXBd46MN8qZgM1
        8lDlk9iLDJOWIlFpVyfsYQw=
X-Google-Smtp-Source: ABdhPJzUvQSELAk5zDs3g/KIUgrh9tMUA7tT0Dy2Z2jetONHobeXJ7Fv8fBiGid9YQjm1DMDu5vZOg==
X-Received: by 2002:a17:902:9685:b029:ef:70fd:a5a2 with SMTP id n5-20020a1709029685b02900ef70fda5a2mr8870471plp.20.1627168086035;
        Sat, 24 Jul 2021 16:08:06 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4140:52d7:8bcf:971d])
        by smtp.gmail.com with ESMTPSA id m34sm43686809pgb.85.2021.07.24.16.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 16:08:04 -0700 (PDT)
Date:   Sat, 24 Jul 2021 16:08:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: powermate: update the reference count of the usb
 interface structure
Message-ID: <YPydUp9vc5U7vGIw@google.com>
References: <20210724212016.GA568154@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724212016.GA568154@pc>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sat, Jul 24, 2021 at 10:20:16PM +0100, Salah Triki wrote:
> Use usb_get_intf() and usb_put_intf() in order to update the reference
> count of the usb interface structure.

This is quite pointless as the driver will be unbound from the interface
before interface is deleted.

> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/input/misc/powermate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
> index c4e0e1886061..69dc3347478a 100644
> --- a/drivers/input/misc/powermate.c
> +++ b/drivers/input/misc/powermate.c
> @@ -337,7 +337,7 @@ static int powermate_probe(struct usb_interface *intf, const struct usb_device_i
>  		goto fail3;
>  
>  	pm->udev = udev;
> -	pm->intf = intf;
> +	pm->intf = usb_get_intf(intf);
>  	pm->input = input_dev;
>  
>  	usb_make_path(udev, pm->phys, sizeof(pm->phys));
> @@ -428,6 +428,7 @@ static void powermate_disconnect(struct usb_interface *intf)
>  		usb_free_urb(pm->irq);
>  		usb_free_urb(pm->config);
>  		powermate_free_buffers(interface_to_usbdev(intf), pm);
> +		usb_put_intf(pm->intf);
>  
>  		kfree(pm);
>  	}
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
