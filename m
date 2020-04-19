Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564AD1AFCEF
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 20:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgDSSBk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 14:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgDSSBj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 14:01:39 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E7FC061A0C;
        Sun, 19 Apr 2020 11:01:39 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b8so3804617pfp.8;
        Sun, 19 Apr 2020 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KpOqt3ibcjgu9959clRGOJ/frmqx1Frhy+1ehyb6rKs=;
        b=YDIpk6C7AXGUdjBgyuMNw8tQuWAfxYnXK82anp3paB1Ymj0wavoSosiBEqli2Z3Cf6
         qr4kna32p61tAeiEQYEAHrg6T9d15oepQk5/MbRFIDl3KiKyITsqwjSkUPUhHeX35fT4
         Arj9exIpY8AavJ8ovAR7sWrjKssv/YILKaPYXtFFTCefFp5eR178J7w6696YmSR/jx0x
         //t5El8c78LJjGjKbUQWEyneyXF2xamQbnnCoe4hKmmpbG3FB0UypL7VYBK4H2jBpHaW
         xoyr21NPZgL8CuRRmJgmz9I219x4zoWUMA/0s9MAmSYw5MTTWEIdNFbERgdD1EfvcEwz
         oJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KpOqt3ibcjgu9959clRGOJ/frmqx1Frhy+1ehyb6rKs=;
        b=bcBLVgo+Uzv00YpkV5JyeBh+SjrAWgYo3STuzrlPZCxlS0BK1Bp3WuH1gaPhTItNM3
         3J0cmqU6286z+ITKrQaM7CUScd5DeXgLC+NepSRDAxEaoOW+d/poRnNzNqex/ywPo0Um
         OXj946So4Ycs7mMY8fHFN513rdv1XR4PbVr0MH9DRhN+2FLKv96qcz39ufAa8C86Ny2X
         7VMc3w0jD05BQ4kzfXAgorEsi5+DTARqzSg0CMPyYVEsUYIibooq5pEEyU+4k3NRb6KK
         jDQ43RB3jd1UwIZTx3WAWzXL8usTlEVESjk1/FjhdPPZpQqPWqmo5tr55f/KOfRYGMgW
         SrNg==
X-Gm-Message-State: AGi0PuaS5shbmmQGzglR5+zEUutlOpEYKRjTNPbaICK+DgWv0EtJw0qJ
        eIRge4lDhQW+ECbU2KMmFVI=
X-Google-Smtp-Source: APiQypK3R4NboOhxdB/lNjNaSvIg54OvPS2ZyTTqFss6oO8a++ttbXPiuI9ld2t2Bewo+JaT6DULNA==
X-Received: by 2002:a63:3002:: with SMTP id w2mr12813379pgw.290.1587319299237;
        Sun, 19 Apr 2020 11:01:39 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id v26sm3543872pfe.121.2020.04.19.11.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 11:01:38 -0700 (PDT)
Date:   Sun, 19 Apr 2020 11:01:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     LuK1337 <priv.luk@gmail.com>,
        Cameron Gutman <aicommander@gmail.com>,
        Mark Furneaux <mark@furneaux.ca>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Update xboxone fw2015 init packet
Message-ID: <20200419180136.GK166864@dtor-ws>
References: <20200419041651.GD166864@dtor-ws>
 <20200419074624.9955-1-priv.luk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200419074624.9955-1-priv.luk@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 19, 2020 at 09:46:23AM +0200, LuK1337 wrote:
> From: Łukasz Patron <priv.luk@gmail.com>
> 
> Appending { 0x05, 0x20, 0x02, 0x0f, 0x06 } to
> xboxone_fw2015_init fixes an issue where the
> controller is somewhat stuck in bluetooth
> mode until you plug it into Windows PC.
> 
> Signed-off-by: Łukasz Patron <priv.luk@gmail.com>

Thank you Łukasz. Could you please tell me what device(s) have you
observed the issue with? I am a bit worried if this may interfere with
other devices that currently work fine with the driver. Cameron, Mark,
do you have any concerns here?

> ---
>  drivers/input/joystick/xpad.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 6b40a1c68f9f..894fa81f717a 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -455,7 +455,8 @@ struct xboxone_init_packet {
>   * or later firmware installed (or present from the factory).
>   */
>  static const u8 xboxone_fw2015_init[] = {
> -	0x05, 0x20, 0x00, 0x01, 0x00
> +	0x05, 0x20, 0x00, 0x01, 0x00,
> +	0x05, 0x20, 0x02, 0x0f, 0x06
>  };
>  
>  /*
> -- 
> 2.26.0
> 

Thanks.

-- 
Dmitry
