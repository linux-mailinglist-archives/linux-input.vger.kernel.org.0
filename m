Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBE32E3316
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 23:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgL0WWZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 17:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgL0WWY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 17:22:24 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49950C061794
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 14:21:44 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id z9so5944857qtn.4
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 14:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NWEVjOdsuJ+01+S3pvVOe+yZLV2C3sCqozcJJI5/DD8=;
        b=FMtVi8aGS9OPw4QgGLEfv58ctLMbQhEmxgpWR3mJKnTrUjzAEZQULfT1ToQ27/eXgT
         66g1LuES1424j9f+DcRein2SpO/PqTjdv8rsP4oXOLKLURvGXdLToVArlXK1eHQngE1i
         xWzk5h1vL61tpLOQkZJgZS8MXauIlOsfGaKHdEUrPEY7pGWqnuyDlWP2pvERxDU1BCiQ
         9UUw4M6Ot16AQkAA36yvqIJ/i6KHhQs2ryqFpHRRXuGK4Vt9aYzeIFtqOex9ozhctTeG
         kT5xQ2TwcJC6C6qdoAWhqOKQugoV+4H4XGymkYjv7t8TUlUrQmpL1zNK/E//K9v7G7JH
         ablQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NWEVjOdsuJ+01+S3pvVOe+yZLV2C3sCqozcJJI5/DD8=;
        b=ZeNuo9Wg0Ud2PUN59Y9iy0ZEiROq6tg5aJ2KwZI8H3BliWWz7ydXUpVwfvfxnHIs4I
         WEw5SdqgopPIzUMOSWhrAJ0yM+TMsOk/zVq/r68BhxLwOpTZAvYzegpAFx1saCbxdRnD
         pGXW3AK1PLPIsiKPAQ07xX3N3sKMqvWjZ26N43nYE8SrxPW+96G/RhD5V2B8UTEKdQ3A
         kFZ+G76UkjPQii/jyfAObt1pX4JglD9csPKPLIuO5xg7stIEgHZi7MLDZxiV/z5gah7a
         5FAUElLcPUKDFCbR2jysRdZnmM59x6IyxTLAJhT5/PpYb0r7n59tjUPvnB5fa3FXGgaA
         uN7Q==
X-Gm-Message-State: AOAM530vpiLMk2vcug6+X67hcOp3zJwPfefBROp59XEfTocZXJgg4449
        83s5JIyCSbI4Ih7H+maEEi8DAidXajQZFfSaqNfVSQ==
X-Google-Smtp-Source: ABdhPJz62blcReyJGUy4j7fmMGANz4wqq1GyZoUmJ/fb21T7ME6YdvEFmeR3OcmW0d0L/L8lsxxLxZC5xiIlSMY3pms=
X-Received: by 2002:a05:622a:107:: with SMTP id u7mr41938991qtw.204.1609107702560;
 Sun, 27 Dec 2020 14:21:42 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-14-roderick@gaikai.com>
 <Wrry37udGNtUwRvYnSoet8ychKwk8YeD9NTEIjkfIMtrSmCXOc9h4oLcm5Uq77JV1AIgvP13uwxvXYuNAQF0jO_ZVp2M932WAPKQB5VdYGc=@protonmail.com>
In-Reply-To: <Wrry37udGNtUwRvYnSoet8ychKwk8YeD9NTEIjkfIMtrSmCXOc9h4oLcm5Uq77JV1AIgvP13uwxvXYuNAQF0jO_ZVp2M932WAPKQB5VdYGc=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sun, 27 Dec 2020 14:21:31 -0800
Message-ID: <CANndSKn8xFGR3Y7x3rXxjhcNn89tt55o+RyvZkTp-aMzbF-JcA@mail.gmail.com>
Subject: Re: [PATCH 13/13] HID: playstation: report DualSense hardware and
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

Thanks for you great feedback.

On Sun, Dec 27, 2020 at 9:06 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hi
>
>
> 2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:
>
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstatio=
n.c
> > index a55375ac79a9..2f989da906f3 100644
> > --- a/drivers/hid/hid-playstation.c
> > +++ b/drivers/hid/hid-playstation.c
> > [...]
> > +static ssize_t ps_show_firmware_version(struct device *dev,
> > +                             struct device_attribute
> > +                             *attr, char *buf)
> > +{
> > +     struct hid_device *hdev =3D to_hid_device(dev);
> > +     struct ps_device *ps_dev =3D hid_get_drvdata(hdev);
> > +
> > +     return snprintf(buf, PAGE_SIZE, "0x%08x\n", ps_dev->fw_version);
>
> `sysfs_emit()` is preferred over *printf().

Thanks, I wasn't aware of its existence. Looks like it was added
recently, but yeah it is a lot nicer.

>
> > +}
> > +
> > +static DEVICE_ATTR(firmware_version, 0444, ps_show_firmware_version, N=
ULL);
> > +
> > +static ssize_t ps_show_hardware_version(struct device *dev,
> > +                             struct device_attribute
> > +                             *attr, char *buf)
> > +{
> > +     struct hid_device *hdev =3D to_hid_device(dev);
> > +     struct ps_device *ps_dev =3D hid_get_drvdata(hdev);
> > +
> > +     return snprintf(buf, PAGE_SIZE, "0x%08x\n", ps_dev->hw_version);
>
> Same here.
>
>
> > +}
> > [...]
> > +static int dualsense_get_firmware_info(struct dualsense *ds)
> > +{
> > +     uint8_t *buf;
> > +     int ret =3D 0;
>
> Is there any reason it needs to be initialized?
>
>
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
> > +
> > +     ds->base.hw_version =3D get_unaligned_le32(&buf[24]);
> > +     ds->base.fw_version =3D get_unaligned_le32(&buf[28]);
>
> Shouldn't the size of the reply be checked?

Good point, I added a check and returning -EINVAL now in case of a
size mismatch.

>
> > +
> > +err_free:
> > +     kfree(buf);
> > +     return ret;
> > +}
> > +
> >  static int dualsense_get_mac_address(struct dualsense *ds)
> >  {
> >       uint8_t *buf;
> > @@ -1172,6 +1233,12 @@ static struct ps_device *dualsense_create(struct=
 hid_device *hdev)
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
> >       ret =3D ps_devices_list_add((struct ps_device *)ds);
> >       if (ret < 0)
> >               return ERR_PTR(ret);
> > @@ -1241,6 +1308,12 @@ static struct ps_device *dualsense_create(struct=
 hid_device *hdev)
> >       /* Set player LEDs to our player id. */
> >       dualsense_set_player_leds(ds);
> >
> > +     /* Reporting hardware and firmware is important as there are freq=
uent updates, which
> > +      * can change behavior.
> > +      */
> > +     hid_info(hdev, "Registered DualSense controller hw_version=3D%x f=
w_version=3D%x\n",
> > +                     ds->base.hw_version, ds->base.fw_version);
> > +
> >       return (struct ps_device *)ds;
> >
> >  err:
> > @@ -1295,6 +1368,12 @@ static int ps_probe(struct hid_device *hdev, con=
st struct hid_device_id *id)
> >               goto err_close;
> >       }
> >
> > +     ret =3D sysfs_create_group(&hdev->dev.kobj, &ps_device_attribute_=
group);
>
> It's a minor thing, but I think `device_{add,remove}_group()` would be be=
tter
> here in the sense that it expresses the fact that the group is added to a=
 device,
> not just any object better.

Agreed, that's nicer I wasn't aware of it. I try to follow what other
hid drivers do and they all used the kobj directly, which honestly
felt nasty. Will change it to this.

>
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Failed to register sysfs nodes.\n");
> > +             goto err_close;
> > +     }
> > +
> >       return ret;
> >
> >  err_close:
> > @@ -1313,6 +1392,8 @@ static void ps_remove(struct hid_device *hdev)
> >
> >       hid_hw_close(hdev);
> >       hid_hw_stop(hdev);
> > +
> > +     sysfs_remove_group(&hdev->dev.kobj, &ps_device_attribute_group);
> >  }
> >
> >  static const struct hid_device_id ps_devices[] =3D {
> > --
> > 2.26.2
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze

Thanks,
Roderick
