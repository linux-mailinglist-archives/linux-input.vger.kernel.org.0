Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3437E3507B7
	for <lists+linux-input@lfdr.de>; Wed, 31 Mar 2021 22:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbhCaUAf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Mar 2021 16:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235928AbhCaUAG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Mar 2021 16:00:06 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCACC061574
        for <linux-input@vger.kernel.org>; Wed, 31 Mar 2021 13:00:05 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id a12so6452895pfc.7
        for <linux-input@vger.kernel.org>; Wed, 31 Mar 2021 13:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0KpsN2n2rl0Vu+vgr8sZ9B5ZhPJudTlpxLWsiU7IhwU=;
        b=MGHrQTfHyOAb8kM3Rt0OMEyyPntxwsX69qM6NWQL5GGCUIqrLw92uGvF6GvnOOphsI
         Cw75tNemRx0wzw3dJF/86E+fyeH7asnNKZYGkSDB1Wv5lKSidjKxdOjWNU0sUhmhzyYz
         MRpUUWGdnIIpo9WvyGG7ji94ztMLQ+lR1p5P6IblLMf88+zWnU3Jz3+9HCxBXKVzJt5F
         QxPW/DJTzCvVtOVRWTMRCxvk0eSdwS0/rCEUSMMcIryK/Pm9dpTBymUG8bVA1zjxa7E8
         +GRhMUgm0V6QYsxlSTUiMRLTyKH9+Brft8bkk7HMrQPgwzut3dfeBQDm73+1IK9SLcna
         uESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0KpsN2n2rl0Vu+vgr8sZ9B5ZhPJudTlpxLWsiU7IhwU=;
        b=tWat9A3A/bIpDmSn/kpbtnngjCvasi9cVn6zI5R9qhGDT1o0NIxFDX7ckNNPnie5Az
         w/8T+WcOrjVtO0XWZTl1huM44OuBYIPaqFz8ZsNCq82NgJ4gzL4x+vfuhDM8IRz3X6Pi
         +yijIaJqpiVGRWTgWvusBHCAf4GJ4EwkZ5IuQIi8QJ11OeNebFKLDw+5Fa1Tjg7v++VP
         sCmTM3lNI4ciEOxA3gYVWSLQTQb5+fYFbkNKeKyBcNA8b+mQIKS8xcbD2aM4QGMf8qCX
         5is3SKkuvcgv+/A3XkFQiqOPS/CJ7jBs/Q+/GM2gh+WgiiS17+Ug82g+LEyiEjPHWgea
         zG9w==
X-Gm-Message-State: AOAM532EOGiZpNCZClrOfYK4y+5J7xL0YHMtnlbF5k4gZFBLeWiXYvTV
        u6cf60tVrosIF2vYJgYXIpRFo7mIzcmS+lCvDLF3RQ==
X-Google-Smtp-Source: ABdhPJy8qgsEw5EG8al4EISa8IUBPRVu9rC57WR6h60fZtxzMiQm7ng5QUTBb17KuPQ31xPeOcWvgVZohwrIAzKJN0g=
X-Received: by 2002:a63:79c6:: with SMTP id u189mr4637559pgc.154.1617220802597;
 Wed, 31 Mar 2021 13:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <CALvoSf7L2tkrdg_rF0ZqbUv-H2TXnEudjSDUrts+MUs=Lvhpeg@mail.gmail.com>
 <CAO-hwJ+6g9ADRpShG_HbQi5PGv6PLp-1wxJP7CSLT+1uJLB9OA@mail.gmail.com>
In-Reply-To: <CAO-hwJ+6g9ADRpShG_HbQi5PGv6PLp-1wxJP7CSLT+1uJLB9OA@mail.gmail.com>
From:   Kenneth Albanowski <kenalba@google.com>
Date:   Wed, 31 Mar 2021 12:59:50 -0700
Message-ID: <CALvoSf63YbXdK8-yEUnnJqaGeZ4VF2A+8u4M9tpoSB7OHOxHXQ@mail.gmail.com>
Subject: Re: Supporting 64-bit Digitizer Serial Numbers?
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <Jason.Gerecke@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 25, 2021 at 1:35 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Kenneth,
>
> On Wed, Mar 24, 2021 at 8:53 PM Kenneth Albanowski <kenalba@google.com> wrote:
> >
> > Hi folks,
> >
> > I'm looking at being able to retrieve an accurate (not mangled or
> > truncated) Digitizer.Transducer Serial Number from user-space, primarily
> > through the power_supply node constructed for HID devices which expose
> > Battery Strength.
> >
> > For the digitizers I'm looking at (USI) the Serial Number is a 64-bit
> > report field, making it not fit directly into evdev, or the hid-input
> > core.
>
> Thanks for raising that issue. Before I jump into commenting on your
> PoC, I'd like to ask you to provide the report descriptor of this
> particular device (ideally with hid-recorder from the hid-tolls repo
> below).
> AFAICT, the HID spec we currently implement doesn't allow for data of
> more than 32 bits (section 6.2.2.2 of
> https://www.usb.org/sites/default/files/hid1_11.pdf).
> The main problem is that a field is usually associated with a logical
> max, and this part makes us limit the field up to 32bits.

Appended find the HID descriptor for a Lenovo Duet Chromebook with USI
digitizer -- I'm confident the S/N report size will be consistent
across other USI devices and touchscreen controllers.

Here's the section in question:

# 0x05, 0x0d,                    //   Usage Page (Digitizers)           653
# 0x09, 0x3b,                    //   Usage (Battery Strength)          655
# 0x15, 0x00,                    //   Logical Minimum (0)               657
# 0x25, 0x64,                    //   Logical Maximum (100)             659
# 0x75, 0x08,                    //   Report Size (8)                   661
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              663
# 0x09, 0x5b,                    //   Usage (Transducer Serial Number)  665
# 0x25, 0xff,                    //   Logical Maximum (255)             667
# 0x75, 0x40,                    //   Report Size (64)                  669
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              671

I've seen a few variations of min/max, but as you say the logical max can't
go over 32 bits in any case.

> There is a "long items" section right after (6.2.2.3) that allows for
> longer data, and I don't think the current implementation supports it.

I'm a bit puzzled as to the direction of the spec here: items within the
HID descriptor are clearly limited to 32 bit values (short items, 6.2.2.2),
and long items are specifically unimplemented, e.g. "No long item tags are
defined in this document. These tags are reserved for future use." (6.2.2.3)

So, not only is there nothing in our code for long items, it doesn't seem
there is a spec definition as to what we would do with them anyway.

However that size limit on items pertains to the HID descriptor, not the
HID report: the Report Size for a field can definitely be larger than 64
bits, and there are a few examples, such as this for USI, some web searches
bring up instances of "Report Size (64)" and "Report Size (128)", and we
also had the example of a sensor hub with a 192 bit report leading to
"HID: Increase maximum report size allowed by hid_field_extract()" (and its
subsequent reversion.)

Clearly this is logically inconsistent (the min/max cannot accurately
describe a > 32 bit field) but hey, that's life. Presumably anyone using
fields that large is just reading them raw and decoding them manually
(or using them as a bulk data pipe).

(If I'm misinterpreting this distinction between descriptor items and
report items, please correct me.)

Incidentally, the spec also says "An item field cannot span more than 4
bytes in a report. For example, a 32-bit item must start on a byte
boundary to satisfy this condition." (first bullet, 8.4) which to my
reading does completely preclude report fields over 32 bits, but
apparently nobody else is interpreting it that way, or at least being
strict about it.

To get back to reality, grabbing a handy Wacom digitizer (Intuos BT S):

# 0x09, 0x5b,                    //   Usage (Transducer Serial Number)  119
# 0x09, 0x5c,                    //   Usage (Wacom SerialHi)            121
# 0x17, 0x00, 0x00, 0x00, 0x80,  //   Logical Minimum (-2147483648)     123
# 0x27, 0xff, 0xff, 0xff, 0x7f,  //   Logical Maximum (2147483647)      128
# 0x75, 0x20,                    //   Report Size (32)                  133
# 0x95, 0x02,                    //   Report Count (2)                  135
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              137

So, well, that makes a lot more sense, and is easier to deal with.

> One other thing: this whole problem is very much a good candidate for
> adding regression tests on
> https://gitlab.freedesktop.org/libevdev/hid-tools.
>
> So I'd be glad if we can work around the problem in the kernel *and*
> add the matching test in hid-tools so we don't break this in the
> future.

Gladly. Thank you for mentioning those regression tests, I'd very much
like to aim towards high consistency and some form of documentation.

> More comments inlined...
>
> >
> > I'm appending a proof-of-concept which implements this; I describe the
> > details below. (This is based on 5.4, but it looks clean for 5.10 as
> > well as relatively straightforward to backport.)
> >
> > I'd appreciate any feedback on this approach.
> >
> > My thought is to perform minimal modifications to allow hid-core to
> > transfer reports up to 64-bits in size to hid-input, so that it can
> > process this field and emit it to the power_supply integration, as well
> > as through classic MSC_SERIAL (for the low 32 bits) and a new
> > MSC_SERIAL2 (the upper bits) for applications which want it inline with
> > stylus event data.
>
> The wacom driver already has this problem and handles it in a creative
> way (as usual ;-P)
> If I am not mistaken, it splits the 64 bits serial on 2 events as
> well: MSC_SERIAL and ABS_MISC (Jason might correct me here).
>
> I am not saying this is what needs to be done, but just what some
> userspace tools already expect.

As Peter mentions, this seems separate, ABS_MISC being a sort of tool
type identifier, quite different from the serial number. (They apparently
get extracted from the same data report in the wacom formats, but the
intention seems distinct.)

As far as I can see, the Wacom S/N (stuffed into MSC_SERIAL) is indeed
always truncated to 32 bits; introducing MSC_SERIAL2 should be suitable
for the wacom driver as well if they want to publish the high bits.

> > hid_field.value is expanded to an s64 array from s32, and there are
> > a few knock-on effects to code that holds pointers to these fields.
> > No other interfaces, in-kernel, or user-space, are modified to support
> > HID reports/evdev events > 32 bits.
>
> I also think both problems are orthogonal (which is why you haven't
> tried to change the evdev protocol).
>
> I don't think we can do much on the evdev side to support 64 bits or
> bigger data.
> Dmitry and Peter might find a good way to work around that, but I'm OK
> with adding MSC_SERIAL_2 from my point of view.

Thanks.

> > The Transducer Serial Number would show up as in the power_supply as a
> > serial_number of "DG:0123456789ABCDEF" (or however many hex digits are
> > warranted by the report size), and "DG:" being a fixed prefix -- we do
> > know it is a digitizer.
> >
> > I realize this doesn't provide a scalable solution in the
> > hid-core/hid-input code for (hypothetical) fields larger than 64 bits,
> > although extending evdev with MSC_SERIAL3, 4, etc. would be trivial. (I
> > don't have a good sense of how common these larger fields are, although
> > obviously the code has survived until now with only 32-bit support, and
> > one comment saying that anything larger than 16-bit is unusual.)
>
> I would prefer having a generic solution for items longer than 32 bits
> instead of having a special case for 64 bits only.
>
> The spec allows for items longer than 32 bits (still section 6.2.2.3
> of the HID spec) so we should probably handle that case in a generic
> way to not have to deal with 128 bits next time a creative device
> maker wants to use it.

I'm glad to look at more generalized long-field support.

> The nice thing about the hid-tools test suite is that we can be
> creative and produce this 128 bits new device, and have the tests for
> it already :)

Agreed, glad to reduce the headache involved with doing this again in
the future.

> > (The other approach I was looking at was leaving hid_field.value
> > unchanged, and instead just having hid-core recognize this particular
> > 64 bit field, edit the hid_usage to turn it into a 2-count 32-bit field,
> > apply a unique usage code to the second half, and then have hid-input
> > recognize these usages and paste everything back together. This is
> > scalable to larger fields, but is putting an unprecedented amount of
> > magic in hid-core.)
>
> Not really. There is already a lot of magic in hid-core, and handling
> longer-than-32bits doesn't seem that far away. The report descriptor
> should give us all the information we need, so we can surely have a
> special case for long items and data. Also hid-input doesn't have to
> be tied to evdev. So nothing prevents us to mark the field as being a
> long one, and change the internal representation of the various 32
> bits chunks of its data.

So, let me propose some specific alternate implementations:

1) Have hid-core notice a usage for a 64-bit Usage(Digitizer.Transducer
Serial Number) and split it up in the hid_field into a repeated field,
with the usage of the second set to, perhaps, Wacom.SerialHi.

Downside: modified hid_field definitions, which will show up in
hid-debug and hiddev -- there will be disagreement between the rdesc,
the kernel hid-fields, and a descriptor parsed by hid-tools. Also,
hidinput_hid_event() has to maintain state within one of the hid_*
structures if it needs to recombine these split-up reports.

2) All hid report fields with sizes greater than 32 bits (and a
multiple of 32 bits) get modified to be split into repeated fields.
The hid_usage definitions are retained, but a new 'split' attribute is
added allowing hid_process_event to understand which 32 bit slice of
a field is being processed, and better understand when it is getting
the last slice, if it needs to perform an action upon combining
everything.

Downside: same as #1, plus now a new concept to explain, and several
places need to reject split>0 to maintain prior low 32 bit behaviour,
and it can only handle 32 bit multiples unless we start splitting
one field into multiple fields in that scenario.

3) Same as #1 or #2, but give hid-input a function,
hidinput_should_split_field() that allows it to choose which repeated
fields opt-in to this new behaviour.

Downside: same as #1 or #2, but the disruption to the hid_fields is
constrained to these very specific cases. (Not sure that's much better
for someone trying to understand what is going on.)

4) Same as #1 or #2 or #3, but introduce a HID_QUIRK to trigger the
behaviour.

Downside: same as above, but at least there's clearly a quirk to blame.

5) Modify interface to hidinput_hid_event() to take u32* and a length
instead of s32 value. hid_input_field() is modified to allocate enough u32
slots to fit all the entire contents of the field, and extracts multiple
32 bit chunks from fields > 32 bits long, with the most significant chunk
sign extended. The pointer to the first u32 extracted (the least significant
chunk) is passed to hidinput_hid_event() and it can decide whether to just
treat it as a single s32 for most operations, or use all 32 bit chunks for
special cases, like Usage(Digitizer.Transducer Serial Number). All of this
is probably restricted to only HID_MAIN_ITEM_VARIABLE fields.

Downsides: hid_input_field() may get a little more complex to read.

That's the list.

Those are the ones I can think of at the moment -- #5 is sounding real good
to me at the moment; I haven't tried a prototype yet, but it looks like
it might fit fairly well.

> > The other change is MSC_SERIAL2 would be added: in the specific case of
> > Usage(Digitizer.Transducer Serial Number) being present with
> > report_size > 32 then MSC_SERIAL is reliably the full lowest 32 bits,
> > and MSC_SERIAL2 is the next set of 32 bits; no clamping or scaling
> > applied, regardless of what the descriptor says. Both MSC_SERIAL* are
> > emitted for every hid record, there is no caching. If report_size <=
> > 32, then there is no difference to existing behaviour, only MSC_SERIAL
> > is emitted. I'm assuming the cost of one additional event per sync, for
> > stylus data, is negligible.
>
> I am not in the best position to comment, but as mentioned previously,
> it works for me.
>
> >
> > This does potentially alter the generation of MSC_SERIAL on existing
> > devices, but only ones where the report_size > 32 bits and the min/max
> > is not 0/~0 -- user space would see unclamped values and conceivably
> > could be surprised with a larger value in MSC_SERIAL than previously
> > seen.
>
> Honestly it shouldn't introduce any regressions. I still have to work
> on the tablet side of the regression tests, but so far only Wacom was
> reliably sending serial numbers (and bigger than 32 bits). So I am not
> worried from this side of things.

Ok, that feels reasonable -- any risk is low, as there already exist
devices that can reasonably emit a full 32 bit range on MSC_SERIAL,
combined with MSC_SERIAL actually being quite rare.

(I thought it would be nice to see a Wacom digitizer delivering a full
32 bit MSC_SERIAL in action, but so far I haven't found a combination of
tablet, pen, and kernel ready-to-hand that that actually get me a non-zero
field.)

> > If changing MSC_SERIAL is deemed too risky for compatibility, then it's
> > easy to just leave MSC_SERIAL as-is, and put in a separate MSC_SERIAL1
> > (MSC_SERIAL0?) that has the pristine low bits -- just at a cost of yet
> > one more MSC_ field per report, and using up the last MSC_ bit before
> > we need to bump MSC_MAX.
> >
> > This approach doesn't affect Wacom evdev events at all, all of that
> > logic is separate from hid-input.
>
> There is a whole ecosystem for wacom, but we are pretty much in
> control of all the pieces. So I would prefer involving wacom from the
> beginning, and have a common representation to the user space.
>
> Besides that, I skimmed through the  patch below. I do have comments,
> but in addition to the above, they are mostly "hey this hunk should be
> in its own separate patch". But I guess the final submission will have
> this separation, so there is no real point in going too deep in the
> details IMO.

Cool, thanks.

Kind regards and good health,
- Kenneth Albanowski

localhost ~ # hid-recorder
Available devices:
/dev/hidraw0: hid-over-i2c 27C6:0E30
/dev/hidraw1: Google Inc. Hammer
/dev/hidraw2: Google Inc. Hammer
Select the device event number [0-2]: 0
# hid-over-i2c 27C6:0E30
# 0x05, 0x0d,                    // Usage Page (Digitizers)             0
# 0x09, 0x04,                    // Usage (Touch Screen)                2
# 0xa1, 0x01,                    // Collection (Application)            4
# 0x85, 0x01,                    //  Report ID (1)                      6
# 0x09, 0x22,                    //  Usage (Finger)                     8
# 0xa1, 0x02,                    //  Collection (Logical)               10
# 0x55, 0x0e,                    //   Unit Exponent (-2)                12
# 0x65, 0x11,                    //   Unit (Centimeter,SILinear)        14
# 0x35, 0x00,                    //   Physical Minimum (0)              16
# 0x15, 0x00,                    //   Logical Minimum (0)               18
# 0x09, 0x42,                    //   Usage (Tip Switch)                20
# 0x25, 0x01,                    //   Logical Maximum (1)               22
# 0x75, 0x01,                    //   Report Size (1)                   24
# 0x95, 0x01,                    //   Report Count (1)                  26
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              28
# 0x25, 0x7f,                    //   Logical Maximum (127)             30
# 0x09, 0x30,                    //   Usage (Tip Pressure)              32
# 0x75, 0x07,                    //   Report Size (7)                   34
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         36
# 0x95, 0x01,                    //   Report Count (1)                  38
# 0x75, 0x08,                    //   Report Size (8)                   40
# 0x09, 0x51,                    //   Usage (Contact Id)                42
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              44
# 0x75, 0x10,                    //   Report Size (16)                  46
# 0x05, 0x01,                    //   Usage Page (Generic Desktop)      48
# 0x26, 0x20, 0x1c,              //   Logical Maximum (7200)            50
# 0x46, 0x49, 0x05,              //   Physical Maximum (1353)           53
# 0x09, 0x30,                    //   Usage (X)                         56
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              58
# 0x26, 0x00, 0x2d,              //   Logical Maximum (11520)           60
# 0x46, 0x76, 0x08,              //   Physical Maximum (2166)           63
# 0x09, 0x31,                    //   Usage (Y)                         66
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              68
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           70
# 0x55, 0x0f,                    //   Unit Exponent (-1)                72
# 0x75, 0x08,                    //   Report Size (8)                   74
# 0x25, 0xff,                    //   Logical Maximum (255)             76
# 0x45, 0xff,                    //   Physical Maximum (255)            78
# 0x09, 0x48,                    //   Usage (Width)                     80
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         82
# 0x09, 0x49,                    //   Usage (Height)                    84
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         86
# 0x55, 0x0e,                    //   Unit Exponent (-2)                88
# 0xc0,                          //  End Collection                     90
# 0x09, 0x22,                    //  Usage (Finger)                     91
# 0xa1, 0x02,                    //  Collection (Logical)               93
# 0x09, 0x42,                    //   Usage (Tip Switch)                95
# 0x25, 0x01,                    //   Logical Maximum (1)               97
# 0x75, 0x01,                    //   Report Size (1)                   99
# 0x95, 0x01,                    //   Report Count (1)                  101
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              103
# 0x25, 0x7f,                    //   Logical Maximum (127)             105
# 0x09, 0x30,                    //   Usage (Tip Pressure)              107
# 0x75, 0x07,                    //   Report Size (7)                   109
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         111
# 0x95, 0x01,                    //   Report Count (1)                  113
# 0x75, 0x08,                    //   Report Size (8)                   115
# 0x09, 0x51,                    //   Usage (Contact Id)                117
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              119
# 0x75, 0x10,                    //   Report Size (16)                  121
# 0x05, 0x01,                    //   Usage Page (Generic Desktop)      123
# 0x26, 0x20, 0x1c,              //   Logical Maximum (7200)            125
# 0x46, 0x49, 0x05,              //   Physical Maximum (1353)           128
# 0x09, 0x30,                    //   Usage (X)                         131
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              133
# 0x26, 0x00, 0x2d,              //   Logical Maximum (11520)           135
# 0x46, 0x76, 0x08,              //   Physical Maximum (2166)           138
# 0x09, 0x31,                    //   Usage (Y)                         141
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              143
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           145
# 0x55, 0x0f,                    //   Unit Exponent (-1)                147
# 0x75, 0x08,                    //   Report Size (8)                   149
# 0x25, 0xff,                    //   Logical Maximum (255)             151
# 0x45, 0xff,                    //   Physical Maximum (255)            153
# 0x09, 0x48,                    //   Usage (Width)                     155
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         157
# 0x09, 0x49,                    //   Usage (Height)                    159
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         161
# 0x55, 0x0e,                    //   Unit Exponent (-2)                163
# 0xc0,                          //  End Collection                     165
# 0x09, 0x22,                    //  Usage (Finger)                     166
# 0xa1, 0x02,                    //  Collection (Logical)               168
# 0x09, 0x42,                    //   Usage (Tip Switch)                170
# 0x25, 0x01,                    //   Logical Maximum (1)               172
# 0x75, 0x01,                    //   Report Size (1)                   174
# 0x95, 0x01,                    //   Report Count (1)                  176
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              178
# 0x25, 0x7f,                    //   Logical Maximum (127)             180
# 0x09, 0x30,                    //   Usage (Tip Pressure)              182
# 0x75, 0x07,                    //   Report Size (7)                   184
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         186
# 0x95, 0x01,                    //   Report Count (1)                  188
# 0x75, 0x08,                    //   Report Size (8)                   190
# 0x09, 0x51,                    //   Usage (Contact Id)                192
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              194
# 0x75, 0x10,                    //   Report Size (16)                  196
# 0x05, 0x01,                    //   Usage Page (Generic Desktop)      198
# 0x26, 0x20, 0x1c,              //   Logical Maximum (7200)            200
# 0x46, 0x49, 0x05,              //   Physical Maximum (1353)           203
# 0x09, 0x30,                    //   Usage (X)                         206
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              208
# 0x26, 0x00, 0x2d,              //   Logical Maximum (11520)           210
# 0x46, 0x76, 0x08,              //   Physical Maximum (2166)           213
# 0x09, 0x31,                    //   Usage (Y)                         216
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              218
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           220
# 0x55, 0x0f,                    //   Unit Exponent (-1)                222
# 0x75, 0x08,                    //   Report Size (8)                   224
# 0x25, 0xff,                    //   Logical Maximum (255)             226
# 0x45, 0xff,                    //   Physical Maximum (255)            228
# 0x09, 0x48,                    //   Usage (Width)                     230
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         232
# 0x09, 0x49,                    //   Usage (Height)                    234
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         236
# 0x55, 0x0e,                    //   Unit Exponent (-2)                238
# 0xc0,                          //  End Collection                     240
# 0x09, 0x22,                    //  Usage (Finger)                     241
# 0xa1, 0x02,                    //  Collection (Logical)               243
# 0x09, 0x42,                    //   Usage (Tip Switch)                245
# 0x15, 0x00,                    //   Logical Minimum (0)               247
# 0x25, 0x01,                    //   Logical Maximum (1)               249
# 0x75, 0x01,                    //   Report Size (1)                   251
# 0x95, 0x01,                    //   Report Count (1)                  253
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              255
# 0x25, 0x7f,                    //   Logical Maximum (127)             257
# 0x09, 0x30,                    //   Usage (Tip Pressure)              259
# 0x75, 0x07,                    //   Report Size (7)                   261
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         263
# 0x75, 0x08,                    //   Report Size (8)                   265
# 0x09, 0x51,                    //   Usage (Contact Id)                267
# 0x95, 0x01,                    //   Report Count (1)                  269
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              271
# 0x05, 0x01,                    //   Usage Page (Generic Desktop)      273
# 0x26, 0x20, 0x1c,              //   Logical Maximum (7200)            275
# 0x75, 0x10,                    //   Report Size (16)                  278
# 0x55, 0x0e,                    //   Unit Exponent (-2)                280
# 0x65, 0x11,                    //   Unit (Centimeter,SILinear)        282
# 0x09, 0x30,                    //   Usage (X)                         284
# 0x35, 0x00,                    //   Physical Minimum (0)              286
# 0x46, 0x49, 0x05,              //   Physical Maximum (1353)           288
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              291
# 0x26, 0x00, 0x2d,              //   Logical Maximum (11520)           293
# 0x46, 0x76, 0x08,              //   Physical Maximum (2166)           296
# 0x09, 0x31,                    //   Usage (Y)                         299
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              301
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           303
# 0x55, 0x0f,                    //   Unit Exponent (-1)                305
# 0x75, 0x08,                    //   Report Size (8)                   307
# 0x25, 0xff,                    //   Logical Maximum (255)             309
# 0x45, 0xff,                    //   Physical Maximum (255)            311
# 0x09, 0x48,                    //   Usage (Width)                     313
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         315
# 0x09, 0x49,                    //   Usage (Height)                    317
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         319
# 0x55, 0x0e,                    //   Unit Exponent (-2)                321
# 0xc0,                          //  End Collection                     323
# 0x09, 0x22,                    //  Usage (Finger)                     324
# 0xa1, 0x02,                    //  Collection (Logical)               326
# 0x09, 0x42,                    //   Usage (Tip Switch)                328
# 0x15, 0x00,                    //   Logical Minimum (0)               330
# 0x25, 0x01,                    //   Logical Maximum (1)               332
# 0x75, 0x01,                    //   Report Size (1)                   334
# 0x95, 0x01,                    //   Report Count (1)                  336
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              338
# 0x25, 0x7f,                    //   Logical Maximum (127)             340
# 0x09, 0x30,                    //   Usage (Tip Pressure)              342
# 0x75, 0x07,                    //   Report Size (7)                   344
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         346
# 0x75, 0x08,                    //   Report Size (8)                   348
# 0x09, 0x51,                    //   Usage (Contact Id)                350
# 0x95, 0x01,                    //   Report Count (1)                  352
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              354
# 0x05, 0x01,                    //   Usage Page (Generic Desktop)      356
# 0x26, 0x20, 0x1c,              //   Logical Maximum (7200)            358
# 0x75, 0x10,                    //   Report Size (16)                  361
# 0x55, 0x0e,                    //   Unit Exponent (-2)                363
# 0x65, 0x11,                    //   Unit (Centimeter,SILinear)        365
# 0x09, 0x30,                    //   Usage (X)                         367
# 0x35, 0x00,                    //   Physical Minimum (0)              369
# 0x46, 0x49, 0x05,              //   Physical Maximum (1353)           371
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              374
# 0x26, 0x00, 0x2d,              //   Logical Maximum (11520)           376
# 0x46, 0x76, 0x08,              //   Physical Maximum (2166)           379
# 0x09, 0x31,                    //   Usage (Y)                         382
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              384
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           386
# 0x55, 0x0f,                    //   Unit Exponent (-1)                388
# 0x75, 0x08,                    //   Report Size (8)                   390
# 0x25, 0xff,                    //   Logical Maximum (255)             392
# 0x45, 0xff,                    //   Physical Maximum (255)            394
# 0x09, 0x48,                    //   Usage (Width)                     396
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         398
# 0x09, 0x49,                    //   Usage (Height)                    400
# 0x81, 0x42,                    //   Input (Data,Var,Abs,Null)         402
# 0x55, 0x0e,                    //   Unit Exponent (-2)                404
# 0xc0,                          //  End Collection                     406
# 0x09, 0x54,                    //  Usage (Contact Count)              407
# 0x15, 0x00,                    //  Logical Minimum (0)                409
# 0x25, 0x7f,                    //  Logical Maximum (127)              411
# 0x75, 0x08,                    //  Report Size (8)                    413
# 0x95, 0x01,                    //  Report Count (1)                   415
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               417
# 0x85, 0x02,                    //  Report ID (2)                      419
# 0x09, 0x55,                    //  Usage (Contact Max)                421
# 0x95, 0x01,                    //  Report Count (1)                   423
# 0x25, 0x0a,                    //  Logical Maximum (10)               425
# 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             427
# 0x85, 0x03,                    //  Report ID (3)                      429
# 0x06, 0x00, 0xff,              //  Usage Page (Vendor Defined Page 1) 431
# 0x09, 0xc5,                    //  Usage (Vendor Usage 0xc5)          434
# 0x15, 0x00,                    //  Logical Minimum (0)                436
# 0x26, 0xff, 0x00,              //  Logical Maximum (255)              438
# 0x75, 0x08,                    //  Report Size (8)                    441
# 0x96, 0x00, 0x01,              //  Report Count (256)                 443
# 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             446
# 0xc0,                          // End Collection                      448
# 0x05, 0x0d,                    // Usage Page (Digitizers)             449
# 0x09, 0x02,                    // Usage (Pen)                         451
# 0xa1, 0x01,                    // Collection (Application)            453
# 0x09, 0x20,                    //  Usage (Stylus)                     455
# 0xa1, 0x00,                    //  Collection (Physical)              457
# 0x85, 0x08,                    //   Report ID (8)                     459
# 0x05, 0x01,                    //   Usage Page (Generic Desktop)      461
# 0xa4,                          //   Push                              463
# 0x09, 0x30,                    //   Usage (X)                         464
# 0x35, 0x00,                    //   Physical Minimum (0)              466
# 0x46, 0x49, 0x05,              //   Physical Maximum (1353)           468
# 0x15, 0x00,                    //   Logical Minimum (0)               471
# 0x26, 0x20, 0x1c,              //   Logical Maximum (7200)            473
# 0x55, 0x0d,                    //   Unit Exponent (-3)                476
# 0x65, 0x13,                    //   Unit (Inch,EngLinear)             478
# 0x75, 0x10,                    //   Report Size (16)                  480
# 0x95, 0x01,                    //   Report Count (1)                  482
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              484
# 0x09, 0x31,                    //   Usage (Y)                         486
# 0x46, 0x76, 0x08,              //   Physical Maximum (2166)           488
# 0x26, 0x00, 0x2d,              //   Logical Maximum (11520)           491
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              494
# 0xb4,                          //   Pop                               496
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           497
# 0x09, 0x38,                    //   Usage (Transducer Index)          499
# 0x95, 0x01,                    //   Report Count (1)                  501
# 0x75, 0x08,                    //   Report Size (8)                   503
# 0x15, 0x00,                    //   Logical Minimum (0)               505
# 0x25, 0x01,                    //   Logical Maximum (1)               507
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              509
# 0x09, 0x30,                    //   Usage (Tip Pressure)              511
# 0x75, 0x10,                    //   Report Size (16)                  513
# 0x26, 0xff, 0x0f,              //   Logical Maximum (4095)            515
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              518
# 0x09, 0x31,                    //   Usage (Barrel Pressure)           520
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              522
# 0x09, 0x42,                    //   Usage (Tip Switch)                524
# 0x09, 0x44,                    //   Usage (Barrel Switch)             526
# 0x09, 0x5a,                    //   Usage (Secondary Barrel Switch)   528
# 0x09, 0x3c,                    //   Usage (Invert)                    530
# 0x09, 0x45,                    //   Usage (Eraser)                    532
# 0x09, 0x32,                    //   Usage (In Range)                  534
# 0x75, 0x01,                    //   Report Size (1)                   536
# 0x95, 0x06,                    //   Report Count (6)                  538
# 0x25, 0x01,                    //   Logical Maximum (1)               540
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              542
# 0x95, 0x02,                    //   Report Count (2)                  544
# 0x81, 0x03,                    //   Input (Cnst,Var,Abs)              546
# 0x09, 0x3d,                    //   Usage (X Tilt)                    548
# 0x55, 0x0e,                    //   Unit Exponent (-2)                550
# 0x65, 0x14,                    //   Unit (Degrees,EngRotation)        552
# 0x36, 0xd8, 0xdc,              //   Physical Minimum (-9000)          554
# 0x46, 0x28, 0x23,              //   Physical Maximum (9000)           557
# 0x16, 0xd8, 0xdc,              //   Logical Minimum (-9000)           560
# 0x26, 0x28, 0x23,              //   Logical Maximum (9000)            563
# 0x95, 0x01,                    //   Report Count (1)                  566
# 0x75, 0x10,                    //   Report Size (16)                  568
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              570
# 0x09, 0x3e,                    //   Usage (Y Tilt)                    572
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              574
# 0x09, 0x41,                    //   Usage (Twist)                     576
# 0x15, 0x00,                    //   Logical Minimum (0)               578
# 0x27, 0xa0, 0x8c, 0x00, 0x00,  //   Logical Maximum (36000)           580
# 0x35, 0x00,                    //   Physical Minimum (0)              585
# 0x47, 0xa0, 0x8c, 0x00, 0x00,  //   Physical Maximum (36000)          587
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              592
# 0x05, 0x20,                    //   Usage Page (Sensor)               594
# 0x0a, 0x53, 0x04,              //   Usage (Data Field: Acceleration
Axis X) 596
# 0x65, 0x00,                    //   Unit (None)                       599
# 0x16, 0x01, 0xf8,              //   Logical Minimum (-2047)           601
# 0x26, 0xff, 0x07,              //   Logical Maximum (2047)            604
# 0x75, 0x10,                    //   Report Size (16)                  607
# 0x95, 0x01,                    //   Report Count (1)                  609
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              611
# 0x0a, 0x54, 0x04,              //   Usage (Data Field: Acceleration
Axis Y) 613
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              616
# 0x0a, 0x55, 0x04,              //   Usage (Data Field: Acceleration
Axis Z) 618
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              621
# 0x0a, 0x57, 0x04,              //   Usage (Data Field: Angular
Velocity about X Axis) 623
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              626
# 0x0a, 0x58, 0x04,              //   Usage (Data Field: Angular
Velocity about Y Axis) 628
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              631
# 0x0a, 0x59, 0x04,              //   Usage (Data Field: Angular
Velocity about Z Axis) 633
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              636
# 0x0a, 0x72, 0x04,              //   Usage (Data Field: Heading X Axis) 638
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              641
# 0x0a, 0x73, 0x04,              //   Usage (Unknown Usage 0x473)       643
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              646
# 0x0a, 0x74, 0x04,              //   Usage (Data Field: Heading Z Axis) 648
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              651
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           653
# 0x09, 0x3b,                    //   Usage (Battery Strength)          655
# 0x15, 0x00,                    //   Logical Minimum (0)               657
# 0x25, 0x64,                    //   Logical Maximum (100)             659
# 0x75, 0x08,                    //   Report Size (8)                   661
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              663
# 0x09, 0x5b,                    //   Usage (Transducer Serial Number)  665
# 0x25, 0xff,                    //   Logical Maximum (255)             667
# 0x75, 0x40,                    //   Report Size (64)                  669
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              671
# 0x06, 0x00, 0xff,              //   Usage Page (Vendor Defined Page 1) 673
# 0x09, 0x5b,                    //   Usage (Vendor Usage 0x5b)         676
# 0x75, 0x20,                    //   Report Size (32)                  678
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              680
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           682
# 0x09, 0x5c,                    //   Usage (Preferred Inking Color)    684
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             686
# 0x75, 0x08,                    //   Report Size (8)                   689
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              691
# 0x09, 0x5e,                    //   Usage (Preferred Line Width)      693
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              695
# 0x09, 0x70,                    //   Usage (Preferred Line Style)      697
# 0xa1, 0x02,                    //   Collection (Logical)              699
# 0x15, 0x01,                    //    Logical Minimum (1)              701
# 0x25, 0x06,                    //    Logical Maximum (6)              703
# 0x09, 0x72,                    //    Usage (Ink)                      705
# 0x09, 0x73,                    //    Usage (Pencil)                   707
# 0x09, 0x74,                    //    Usage (Highlighter)              709
# 0x09, 0x75,                    //    Usage (Chisel Marker)            711
# 0x09, 0x76,                    //    Usage (Brush)                    713
# 0x09, 0x77,                    //    Usage (No preference)            715
# 0x81, 0x20,                    //    Input (Data,Arr,Abs,NoPref)      717
# 0xc0,                          //   End Collection                    719
# 0x06, 0x00, 0xff,              //   Usage Page (Vendor Defined Page 1) 720
# 0x09, 0x01,                    //   Usage (Vendor Usage 1)            723
# 0x15, 0x00,                    //   Logical Minimum (0)               725
# 0x27, 0xff, 0xff, 0x00, 0x00,  //   Logical Maximum (65535)           727
# 0x75, 0x10,                    //   Report Size (16)                  732
# 0x95, 0x01,                    //   Report Count (1)                  734
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              736
# 0x85, 0x09,                    //   Report ID (9)                     738
# 0x09, 0x81,                    //   Usage (Vendor Usage 0x81)         740
# 0xa1, 0x02,                    //   Collection (Logical)              742
# 0x09, 0x81,                    //    Usage (Vendor Usage 0x81)        744
# 0x15, 0x01,                    //    Logical Minimum (1)              746
# 0x25, 0x04,                    //    Logical Maximum (4)              748
# 0x09, 0x82,                    //    Usage (Vendor Usage 0x82)        750
# 0x09, 0x83,                    //    Usage (Vendor Usage 0x83)        752
# 0x09, 0x84,                    //    Usage (Vendor Usage 0x84)        754
# 0x09, 0x85,                    //    Usage (Vendor Usage 0x85)        756
# 0x81, 0x20,                    //    Input (Data,Arr,Abs,NoPref)      758
# 0xc0,                          //   End Collection                    760
# 0x85, 0x10,                    //   Report ID (16)                    761
# 0x09, 0x5c,                    //   Usage (Vendor Usage 0x5c)         763
# 0xa1, 0x02,                    //   Collection (Logical)              765
# 0x15, 0x00,                    //    Logical Minimum (0)              767
# 0x25, 0x01,                    //    Logical Maximum (1)              769
# 0x75, 0x08,                    //    Report Size (8)                  771
# 0x95, 0x01,                    //    Report Count (1)                 773
# 0x09, 0x38,                    //    Usage (Vendor Usage 0x38)        775
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           777
# 0x09, 0x5c,                    //    Usage (Vendor Usage 0x5c)        779
# 0x26, 0xff, 0x00,              //    Logical Maximum (255)            781
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           784
# 0x09, 0x5d,                    //    Usage (Vendor Usage 0x5d)        786
# 0x75, 0x01,                    //    Report Size (1)                  788
# 0x95, 0x01,                    //    Report Count (1)                 790
# 0x25, 0x01,                    //    Logical Maximum (1)              792
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           794
# 0x95, 0x07,                    //    Report Count (7)                 796
# 0xb1, 0x03,                    //    Feature (Cnst,Var,Abs)           798
# 0xc0,                          //   End Collection                    800
# 0x85, 0x11,                    //   Report ID (17)                    801
# 0x09, 0x5e,                    //   Usage (Vendor Usage 0x5e)         803
# 0xa1, 0x02,                    //   Collection (Logical)              805
# 0x09, 0x38,                    //    Usage (Vendor Usage 0x38)        807
# 0x15, 0x00,                    //    Logical Minimum (0)              809
# 0x25, 0x01,                    //    Logical Maximum (1)              811
# 0x75, 0x08,                    //    Report Size (8)                  813
# 0x95, 0x01,                    //    Report Count (1)                 815
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           817
# 0x09, 0x5e,                    //    Usage (Vendor Usage 0x5e)        819
# 0x26, 0xff, 0x00,              //    Logical Maximum (255)            821
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           824
# 0x09, 0x5f,                    //    Usage (Vendor Usage 0x5f)        826
# 0x75, 0x01,                    //    Report Size (1)                  828
# 0x25, 0x01,                    //    Logical Maximum (1)              830
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           832
# 0x75, 0x07,                    //    Report Size (7)                  834
# 0xb1, 0x03,                    //    Feature (Cnst,Var,Abs)           836
# 0xc0,                          //   End Collection                    838
# 0x85, 0x12,                    //   Report ID (18)                    839
# 0x09, 0x70,                    //   Usage (Vendor Usage 0x70)         841
# 0xa1, 0x02,                    //   Collection (Logical)              843
# 0x75, 0x08,                    //    Report Size (8)                  845
# 0x95, 0x01,                    //    Report Count (1)                 847
# 0x15, 0x00,                    //    Logical Minimum (0)              849
# 0x25, 0x01,                    //    Logical Maximum (1)              851
# 0x09, 0x38,                    //    Usage (Vendor Usage 0x38)        853
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           855
# 0x09, 0x70,                    //    Usage (Vendor Usage 0x70)        857
# 0xa1, 0x02,                    //    Collection (Logical)             859
# 0x25, 0x06,                    //     Logical Maximum (6)             861
# 0x09, 0x72,                    //     Usage (Vendor Usage 0x72)       863
# 0x09, 0x73,                    //     Usage (Vendor Usage 0x73)       865
# 0x09, 0x74,                    //     Usage (Vendor Usage 0x74)       867
# 0x09, 0x75,                    //     Usage (Vendor Usage 0x75)       869
# 0x09, 0x76,                    //     Usage (Vendor Usage 0x76)       871
# 0x09, 0x77,                    //     Usage (Vendor Usage 0x77)       873
# 0xb1, 0x20,                    //     Feature (Data,Arr,Abs,NoPref)   875
# 0xc0,                          //    End Collection                   877
# 0x09, 0x71,                    //    Usage (Vendor Usage 0x71)        878
# 0x75, 0x01,                    //    Report Size (1)                  880
# 0x25, 0x01,                    //    Logical Maximum (1)              882
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           884
# 0x75, 0x07,                    //    Report Size (7)                  886
# 0xb1, 0x03,                    //    Feature (Cnst,Var,Abs)           888
# 0xc0,                          //   End Collection                    890
# 0x85, 0x13,                    //   Report ID (19)                    891
# 0x09, 0x80,                    //   Usage (Vendor Usage 0x80)         893
# 0x15, 0x00,                    //   Logical Minimum (0)               895
# 0x25, 0xff,                    //   Logical Maximum (255)             897
# 0x75, 0x40,                    //   Report Size (64)                  899
# 0x95, 0x01,                    //   Report Count (1)                  901
# 0xb1, 0x02,                    //   Feature (Data,Var,Abs)            903
# 0x85, 0x14,                    //   Report ID (20)                    905
# 0x09, 0x44,                    //   Usage (Vendor Usage 0x44)         907
# 0xa1, 0x02,                    //   Collection (Logical)              909
# 0x09, 0x38,                    //    Usage (Vendor Usage 0x38)        911
# 0x75, 0x08,                    //    Report Size (8)                  913
# 0x95, 0x01,                    //    Report Count (1)                 915
# 0x25, 0x01,                    //    Logical Maximum (1)              917
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           919
# 0x15, 0x01,                    //    Logical Minimum (1)              921
# 0x25, 0x03,                    //    Logical Maximum (3)              923
# 0x09, 0x44,                    //    Usage (Vendor Usage 0x44)        925
# 0xa1, 0x02,                    //    Collection (Logical)             927
# 0x09, 0xa4,                    //     Usage (Vendor Usage 0xa4)       929
# 0x09, 0x44,                    //     Usage (Vendor Usage 0x44)       931
# 0x09, 0x5a,                    //     Usage (Vendor Usage 0x5a)       933
# 0x09, 0x45,                    //     Usage (Vendor Usage 0x45)       935
# 0x09, 0xa3,                    //     Usage (Vendor Usage 0xa3)       937
# 0xb1, 0x20,                    //     Feature (Data,Arr,Abs,NoPref)   939
# 0xc0,                          //    End Collection                   941
# 0x09, 0x5a,                    //    Usage (Vendor Usage 0x5a)        942
# 0xa1, 0x02,                    //    Collection (Logical)             944
# 0x09, 0xa4,                    //     Usage (Vendor Usage 0xa4)       946
# 0x09, 0x44,                    //     Usage (Vendor Usage 0x44)       948
# 0x09, 0x5a,                    //     Usage (Vendor Usage 0x5a)       950
# 0x09, 0x45,                    //     Usage (Vendor Usage 0x45)       952
# 0x09, 0xa3,                    //     Usage (Vendor Usage 0xa3)       954
# 0xb1, 0x20,                    //     Feature (Data,Arr,Abs,NoPref)   956
# 0xc0,                          //    End Collection                   958
# 0x09, 0x45,                    //    Usage (Vendor Usage 0x45)        959
# 0xa1, 0x02,                    //    Collection (Logical)             961
# 0x09, 0xa4,                    //     Usage (Vendor Usage 0xa4)       963
# 0x09, 0x44,                    //     Usage (Vendor Usage 0x44)       965
# 0x09, 0x5a,                    //     Usage (Vendor Usage 0x5a)       967
# 0x09, 0x45,                    //     Usage (Vendor Usage 0x45)       969
# 0x09, 0xa3,                    //     Usage (Vendor Usage 0xa3)       971
# 0xb1, 0x20,                    //     Feature (Data,Arr,Abs,NoPref)   973
# 0xc0,                          //    End Collection                   975
# 0xc0,                          //   End Collection                    976
# 0x85, 0x15,                    //   Report ID (21)                    977
# 0x75, 0x08,                    //   Report Size (8)                   979
# 0x95, 0x01,                    //   Report Count (1)                  981
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           983
# 0x09, 0x90,                    //   Usage (Transducer Software Info.) 985
# 0xa1, 0x02,                    //   Collection (Logical)              987
# 0x09, 0x38,                    //    Usage (Transducer Index)         989
# 0x25, 0x01,                    //    Logical Maximum (1)              991
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           993
# 0x09, 0x91,                    //    Usage (Transducer Vendor ID)     995
# 0x75, 0x10,                    //    Report Size (16)                 997
# 0x26, 0xff, 0x0f,              //    Logical Maximum (4095)           999
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           1002
# 0x09, 0x92,                    //    Usage (Transducer Product ID)    1004
# 0x75, 0x40,                    //    Report Size (64)                 1006
# 0x25, 0xff,                    //    Logical Maximum (255)            1008
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           1010
# 0x05, 0x06,                    //    Usage Page (Generic Device Controls) 1012
# 0x09, 0x2a,                    //    Usage (Software Version)         1014
# 0x75, 0x08,                    //    Report Size (8)                  1016
# 0x26, 0xff, 0x00,              //    Logical Maximum (255)            1018
# 0xa1, 0x02,                    //    Collection (Logical)             1021
# 0x09, 0x2d,                    //     Usage (Major)                   1023
# 0xb1, 0x02,                    //     Feature (Data,Var,Abs)          1025
# 0x09, 0x2e,                    //     Usage (Minor)                   1027
# 0xb1, 0x02,                    //     Feature (Data,Var,Abs)          1029
# 0xc0,                          //    End Collection                   1031
# 0xc0,                          //   End Collection                    1032
# 0x85, 0x16,                    //   Report ID (22)                    1033
# 0x05, 0x06,                    //   Usage Page (Generic Device Controls) 1035
# 0x09, 0x2b,                    //   Usage (Protocol Version)          1037
# 0xa1, 0x02,                    //   Collection (Logical)              1039
# 0x05, 0x0d,                    //    Usage Page (Digitizers)          1041
# 0x25, 0x01,                    //    Logical Maximum (1)              1043
# 0x09, 0x38,                    //    Usage (Transducer Index)         1045
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           1047
# 0x05, 0x06,                    //    Usage Page (Generic Device Controls) 1049
# 0x09, 0x2b,                    //    Usage (Protocol Version)         1051
# 0xa1, 0x02,                    //    Collection (Logical)             1053
# 0x09, 0x2d,                    //     Usage (Major)                   1055
# 0x26, 0xff, 0x00,              //     Logical Maximum (255)           1057
# 0xb1, 0x02,                    //     Feature (Data,Var,Abs)          1060
# 0x09, 0x2e,                    //     Usage (Minor)                   1062
# 0xb1, 0x02,                    //     Feature (Data,Var,Abs)          1064
# 0xc0,                          //    End Collection                   1066
# 0xc0,                          //   End Collection                    1067
# 0x85, 0x17,                    //   Report ID (23)                    1068
# 0x06, 0x00, 0xff,              //   Usage Page (Vendor Defined Page 1) 1070
# 0x09, 0x01,                    //   Usage (Vendor Usage 1)            1073
# 0xa1, 0x02,                    //   Collection (Logical)              1075
# 0x05, 0x0d,                    //    Usage Page (Digitizers)          1077
# 0x09, 0x38,                    //    Usage (Transducer Index)         1079
# 0x75, 0x08,                    //    Report Size (8)                  1081
# 0x95, 0x01,                    //    Report Count (1)                 1083
# 0x25, 0x01,                    //    Logical Maximum (1)              1085
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           1087
# 0x06, 0x00, 0xff,              //    Usage Page (Vendor Defined Page 1) 1089
# 0x09, 0x01,                    //    Usage (Vendor Usage 1)           1092
# 0x75, 0x10,                    //    Report Size (16)                 1094
# 0x27, 0xff, 0xff, 0x00, 0x00,  //    Logical Maximum (65535)          1096
# 0xb1, 0x02,                    //    Feature (Data,Var,Abs)           1101
# 0xc0,                          //   End Collection                    1103
# 0x85, 0x18,                    //   Report ID (24)                    1104
# 0x05, 0x0d,                    //   Usage Page (Digitizers)           1106
# 0x09, 0x38,                    //   Usage (Transducer Index)          1108
# 0x75, 0x08,                    //   Report Size (8)                   1110
# 0x95, 0x01,                    //   Report Count (1)                  1112
# 0x15, 0x00,                    //   Logical Minimum (0)               1114
# 0x25, 0x01,                    //   Logical Maximum (1)               1116
# 0xb1, 0x02,                    //   Feature (Data,Var,Abs)            1118
# 0xc0,                          //  End Collection                     1120
# 0xc0,                          // End Collection                      1121
# 0x06, 0xf0, 0xff,              // Usage Page (Vendor Usage Page 0xfff0) 1122
# 0x09, 0x01,                    // Usage (Vendor Usage 0x01)           1125
# 0xa1, 0x01,                    // Collection (Application)            1127
# 0x85, 0x0e,                    //  Report ID (14)                     1129
# 0x09, 0x01,                    //  Usage (Vendor Usage 0x01)          1131
# 0x15, 0x00,                    //  Logical Minimum (0)                1133
# 0x25, 0xff,                    //  Logical Maximum (255)              1135
# 0x75, 0x08,                    //  Report Size (8)                    1137
# 0x95, 0x40,                    //  Report Count (64)                  1139
# 0x91, 0x02,                    //  Output (Data,Var,Abs)              1141
# 0x09, 0x01,                    //  Usage (Vendor Usage 0x01)          1143
# 0x15, 0x00,                    //  Logical Minimum (0)                1145
# 0x25, 0xff,                    //  Logical Maximum (255)              1147
# 0x75, 0x08,                    //  Report Size (8)                    1149
# 0x95, 0x40,                    //  Report Count (64)                  1151
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               1153
# 0xc0,                          // End Collection                      1155
#
R: 1156 05 0d 09 04 a1 01 85 01 09 22 a1 02 55 0e 65 11 35 00 15 00 09
42 25 01 75 01 95 01 81 02 25 7f 09 30 75 07 81 42 95 01 75 08 09 51
81 02 75 10 05 01 26 20 1c 46 49 05 09 30 81 02 26 00 2d 46 76 08 09
31 81 02 05 0d 55 0f 75 08 25 ff 45 ff 09 48 81 42 09 49 81 42 55 0e
c0 09 22 a1 02 09 42 25 01 75 01 95 01 81 02 25 7f 09 30 75 07 81 42
95 01 75 08 09 51 81 02 75 10 05 01 26 20 1c 46 49 05 09 30 81 02 26
00 2d 46 76 08 09 31 81 02 05 0d 55 0f 75 08 25 ff 45 ff 09 48 81 42
09 49 81 42 55 0e c0 09 22 a1 02 09 42 25 01 75 01 95 01 81 02 25 7f
09 30 75 07 81 42 95 01 75 08 09 51 81 02 75 10 05 01 26 20 1c 46 49
05 09 30 81 02 26 00 2d 46 76 08 09 31 81 02 05 0d 55 0f 75 08 25 ff
45 ff 09 48 81 42 09 49 81 42 55 0e c0 09 22 a1 02 09 42 15 00 25 01
75 01 95 01 81 02 25 7f 09 30 75 07 81 42 75 08 09 51 95 01 81 02 05
01 26 20 1c 75 10 55 0e 65 11 09 30 35 00 46 49 05 81 02 26 00 2d 46
76 08 09 31 81 02 05 0d 55 0f 75 08 25 ff 45 ff 09 48 81 42 09 49 81
42 55 0e c0 09 22 a1 02 09 42 15 00 25 01 75 01 95 01 81 02 25 7f 09
30 75 07 81 42 75 08 09 51 95 01 81 02 05 01 26 20 1c 75 10 55 0e 65
11 09 30 35 00 46 49 05 81 02 26 00 2d 46 76 08 09 31 81 02 05 0d 55
0f 75 08 25 ff 45 ff 09 48 81 42 09 49 81 42 55 0e c0 09 54 15 00 25
7f 75 08 95 01 81 02 85 02 09 55 95 01 25 0a b1 02 85 03 06 00 ff 09
c5 15 00 26 ff 00 75 08 96 00 01 b1 02 c0 05 0d 09 02 a1 01 09 20 a1
00 85 08 05 01 a4 09 30 35 00 46 49 05 15 00 26 20 1c 55 0d 65 13 75
10 95 01 81 02 09 31 46 76 08 26 00 2d 81 02 b4 05 0d 09 38 95 01 75
08 15 00 25 01 81 02 09 30 75 10 26 ff 0f 81 02 09 31 81 02 09 42 09
44 09 5a 09 3c 09 45 09 32 75 01 95 06 25 01 81 02 95 02 81 03 09 3d
55 0e 65 14 36 d8 dc 46 28 23 16 d8 dc 26 28 23 95 01 75 10 81 02 09
3e 81 02 09 41 15 00 27 a0 8c 00 00 35 00 47 a0 8c 00 00 81 02 05 20
0a 53 04 65 00 16 01 f8 26 ff 07 75 10 95 01 81 02 0a 54 04 81 02 0a
55 04 81 02 0a 57 04 81 02 0a 58 04 81 02 0a 59 04 81 02 0a 72 04 81
02 0a 73 04 81 02 0a 74 04 81 02 05 0d 09 3b 15 00 25 64 75 08 81 02
09 5b 25 ff 75 40 81 02 06 00 ff 09 5b 75 20 81 02 05 0d 09 5c 26 ff
00 75 08 81 02 09 5e 81 02 09 70 a1 02 15 01 25 06 09 72 09 73 09 74
09 75 09 76 09 77 81 20 c0 06 00 ff 09 01 15 00 27 ff ff 00 00 75 10
95 01 81 02 85 09 09 81 a1 02 09 81 15 01 25 04 09 82 09 83 09 84 09
85 81 20 c0 85 10 09 5c a1 02 15 00 25 01 75 08 95 01 09 38 b1 02 09
5c 26 ff 00 b1 02 09 5d 75 01 95 01 25 01 b1 02 95 07 b1 03 c0 85 11
09 5e a1 02 09 38 15 00 25 01 75 08 95 01 b1 02 09 5e 26 ff 00 b1 02
09 5f 75 01 25 01 b1 02 75 07 b1 03 c0 85 12 09 70 a1 02 75 08 95 01
15 00 25 01 09 38 b1 02 09 70 a1 02 25 06 09 72 09 73 09 74 09 75 09
76 09 77 b1 20 c0 09 71 75 01 25 01 b1 02 75 07 b1 03 c0 85 13 09 80
15 00 25 ff 75 40 95 01 b1 02 85 14 09 44 a1 02 09 38 75 08 95 01 25
01 b1 02 15 01 25 03 09 44 a1 02 09 a4 09 44 09 5a 09 45 09 a3 b1 20
c0 09 5a a1 02 09 a4 09 44 09 5a 09 45 09 a3 b1 20 c0 09 45 a1 02 09
a4 09 44 09 5a 09 45 09 a3 b1 20 c0 c0 85 15 75 08 95 01 05 0d 09 90
a1 02 09 38 25 01 b1 02 09 91 75 10 26 ff 0f b1 02 09 92 75 40 25 ff
b1 02 05 06 09 2a 75 08 26 ff 00 a1 02 09 2d b1 02 09 2e b1 02 c0 c0
85 16 05 06 09 2b a1 02 05 0d 25 01 09 38 b1 02 05 06 09 2b a1 02 09
2d 26 ff 00 b1 02 09 2e b1 02 c0 c0 85 17 06 00 ff 09 01 a1 02 05 0d
09 38 75 08 95 01 25 01 b1 02 06 00 ff 09 01 75 10 27 ff ff 00 00 b1
02 c0 85 18 05 0d 09 38 75 08 95 01 15 00 25 01 b1 02 c0 c0 06 f0 ff
09 01 a1 01 85 0e 09 01 15 00 25 ff 75 08 95 40 91 02 09 01 15 00 25
ff 75 08 95 40 81 02 c0
N: hid-over-i2c 27C6:0E30
I: 18 27c6 0e30
E: 000000.000000 54 08 16 15 ae 08 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.005454 54 08 16 15 ae 08 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.011048 54 08 14 15 ac 08 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.016320 54 08 14 15 aa 08 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.024715 54 08 14 15 a8 08 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.027161 54 08 f2 14 24 08 01 3c 07 ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.031904 54 08 f0 14 22 08 01 84 09 ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.040924 54 08 ee 14 1c 08 01 cc 0b ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.042955 54 08 ec 14 12 08 01 4c 0e ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.047911 54 08 e8 14 08 08 01 bd 0e ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.056464 54 08 e4 14 fc 07 01 2d 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.058799 54 08 e0 14 f0 07 01 7c 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.063958 54 08 dc 14 e4 07 01 a8 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.072602 54 08 d8 14 d8 07 01 d4 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.074874 54 08 d4 14 ce 07 01 e8 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.079908 54 08 d0 14 c6 07 01 e4 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.088489 54 08 ce 14 c2 07 01 e0 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.090911 54 08 d0 14 be 07 01 b1 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.095939 54 08 d8 14 c0 07 01 56 0f ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.104473 54 08 e6 14 ca 07 01 fa 0e ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.106837 54 08 f0 14 ce 07 01 1d 0e ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.111904 54 08 fe 14 d0 07 01 bd 0c ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.120686 54 08 12 15 cc 07 01 5d 0b ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.122856 54 08 12 15 cc 07 01 ad 0a ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.127829 54 08 12 15 cc 07 01 ad 0a ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.136578 54 08 12 15 cc 07 01 ad 0a ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.138931 54 08 12 15 cc 07 01 ad 0a ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.143852 54 08 12 15 cc 07 01 ad 0a ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.152629 54 08 12 15 cc 07 01 ad 0a ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.154847 54 08 12 15 cc 07 01 ad 0a ff 0f 21 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.159911 54 08 12 15 cc 07 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.168683 54 08 1a 15 c2 07 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.170922 54 08 1c 15 c2 07 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.175933 54 08 1c 15 c0 07 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.184762 54 08 1c 15 c0 07 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.186924 54 08 1e 15 be 07 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.191979 54 08 1e 15 bc 07 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.200557 54 08 1e 15 bc 07 01 00 00 ff 0f 20 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.202744 54 08 00 00 80 04 01 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 07 ff 01 00 00 01
E: 000000.463807 54 08 92 04 b2 15 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00
