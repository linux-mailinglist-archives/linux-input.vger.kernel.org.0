Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67461B2EC0
	for <lists+linux-input@lfdr.de>; Tue, 21 Apr 2020 20:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbgDUSI5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 14:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgDUSI4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 14:08:56 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED78C0610D5;
        Tue, 21 Apr 2020 11:08:55 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nu11so1728448pjb.1;
        Tue, 21 Apr 2020 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=m9lXZn3MmGvJ6fy8fXnibPNE/fmaQNvKRPayueyEtMw=;
        b=CGQUedw9NSlP1gDfogNyqIARyPJuoOvtgiSi16qFFUkfQWoYDZKRTiq0faGhL+WIwg
         a3J6duO47B20WIVaEyBayyKBLtp3V85IRA7XQD1rg6Zts/WPDVYGU+TpU1E3DNGwhizC
         wrvOSJ/pngMJf14ZhVmH9aQ7aLEKYbb3qIu+70JzkYl8WhRX10+NcEFhPyHS7NZUh668
         eS19lUYSOZaw0eYzFAO7GL6Nz4mk/T82E4TZ3ae1j2z47FJ7XENZusuonJKKNmHh2YPR
         UOWczeZkm/ptoYPdraq70YYpKv6exp3zkflxr+5awDfE7X9Xj7ZGtsUgJByP9qK0BuBJ
         kzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=m9lXZn3MmGvJ6fy8fXnibPNE/fmaQNvKRPayueyEtMw=;
        b=PT9/aXG296Hcweu01qJdOw+EHbPSN+8QKISsh1Lp1jTlZdX57aISRoLdh4cdBtIp6p
         OOGYcf0dtkpHRlaKf74jsrAG2XaTQqWmFwDKL/soZswyvwLdVVGrB3YP3oMAz0hTrCG1
         OvhiHM/hnq0wknGHkUfrl90dWlWHWFEG4y6w/IUZpla18DWdXzZdk2WYF/2mU91aigEa
         dY4sapb3HMj1UaHV+0GckcU28iicBL/T0SEmluOh0sNoxEMCSzZqQJHORINaHAO5CACL
         7pWRW4pqTk3cQfLWpIj6lBs0CxLErWFeOGoToc+txvG9z7tyLCOUbIeo+4FiF0hCpYZd
         wJqQ==
X-Gm-Message-State: AGi0PuZW/wctVoAZt4cD0fcMkoN/6aEi6A/ASLUg2QbY0FWyp1D7U4nU
        8GLU+x6dKoeoi6GNhP5ysuc=
X-Google-Smtp-Source: APiQypI6Dc7PludFPpf1A9/FaEImf3oR+IiJksNyGnEMCTsSj0T0AlbnDeB3uwgNI+7KiXTcJLUtEQ==
X-Received: by 2002:a17:90b:3717:: with SMTP id mg23mr6919192pjb.129.1587492534715;
        Tue, 21 Apr 2020 11:08:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id w2sm3048963pfc.194.2020.04.21.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 11:08:53 -0700 (PDT)
Date:   Tue, 21 Apr 2020 11:08:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     LuK1337 <priv.luk@gmail.com>,
        Cameron Gutman <aicommander@gmail.com>
Cc:     Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Add custom init packet for Xbox One S
 controllers
Message-ID: <20200421180851.GA125362@dtor-ws>
References: <436c79ed-ca21-c075-e2da-0934da5000a2@gmail.com>
 <20200421092434.3360503-1-priv.luk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421092434.3360503-1-priv.luk@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding Cameron...

On Tue, Apr 21, 2020 at 11:24:33AM +0200, LuK1337 wrote:
> From: Łukasz Patron <priv.luk@gmail.com>
> 
> Sending [ 0x05, 0x20, 0x02, 0x0f, 0x06 ] packet for
> Xbox One S controllers fixes an issue where controller
> is stuck in Bluetooth mode and not sending any inputs.
> 
> Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 6b40a1c68f9f..4e1781968411 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -458,6 +458,15 @@ static const u8 xboxone_fw2015_init[] = {
>  	0x05, 0x20, 0x00, 0x01, 0x00
>  };
>  
> +/*
> + * This packet is required for Xbox One S pads (0x045e:0x02ea)
> + * to initialize the controller that was previously used in
> + * Bluetooth mode.
> + */
> +static const u8 xboxone_s_init[] = {
> +	0x05, 0x20, 0x02, 0x0f, 0x06
> +};
> +
>  /*
>   * This packet is required for the Titanfall 2 Xbox One pads
>   * (0x0e6f:0x0165) to finish initialization and for Hori pads
> @@ -516,6 +525,7 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_init),
>  	XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_init),
>  	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_fw2015_init),
> +	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
>  	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
> -- 
> 2.26.0
> 

-- 
Dmitry
