Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EBA5ED5DD
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 09:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiI1HVx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 03:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbiI1HVt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 03:21:49 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4977D2D7A
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 00:21:47 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso53260wmc.0
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 00:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=PAmk9QFq07aPCNFFQg2mJtu07esLl0IfU/Mk+SA3fPE=;
        b=2TIznrsycJ8yFQDLSoWk/zHZDHnuP7DxOBoyKCgp4K5HjGoVb0V8/ewcz9f0ReJPpa
         VUC6pJjcNm/8JVfOYxZEzKZo/6B7CsJXa1la7dR7hIBE8NToD3mdZlPPzivQn+n5g8Xx
         KRt9BCr68ylQGoLhwl3I1lV2v8DS3eRpGE/wjwW+hHn0AFqIc0JHwMNRALwQEIE+xLCZ
         MQK1CefJQ2UvG+Q/a29tdcjY0yxsCgAsI7YvPnXB0nnTi5hAHrKicbDEWnmIO7LnDrFq
         q8XkcL1xkhHzs1KnY9Qxo0l4MJ772x6yCysIYa1GvL8sIg0gfksQlu9/EQSPg1P7i6ox
         6EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=PAmk9QFq07aPCNFFQg2mJtu07esLl0IfU/Mk+SA3fPE=;
        b=I5ZpxgyTL3xcm/JfLrHFHyGZ3hnW4wgxG5ofin6qoLPdNSnGqRh4VdlWUdqe6h79LF
         nITcYWXQ8x0ZZvzQ08uwv0nAXb6BB+ONiRMwF8UCmFzyiUhDsh8borIMe+E3+aDJ3QCf
         2O8Ejq8Pzs1QwiSTY/IGWVET/slzzBSOWlY9TJUJyJjowlUfwM7zENv8+9UiwD17P0Dh
         D4aQef/NWMU5byb3uKgNGUjY3bgUFVyERJDz0UGH5KBbwhtDud4kgPmeKaK3tcJPliXt
         Vl+megZc2dDXEbNrl26rQrYvzxFVFccBZ+DZ1n8uZ9dmpkTEfWfrMDmELWEAUs0y9qJd
         uAqw==
X-Gm-Message-State: ACrzQf1RNiWh+3a68OkPZh5w41DZ5pdCeZMM1daPbdZSEfl4ohmaNq2v
        8+i4wFf7BkDrbqyQyYJIAY+jXrf8QrUdsw==
X-Google-Smtp-Source: AMsMyM7YhtL+0NoCS9j0oovuS4v8XPdkJ4kkUpR85RVOSMhAcGXhFaAofVE3svS8Cr46wvUY25TVqg==
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id f12-20020a1cc90c000000b003b4adc79766mr5726830wmb.66.1664349706271;
        Wed, 28 Sep 2022 00:21:46 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:5f1e:d910:dd1e:5b09])
        by smtp.gmail.com with ESMTPSA id fc10-20020a05600c524a00b003b435c41103sm1294696wmb.0.2022.09.28.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 00:21:45 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Nate Yocom <nate@yocom.org>, dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH v6 2/5] Input: joystick: xpad: Add X-Box Adaptive XBox
 button
In-Reply-To: <20220908173930.28940-3-nate@yocom.org>
References: <20220908173930.28940-1-nate@yocom.org>
 <20220908173930.28940-3-nate@yocom.org>
Date:   Wed, 28 Sep 2022 09:21:44 +0200
Message-ID: <87sfkcezg7.fsf@mkorpershoek-xps-13-9370.home>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nate,

On Thu, Sep 08, 2022 at 10:39, Nate Yocom <nate@yocom.org> wrote:

> Adaptive controller sets 0x02 bit for this button, all others set 0x01
> so presence of either is used for BTN_MODE.
>
> Signed-off-by: Nate Yocom <nate@yocom.org>
> Tested-by: Bastien Nocera <hadess@hadess.net>

This does not applies properly anymore on dtor/next [1] because of
90c9978959da ("Input: xpad - refactor using BIT() macro") and
e23c69e33248 ("Input: xpad - add support for XBOX One Elite paddles")

With that, please add:

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com

> ---
>  drivers/input/joystick/xpad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index c8b38bb73d34..dff0d099d416 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -858,7 +858,7 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
>  		if (data[1] == 0x30)
>  			xpadone_ack_mode_report(xpad, data[2]);
>  
> -		input_report_key(dev, BTN_MODE, data[4] & 0x01);
> +		input_report_key(dev, BTN_MODE, data[4] & 0x03);
>  		input_sync(dev);
>  		return;
>  	}
> -- 
> 2.30.2
