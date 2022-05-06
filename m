Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F250051D0F3
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 08:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242546AbiEFGEG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 02:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389295AbiEFGED (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 02:04:03 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056CFBAE
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 23:00:20 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2ec42eae76bso70337537b3.10
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 23:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tOFQMZbyrbRcGDl5LNnsSnmH6FpkhlQvoor2dC+ulYU=;
        b=EGqrQA0X6OmLIU9K5/pJqcn0kdBrOwpcjFsodeXHbcy6VEC2IbTrdHpMouGW5I2hPP
         3m7hcBXjeHwB0P2Gy/+EjxVtlEM+efq4vvd652vbr63MyVqClOdZ5QfH2z4HNTBNwxgK
         fofvWwSA7CW1jb0Cn8JJabQB7Pz3XMl8M8/VKXb540B+OlHA/iu0CSBH3WhyGu139n6U
         cqXj8e79uJcpeBunAyT/Z//Ivr6UXy/Ju1yKSiPK0pSW8XUGS+oOuu9R/G6a7EdaDdz+
         5AvDh62IeSmSj0cZHJHhHIqIejo28LXBolH10NTT7oiq5ScHTjs/Fcwyez+ulY8ltcEK
         VDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tOFQMZbyrbRcGDl5LNnsSnmH6FpkhlQvoor2dC+ulYU=;
        b=7CNznvS2o5zhCughMBKhe7cKuIBbUXh3547s14DIuqKja0zIyOzDOFuhrElxOt3MoX
         3GtgI/sSdx0XgKfu17dM3Pi/20e8dfuHb6e87RE38yylS6+d7TM+NzBZN3fc/cIe/oX9
         slMWOFbmtoIjlcJ60dfVEGD/luht29hdojrZDZuu13Prricjf0mUEQzs9JbLaq3lECQC
         tkvU3upOKfgFJ5PXePiSz4WfGFuOrJGHEy0syv0xCUUSdmQGP6023BrigrdVbEtOiOBB
         sxX0C0nmOFaSCWxgPsStyghjkLN1s6+ldK7kyAWw9iVbein7der8hkCgaSJzTVphiL09
         MV2g==
X-Gm-Message-State: AOAM533iN+7q7xz1driCYdmnEzGDqrTsZw4CRm6Y+I1UC2wDbksHI15A
        J+WSJuzuzigv97jCPIJbP9TNTPTemPBGyKZTVWo=
X-Google-Smtp-Source: ABdhPJwefTtEUHWBv0cULsO5Y01uStG2zfUFXzMeMKhLLWgKZe6ebnkc17lMAFdPfte7/vbIE+nA9Xwa5WaspGwMH+I=
X-Received: by 2002:a81:1606:0:b0:2f7:d623:703 with SMTP id
 6-20020a811606000000b002f7d6230703mr1252470yww.501.1651816819287; Thu, 05 May
 2022 23:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com> <20220427224526.35657-3-vi@endrift.com>
 <CAO-hwJLsLx3xFB_PLFqnR7afXp0=NZmhCEMR4xr--sZ3QsZA5w@mail.gmail.com> <0f886b39-8aed-436e-7963-c908409101dd@endrift.com>
In-Reply-To: <0f886b39-8aed-436e-7963-c908409101dd@endrift.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 5 May 2022 23:00:08 -0700
Message-ID: <CAEc3jaBk_D=784YJL9Vtp8cm5uPqW6RAAs3dP17W68koKMXXmA@mail.gmail.com>
Subject: Re: [PATCH 3/6] HID: hid-playstation: Disable touchpad reporting when
 hidraw open
To:     Vicki Pfau <vi@endrift.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 5, 2022 at 3:15 PM Vicki Pfau <vi@endrift.com> wrote:
>
> Hello,
>
> On 5/5/22 01:57, Benjamin Tissoires wrote:
> > On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
> >>
> >> When using the hidraw node directly, disable the touchpad endpoint to =
prevent
> >> it from sending separate mouse-like reports. This is accomplished in t=
he same
> >> way that the hid-steam driver does it, by creating and attaching an in=
put_dev
> >> with a custom low-level transport driver, which monitors and reports w=
hen the
> >> hidraw node is opened or closed. Reports sent by the real device are r=
eported
> >> to the "fake" device, and the real device is prevented from creating a=
 hidraw
> >> node. This "fake" device is connected with only a hidraw node, and is =
exposed
> >> with identifying information that is identical to the original device,=
 so the
> >> "fake" device's hidraw node appears as the node associated with the de=
v.
> >
> > Besides the "we should have a generic way of doing this", why do we
> > only prevent touchpad events from being reported?
>
> As, from what I can tell, most windowing systems treat it as a mouse, it'=
s the most prone to "double input" problems when prodded by both the hidraw=
 and the windowing system. Windowing systems generally don't do anything wi=
th the other exposed inputs, as far as I can tell.
>

I agree with Benjamin, if we did some disabling it needs to be for everythi=
ng.

I'm not convinced though that kernel side we can make the best
decision for each use case. Maybe it does make sense to hide for
example input devices when hidraw is open, which helps some use cases.
Other use cases may want to have both around.

I really like the 'inhibit' idea from Dmitry in the other email. It
would solve this use case as well can handle others.

> >
> > [looking at the code further down]
> >
> > So it seems you are entirely disabling the input nodes, which is what
> > I would have expected, so the commit description needs some changes.
> > Or am I reading this wrong?
>
> I am unsure where this discrepancy lies in the description. Can you be mo=
re specific?
>
> Thanks,
> Vicki
>
> >
> > Cheers,
> > Benjamin

Thanks,
Roderick
>
> >>
> >> Signed-off-by: Vicki Pfau <vi@endrift.com>
> >> ---
> >>  drivers/hid/hid-playstation.c | 144 +++++++++++++++++++++++++++++++++=
-
> >>  1 file changed, 141 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstati=
on.c
> >> index ad0da4470615..3746c9c550d6 100644
> >> --- a/drivers/hid/hid-playstation.c
> >> +++ b/drivers/hid/hid-playstation.c
> >> @@ -30,9 +30,10 @@ static bool touchpad_mouse =3D true;
> >>  /* Base class for playstation devices. */
> >>  struct ps_device {
> >>         struct list_head list;
> >> -       struct hid_device *hdev;
> >> +       struct hid_device *hdev, *client_hdev;
> >>         struct mutex mutex;
> >>         spinlock_t lock;
> >> +       bool client_opened;
> >>
> >>         uint32_t player_id;
> >>
> >> @@ -643,6 +644,102 @@ static const struct attribute_group ps_device_at=
tribute_group =3D {
> >>         .attrs =3D ps_device_attributes,
> >>  };
> >>
> >> +static int ps_client_ll_parse(struct hid_device *hdev)
> >> +{
> >> +       struct ps_device *dev =3D hdev->driver_data;
> >> +
> >> +       return hid_parse_report(hdev, dev->hdev->dev_rdesc,
> >> +                       dev->hdev->dev_rsize);
> >> +}
> >> +
> >> +static int ps_client_ll_start(struct hid_device *hdev)
> >> +{
> >> +       return 0;
> >> +}
> >> +
> >> +static void ps_client_ll_stop(struct hid_device *hdev)
> >> +{
> >> +}
> >> +
> >> +static int ps_client_ll_open(struct hid_device *hdev)
> >> +{
> >> +       struct ps_device *dev =3D hdev->driver_data;
> >> +       struct dualsense *ds;
> >> +
> >> +       mutex_lock(&dev->mutex);
> >> +       dev->client_opened =3D true;
> >> +       mutex_unlock(&dev->mutex);
> >> +
> >> +       if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> >> +               ds =3D container_of(dev, struct dualsense, base);
> >> +               dualsense_unregister_touchpad(ds);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static void ps_client_ll_close(struct hid_device *hdev)
> >> +{
> >> +       struct ps_device *dev =3D hdev->driver_data;
> >> +       struct dualsense *ds;
> >> +       struct input_dev *touchpad;
> >> +
> >> +       mutex_lock(&dev->mutex);
> >> +       dev->client_opened =3D false;
> >> +       mutex_unlock(&dev->mutex);
> >> +
> >> +       if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> >> +               ds =3D container_of(dev, struct dualsense, base);
> >> +               touchpad =3D ps_touchpad_create(hdev, DS_TOUCHPAD_WIDT=
H, DS_TOUCHPAD_HEIGHT, 2);
> >> +               if (IS_ERR(touchpad))
> >> +                       return;
> >> +               rcu_assign_pointer(ds->touchpad, touchpad);
> >> +       }
> >> +}
> >> +
> >> +static int ps_client_ll_raw_request(struct hid_device *hdev,
> >> +                               unsigned char reportnum, u8 *buf,
> >> +                               size_t count, unsigned char report_typ=
e,
> >> +                               int reqtype)
> >> +{
> >> +       struct ps_device *dev =3D hdev->driver_data;
> >> +
> >> +       return hid_hw_raw_request(dev->hdev, reportnum, buf, count,
> >> +                       report_type, reqtype);
> >> +}
> >> +
> >> +static struct hid_ll_driver ps_client_ll_driver =3D {
> >> +       .parse =3D ps_client_ll_parse,
> >> +       .start =3D ps_client_ll_start,
> >> +       .stop =3D ps_client_ll_stop,
> >> +       .open =3D ps_client_ll_open,
> >> +       .close =3D ps_client_ll_close,
> >> +       .raw_request =3D ps_client_ll_raw_request,
> >> +};
> >> +
> >> +static struct hid_device *ps_create_client_hid(struct hid_device *hde=
v)
> >> +{
> >> +       struct hid_device *client_hdev;
> >> +
> >> +       client_hdev =3D hid_allocate_device();
> >> +       if (IS_ERR(client_hdev))
> >> +               return client_hdev;
> >> +
> >> +       client_hdev->ll_driver =3D &ps_client_ll_driver;
> >> +       client_hdev->dev.parent =3D hdev->dev.parent;
> >> +       client_hdev->bus =3D hdev->bus;
> >> +       client_hdev->vendor =3D hdev->vendor;
> >> +       client_hdev->product =3D hdev->product;
> >> +       client_hdev->version =3D hdev->version;
> >> +       client_hdev->type =3D hdev->type;
> >> +       client_hdev->country =3D hdev->country;
> >> +       strlcpy(client_hdev->name, hdev->name,
> >> +                       sizeof(client_hdev->name));
> >> +       strlcpy(client_hdev->phys, hdev->phys,
> >> +                       sizeof(client_hdev->phys));
> >> +       return client_hdev;
> >> +}
> >> +
> >>  static int dualsense_get_calibration_data(struct dualsense *ds)
> >>  {
> >>         short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> >> @@ -1190,6 +1287,11 @@ static struct ps_device *dualsense_create(struc=
t hid_device *hdev)
> >>         INIT_WORK(&ds->output_worker, dualsense_output_worker);
> >>         hid_set_drvdata(hdev, ds);
> >>
> >> +       ps_dev->client_hdev =3D ps_create_client_hid(hdev);
> >> +       if (IS_ERR(ps_dev->client_hdev))
> >> +               return ERR_CAST(ps_dev->client_hdev);
> >> +       ps_dev->client_hdev->driver_data =3D ps_dev;
> >> +
> >>         max_output_report_size =3D sizeof(struct dualsense_output_repo=
rt_bt);
> >>         ds->output_report_dmabuf =3D devm_kzalloc(&hdev->dev, max_outp=
ut_report_size, GFP_KERNEL);
> >>         if (!ds->output_report_dmabuf)
> >> @@ -1280,8 +1382,20 @@ static int ps_raw_event(struct hid_device *hdev=
, struct hid_report *report,
> >>                 u8 *data, int size)
> >>  {
> >>         struct ps_device *dev =3D hid_get_drvdata(hdev);
> >> +       int ret =3D 0;
> >> +
> >> +       if (!dev)
> >> +               return 0;
> >>
> >> -       if (dev && dev->parse_report)
> >> +       if (dev->client_opened) {
> >> +               ret =3D hid_input_report(dev->client_hdev, HID_INPUT_R=
EPORT, data, size, 0);
> >> +               if (ret) {
> >> +                       hid_err(hdev, "can't send input report to clie=
nt hdev: %d\n", ret);
> >> +                       return ret;
> >> +               }
> >> +       }
> >> +
> >> +       if (dev->parse_report)
> >>                 return dev->parse_report(dev, report, data, size);
> >>
> >>         return 0;
> >> @@ -1291,6 +1405,7 @@ static int ps_probe(struct hid_device *hdev, con=
st struct hid_device_id *id)
> >>  {
> >>         struct ps_device *dev;
> >>         int ret;
> >> +       unsigned int connect_mask =3D 0;
> >>
> >>         ret =3D hid_parse(hdev);
> >>         if (ret) {
> >> @@ -1298,12 +1413,22 @@ static int ps_probe(struct hid_device *hdev, c=
onst struct hid_device_id *id)
> >>                 return ret;
> >>         }
> >>
> >> -       ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> >> +       if (hdev->ll_driver =3D=3D &ps_client_ll_driver)
> >> +               connect_mask =3D HID_CONNECT_HIDRAW;
> >> +
> >> +       ret =3D hid_hw_start(hdev, connect_mask);
> >>         if (ret) {
> >>                 hid_err(hdev, "Failed to start HID device\n");
> >>                 return ret;
> >>         }
> >>
> >> +       /*
> >> +        * The virtual client_dev is only used for hidraw. Since we've=
 already
> >> +        * started the hw, return early to avoid the recursive probe.
> >> +        */
> >> +       if (hdev->ll_driver =3D=3D &ps_client_ll_driver)
> >> +               return ret;
> >> +
> >>         ret =3D hid_hw_open(hdev);
> >>         if (ret) {
> >>                 hid_err(hdev, "Failed to open HID device\n");
> >> @@ -1325,9 +1450,19 @@ static int ps_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
> >>                 goto err_close;
> >>         }
> >>
> >> +       if (dev->client_hdev)
> >> +               ret =3D hid_add_device(dev->client_hdev);
> >> +       if (ret) {
> >> +               hid_err(hdev, "Failed to start client device failed\n"=
);
> >> +               goto err_close;
> >> +       }
> >> +
> >>         return ret;
> >>
> >>  err_close:
> >> +       if (dev->client_hdev)
> >> +               hid_destroy_device(dev->client_hdev);
> >> +
> >>         hid_hw_close(hdev);
> >>  err_stop:
> >>         hid_hw_stop(hdev);
> >> @@ -1341,6 +1476,9 @@ static void ps_remove(struct hid_device *hdev)
> >>         ps_devices_list_remove(dev);
> >>         ps_device_release_player_id(dev);
> >>
> >> +       if (dev->client_hdev)
> >> +               hid_destroy_device(dev->client_hdev);
> >> +
> >>         hid_hw_close(hdev);
> >>         hid_hw_stop(hdev);
> >>  }
> >> --
> >> 2.36.0
> >>
> >
