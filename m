Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5055C2E331D
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 23:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgL0W1y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 17:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgL0W1x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 17:27:53 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1B1C061794
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 14:27:12 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id z20so5953513qtq.3
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 14:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vSapbu5Sso6yX13P/iRpEjhEX2UQZpkKhvut+qfgP6Y=;
        b=1xyu0IvzKoQMSZdf0CRtaZ0gO0N55e4uRbfW8B97bwRqsgf1uRjELiiBayz4p7v+9V
         WGxg81pCeRZ5luN7Co7llVJYBgGNSbAg7s7EIWi+YrO7nxnGLqANZIYa2rtFchkz7HZd
         eg3occxS4yF77e7/5K1D84M2XseItyoUEXqvuWwOzflUAb9Jj0kR5kmbP8gOD/CChayd
         6rTb3lNiUo7HR2KGVQvABa962N9R3s+bwkrRC0/oXPEwQVwtXmfUC49WnS8kai7dCLwz
         wZQc+F/jP7/72qB6GJj7vUnJ0gntj/DH2Llxv9evmf9iYZUe80422Qtw8MAR7vHIeaH7
         7AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vSapbu5Sso6yX13P/iRpEjhEX2UQZpkKhvut+qfgP6Y=;
        b=UB9TnBZ5tT3HWSEgHt6u34fQ9CqQQzkIk8kbdaYoR0qLZIdUWwRbmBl8KXTgTqA3Qo
         TndIn3hCInMnREh8ZhKMiBlbS/gR1XpoaAz7yBAtanWGbmgLuX755yjyYgr12wkgRm6S
         uCMICnPA28/JdSjfQo6GqlaT38NzTgVPbz6AHYh5Bc7Y8kR757sZa6ug9+yp+Wdy4H7B
         XS4RJd1rmqAukTFC5EfRL+9MJXIehiQcpPE6XcOVA+G9fiXxS8Y1MzZmjGcOxyTepGOd
         Zz5t2unilVNjvVV9Px+Sz1phusZunMgDCiFtzpdvmkkjJ4ztYDzYskwphRem3KeB6VV4
         BChg==
X-Gm-Message-State: AOAM530lAptzq+6av3Ri1+17ld6y0cqaMhlUk51BZ/Hrs8Uy06AJyeOS
        JcKjYgs53ouVXNlDzSGvgv+jQ0XR/iAksmWo0cUYSQ==
X-Google-Smtp-Source: ABdhPJx/lrCvt/JYE6LrZK2VjTSnNwQXJH+nIW9XQEeTdni6bt/SeBlZG9jsdRNB06MKOuwL/Yv85Dixcf9CgiabuXc=
X-Received: by 2002:aed:2d65:: with SMTP id h92mr41718353qtd.263.1609108032149;
 Sun, 27 Dec 2020 14:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-14-roderick@gaikai.com>
 <Wrry37udGNtUwRvYnSoet8ychKwk8YeD9NTEIjkfIMtrSmCXOc9h4oLcm5Uq77JV1AIgvP13uwxvXYuNAQF0jO_ZVp2M932WAPKQB5VdYGc=@protonmail.com>
 <CANndSKn8xFGR3Y7x3rXxjhcNn89tt55o+RyvZkTp-aMzbF-JcA@mail.gmail.com>
In-Reply-To: <CANndSKn8xFGR3Y7x3rXxjhcNn89tt55o+RyvZkTp-aMzbF-JcA@mail.gmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sun, 27 Dec 2020 14:27:01 -0800
Message-ID: <CANndSKmch6bdv0N8qUFdAgKBqi50Y11kdK4EFm63xr4Kct5D=A@mail.gmail.com>
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

On Sun, Dec 27, 2020 at 2:21 PM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> Hi Barnab=C3=A1s,
>
> Thanks for you great feedback.
>
> On Sun, Dec 27, 2020 at 9:06 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmai=
l.com> wrote:
> >
> > Hi
> >
> >
> > 2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrande=
r =C3=ADrta:
> >
> > > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstat=
ion.c
> > > index a55375ac79a9..2f989da906f3 100644
> > > --- a/drivers/hid/hid-playstation.c
> > > +++ b/drivers/hid/hid-playstation.c
> > > [...]
> > > +static ssize_t ps_show_firmware_version(struct device *dev,
> > > +                             struct device_attribute
> > > +                             *attr, char *buf)
> > > +{
> > > +     struct hid_device *hdev =3D to_hid_device(dev);
> > > +     struct ps_device *ps_dev =3D hid_get_drvdata(hdev);
> > > +
> > > +     return snprintf(buf, PAGE_SIZE, "0x%08x\n", ps_dev->fw_version)=
;
> >
> > `sysfs_emit()` is preferred over *printf().
>
> Thanks, I wasn't aware of its existence. Looks like it was added
> recently, but yeah it is a lot nicer.
>
> >
> > > +}
> > > +
> > > +static DEVICE_ATTR(firmware_version, 0444, ps_show_firmware_version,=
 NULL);
> > > +
> > > +static ssize_t ps_show_hardware_version(struct device *dev,
> > > +                             struct device_attribute
> > > +                             *attr, char *buf)
> > > +{
> > > +     struct hid_device *hdev =3D to_hid_device(dev);
> > > +     struct ps_device *ps_dev =3D hid_get_drvdata(hdev);
> > > +
> > > +     return snprintf(buf, PAGE_SIZE, "0x%08x\n", ps_dev->hw_version)=
;
> >
> > Same here.
> >
> >
> > > +}
> > > [...]
> > > +static int dualsense_get_firmware_info(struct dualsense *ds)
> > > +{
> > > +     uint8_t *buf;
> > > +     int ret =3D 0;
> >
> > Is there any reason it needs to be initialized?
> >
> >
> > > +
> > > +     buf =3D kzalloc(DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNE=
L);
> > > +     if (!buf)
> > > +             return -ENOMEM;
> > > +
> > > +     ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_FIR=
MWARE_INFO, buf,
> > > +                     DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, HID_FEATU=
RE_REPORT,
> > > +                     HID_REQ_GET_REPORT);
> > > +     if (ret < 0)
> > > +             goto err_free;
> > > +
> > > +     ds->base.hw_version =3D get_unaligned_le32(&buf[24]);
> > > +     ds->base.fw_version =3D get_unaligned_le32(&buf[28]);
> >
> > Shouldn't the size of the reply be checked?
>
> Good point, I added a check and returning -EINVAL now in case of a
> size mismatch.
>
> >
> > > +
> > > +err_free:
> > > +     kfree(buf);
> > > +     return ret;
> > > +}
> > > +
> > >  static int dualsense_get_mac_address(struct dualsense *ds)
> > >  {
> > >       uint8_t *buf;
> > > @@ -1172,6 +1233,12 @@ static struct ps_device *dualsense_create(stru=
ct hid_device *hdev)
> > >       }
> > >       snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_a=
ddress);
> > >
> > > +     ret =3D dualsense_get_firmware_info(ds);
> > > +     if (ret < 0) {
> > > +             hid_err(hdev, "Failed to get firmware info from DualSen=
se\n");
> > > +             return ERR_PTR(ret);
> > > +     }
> > > +
> > >       ret =3D ps_devices_list_add((struct ps_device *)ds);
> > >       if (ret < 0)
> > >               return ERR_PTR(ret);
> > > @@ -1241,6 +1308,12 @@ static struct ps_device *dualsense_create(stru=
ct hid_device *hdev)
> > >       /* Set player LEDs to our player id. */
> > >       dualsense_set_player_leds(ds);
> > >
> > > +     /* Reporting hardware and firmware is important as there are fr=
equent updates, which
> > > +      * can change behavior.
> > > +      */
> > > +     hid_info(hdev, "Registered DualSense controller hw_version=3D%x=
 fw_version=3D%x\n",
> > > +                     ds->base.hw_version, ds->base.fw_version);
> > > +
> > >       return (struct ps_device *)ds;
> > >
> > >  err:
> > > @@ -1295,6 +1368,12 @@ static int ps_probe(struct hid_device *hdev, c=
onst struct hid_device_id *id)
> > >               goto err_close;
> > >       }
> > >
> > > +     ret =3D sysfs_create_group(&hdev->dev.kobj, &ps_device_attribut=
e_group);
> >
> > It's a minor thing, but I think `device_{add,remove}_group()` would be =
better
> > here in the sense that it expresses the fact that the group is added to=
 a device,
> > not just any object better.
>
> Agreed, that's nicer I wasn't aware of it. I try to follow what other
> hid drivers do and they all used the kobj directly, which honestly
> felt nasty. Will change it to this.
>

Actually devm_device_add_group seems to be even nicer. Surprisingly it
isn't widely used yet.

Roderick
