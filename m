Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E0666462D
	for <lists+linux-input@lfdr.de>; Tue, 10 Jan 2023 17:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238992AbjAJQep (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Jan 2023 11:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239048AbjAJQd5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Jan 2023 11:33:57 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652E98461C
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 08:33:30 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id bs20so12395465wrb.3
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 08:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ym/eJ5fz8Y4p1LUjtTeaH5cHFxFkmqxEFY4SImHkXcU=;
        b=rHL3utTJrZKGfZS+Yh+XnSQKpAJIVH7PQybEto1200q/cWSFzzpdsJA5VCNd5jWfPd
         Z2LmF0vMgQMrPmsPt2hohdQdShqMHZsM2alOgbrmFbTu4nv3rQWGIVVe6Fo9e5lf7f4g
         uwHWsIKCMX/rvnWo6aNDDbXoV/2TJ7Djq+PCaoGoyQNRbZX3NBtOtCi6wWj74Vg3LwpC
         vif4+KykyMKfc7BW1KuKpmKSnsrrcjYKjaoLED9kcYZ8Vx1TnCWx0yGW1u2a2NL3X43L
         fuqnmd3+cGc2r7cghg/nheSVcuBiU7+VMe8zV7LUNvd7l7kFEYPt9jFYAsdfVTmJYmrz
         d8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ym/eJ5fz8Y4p1LUjtTeaH5cHFxFkmqxEFY4SImHkXcU=;
        b=X/MJLTK3D244wuTq0sGGLSNEP+uNEiVCmwY8qZCO0cERLiY4EOD5pK/Q4TLDlVMcdh
         eDct9kY/t1PaZ2mVcRLwze2g30YbDkirIVKvZ0DNzA6JuHvhrUFLwiQ1ZsZ9hV5TjjnP
         BmqOK4laAyMZBWd1YnLDFDukYeXotWusaxUwwfxniajngFrKZpVNebAHSese+NYzR078
         t+Ey3n+C24CmrEpbD8G5fi9MWe4xV1l0RdFaU1tbe1kI6SD9ifHq0YP4PodyzVX4iSbD
         PJ+Tx+XqJYtj0MdmF2a9l+H4Ox53HdrU7z0WXyzCj6nlwMbMtVPSKghtwD5hnfq18U0G
         xKwA==
X-Gm-Message-State: AFqh2kqG1BCICFvQIA7yuHtrih8keb3iRFpt+ryI9DiGhUaDb06R21FJ
        1LLwa1MOS+Lh5L5/8weK16YKmA==
X-Google-Smtp-Source: AMrXdXtrx3/IptYlgrqDn6WDHI4/OcQNOgoMg0mpPzFL//dT9ibsQKHPGHOgfIQl0PSEJI2Rjj3YEA==
X-Received: by 2002:a5d:6e0a:0:b0:242:10ac:ac42 with SMTP id h10-20020a5d6e0a000000b0024210acac42mr43977833wrz.55.1673368390734;
        Tue, 10 Jan 2023 08:33:10 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id j14-20020adff00e000000b0024cb961b6aesm11492743wro.104.2023.01.10.08.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:33:10 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Werner Sembach <wse@tuxedocomputers.com>,
        dmitry.torokhov@gmail.com, hdegoede@redhat.com,
        wse@tuxedocomputers.com, chenhuacai@kernel.org, tiwai@suse.de,
        wsa+renesas@sang-engineering.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add Clevo PCX0DX to i8042 quirk table
In-Reply-To: <20230110134524.553620-1-wse@tuxedocomputers.com>
References: <20230110134524.553620-1-wse@tuxedocomputers.com>
Date:   Tue, 10 Jan 2023 17:32:55 +0100
Message-ID: <87zgaq73k8.fsf@baylibre.com>
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

On Tue, Jan 10, 2023 at 14:45, Werner Sembach <wse@tuxedocomputers.com> wrote:

> The Clevo PCX0DX/TUXEDO XP1511, need quirks for the keyboard to not be
> occasionally unresponsive after resume.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/serio/i8042-acpipnpio.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index 46f8a694291ed..efc61736099b9 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -1238,6 +1238,13 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>  		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
>  					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "PCX0DX"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
> -- 
> 2.34.1
