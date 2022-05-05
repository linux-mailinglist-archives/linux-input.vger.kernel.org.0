Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8F551BB0B
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 10:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350794AbiEEI45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 04:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242019AbiEEI4o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 04:56:44 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8924C4A926
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651740778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3jF1VzP67Rq9IEbXgbSAUWXh4I5pr87etckjQO7rq4Y=;
        b=X4uxrU4PJyjtF6ylALAdSZFAgrkOljZsyvFPXaloL6y7T9GSk4js1h+2Ata20TAO1s/xlz
        NCPkmRPDdGwf4noiDDqo0bbGCa6j1PexO62VJ/48bSn/mpXyYl2pZVufYk3iWye4OLGEBL
        tO14XfxNh8x918ZEdnVE69uQA5+MBM8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-mLJgqNw4MU-EaIaP1-a6Lw-1; Thu, 05 May 2022 04:52:57 -0400
X-MC-Unique: mLJgqNw4MU-EaIaP1-a6Lw-1
Received: by mail-pf1-f198.google.com with SMTP id b184-20020a62cfc1000000b0050d209cb8dcso939725pfg.3
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 01:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jF1VzP67Rq9IEbXgbSAUWXh4I5pr87etckjQO7rq4Y=;
        b=fmCEP8PwfzuhnkCZ6Qf1uRIY2W8C/1QFYvvwZrr6XnzqGFH9jeHQeR4EstpHFD8b4/
         7XVWs80q5BGezVbq/YK83epaza+2LepjuxsyubQwiGVu3+2/3QobkDxKUfuLNBSVpqbM
         p7q7RqwsTosZv0mhD1dJGR4GDsypddc5Kt494PRwTYlImwRNAb7zTIkToxRVzA+4ipF6
         24Cxh0i7RJ5TO/zqN960XGWEUSIBLv1kAt/ypRw7vppJeBBh9CmZxXGQZT8SXyqCufa1
         Yf9cILYaSYExrM4mRA6GsmAfE9v3TOEWtuPVY/4cJrIsi8c47k7TVAq19CRlX1nuVYCd
         8GrQ==
X-Gm-Message-State: AOAM530YNYgnFCklTB3xcmJndV3UVkL46brf7vEpbFzGnAC5/3cTk1b0
        DiDJv3gEPM1i55cZBA+TaI0TX8Dh5XqFG2v9Ee6K7JWu/k9D3Cfc7VWetzVr+mV9Hv5hBWmHvIn
        6Dy5lkoseNgd23nSnkhV8foOnDWHwWUjx39xsN7g=
X-Received: by 2002:a17:902:e012:b0:15d:53:61ff with SMTP id o18-20020a170902e01200b0015d005361ffmr25881075plo.73.1651740776490;
        Thu, 05 May 2022 01:52:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUV28OB0QxlmlY8OajMOYvEAnuJFb7atrLGrzKYhtxl/8MjM+Wl0tcYdtoMSPpHGDAaO1J9Bb4NNN/yLLcf9g=
X-Received: by 2002:a17:902:e012:b0:15d:53:61ff with SMTP id
 o18-20020a170902e01200b0015d005361ffmr25881058plo.73.1651740776258; Thu, 05
 May 2022 01:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com> <20220427224526.35657-2-vi@endrift.com>
In-Reply-To: <20220427224526.35657-2-vi@endrift.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 5 May 2022 10:52:45 +0200
Message-ID: <CAO-hwJ+ekkNpyXwdWmCW3mLqayNExVfC8gxR4MZYxmSXBa0NXQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] HID: hid-playstation: Add touchpad_mouse param
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

Hi Vicki,

On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
>
> Add parameter "touchpad_mouse" to enable disabling or re-enabling exposing the
> touchpad input_dev, which can be changed while the module is loaded.

What's the point of exposing this new parameter?
Patch 3/6 automatically disables touchpad when hidraw is opened, so
who will be the user of this parameter?

The problem I have with kernel parameter is that they are effectively
kernel API, and we need to keep them forever, so I'd rather have good
arguments on why this is needed.

Cheers,
Benjamin

>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/hid-playstation.c | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index f859a8dd8a2e..ad0da4470615 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -23,6 +23,8 @@ static LIST_HEAD(ps_devices_list);
>
>  static DEFINE_IDA(ps_player_id_allocator);
>
> +static bool touchpad_mouse = true;
> +
>  #define HID_PLAYSTATION_VERSION_PATCH 0x8000
>
>  /* Base class for playstation devices. */
> @@ -1343,6 +1345,45 @@ static void ps_remove(struct hid_device *hdev)
>         hid_hw_stop(hdev);
>  }
>
> +static int ps_param_set_touchpad_mouse(const char *val,
> +                                       const struct kernel_param *kp)
> +{
> +       struct ps_device *dev;
> +       struct dualsense *ds;
> +       struct input_dev *touchpad;
> +       int ret;
> +
> +       ret = param_set_bool(val, kp);
> +       if (ret)
> +               return ret;
> +
> +       mutex_lock(&ps_devices_lock);
> +       list_for_each_entry(dev, &ps_devices_list, list) {
> +               mutex_lock(&dev->mutex);
> +               if (dev->hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> +                       ds = container_of(dev, struct dualsense, base);
> +                       if (touchpad_mouse) {
> +                               touchpad = ps_touchpad_create(dev->hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
> +                               if (IS_ERR(touchpad))
> +                                       continue;
> +                               rcu_assign_pointer(ds->touchpad, touchpad);
> +                       } else
> +                               dualsense_unregister_touchpad(ds);
> +               }
> +               mutex_unlock(&dev->mutex);
> +       }
> +       mutex_unlock(&ps_devices_lock);
> +       return 0;
> +}
> +
> +static const struct kernel_param_ops ps_touchpad_mouse_ops = {
> +       .set    = ps_param_set_touchpad_mouse,
> +       .get    = param_get_bool,
> +};
> +
> +module_param_cb(touchpad_mouse, &ps_touchpad_mouse_ops, &touchpad_mouse, 0644);
> +MODULE_PARM_DESC(touchpad_mouse, "Enable mouse emulation using the touchpad");
> +
>  static const struct hid_device_id ps_devices[] = {
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
> --
> 2.36.0
>

