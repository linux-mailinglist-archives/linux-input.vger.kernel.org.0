Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D14C2E6B7E
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 00:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbgL1Wz4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Dec 2020 17:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbgL1V1n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Dec 2020 16:27:43 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802E7C0613D6
        for <linux-input@vger.kernel.org>; Mon, 28 Dec 2020 13:27:01 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id z3so7760301qtw.9
        for <linux-input@vger.kernel.org>; Mon, 28 Dec 2020 13:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KAK/qKCgt9WujMNQAyK8U1+/9rO/evAUmcSOHIepX40=;
        b=JEMehpxuFxRH9P5Nf76qRJcZBWsuNoo4Ykd6Fxf09d6URPk29z6MZ90Fk3Vh0/1qRd
         jW408B4GCrK2NPYzCErJp5hYEh94YruoXFqeWGMMie/4/j6vECVqimSMY3OZjk+3hvXh
         skGMKV5XiTHxypSKE+WGFYV2YzbTCEYynnKuHncqFN6fGwlTZTh9M+1BzPEXpleApTIy
         AqdTlorns7peZ4eJlC4JOgO6g/OYIRTKGj74bldL1HqHzHoVPxuDm0Cao3bX0nazJuEi
         mQN6O+/JH8AMeufIgBEYsPwngdmkeC7OXZRyE21+FCTxBcvraea5ta9D6VCIapNUFj56
         GbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KAK/qKCgt9WujMNQAyK8U1+/9rO/evAUmcSOHIepX40=;
        b=oQX7Khw8KHTl7pmIHOUdBE6HrU59b7z5TYrZcIsFieKR+nCuIy2ygoovnTKg5LMnuV
         HKjwzA3hrDM3vhzX7UKe+4Xf8am9iQ+RMwE76N+QMlWVYh0vSsd/6vU0rt29vnmX+Gun
         92UBLD3XPWbPg3uxHhvYoL08TIFchjq7b2rM+wp7G/8X546D4P6lD27EU1/Ou1fyZZyF
         8q3XilpesGMr/T42WQ+lekvXVWOCB1Z9OP54+ObllhGqzLdoOatEWJSQPizalDZ2vCi1
         nDaWuRV1NyMNFmS0fS40ChHan5ftGh+BPxl9HyMbqXRLdDO6QyHEpx/CZYjcKxZIcnUZ
         cHFQ==
X-Gm-Message-State: AOAM5315exWkjEqhYmjN64lDE8Z67kmA/tXQhd0AYv+Btxg1QwJo0aNy
        9AgIrD0eTgtf2AEYH0QV6ndbJq9CC+ZunS07DRgOKA==
X-Google-Smtp-Source: ABdhPJxEmgE6wFVZdCgL8gEuSVMxtJATfcv9o3oJf2iiYVbkK1+dIBGGW+E+Icnwaw52n7V1Hb4jA8kojEg8QWYO67M=
X-Received: by 2002:a05:622a:107:: with SMTP id u7mr46020823qtw.204.1609190820897;
 Mon, 28 Dec 2020 13:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-10-roderick@gaikai.com>
 <_n_Seien29lcWzPT6LHN7MEtqlVZpJOBRKw-qe01hEhSGbKKL7cffbmSGPjZZIN8Q4B8fInhwChsV0JB70F-wqj44ZQILevS6y3FXYaDtw8=@protonmail.com>
In-Reply-To: <_n_Seien29lcWzPT6LHN7MEtqlVZpJOBRKw-qe01hEhSGbKKL7cffbmSGPjZZIN8Q4B8fInhwChsV0JB70F-wqj44ZQILevS6y3FXYaDtw8=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Mon, 28 Dec 2020 13:26:50 -0800
Message-ID: <CANndSK=LSFyAf-7BfXJkCVrFcd7Auy64Wtqh65de6T7FkDN1Hw@mail.gmail.com>
Subject: Re: [PATCH 09/13] HID: playstation: add DualSense lightbar support
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnab=C3=A1s,

Thanks for your review.

On Sun, Dec 27, 2020 at 6:41 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hi
>
>
> 2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:
>
> > [...]
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstatio=
n.c
> > index 0b62bcb28d8a..f8cf82a27d43 100644
> > [...]
> > +/* Create a DualSense/DualShock4 RGB lightbar represented by a multico=
lor LED. */
> > +static struct led_classdev_mc *ps_lightbar_create(struct ps_device *ps=
_dev,
> > +     int (*brightness_set)(struct led_classdev *, enum led_brightness)=
)
> > +{
> > +     struct hid_device *hdev =3D ps_dev->hdev;
> > +     struct led_classdev_mc *lightbar_mc_dev;
> > +     struct mc_subled *mc_led_info;
> > +     struct led_classdev *led_cdev;
> > +     int ret;
> > +
> > +     lightbar_mc_dev =3D devm_kzalloc(&hdev->dev, sizeof(*lightbar_mc_=
dev), GFP_KERNEL);
> > +     if (!lightbar_mc_dev)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     mc_led_info =3D devm_kzalloc(&hdev->dev, 3*sizeof(*mc_led_info), =
GFP_KERNEL);
> > +     if (!mc_led_info)
> > +             return ERR_PTR(-ENOMEM);
> > +
>
> Is there any reason why these are dynamically allocated?

No particular reason. I should probably at least not dynamically
allocate 'mc_dev' and pass it in similar to regular LED registration
(previously I had my regular LEDs dynamically allocated). The
mc_led_info I will probably keep dynamic. It feels a bit nasty to have
the caller be aware of these internal details.

>
>
> > +     mc_led_info[0].color_index =3D LED_COLOR_ID_RED;
> > +     mc_led_info[0].channel =3D 0;
> > +     mc_led_info[1].color_index =3D LED_COLOR_ID_GREEN;
> > +     mc_led_info[1].channel =3D 1;
> > +     mc_led_info[2].color_index =3D LED_COLOR_ID_BLUE;
> > +     mc_led_info[2].channel =3D 2;
> > +
> > +     lightbar_mc_dev->subled_info =3D mc_led_info;
> > +     lightbar_mc_dev->num_colors =3D 3;
> > +
> > +     led_cdev =3D &lightbar_mc_dev->led_cdev;
> > +     led_cdev->name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL, "playst=
ation::%pMR::rgb",
> > +                     ps_dev->mac_address);
>
> I guess the double colons are used because the MAC address has ':' in it;=
 but
> as far as I know this doesn't follow the naming scheme for LED devices, s=
o I'm
> not sure if this is the best way to go about it.

Actually it was Benjamin who suggested this type of naming. He wasn't
a fan of the previous hid-sony device naming (neither was I). This was
the main idea so far.

>
> > +     led_cdev->brightness =3D 255;
> > +     led_cdev->max_brightness =3D 255;
> > +     led_cdev->brightness_set_blocking =3D brightness_set;
> > +
> > +     ret =3D devm_led_classdev_multicolor_register(&hdev->dev, lightba=
r_mc_dev);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Cannot register multicolor LED device\n");
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     return lightbar_mc_dev;
> > +}
> > [...]
> > +static int dualsense_reset_leds(struct dualsense *ds)
> > +{
> > +     struct dualsense_output_report report;
> > +     uint8_t *buf;
> > +
> > +     buf =3D kzalloc(sizeof(struct dualsense_output_report_bt), GFP_KE=
RNEL);
> > +     if (!buf)
> > +             return -ENOMEM;
> > +
> > +     dualsense_init_output_report(ds, &report, buf);
> > +     /* On Bluetooth the DualSense outputs an animation on the lightba=
r
> > +      * during startup and maintains a color afterwards. We need to ex=
plicitly
> > +      * reconfigure the lightbar before we can do any programming late=
r on.
> > +      * In USB the lightbar is not on by default, but redoing the setu=
p there
> > +      * doesn't hurt.
> > +      */
> > +     report.common->valid_flag2 =3D DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SET=
UP_CONTROL_ENABLE;
> > +     report.common->lightbar_setup =3D 2; /* Fade light out. */
>
> Maybe it'd be better to name that '2'?

Will document this one.

>
>
> > +     dualsense_send_output_report(ds, &report);
> > +
> > +     kfree(buf);
> > +     return 0;
> > +}
> > [...]
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze

Thanks,
Roderick
