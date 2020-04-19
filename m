Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606E41AF68D
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 06:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgDSERh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 00:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725769AbgDSERh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 00:17:37 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132D4C061A0C;
        Sat, 18 Apr 2020 21:17:37 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so3344099pgg.2;
        Sat, 18 Apr 2020 21:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0zEq4nCrg2eBYK8tJSmKLttcntc+dC8LZHOpk+D3kKM=;
        b=dm/zNb/ZQAwyNmw10uEfpqf4xnJQPZ0Lao7hDgpQtOJOKQSIiY33iw6prVcnk/kYE1
         RPVq7QixmKuVtqOOxJSvPtsBE16nNpDlNQfYJp/oFkZiz8CFEH/VzOmHxVCmnkTgYgjo
         74s1Ehpbkd2tBwhuGSPioojhsv3NIEMDWvVzQtR7WMoJyikT0ViKl3f7fc96Y1XESfeD
         5h8AulaNkZ4drxI97pxUos+nqh4ZshdUL2s3nSSgJWSRea4zZepyTcTeXGPa9QV9kPXl
         h/O8DQeq5NunIqQ6/nnNCxjJusXPMh8Umyh8QinYf33LG1kTFL9HvgFvD9sMqPYXKpa6
         6beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0zEq4nCrg2eBYK8tJSmKLttcntc+dC8LZHOpk+D3kKM=;
        b=jurzisVSj0D6T7d7WWFLyNAkJKCP4srm5QkA3uatEyoll6xP3MsQVIDmltPW8Bhx3T
         zEcTAzdI5P6ZQLprzKi3Fa60W6TR73CPQe9IgUkJNGfXn3VAgsp5xGMijX6Qbw6Pm7gb
         vR0dLkmbe7rvUPaENTkxdDdkKuYf3zR/C5ysOig8PARAaSOaJjucmjFcbBz6RkKPCH8c
         bQldoPi/uXeODVnGdYW1EYbxJch6tqCY6S6ZvcATAXLIznsYOCwt5lAAREfTQBBd6gvO
         T5M/gmJlkTBbHrAHcI6/Ysf3kvgOJGyKKmPFds4nQvot/oDPea8a6JAheod54mkQ0vWc
         QJsA==
X-Gm-Message-State: AGi0PuYBjQ40tjOcirGNIwf02DKWDC8+S8gK3SW07VEwunt4xa2HOELO
        eYcEwHD3/j6r699+zxs7Z3M=
X-Google-Smtp-Source: APiQypJxOMK3UwYzME94xbsCe30TFt4PizjolkswjNlqj16kRfYLOU/zIi5vU3iEMVQZND1TUJrLpw==
X-Received: by 2002:a63:cd08:: with SMTP id i8mr10369506pgg.55.1587269856477;
        Sat, 18 Apr 2020 21:17:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 132sm23819263pfc.183.2020.04.18.21.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 21:17:36 -0700 (PDT)
Date:   Sat, 18 Apr 2020 21:17:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Richard Fontana <rfontana@redhat.com>,
        Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] Input: usbtouchscreen - add support for BonXeon TP
Message-ID: <20200419041734.GE166864@dtor-ws>
References: <20200413184217.55700-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413184217.55700-1-james.hilliard1@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 13, 2020 at 12:42:17PM -0600, James Hilliard wrote:
> Based on available information this uses the singletouch irtouch
> protocol. This is tested and confirmed to be fully functional on
> the BonXeon TP hardware I have.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied, thank you.

> ---
> no response in over 2 weeks
> ---
>  drivers/input/touchscreen/usbtouchscreen.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> index 16d70201de4a..397cb1d3f481 100644
> --- a/drivers/input/touchscreen/usbtouchscreen.c
> +++ b/drivers/input/touchscreen/usbtouchscreen.c
> @@ -182,6 +182,7 @@ static const struct usb_device_id usbtouch_devices[] = {
>  #endif
>  
>  #ifdef CONFIG_TOUCHSCREEN_USB_IRTOUCH
> +	{USB_DEVICE(0x255e, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
>  	{USB_DEVICE(0x595a, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
>  	{USB_DEVICE(0x6615, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
>  	{USB_DEVICE(0x6615, 0x0012), .driver_info = DEVTYPE_IRTOUCH_HIRES},
> -- 
> 2.20.1
> 

-- 
Dmitry
