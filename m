Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17EB73C6EF
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 11:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404888AbfFKJEI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 11 Jun 2019 05:04:08 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:41687 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404702AbfFKJEB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 05:04:01 -0400
Received: by mail-qt1-f178.google.com with SMTP id 33so5437315qtr.8
        for <linux-input@vger.kernel.org>; Tue, 11 Jun 2019 02:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SPPmSAZkL8j1TuUDXwIdJALCZf2Yk/FImqdWc8bWJ6Y=;
        b=VdYCUISnvlDrvK6prxWE+b5czojqIQWhcEtOBsj88VfTcFnn4W5BVRCB7RcS6zvAf4
         lBkwERBDL+aFc9BcuketkPFS/635NOJSIpLKtakA8/sQD3mDBrZtuoT5jXz/aZPI3ktu
         spV4AsNqy09MWoA3Ktnvwe3AZR2lnAGomAPZKvmddf4d1LzK0RXGC0X1OjvsLK6YVWnB
         5gKEwPFlVpr72bb38IhbU8KeKdCngnjg067YvHsg33zAoM40xdEr/wBULIhnD43v9tI6
         TM8uy0kgTX5TvepeaePogk0DaP8fgB5Ssb36D4mnLZVCMHmbKTsZ4qtwNg1k9zqhB8KW
         vA0Q==
X-Gm-Message-State: APjAAAX9/bDiGTcyp/Cx/92gqMoLKRyAM71Yt67T3EwUvxbi8wcquJPx
        08pfdt0RfCxpVuO8wpNcsF2Yt6egwJCkkljhK1Bogg==
X-Google-Smtp-Source: APXvYqwKPepeT5OKbc7huZTt71SJ/GLKCkaouVE4yrKp7dOmWleKRqOVRZR6d5AkTE+9b9DTQmzgAWO1dPJqiWT3XR0=
X-Received: by 2002:a0c:b659:: with SMTP id q25mr58291727qvf.29.1560243840156;
 Tue, 11 Jun 2019 02:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190422031251.11968-1-ronald@innovation.ch> <20190422031251.11968-2-ronald@innovation.ch>
 <CAO-hwJLMZvBGheEtH_iU+mBtE4T3OsT6W+=1x-ewzGGP5Fxp4Q@mail.gmail.com>
 <20190425081948.GB31301@innovation.ch> <CAO-hwJKcuptG6X7Y0jrQzyLUzZfsXoyWxMmk=v_aPxJh9iv4Gg@mail.gmail.com>
 <20190426055632.GC31266@innovation.ch> <CAO-hwJJOixkp9i9RYOhDZrw4_R0_5u52yvdui3NwEWHRyvNFow@mail.gmail.com>
 <20190610091948.GC16597@innovation.ch>
In-Reply-To: <20190610091948.GC16597@innovation.ch>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 11 Jun 2019 11:03:49 +0200
Message-ID: <CAO-hwJL_6Hn-KYx9z8TohQgmibS8WS9NBkm+9EC-zu2-PxjvKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mfd: apple-ibridge: Add Apple iBridge MFD driver.
To:     "Life is hard, and then you die" <ronald@innovation.ch>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-iio@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi ronald,

On Mon, Jun 10, 2019 at 11:20 AM Life is hard, and then you die
<ronald@innovation.ch> wrote:
>
>
>   Hi Benjamin,
>
> Sorry for the extremely late reply - RL etc.
>
> On Fri, Apr 26, 2019 at 08:26:25AM +0200, Benjamin Tissoires wrote:
> > On Fri, Apr 26, 2019 at 7:56 AM Life is hard, and then you die
> > <ronald@innovation.ch> wrote:
> > >
> > > On Thu, Apr 25, 2019 at 11:39:12AM +0200, Benjamin Tissoires wrote:
> > > > On Thu, Apr 25, 2019 at 10:19 AM Life is hard, and then you die
> > > > <ronald@innovation.ch> wrote:
> > > > >
> > > > >   Hi Benjamin,
> > > > >
> > > > > Thank you for looking at this.
> > > > >
> > > > > On Wed, Apr 24, 2019 at 04:18:23PM +0200, Benjamin Tissoires wrote:
> > > > > > On Mon, Apr 22, 2019 at 5:13 AM Ronald Tschalär <ronald@innovation.ch> wrote:
> > > > > > >
> > > > > > > The iBridge device provides access to several devices, including:
> > > > > > > - the Touch Bar
> > > > > > > - the iSight webcam
> > > > > > > - the light sensor
> > > > > > > - the fingerprint sensor
> > > > > > >
> > > > > > > This driver provides the core support for managing the iBridge device
> > > > > > > and the access to the underlying devices. In particular, since the
> > > > > > > functionality for the touch bar and light sensor is exposed via USB HID
> > > > > > > interfaces, and the same HID device is used for multiple functions, this
> > > > > > > driver provides a multiplexing layer that allows multiple HID drivers to
> > > > > > > be registered for a given HID device. This allows the touch bar and ALS
> > > > > > > driver to be separated out into their own modules.
> > > > > >
> > > > > > Sorry for coming late to the party, but IMO this series is far too
> > > > > > complex for what you need.
> > > > > >
> > > > > > As I read this and the first comment of drivers/mfd/apple-ibridge.c,
> > > > > > you need to have a HID driver that multiplex 2 other sub drivers
> > > > > > through one USB communication.
> > > > > > For that, you are using MFD, platform driver and you own sauce instead
> > > > > > of creating a bus.
> > > > >
> > > > > Basically correct. To be a bit more precise, there are currently two
> > > > > hid-devices and two drivers (touchbar and als) involved, with
> > > > > connections as follows (pardon the ugly ascii art):
> > > > >
> > > > >   hdev1  ---  tb-drv
> > > > >            /
> > > > >           /
> > > > >          /
> > > > >   hdev2  ---  als-drv
> > > > >
> > > > > i.e. the touchbar driver talks to both hdev's, and hdev2's events
> > > > > (reports) are processed by both drivers (though each handles different
> > > > > reports).
> > > > >
> > > > > > So, how about we reuse entirely the HID subsystem which already
> > > > > > provides the capability you need (assuming I am correct above).
> > > > > > hid-logitech-dj already does the same kind of stuff and you could:
> > > > > > - create drivers/hid/hid-ibridge.c that handles USB_ID_PRODUCT_IBRIDGE
> > > > > > - hid-ibridge will then register itself to the hid subsystem with a
> > > > > > call to hid_hw_start(hdev, HID_CONNECT_HIDRAW) and
> > > > > > hid_device_io_start(hdev) to enable the events (so you don't create
> > > > > > useless input nodes for it)
> > > > > > - then you add your 2 new devices by calling hid_allocate_device() and
> > > > > > then hid_add_device(). You can even create a new HID group
> > > > > > APPLE_IBRIDGE and allocate 2 new PIDs for them to distinguish them
> > > > > > from the actual USB device.
> > > > > > - then you have 2 brand new HID devices you can create their driver as
> > > > > > a regular ones.
> > > > > >
> > > > > > hid-ibridge.c would just need to behave like any other hid transport
> > > > > > driver (see logi_dj_ll_driver in drivers/hid/hid-logitech-dj.c) and
> > > > > > you can get rid of at least the MFD and the platform part of your
> > > > > > drivers.
> > > > > >
> > > > > > Does it makes sense or am I missing something obvious in the middle?
> > > > >
> > > > > Yes, I think I understand, and I think this can work. Basically,
> > > > > instead of demux'ing at the hid-driver level as I am doing now (i.e.
> > > > > the iBridge hid-driver forwarding calls to the sub-hid-drivers), we
> > > > > demux at the hid-device level (events forwarded from iBridge hdev to
> > > > > all "virtual" sub-hdev's, and requests from sub-hdev's forwarded to
> > > > > the original hdev via an iBridge ll_driver attached to the
> > > > > sub-hdev's).
> > > > >
> > > > > So I would need to create 3 new "virtual" hid-devices (instances) as
> > > > > follows:
> > > > >
> > > > >   hdev1  ---  vhdev1  ---  tb-drv
> > > > >                         /
> > > > >           --  vhdev2  --
> > > > >          /
> > > > >   hdev2  ---  vhdev3  ---  als-drv
> > > > >
> > > > > (vhdev1 is probably not strictly necessary, but makes things more
> > > > > consistent).
> > > >
> > > > Oh, ok.
> > > >
> > > > How about the following:
> > > >
> > > > hdev1 and hdev2 are merged together in hid-apple-ibridge.c, and then
> > > > this driver creates 2 virtual hid drivers that are consistent
> > > >
> > > > like
> > > >
> > > > hdev1---ibridge-drv---vhdev1---tb-drv
> > > > hdev2--/           \--vhdev2---als-drv
> > >
> > > I don't think this will work. The problem is when the sub-drivers need
> > > to send a report or usb-command: how to they specify which hdev the
> > > report/command is destined for? While we could store the original hdev
> > > in each report (the hid_report's device field), that only works for
> > > hid_hw_request(), but not for things like hid_hw_raw_request() or
> > > hid_hw_output_report(). Now, currently I don't use the latter two; but
> > > I do need to send raw usb control messages in the touchbar driver
> > > (some commands are not proper hid reports), so it definitely breaks
> > > down there.
> > >
> > > Or am I missing something?
> >
> > I'd need to have a deeper look at the protocol, but you can emulate
> > pure HID devices by having your ibridge handling a translation from
> > set/get features/input to the usb control messages. Likewise, nothing
> > prevents you to slightly rewrite the report descriptors you present to
> > the als and touchbar to have a clear separation with the report ID.
> >
> > For example, if both hdev1 and hdev2 use a report ID of 0x01, you
> > could rewrite the report descriptor so that when you receive a report
> > with an id of 0x01 you send this to hdev1, but you can also translate
> > 0x11 to a report ID 0x01 to hdev2.
> > Likewise, report ID 0x42 could be a raw USB control message to the USB
> > under hdev2.
> >
> > Note that you will have to write 2 report descriptors for your new
> > devices, but you can take what makes sense from the original ones, and
> > just add a new collection with a vendor application with with an
> > opaque meaning (for the USB control messages).
>
> A couple things here. First of all, I went and rewrote the mfd driver
> with the hid-driver demultiplexer as a straight hid driver with 3
> (well, 4 actually) virtual hid devices, as first discussed above.
> This overall led to some simplifications, with only smaller
> adjustments in the Touch Bar and ALS drivers (the diff stat shows 468
> insertions, 825 deletions), so this looks good. Importantly (IMO),
> this leaves the whole awareness of the fact that the Touch Bar driver
> is talking to multiple usb interfaces and needs to coordinate
> appropriately between them (including things like which order they are
> accessed, sleep times between those accesses, and different power
> management) clearly in the Touch Bar driver, and the ibridge driver is
> still fairly generic unaware of any of the details that the
> sub-drivers need to worry about.
>
> Then I started looking more closely at your last suggestion above of
> creating only 2 virtual hid devices, with report descriptor
> merging/mangling and the addition of 3 custom reports (for the
> set-power, io-wait, and usb-control functionality), and I'm having
> trouble seeing the justification for it. AFAICT, the only advantage of
> this approach is that there are fewer virtual hid devices. But the
> disadvantages are significantly more code (especially in the ibridge
> driver) and more leakage of knowledge from the Touch Bar driver into
> the ibridge driver. In particular:
>
> * this leads to additional work, synchronization, and state management
>   in the ibridge driver to deal with the fact that we have to wait for
>   all (real) hid devices to be probed before we can start creating the
>   virtual hid devices (and visa versa on removal).
> * merging and mangling those report descriptors requires re-parsing
>   of the descriptors and dealing with various corner cases, which adds
>   a bunch of code.
> * while the custom set-power and io-wait reports are simple, the
>   custom usb-control report is ugly, because it actually ends up
>   needing to compute some of the parameters and rewrite the data, as
>   both those have values that require knowledge of the real underlying
>   reports and usb interfaces (i.e. it's not a report for a generic
>   usb-control call, but a very Touch Bar specific one, i.e. leaking
>   particular Touch Bar driver knowledge into the ibridge driver).
> * In addition, while creating especially the custom usb-control
>   report, I started to wonder if it's really worth serializing the
>   parameters for the custom functions/report into an actual report
>   buffer, just to be deserialized again two function calls down the
>   stack. This became obvious when I was adding a helper function to
>   the ibridge driver to serialize the function parameters, and at the
>   same time writing a function right below it to deserialize those
>   parameters again, all so we can call hid_hw_request() to pass them
>   from the Touch Bar driver to the ibridge driver - but since the
>   Touch Bar driver is already calling a custom function in the ibridge
>   driver to serialize the parameters, it seems like that function
>   might just as well make the desired underlying function call
>   directly in the first place. Alternatively, the serializing
>   functionality can be put in the Touch Bar driver instead, with the
>   disadvantage that the implicit knowledge of the structure of the
>   custom report is now spread over two modules. All of this seems
>   somewhat ugly to me.
>
> Lastly, as hinted earlier, while this tries to hide the fact that
> there are actually multiple hid devices (aka usb interfaces) that are
> being driven by the Touch Bar driver, the Touch Bar driver still needs
> to be acutely aware of that fact because it cannot treat them equally.
> So now instead it clearly dealing with two different devices, it now
> has to do so indirectly by figuring out which reports (in the same
> virtual hid device) belong to which underlying real hid devices so it
> can treat those reports accordingly (e.g. when creating the reports to
> trigger set-power or usb-ctrl, instead of the desired device/interface
> being targeted directly, that info has to instead be passed somewhat
> opaquely via a report-id of a report that it happens to know is mapped
> to the desired device/interface).
>
> Sorry for the long-winded response. I hope it isn't too cryptic. But
> basically it boils down to: going for single virtual hid-device per
> real device adds a bunch of complexity and knowledge leaking from the
> Touch Bar driver the ibridge driver with AFAICT only a small advantage
> (namely fewer virtual devices).
>

I must confess that understanding all the details above without seeing
the code is rather hard.
However, if you have a simple and elegant solution right now that
doesn't imply the MFD driver, how about posting it now so we can
discuss it by looking at the code?

I am fine putting the above explanation in a commit message to justify
the current approach, but we are already talking about revision 3 when
I haven't seen revision 2.

Anyway, I can be convinced a design is better than the one I suggested.
And sometime it's better to not abstract too much if the overall gets
a little bit too complex.

So can you post your current WIP?

Cheers,
Benjamin
