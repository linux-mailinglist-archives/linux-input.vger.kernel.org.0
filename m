Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078752EFCC1
	for <lists+linux-input@lfdr.de>; Sat,  9 Jan 2021 02:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbhAIBf3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 20:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbhAIBf3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 20:35:29 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782E9C061573
        for <linux-input@vger.kernel.org>; Fri,  8 Jan 2021 17:35:14 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id 2so7872104qtt.10
        for <linux-input@vger.kernel.org>; Fri, 08 Jan 2021 17:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C+11QO2WQmDQtpk2TELTn99UMzlV/u3IHwyDxqH1kWQ=;
        b=AM6nDahVF18pvwbNflkciimLkWP0wghJTsxDHRKx3zWHEH3iXI7zA6JLkxgp19wqJN
         4feXYF2Ns2Dd4VkTu1XY4sRX7703kQ8bAWEksyWns2FeCMxwyPe8Z9sJiW7qFC+ABc99
         Lrn19iFtV7Ba+QIYw0ktK4UU0moZYcLw8Q+GHV1oyJ73jC+m984E0DHAtPitZXSMqyyr
         grqqojZLZO6jTmdAzhlMf6YFqsNmLwYJNy1u/WwHYQ1iOP+/GvXggWh9NaSVVqQFGxa+
         QG6AAUeeh/rmx82FiTGdGpGaKQ4yVkxYGZgXvk00BozIHgFYB7tT86ULeHzdCZ1NemyS
         WvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C+11QO2WQmDQtpk2TELTn99UMzlV/u3IHwyDxqH1kWQ=;
        b=JRqiC5lPQI4K0SfV01+byC3td5gzrkWDLl+MlpYyBQj7sV5VF+aWCXjWcWkBc/o4AX
         1xBGaWO6aHDErf5HCRZ7d7gHP4cndQ29/3NwbaoCVAMElKrxp8ET0Izujc5kF9Ym+JuC
         ZH/5i9gOwCqymGI16LEeWkHwwqg2ItSgngKk7vSfqCm5nhg8bEpvsgJEA71DS6fuqLAc
         ZPEm5QL3YE9AaPvr0PxMvK4qyukk+sGSL44yuz/n5Avm6B3D5dCkN5w56Kdz7inc+Oi3
         plbtVjZpeKLGsTceVJE1JO2Ny/8UXcibEhvxT9f1X7JLcIMN8rtOEmFpmgzjhC5JQ4OY
         Y/Qg==
X-Gm-Message-State: AOAM531Fd1ACqwGRU0unRydzCXMTPzXPoaLJG1QCjqX2SYfAyLqLgB+c
        Z4420ZoTuBLzr6OFWJziCWFjdxdDW7aDU9g3TQarJA==
X-Google-Smtp-Source: ABdhPJyWc+gjzvmsHFptjJ+TCVCWaZVUeuDC24xSmRbzfoeTPVWSl2yFE//kveyrmdwM/owp2jBomFF87MdaE65Q+V4=
X-Received: by 2002:ac8:46c8:: with SMTP id h8mr6221912qto.17.1610156113525;
 Fri, 08 Jan 2021 17:35:13 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-14-roderick@gaikai.com>
 <dFczDbiHgeToh7k4T1Mj0RbQswy7l-e1u4-XRIYhM0BAo41tGrjjt_OsbMnFb81IJncn9oaCqKfFsgNoiJ8W3_CMW-WkSG9fx4kR6Cbw-d0=@protonmail.com>
In-Reply-To: <dFczDbiHgeToh7k4T1Mj0RbQswy7l-e1u4-XRIYhM0BAo41tGrjjt_OsbMnFb81IJncn9oaCqKfFsgNoiJ8W3_CMW-WkSG9fx4kR6Cbw-d0=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Fri, 8 Jan 2021 17:35:01 -0800
Message-ID: <CANndSK=VMJ5FCsSSAM5sYyqY4_5pJqjTSyT0gHpOTV0MURMh2g@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] HID: playstation: report DualSense hardware and
 firmware version.
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

A couple of places lacked MAC address checks (some of these reports I
didn't have datasheets on). In the end I decided to make a new helper
function as there is so much common nasty code. It also exposed a few
tiny bugs as some reports were an incorrect size (not critical as the
data wasn't used). It is a lot simpler now with more and better
checking.

static int ps_get_report(struct hid_device *hdev, uint8_t report_id,
uint8_t *buf, size_t size)
{
    int ret;

    ret =3D hid_hw_raw_request(hdev, report_id, buf, size,
HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
    if (ret < 0) {
        hid_err(hdev, "Failed to retrieve feature report %d,
ret=3D%d\n", report_id, ret);
        return ret;
    }

    if (ret !=3D size) {
        hid_err(hdev, "Invalid byte count transferred, expected %zu
got %d\n", size, ret);
        return -EINVAL;
    }

    if (buf[0] !=3D report_id) {
        hid_err(hdev, "Incorrect reportID received, expected %d got
%d\n", report_id, buf[0]);
        return -EINVAL;
    }

    if (hdev->bus =3D=3D BUS_BLUETOOTH) {
        /* Last 4 bytes contains crc32. */
        uint8_t crc_offset =3D size - 4;
        uint32_t report_crc =3D get_unaligned_le32(&buf[crc_offset]);

        if (!ps_check_crc32(PS_FEATURE_CRC32_SEED, buf, crc_offset,
report_crc)) {
            hid_err(hdev, "CRC check failed for reportID=3D%d\n", report_id=
);
            return -EILSEQ;
        }
    }

    return 0;
}

On Thu, Jan 7, 2021 at 2:26 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.c=
om> wrote:
>
> Hi
>
>
> 2021. janu=C3=A1r 2., szombat 23:31 keltez=C3=A9ssel, Roderick Colenbrand=
er =C3=ADrta:
>
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstatio=
n.c
> > index 1a95c81da8a3..8440af6d6cd7 100644
> > --- a/drivers/hid/hid-playstation.c
> > +++ b/drivers/hid/hid-playstation.c
> > [...]
> > +static int dualsense_get_firmware_info(struct dualsense *ds)
> > +{
> > +     uint8_t *buf;
> > +     int ret;
> > +
> > +     buf =3D kzalloc(DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL)=
;
> > +     if (!buf)
> > +             return -ENOMEM;
> > +
> > +     ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_FIRMW=
ARE_INFO, buf,
> > +                     DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, HID_FEATURE=
_REPORT,
> > +                     HID_REQ_GET_REPORT);
> > +     if (ret < 0)
> > +             goto err_free;
> > +     else if (ret !=3D DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE) {
>
> As per coding style[1], please either use {} for all branches, or just dr=
op the
> `else` and maybe add a new line:
>
> ```
> if (ret < 0)
>   goto ...
>
> if (ret !=3D ...) {
>   ...
> }
> ```
>
> > +             hid_err(ds->base.hdev, "failed to retrieve DualSense firm=
ware info\n");
> > +             ret =3D -EINVAL;
> > +             goto err_free;
> > +     }
>
> Shouldn't the CRC be validated here when using Bluetooth? Or there is non=
e?
>
>
> > +
> > +     ds->base.hw_version =3D get_unaligned_le32(&buf[24]);
> > +     ds->base.fw_version =3D get_unaligned_le32(&buf[28]);
> > +
> > +err_free:
> > +     kfree(buf);
> > +     return ret;
> > +}
> > +
> >  static int dualsense_get_mac_address(struct dualsense *ds)
> >  {
> >       uint8_t *buf;
> > @@ -1195,6 +1261,12 @@  static struct ps_device *dualsense_create(struc=
t hid_device *hdev)
> >       }
> >       snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_add=
ress);
> >
> > +     ret =3D dualsense_get_firmware_info(ds);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Failed to get firmware info from DualSense=
\n");
> > +             return ERR_PTR(ret);
> > +     }
> > +
> >       ret =3D ps_devices_list_add(ps_dev);
> >       if (ret < 0)
> >               return ERR_PTR(ret);
> > @@ -1261,6 +1333,12 @@  static struct ps_device *dualsense_create(struc=
t hid_device *hdev)
> >       /* Set player LEDs to our player id. */
> >       dualsense_set_player_leds(ds);
> >
> > +     /* Reporting hardware and firmware is important as there are freq=
uent updates, which
> > +      * can change behavior.
> > +      */
> > +     hid_info(hdev, "Registered DualSense controller hw_version=3D%x f=
w_version=3D%x\n",
>
> Maybe the format could be same as in the device attributes (0x%08x)?
>
>
> > +                     ds->base.hw_version, ds->base.fw_version);
> > +
> >       return &ds->base;
> >
> >  err:
> > @@ -1311,6 +1389,12 @@  static int ps_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
> >               }
> >       }
> >
> > +     ret =3D devm_device_add_group(&hdev->dev, &ps_device_attribute_gr=
oup);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Failed to register sysfs nodes.\n");
> > +             goto err_close;
> > +     }
> > +
> >       return ret;
> >
> >  err_close:
> >
>
>
> [1]: https://www.kernel.org/doc/html/latest/process/coding-style.html#pla=
cing-braces-and-spaces
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze



--=20
Roderick Colenbrander
Senior Manager of Hardware & Systems Engineering
Sony Interactive Entertainment LLC
roderick.colenbrander@sony.com
