Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCA17E2C61
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 19:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbjKFSxY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 13:53:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbjKFSxX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 13:53:23 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1C9B3
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 10:53:20 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5440f25dcc7so6060376a12.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699296796; x=1699901596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPn1hUgdVXBJBAN5wyCv2Atky2MFl7+ivcH9LQJRjdw=;
        b=eNvecEH3/CJtn3AyOi691JNy71bbIbplqQOgfD4HcWSjYMiwkGEckSw/G1MBtUKFyS
         iPr7VHYtHNs4P0Zh+T+XoHDadWAiNf6QjzXjRzyhGcHfv8Fv3Ocvk8pCYn467H1L0ycc
         9H/q5lI9wzXHH92KmO5a/Yve8w/yRprO/uX0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699296796; x=1699901596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPn1hUgdVXBJBAN5wyCv2Atky2MFl7+ivcH9LQJRjdw=;
        b=XoPPj6WAcfCDGRzCVOPtfSl/gfRe74eiDx3eRIef7IGCovYrwZJf8joCHGRZ3/kZ9S
         O9QXBauCtVtqR24NtDArIMFwFuP6OmY8S1WwqtBxu60rX/Y0I3jubLNNyVKz6NmMGVlV
         hDaoVGIVIMMdy25Kyx0vbLUwFRGttrZSmSeUtVuFQEedhh7mPm96UQp/mDvMLKGB4LPP
         pWKbATcJILkMi0KwK25TJrr3tKY3YdT2yDkIKV98rqp+XktADNcPP7Kz5VAL/8F9MAyX
         OXAF2YwZOfLSC/eFxjfqBG8QmEpl8ldktPKkh8XWX+Q4n3TyJePRjkSgH+U6dWNHuBa7
         NUVA==
X-Gm-Message-State: AOJu0YxtPaMNzoZmVCT+jN4xUvnJNE3iqnccAFE1AutRFtbnTYY4o8sa
        4E2WZrLu0lDl5OUCFqvQEYjZwb8Ds+9gotkReDY+ecsY
X-Google-Smtp-Source: AGHT+IFdpUsGO0BS56QoRarpsqvVWacw0uIgNQzFpIV/spqcoMbtQx6li/mValTM28ReyDSyx2jl3A==
X-Received: by 2002:a17:907:9617:b0:9d3:f436:6826 with SMTP id gb23-20020a170907961700b009d3f4366826mr13549439ejc.38.1699296796195;
        Mon, 06 Nov 2023 10:53:16 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906061400b009b27d4153cfsm136196ejb.176.2023.11.06.10.53.15
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 10:53:15 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40853f2e93eso9875e9.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:53:15 -0800 (PST)
X-Received: by 2002:a05:600c:a005:b0:408:3727:92c5 with SMTP id
 jg5-20020a05600ca00500b00408372792c5mr16637wmb.2.1699296795096; Mon, 06 Nov
 2023 10:53:15 -0800 (PST)
MIME-Version: 1.0
References: <20231104111743.14668-1-hdegoede@redhat.com> <20231104111743.14668-3-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-3-hdegoede@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 10:53:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W3JQu08zwp1XtOPcD9oHNwfC65dVVsxtyTkFog95oLQw@mail.gmail.com>
Message-ID: <CAD=FV=W3JQu08zwp1XtOPcD9oHNwfC65dVVsxtyTkFog95oLQw@mail.gmail.com>
Subject: Re: [PATCH 2/7] HID: i2c-hid: Split i2c_hid_hwreset() in start() and
 finish() functions
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
> @@ -460,6 +460,20 @@ static int i2c_hid_hwreset(struct i2c_hid *ihid)
>                 goto err_clear_reset;
>         }
>
> +       return 0;

The mutex "contract" between i2c_hid_start_hwreset() and
i2c_hid_finish_hwreset() is non-obvious and, IMO, deserves a comment.
Specifically i2c_hid_start_hwreset() will grab and leave the mutex
locked if it returns 0. Then i2c_hid_finish_hwreset() expects the
mutex pre-locked and will always release it.

While reviewing later patches, I actually realized that _I think_
things would be cleaner by moving the mutex lock/unlock to the
callers. Maybe take a look at how the code looks with that?

> @@ -732,7 +745,9 @@ static int i2c_hid_parse(struct hid_device *hid)
>         }
>
>         do {
> -               ret =3D i2c_hid_hwreset(ihid);
> +               ret =3D i2c_hid_start_hwreset(ihid);
> +               if (ret =3D=3D 0)
> +                       ret =3D i2c_hid_finish_hwreset(ihid);
>                 if (ret)
>                         msleep(1000);

nit: it's slightly weird that two "if" tests next to each other use
different style. One compares against 0 and the other just implicitly
treats an int as a bool. I'm fine with either way, but it's nice to
keep the style the same within any given function (even better if it
can be the same throughout the driver).


> @@ -975,10 +990,13 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid=
)
>          * However some ALPS touchpads generate IRQ storm without reset, =
so
>          * let's still reset them here.
>          */
> -       if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME)
> -               ret =3D i2c_hid_hwreset(ihid);
> -       else
> +       if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME) {
> +               ret =3D i2c_hid_start_hwreset(ihid);
> +               if (ret =3D=3D 0)
> +                       ret =3D i2c_hid_finish_hwreset(ihid);

nit: Above is also a "if (ret =3D=3D 0)" vs below "if (ret)"...


> +       } else {
>                 ret =3D i2c_hid_set_power(ihid, I2C_HID_PWR_ON);
> +       }
>
>         if (ret)
>                 return ret;

The above is mostly nits. I'd be OK with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
