Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424D2679413
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 10:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjAXJ0K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Jan 2023 04:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjAXJ0J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Jan 2023 04:26:09 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6441E10F7
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 01:26:07 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d2so13206252wrp.8
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 01:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUUkyuD2zxlDkPMgAYzzQhWTuLcXpzFoFcL5PIHZ+1w=;
        b=Bw742IcsNXIEHnOoMkUmG8mSNm5B3VjiWLJNxLacRqLjY9nL2UVrN3CB7dLPYxZ9jg
         TEFyra4PMG8P97pbi6KLCmfIylvDebMB11VdD6L2XqiqrupZXMEFS2rWP771ZC3YXNJF
         8K6A5vK6n+Fj2GMtYsvsSQF6wYfjqKL/vFCj9HwRphv+pKjYyE//qsMwl6jKpOpaQ0a/
         Koz9qmTlBNy+JbYl5cart4gNmqy9lZsuvM21wLr4DlGnZv/ZoSrvOBpxr0tZfHJQ0dki
         mT6xIDvlZsRfkE4kEnm1FCGs3tTpakIWAFnJiaM3kVHnLRCq8fd1fGB10UYHsqTV2cQJ
         83Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUUkyuD2zxlDkPMgAYzzQhWTuLcXpzFoFcL5PIHZ+1w=;
        b=XSm+7MqieEap9/WM808xcnYp/4Zi++V101x9MxfpRaZNwpjxzacnAelANr70TpVG8x
         yXge5NCkH+AwrmTEOlDgR1ToBb3LeTZYuW/puzw4u0crVkOHW4HiT7JeElCd5ud0UObw
         xZM1e+CDjvDiRIt6SazfIojuAnKeJr/+yOlyAY3s+VPKY5X+pcmFcp/EN61IdCd0Knsy
         wxpR/H8zcNZ37ZKxdHSu3nFrYGkcBiEL4AriSFVnucKTk5RyILj4RPgr+g/xNgDmyjRh
         YjR0rcAMNJ0k/r3B0ORVSPeeWPOiFLMJ74tJhJJENvjTBwuvA1ZoGlK5k6efAeVrEVMs
         WBdg==
X-Gm-Message-State: AFqh2kr2BgX880ASMBjKpNqDZQ137eVh65Oz3YpUbs2KSncFIbkI1qov
        XoVktcSz7aOje/G0tkhz9fg2NQ==
X-Google-Smtp-Source: AMrXdXtDBTt1N1mF8iJTtOaSB+dXTNxomq2j/NFaem0gXALZNrDFaJ9GkYd+FzfG4HYwJDwhhUY2HQ==
X-Received: by 2002:a5d:6ac6:0:b0:29f:7c87:74ab with SMTP id u6-20020a5d6ac6000000b0029f7c8774abmr22507800wrw.10.1674552365866;
        Tue, 24 Jan 2023 01:26:05 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d4ed2000000b002bde537721dsm1425800wrv.20.2023.01.24.01.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:26:05 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     John Butler <radon86dev@gmail.com>, dmitry.torokhov@gmail.com
Cc:     John Butler <radon86dev@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add 8BitDo Pro 2 Wired Controller support
In-Reply-To: <20230124005206.80706-1-radon86dev@gmail.com>
References: <20230124005206.80706-1-radon86dev@gmail.com>
Date:   Tue, 24 Jan 2023 10:26:04 +0100
Message-ID: <87bkmo2sib.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 24, 2023 at 00:52, John Butler <radon86dev@gmail.com> wrote:

> Add VID and PID to the xpad_device table to allow driver
> to use the 8BitDo Pro 2 Wired Controller, which is
> XTYPE_XBOX360 compatible by default.
>
> Signed-off-by: John Butler <radon86dev@gmail.com>
> Cc: linux-input@vger.kernel.org

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 2959d80f7fdb..f642ec8e92dd 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -359,6 +359,7 @@ static const struct xpad_device {
>  	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
>  	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
>  	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
> +	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
> @@ -492,6 +493,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
>  	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
>  	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
> +	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller */
>  	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
>  	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
>  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
> -- 
> 2.39.1
