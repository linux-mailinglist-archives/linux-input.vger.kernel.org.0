Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C31EE194E8E
	for <lists+linux-input@lfdr.de>; Fri, 27 Mar 2020 02:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgC0Bic (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 21:38:32 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41350 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbgC0Bic (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 21:38:32 -0400
Received: by mail-lf1-f68.google.com with SMTP id z23so6554605lfh.8
        for <linux-input@vger.kernel.org>; Thu, 26 Mar 2020 18:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n7WV/EpnZROyLfEaMPawCMxPabFPT6/7MuhbzbnfSN8=;
        b=N7+rU/HMdCMrO09FKv2jhmMJmEotS+k7FgW93dzfsVzYT4Wx2yOxLYPiiZVXQmWsKB
         mTaNEfdk92qmu3JpAGGKf8D8DrJHO1/HnVUuFDZGTTt7eSa3XU0Syfp9jgVd20qDWBX5
         ruKKWNdS4EvtowHaZWx44yt2eSgVEgGl+S+uDP/fjBEi85avvK3K0ujKSsp7yXugbcnh
         P3fgtZC5OWKJA5Nju4RKQOF8VgkBfi2iZJyrAUq23w6Q0z4oI+ImhqkJIH5CvogqedDG
         KkH51MpVZ4dESbvlHGKfVjOmMylfulftRcUj3lGkQEehz/iWGHfoWdx/aQZdSn7QFkCd
         uK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n7WV/EpnZROyLfEaMPawCMxPabFPT6/7MuhbzbnfSN8=;
        b=hrAfRVXjr5pDupiD2u9kitzr5drtzkmyK4bD8ZJYwM7watk9xC0G8/hOT85x3HpjX9
         c1IrtUDL2H7LmySKYwjjodhZ5Sw3QN6P1jq/zb22gS1uLbPzSq7QSLUIgOp0g7ILQLwh
         BwX0RjJH5cy3CNfFHqsT/gl+gpyztrnuxR0AA2tXCsOgz9I0EikNC7PxOdtkicXQNfFH
         wCmcGGhN8GXonXVXmCDHZpODH0aIlHEUGrRyoucWScI9HecvMkQICMVaW3CO0N9QMoZJ
         vkPj7mSAOgtLX1ERk6DZq0bIT5lTvLfNFdxpggEdOq3yoOWILNjO7DqdcihkfLXPdYaq
         Za6w==
X-Gm-Message-State: ANhLgQ3fTSXCCDw6eQkgkmrzhMEcjk3JfYNJCBxcS0vfHIu93+P5i0Bj
        CJ+no+HIAFrANbA7LXLCPN3JfXC8CLVeE5rHvsg6IA==
X-Google-Smtp-Source: ADFU+vuKmO4rcij2uPD34u8BMt6+NSD83GcaxgfxBTr1GExVYFySIeBtMr9F8AsT2WjwC8O3ItGydbB8E463i11H+o0=
X-Received: by 2002:a19:3803:: with SMTP id f3mr7647519lfa.160.1585273109028;
 Thu, 26 Mar 2020 18:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200324123518.239768-1-rajatja@google.com> <20200324123518.239768-4-rajatja@google.com>
 <20200326212025.GH75430@dtor-ws>
In-Reply-To: <20200326212025.GH75430@dtor-ws>
From:   Rajat Jain <rajatja@google.com>
Date:   Thu, 26 Mar 2020 18:37:52 -0700
Message-ID: <CACK8Z6G5PBZozq6TB6-PNtL0PCg_k9wpi1YxWp-E=Snhm7693Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] Input: atkbd: Receive and use physcode->keycode
 mapping from FW
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

On Thu, Mar 26, 2020 at 2:20 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rajat,
>
> On Tue, Mar 24, 2020 at 05:35:17AM -0700, Rajat Jain wrote:
> > Allow the firmware to specify the mapping between the physical
> > code and the linux keycode. This takes the form of a "keymap"
> > property which is an array of u32 values, each value specifying
> > mapping for a key.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > v2: Remove the Change-Id from the commit log
> >
> >  drivers/input/keyboard/atkbd.c | 39 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 37 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> > index 7623eebef2593..c8017a5707581 100644
> > --- a/drivers/input/keyboard/atkbd.c
> > +++ b/drivers/input/keyboard/atkbd.c
> > @@ -66,6 +66,9 @@ MODULE_PARM_DESC(terminal, "Enable break codes on an IBM Terminal keyboard conne
> >
> >  #define MAX_FUNCTION_ROW_KEYS        24
> >
> > +#define PHYSCODE(keymap)     ((keymap >> 16) & 0xFFFF)
> > +#define KEYCODE(keymap)              (keymap & 0xFFFF)
> > +
> >  /*
> >   * Scancode to keycode tables. These are just the default setting, and
> >   * are loadable via a userland utility.
> > @@ -236,6 +239,9 @@ struct atkbd {
> >
> >       u16 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
> >       int num_function_row_keys;
> > +
> > +     unsigned short fw_keymap[ATKBD_KEYMAP_SIZE];
> > +     bool use_fw_keymap;
>
> Why do we need to keep firmware-provided keymap in atkbd instance? It is
> not going anywhere and can be accessed via device_property_* API
> whenever we decide to refresh the keymap.

Done. I've sent out a new v3 patchset for review with this change.

>
> >  };
> >
> >  /*
> > @@ -1045,7 +1051,10 @@ static void atkbd_set_keycode_table(struct atkbd *atkbd)
> >       memset(atkbd->keycode, 0, sizeof(atkbd->keycode));
> >       bitmap_zero(atkbd->force_release_mask, ATKBD_KEYMAP_SIZE);
> >
> > -     if (atkbd->translated) {
> > +     if (atkbd->use_fw_keymap) {
> > +             memcpy(atkbd->keycode, atkbd->fw_keymap,
> > +                    sizeof(atkbd->keycode));
> > +     } else if (atkbd->translated) {
> >               for (i = 0; i < 128; i++) {
> >                       scancode = atkbd_unxlate_table[i];
> >                       atkbd->keycode[i] = atkbd_set2_keycode[scancode];
> > @@ -1163,7 +1172,9 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
> >  {
> >       struct atkbd *atkbd = serio_get_drvdata(serio);
> >       struct device *dev = &serio->dev;
> > -     int n;
> > +     int i, n;
> > +     u32 *ptr;
> > +     u16 physcode, keycode;
> >
> >       if (!dev_fwnode(dev))
> >               return;
> > @@ -1176,6 +1187,30 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
> >               atkbd->num_function_row_keys = n;
> >               dev_info(dev, "FW reported %d function-row key locations\n", n);
> >       }
> > +
> > +     /* Parse "keymap" property */
> > +     n = device_property_count_u32(dev, "keymap");
> > +     if (n > 0 && n <= ATKBD_KEYMAP_SIZE) {
> > +
> > +             ptr = kcalloc(n, sizeof(u32), GFP_KERNEL);
> > +             if (!ptr)
> > +                     return;
> > +
> > +             if (device_property_read_u32_array(dev, "keymap", ptr, n)) {
> > +                     dev_err(dev, "problem parsing FW keymap property\n");
> > +                     kfree(ptr);
> > +                     return;
> > +             }
> > +
> > +             for (i = 0; i < n; i++) {
> > +                     physcode = PHYSCODE(ptr[i]);
> > +                     keycode = KEYCODE(ptr[i]);
> > +                     atkbd->fw_keymap[physcode] = keycode;
> > +             }
> > +             dev_info(dev, "Using FW keymap (%d keys)\n", n);
>
> This should be dev_dbg().

Done.

Thanks,

Rajat

>
> > +             atkbd->use_fw_keymap = true;
> > +             kfree(ptr);
> > +     }
> >  }
> >
> >  /*
> > --
> > 2.25.1.696.g5e7596f4ac-goog
> >
>
> Thanks.
>
> --
> Dmitry
