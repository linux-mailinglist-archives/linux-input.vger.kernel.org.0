Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C2448E438
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 07:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiANGYj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 01:24:39 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:34456 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239342AbiANGYg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 01:24:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8335A61D4A
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 06:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A739CC36AEC;
        Fri, 14 Jan 2022 06:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642141475;
        bh=yT9uo0HyYisiUT7D7rg3n0hxhAClv5aym0iMIKvcUXw=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=SoEgsc8sz6s019wDFyR8CslR9nGmOaN87uRT8wiXeDuacVmHiEhxo5LJXEIm26gbH
         uYU+RxziK0Yie5K7lkE7FySd/oOS21XJxajWqe7bGwbjB9VbliXR/cJDUZgWsxN7w+
         RGodhgIuXxXiGHpPHSArIflH09UqvMvU/YKcKWP/Ok6DHo8tnLR5QQyMnMmVTi7Qpn
         J1l1C52J++jQwqP88mBo1PBcSZPnjAObGbOZjHEjzG4Ln1JxA5n9/jP2g9p1YVrBBR
         MA9l7VLPyKvdzt7HsQIitl1017PLjk/4lIgW9Xhz2OI9zpmsgT7JMWFLihGWWd8/vC
         NvApnNwI8uAqw==
References: <20211229231141.303919-1-dmanti@microsoft.com>
 <20211229231141.303919-4-dmanti@microsoft.com>
 <CAO-hwJ+Y28ZzXX--8aWAAc33UdmsjUyRxpkcQKAymNkZAn5oEA@mail.gmail.com>
 <SN6PR2101MB1071712F780C414229E93A96DA4A9@SN6PR2101MB1071.namprd21.prod.outlook.com>
 <CAO-hwJKV99GCOckL3yxZzhVWvkauGyo_D993tMaUpj4aBik61g@mail.gmail.com>
 <MW2PR2101MB1065DBDE27BE4DACB4A98788DA4E9@MW2PR2101MB1065.namprd21.prod.outlook.com>
 <CAO-hwJLVMK9Vh9za70uFzimXv444HC5az_1Jr4ut6BDA+XSfYA@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 28.0.90
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Antipov <dmanti@microsoft.com>,
        Dmitry Antipov <daantipov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v1 3/5] HID: add on_transport_error()
 field to struct hid_driver
Date:   Fri, 14 Jan 2022 08:22:17 +0200
In-reply-to: <CAO-hwJLVMK9Vh9za70uFzimXv444HC5az_1Jr4ut6BDA+XSfYA@mail.gmail.com>
Message-ID: <878rvi4yxr.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi,

Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
> On Sat, Jan 8, 2022 at 2:10 AM Dmitry Antipov <dmanti@microsoft.com> wrote:
>>
>> On Tue, Jan 4, 2022 at 7:52 AM Benjamin Tissoires
>> <benjamin.tissoires@redhat.com> wrote:
>> >
>> > On Tue, Jan 4, 2022 at 3:08 AM Dmitry Antipov <dmanti@microsoft.com>
>> > wrote:
>> > >
>> > > > -----Original Message-----
>> > > > From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>> > > > Sent: Monday, January 3, 2022 7:27 AM
>> > > > To: Dmitry Antipov <daantipov@gmail.com>
>> > > > Cc: Jiri Kosina <jikos@kernel.org>; open list:HID CORE LAYER <linux-
>> > > > input@vger.kernel.org>; Felipe Balbi <balbi@kernel.org>; Dmitry
>> > > > Antipov <dmanti@microsoft.com>
>> > > > Subject: [EXTERNAL] Re: [PATCH v1 3/5] HID: add on_transport_error()
>> > > > field to struct hid_driver
>> > > >
>> > > > On Thu, Dec 30, 2021 at 12:11 AM Dmitry Antipov
>> > > > <daantipov@gmail.com>
>> > > > wrote:
>> > > > >
>> > > > > This new API allows a transport driver to notify the HID device
>> > > > > driver about a transport layer error.
>> > > >
>> > > > I do not see entirely the purpose of this new callback:
>> > > >
>> > > > - when we receive the device initiated reset, this is a specific
>> > > > device event, so it would make sense...
>> > > > - but for things like
>> > HID_TRANSPORT_ERROR_TYPE_BUS_OUTPUT_TRANSFER,
>> > > > I would expect the caller to return that error code instead of
>> > > > having an async function called.
>> > > >
>> > > > I think it might be simpler to add a more specific
>> > > > .device_initiated_reset() callback instead of trying to be generic.
>> > > >
>> > >
>> > > The intention of this new callback is to notify the device driver of a
>> > > transport-layer error for at least two reasons:
>> > > 1. Delegating the decision making. For certain types of errors the
>> > > spec states that the host _may_ reset the device. Right now there are
>> > > not many devices that support HID over SPI, but I wanted to allow the
>> > > flexibility for each vendor to decide what cases to error-handle.
>> >
>> > Looking at section 9 (Error handling) of the HID SPI protocol spec, it seems that
>> > the only time the host may (or not) decide to reset the device is when receiving
>> > a timeout error.
>> > And looking at the phrasing there, I think we ought to simply reset the device
>> > anyway.
>> >
>> > So now that I have the spec under my eyes, I would think that for this part, the
>> > host is expected to reset the device, which in turn makes this a spi-hid
>> > responsibility.
>> >
>> > So I would suggest adding a callback notifying that the device has been reset,
>> > and with a flag telling whether it's host or device initiated.
>> > Then in hid-microsoft, hid-multitouch we can deal with that situation.
>> >
>> > Putting this at the transport layer allows for a common behavior which won't
>> > depend on the leaf HID driver in use.
>>
>> Please note the "ready" flag that is wired to a sysfs attribute in
>> spi-hid in patch 5/5. In our case the touch digitizer sends the raw
>> data, so we process it and convert it into input events in a userspace
>> service we call the touch daemon. The touch daemon detects digitizer
>> resets via the ready flag: any time the flag goes from "not ready" to
>> "ready", it is interpreted as digitizer coming out of reset and the
>> touch daemon then sends some system state info to the digitizer, among
>> other things. While the ready flag is "not ready", in our architecture,
>> the userspace will not send ioctl's or write into the hidraw device.
>
> So that means that this device is forwarding the raw touch map?

yes it is. Raw touch map for fingers, some other not-truly-raw reports
for pen, and some vendor specific messages (mostly tuning-related and
some telemetry/debug data).

>> All this means that the code in hid-microsoft won't be implementing this
>> new notify_of_reset() callback. Since in the final submission there
>> won't be an implementation of this callback, is it worth adding at this
>> stage? Can it go in as a REVISIT or a FIXME comment until such
>> notification to the leaf driver is needed?
>
> If there is no users, then it's probably best to not implement it. We
> could add a comment, yes, but maybe not a FIXME, just a regular
> comment.

+1

[snip]

-- 
balbi
