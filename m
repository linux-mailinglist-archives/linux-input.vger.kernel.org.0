Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6281BAFEE
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 23:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgD0VFC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 17:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726803AbgD0VFA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 17:05:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79008C0610D5
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:04:59 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so19190274ljn.7
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FRzDYtIIz0JW+6PZb2zruuBk+QvKYrYZ56R5C7QkFt4=;
        b=Veb/ERmM/Fvq5x+hnKuzFr+Oi2EvWj3JMRKfS5dreGvXGR7HHDRzCltSvz8iL74KVf
         vvXa7kQbiusaDvTAOk156Mf7hON3TX2a0FzndnVBAxLoFchHk+njI5H4pAE1kRF3vJo9
         NexN1jeZjghvsKd2uYooTEC2xo2RIMb7tJyhddQpRSVYJHnyIDBhUWfhvuemKFtWPkyv
         n+PH/T6Vl0pT7/m/aNwSdWgVFoULgg4DBzPqtfCljbt7hQFJVC+KhAx8/0MD/DpFChAt
         gnJ5gRLO3ljMyqRBuJAfJwiBuLZqD4q3UecBSDcPrZjGo6g2UuSmLpr+wyuN0e+GOLaF
         tUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FRzDYtIIz0JW+6PZb2zruuBk+QvKYrYZ56R5C7QkFt4=;
        b=qP0S99P5fCK+ZjEIhY1EzQwXcIhGKnsknM+9LtO9oYB0/eKk5C/ZGyRLjYm0/v8L3/
         KPS5suo25J6DdC12LDNpSRSgv+Djk9EZWRR35Ds9XoN1gj3IqJgHEENvtGEdrFyJOtgK
         Vbyr7HksHj+AlNuABrty9BkxMiML7v3IvQqQKs6Qf92KDWbYYypIAqGJqtJT8vFZHqa8
         MVuBmTxfq50svfE4npO2mYEqbVIZlkS8ivLgLfbCRCld9EDAoCRM9Nkfslg9/NBSZl46
         WrkF8yWlWjufCE2somKzVl7qWnQNxweCf111txO1YpnBzkCkUK5kitmJVitOKBFcmaNJ
         REFg==
X-Gm-Message-State: AGi0PuYIdPmQBiGSZlNjPDXThvd4b4U8nYWdiuXy87nQVSg1f+7fiEET
        +McJuI3kt8qxIyCsB6Xdha6US0xlugKfaFjQgllUig==
X-Google-Smtp-Source: APiQypJcRRtGTPVXnm8p8UXKalah/OzYXIqyedCHVb9HaBb9PhwfiYx7P9YHDFpHDH41Il/4E23OcBSc4zh1bxD3DHw=
X-Received: by 2002:a2e:9785:: with SMTP id y5mr14239323lji.66.1588021497399;
 Mon, 27 Apr 2020 14:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200328185916.98423-1-rajatja@google.com> <20200328185916.98423-2-rajatja@google.com>
 <20200424210316.GI125362@dtor-ws>
In-Reply-To: <20200424210316.GI125362@dtor-ws>
From:   Rajat Jain <rajatja@google.com>
Date:   Mon, 27 Apr 2020 14:04:20 -0700
Message-ID: <CACK8Z6GN63_KuQy3jieTn7uG6T4KQ7jRNKf0_4CVsGkCcY+enA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] Input: atkbd: Expose function row physical map to userspace
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dmitry Torokhov <dtor@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Furquan Shaikh <furquan@google.com>,
        Duncan Laurie <dlaurie@google.com>,
        Benson Leung <bleung@google.com>,
        Zentaro Kavanagh <zentaro@google.com>,
        Dominik Behr <dbehr@google.com>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Fri, Apr 24, 2020 at 2:03 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rajat,
>
> On Sat, Mar 28, 2020 at 11:59:13AM -0700, Rajat Jain wrote:
> > Certain keyboards have their top-row keys intended
> > for actions such as "Browser back", "Browser Refresh", "Fullscreen"
> > etc as their primary mode, thus they will send physical codes for those
> > actions. Further, they don't have a dedicated "Fn" key so don't have
> > the capability to generate function key codes (e.g. F1, F2 etc..).
> > However in this case, if userspace still wants to "synthesize" those
> > function keys using the top row action keys, it needs to know the
> > physical position of the top row keys. (Essentially a mapping between
> > usage codes and a physical location in the top row).
> >
> > This patch enhances the atkbd driver to receive such a mapping from the
> > firmware / device tree, and expose it to userspace in the form of
> > a function-row-physmap attribute. The attribute would be a space
> > separated ordered list of physical codes, for the keys in the function
> > row, in left-to-right order.
> >
> > The attribute will only be present if the kernel knows about such
> > mapping, otherwise the attribute shall not be visible.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > v4: Same as v3
> > v3: Change to dev_dbg and remove unecessary error check
> > v2: Remove the Change-Id from the commit log
> >
> >  drivers/input/keyboard/atkbd.c | 56 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> > index 7e3eae54c1926..3b20aba1861cd 100644
> > --- a/drivers/input/keyboard/atkbd.c
> > +++ b/drivers/input/keyboard/atkbd.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/libps2.h>
> >  #include <linux/mutex.h>
> >  #include <linux/dmi.h>
> > +#include <linux/property.h>
> >
> >  #define DRIVER_DESC  "AT and PS/2 keyboard driver"
> >
> > @@ -63,6 +64,8 @@ static bool atkbd_terminal;
> >  module_param_named(terminal, atkbd_terminal, bool, 0);
> >  MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard connected via AT/PS2");
> >
> > +#define MAX_FUNCTION_ROW_KEYS        24
> > +
> >  /*
> >   * Scancode to keycode tables. These are just the default setting, and
> >   * are loadable via a userland utility.
> > @@ -230,6 +233,9 @@ struct atkbd {
> >
> >       /* Serializes reconnect(), attr->set() and event work */
> >       struct mutex mutex;
> > +
> > +     u16 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
> > +     int num_function_row_keys;
> >  };
> >
> >  /*
> > @@ -283,6 +289,7 @@ static struct device_attribute atkbd_attr_##_name =                               \
> >       __ATTR(_name, S_IRUGO, atkbd_do_show_##_name, NULL);
> >
> >  ATKBD_DEFINE_RO_ATTR(err_count);
> > +ATKBD_DEFINE_RO_ATTR(function_row_physmap);
> >
> >  static struct attribute *atkbd_attributes[] = {
> >       &atkbd_attr_extra.attr,
> > @@ -292,11 +299,42 @@ static struct attribute *atkbd_attributes[] = {
> >       &atkbd_attr_softrepeat.attr,
> >       &atkbd_attr_softraw.attr,
> >       &atkbd_attr_err_count.attr,
> > +     &atkbd_attr_function_row_physmap.attr,
> >       NULL
> >  };
> >
> > +static ssize_t atkbd_show_function_row_physmap(struct atkbd *atkbd, char *buf)
> > +{
> > +     ssize_t size = 0;
> > +     int i;
> > +
> > +     if (!atkbd->num_function_row_keys)
> > +             return 0;
> > +
> > +     for (i = 0; i < atkbd->num_function_row_keys; i++)
> > +             size += sprintf(buf + size, "%02X ",
> > +                             atkbd->function_row_physmap[i]);
> > +     size += sprintf(buf + size, "\n");
>
> Can we change this to scnprintf() with PAGE_SIZE as the initial limit?

Done.

>
> > +     return size;
> > +}
> > +
> > +static umode_t atkbd_attr_is_visible(struct kobject *kobj,
> > +                             struct attribute *attr, int i)
> > +{
> > +     struct device *dev = container_of(kobj, struct device, kobj);
> > +     struct serio *serio = to_serio_port(dev);
> > +     struct atkbd *atkbd = serio_get_drvdata(serio);
> > +
> > +     if (attr == &atkbd_attr_function_row_physmap.attr &&
> > +         !atkbd->num_function_row_keys)
> > +             return 0;
> > +
> > +     return attr->mode;
> > +}
> > +
> >  static struct attribute_group atkbd_attribute_group = {
> >       .attrs  = atkbd_attributes,
> > +     .is_visible = atkbd_attr_is_visible,
> >  };
> >
> >  static const unsigned int xl_table[] = {
> > @@ -1121,6 +1159,22 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
> >       }
> >  }
> >
> > +static void atkbd_parse_fwnode_data(struct serio *serio)
> > +{
> > +     struct atkbd *atkbd = serio_get_drvdata(serio);
> > +     struct device *dev = &serio->dev;
> > +     int n;
> > +
> > +     /* Parse "function-row-physmap" property */
> > +     n = device_property_count_u16(dev, "function-row-physmap");
>
> I think for ACPI case it does not matter, but if we ever have device
> tree using it, it will lead to less errors if we use u32 as the element
> size. Do you mind switching to it?

Done and posted the new patchset here:
https://patchwork.kernel.org/patch/11513295/

Thanks,
Rajat

>
> > +     if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
> > +         !device_property_read_u16_array(dev, "function-row-physmap",
> > +                                         atkbd->function_row_physmap, n)) {
> > +             atkbd->num_function_row_keys = n;
> > +             dev_dbg(dev, "FW reported %d function-row key locations\n", n);
> > +     }
> > +}
> > +
> >  /*
> >   * atkbd_connect() is called when the serio module finds an interface
> >   * that isn't handled yet by an appropriate device driver. We check if
> > @@ -1184,6 +1238,8 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
> >               atkbd->id = 0xab00;
> >       }
> >
> > +     atkbd_parse_fwnode_data(serio);
> > +
> >       atkbd_set_keycode_table(atkbd);
> >       atkbd_set_device_attrs(atkbd);
> >
>
> Thanks.
>
> --
> Dmitry
