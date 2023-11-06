Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFC77E2C59
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 19:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjKFSvU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 13:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbjKFSvT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 13:51:19 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF07B0
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 10:51:16 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso7967164a12.2
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699296674; x=1699901474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3sFMa4mrCrIt5HMKYmEudD0oTkfSxmDVnrog7L0W6g=;
        b=Q1bqK2WIzoRN/mxg81aRC5WsEGo7bQEFvnBFjy4rWtydUxOZbRXUMTFY9fPYnBgnT2
         VwcWSsPd1Eazrx/HFD1ipc2B+sp8VkJ1Nunn7klEy/Vl8MgC1YMx4yZuTHqlVsc1IVIH
         FLSx1uBOPC23eZEAl9FbuTP/BUU2lgHO1nxZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699296674; x=1699901474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3sFMa4mrCrIt5HMKYmEudD0oTkfSxmDVnrog7L0W6g=;
        b=loGkndQkNNOSFk8qPORkg7bagu4n56PjNWueyQ4yZVAlmRMkofGpKEfBGhkkZ4a2Yf
         wFq8QMObosc1KOlwAvbTGdtn6/EL6m1ptODuXGqz/P8voEQY1nV6+k5jEQLKbUYX0pOf
         DTA4lwxsNW4Va0w2cDv4KMXwL3cLBv0+Hn6ySlvlGjHUUhScuGwY9lUPA8xsqkbKFH1f
         T64k7Qmu7dH7u1LSn2NxdNgbf99todxjJEipNj3Glx1uJ/emkTwXitdIs8/AaejSrYof
         9mTiE4LnLi6nvAtt+XCSBcFvuTDqrw9J1CaJy5lTUmSr5G1jUZjpehu896OmKW/cIDfg
         1FZQ==
X-Gm-Message-State: AOJu0YxCcs6L7rl1EytFsoTcVJBUHi/j3qb0eQyww/nEzeTLm4Qpe2Cm
        Q/XkESnIlCgIz2TQFJoMLvReIH6+CLihgOwgH98RkI2M
X-Google-Smtp-Source: AGHT+IEHYKwAifSNmBTImMmyQVUjHDQ1j4fe9mazQMJZsgEodwHGmCyJvBAyK/nmzyHKNgq7JoyCVQ==
X-Received: by 2002:a50:f68d:0:b0:543:cc90:d95 with SMTP id d13-20020a50f68d000000b00543cc900d95mr10411310edn.40.1699296674709;
        Mon, 06 Nov 2023 10:51:14 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id u22-20020a50a416000000b0053e15aefb0fsm4702326edb.85.2023.11.06.10.51.14
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 10:51:14 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40853f2e93eso9695e9.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:51:14 -0800 (PST)
X-Received: by 2002:a1c:4b0d:0:b0:405:35bf:7362 with SMTP id
 y13-20020a1c4b0d000000b0040535bf7362mr18383wma.0.1699296673938; Mon, 06 Nov
 2023 10:51:13 -0800 (PST)
MIME-Version: 1.0
References: <20231104111743.14668-1-hdegoede@redhat.com> <20231104111743.14668-2-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-2-hdegoede@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 10:50:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XBoq3ydHcSgKxRBC0f=-jytkcQpwst7BmmFZVtTBqNtQ@mail.gmail.com>
Message-ID: <CAD=FV=XBoq3ydHcSgKxRBC0f=-jytkcQpwst7BmmFZVtTBqNtQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] HID: i2c-hid: Fold i2c_hid_execute_reset() into i2c_hid_hwreset()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Julian Sax <jsbc@gmx.de>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sat, Nov 4, 2023 at 4:17=E2=80=AFAM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> @@ -482,21 +442,49 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
>
>         ret =3D i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
>         if (ret)
> -               goto out_unlock;
> +               goto err_unlock;
>
> -       ret =3D i2c_hid_execute_reset(ihid);
> +       /* Prepare reset command. Command register goes first. */
> +       *(__le16 *)ihid->cmdbuf =3D ihid->hdesc.wCommandRegister;
> +       length +=3D sizeof(__le16);
> +       /* Next is RESET command itself */
> +       length +=3D i2c_hid_encode_command(ihid->cmdbuf + length,
> +                                        I2C_HID_OPCODE_RESET, 0, 0);
> +
> +       set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +
> +       ret =3D i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
>         if (ret) {
>                 dev_err(&ihid->client->dev,
>                         "failed to reset device: %d\n", ret);
> -               i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
> -               goto out_unlock;
> +               goto err_clear_reset;
>         }
>
> +       if (ihid->quirks & I2C_HID_QUIRK_NO_IRQ_AFTER_RESET) {
> +               msleep(100);
> +               clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +       }
> +
> +       i2c_hid_dbg(ihid, "%s: waiting...\n", __func__);
> +       if (!wait_event_timeout(ihid->wait,
> +                               !test_bit(I2C_HID_RESET_PENDING, &ihid->f=
lags),
> +                               msecs_to_jiffies(5000))) {
> +               ret =3D -ENODATA;
> +               goto err_clear_reset;
> +       }
> +       i2c_hid_dbg(ihid, "%s: finished.\n", __func__);

super nitty, but I wonder if your i2c_hid_dbg() message saying
"waiting" should move above the check for
I2C_HID_QUIRK_NO_IRQ_AFTER_RESET. Then you'll have a message printed
before your msleep. I guess technically you could then add an "else
if" for the second "if" statement which would make it more obvious to
the reader that the "wait_event_timeout" won't happen when the quirk
is present.

Above is just a nit, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
