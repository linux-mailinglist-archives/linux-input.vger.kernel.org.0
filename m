Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF57A69F531
	for <lists+linux-input@lfdr.de>; Wed, 22 Feb 2023 14:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbjBVNWe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Feb 2023 08:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjBVNWd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Feb 2023 08:22:33 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46123A84F
        for <linux-input@vger.kernel.org>; Wed, 22 Feb 2023 05:22:31 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t15so7813852wrz.7
        for <linux-input@vger.kernel.org>; Wed, 22 Feb 2023 05:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmed1jeBZ5AybmMhwZvMFWvP/a/HwCGONjFVZMu41zE=;
        b=i5RWhuySJGsDW5u4u/jrDVUZbkEsJFfC/M/mC//9GjfsjkJazoQiySRTK8sLCGlnmQ
         GYS0VFwgu/bPirBC2MZO3iOheg8F7v8SxcGRb/Azwe/UoGJTFJgWWCJOUwcabhVzkeMp
         FkCTCDJa8OM6OytqCZ9ErNJBvy9+xUehTvDutBxTxyitHO27FNViVgPGWXdL9HbjRc+9
         fn8vPWtxMqwG6Ekkg2Z1ht1QOWmlnsBkKixH3jfwXjD/Xe0mqaiaIcx2rdEC9AUi2YmF
         qcRbgwy/eWtrV60KsN6aOW21Lmk1kCp6MJBmpzsZuXwAKpXJ1CKc7IMUP9iPrjIf8jcW
         9P6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tmed1jeBZ5AybmMhwZvMFWvP/a/HwCGONjFVZMu41zE=;
        b=VuH3nS7oCwBViqyr8T4dNmN4D3U8KZInzIoHCBhRnE9+o3bQcbrgNQQ7sF+uMeMXqE
         eXI6xUEBzSrWj5PN8+TupeGPTN9/KO3y/g5L1xy38H6DBYgn7KgrgUuzGC2eapCwvb37
         8ut5ynZmdAkpLYbZE/OdRbtzQl9KXSdK1Ip46RNROr/VZJzBgExvILRfhk3UIiwwxSCZ
         n2dIOywLemuGz3mwdd/W8KWL8HSGJlnwVsRHS6dSJmDCuKDPM083gzIzBZShTlZlGefh
         9nYUvaXLeQMKUcl5KcLsI4iW8mROhyPrPPTX4ekzBwlzBHHAt4mEFsYoucwJVdZRnc1O
         gP2w==
X-Gm-Message-State: AO0yUKW2JHR2UZ3M4x5kfdxo27fArH7rG35XOvwqwOVW2kjs5YBKH5pQ
        yCtaWx1PAqJZyBLWrOIUbSr4sw==
X-Google-Smtp-Source: AK7set83YHXEvsgL8aoSr/C3Ep9V9AvsQelC+QFyKa2M2Ln+SyAy7ut2BmyU7lCTP81l1gJfdgTM/g==
X-Received: by 2002:a5d:6b81:0:b0:2c5:4ea7:a8e2 with SMTP id n1-20020a5d6b81000000b002c54ea7a8e2mr6563930wrx.33.1677072150228;
        Wed, 22 Feb 2023 05:22:30 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id u3-20020adff883000000b002c703d59fa7sm5031553wrp.12.2023.02.22.05.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:22:29 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Werner Sembach <wse@tuxedocomputers.com>,
        dmitry.torokhov@gmail.com, hdegoede@redhat.com,
        wse@tuxedocomputers.com, chenhuacai@kernel.org, tiwai@suse.de,
        wsa+renesas@sang-engineering.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix strange behavior of touchpad on Clevo NS70PU
In-Reply-To: <20230220183014.238432-1-wse@tuxedocomputers.com>
References: <20230220183014.238432-1-wse@tuxedocomputers.com>
Date:   Wed, 22 Feb 2023 14:22:29 +0100
Message-ID: <878rgp4yy2.fsf@baylibre.com>
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

On lun., f=C3=A9vr. 20, 2023 at 19:30, Werner Sembach <wse@tuxedocomputers.=
com> wrote:

> When closing the laptop lid with an external screen connected, the mouse
> pointer has a constant movement to the lower right corner. Opening the
> lid again stops this movement, but after that the touchpad does no longer
> register clicks.
>
> The touchpad is connected both via i2c-hid and PS/2, the predecessor of
> this device (NS70MU) has the same layout in this regard and also strange
> behaviour caused by the psmouse and the i2c-hid driver fighting over
> touchpad control. This fix is reusing the same workaround by just
> disabling the PS/2 aux port, that is only used by the touchpad, to give t=
he
> i2c-hid driver the lone control over the touchpad.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/serio/i8042-acpipnpio.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/=
i8042-acpipnpio.h
> index efc61736099b9..3a6640a11dd99 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -1156,6 +1156,12 @@ static const struct dmi_system_id i8042_dmi_quirk_=
table[] __initconst =3D {
>  					SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOLOOP |
>  					SERIO_QUIRK_NOPNP)
>  	},
> +	{
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_NAME, "NS5x_7xPU"),
> +		},
> +		.driver_data =3D (void *)(SERIO_QUIRK_NOAUX)
> +	},
>  	{
>  		.matches =3D {
>  			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
> --=20
> 2.34.1
