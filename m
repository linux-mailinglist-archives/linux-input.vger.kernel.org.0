Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB1A484538
	for <lists+linux-input@lfdr.de>; Tue,  4 Jan 2022 16:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbiADPvr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jan 2022 10:51:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51499 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232799AbiADPvr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Jan 2022 10:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641311506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/zQqDh9nWfEQi1+WA6xKDGFj49cxgyr6N/APw0OlIkc=;
        b=SHgjBVFZJE/VhyK+FXFzAlxGrtL5F93B+H5SecgH3f2a/WwR1JmXjhXHWVGmVIaXzrhKha
        zb5v32wRQ7yyK8WqZ6KNr2sBixFa3O7vTee9ceub814cMaj/s89yZblepxaemQ90nDfhPc
        JtlkWuXZTAPj1EkjP6di258TJynC9Wk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-4SDOiNgjPG-0uwdBEMu2sQ-1; Tue, 04 Jan 2022 10:51:45 -0500
X-MC-Unique: 4SDOiNgjPG-0uwdBEMu2sQ-1
Received: by mail-pg1-f197.google.com with SMTP id s13-20020a63214d000000b00341b713315cso11710337pgm.6
        for <linux-input@vger.kernel.org>; Tue, 04 Jan 2022 07:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/zQqDh9nWfEQi1+WA6xKDGFj49cxgyr6N/APw0OlIkc=;
        b=kYR/rONhOANiPkq4y7Bhcv2EJKi8K7w3hJxScXTsia0raDhbzw60XvY01KkjxrY4Ki
         wqd5sWpfmEij43voqf/fy4BfpuCF+TepbkI4vUC3rjj7oMacV6o4KWv1NzjmaAyyOh14
         0QXNGQEbeGkAm5czHMM0EXhm0MqkXyF37qvrbZnAERh4iTPJ4U0NRdQr4m8ghO60O/3d
         ktEYPRXc9hX6kJXExLQp/9I4RoJjWr04nbVxbd5q9QwcnKSKGV8pGOerIXcG+p5fGsQy
         VYW1tt0yTDj+G34lMwBLXQaAzZ1BpoU+41fcBPeUNjIbiM2QfzHW8eubOgUtpwU8BnEI
         jX+g==
X-Gm-Message-State: AOAM533LPHxwB6MSbBrxwHwRkCQgAsOYhO3NOReAvczg4l3zhnhZZKDA
        BarnRjZSW1M4QldAlDa9XzqB0sisK0NTzIsrdzHgB9X20ww5w4KkMxAMiI4EWiKvkLhukrv2+qy
        OodsbfMbddaCK3DjmdwCzgW6yk3o74I/cMp7h/0Q=
X-Received: by 2002:a63:85c8:: with SMTP id u191mr44525648pgd.146.1641311504278;
        Tue, 04 Jan 2022 07:51:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjlIB7zfWEgzbiPuy76/uVXngMWj/Fdknr2RkFPSiaqaVdchnYnq11g4SBX+S1lz7X2ZxhiGMQeGfZ00dp3is=
X-Received: by 2002:a63:85c8:: with SMTP id u191mr44525626pgd.146.1641311504023;
 Tue, 04 Jan 2022 07:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20211229231141.303919-1-dmanti@microsoft.com> <20211229231141.303919-4-dmanti@microsoft.com>
 <CAO-hwJ+Y28ZzXX--8aWAAc33UdmsjUyRxpkcQKAymNkZAn5oEA@mail.gmail.com> <SN6PR2101MB1071712F780C414229E93A96DA4A9@SN6PR2101MB1071.namprd21.prod.outlook.com>
In-Reply-To: <SN6PR2101MB1071712F780C414229E93A96DA4A9@SN6PR2101MB1071.namprd21.prod.outlook.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 4 Jan 2022 16:51:32 +0100
Message-ID: <CAO-hwJKV99GCOckL3yxZzhVWvkauGyo_D993tMaUpj4aBik61g@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1 3/5] HID: add on_transport_error() field
 to struct hid_driver
To:     Dmitry Antipov <dmanti@microsoft.com>
Cc:     Dmitry Antipov <daantipov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 4, 2022 at 3:08 AM Dmitry Antipov <dmanti@microsoft.com> wrote:
>
> > -----Original Message-----
> > From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Sent: Monday, January 3, 2022 7:27 AM
> > To: Dmitry Antipov <daantipov@gmail.com>
> > Cc: Jiri Kosina <jikos@kernel.org>; open list:HID CORE LAYER <linux-
> > input@vger.kernel.org>; Felipe Balbi <balbi@kernel.org>; Dmitry Antipov
> > <dmanti@microsoft.com>
> > Subject: [EXTERNAL] Re: [PATCH v1 3/5] HID: add on_transport_error() field to
> > struct hid_driver
> >
> > On Thu, Dec 30, 2021 at 12:11 AM Dmitry Antipov <daantipov@gmail.com>
> > wrote:
> > >
> > > This new API allows a transport driver to notify the HID device driver
> > > about a transport layer error.
> >
> > I do not see entirely the purpose of this new callback:
> >
> > - when we receive the device initiated reset, this is a specific device event, so it
> > would make sense...
> > - but for things like HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER, I
> > would expect the caller to return that error code instead of having an async
> > function called.
> >
> > I think it might be simpler to add a more specific
> > .device_initiated_reset() callback instead of trying to be generic.
> >
>
> The intention of this new callback is to notify the device driver of a
> transport-layer error for at least two reasons:
> 1. Delegating the decision making. For certain types of errors the spec
> states that the host _may_ reset the device. Right now there are not
> many devices that support HID over SPI, but I wanted to allow the
> flexibility for each vendor to decide what cases to error-handle.

Looking at section 9 (Error handling) of the HID SPI protocol spec, it
seems that the only time the host may (or not) decide to reset the
device is when receiving a timeout error.
And looking at the phrasing there, I think we ought to simply reset
the device anyway.

So now that I have the spec under my eyes, I would think that for this
part, the host is expected to reset the device, which in turn makes
this a spi-hid responsibility.

So I would suggest adding a callback notifying that the device has
been reset, and with a flag telling whether it's host or device
initiated.
Then in hid-microsoft, hid-multitouch we can deal with that situation.

Putting this at the transport layer allows for a common behavior which
won't depend on the leaf HID driver in use.

> 2. Telemetry instrumentation to gather statistics on various error
> conditions hit in spi-hid. The way we implement this is by publishing
> sysfs attributes with error counters from the device driver and epoll
> on these attributes from userspace. Here is a snippet from a yet-to-be-
> sent patch to hid-microsoft.c:

Oh, that's interesting. How about we put those stats in
api-hid-core.c, so that anybody can benefit from it?
Those are per-device anyway so that might be a useful way to debug
issues when there are weird behaviors.

>
> static void ms_on_transport_error(struct hid_device *hdev,
>                                         int err_type,
>                                         int err_code,
>                                         bool handled)
> {
>         struct ms_data *ms = hid_get_drvdata(hdev);
>
>         if (ms->quirks & MS_TRANSPORT_ERROR_HANDLING) {
>
>                 switch (err_type) {
>                         case HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_START:
>                         case HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_BODY:
>                         case HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_HEADER:
>                         case HID_TRANSPORT_ERROR_TYPE_HEADER_DATA:
>                         case HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER:
>                                 ms->bus_error_count++;
>                                 ms->bus_last_error = err_code;
>                                 break;
>                         case HID_TRANSPORT_ERROR_TYPE_DEVICE_INITIATED_RESET:
>                                 ms->dir_count++;
>                                 break;
>                         case HID_TRANSPORT_ERROR_TYPE_INPUT_REPORT_DATA:
>                         case HID_TRANSPORT_ERROR_TYPE_REPORT_TYPE:
>                         case HID_TRANSPORT_ERROR_TYPE_GET_FEATURE_RESPONSE:
>                                 if (!handled && (hdev->ll_driver->reset != 0))
>                                         hdev->ll_driver->reset(hdev);
>                                 break;
>                         case HID_TRANSPORT_ERROR_TYPE_REGULATOR_ENABLE:
>                         case HID_TRANSPORT_ERROR_TYPE_REGULATOR_DISABLE:
>                                 ms->regulator_error_count++;
>                                 ms->regulator_last_error = err_code;
>                                 break;
>                 }
>         }
> }
>
> Please let me know what you think. Would it be ok to make a decision to
> error-handle (reset the device) at a transport layer certain cases that
> are not required by the spec?

I would suggest we stay as close as possible to the spec. When the
spec says we need to reset, we do it, and notify the driver.
TBH, the only thing that works in the long run is to map the
implementation from Windows, when this gets more widespread.
And we can always quirk the devices that need a special error handling
or revisit at that particular time when we get the device in question.


>
> If you have a suggestion on how to pipe telemetry counters to userspace
> without this generic callback I can try it out as well.

So as I mentioned we should probably set those in spi-hid. The other
and more modern approach is to use BPF, but that would be only when
the program is loaded. So I would keep the raw values in spi-hid,
export them through sysfs, and possibly allow for some tracing through
BPF if we want to get something more dynamic (like real time reading
of values).

Cheers,
Benjamin

>
> > >
> > > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > > ---
> > >  include/linux/hid.h | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/include/linux/hid.h b/include/linux/hid.h index
> > > 1f134c8f8972..97041c322a0f 100644
> > > --- a/include/linux/hid.h
> > > +++ b/include/linux/hid.h
> > > @@ -703,6 +703,20 @@ struct hid_usage_id {
> > >         __u32 usage_code;
> > >  };
> > >
> > > +enum hid_transport_error_type {
> > > +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_START = 0,
> > > +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_BODY,
> > > +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_HEADER,
> >
> > Those 3 enums above are completely SPI specifics, but they are declared in the
> > generic hid.h header.
> > Also, if I am a driver, what am I supposed to do when I receive such an error?
> > Up till now, the most we did was to raise a warning to the user, and paper over
> > it. I am open to some smarter behavior, but I do not see what a mouse driver is
> > supposed to do with that kind of error.
> >
> > > +       HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER,
> >
> > Seems like this would better handled as a return code than an async callback
> >
> > > +       HID_TRANSPORT_ERROR_TYPE_DEVICE_INITIATED_RESET,
> >
> > OK for this (but see my comment in the commit description)
> >
> > > +       HID_TRANSPORT_ERROR_TYPE_HEADER_DATA,
> > > +       HID_TRANSPORT_ERROR_TYPE_INPUT_REPORT_DATA,
> > > +       HID_TRANSPORT_ERROR_TYPE_REPORT_TYPE,
> >
> > Those look like SPI specifics
> >
> > > +       HID_TRANSPORT_ERROR_TYPE_GET_FEATURE_RESPONSE,
> >
> > Seems like this would be better handled as a return code than an async callback
> > (and it should already be the case because
> > hid_ll_raw_request() is synchronous and can fail if the HW complains).
> >
> > > +       HID_TRANSPORT_ERROR_TYPE_REGULATOR_ENABLE,
> > > +       HID_TRANSPORT_ERROR_TYPE_REGULATOR_DISABLE
> >
> > Again, what am I supposed to do with those 2 if they fail, besides emitting a
> > dev_err(), which the low level transport driver can do?
> >
> >
> > Cheers,
> > Benjamin
> >
> > > +};
> > > +
> > >  /**
> > >   * struct hid_driver
> > >   * @name: driver name (e.g. "Footech_bar-wheel") @@ -726,6 +740,7 @@
> > > struct hid_usage_id {
> > >   * @suspend: invoked on suspend (NULL means nop)
> > >   * @resume: invoked on resume if device was not reset (NULL means nop)
> > >   * @reset_resume: invoked on resume if device was reset (NULL means
> > > nop)
> > > + * @on_transport_error: invoked on error hit by transport driver
> > >   *
> > >   * probe should return -errno on error, or 0 on success. During probe,
> > >   * input will not be passed to raw_event unless hid_device_io_start
> > > is @@ -777,6 +792,10 @@ struct hid_driver {
> > >         void (*feature_mapping)(struct hid_device *hdev,
> > >                         struct hid_field *field,
> > >                         struct hid_usage *usage);
> > > +       void (*on_transport_error)(struct hid_device *hdev,
> > > +                       int err_type,
> > > +                       int err_code,
> > > +                       bool handled);
> > >  #ifdef CONFIG_PM
> > >         int (*suspend)(struct hid_device *hdev, pm_message_t message);
> > >         int (*resume)(struct hid_device *hdev);
> > > --
> > > 2.25.1
> > >
>

