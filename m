Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B978286AAF
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 00:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbgJGWFZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 18:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728742AbgJGWFZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Oct 2020 18:05:25 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875BFC061755
        for <linux-input@vger.kernel.org>; Wed,  7 Oct 2020 15:05:25 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x5so1733335plo.6
        for <linux-input@vger.kernel.org>; Wed, 07 Oct 2020 15:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fSYsj6mV/2hof1Y9IifCB12SVNQ9qz/EQty0NqwX0zk=;
        b=ILDxAOelBelvs7g20qG7MC+dmJ3xyFIgq5l6SJYZQsTkq7H80lLQdV0l+5Zd6iIosv
         ed/4LYkg72cY6hYd035HF0RbavXmLPBQnMeXrQgctxSFoXcoZKv0iDemwqiT0HNVpCAK
         tkWRYUxj9oAvH0SXh1KYLIrOBmEyPHtUeNQjuQt8kTibpALZeXN/7e6yYHFDIklk7OYY
         0XSutCsq5P84Oo2V6OMKMfZvMzXR3uGt5XhXC6/DavpBTYNVF7fd9gCQwVKLxhfQqIHV
         wdgV7CnvSEi6cXMib77CLnsAENb4NSYiqhsOF1RlMsnpRfBFldlutl1ds+PRb4epkonc
         AtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fSYsj6mV/2hof1Y9IifCB12SVNQ9qz/EQty0NqwX0zk=;
        b=TfMndNZsR+6tONhwlPpaCnvkF2bXahL8ey0Dlq/cGKmuFZXVXboklOQuC9Qtg33BCG
         w6nvACRFmYXbw6zUz/Zg4hx3PiB2f0nHnf0EsdJA4gFlzdPqR1rQzambAcs+CRJO4qnu
         WmWz3HcLBmUHQadLMnJ61M96yE97U6WISd/Cm4GVMn2Ujyg//QaDiruVTlR+4dvO2oca
         FeWcFPIvIEQ0ALWBBfMnKj8i8jBBdcSyQPuD0E8b5xGCYFPAmcDxcTLlLZHdR1WsREWP
         FLvwH8/eoD/9VR/2UIT8q2h3Gq0U55dljKq8oLubMjxfYAT1TQZpNYPm2g3U0S2UqfBi
         NRvQ==
X-Gm-Message-State: AOAM532Xz+xnHoOOq3iIMKg/XnZwIps3h/4Gllv3TijvycBm0In3TQDY
        sFiZy/kpvimUThl1Dh/u/JrBxQt/c+EXv1HKP95K/w==
X-Google-Smtp-Source: ABdhPJwhF/pjXLK1p084lcXI4Vm5jUtYkqoDtDRPdQPfneHESm87BSGqZiVYzhU8rzIlVAMzvANl3HZ+t4RJSNcA/Lk=
X-Received: by 2002:a17:902:d888:b029:d0:cb2d:f274 with SMTP id
 b8-20020a170902d888b02900d0cb2df274mr4555810plz.13.1602108324895; Wed, 07 Oct
 2020 15:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200930224713.GA88246@dtor-ws>
In-Reply-To: <20200930224713.GA88246@dtor-ws>
From:   Kenneth Albanowski <kenalba@google.com>
Date:   Wed, 7 Oct 2020 15:05:13 -0700
Message-ID: <CALvoSf7kZEhrZZEZmzpAkEMbd+TQbNTCOmjvjX6RfxeWiQZz2g@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-input: occasionally report stylus battery even
 if not changed
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Johan Korsnes <jkorsnes@cisco.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I've tested this locally backported to a 4.19 variant; it does work,
and provides the expected additional CHANGE events while safely
limiting the rate.

This seems like a reasonable minimum improvement, just ensuring
information already being pushed by HID reports can be utilized.

I'm unsure about mapping Digitizers.InRange to power_supply 'present',
in the abstract. It seems there could be a device where
Digitizers.BatteryStrength is sent, despite Digitizers.InRange=0, and
the HID Usage Tables don't quite seem to rule this out (depending on
how battery status collection interacts with 'the region where
digitizing is possible', section 16.3.1.).

As-is, this is useful and sufficient to get more timely reports up to userspace.

- Kenneth Albanowski


On Wed, Sep 30, 2020 at 3:47 PM <dmitry.torokhov@gmail.com> wrote:
>
> There are styluses that only report their battery status when they are
> touching the touchscreen; additionally we currently suppress battery
> reports if capacity has not changed. To help userspace recognize how long
> ago the device reported battery status, let's send the change event through
> if either capacity has changed, or at least 30 seconds have passed since
> last report we've let through.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> This is a bit of RFC. Another option would be to mark the power supply
> as either offline or not present when stylus leaves the surface instead
> of saying it is online... Sebastian, any ideas/suggestions?
>
>  drivers/hid/hid-input.c | 5 ++++-
>  include/linux/hid.h     | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 5da631d2ec9b..92b4c9bb6619 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -534,9 +534,12 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
>         capacity = hidinput_scale_battery_capacity(dev, value);
>
>         if (dev->battery_status != HID_BATTERY_REPORTED ||
> -           capacity != dev->battery_capacity) {
> +           capacity != dev->battery_capacity ||
> +           ktime_after(ktime_get_coarse(), dev->battery_ratelimit_time)) {
>                 dev->battery_capacity = capacity;
>                 dev->battery_status = HID_BATTERY_REPORTED;
> +               dev->battery_ratelimit_time =
> +                       ktime_add_ms(ktime_get_coarse(), 30 * 1000);
>                 power_supply_changed(dev->battery);
>         }
>  }
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 875f71132b14..c76a18f88262 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -583,6 +583,7 @@ struct hid_device {                                                 /* device report descriptor */
>         __s32 battery_report_id;
>         enum hid_battery_status battery_status;
>         bool battery_avoid_query;
> +       ktime_t battery_ratelimit_time;
>  #endif
>
>         unsigned long status;                                           /* see STAT flags above */
> --
> 2.28.0.709.gb0816b6eb0-goog
>
>
> --
> Dmitry
