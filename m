Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CB96D341D
	for <lists+linux-input@lfdr.de>; Sat,  1 Apr 2023 23:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjDAVlw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Apr 2023 17:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDAVlv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 1 Apr 2023 17:41:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AD21880F
        for <linux-input@vger.kernel.org>; Sat,  1 Apr 2023 14:41:47 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so27009432pjl.4
        for <linux-input@vger.kernel.org>; Sat, 01 Apr 2023 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680385307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtigsOlplDoHeTuk33NQKZAFXnLLwpjE0rYIpKIIwbM=;
        b=Jq1b659XeYQnG0VgG0onMWRkbgaPPXy92OBmcmOKivIKYrBNHDcmLYSpNNSFW4620W
         5oTUkCST2aRJ64fix0lS4R76T70vzDEaIer4n+J0/juYeRUiGC4+Mxs3+zOnEPnxpVLt
         nuHjjlqU5B9LOol+i3DELkuQgePAE9fTspdyr1RdyWmKtyuSnRPkXqj13TkJ/n0AhDdT
         C0brL1MUeH61iRy6Hm6XtFZ+Pwv3bfpkJmT0/hZHLA8doRmFGVg7R5N3u8IsskQymnnh
         hGuMVHPeaKgM9dd68nUS20HFKbGioPYLLuNElt8B39vWV/d4UZGycSK0BJ0Tjza81N3s
         gdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680385307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtigsOlplDoHeTuk33NQKZAFXnLLwpjE0rYIpKIIwbM=;
        b=WCnaf9/gPDHk4Lx632k56UYZd3Zk72srWvoj7mHmdtuXFoO8CpBfnIRV6fn4JINmY/
         AbYRdT7qoxjg/Nm9IYpyJcUOtsZ9U69M8o5bWFw7eC42AIbTDjLQqbZxZrb5BNDDCS27
         EAw7P6ZcfCMjQBYjH//QIpaJLoXbYd+RKiTyBBiGjd9aroW2huCGmxHRn/AMuTcowJ1v
         hLBSXLvvuhSptOUpK6OYR+MG2NBaiv33c3SMRCNQWtA8dJeGLjJ4eFJnd3V+JMBv5idu
         OLxkwVO6kjQNY2Eu3fRUEOk+qKu3+KgjBWFNOxGzJAMwjTcUTsKLgsNj2RAUj6Sgpkjt
         wJfw==
X-Gm-Message-State: AAQBX9c3WE5RBzJNuA0OaTVYtSy0OulBJNSDurdH7OCR+oXdJzL0R3eZ
        5gD60EV+uyeUcA14kknlQgk=
X-Google-Smtp-Source: AKy350Y0MN6sC6S/73OCrdlVA672pAXRBhqE8JoJ170v8lxmty8Fq/JYH/KU96MxpdomMAJEs4I+CQ==
X-Received: by 2002:a17:90b:1bcc:b0:237:a174:ce54 with SMTP id oa12-20020a17090b1bcc00b00237a174ce54mr33380641pjb.21.1680385306969;
        Sat, 01 Apr 2023 14:41:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ac04:c59e:2de:5791])
        by smtp.gmail.com with ESMTPSA id z22-20020a17090a609600b00227223c58ecsm3545046pji.42.2023.04.01.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 14:41:46 -0700 (PDT)
Date:   Sat, 1 Apr 2023 14:41:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Subject: Re: [PATCH 2/2] Input: xpad - fix PowerA EnWired Controller guide
 button
Message-ID: <ZCilF4RM5LY85aHP@google.com>
References: <20230330024752.2405603-1-vi@endrift.com>
 <20230330024752.2405603-3-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330024752.2405603-3-vi@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 29, 2023 at 07:47:52PM -0700, Vicki Pfau wrote:
> This commit explicitly disables the audio interface the same way the official
> driver does. This is needed for some controllers, such as the PowerA Enhanced
> Wired Controller for Series X|S (0x20d6:0x200e) to report the guide button.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 698224e1948f..c31fc4e9b310 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -1396,6 +1396,14 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
>  	unsigned long flags;
>  	int retval;
>  
> +	/* Explicitly disable the audio interface. This is needed for some
> +	 * controllers, such as the PowerA Enhanced Wired Controller
> +	 * for Series X|S (0x20d6:0x200e) to report the guide button */
> +	retval = usb_set_interface(xpad->udev, GIP_WIRED_INTF_AUDIO, 0);
> +	if (retval)
> +		dev_warn(&xpad->dev->dev,
> +			 "unable to disable audio interface: %d\n", retval);

I would prefer if we first validated that the interface is in fact
present. Can we do something like:

	if (usb_ifnum_to_if(xpad->udev, GIP_WIRED_INTF_AUDIO)) {
		error = usb_set_interface(xpad->udev, GIP_WIRED_INTF_AUDIO, 0);
		if (error)
			...
	}

> +
>  	spin_lock_irqsave(&xpad->odata_lock, flags);
>  
>  	/*
> -- 
> 2.40.0
> 

Thanks.

-- 
Dmitry
