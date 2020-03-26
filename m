Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83678194B71
	for <lists+linux-input@lfdr.de>; Thu, 26 Mar 2020 23:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgCZWT0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 18:19:26 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34112 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgCZWT0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 18:19:26 -0400
Received: by mail-lf1-f67.google.com with SMTP id e7so6260728lfq.1
        for <linux-input@vger.kernel.org>; Thu, 26 Mar 2020 15:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CIoH3SmsQ7nGOOfNTsuHeNTN5cO4yk0Di3dRnzAJK7A=;
        b=AXzJu9IxpJljzJbQlHTPdszDNOBOA+sQRWXpigIygcCpCeVsYhlqN9V95u6xLdZWoY
         iKAPFqN+mAcvmtONuu8tyHgt+vY+j84Lkx33fY3OPYVrx4Kt0fXMtwDI7/YhF0jyHbmG
         i41jxWqgJj06n2sggMNwW0ZI6BheY7Fq9gHwm7eC/1GdgpmLZF9TpxHrBz08fOMwPI0/
         M9UOaLkrzeh92kL2+sMxs9tctlIOxaDJCjSlQDGXX1ToMldg41ZCAZZqDsl4PYJKDmaE
         o/I6OVhtUOVS0xyCM2UiuMKlidPO1sbXyD1+s6rRCbhq0z87er+ZaQ3IFYjKiUxNG0py
         6Hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CIoH3SmsQ7nGOOfNTsuHeNTN5cO4yk0Di3dRnzAJK7A=;
        b=ifc7Pm3NoBDNrBU13E1bII+9DCaqfq3DKfmmjKMc5/nbEGkEWDgJDHSd2PJEqZz77v
         HHgK030M5CLpCChDdvlGB5ImN2NWyZTqc+f3ZuLqidbXAmIBHf08yYqQWKV6qyafAkbM
         K+TzYQ6fmIfMfGA0YCm+PcgUDiRHsHw05FSkbWi1/uxPH4AAsZhSUnFPcG/pakDNVy4C
         QlSDaxmCchA3D7oQ5JWKGOvXaBSiyQgYwFufMx+Y6/e5WgPuFa+P/li5Zs6gQRMjZA+V
         muET95Vm9uva24ofWKX62pn2k4Zv2YZqyts0aQlUOjDNIZC7n3wVftxaLftSgkRjA9kC
         iHaA==
X-Gm-Message-State: ANhLgQ3hZifEv463KHb2drvhh0nX0/QZPtIC6ePmXcP5bfvokc4Ww7F/
        EQAhG/0cnguYZ94UdKz4dZUGHhYiqvTmLktqmrVuBg==
X-Google-Smtp-Source: ADFU+vuQmAzxyfH4Ajl0jdcKK+5TCLq83Clu8vK67+AlQ0x3/85aJ/skkK2MKYvSRyOS1THAw/mA5OTaPw2jqfcxxXA=
X-Received: by 2002:ac2:5599:: with SMTP id v25mr7215940lfg.40.1585261161793;
 Thu, 26 Mar 2020 15:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200324123518.239768-1-rajatja@google.com> <20200324123518.239768-2-rajatja@google.com>
 <20200326212705.GJ75430@dtor-ws>
In-Reply-To: <20200326212705.GJ75430@dtor-ws>
From:   Rajat Jain <rajatja@google.com>
Date:   Thu, 26 Mar 2020 15:18:45 -0700
Message-ID: <CACK8Z6HQUkZzD7=ENhYH+zozBdefWt+bYuE=n-pY3b+P8RpXxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] Input: atkbd: Expose function row physical map to userspace
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

On Thu, Mar 26, 2020 at 2:27 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Mar 24, 2020 at 05:35:15AM -0700, Rajat Jain wrote:
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
> > v2: Remove the Change-Id from the commit log
> >
> >  drivers/input/keyboard/atkbd.c | 59 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> > index 7e3eae54c1926..7623eebef2593 100644
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
> > @@ -1121,6 +1159,25 @@ static void atkbd_set_device_attrs(struct atkbd *atkbd)
> >       }
> >  }
> >
> > +static void atkbd_parse_fwnode_data(struct serio *serio)
> > +{
> > +     struct atkbd *atkbd = serio_get_drvdata(serio);
> > +     struct device *dev = &serio->dev;
> > +     int n;
> > +
> > +     if (!dev_fwnode(dev))
> > +             return;
>
> I do not think we need this guard.

Done.

>
> > +
> > +     /* Parse "function-row-physmap" property */
> > +     n = device_property_count_u16(dev, "function-row-physmap");
> > +     if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
> > +         !device_property_read_u16_array(dev, "function-row-physmap",
> > +                                         atkbd->function_row_physmap, n)) {
> > +             atkbd->num_function_row_keys = n;
> > +             dev_info(dev, "FW reported %d function-row key locations\n", n);
>
> dev_dbg().

Done.

>
> > +     }
> > +}
> > +
> >  /*
> >   * atkbd_connect() is called when the serio module finds an interface
> >   * that isn't handled yet by an appropriate device driver. We check if
> > @@ -1184,6 +1241,8 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
> >               atkbd->id = 0xab00;
> >       }
> >
> > +     atkbd_parse_fwnode_data(serio);
> > +
> >       atkbd_set_keycode_table(atkbd);
> >       atkbd_set_device_attrs(atkbd);
> >
> > --
> > 2.25.1.696.g5e7596f4ac-goog
> >
>
> --
> Dmitry
