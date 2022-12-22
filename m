Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7805F6547AA
	for <lists+linux-input@lfdr.de>; Thu, 22 Dec 2022 22:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235617AbiLVVND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Dec 2022 16:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbiLVVNA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Dec 2022 16:13:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6230186A6
        for <linux-input@vger.kernel.org>; Thu, 22 Dec 2022 13:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671743533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xm3zfx2w0Rv/QhCPp43l1d4YnOjZ2jCv9sko5e0//UM=;
        b=bJTB9IW8hNutoGNtr/2pee1KRhBaoev/XnnBdCxq4tpfeCPm1tK3M8GBGVkfX7QVCmwXo5
        4lnn67IhKK9IiOiXWhvh18GGVSQzvJjaTpzd7nkWBFqikU3piDm1AqlgTU54j51vK49xbQ
        c4zGVuvBguVBo5RHVXmS1ADbVteE1w8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-296-663fGoKgN1aZlNzPiux_Lw-1; Thu, 22 Dec 2022 16:12:12 -0500
X-MC-Unique: 663fGoKgN1aZlNzPiux_Lw-1
Received: by mail-io1-f71.google.com with SMTP id o16-20020a056602225000b006e032e361ccso1194132ioo.13
        for <linux-input@vger.kernel.org>; Thu, 22 Dec 2022 13:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm3zfx2w0Rv/QhCPp43l1d4YnOjZ2jCv9sko5e0//UM=;
        b=c9Ubpt672GeNE+CEhHSFztdZw39jIcV2YjAhmCfhsqtnt415jef4L5wn3keMFr1tle
         MSc66OrmRdFeHJ4atDUudjbErPvtsiDPSsb3SYRJ5BZXbqBGz3Z9avrPFCmKUWxEt4LA
         glaXCwBtQuzbxe25hXzWgRJagB9vVisUimwkuR5aM80HDpsNhv+okRfwngsEHQYfDWUl
         8wxdXkv3DFL8JQfFCqo4HB+TJMI5RhkYL0lc05PpwK4iVutLiwH4rveLCDwqSVFyuaz6
         sjMQ1K0pAS9suI9Hl5ls9elIui1bjTbXBXIQORreIzTp2A4sEk6FZz/U5bwAAKFyHsAo
         adTw==
X-Gm-Message-State: AFqh2kqGRPuY5IzEJBew+gdbpc8nMrIj1Yuu3viF/f1VuOsJM3UjGaaV
        kJtxxX7twMWPQnLbcKjNgGijtuzFSFkarYsj7dozbcdDMqY2Dt9cxE4CFEyk9Y1mwWlCqu1ZK0b
        gN7ATlc0MVti2gzX0u2IETYdIinmXwwHUrNVc0KY=
X-Received: by 2002:a02:cbb4:0:b0:39d:2ab3:d819 with SMTP id v20-20020a02cbb4000000b0039d2ab3d819mr548721jap.221.1671743531394;
        Thu, 22 Dec 2022 13:12:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvZEz2ocbnnyvLr+TW4iQ7/91FUvUfuHg4WGWFgzaujg/CI4SQoqrB0K05HszUkil3yhVFotx6AXjwacX9EPiU=
X-Received: by 2002:a02:cbb4:0:b0:39d:2ab3:d819 with SMTP id
 v20-20020a02cbb4000000b0039d2ab3d819mr548714jap.221.1671743531178; Thu, 22
 Dec 2022 13:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20221222-hid-v1-0-f4a6c35487a5@weissschuh.net> <20221222-hid-v1-2-f4a6c35487a5@weissschuh.net>
In-Reply-To: <20221222-hid-v1-2-f4a6c35487a5@weissschuh.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 22 Dec 2022 22:12:00 +0100
Message-ID: <CAO-hwJL+zenkC+qPuPWLO-dFkg_pWoGTQYXR5mzSqUrnX6MObA@mail.gmail.com>
Subject: Re: [PATCH 2/8] HID: usbhid: Make hid_is_usb() non-inline
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        David Rheinsberg <david.rheinsberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 22, 2022 at 6:16 AM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:
>
> By making hid_is_usb() a non-inline function the lowlevel usbhid driver
> does not have to be exported anymore.
>
> Also mark the argument as const as it is not modified.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/hid/usbhid/hid-core.c | 6 ++++++
>  include/linux/hid.h           | 5 +----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.=
c
> index be4c731aaa65..54b0280d0073 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -1334,6 +1334,12 @@ struct hid_ll_driver usb_hid_driver =3D {
>  };
>  EXPORT_SYMBOL_GPL(usb_hid_driver);
>
> +bool hid_is_usb(const struct hid_device *hdev)
> +{
> +       return hdev->ll_driver =3D=3D &usb_hid_driver;
> +}
> +EXPORT_SYMBOL_GPL(hid_is_usb);
> +
>  static int usbhid_probe(struct usb_interface *intf, const struct usb_dev=
ice_id *id)
>  {
>         struct usb_host_interface *interface =3D intf->cur_altsetting;
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 8677ae38599e..e8400aa78522 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -864,10 +864,7 @@ static inline bool hid_is_using_ll_driver(struct hid=
_device *hdev,
>         return hdev->ll_driver =3D=3D driver;
>  }
>
> -static inline bool hid_is_usb(struct hid_device *hdev)
> -{
> -       return hid_is_using_ll_driver(hdev, &usb_hid_driver);
> -}
> +extern bool hid_is_usb(const struct hid_device *hdev);

The problem here is that CONFIG_USB_HID can be set to either m or n.
In the n case, you'll end up with an undefined symbol, in the m case,
it won't link too if CONFIG_HID is set to Y (and it'll be quite a mess
to call it if the module is not loaded yet).

Cheers,
Benjamin


>
>
>  #define        PM_HINT_FULLON  1<<5
>  #define PM_HINT_NORMAL 1<<1
>
> --
> 2.39.0
>

