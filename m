Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C78F6100192
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2019 10:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRJns (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 04:43:48 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35882 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726464AbfKRJnh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 04:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574070215;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2K0wvDeLJaW8sYE1jy+QQGz6cSrIUDN55exId+Sge8Y=;
        b=D7j6LC5htBBByzR4SJIWinAiI4mIkL7/q8XHLdaW4xHTWoKdMqrWR0p2mL7HwfC7CFwejF
        MrCtEHeS9s+wtRtbKq9X0syx/Hck+HWj5HfRRp9eYRdzjeI8vgKnetE9g4ZISr1e7vs+qH
        /Gq9wDMQCf4bR/3A2pxwa32LSdh1cnY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-TUq5E6l6NCS6o9WVMwjYYA-1; Mon, 18 Nov 2019 04:43:34 -0500
Received: by mail-qt1-f197.google.com with SMTP id v92so11856294qtd.18
        for <linux-input@vger.kernel.org>; Mon, 18 Nov 2019 01:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v6BPHFPKvorTEt7xRKiDYcS9E+a1exQkd1rgkDj9f8k=;
        b=lXzaf5gAkKwzNjBqIVIr2UiGSCz/4iTgEL1CrBnlpCGh0kwpH4twWr5nE4XBXCmbWD
         dBmNMrxdX9FrDdorgQDe6TW1FzbEblGXM1PkOxzz86575eF65CksBvM7p8TxjYxPJ3bg
         hNuJE64qaMqqni9Sy6yKGzrRTrrGznHofgEclv/hQWt6doQJCBmfEQHOX2wv04/OFYIP
         1XEFt2RwFizPJiPS7FKlHYekB6LezCSKRIOIWOiZQaAp5EwR6CUGV4l+cLd6uvXqvoOw
         HKpxDcjMqz7x6EjVJErNKCSftulUl2vgugOEoIiKfy6Rlzg/grgq8uz5Z1/kRDlsBGAp
         MOZw==
X-Gm-Message-State: APjAAAX5BxrvJG8KsEd8/iqLNs9YiRZ/Z167vUI4fnFwE4TerqJUGadm
        AxSlL/81pD4jupduetTJ4HMm1q6Rdo4da673d996RXqKHvdvU76Ot6A/y7Hu4r69Y5JbUDMoN8y
        fWVhfgXGeAh5AqAj08bM3WELoWS32J4WaUAR0Gpw=
X-Received: by 2002:ad4:4042:: with SMTP id r2mr14849476qvp.196.1574070214014;
        Mon, 18 Nov 2019 01:43:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqx71kYpokpYolgnoIGCviUOb0R7a7qr8hq+AWngDyS809ErQ8pbjgNF0TGZ3+0bjitznHrrNaWkVj/d0HliWew=
X-Received: by 2002:ad4:4042:: with SMTP id r2mr14849462qvp.196.1574070213673;
 Mon, 18 Nov 2019 01:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20191105141807.27054-1-tranmanphong@gmail.com>
In-Reply-To: <20191105141807.27054-1-tranmanphong@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 18 Nov 2019 10:43:21 +0100
Message-ID: <CAO-hwJ+cydMPQE_otc8-67=SDKmjac5RXsLs-9x6dH4YqA+DVQ@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-lg4ff: Fix uninit-value set_autocenter_default
To:     Phong Tran <tranmanphong@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
X-MC-Unique: TUq5E6l6NCS6o9WVMwjYYA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 5, 2019 at 3:18 PM Phong Tran <tranmanphong@gmail.com> wrote:
>
> syzbot found a problem using of uinit pointer in
> lg4ff_set_autocenter_default().
>
> Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
>
> Tested by syzbot:
>
> https://groups.google.com/d/msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQAJ

This seems weird to me:

the syzbot link above is about `hid_get_drvdata(hid)`, and, as I read
it, the possibility that hid might not have an initialized value.

Here you are changing the initialized values of value, entry and
drv_data, all 3 are never used before their first assignment.

I have a feeling this particular syzbot check has already been fixed
upstream by d9d4b1e46d95 "HID: Fix assumption that devices have
inputs".

Cheers,
Benjamin

>
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> ---
>  drivers/hid/hid-lg4ff.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
> index 5e6a0cef2a06..44dfd08b0c32 100644
> --- a/drivers/hid/hid-lg4ff.c
> +++ b/drivers/hid/hid-lg4ff.c
> @@ -468,10 +468,10 @@ static int lg4ff_play(struct input_dev *dev, void *=
data, struct ff_effect *effec
>  static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magn=
itude)
>  {
>         struct hid_device *hid =3D input_get_drvdata(dev);
> -       s32 *value;
> +       s32 *value =3D NULL;
>         u32 expand_a, expand_b;
> -       struct lg4ff_device_entry *entry;
> -       struct lg_drv_data *drv_data;
> +       struct lg4ff_device_entry *entry =3D NULL;
> +       struct lg_drv_data *drv_data =3D NULL;
>         unsigned long flags;
>
>         drv_data =3D hid_get_drvdata(hid);
> --
> 2.20.1
>

