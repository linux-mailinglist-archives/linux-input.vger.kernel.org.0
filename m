Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6A948D558
	for <lists+linux-input@lfdr.de>; Thu, 13 Jan 2022 11:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbiAMKC3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jan 2022 05:02:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23222 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232646AbiAMKC2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jan 2022 05:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642068147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qm5SGk9oc9xNP8maGXMBB8tWRPlA70zb+WU6VZhIxjA=;
        b=fc96F9ymfnK+X7OTEmBeXUwoFOeTyKDg2ytES+OyuQfB/zFYlSgCT5UndmOq56a23cHDyS
        MUoEpWjHvk5i7KfhIr4gZnTD7pH5bpsvlj6sZZdI2zABWPsq6tmvpGNzJd7YLacoCxX9G4
        7JUPskU7kCIxPJwoth/ORLc3snoBFeE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-lLssJg86PcOQ3LK5CbYTmw-1; Thu, 13 Jan 2022 05:02:24 -0500
X-MC-Unique: lLssJg86PcOQ3LK5CbYTmw-1
Received: by mail-pl1-f199.google.com with SMTP id w14-20020a170902a70e00b00149512ae682so5556499plq.22
        for <linux-input@vger.kernel.org>; Thu, 13 Jan 2022 02:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qm5SGk9oc9xNP8maGXMBB8tWRPlA70zb+WU6VZhIxjA=;
        b=KsRLuL2RDPTTGXqR5CoIoa6/yaKpWlXFA/DP+n3nD91TZx9SgDqblN3ebfbo5Ysmnx
         W2+XU/zgo2CwZ8lOEUHxfAFvF9ILzk5jMA4Wcx5nifqghycVmHTXJKvwWN4eVbmzmQzN
         A3+uQwI2yWK5k3er4EN+7gzOa5Ztt665GsDhMzJvWEoO/ANncaDGrxdTwRj3UUog4Gou
         KU0H+wHkeGhGSpeTOnKccf1aQl2AqdILxeGN9s7/L2J71Ka6Tabl8dQ8hq/zs+D9PvmQ
         IW6IJFUX5XMXMKladp88fnyvR8+BIcEAUDh2XE7d48jAychpIn2yNDv+0pb0ckxwY0Km
         K2Aw==
X-Gm-Message-State: AOAM53039t24tuDcGbGUx8oLJN4uRSpvmkElUXaaWqwHQkNpR+uF0M+K
        3CToLf7fbEI0/Jf0BWsFCoyCe4ufMWGoEK2Z9PMTIjseSbw3GgHU4Z/FYQU4EaGz0dZxSYOEoWA
        uKSbkD8HvhLC2XwQmPSe9Wm4raazseS+tZeXJNfQ=
X-Received: by 2002:a17:903:1ca:b0:149:2125:9a13 with SMTP id e10-20020a17090301ca00b0014921259a13mr4030479plh.73.1642068143125;
        Thu, 13 Jan 2022 02:02:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhWTFylyXcuOr2F6y33mnlE8DbL3qMvPoHSIvRrgkatn3G0C9pN7Cr6B/TCiNtarCpw2KiEjqAQs/99w8qftc=
X-Received: by 2002:a17:903:1ca:b0:149:2125:9a13 with SMTP id
 e10-20020a17090301ca00b0014921259a13mr4030448plh.73.1642068142812; Thu, 13
 Jan 2022 02:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20211229231141.303919-1-dmanti@microsoft.com> <20211229231141.303919-4-dmanti@microsoft.com>
 <CAO-hwJ+Y28ZzXX--8aWAAc33UdmsjUyRxpkcQKAymNkZAn5oEA@mail.gmail.com>
 <SN6PR2101MB1071712F780C414229E93A96DA4A9@SN6PR2101MB1071.namprd21.prod.outlook.com>
 <CAO-hwJKV99GCOckL3yxZzhVWvkauGyo_D993tMaUpj4aBik61g@mail.gmail.com> <MW2PR2101MB1065DBDE27BE4DACB4A98788DA4E9@MW2PR2101MB1065.namprd21.prod.outlook.com>
In-Reply-To: <MW2PR2101MB1065DBDE27BE4DACB4A98788DA4E9@MW2PR2101MB1065.namprd21.prod.outlook.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 13 Jan 2022 11:02:11 +0100
Message-ID: <CAO-hwJLVMK9Vh9za70uFzimXv444HC5az_1Jr4ut6BDA+XSfYA@mail.gmail.com>
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

On Sat, Jan 8, 2022 at 2:10 AM Dmitry Antipov <dmanti@microsoft.com> wrote:
>
> On Tue, Jan 4, 2022 at 7:52 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Tue, Jan 4, 2022 at 3:08 AM Dmitry Antipov <dmanti@microsoft.com>
> > wrote:
> > >
> > > > -----Original Message-----
> > > > From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > Sent: Monday, January 3, 2022 7:27 AM
> > > > To: Dmitry Antipov <daantipov@gmail.com>
> > > > Cc: Jiri Kosina <jikos@kernel.org>; open list:HID CORE LAYER <linux-
> > > > input@vger.kernel.org>; Felipe Balbi <balbi@kernel.org>; Dmitry
> > > > Antipov <dmanti@microsoft.com>
> > > > Subject: [EXTERNAL] Re: [PATCH v1 3/5] HID: add on_transport_error()
> > > > field to struct hid_driver
> > > >
> > > > On Thu, Dec 30, 2021 at 12:11 AM Dmitry Antipov
> > > > <daantipov@gmail.com>
> > > > wrote:
> > > > >
> > > > > This new API allows a transport driver to notify the HID device
> > > > > driver about a transport layer error.
> > > >
> > > > I do not see entirely the purpose of this new callback:
> > > >
> > > > - when we receive the device initiated reset, this is a specific
> > > > device event, so it would make sense...
> > > > - but for things like
> > HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER,
> > > > I would expect the caller to return that error code instead of
> > > > having an async function called.
> > > >
> > > > I think it might be simpler to add a more specific
> > > > .device_initiated_reset() callback instead of trying to be generic.
> > > >
> > >
> > > The intention of this new callback is to notify the device driver of a
> > > transport-layer error for at least two reasons:
> > > 1. Delegating the decision making. For certain types of errors the
> > > spec states that the host _may_ reset the device. Right now there are
> > > not many devices that support HID over SPI, but I wanted to allow the
> > > flexibility for each vendor to decide what cases to error-handle.
> >
> > Looking at section 9 (Error handling) of the HID SPI protocol spec, it seems that
> > the only time the host may (or not) decide to reset the device is when receiving
> > a timeout error.
> > And looking at the phrasing there, I think we ought to simply reset the device
> > anyway.
> >
> > So now that I have the spec under my eyes, I would think that for this part, the
> > host is expected to reset the device, which in turn makes this a spi-hid
> > responsibility.
> >
> > So I would suggest adding a callback notifying that the device has been reset,
> > and with a flag telling whether it's host or device initiated.
> > Then in hid-microsoft, hid-multitouch we can deal with that situation.
> >
> > Putting this at the transport layer allows for a common behavior which won't
> > depend on the leaf HID driver in use.
>
> Please note the "ready" flag that is wired to a sysfs attribute in
> spi-hid in patch 5/5. In our case the touch digitizer sends the raw
> data, so we process it and convert it into input events in a userspace
> service we call the touch daemon. The touch daemon detects digitizer
> resets via the ready flag: any time the flag goes from "not ready" to
> "ready", it is interpreted as digitizer coming out of reset and the
> touch daemon then sends some system state info to the digitizer, among
> other things. While the ready flag is "not ready", in our architecture,
> the userspace will not send ioctl's or write into the hidraw device.

So that means that this device is forwarding the raw touch map?

>
> All this means that the code in hid-microsoft won't be implementing this
> new notify_of_reset() callback. Since in the final submission there
> won't be an implementation of this callback, is it worth adding at this
> stage? Can it go in as a REVISIT or a FIXME comment until such
> notification to the leaf driver is needed?

If there is no users, then it's probably best to not implement it. We
could add a comment, yes, but maybe not a FIXME, just a regular
comment.

>
> > > 2. Telemetry instrumentation to gather statistics on various error
> > > conditions hit in spi-hid. The way we implement this is by publishing
> > > sysfs attributes with error counters from the device driver and epoll
> > > on these attributes from userspace. Here is a snippet from a
> > > yet-to-be- sent patch to hid-microsoft.c:
> >
> > Oh, that's interesting. How about we put those stats in api-hid-core.c, so that
> > anybody can benefit from it?
> > Those are per-device anyway so that might be a useful way to debug issues
> > when there are weird behaviors.
>
> I haven't found an api-hid-core.c. Are you suggesting I create a new
> file at drivers/hid that would extend hid-core.c? If yes, can you please
> tell what you expect to be in the HID core vs the transport driver?

Sorry I meant i2c-hid-core.c :(

>
> > >
> > > static void ms_on_transport_error(struct hid_device *hdev,
> > >                                         int err_type,
> > >                                         int err_code,
> > >                                         bool handled) {
> > >         struct ms_data *ms = hid_get_drvdata(hdev);
> > >
> > >         if (ms->quirks & MS_TRANSPORT_ERROR_HANDLING) {
> > >
> > >                 switch (err_type) {
> > >                         case
> > HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_START:
> > >                         case
> > HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_BODY:
> > >                         case
> > HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_HEADER:
> > >                         case HID_TRANSPORT_ERROR_TYPE_HEADER_DATA:
> > >                         case HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER:
> > >                                 ms->bus_error_count++;
> > >                                 ms->bus_last_error = err_code;
> > >                                 break;
> > >                         case HID_TRANSPORT_ERROR_TYPE_DEVICE_INITIATED_RESET:
> > >                                 ms->dir_count++;
> > >                                 break;
> > >                         case HID_TRANSPORT_ERROR_TYPE_INPUT_REPORT_DATA:
> > >                         case HID_TRANSPORT_ERROR_TYPE_REPORT_TYPE:
> > >                         case HID_TRANSPORT_ERROR_TYPE_GET_FEATURE_RESPONSE:
> > >                                 if (!handled && (hdev->ll_driver->reset != 0))
> > >                                         hdev->ll_driver->reset(hdev);
> > >                                 break;
> > >                         case HID_TRANSPORT_ERROR_TYPE_REGULATOR_ENABLE:
> > >                         case HID_TRANSPORT_ERROR_TYPE_REGULATOR_DISABLE:
> > >                                 ms->regulator_error_count++;
> > >                                 ms->regulator_last_error = err_code;
> > >                                 break;
> > >                 }
> > >         }
> > > }
> > >
> > > Please let me know what you think. Would it be ok to make a decision
> > > to error-handle (reset the device) at a transport layer certain cases
> > > that are not required by the spec?
> >
> > I would suggest we stay as close as possible to the spec. When the spec says we
> > need to reset, we do it, and notify the driver.
> > TBH, the only thing that works in the long run is to map the implementation
> > from Windows, when this gets more widespread.
> > And we can always quirk the devices that need a special error handling or
> > revisit at that particular time when we get the device in question.
> >
> >
> > >
> > > If you have a suggestion on how to pipe telemetry counters to
> > > userspace without this generic callback I can try it out as well.
> >
> > So as I mentioned we should probably set those in spi-hid. The other and more
> > modern approach is to use BPF, but that would be only when the program is
> > loaded. So I would keep the raw values in spi-hid, export them through sysfs,
> > and possibly allow for some tracing through BPF if we want to get something
> > more dynamic (like real time reading of values).
>
> Does api-hid-core.c play a role in the suggested non-BPF, basic approach?

Again, sorry for the confusion. I think you should keep in mind that
BPF might be a solution in the long run, but right now it's not
merged, so please ignore it for the time being :)

Cheers,
Benjamin

>
> >
> > Cheers,
> > Benjamin
> >
> > >
> > > > >
> > > > > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > > > > ---
> > > > >  include/linux/hid.h | 19 +++++++++++++++++++
> > > > >  1 file changed, 19 insertions(+)
> > > > >
> > > > > diff --git a/include/linux/hid.h b/include/linux/hid.h index
> > > > > 1f134c8f8972..97041c322a0f 100644
> > > > > --- a/include/linux/hid.h
> > > > > +++ b/include/linux/hid.h
> > > > > @@ -703,6 +703,20 @@ struct hid_usage_id {
> > > > >         __u32 usage_code;
> > > > >  };
> > > > >
> > > > > +enum hid_transport_error_type {
> > > > > +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_START = 0,
> > > > > +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_BODY,
> > > > > +       HID_TRANSPORT_ERROR_TYPE_BUS_INPUT_TRANSFER_HEADER,
> > > >
> > > > Those 3 enums above are completely SPI specifics, but they are
> > > > declared in the generic hid.h header.
> > > > Also, if I am a driver, what am I supposed to do when I receive such an
> > error?
> > > > Up till now, the most we did was to raise a warning to the user, and
> > > > paper over it. I am open to some smarter behavior, but I do not see
> > > > what a mouse driver is supposed to do with that kind of error.
> > > >
> > > > > +       HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER,
> > > >
> > > > Seems like this would better handled as a return code than an async
> > > > callback
> > > >
> > > > > +       HID_TRANSPORT_ERROR_TYPE_DEVICE_INITIATED_RESET,
> > > >
> > > > OK for this (but see my comment in the commit description)
> > > >
> > > > > +       HID_TRANSPORT_ERROR_TYPE_HEADER_DATA,
> > > > > +       HID_TRANSPORT_ERROR_TYPE_INPUT_REPORT_DATA,
> > > > > +       HID_TRANSPORT_ERROR_TYPE_REPORT_TYPE,
> > > >
> > > > Those look like SPI specifics
> > > >
> > > > > +       HID_TRANSPORT_ERROR_TYPE_GET_FEATURE_RESPONSE,
> > > >
> > > > Seems like this would be better handled as a return code than an
> > > > async callback (and it should already be the case because
> > > > hid_ll_raw_request() is synchronous and can fail if the HW complains).
> > > >
> > > > > +       HID_TRANSPORT_ERROR_TYPE_REGULATOR_ENABLE,
> > > > > +       HID_TRANSPORT_ERROR_TYPE_REGULATOR_DISABLE
> > > >
> > > > Again, what am I supposed to do with those 2 if they fail, besides
> > > > emitting a dev_err(), which the low level transport driver can do?
> > > >
> > > >
> > > > Cheers,
> > > > Benjamin
> > > >
> > > > > +};
> > > > > +
> > > > >  /**
> > > > >   * struct hid_driver
> > > > >   * @name: driver name (e.g. "Footech_bar-wheel") @@ -726,6 +740,7
> > > > > @@ struct hid_usage_id {
> > > > >   * @suspend: invoked on suspend (NULL means nop)
> > > > >   * @resume: invoked on resume if device was not reset (NULL means
> > nop)
> > > > >   * @reset_resume: invoked on resume if device was reset (NULL
> > > > > means
> > > > > nop)
> > > > > + * @on_transport_error: invoked on error hit by transport driver
> > > > >   *
> > > > >   * probe should return -errno on error, or 0 on success. During probe,
> > > > >   * input will not be passed to raw_event unless
> > > > > hid_device_io_start is @@ -777,6 +792,10 @@ struct hid_driver {
> > > > >         void (*feature_mapping)(struct hid_device *hdev,
> > > > >                         struct hid_field *field,
> > > > >                         struct hid_usage *usage);
> > > > > +       void (*on_transport_error)(struct hid_device *hdev,
> > > > > +                       int err_type,
> > > > > +                       int err_code,
> > > > > +                       bool handled);
> > > > >  #ifdef CONFIG_PM
> > > > >         int (*suspend)(struct hid_device *hdev, pm_message_t message);
> > > > >         int (*resume)(struct hid_device *hdev);
> > > > > --
> > > > > 2.25.1
> > > > >
> > >
>

