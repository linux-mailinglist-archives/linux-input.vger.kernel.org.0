Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E9E2EED4B
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 06:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbhAHFw3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 00:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbhAHFw3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 00:52:29 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F720C0612F8
        for <linux-input@vger.kernel.org>; Thu,  7 Jan 2021 21:51:49 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id a4so3859116qvd.12
        for <linux-input@vger.kernel.org>; Thu, 07 Jan 2021 21:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MX7xZeIbOZ2lP14PH/h3IO7h03HUYPULgbQXQNatGss=;
        b=tPyGzo2qaGdhfmc7ch+vBMMepvPlXq2ByPrRehlSKitQYVLu3U9SaUWHmOHGxIsvCr
         CoWPmiZrP3sG8g4wXyb0iWQfcPoJzCj5+zxFCdcWY5xJDMWs44Xr9/GzHq7AcyyLmHx0
         BOMgblGIvDBzIDYKwy0v/FO8GFnsZj47mLIdjhX2n1NJUz7jeS7su8gGfmG6oBA9YmPV
         NZyzZEWD3lCJLRXhDyNijO7O5jGZEZViEQk9IgxIq+cOq728LRPsT7mhaoDH/XEHQXi6
         lcVJrsnY68oxeur5qW0SiiLCwQkX8iH6izzDj9JnBYEWbuDi8oS4y8NSzmJJWVIg+a2G
         0FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MX7xZeIbOZ2lP14PH/h3IO7h03HUYPULgbQXQNatGss=;
        b=uMUTZoBV1wcO6JfxznHOFxuCmx5BUt4r76BmS4fMiEb/DLwRYAbn3xDzWb90OYAyia
         Z6A9QaRSCC/lDcTk6hMDbycM/BoP9Jw2czQ3Zb/ca7EFUPdmuajsQd0WVKy8GGRmfmCl
         7W6cysD3sd8TNOkfglMIV4Vdt8yLyYY0yU7OyUFLb7ew/iuzcC69Fqos/lz39SzKO0qv
         +9yIQv4gon3/R7e5mc3aTSC+EXM0100TmW5S1niy8A6KD/PDXNmXfsnifoZlCycix03M
         fZ0YEakx86mVJr09tzPS6XmnaSY3cnWTt+fYNfXzFf9TQ+2VhW/J7njuf1LnYTJCh0IW
         Q9Zg==
X-Gm-Message-State: AOAM532rBFDrxJpWjHhnxfB0I88oit5b4vtSlY+R43hPfGXpGA7udhnf
        6iY8W9+sEusw7VxJkPsO1Q6WB9wHJOSO4EBXG1RMNddZmic=
X-Google-Smtp-Source: ABdhPJzmmzfP4KdW3JPRc7EiUtdQZgYiDC/lQZeCCkDp4L8be7d3pZ9SWBh3aXF9LBLh1c56iO49FWjvkjwwAJHfVIo=
X-Received: by 2002:a05:6214:c4a:: with SMTP id r10mr2189388qvj.60.1610085108352;
 Thu, 07 Jan 2021 21:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-6-roderick@gaikai.com> <16e2def9-2d88-45f2-1a76-4de209f1af78@florianmaerkl.de>
In-Reply-To: <16e2def9-2d88-45f2-1a76-4de209f1af78@florianmaerkl.de>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Thu, 7 Jan 2021 21:51:37 -0800
Message-ID: <CANndSK=-FrjrZLWpJ5WvSzffnMm4akY_gD2jhfcfDn-fgJxGOw@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] HID: playstation: add DualSense accelerometer
 and gyroscope support.
To:     =?UTF-8?Q?Florian_M=C3=A4rkl?= <linux@florianmaerkl.de>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Florian,

Thanks for your comments.

On Thu, Jan 7, 2021 at 5:34 AM Florian M=C3=A4rkl <linux@florianmaerkl.de> =
wrote:
>
> > +static struct input_dev *ps_sensors_create(struct hid_device *hdev, in=
t accel_range, int accel_res,
> > +             int gyro_range, int gyro_res)
> > +{
> > +     struct input_dev *sensors;
> > +     int ret;
> > +
> > +     sensors =3D ps_allocate_input_dev(hdev, "Motion Sensors");
> > +     if (IS_ERR(sensors))
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     __set_bit(INPUT_PROP_ACCELEROMETER, sensors->propbit);
> > +
> > +     /* Accelerometer */
> > +     input_set_abs_params(sensors, ABS_X, -accel_range, accel_range, 1=
6, 0);
> > +     input_set_abs_params(sensors, ABS_Y, -accel_range, accel_range, 1=
6, 0);
> > +     input_set_abs_params(sensors, ABS_Z, -accel_range, accel_range, 1=
6, 0);
> > +     input_abs_set_res(sensors, ABS_X, accel_res);
> > +     input_abs_set_res(sensors, ABS_Y, accel_res);
> > +     input_abs_set_res(sensors, ABS_Z, accel_res);
> > +
> > +     /* Gyroscope */
> > +     input_set_abs_params(sensors, ABS_RX, -gyro_range, gyro_range, 16=
, 0);
> > +     input_set_abs_params(sensors, ABS_RY, -gyro_range, gyro_range, 16=
, 0);
> > +     input_set_abs_params(sensors, ABS_RZ, -gyro_range, gyro_range, 16=
, 0);
> > +     input_abs_set_res(sensors, ABS_RX, gyro_res);
> > +     input_abs_set_res(sensors, ABS_RY, gyro_res);
> > +     input_abs_set_res(sensors, ABS_RZ, gyro_res);
> > +
> > +     ret =3D input_register_device(sensors);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return sensors;
> > +}
>
> The bits for EV_MSC/MSC_TIMESTAMP events are not set here, hence
> timestamp events would not delivered:
>
>         __set_bit(EV_MSC, sensors->evbit);
>         __set_bit(MSC_TIMESTAMP, sensors->mscbit);

I don't know how I missed this... I remember adding it, but nope
apparently not :(

> >  static int dualsense_get_mac_address(struct dualsense *ds)
> >  {
> >       uint8_t *buf;
> > @@ -319,6 +469,7 @@ static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
> >       struct dualsense_input_report *ds_report;
> >       uint8_t battery_data, battery_capacity, charging_status, value;
> >       int battery_status;
> > +     uint16_t sensor_timestamp;
>
> This uint16_t variable overflows just after a few events. Since the
> timestamp from the controller is 32bit and the event value too, I assume
> this should be too.

Agreed.

>
> --
> Florian M=C3=A4rkl
> https://metallic.software

Regards,
Roderick
