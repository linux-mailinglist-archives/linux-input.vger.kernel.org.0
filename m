Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 374877E2C6D
	for <lists+linux-input@lfdr.de>; Mon,  6 Nov 2023 19:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbjKFSyS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Nov 2023 13:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbjKFSyR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Nov 2023 13:54:17 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BFBA2
        for <linux-input@vger.kernel.org>; Mon,  6 Nov 2023 10:54:14 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9c773ac9b15so720003866b.2
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699296852; x=1699901652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7tUXb1bK9W/Kfohm4rWbxYMVcf6n7wDZL3rERreiD4=;
        b=RqsDCJkIcPqz/ZzbSkQmY+6po68JB5Z5/17WGXbh2oUkNr74YkWn/i7qqm5AWjojlN
         oKyGGZGaKMLPWOAIbjmW/7pxJD8ZWeP4X0bB1qL/qmwlBgz8z7gK0tHyW9qlyHNBu5Cd
         Ycs2nPW16ZDimSB2SGEV0J/uXQcam1GQe3Xu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699296852; x=1699901652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7tUXb1bK9W/Kfohm4rWbxYMVcf6n7wDZL3rERreiD4=;
        b=bGPK+74AV62nYg15dLwoWlTpCiuuoYsjJA3dN0vmN4zN7jmi+yjPiKL5qWWTkKL+5i
         Tp/smmAex5tMmhZPXOmTQ035aoMKK+7QqzrgexCAK5xXCrZedF7jA1leEfW54aBxrKHi
         82aNfkHl5aXhcs66PUyeaTbKRB7ivcENGsEQn+zcaNF3EAItDULePznLXGMV5LBq8EmF
         EI4gs+MORUVPXFNs5lIJKifEHqLczm/t0f6uVrbmPhFo6a3704qZJZ70kKBLRbESa9CM
         ec+Sy/LylDGWTuIomAGbIE/JEysBf5kknm+prACSJnAP3wSdXCgOj76g7LxG59dFezR+
         zh2Q==
X-Gm-Message-State: AOJu0YxAdB6zmRH8yZl1wzd2V5ie/I6Yg/YUUET/M716gRYXppXvPanE
        BF6pJrnlJVNTOYijon64IpgiTQUY3lOyzQWnyYPrOAKq
X-Google-Smtp-Source: AGHT+IGVNACL7kdOahJomhRsX8pq6KFfY8bhCI1YVi+cyBfHD50JtMrHnIhEcDbE28hVsfsFtGHz+A==
X-Received: by 2002:a17:907:d05:b0:9be:6bf0:2f95 with SMTP id gn5-20020a1709070d0500b009be6bf02f95mr17603062ejc.20.1699296851833;
        Mon, 06 Nov 2023 10:54:11 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a15-20020a1709062b0f00b009920a690cd9sm138087ejg.59.2023.11.06.10.54.11
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 10:54:11 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40837124e1cso10315e9.0
        for <linux-input@vger.kernel.org>; Mon, 06 Nov 2023 10:54:11 -0800 (PST)
X-Received: by 2002:a05:600c:1da0:b0:3fe:eb42:7ec with SMTP id
 p32-20020a05600c1da000b003feeb4207ecmr15137wms.1.1699296850951; Mon, 06 Nov
 2023 10:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20231104111743.14668-1-hdegoede@redhat.com> <20231104111743.14668-5-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-5-hdegoede@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Nov 2023 10:53:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPR-oVtrh+vA2x3NPqr7Cn4yP0XJC_JLr0D7p9d2Z2kw@mail.gmail.com>
Message-ID: <CAD=FV=VPR-oVtrh+vA2x3NPqr7Cn4yP0XJC_JLr0D7p9d2Z2kw@mail.gmail.com>
Subject: Re: [PATCH 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after
 reading the report-descriptor
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
> @@ -746,8 +752,6 @@ static int i2c_hid_parse(struct hid_device *hid)
>
>         do {
>                 ret =3D i2c_hid_start_hwreset(ihid);
> -               if (ret =3D=3D 0)
> -                       ret =3D i2c_hid_finish_hwreset(ihid);

The mutex contract (talked about in a previous patch) is a little more
confusing now. ;-) Feels like it needs a comment somewhere in here so
the reader of the code understands that the reset_mutex might or might
not be locked here.

...or would it make more sense for the caller to just handle the mutex
to make it more obvious. The "I2C_HID_QUIRK_RESET_ON_RESUME" code
would need to grab the mutex too, but that really doesn't seem
terrible. In fact, I suspect it cleans up your error handling and
makes everything cleaner?


>                 if (ret)
>                         msleep(1000);
>         } while (tries-- > 0 && ret);
> @@ -763,9 +767,8 @@ static int i2c_hid_parse(struct hid_device *hid)
>                 i2c_hid_dbg(ihid, "Using a HID report descriptor override=
\n");
>         } else {
>                 rdesc =3D kzalloc(rsize, GFP_KERNEL);
> -
>                 if (!rdesc) {
> -                       dbg_hid("couldn't allocate rdesc memory\n");
> +                       i2c_hid_abort_hwreset(ihid);
>                         return -ENOMEM;
>                 }
>
> @@ -776,10 +779,21 @@ static int i2c_hid_parse(struct hid_device *hid)
>                                             rdesc, rsize);
>                 if (ret) {
>                         hid_err(hid, "reading report descriptor failed\n"=
);
> +                       i2c_hid_abort_hwreset(ihid);
>                         goto out;
>                 }
>         }
>
> +       /*
> +        * Windows directly reads the report-descriptor after sending res=
et
> +        * and then waits for resets completion afterwards. Some touchpad=
s
> +        * actually wait for the report-descriptor to be read before sign=
alling
> +        * reset completion.
> +        */
> +       ret =3D i2c_hid_finish_hwreset(ihid);
> +       if (ret)
> +               goto out;

Given your new understanding, I wonder if you should start reading the
report descriptor even if "use_override" is set? You'd throw away what
you read but maybe it would be important to make the touchscreen
properly de-assert reset? I guess this is the subject of the next
patch...

Also: I guess there's the assumption that the touchscreens needing the
other caller of the reset functions (I2C_HID_QUIRK_RESET_ON_RESUME)
never need to read the report like this?

-Doug
