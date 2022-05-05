Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10EF251BB3E
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 10:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiEEJB0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 05:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351904AbiEEJBI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 05:01:08 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 059384BB96
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 01:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651741047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kkSryUP7JPGUNvQiURe+b0/PwgPT55OI69Z6AF4ObCA=;
        b=X1aK0Gtc9KN3n117bzEBT3qMLToy/s3gSD4Hf1Hmzi2Xo8nRJ/kQW9gH2jxs/BK5I3mzV6
        P+BQHMieNT+fyvgaY+ZWeOt/naajYxrqSX9l/XMQ3RfHoJVYrA9kt4KNPK3UDoGz/dnxm+
        7jEq15MalANrpBzhXnVQppkEb953a7c=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-ATmZp7D4M_mzXlzCfKiapg-1; Thu, 05 May 2022 04:57:24 -0400
X-MC-Unique: ATmZp7D4M_mzXlzCfKiapg-1
Received: by mail-pg1-f199.google.com with SMTP id 64-20020a630843000000b0039d909676d5so1891612pgi.16
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 01:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kkSryUP7JPGUNvQiURe+b0/PwgPT55OI69Z6AF4ObCA=;
        b=geDvwbXePwKyXjiNwwUDn/HGKemOdfJpr7CYkQ4FeN4sHbjiLKEHbOATb/SWtIr4/N
         +6WyFI2BTw5Mv0nvcnDujdMC1gB0HE/NkpcM1Fb3N5rk/6GmdcCe4+R4OHQD0G/EBLsg
         06HhTNEnxVkVPN3Lkh5Oq5jA05palbseuJi0W6V4TJKvIcvA45l5+RiCVzq4UXR5+QJO
         d7lNQKnWhA6jAgH4p27/ycVauhMa7VydliwqKgZCxVJEKatZyc4Q9yhrWtCNeOhGDdba
         4sRGzk1lFSDFVR+9f1otydd3kraAzcKXzMxAc+Mpup3qcFyVxqs0T0xCXqAi/jE/veD7
         JGxQ==
X-Gm-Message-State: AOAM530cjADFIVNz3gr2Ct4lFh5uCUKUC9x+QL0SD+cL2RAOZXpz8kvL
        BL5GjWKFLLceJ5eHXqk0AcbLcW513FN/IMeY9WC0R2dMq7JO8FZbkXmbvnIabMKu8hZntmUSaFq
        VkNQPqy5koD8pytxRaxxS7zHMb+jVtFC9Y2Y3UlU=
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id h7-20020a056a00218700b0050cef4def3bmr24660033pfi.83.1651741043561;
        Thu, 05 May 2022 01:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQGgFFXFZNQlnkKiqP30yNcKKu6tG57jcGx1PfwxZglnmC7BhOSTVzOkLw7R49kzKYtH9XWc6kWixnTz0DT0o=
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id
 h7-20020a056a00218700b0050cef4def3bmr24660021pfi.83.1651741043264; Thu, 05
 May 2022 01:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com> <20220427224526.35657-3-vi@endrift.com>
In-Reply-To: <20220427224526.35657-3-vi@endrift.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 5 May 2022 10:57:11 +0200
Message-ID: <CAO-hwJLsLx3xFB_PLFqnR7afXp0=NZmhCEMR4xr--sZ3QsZA5w@mail.gmail.com>
Subject: Re: [PATCH 3/6] HID: hid-playstation: Disable touchpad reporting when
 hidraw open
To:     Vicki Pfau <vi@endrift.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
>
> When using the hidraw node directly, disable the touchpad endpoint to prevent
> it from sending separate mouse-like reports. This is accomplished in the same
> way that the hid-steam driver does it, by creating and attaching an input_dev
> with a custom low-level transport driver, which monitors and reports when the
> hidraw node is opened or closed. Reports sent by the real device are reported
> to the "fake" device, and the real device is prevented from creating a hidraw
> node. This "fake" device is connected with only a hidraw node, and is exposed
> with identifying information that is identical to the original device, so the
> "fake" device's hidraw node appears as the node associated with the dev.

Besides the "we should have a generic way of doing this", why do we
only prevent touchpad events from being reported?

[looking at the code further down]

So it seems you are entirely disabling the input nodes, which is what
I would have expected, so the commit description needs some changes.
Or am I reading this wrong?

Cheers,
Benjamin

>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/hid-playstation.c | 144 +++++++++++++++++++++++++++++++++-
>  1 file changed, 141 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index ad0da4470615..3746c9c550d6 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -30,9 +30,10 @@ static bool touchpad_mouse = true;
>  /* Base class for playstation devices. */
>  struct ps_device {
>         struct list_head list;
> -       struct hid_device *hdev;
> +       struct hid_device *hdev, *client_hdev;
>         struct mutex mutex;
>         spinlock_t lock;
> +       bool client_opened;
>
>         uint32_t player_id;
>
> @@ -643,6 +644,102 @@ static const struct attribute_group ps_device_attribute_group = {
>         .attrs = ps_device_attributes,
>  };
>
> +static int ps_client_ll_parse(struct hid_device *hdev)
> +{
> +       struct ps_device *dev = hdev->driver_data;
> +
> +       return hid_parse_report(hdev, dev->hdev->dev_rdesc,
> +                       dev->hdev->dev_rsize);
> +}
> +
> +static int ps_client_ll_start(struct hid_device *hdev)
> +{
> +       return 0;
> +}
> +
> +static void ps_client_ll_stop(struct hid_device *hdev)
> +{
> +}
> +
> +static int ps_client_ll_open(struct hid_device *hdev)
> +{
> +       struct ps_device *dev = hdev->driver_data;
> +       struct dualsense *ds;
> +
> +       mutex_lock(&dev->mutex);
> +       dev->client_opened = true;
> +       mutex_unlock(&dev->mutex);
> +
> +       if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> +               ds = container_of(dev, struct dualsense, base);
> +               dualsense_unregister_touchpad(ds);
> +       }
> +
> +       return 0;
> +}
> +
> +static void ps_client_ll_close(struct hid_device *hdev)
> +{
> +       struct ps_device *dev = hdev->driver_data;
> +       struct dualsense *ds;
> +       struct input_dev *touchpad;
> +
> +       mutex_lock(&dev->mutex);
> +       dev->client_opened = false;
> +       mutex_unlock(&dev->mutex);
> +
> +       if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> +               ds = container_of(dev, struct dualsense, base);
> +               touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
> +               if (IS_ERR(touchpad))
> +                       return;
> +               rcu_assign_pointer(ds->touchpad, touchpad);
> +       }
> +}
> +
> +static int ps_client_ll_raw_request(struct hid_device *hdev,
> +                               unsigned char reportnum, u8 *buf,
> +                               size_t count, unsigned char report_type,
> +                               int reqtype)
> +{
> +       struct ps_device *dev = hdev->driver_data;
> +
> +       return hid_hw_raw_request(dev->hdev, reportnum, buf, count,
> +                       report_type, reqtype);
> +}
> +
> +static struct hid_ll_driver ps_client_ll_driver = {
> +       .parse = ps_client_ll_parse,
> +       .start = ps_client_ll_start,
> +       .stop = ps_client_ll_stop,
> +       .open = ps_client_ll_open,
> +       .close = ps_client_ll_close,
> +       .raw_request = ps_client_ll_raw_request,
> +};
> +
> +static struct hid_device *ps_create_client_hid(struct hid_device *hdev)
> +{
> +       struct hid_device *client_hdev;
> +
> +       client_hdev = hid_allocate_device();
> +       if (IS_ERR(client_hdev))
> +               return client_hdev;
> +
> +       client_hdev->ll_driver = &ps_client_ll_driver;
> +       client_hdev->dev.parent = hdev->dev.parent;
> +       client_hdev->bus = hdev->bus;
> +       client_hdev->vendor = hdev->vendor;
> +       client_hdev->product = hdev->product;
> +       client_hdev->version = hdev->version;
> +       client_hdev->type = hdev->type;
> +       client_hdev->country = hdev->country;
> +       strlcpy(client_hdev->name, hdev->name,
> +                       sizeof(client_hdev->name));
> +       strlcpy(client_hdev->phys, hdev->phys,
> +                       sizeof(client_hdev->phys));
> +       return client_hdev;
> +}
> +
>  static int dualsense_get_calibration_data(struct dualsense *ds)
>  {
>         short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> @@ -1190,6 +1287,11 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>         INIT_WORK(&ds->output_worker, dualsense_output_worker);
>         hid_set_drvdata(hdev, ds);
>
> +       ps_dev->client_hdev = ps_create_client_hid(hdev);
> +       if (IS_ERR(ps_dev->client_hdev))
> +               return ERR_CAST(ps_dev->client_hdev);
> +       ps_dev->client_hdev->driver_data = ps_dev;
> +
>         max_output_report_size = sizeof(struct dualsense_output_report_bt);
>         ds->output_report_dmabuf = devm_kzalloc(&hdev->dev, max_output_report_size, GFP_KERNEL);
>         if (!ds->output_report_dmabuf)
> @@ -1280,8 +1382,20 @@ static int ps_raw_event(struct hid_device *hdev, struct hid_report *report,
>                 u8 *data, int size)
>  {
>         struct ps_device *dev = hid_get_drvdata(hdev);
> +       int ret = 0;
> +
> +       if (!dev)
> +               return 0;
>
> -       if (dev && dev->parse_report)
> +       if (dev->client_opened) {
> +               ret = hid_input_report(dev->client_hdev, HID_INPUT_REPORT, data, size, 0);
> +               if (ret) {
> +                       hid_err(hdev, "can't send input report to client hdev: %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       if (dev->parse_report)
>                 return dev->parse_report(dev, report, data, size);
>
>         return 0;
> @@ -1291,6 +1405,7 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
>         struct ps_device *dev;
>         int ret;
> +       unsigned int connect_mask = 0;
>
>         ret = hid_parse(hdev);
>         if (ret) {
> @@ -1298,12 +1413,22 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
>                 return ret;
>         }
>
> -       ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +       if (hdev->ll_driver == &ps_client_ll_driver)
> +               connect_mask = HID_CONNECT_HIDRAW;
> +
> +       ret = hid_hw_start(hdev, connect_mask);
>         if (ret) {
>                 hid_err(hdev, "Failed to start HID device\n");
>                 return ret;
>         }
>
> +       /*
> +        * The virtual client_dev is only used for hidraw. Since we've already
> +        * started the hw, return early to avoid the recursive probe.
> +        */
> +       if (hdev->ll_driver == &ps_client_ll_driver)
> +               return ret;
> +
>         ret = hid_hw_open(hdev);
>         if (ret) {
>                 hid_err(hdev, "Failed to open HID device\n");
> @@ -1325,9 +1450,19 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
>                 goto err_close;
>         }
>
> +       if (dev->client_hdev)
> +               ret = hid_add_device(dev->client_hdev);
> +       if (ret) {
> +               hid_err(hdev, "Failed to start client device failed\n");
> +               goto err_close;
> +       }
> +
>         return ret;
>
>  err_close:
> +       if (dev->client_hdev)
> +               hid_destroy_device(dev->client_hdev);
> +
>         hid_hw_close(hdev);
>  err_stop:
>         hid_hw_stop(hdev);
> @@ -1341,6 +1476,9 @@ static void ps_remove(struct hid_device *hdev)
>         ps_devices_list_remove(dev);
>         ps_device_release_player_id(dev);
>
> +       if (dev->client_hdev)
> +               hid_destroy_device(dev->client_hdev);
> +
>         hid_hw_close(hdev);
>         hid_hw_stop(hdev);
>  }
> --
> 2.36.0
>

