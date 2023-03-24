Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB296C74FC
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 02:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjCXBZx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 21:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjCXBZw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 21:25:52 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D431E1589F
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:25:51 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id kc4so494357plb.10
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679621151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oil4AaG9zbpujM9YW4bqMfDncC6VAe3W839n72p90P8=;
        b=WrI1DBiwdio7++TKGH44gh+nFBa1bWoqIoSlXkHYEhT23TgKDk2gZg+03447kLRo9b
         eFtLGx0SwjpnDAw7/8AGbL+MqneJ3Nwiha27iFaHlkuTMnpDaqPJj3SCjA+rpcnuxaaP
         iIv0P2RxRaEYj75XnSlj9sQGz8AuYv69L9y8bzwNMo8BB6q8UZQ0adX590eGTcNJf3M5
         BPd3yPYtccB5enhmYjYEkDG6JTFbQK1rTWUYmcriprK/hocPnO1nmyhyw1uO+8oxIbjx
         bQSlSS4T6PglfT4rYUIbraJmRcD8GrFQm3Hv0/S5i2MJzUNdK8zdXMRWPMZyGVUAQVRH
         /GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679621151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oil4AaG9zbpujM9YW4bqMfDncC6VAe3W839n72p90P8=;
        b=EmYFUHSlxfEHzal62B48UrDcQsp5dCBpbE831XnfFMK5/GrtffgQLFadDa4prblKUA
         Et39hLkpzxsmknjitW3WtzoRIPnv1ywDLpm/LuBjnIERH2Ns3Z0BvWlqADrosX8v6p1q
         DauVXFlG1KTdNv3x0yv0+xiEYLlD1F70pNgWMP7hhEsuOuyC6emX4i5V38lJWZeH7U3c
         bxmUdEcGpypT0jlvvwOFWuGSnI5V0r0TslYWeEODE3DoOHhqQ45euoB3QeLW7rQCIfbE
         kvPAE6fEfQkypIuXlfpOIm66lnkaxl2PsVzHpzvytJYH8TUgSGFnpVa4KYRbLLHq/L5m
         aTig==
X-Gm-Message-State: AAQBX9dNZLrePYTK0qGjZK1rLlghkN5MAKsUvUDyKacUR2aXEj0PVFka
        ncesGjHavkxaKdtPzjzxyqo=
X-Google-Smtp-Source: AKy350bZo2ctgIc/gWE+9o5lK3FJNqSnlqLxtbic/yE59Lymz0oUpipfPZSAwdyI+OW/o8g2/kVi9Q==
X-Received: by 2002:a17:902:f0cb:b0:19d:b02:cca5 with SMTP id v11-20020a170902f0cb00b0019d0b02cca5mr796050pla.12.1679621151159;
        Thu, 23 Mar 2023 18:25:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f5e9:5a97:54ee:6f66])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b0019c2b1c4db1sm12878411plt.239.2023.03.23.18.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 18:25:50 -0700 (PDT)
Date:   Thu, 23 Mar 2023 18:25:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Josh Cotton <jcotton42@outlook.com>
Subject: Re: [PATCH 3/3] Input: xpad - add support for 8BitDo Ultimate
 Wireless controller dongle
Message-ID: <ZBz8G9sMC4qSV1AU@google.com>
References: <20230203022758.3982393-1-vi@endrift.com>
 <20230203022758.3982393-3-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203022758.3982393-3-vi@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 02, 2023 at 06:27:58PM -0800, Vicki Pfau wrote:
> From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
> 
> Add the VID and PID of the 8BitDo Ultimate Wireless controller dongle
> 
> Signed-off-by: Josh Cotton <jcotton42@outlook.com>

Same issue as the first patch regarding attribution.

> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 16bc3cd4c2b7..403b57e8176b 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -359,6 +359,7 @@ static const struct xpad_device {
>  	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
>  	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
>  	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
> +	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless Controller", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
>  	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
> @@ -494,6 +495,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
>  	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
>  	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
> +	XPAD_XBOX360_VENDOR(0x2dc8),		/* 8BitDo Ultimate Wireless Controller */
>  	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
>  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
>  	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
> -- 
> 2.39.1
> 

-- 
Dmitry
