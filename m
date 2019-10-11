Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E916D436F
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 16:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfJKOwU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 10:52:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52887 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726174AbfJKOwT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 10:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570805538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LjOMlr04CDEWM+WiRuQ0QvBbFcIyJJ1BMad1vbnZ+hQ=;
        b=SLllh59rdE88/kNvnAx3QmWUcGQ/brAgHHYZnhSmBJmOdwyLlxCROr1/lbtMPudFmtEFQc
        vkA2oqKz5/JCBtM8CEaGboIXe6vMxi0QSb9SzIGRqEYmpkWSip7CM8cWtbK0o1PfntAzEk
        JTCJCDxPQBG03Ou6euzNvVnB5wXFRUQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-nFrVG7JlPQqbRSEA0fNSBA-1; Fri, 11 Oct 2019 10:52:16 -0400
Received: by mail-qt1-f200.google.com with SMTP id n59so9644376qtd.8
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 07:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZ0bfU2716rhby1DyBXCXfWn03SSsmBdmRdt0EnLS1k=;
        b=GCuBoPSezXYu3M4+YCJJsLAmLSw/5suW/jByO63lZKIiWPGmadSUg26V6NMyoQxeIA
         /GP8bQ+Bo5uwiwlqrKbYo8pZ+tTNZawsDPI6em9RDUWgDtDroJX+zoZRMnZxgZBQxu4D
         8GmUnV3chlKtuRFqMVEwCT1PqdvR4Vw9X9WP18c3LCBLDB55a4MgNdN/woSWM1PlRVtf
         M+wuBxn5Kw1R+iadwspi2mbFkEbpdR8KqKMCtDKkLejmz812L9k+GTa8l/Vh0+/VLO5c
         EAclLMWfQRiqFu8DiqcqLT/vo3q37g9RTH1UOOpUzUeZsLj/k0Wr1dVN6wKl7o8wPwns
         yOaQ==
X-Gm-Message-State: APjAAAW3yRhxIWgy4SfWmhiDjyDrmbeLh+o07o2BWCW9ZphmUyYYjcRf
        u9XzmzgyDnUN6hZMRM9BW4H6Ske3onV7bvegbIvESw0/oFVOZGWWY4io0QgF7lZ+1sVabbYH69j
        VJH7YC1rxOjy5DzntjH2lKn9cxVbDpucgyOeZFN4=
X-Received: by 2002:ae9:f306:: with SMTP id p6mr16072323qkg.169.1570805536487;
        Fri, 11 Oct 2019 07:52:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzTfHCZ3UlZd2fgDUgIL/k7ZBTcdoSj99nnvjVsUswVePU8Cqx6eoHwfnLCLhbgJCWU7048/TDkRczOka2mx9A=
X-Received: by 2002:ae9:f306:: with SMTP id p6mr16072285qkg.169.1570805536178;
 Fri, 11 Oct 2019 07:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191007051240.4410-1-andrew.smirnov@gmail.com> <20191007051240.4410-2-andrew.smirnov@gmail.com>
In-Reply-To: <20191007051240.4410-2-andrew.smirnov@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 16:52:04 +0200
Message-ID: <CAO-hwJ+jPGa5Z7=Lopsc23m8UOqGWB0=tN+DcotykseAPM7_7w@mail.gmail.com>
Subject: Re: [PATCH 1/3] HID: logitech-hidpp: use devres to manage FF private data
To:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Bazely <sambazley@fastmail.com>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
X-MC-Unique: nFrVG7JlPQqbRSEA0fNSBA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrey,

On Mon, Oct 7, 2019 at 7:13 AM Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>
> To simplify resource management in commit that follows as well as to
> save a couple of extra kfree()s and simplify hidpp_ff_deinit() switch
> driver code to use devres to manage the life-cycle of FF private data.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Sam Bazely <sambazley@fastmail.com>
> Cc: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
> Cc: Austin Palmer <austinp@valvesoftware.com>
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: stable@vger.kernel.org

This patch doesn't seem to fix any error, is there a reason to send it
to stable? (besides as a dependency of the rest of the series).

> ---
>  drivers/hid/hid-logitech-hidpp.c | 53 +++++++++++++++++---------------
>  1 file changed, 29 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 0179f7ed77e5..58eb928224e5 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -2079,6 +2079,11 @@ static void hidpp_ff_destroy(struct ff_device *ff)
>         struct hidpp_ff_private_data *data =3D ff->private;
>
>         kfree(data->effect_ids);

Is there any reasons we can not also devm alloc data->effect_ids?

> +       /*
> +        * Set private to NULL to prevent input_ff_destroy() from
> +        * freeing our devres allocated memory

Ouch. There is something wrong here: input_ff_destroy() calls
kfree(ff->private), when the data has not been allocated by
input_ff_create(). This seems to lack a little bit of symmetry.

> +        */
> +       ff->private =3D NULL;
>  }
>
>  static int hidpp_ff_init(struct hidpp_device *hidpp, u8 feature_index)
> @@ -2090,7 +2095,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp=
, u8 feature_index)
>         const u16 bcdDevice =3D le16_to_cpu(udesc->bcdDevice);
>         struct ff_device *ff;
>         struct hidpp_report response;
> -       struct hidpp_ff_private_data *data;
> +       struct hidpp_ff_private_data *data =3D hidpp->private_data;
>         int error, j, num_slots;
>         u8 version;
>
> @@ -2129,18 +2134,13 @@ static int hidpp_ff_init(struct hidpp_device *hid=
pp, u8 feature_index)
>                 return error;
>         }
>
> -       data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> -       if (!data)
> -               return -ENOMEM;
>         data->effect_ids =3D kcalloc(num_slots, sizeof(int), GFP_KERNEL);
> -       if (!data->effect_ids) {
> -               kfree(data);
> +       if (!data->effect_ids)
>                 return -ENOMEM;
> -       }
> +
>         data->wq =3D create_singlethread_workqueue("hidpp-ff-sendqueue");
>         if (!data->wq) {
>                 kfree(data->effect_ids);
> -               kfree(data);
>                 return -ENOMEM;
>         }
>
> @@ -2199,28 +2199,15 @@ static int hidpp_ff_init(struct hidpp_device *hid=
pp, u8 feature_index)
>         return 0;
>  }
>
> -static int hidpp_ff_deinit(struct hid_device *hid)
> +static void hidpp_ff_deinit(struct hid_device *hid)
>  {
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next, struc=
t hid_input, list);
> -       struct input_dev *dev =3D hidinput->input;
> -       struct hidpp_ff_private_data *data;
> -
> -       if (!dev) {
> -               hid_err(hid, "Struct input_dev not found!\n");
> -               return -EINVAL;
> -       }
> +       struct hidpp_device *hidpp =3D hid_get_drvdata(hid);
> +       struct hidpp_ff_private_data *data =3D hidpp->private_data;
>
>         hid_info(hid, "Unloading HID++ force feedback.\n");
> -       data =3D dev->ff->private;
> -       if (!data) {

I am pretty sure we might need to keep a test on data not being null.

> -               hid_err(hid, "Private data not found!\n");
> -               return -EINVAL;
> -       }
>
>         destroy_workqueue(data->wq);
>         device_remove_file(&hid->dev, &dev_attr_range);
> -
> -       return 0;
>  }

This whole hunk seems unrelated to the devm change.
Can you extract a patch that just stores hidpp_ff_private_data in
hidpp->private_data and then cleans up hidpp_ff_deinit() before
switching it to devm? (or maybe not, see below)

After a few more thoughts, I don't think this mixing of devm and non
devm is a good idea:
we could say that the hidpp_ff_private_data and its effect_ids are
both children of the input_dev, not the hid_device. And we would
expect the whole thing to simplify with devm, but it's not, because ff
is not supposed to be used with devm.

I have a feeling the whole ff logic is wrong in term of where things
should be cleaned up, but I can not come up with a good hint on where
to start. For example, destroy_workqueue() is called in
hidpp_ff_deinit() where it might be racy, and maybe we should call it
in hidpp_ff_destroy()...

Last, you should base this patch on top of the for-next branch, we
recently merged a fix for the FF drivers in the HID subsystem:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=3Dfor=
-next&id=3Dd9d4b1e46d9543a82c23f6df03f4ad697dab361b

Would it be too complex to drop this patch from the series and do a
proper follow up cleanup series that might not need to go to stable?

Cheers,
Benjamin

>
>
> @@ -2725,6 +2712,20 @@ static int k400_connect(struct hid_device *hdev, b=
ool connected)
>
>  #define HIDPP_PAGE_G920_FORCE_FEEDBACK                 0x8123
>
> +static int g920_allocate(struct hid_device *hdev)
> +{
> +       struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
> +       struct hidpp_ff_private_data *data;
> +
> +       data =3D devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       hidpp->private_data =3D data;
> +
> +       return 0;
> +}
> +
>  static int g920_get_config(struct hidpp_device *hidpp)
>  {
>         u8 feature_type;
> @@ -3561,6 +3562,10 @@ static int hidpp_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
>                 ret =3D k400_allocate(hdev);
>                 if (ret)
>                         return ret;
> +       } else if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
> +               ret =3D g920_allocate(hdev);
> +               if (ret)
> +                       return ret;
>         }
>
>         INIT_WORK(&hidpp->work, delayed_work_cb);
> --
> 2.21.0
>

