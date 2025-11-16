Return-Path: <linux-input+bounces-16128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D559C61400
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 12:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 795CF4E69C6
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 11:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AB52C21DF;
	Sun, 16 Nov 2025 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mwl+bCtq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fmtSEZ7Q"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19BB2C0F9C
	for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763294091; cv=none; b=VYpSvtGp1dWZRauzzgppVxLHaAGSB2viPZRbYXiIoJeXVKdo3lQ0HQBxC9oM7BvTYjJaW8XauuIjacSSW4398A+e+PRKVydRrQb8NSe/FWLfCA6IvTSpe263ypyvNVik46QWhWNvs38v4h0ZmVSjdarkRz+gZj1+f7l2ZR3wde0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763294091; c=relaxed/simple;
	bh=5kqmqmwNphi8rI4c7dOgF3Z1B/ngSj5k7UdxcjpiRQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clcMjhhaowJ1ApdAngXij579on4vEjHUJgGtgbKQcBNx2jjrZfqKeVq3wby6DfYg+V2h3G9P2GvWyvS3OHFVmO/L+V9ZiO7xk56OqecFY2wjUbUtZiHHm9o9OVYXd/gEVKJjpeMcPwdgHCfAaK/8JIhN9yNLlyUow+jVskNx0MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mwl+bCtq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fmtSEZ7Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763294087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKslaeqOrVWHtUYkc/ve4La9P8AgIWkrIqBrJzHQJcU=;
	b=Mwl+bCtqag1BJBPY3xEbJJn7e/L2ERYV92ZKmuVm7FwyeYXuDt+Emd3v7DIOT2WUM3cTRY
	+uwmTSHprhPA9Q9g8StIYkug7KsDJ7h6J83GR8TqukmnANDhgaHHipNM1VoudaAiYmBhHq
	UsrKB5iWA98fvVIJW1yFrbCQjZMz64M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-GM_1CY4SOOmevVOsFw7EkA-1; Sun, 16 Nov 2025 06:54:45 -0500
X-MC-Unique: GM_1CY4SOOmevVOsFw7EkA-1
X-Mimecast-MFC-AGG-ID: GM_1CY4SOOmevVOsFw7EkA_1763294085
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429cbd8299cso1539967f8f.1
        for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 03:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763294084; x=1763898884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKslaeqOrVWHtUYkc/ve4La9P8AgIWkrIqBrJzHQJcU=;
        b=fmtSEZ7QhCB0iJI9j/Vx9OnRNQQElZ5hb/U5Eh/nD2ERn/gkihuQKnAhGOOgyAWUep
         Hi/xlQZTJX/y3jWk0RFf391F9U7RaBngfURPOkdpkNM3PmWheejZfcz4HyxbF3YGjGo2
         So2YA5MLuY03x01Q/7laSxUu5ECzI4d7y89lTrh96uwTKl2f9IdyYj2qpV9HNA5wtJJJ
         ebL1UP51jrvCrwQeSYzj55Zx6Uoq8mQQxu6jkPtpqFlifTBmEwXAYXqCy+8X8KjpR+uV
         S+l9E7KSUG8uk42shiUY3BlBLC7hYbYzB1edzfwm3VYTrJvO8URuCuD1wOMNitZcHnN9
         P14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763294084; x=1763898884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UKslaeqOrVWHtUYkc/ve4La9P8AgIWkrIqBrJzHQJcU=;
        b=ggnxBGoohctC9t/fc9rWaZTZRpa5yUi67t7spLe8aFnGAfuAb3lPbGLcywyxhSPqzl
         8ObLd7IFbhyR3qmZjfd4mDOyiQmsinRevEU7LxBeHppPr91MYQJ4cvsEg1xlWnsJceLD
         O+VkQZ3AL9ai8DYvoQMgC43Ll+I6GLUZVAU0xnT1QxZpkqCV8gR65U3ojoflYSsw7v3E
         kQL7upwQr9pgVmWIn0Ae7fHpFPTZdb032XfA+lZGyPSLhBPyDzaQoAnVpXlhGT67V3gD
         TpD93lsQIz2O4ZZEQWelRm0GNPC9QPoo1tRglG35b2IAAGLo96E7wYCW1MybKe7FINRd
         vQdg==
X-Gm-Message-State: AOJu0Yy9C9LoXbawP0icIY9V24CR5clBdtVf1Zvw4QU+tPi+fLhp1Zyk
	rY2wbuUZcjx6BZUDDYfELT+tAcufchzHnh7m1S10KVBKBRkfDZlhOPd0x2dzT+0rSgmzSrPSOZx
	sJpRgS9bCDGVzlQReT2NAsNdFAL+141pf+L0JbUUpaoJbIHn+IY8XR13/5Rt2TmrslJ38PIQs6t
	fal66f8yJ3/fzycMD9UaErDFnDk1veW2Ztltvp0eE=
X-Gm-Gg: ASbGncuWwl8TfynF4rGjW2yQxKSzcp5XVtDOFTE3qFYhreKFaKVzxDJzCaxe/WTyoUk
	ucQIvfjzHFq/obBya3XDf8LmR1/sXKv9enqTxT3JFpnG6LcW81yafot6fGQYjPjK33RUv8K7SdN
	pNBkSprgU6+Ch0SlVZvbnJHf7B6AzefkTN0ipHXBqHcgbAW8/I4evrPjtiiwZdBsj03TV0xsjeK
	dEc3nRfY5/9W4eRMlApZmhtDxrI
X-Received: by 2002:a05:6000:2504:b0:429:b8f9:a887 with SMTP id ffacd0b85a97d-42b5935e272mr7454250f8f.6.1763294084372;
        Sun, 16 Nov 2025 03:54:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3h9aGkh02zcvd0XSNYNklGZgbasIrv66PHY+92aFwJxQGKv4XR30w33BIL71iLcubej4sTCRgpXsvGat46cU=
X-Received: by 2002:a05:6000:2504:b0:429:b8f9:a887 with SMTP id
 ffacd0b85a97d-42b5935e272mr7454230f8f.6.1763294083861; Sun, 16 Nov 2025
 03:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113001508.713574-1-lzampier@redhat.com> <20251113001508.713574-4-lzampier@redhat.com>
 <my3aleryrl57cp3lc7y2puh45rccgxmkvlkyib5537zvhjnnwc@bfbyknryvp2u>
In-Reply-To: <my3aleryrl57cp3lc7y2puh45rccgxmkvlkyib5537zvhjnnwc@bfbyknryvp2u>
From: Lucas Zampieri <lzampier@redhat.com>
Date: Sun, 16 Nov 2025 11:54:32 +0000
X-Gm-Features: AWmQ_bkcnTvTIEBCmhS6gYLPN8cB0GHdOI7NE84US57X4qzQhwFp40Dc-wXYnkA
Message-ID: <CAOOg__BnRj78Govo8Dchtxng7uBB30ZUdD2zJhZYszQgfB9N2g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] HID: input: Add support for multiple batteries
 per device
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Sebastian Reichel <sre@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 11:08=E2=80=AFAM Benjamin Tissoires <bentiss@kernel=
.org> wrote:
>
> On Nov 13 2025, Lucas Zampieri wrote:
> > Enable HID devices to register and manage multiple batteries by
> > maintaining a list of hid_battery structures, each identified by
> > its report ID.
> >
> > The legacy dev->battery field and related fields are maintained for
> > backward compatibility, pointing to the first battery in the list.
> > This allows existing code to continue working unchanged while
> > enabling new functionality for multi-battery devices.
> >
> > Example hardware that can benefit from this:
> > - Gaming headsets with charging docks (e.g., SteelSeries Arctis Nova Pr=
o
> >   Wireless)
> > - Graphics tablets with stylus batteries (Wacom)
> > - Wireless earbuds with per-earbud batteries plus charging case
> > - Split keyboards with independent battery per side
> >
> > Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> > ---
> >  drivers/hid/hid-core.c  |  4 ++
> >  drivers/hid/hid-input.c | 99 +++++++++++++++++++++++++++--------------
> >  include/linux/hid.h     | 12 ++++-
> >  3 files changed, 80 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index a5b3a8ca2fcb..76d628547e9a 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -2990,6 +2990,10 @@ struct hid_device *hid_allocate_device(void)
> >       mutex_init(&hdev->ll_open_lock);
> >       kref_init(&hdev->ref);
> >
> > +#ifdef CONFIG_HID_BATTERY_STRENGTH
> > +     INIT_LIST_HEAD(&hdev->batteries);
> > +#endif
> > +
> >       ret =3D hid_bpf_device_init(hdev);
> >       if (ret)
> >               goto out_err;
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 0e71efea9da3..9d0be3d4ce04 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -520,14 +520,20 @@ static int hidinput_setup_battery(struct hid_devi=
ce *dev, unsigned report_type,
> >       unsigned quirks;
> >       s32 min, max;
> >       int error;
> > +     int battery_num =3D 0;
> >
> > -     if (dev->battery)
> > -             return 0;       /* already initialized? */
> > +     /* Check if battery with this report_id already exists */
> > +     list_for_each_entry(bat, &dev->batteries, list) {
> > +             if (bat->report_id =3D=3D field->report->id)
> > +                     return 0;       /* already initialized */
>
> I wonder if we should not make this test stick out a little bit more.
>
> Something like "get_battery(field)" which would return a battery if the
> field matches. This way, if we ever encounter multiple batteries
> reported on the same report ID, we can always split them by logical
> collection, physical, or something else.
>
I'll add that, and test it in my custom fw.

> > +             battery_num++;
> > +     }
> >
> >       quirks =3D find_battery_quirk(dev);
> >
> > -     hid_dbg(dev, "device %x:%x:%x %d quirks %d\n",
> > -             dev->bus, dev->vendor, dev->product, dev->version, quirks=
);
> > +     hid_dbg(dev, "device %x:%x:%x %d quirks %d report_id %d\n",
> > +             dev->bus, dev->vendor, dev->product, dev->version, quirks=
,
> > +             field->report->id);
> >
> >       if (quirks & HID_BATTERY_QUIRK_IGNORE)
> >               return 0;
> > @@ -542,9 +548,17 @@ static int hidinput_setup_battery(struct hid_devic=
e *dev, unsigned report_type,
> >               goto err_free_bat;
> >       }
> >
> > -     psy_desc->name =3D kasprintf(GFP_KERNEL, "hid-%s-battery",
> > -                                strlen(dev->uniq) ?
> > -                                     dev->uniq : dev_name(&dev->dev));
> > +     /* Create unique name for each battery based on report ID */
> > +     if (battery_num =3D=3D 0) {
> > +             psy_desc->name =3D kasprintf(GFP_KERNEL, "hid-%s-battery"=
,
> > +                                        strlen(dev->uniq) ?
> > +                                             dev->uniq : dev_name(&dev=
->dev));
> > +     } else {
> > +             psy_desc->name =3D kasprintf(GFP_KERNEL, "hid-%s-battery-=
%d",
> > +                                        strlen(dev->uniq) ?
> > +                                             dev->uniq : dev_name(&dev=
->dev),
> > +                                        battery_num);
> > +     }
>
> Not sure how much conservative you need to be here, but I would prefer
> we stick to the same naming pattern whether this is the first or second
> battery.
>
Agree completely, honestly that was the ugly bit for me, and the only
reason I keep that was for 'backwards compatibility' but now I know
better, and Ill made those consistent.

> >       if (!psy_desc->name) {
> >               error =3D -ENOMEM;
> >               goto err_free_desc;
> > @@ -597,15 +611,23 @@ static int hidinput_setup_battery(struct hid_devi=
ce *dev, unsigned report_type,
> >
> >       power_supply_powers(bat->ps, &dev->dev);
> >
> > -     /* Maintain legacy single battery fields for backward compatibili=
ty */
> > -     dev->battery =3D bat->ps;
> > -     dev->battery_min =3D bat->min;
> > -     dev->battery_max =3D bat->max;
> > -     dev->battery_report_type =3D bat->report_type;
> > -     dev->battery_report_id =3D bat->report_id;
> > -     dev->battery_charge_status =3D bat->charge_status;
> > -     dev->battery_status =3D bat->status;
> > -     dev->battery_avoid_query =3D bat->avoid_query;
> > +     list_add_tail(&bat->list, &dev->batteries);
> > +
> > +     /*
> > +      * The legacy single battery API is preserved by exposing the fir=
st
> > +      * discovered battery. Systems relying on a single battery view m=
aintain
> > +      * unchanged behavior.
> > +      */
> > +     if (battery_num =3D=3D 0) {
> > +             dev->battery =3D bat->ps;
> > +             dev->battery_min =3D bat->min;
> > +             dev->battery_max =3D bat->max;
> > +             dev->battery_report_type =3D bat->report_type;
> > +             dev->battery_report_id =3D bat->report_id;
> > +             dev->battery_charge_status =3D bat->charge_status;
> > +             dev->battery_status =3D bat->status;
> > +             dev->battery_avoid_query =3D bat->avoid_query;
> > +     }
>
> Again, why keeping the old fields? Are they used anywhere?
>
Ack, and updating those on v3.

> >
> >       return 0;
> >
> > @@ -620,21 +642,33 @@ static int hidinput_setup_battery(struct hid_devi=
ce *dev, unsigned report_type,
> >
> >  static void hidinput_cleanup_battery(struct hid_device *dev)
> >  {
> > -     struct hid_battery *bat;
> > +     struct hid_battery *bat, *next;
> >       const struct power_supply_desc *psy_desc;
> >
> > -     if (!dev->battery)
> > -             return;
> > +     list_for_each_entry_safe(bat, next, &dev->batteries, list) {
> > +             psy_desc =3D bat->ps->desc;
> > +             power_supply_unregister(bat->ps);
> > +             kfree(psy_desc->name);
> > +             kfree(psy_desc);
> > +             list_del(&bat->list);
> > +             kfree(bat);
> > +     }
>
> Really, switching to devm the batteries would greatly help not making
> mistakes here.
>
> >
> > -     bat =3D power_supply_get_drvdata(dev->battery);
> > -     psy_desc =3D dev->battery->desc;
> > -     power_supply_unregister(dev->battery);
> > -     kfree(psy_desc->name);
> > -     kfree(psy_desc);
> > -     kfree(bat);
> >       dev->battery =3D NULL;
> >  }
> >
> > +static struct hid_battery *hidinput_find_battery(struct hid_device *de=
v,
> > +                                              int report_id)
> > +{
> > +     struct hid_battery *bat;
> > +
> > +     list_for_each_entry(bat, &dev->batteries, list) {
> > +             if (bat->report_id =3D=3D report_id)
> > +                     return bat;
> > +     }
> > +     return NULL;
> > +}
>
> Oh, so you already have this function. So why not making use of it in
> hidinput_setup_battery()?
>
"backwards compatibility" lol, but yeah in v2 I implemented it
half-way, in v3 I'll make a proper use of it with the full list
conversion.

> > +
> >  static bool hidinput_update_battery_charge_status(struct hid_battery *=
bat,
> >                                                 unsigned int usage, int=
 value)
> >  {
> > @@ -652,17 +686,16 @@ static bool hidinput_update_battery_charge_status=
(struct hid_battery *bat,
> >       return false;
> >  }
> >
> > -static void hidinput_update_battery(struct hid_device *dev, unsigned i=
nt usage,
> > -                                 int value)
> > +static void hidinput_update_battery(struct hid_device *dev, int report=
_id,
> > +                                 unsigned int usage, int value)
> >  {
> >       struct hid_battery *bat;
> >       int capacity;
> >
> > -     if (!dev->battery)
> > +     bat =3D hidinput_find_battery(dev, report_id);
> > +     if (!bat)
> >               return;
> >
> > -     bat =3D power_supply_get_drvdata(dev->battery);
> > -
> >       if (hidinput_update_battery_charge_status(bat, usage, value)) {
> >               power_supply_changed(bat->ps);
> >               return;
> > @@ -705,8 +738,8 @@ static void hidinput_cleanup_battery(struct hid_dev=
ice *dev)
> >  {
> >  }
> >
> > -static void hidinput_update_battery(struct hid_device *dev, unsigned i=
nt usage,
> > -                                 int value)
> > +static void hidinput_update_battery(struct hid_device *dev, int report=
_id,
> > +                                 unsigned int usage, int value)
>
> Why not hidinput_update_battery(struct hid_battery *bat, unsigned int usa=
ge, int value)?
>
I see, this is much more elegant, as I can avoid the lookup inside the
funcion that way, let me use that on the v3.

> >  {
> >  }
> >  #endif       /* CONFIG_HID_BATTERY_STRENGTH */
> > @@ -1574,7 +1607,7 @@ void hidinput_hid_event(struct hid_device *hid, s=
truct hid_field *field, struct
> >               return;
> >
> >       if (usage->type =3D=3D EV_PWR) {
> > -             hidinput_update_battery(hid, usage->hid, value);
> > +             hidinput_update_battery(hid, report->id, usage->hid, valu=
e);
>
> With the suggested change in hidinput_update_battery, first query the
> battery and then change it.
>
Ack
> >               return;
> >       }
> >
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index 63422130de20..a6e36835fb3c 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -700,8 +700,16 @@ struct hid_device {
> >  #ifdef CONFIG_HID_BATTERY_STRENGTH
> >       /*
> >        * Power supply information for HID devices which report
> > -      * battery strength. power_supply was successfully registered if
> > -      * battery is non-NULL.
> > +      * battery strength. Each battery is tracked separately in the
> > +      * batteries list.
> > +      */
> > +     struct list_head batteries;             /* List of hid_battery st=
ructures */
> > +
> > +     /*
> > +      * Legacy single battery support - kept for backwards compatibili=
ty.
> > +      * Points to the first battery in the list if any exists.
> > +      * power_supply was successfully registered if battery is non-NUL=
L.
> > +      * DEPRECATED: New code should iterate through batteries list ins=
tead.
> >        */
> >       struct power_supply *battery;
>
> Nah. hid_device is pure internal interface. So change all the users if
> needed, but don't keep something around in the hope that others will do
> the work for you.
>
> For references there has been a very long discussion with Linus about
> API changes, and the result was that any API change that introduced a
> duplicate API was probably a bad design ;)
>
Ack, and that was the knowledge that I was missing and why I stuck to
much to making it backwards compatible, thanks for that really.

> Cheers,
> Benjamin
>
> >       __s32 battery_capacity;
> > --
> > 2.51.1
> >
>

Best,
Lucas Zampieri


