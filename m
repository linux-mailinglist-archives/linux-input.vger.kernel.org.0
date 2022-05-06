Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40BDF51D1AC
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 08:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386632AbiEFG6Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 02:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242356AbiEFG6Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 02:58:24 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E177166C97
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 23:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651820079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u8V/Tq+ITHBHquXDA3x6UfaD/24+d05lA9CAsc9eMQg=;
        b=IJa/oBSzj6mprADVOuRjxTxpwFtBYlUtL5Gw9hcLmMk+/ev5Z9UqNeSEUUI/yvZfmNPwRV
        43YouwM+41VKYjp1pEPXovleWRZJrHfNhmv0JI3QllqvLUh19BvBh+ficsSZjXO97y8MOV
        ZTFmAtYJy2fHBWF0dRPDbMQsfZkdjWk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-i_Eg0N7nMEKbBqnVmVzIiw-1; Fri, 06 May 2022 02:54:38 -0400
X-MC-Unique: i_Eg0N7nMEKbBqnVmVzIiw-1
Received: by mail-pj1-f69.google.com with SMTP id gb16-20020a17090b061000b001d78792caebso3379001pjb.5
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 23:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u8V/Tq+ITHBHquXDA3x6UfaD/24+d05lA9CAsc9eMQg=;
        b=EnQ92fanlOGebNOQVEsJvuhwnF11W9kUZQn/GvRBv0ir+UuX1Oo5zu1meAZzqZBVTf
         Ggkk6ifMYv0KCBduc85ZUl+SyLgZgxYa/qW3BMnhuZAd12Jju7pRfwTtGM8RZfL0hKQf
         2J9QBLFnHVLZLHAKOocnwT/Y48zdH4e/fTmd1a265MjUS3IELDttUSobEZ7hUSpoF6hd
         BfFS+1K12SGYKfSrg2Lz8yIy1Y5fAorsCp+v0V/LMyPWhK7WPtGxay+TCD/nVnStBCK3
         15OX6ueiygXzbIkr0S29yftzlJioGtRKBx12XuehRLfa819v/ZiG+YJkSQhra9L3Szxa
         TTbA==
X-Gm-Message-State: AOAM533WGEN739eGHJ8U09pzRpv1Roj0t7+RGVvOqUsZuYyTf++9D3vm
        uZEpJ5Wj9tD8ShWgN8+uUNajY8wfGpaU7sKYvdszfAOTULdZ5ry2BHjkUS09XEI08/elDCQL1pa
        kBVyPZ4K580MbNoaISvOCpQ2e/PS+56Fz9MCffMg=
X-Received: by 2002:a17:90a:170c:b0:1dc:20c4:6354 with SMTP id z12-20020a17090a170c00b001dc20c46354mr2473597pjd.113.1651820077494;
        Thu, 05 May 2022 23:54:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsOKQdlMy77lNe2sxK7IQQC0sHABawO7sjLK03XeD3Qho/VxZY3r7IrbFOzkbCpw6dp2EEvJbThuzWNLEz7is=
X-Received: by 2002:a17:90a:170c:b0:1dc:20c4:6354 with SMTP id
 z12-20020a17090a170c00b001dc20c46354mr2473569pjd.113.1651820077207; Thu, 05
 May 2022 23:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com> <20220427224526.35657-3-vi@endrift.com>
 <CAO-hwJLsLx3xFB_PLFqnR7afXp0=NZmhCEMR4xr--sZ3QsZA5w@mail.gmail.com>
 <0f886b39-8aed-436e-7963-c908409101dd@endrift.com> <CAEc3jaBk_D=784YJL9Vtp8cm5uPqW6RAAs3dP17W68koKMXXmA@mail.gmail.com>
In-Reply-To: <CAEc3jaBk_D=784YJL9Vtp8cm5uPqW6RAAs3dP17W68koKMXXmA@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 6 May 2022 08:54:26 +0200
Message-ID: <CAO-hwJLfY+D0NyCUCncrjcXETKwOBqj1CuHtB_mtGhYfKV0Bww@mail.gmail.com>
Subject: Re: [PATCH 3/6] HID: hid-playstation: Disable touchpad reporting when
 hidraw open
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     Vicki Pfau <vi@endrift.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 6, 2022 at 8:00 AM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> On Thu, May 5, 2022 at 3:15 PM Vicki Pfau <vi@endrift.com> wrote:
> >
> > Hello,
> >
> > On 5/5/22 01:57, Benjamin Tissoires wrote:
> > > On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
> > >>
> > >> When using the hidraw node directly, disable the touchpad endpoint t=
o prevent
> > >> it from sending separate mouse-like reports. This is accomplished in=
 the same
> > >> way that the hid-steam driver does it, by creating and attaching an =
input_dev
> > >> with a custom low-level transport driver, which monitors and reports=
 when the
> > >> hidraw node is opened or closed. Reports sent by the real device are=
 reported
> > >> to the "fake" device, and the real device is prevented from creating=
 a hidraw
> > >> node. This "fake" device is connected with only a hidraw node, and i=
s exposed
> > >> with identifying information that is identical to the original devic=
e, so the
> > >> "fake" device's hidraw node appears as the node associated with the =
dev.
> > >
> > > Besides the "we should have a generic way of doing this", why do we
> > > only prevent touchpad events from being reported?
> >
> > As, from what I can tell, most windowing systems treat it as a mouse, i=
t's the most prone to "double input" problems when prodded by both the hidr=
aw and the windowing system. Windowing systems generally don't do anything =
with the other exposed inputs, as far as I can tell.
> >
>
> I agree with Benjamin, if we did some disabling it needs to be for everyt=
hing.
>
> I'm not convinced though that kernel side we can make the best
> decision for each use case. Maybe it does make sense to hide for
> example input devices when hidraw is open, which helps some use cases.
> Other use cases may want to have both around.

And with that said... How about eBPF to do that instead of sysfs???? :)
(I know I have a nice hammer so I see nails everywhere).

>
> I really like the 'inhibit' idea from Dmitry in the other email. It
> would solve this use case as well can handle others.

The only problem of the sysfs approach is how do we give steam/SDL the
access to this sysfs file.
Steam for example ships an ugly udev rule that gives uaccess to all
hidraw nodes on gamepads, which is worrying for a security reason.

There are a couple of systemd PR trying to solve that
(https://github.com/systemd/systemd/pull/23140 for an ioctl approach),
but we realized with Bastien and Peter that BPF was the best way
forward because we can have a central piece that makes such decisions
without changing current applications.

In this particular case, we could also use the sysfs to inhibit the
device by a daemon that would:
- monitor each hidraw_open/hidraw_close
- when a hidraw_openm comes in, it notifies userspace
- user space then calls inhibit in the sysfs

But we could also put it one step forward by adding a hook that makes
all of this logic directly in ebpf (see
https://gitlab.freedesktop.org/bentiss/logind-hidraw for such an
approach for the hidraw ioctl-like). And given that we are working
towards adding this eBPF capability to logind, we could also implement
that logic in logind directly (based on some user-defined or
session-defined rules).

Cheers,
Benjamin

>
> > >
> > > [looking at the code further down]
> > >
> > > So it seems you are entirely disabling the input nodes, which is what
> > > I would have expected, so the commit description needs some changes.
> > > Or am I reading this wrong?
> >
> > I am unsure where this discrepancy lies in the description. Can you be =
more specific?
> >
> > Thanks,
> > Vicki
> >
> > >
> > > Cheers,
> > > Benjamin
>
> Thanks,
> Roderick
> >
> > >>
> > >> Signed-off-by: Vicki Pfau <vi@endrift.com>
> > >> ---
> > >>  drivers/hid/hid-playstation.c | 144 +++++++++++++++++++++++++++++++=
++-
> > >>  1 file changed, 141 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playsta=
tion.c
> > >> index ad0da4470615..3746c9c550d6 100644
> > >> --- a/drivers/hid/hid-playstation.c
> > >> +++ b/drivers/hid/hid-playstation.c
> > >> @@ -30,9 +30,10 @@ static bool touchpad_mouse =3D true;
> > >>  /* Base class for playstation devices. */
> > >>  struct ps_device {
> > >>         struct list_head list;
> > >> -       struct hid_device *hdev;
> > >> +       struct hid_device *hdev, *client_hdev;
> > >>         struct mutex mutex;
> > >>         spinlock_t lock;
> > >> +       bool client_opened;
> > >>
> > >>         uint32_t player_id;
> > >>
> > >> @@ -643,6 +644,102 @@ static const struct attribute_group ps_device_=
attribute_group =3D {
> > >>         .attrs =3D ps_device_attributes,
> > >>  };
> > >>
> > >> +static int ps_client_ll_parse(struct hid_device *hdev)
> > >> +{
> > >> +       struct ps_device *dev =3D hdev->driver_data;
> > >> +
> > >> +       return hid_parse_report(hdev, dev->hdev->dev_rdesc,
> > >> +                       dev->hdev->dev_rsize);
> > >> +}
> > >> +
> > >> +static int ps_client_ll_start(struct hid_device *hdev)
> > >> +{
> > >> +       return 0;
> > >> +}
> > >> +
> > >> +static void ps_client_ll_stop(struct hid_device *hdev)
> > >> +{
> > >> +}
> > >> +
> > >> +static int ps_client_ll_open(struct hid_device *hdev)
> > >> +{
> > >> +       struct ps_device *dev =3D hdev->driver_data;
> > >> +       struct dualsense *ds;
> > >> +
> > >> +       mutex_lock(&dev->mutex);
> > >> +       dev->client_opened =3D true;
> > >> +       mutex_unlock(&dev->mutex);
> > >> +
> > >> +       if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER) =
{
> > >> +               ds =3D container_of(dev, struct dualsense, base);
> > >> +               dualsense_unregister_touchpad(ds);
> > >> +       }
> > >> +
> > >> +       return 0;
> > >> +}
> > >> +
> > >> +static void ps_client_ll_close(struct hid_device *hdev)
> > >> +{
> > >> +       struct ps_device *dev =3D hdev->driver_data;
> > >> +       struct dualsense *ds;
> > >> +       struct input_dev *touchpad;
> > >> +
> > >> +       mutex_lock(&dev->mutex);
> > >> +       dev->client_opened =3D false;
> > >> +       mutex_unlock(&dev->mutex);
> > >> +
> > >> +       if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER) =
{
> > >> +               ds =3D container_of(dev, struct dualsense, base);
> > >> +               touchpad =3D ps_touchpad_create(hdev, DS_TOUCHPAD_WI=
DTH, DS_TOUCHPAD_HEIGHT, 2);
> > >> +               if (IS_ERR(touchpad))
> > >> +                       return;
> > >> +               rcu_assign_pointer(ds->touchpad, touchpad);
> > >> +       }
> > >> +}
> > >> +
> > >> +static int ps_client_ll_raw_request(struct hid_device *hdev,
> > >> +                               unsigned char reportnum, u8 *buf,
> > >> +                               size_t count, unsigned char report_t=
ype,
> > >> +                               int reqtype)
> > >> +{
> > >> +       struct ps_device *dev =3D hdev->driver_data;
> > >> +
> > >> +       return hid_hw_raw_request(dev->hdev, reportnum, buf, count,
> > >> +                       report_type, reqtype);
> > >> +}
> > >> +
> > >> +static struct hid_ll_driver ps_client_ll_driver =3D {
> > >> +       .parse =3D ps_client_ll_parse,
> > >> +       .start =3D ps_client_ll_start,
> > >> +       .stop =3D ps_client_ll_stop,
> > >> +       .open =3D ps_client_ll_open,
> > >> +       .close =3D ps_client_ll_close,
> > >> +       .raw_request =3D ps_client_ll_raw_request,
> > >> +};
> > >> +
> > >> +static struct hid_device *ps_create_client_hid(struct hid_device *h=
dev)
> > >> +{
> > >> +       struct hid_device *client_hdev;
> > >> +
> > >> +       client_hdev =3D hid_allocate_device();
> > >> +       if (IS_ERR(client_hdev))
> > >> +               return client_hdev;
> > >> +
> > >> +       client_hdev->ll_driver =3D &ps_client_ll_driver;
> > >> +       client_hdev->dev.parent =3D hdev->dev.parent;
> > >> +       client_hdev->bus =3D hdev->bus;
> > >> +       client_hdev->vendor =3D hdev->vendor;
> > >> +       client_hdev->product =3D hdev->product;
> > >> +       client_hdev->version =3D hdev->version;
> > >> +       client_hdev->type =3D hdev->type;
> > >> +       client_hdev->country =3D hdev->country;
> > >> +       strlcpy(client_hdev->name, hdev->name,
> > >> +                       sizeof(client_hdev->name));
> > >> +       strlcpy(client_hdev->phys, hdev->phys,
> > >> +                       sizeof(client_hdev->phys));
> > >> +       return client_hdev;
> > >> +}
> > >> +
> > >>  static int dualsense_get_calibration_data(struct dualsense *ds)
> > >>  {
> > >>         short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> > >> @@ -1190,6 +1287,11 @@ static struct ps_device *dualsense_create(str=
uct hid_device *hdev)
> > >>         INIT_WORK(&ds->output_worker, dualsense_output_worker);
> > >>         hid_set_drvdata(hdev, ds);
> > >>
> > >> +       ps_dev->client_hdev =3D ps_create_client_hid(hdev);
> > >> +       if (IS_ERR(ps_dev->client_hdev))
> > >> +               return ERR_CAST(ps_dev->client_hdev);
> > >> +       ps_dev->client_hdev->driver_data =3D ps_dev;
> > >> +
> > >>         max_output_report_size =3D sizeof(struct dualsense_output_re=
port_bt);
> > >>         ds->output_report_dmabuf =3D devm_kzalloc(&hdev->dev, max_ou=
tput_report_size, GFP_KERNEL);
> > >>         if (!ds->output_report_dmabuf)
> > >> @@ -1280,8 +1382,20 @@ static int ps_raw_event(struct hid_device *hd=
ev, struct hid_report *report,
> > >>                 u8 *data, int size)
> > >>  {
> > >>         struct ps_device *dev =3D hid_get_drvdata(hdev);
> > >> +       int ret =3D 0;
> > >> +
> > >> +       if (!dev)
> > >> +               return 0;
> > >>
> > >> -       if (dev && dev->parse_report)
> > >> +       if (dev->client_opened) {
> > >> +               ret =3D hid_input_report(dev->client_hdev, HID_INPUT=
_REPORT, data, size, 0);
> > >> +               if (ret) {
> > >> +                       hid_err(hdev, "can't send input report to cl=
ient hdev: %d\n", ret);
> > >> +                       return ret;
> > >> +               }
> > >> +       }
> > >> +
> > >> +       if (dev->parse_report)
> > >>                 return dev->parse_report(dev, report, data, size);
> > >>
> > >>         return 0;
> > >> @@ -1291,6 +1405,7 @@ static int ps_probe(struct hid_device *hdev, c=
onst struct hid_device_id *id)
> > >>  {
> > >>         struct ps_device *dev;
> > >>         int ret;
> > >> +       unsigned int connect_mask =3D 0;
> > >>
> > >>         ret =3D hid_parse(hdev);
> > >>         if (ret) {
> > >> @@ -1298,12 +1413,22 @@ static int ps_probe(struct hid_device *hdev,=
 const struct hid_device_id *id)
> > >>                 return ret;
> > >>         }
> > >>
> > >> -       ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> > >> +       if (hdev->ll_driver =3D=3D &ps_client_ll_driver)
> > >> +               connect_mask =3D HID_CONNECT_HIDRAW;
> > >> +
> > >> +       ret =3D hid_hw_start(hdev, connect_mask);
> > >>         if (ret) {
> > >>                 hid_err(hdev, "Failed to start HID device\n");
> > >>                 return ret;
> > >>         }
> > >>
> > >> +       /*
> > >> +        * The virtual client_dev is only used for hidraw. Since we'=
ve already
> > >> +        * started the hw, return early to avoid the recursive probe=
.
> > >> +        */
> > >> +       if (hdev->ll_driver =3D=3D &ps_client_ll_driver)
> > >> +               return ret;
> > >> +
> > >>         ret =3D hid_hw_open(hdev);
> > >>         if (ret) {
> > >>                 hid_err(hdev, "Failed to open HID device\n");
> > >> @@ -1325,9 +1450,19 @@ static int ps_probe(struct hid_device *hdev, =
const struct hid_device_id *id)
> > >>                 goto err_close;
> > >>         }
> > >>
> > >> +       if (dev->client_hdev)
> > >> +               ret =3D hid_add_device(dev->client_hdev);
> > >> +       if (ret) {
> > >> +               hid_err(hdev, "Failed to start client device failed\=
n");
> > >> +               goto err_close;
> > >> +       }
> > >> +
> > >>         return ret;
> > >>
> > >>  err_close:
> > >> +       if (dev->client_hdev)
> > >> +               hid_destroy_device(dev->client_hdev);
> > >> +
> > >>         hid_hw_close(hdev);
> > >>  err_stop:
> > >>         hid_hw_stop(hdev);
> > >> @@ -1341,6 +1476,9 @@ static void ps_remove(struct hid_device *hdev)
> > >>         ps_devices_list_remove(dev);
> > >>         ps_device_release_player_id(dev);
> > >>
> > >> +       if (dev->client_hdev)
> > >> +               hid_destroy_device(dev->client_hdev);
> > >> +
> > >>         hid_hw_close(hdev);
> > >>         hid_hw_stop(hdev);
> > >>  }
> > >> --
> > >> 2.36.0
> > >>
> > >
>

