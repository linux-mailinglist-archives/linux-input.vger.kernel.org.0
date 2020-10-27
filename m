Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E4B29C2AA
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 18:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1807673AbgJ0Ri2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 13:38:28 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45011 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1820791AbgJ0RiY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 13:38:24 -0400
Received: by mail-pf1-f196.google.com with SMTP id 133so1320570pfx.11
        for <linux-input@vger.kernel.org>; Tue, 27 Oct 2020 10:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3nFRAsCXHVG+gjVP2tPgEZ/jsIDd5oLxAHCiN8Hvt5s=;
        b=EhAbwuuayBO3JJ+BaRyF5s5A/8KGveGID6Vl+QlBBTfSDFx6R11ZB3krf5Av1tsYZh
         iRPDCPOhcJQVz34buVODH9KrMOHbP4ZDsOAf+5XAmt9NhiP36wTKDcMNgMu1HjUnuxQL
         1LrKnURUwcahqaIHCh3uErTBgJgR/Oo6EEeYCOsnwzyYwS8NqsfGCz19wf8OagB6WfL7
         nyDo6gbkKB8rcU3VxleEh1bR+7XPTI7s8iLgOfGQ2e/moZYgko0UXOCTXE4CwShb/y2d
         1GSqsiexjocDqVGVbllZFNkbbO1PJ3+VgNoHaZtvWKK985ADj2FrjNr2Fw8nMUmanzfu
         Corg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3nFRAsCXHVG+gjVP2tPgEZ/jsIDd5oLxAHCiN8Hvt5s=;
        b=ktinNwqW6ArHuIMQp1BdAFhGQG35gw1ZVdDp0chHmX10OwQb2sX5EuL8kP8qWYeLVa
         FgeY8e00fmD9AxbriqJ1trSZq4Wch/du2pjKshg7sco4ckyDEE8r59bWzKj/MyeIHyC+
         rdMnfsJpf6YyYaCDzKxkFCp8lRujKzj4wAQHHlhWqvd7znhYnwJaYh3Z/8Aav2plGMCV
         b9eochSMynL0D0DDT9RSnCAWfQBkRLgFvqOVQaFY6A5SjIN2ThSnjIG95xPnWjhrLOVA
         fENVc2HM/lrlp7S72WVSsLyyQDjQOLJYxUkhRQ3ZTygbQW0Nw6qNZLctUAynC1eQP4Dj
         hdMw==
X-Gm-Message-State: AOAM533Db5HQCS/u5rt/llZB07mByMzp7+oqi9BZSxTkM+1CKpbpDjqA
        KQbI8e9Og5DHpdzvbz6feQQ=
X-Google-Smtp-Source: ABdhPJzqqMGhExLnrc7zeUpwURqrUW6zoc9CPG4+AYrA31ToigOLX5X9YW9J23iO583BMUYn2hCw9Q==
X-Received: by 2002:aa7:9ac3:0:b029:158:db9f:c541 with SMTP id x3-20020aa79ac30000b0290158db9fc541mr3473716pfp.34.1603820303765;
        Tue, 27 Oct 2020 10:38:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m13sm2469927pjr.30.2020.10.27.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:38:22 -0700 (PDT)
Date:   Tue, 27 Oct 2020 10:38:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Kenneth Albanowski <kenalba@google.com>,
        Sebastian Reichel <sre@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Johan Korsnes <jkorsnes@cisco.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: hid-input: occasionally report stylus battery even
 if not changed
Message-ID: <20201027173820.GK444962@dtor-ws>
References: <20200930224713.GA88246@dtor-ws>
 <CALvoSf7kZEhrZZEZmzpAkEMbd+TQbNTCOmjvjX6RfxeWiQZz2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvoSf7kZEhrZZEZmzpAkEMbd+TQbNTCOmjvjX6RfxeWiQZz2g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

M
On Wed, Oct 07, 2020 at 03:05:13PM -0700, Kenneth Albanowski wrote:
> I've tested this locally backported to a 4.19 variant; it does work,
> and provides the expected additional CHANGE events while safely
> limiting the rate.
> 
> This seems like a reasonable minimum improvement, just ensuring
> information already being pushed by HID reports can be utilized.
> 
> I'm unsure about mapping Digitizers.InRange to power_supply 'present',
> in the abstract. It seems there could be a device where
> Digitizers.BatteryStrength is sent, despite Digitizers.InRange=0, and
> the HID Usage Tables don't quite seem to rule this out (depending on
> how battery status collection interacts with 'the region where
> digitizing is possible', section 16.3.1.).
> 
> As-is, this is useful and sufficient to get more timely reports up to userspace.

Jiri, if there are no better ideas, maybe this one can be applied?

Thanks!

> 
> - Kenneth Albanowski
> 
> 
> On Wed, Sep 30, 2020 at 3:47 PM <dmitry.torokhov@gmail.com> wrote:
> >
> > There are styluses that only report their battery status when they are
> > touching the touchscreen; additionally we currently suppress battery
> > reports if capacity has not changed. To help userspace recognize how long
> > ago the device reported battery status, let's send the change event through
> > if either capacity has changed, or at least 30 seconds have passed since
> > last report we've let through.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >
> > This is a bit of RFC. Another option would be to mark the power supply
> > as either offline or not present when stylus leaves the surface instead
> > of saying it is online... Sebastian, any ideas/suggestions?
> >
> >  drivers/hid/hid-input.c | 5 ++++-
> >  include/linux/hid.h     | 1 +
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 5da631d2ec9b..92b4c9bb6619 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -534,9 +534,12 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
> >         capacity = hidinput_scale_battery_capacity(dev, value);
> >
> >         if (dev->battery_status != HID_BATTERY_REPORTED ||
> > -           capacity != dev->battery_capacity) {
> > +           capacity != dev->battery_capacity ||
> > +           ktime_after(ktime_get_coarse(), dev->battery_ratelimit_time)) {
> >                 dev->battery_capacity = capacity;
> >                 dev->battery_status = HID_BATTERY_REPORTED;
> > +               dev->battery_ratelimit_time =
> > +                       ktime_add_ms(ktime_get_coarse(), 30 * 1000);
> >                 power_supply_changed(dev->battery);
> >         }
> >  }
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index 875f71132b14..c76a18f88262 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -583,6 +583,7 @@ struct hid_device {                                                 /* device report descriptor */
> >         __s32 battery_report_id;
> >         enum hid_battery_status battery_status;
> >         bool battery_avoid_query;
> > +       ktime_t battery_ratelimit_time;
> >  #endif
> >
> >         unsigned long status;                                           /* see STAT flags above */
> > --
> > 2.28.0.709.gb0816b6eb0-goog
> >
> >
> > --
> > Dmitry

-- 
Dmitry
