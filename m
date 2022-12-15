Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0EE64DC87
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 14:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiLON4V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 08:56:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiLON4U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 08:56:20 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA3329CA9
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 05:56:18 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso1889233wmp.3
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 05:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cp4iCMCKSFYrY2bZuHPNAksFz//lyOio/VrK920rZiE=;
        b=Ka5fLLNI7dmDMjgqmtFE3fuU2OBmdpN02BvQf7bumYXhPUETIMmx5EjohTtJv4Q2AF
         Y83rsuC5IQjPcJTfOsONtE6TAlbJCLCvYuCm3/iXxMBDTTqdakvo3Ki78Ti8mnJa/Foq
         xcUFpbE8RI+cNp1viM/b0f6yjd5tavFYYib7T6IwUKKOlQ6l2hLH02xV3+xCsF6y5dpU
         4vfiFZfbN6ulQNL8InEKJnq46HKDQqjiM1BVBCnzMvUZiTjSrGCGXk19THJZM57EONGI
         vE5MXjQWLrHlW3jM9NmN6EWmMroMyM+wfy29bIS2bhRUy+/W888Z98Z/NJ5c8yU/dBYf
         en9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cp4iCMCKSFYrY2bZuHPNAksFz//lyOio/VrK920rZiE=;
        b=C1JZEAcXuZB1VWMy6tEvlKz2EzZeuWgvemZWKnbTTgN/APq6+QsIybmwZRzKOQQ9Oe
         MqRpnm4Siv/BI0Y3zIZRPVFmYyZoVYf0jEwXP5BgDexEifm6fWoxNZTVty40JqJwVuts
         5f23tVBmfjH44xQNXixpXTgO+iJsHRy/VjRA9/EXzpixJgpJA5fex7MuKV+gCsF7Fm94
         /chCwNbJd2aMgq0MIqjhPdZR2/xVnZ0A3uxrF94Cw36KweL5gEpHCcuoVt8ZvobC0gnY
         JOeb0/Z/73ab3GcvBIZXCgZtwOE0jU9gYqaBSe2hnq6rBk6kSnE3z8XE8lBTkfboD/3W
         M+oA==
X-Gm-Message-State: ANoB5pk4jexbQRzI/dp90l12H8ZbeBD86MYhCCqTKU4sLpumFehKeO7E
        Iwf76hJ6jt0aoTQrUuXlX2BKnQ==
X-Google-Smtp-Source: AA0mqf5l4ladylQqnGZFtWczTEDtuIpVK/y7ndr7wFtzKfmK1/4mqGEBCx1ki6PUVaamIWyVQOl5Ag==
X-Received: by 2002:a05:600c:1d83:b0:3d2:13c6:4740 with SMTP id p3-20020a05600c1d8300b003d213c64740mr25060000wms.39.1671112577045;
        Thu, 15 Dec 2022 05:56:17 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003b47e75b401sm8058108wmb.37.2022.12.15.05.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 05:56:16 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Aldas =?utf-8?Q?Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Aldas =?utf-8?Q?Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
Subject: Re: [PATCH] Input: atkbd - fix typo in comment
In-Reply-To: <20221213190305.6477-1-aldas60@gmail.com>
References: <20221213190305.6477-1-aldas60@gmail.com>
Date:   Thu, 15 Dec 2022 14:56:15 +0100
Message-ID: <87zgboixds.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 13, 2022 at 21:03, Aldas Tara=C5=A1kevi=C4=8Dius <aldas60@gmail=
.com> wrote:

> "Certain keyboards to not like" -> "Certain keyboards do not like"
>
> Signed-off-by: Aldas Tara=C5=A1kevi=C4=8Dius <aldas60@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/atkbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkb=
d.c
> index 246958795..08f87c592 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -247,7 +247,7 @@ static void *atkbd_platform_fixup_data;
>  static unsigned int (*atkbd_platform_scancode_fixup)(struct atkbd *, uns=
igned int);
>=20=20
>  /*
> - * Certain keyboards to not like ATKBD_CMD_RESET_DIS and stop responding
> + * Certain keyboards do not like ATKBD_CMD_RESET_DIS and stop responding
>   * to many commands until full reset (ATKBD_CMD_RESET_BAT) is performed.
>   */
>  static bool atkbd_skip_deactivate;
> --=20
> 2.37.2
