Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5644F2F44AB
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 07:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbhAMGu3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 01:50:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbhAMGu3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 01:50:29 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AF0C061575
        for <linux-input@vger.kernel.org>; Tue, 12 Jan 2021 22:49:48 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id p15so432953pjv.3
        for <linux-input@vger.kernel.org>; Tue, 12 Jan 2021 22:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=neSby72j0b5HlJrIGeJmifVi+m9HqbA8b9D0MeTdW+w=;
        b=YFMpA4BH1B3/+tZWGOUoYSGmfyz0tcCAlV5ZHl8r4jS1YNzsKVUXOULZTcSApANNLf
         qzvxFLr0Awtds8T1tyY+uylAMZvgZNjDfvOzP6BZ+/rtN6wsvY6nr1O7R8hNUmH5BSFw
         J10Y9Dxl44jwBR4h6LwyGibc6O4+hb6GYzkXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=neSby72j0b5HlJrIGeJmifVi+m9HqbA8b9D0MeTdW+w=;
        b=NX8hMP5pZfnGzxndHN0gm3op8f/FhXuKC1UolL5XCtdbpAn5dLeyEkciyq5Ib6q+xy
         wOYCPwG2IIfADR4nGGkR9qs6U0AHkl+G5dM6+gZVWadxpSC+RV4PZvNURSsAVjjhUVrb
         crjGvpZW41o+WyuStd9htznK254YB1eejnPoN+MyZPAYiApzF21f8TV7C2byfQ5AOg20
         9vTxFqHvhHFu4Ydh73QFfi2ft7fPKpWfdiK9M2H5lSKeLiQOmfKMs+SGDHU3co2ei0TN
         FSnKXYI/JWIiOHUAXmdv0rY44HqtZ5ADbX3DbKnZ+yS0jgCJOLRarUotuz8LRogwOyL4
         pTzQ==
X-Gm-Message-State: AOAM5305oGayg3V3ktsj6UVxGf4MEMEZ8Ja3gNwyeZE62/BX4zAuYVkI
        rP21oDAClTSdHXfXuFUtiGYTGA==
X-Google-Smtp-Source: ABdhPJxvosWJiHmSgpKvk+/JhQBQcgB9mJ7kYVHs54zEqUKckSwoIzpnznntfjxKM+x3J6bjQBp2rw==
X-Received: by 2002:a17:902:d202:b029:da:d86b:78be with SMTP id t2-20020a170902d202b02900dad86b78bemr845912ply.0.1610520588002;
        Tue, 12 Jan 2021 22:49:48 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x125sm1275744pgb.35.2021.01.12.22.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 22:49:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CA+cxXhm45emyg-9j99U=UWY8QuhzWifh+VvsFBaTOTWs81tvUQ@mail.gmail.com>
References: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid> <20210107154200.v4.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid> <161041827643.3661239.17919996906733477213@swboyd.mtv.corp.google.com> <CA+cxXhm45emyg-9j99U=UWY8QuhzWifh+VvsFBaTOTWs81tvUQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
To:     Philip Chen <philipchen@chromium.org>
Date:   Tue, 12 Jan 2021 22:49:45 -0800
Message-ID: <161052058590.3661239.5654596152411573148@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Philip Chen (2021-01-12 15:55:28)
> On Mon, Jan 11, 2021 at 6:24 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Philip Chen (2021-01-07 15:42:09)
> > > The top-row keys in a keyboard usually have dual functionalities.
> > > E.g. A function key "F1" is also an action key "Browser back".
> > >
> > > Therefore, when an application receives an action key code from
> > > a top-row key press, the application needs to know how to correlate
> > > the action key code with the function key code and do the conversion
> > > whenever necessary.
> > >
> > > Since the userpace already knows the key scanlines (row/column)
> > > associated with a received key code. Essentially, the userspace only
> > > needs a mapping between the key row/column and the matching physical
> > > location in the top row.
> > >
> > > This patch enhances the cros-ec-keyb driver to create such a mapping
> > > and expose it to userspace in the form of a function-row-physmap
> > > attribute. The attribute would be a space separated ordered list of
> > > row/column codes, for the keys in the function row, in a left-to-right
> > > order.
> > >
> > > The attribute will only be present when the device has a custom design
> > > for the top-row keys.
> >
> > Is it documented in Documentation/ABI/?
> Not yet.
> Is it proper to add the documentation to `testing/sysfs-driver-input-keyb=
oard`?

Somewhere in testing is fine. I'm not sure if it is a generic proprty
for all keyboards though? What's the path in sysfs?

> >
> > >
> > >  /**
> > >   * struct cros_ec_keyb - Structure representing EC keyboard device
> > >   *
> > > @@ -42,6 +44,9 @@
> > >   * @idev: The input device for the matrix keys.
> > >   * @bs_idev: The input device for non-matrix buttons and switches (o=
r NULL).
> > >   * @notifier: interrupt event notifier for transport devices
> > > + * @function_row_physmap: An array of the encoded rows/columns for t=
he top
> > > + *                        row function keys, in an order from left t=
o right
> > > + * @num_function_row_keys: The number of top row keys in a custom ke=
yboard
> > >   */
> > >  struct cros_ec_keyb {
> > >         unsigned int rows;
> > > @@ -58,6 +63,9 @@ struct cros_ec_keyb {
> > >         struct input_dev *idev;
> > >         struct input_dev *bs_idev;
> > >         struct notifier_block notifier;
> > > +
> > > +       u16 function_row_physmap[MAX_NUM_TOP_ROW_KEYS];
> > > +       u8 num_function_row_keys;
> >
> > Why not size_t?
> I usually try to use the minimal required bytes for variables, even
> for local ones.
> In this case, we only need one byte for num_function_row_keys.
> Are there any reasons why size_t is better?

I suppose to indicate that it's an array size. It's not a super strong
argument but the usage of u8 looks like we're trying to save space in a
single structure instance (or maybe a couple if there are a few
keyboards), when for all I know it actually generates worse code because
it has to do some masking operation on the load from memory when it
could just load the value directly into a register.

> >
> > >  };
> > >
> > >  /**
> > > @@ -587,6 +613,52 @@ static int cros_ec_keyb_register_matrix(struct c=
ros_ec_keyb *ckdev)
> > >         return 0;
> > >  }
> > >
> > > +static ssize_t function_row_physmap_show(struct device *dev,
> > > +                                        struct device_attribute *att=
r,
> > > +                                        char *buf)
> > > +{
> > > +       ssize_t size =3D 0;
> > > +       u8 i;
> >
> > int i? Why u8? Surely the size of a local variable isn't important.
> The same reason as "u8 num_function_row_keys".
> Is int better in this case?

Yeah int is better because it's a local variable and nobody cares about
those extra few bytes.

> >
> > > +       struct cros_ec_keyb *ckdev =3D dev_get_drvdata(dev);
> > > +
> > > +       if (!ckdev->num_function_row_keys)
> > > +               return 0;
> > > +
> > > +       for (i =3D 0; i < ckdev->num_function_row_keys; i++)
> > > +               size +=3D scnprintf(buf + size, PAGE_SIZE - size, "%0=
2X ",
> > > +                                 ckdev->function_row_physmap[i]);
> > > +       size +=3D scnprintf(buf + size, PAGE_SIZE - size, "\n");
> > > +
> > > +       return size;
> >
> > I'd rather see
> >
> >         ssize_t size =3D 0;
> >         int i;
> >         struct cros_ec_keyb *ckdev =3D dev_get_drvdata(dev);
> >         u16 *physmap =3D ckdev->function_row_physmap;
> >
> >         for (i =3D 0; i < ckdev->num_function_row_keys; i++)
> >                 size +=3D scnprintf(buf + size, PAGE_SIZE - size,
> >                                   "%s%02X", size ? " " : "", physmap[i]=
);
> >
> >         if (size)
> >                 size +=3D scnprintf(buf + size, PAGE_SIZE - size, "\n");
> >
> >         return size;
> >
> > And I wonder if hex_dump_to_buffer() works for this?
> It seems to work? I'll give it a try.
> If hex_dump_to_buffer() doesn't work, I'll fall back to the
> implementation you suggested above.

Ok sounds good.
