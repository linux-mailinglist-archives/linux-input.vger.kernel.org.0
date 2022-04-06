Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F264F67E6
	for <lists+linux-input@lfdr.de>; Wed,  6 Apr 2022 19:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239462AbiDFRpm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Apr 2022 13:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239468AbiDFRph (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Apr 2022 13:45:37 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8292ED618
        for <linux-input@vger.kernel.org>; Wed,  6 Apr 2022 08:54:31 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id o15so4980172qtv.8
        for <linux-input@vger.kernel.org>; Wed, 06 Apr 2022 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5csHcQ6/tfIFDMQ9dmi2zDp6fYcqQksbyxP0kSAOhAw=;
        b=e5mrNPY21FGrnT6tEtVNWtdpTlgE+mZa4cl5Kxr7LX+Vl81pq7Dk9aFtCGKB6mbJL4
         ZXPjIb+wYZFrK0U8YqQi8vD2af4PVLBYIarMfH2iUJ7EyNcGqkN1Hy4IV+2fuqazLidZ
         7tMqouXSCb7jfpWJpxTyfUQRz7XKWgLcNi3nLSgv8y9hKomek6i7HgpT1z6K8iHLZjZ3
         BTPTeNfDCeCmSwkwvLXNXCnwRLq3OxtiRBJZD9Q2yHk6otJ1UTlfOxi1sImEdYoqRHsR
         eN1pk3evZ8WLCOXKVkfrmSn9guUSdxdZJVbxaDO17lIqyu7ugpw1IqW1WGHT7owljvlK
         R2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5csHcQ6/tfIFDMQ9dmi2zDp6fYcqQksbyxP0kSAOhAw=;
        b=YScDrXVllJD/NwfG6EhIPkSBafTn6EIeJEXVfCz/PN5wMKZODjx7sNfsWVDwhbS8GI
         O6VKpHSMGNyE7G1yXcAtskGlbVOF2k81Um7lelVVBDzD4O4EQDx3ES/vD3hGcproi9Ss
         JrKwO+ZBTG+egg4yIYJbAnqHWh6IoJC55qof2TtfcaHtMHRaRygup5ZTj17//djh9ZE1
         naOMgk7Dp22cWggReqE5pM2Hmx1oOSMMis9J0aiMgnRxPeB7QSLdfYqD/tTM3BWi2s4r
         Bw6gecCuCvyibAHdF5W/DoogsardY2PaI93mBsPjpHiGeOHv0VDZ6wOtADf7ZOciABfU
         az/w==
X-Gm-Message-State: AOAM530ypuFNNvsIqeucJXdeSPZlAqZuxtU2qB8Di+stbmRMNshBxdQ9
        UEinGJQh9EUQ2NHGJhWILiLthtZqiiRN02tsyAc=
X-Google-Smtp-Source: ABdhPJzzBdtEHKP1o1d9JgHRuMxUfZ9zXmffp/g5a32j8tYKjWTRX+qaG7BOzo4axty8Yvf1cibfzcKRG1YIF3N6FlI=
X-Received: by 2002:a05:620a:44d6:b0:67b:2dd8:3064 with SMTP id
 y22-20020a05620a44d600b0067b2dd83064mr6151559qkp.219.1649260470007; Wed, 06
 Apr 2022 08:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210818152743.163929-1-tobias.junghans@inhub.de>
In-Reply-To: <20210818152743.163929-1-tobias.junghans@inhub.de>
From:   rishi gupta <gupt21@gmail.com>
Date:   Wed, 6 Apr 2022 08:54:19 -0700
Message-ID: <CALUj-gt6m=oJY4N8D5Mr7pHU0CDz9SzTwLbJkry3XQKr0+sg6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: mcp2221: enable HID I/O during probe
To:     Jiri Kosina <jikos@kernel.org>,
        Tobias Junghans <tobias.junghans@inhub.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        gavin@matician.com
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Ezio Melotti <ezio.melotti@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Tobias for the patch!

Reviewed-by: Rishi Gupta <gupt21@gmail.com>


On Wed, Aug 18, 2021 at 8:28 AM Tobias Junghans
<tobias.junghans@inhub.de> wrote:
>
> devm_gpiochip_add_data() calls the gpio_chip->get_direction handler
> for each line, resulting in device I/O in mcp_gpio_get_direction().
> However unless hid_device_io_start() is called, mcp2221_raw_event()
> is not called during probe, causing mcp_gpio_get_direction() to time
> out. This fixes that probing takes 12 seconds to complete.
>
> Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
> ---
>  drivers/hid/hid-mcp2221.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index 4211b9839209..8e54173b195c 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -895,7 +895,10 @@ static int mcp2221_probe(struct hid_device *hdev,
>         mcp->gc->can_sleep = 1;
>         mcp->gc->parent = &hdev->dev;
>
> +       hid_device_io_start(hdev);
>         ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
> +       hid_device_io_stop(hdev);
> +
>         if (ret)
>                 goto err_gc;
>
> --
> 2.25.1
>
