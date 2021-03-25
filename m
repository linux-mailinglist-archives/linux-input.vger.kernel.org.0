Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E0B348B9F
	for <lists+linux-input@lfdr.de>; Thu, 25 Mar 2021 09:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCYIgI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 04:36:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53942 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229519AbhCYIf7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 04:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616661358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=77siEj0O9gAn2tDuVY1ZiSJ3nxXT0ceZkbZ53xn0jrs=;
        b=diAOKIL6LClhTYrEcF8lujHSp3fgudeRe1sLzoHoDVkUtn+HZgqHCPvbMkyrXMvP+AFHpb
        UckgqMGMsUHicXYWB6/z5UeKac/7GUS652pcSiaRImitLHEFrVajr+1BigoskPXgiS7rNG
        fAZd0XuPx9mEzh90ciYUrd6hylA82rk=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-u8EHSuxFMGmfsERAHWEA-w-1; Thu, 25 Mar 2021 04:35:46 -0400
X-MC-Unique: u8EHSuxFMGmfsERAHWEA-w-1
Received: by mail-pg1-f199.google.com with SMTP id f20so3402527pgj.6
        for <linux-input@vger.kernel.org>; Thu, 25 Mar 2021 01:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=77siEj0O9gAn2tDuVY1ZiSJ3nxXT0ceZkbZ53xn0jrs=;
        b=Il7yecAiZTi5xMQ3fGCY8bFbVHVV5axj2RrrcgZMuTMx4KO5rrWcS7obdjeMpa08BU
         ckO2IGXdazdYdDxfujZ8rQJUQ/WjbMCUl5J5UBbeo8zICEenhn7lhvW1FoLL3kkKl1/5
         l7h0kPaeDbpNpogGTN3BbaBoueT96Fo5xFLBi9YWRIajLeWMgm7Acy4AJM//y9fB7BS8
         PiPSoV6832j9H1plalp3EUT4LWHN9W8B1byVrO8A55e9C4A36xtjMKrgGJ5QfBi7fJ8S
         udQEcHRe4osl49WsMUCMoWC8qNUc1ZRmq5M02sDOhPTizE9MsyLp1/kWi57ArtmjWgUg
         uXtQ==
X-Gm-Message-State: AOAM5302M1MQOkbrPT/pbqcrPTXaIDJXVB7HqZHdXi2pza8V19kAVGgY
        qsLAPmc7hIcJenPzEsgYGGMlnxFHOCtGvWlZASZ6mxXuCnALh2GZ7HFEdnrlQnueKEZFPf7O3Y7
        V8IhbYmwRnnHjebFKoSrpmpPKVPKEUOR75Q1u18Q=
X-Received: by 2002:aa7:86c1:0:b029:203:900:2813 with SMTP id h1-20020aa786c10000b029020309002813mr6844956pfo.35.1616661344550;
        Thu, 25 Mar 2021 01:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH0rRWLHEsvJy8sGXbjELFCIg+fize0Dg0JfiYZ3moCtCFucOpXeVkBCMb8AYGewQN7kyUeaKgv4G+s2BYlZI=
X-Received: by 2002:aa7:86c1:0:b029:203:900:2813 with SMTP id
 h1-20020aa786c10000b029020309002813mr6844935pfo.35.1616661344150; Thu, 25 Mar
 2021 01:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <CALvoSf7L2tkrdg_rF0ZqbUv-H2TXnEudjSDUrts+MUs=Lvhpeg@mail.gmail.com>
In-Reply-To: <CALvoSf7L2tkrdg_rF0ZqbUv-H2TXnEudjSDUrts+MUs=Lvhpeg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 25 Mar 2021 09:35:33 +0100
Message-ID: <CAO-hwJ+6g9ADRpShG_HbQi5PGv6PLp-1wxJP7CSLT+1uJLB9OA@mail.gmail.com>
Subject: Re: Supporting 64-bit Digitizer Serial Numbers?
To:     Kenneth Albanowski <kenalba@google.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <Jason.Gerecke@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kenneth,

On Wed, Mar 24, 2021 at 8:53 PM Kenneth Albanowski <kenalba@google.com> wrote:
>
> Hi folks,
>
> I'm looking at being able to retrieve an accurate (not mangled or
> truncated) Digitizer.Transducer Serial Number from user-space, primarily
> through the power_supply node constructed for HID devices which expose
> Battery Strength.
>
> For the digitizers I'm looking at (USI) the Serial Number is a 64-bit
> report field, making it not fit directly into evdev, or the hid-input
> core.

Thanks for raising that issue. Before I jump into commenting on your
PoC, I'd like to ask you to provide the report descriptor of this
particular device (ideally with hid-recorder from the hid-tolls repo
below).
AFAICT, the HID spec we currently implement doesn't allow for data of
more than 32 bits (section 6.2.2.2 of
https://www.usb.org/sites/default/files/hid1_11.pdf).
The main problem is that a field is usually associated with a logical
max, and this part makes us limit the field up to 32bits.

There is a "long items" section right after (6.2.2.3) that allows for
longer data, and I don't think the current implementation supports it.

One other thing: this whole problem is very much a good candidate for
adding regression tests on
https://gitlab.freedesktop.org/libevdev/hid-tools.

So I'd be glad if we can work around the problem in the kernel *and*
add the matching test in hid-tools so we don't break this in the
future.

More comments inlined...

>
> I'm appending a proof-of-concept which implements this; I describe the
> details below. (This is based on 5.4, but it looks clean for 5.10 as
> well as relatively straightforward to backport.)
>
> I'd appreciate any feedback on this approach.
>
> My thought is to perform minimal modifications to allow hid-core to
> transfer reports up to 64-bits in size to hid-input, so that it can
> process this field and emit it to the power_supply integration, as well
> as through classic MSC_SERIAL (for the low 32 bits) and a new
> MSC_SERIAL2 (the upper bits) for applications which want it inline with
> stylus event data.

The wacom driver already has this problem and handles it in a creative
way (as usual ;-P)
If I am not mistaken, it splits the 64 bits serial on 2 events as
well: MSC_SERIAL and ABS_MISC (Jason might correct me here).

I am not saying this is what needs to be done, but just what some
userspace tools already expect.


>
> hid_field.value is expanded to an s64 array from s32, and there are
> a few knock-on effects to code that holds pointers to these fields.
> No other interfaces, in-kernel, or user-space, are modified to support
> HID reports/evdev events > 32 bits.

I also think both problems are orthogonal (which is why you haven't
tried to change the evdev protocol).

I don't think we can do much on the evdev side to support 64 bits or
bigger data.
Dmitry and Peter might find a good way to work around that, but I'm OK
with adding MSC_SERIAL_2 from my point of view.

>
> The Transducer Serial Number would show up as in the power_supply as a
> serial_number of "DG:0123456789ABCDEF" (or however many hex digits are
> warranted by the report size), and "DG:" being a fixed prefix -- we do
> know it is a digitizer.
>
> I realize this doesn't provide a scalable solution in the
> hid-core/hid-input code for (hypothetical) fields larger than 64 bits,
> although extending evdev with MSC_SERIAL3, 4, etc. would be trivial. (I
> don't have a good sense of how common these larger fields are, although
> obviously the code has survived until now with only 32-bit support, and
> one comment saying that anything larger than 16-bit is unusual.)

I would prefer having a generic solution for items longer than 32 bits
instead of having a special case for 64 bits only.

The spec allows for items longer than 32 bits (still section 6.2.2.3
of the HID spec) so we should probably handle that case in a generic
way to not have to deal with 128 bits next time a creative device
maker wants to use it.
The nice thing about the hid-tools test suite is that we can be
creative and produce this 128 bits new device, and have the tests for
it already :)

>
> (The other approach I was looking at was leaving hid_field.value
> unchanged, and instead just having hid-core recognize this particular
> 64 bit field, edit the hid_usage to turn it into a 2-count 32-bit field,
> apply a unique usage code to the second half, and then have hid-input
> recognize these usages and paste everything back together. This is
> scalable to larger fields, but is putting an unprecedented amount of
> magic in hid-core.)

Not really. There is already a lot of magic in hid-core, and handling
longer-than-32bits doesn't seem that far away. The report descriptor
should give us all the information we need, so we can surely have a
special case for long items and data. Also hid-input doesn't have to
be tied to evdev. So nothing prevents us to mark the field as being a
long one, and change the internal representation of the various 32
bits chunks of its data.

>
> The other change is MSC_SERIAL2 would be added: in the specific case of
> Usage(Digitizer.Transducer Serial Number) being present with
> report_size > 32 then MSC_SERIAL is reliably the full lowest 32 bits,
> and MSC_SERIAL2 is the next set of 32 bits; no clamping or scaling
> applied, regardless of what the descriptor says. Both MSC_SERIAL* are
> emitted for every hid record, there is no caching. If report_size <=
> 32, then there is no difference to existing behaviour, only MSC_SERIAL
> is emitted. I'm assuming the cost of one additional event per sync, for
> stylus data, is negligible.

I am not in the best position to comment, but as mentioned previously,
it works for me.

>
> This does potentially alter the generation of MSC_SERIAL on existing
> devices, but only ones where the report_size > 32 bits and the min/max
> is not 0/~0 -- user space would see unclamped values and conceivably
> could be surprised with a larger value in MSC_SERIAL than previously
> seen.

Honestly it shouldn't introduce any regressions. I still have to work
on the tablet side of the regression tests, but so far only Wacom was
reliably sending serial numbers (and bigger than 32 bits). So I am not
worried from this side of things.

>
> If changing MSC_SERIAL is deemed too risky for compatibility, then it's
> easy to just leave MSC_SERIAL as-is, and put in a separate MSC_SERIAL1
> (MSC_SERIAL0?) that has the pristine low bits -- just at a cost of yet
> one more MSC_ field per report, and using up the last MSC_ bit before
> we need to bump MSC_MAX.
>
> This approach doesn't affect Wacom evdev events at all, all of that
> logic is separate from hid-input.

There is a whole ecosystem for wacom, but we are pretty much in
control of all the pieces. So I would prefer involving wacom from the
beginning, and have a common representation to the user space.

Besides that, I skimmed through the  patch below. I do have comments,
but in addition to the above, they are mostly "hey this hunk should be
in its own separate patch". But I guess the final submission will have
this separation, so there is no real point in going too deep in the
details IMO.

Cheers,
Benjamin

>
> Kind regards and good health,
> - Kenneth Albanowski
>
> From 9948f77d758c5688d5ac5dee8f7218aa36cbd20d Mon Sep 17 00:00:00 2001
> From: Kenneth Albanowski <kenalba@google.com>
> Date: Mon, 22 Mar 2021 11:40:13 -0700
> Subject: [PATCH] input: limited 64-bit usages; MSC_SERIAL2,
>  POWER_SUPPLY_SERIAL_NUMBER
>
> Extend hid-core to process 64-bit usages, updating hid-input
> to recognize digitizer transducer serial numbers up to 64 bits,
> emitting MSC_SERIAL and MSC_SERIAL2 (new) for second 32-bit word.
>
> 64-bit usages are only fed to hid-input, all other existing
> frameworks and interfaces only see the traditional 32-bit
> truncated values; the majority of hid-input still only uses
> traditional 32-bit clamped values.
>
> Behaviour is changed only for HID reports that have
> Usage(Digitizer.TransducerSerialNumber) where size > 32 bits;
> logical min/max are no longer used to clamp the value, so
> MSC_SERIAL may be different from prior logic and now emits
> entire lowest 32-bits, instead of clamped value. Upper bits
> (32-64) are emitted to MSC_SERIAL2, also unclamped.
>
> power_supply integration extended to emit
> Digitizer.TransducerSerialNumber as POWER_SUPPLY_SERIAL_NUMBER
> in format: "DG:0123456789ABCDEF", with appropriate number of
> digits for actual field length.
>
> Change-Id: Ic8f9c90081f324ff76f34b0906bca1fcd5eac06a
> ---
>  Documentation/hid/hiddev.rst           |   6 +-
>  drivers/hid/hid-core.c                 |  80 +++++++++++---------
>  drivers/hid/hid-debug.c                |   4 +-
>  drivers/hid/hid-input.c                | 101 +++++++++++++++++++++++--
>  drivers/hid/hid-multitouch.c           |  22 +++---
>  drivers/hid/hid-sony.c                 |   2 +-
>  drivers/hid/usbhid/hid-pidff.c         |   2 +-
>  include/linux/hid-debug.h              |   2 +-
>  include/linux/hid.h                    |  13 +++-
>  include/uapi/linux/input-event-codes.h |   3 +-
>  10 files changed, 173 insertions(+), 62 deletions(-)
>
> diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
> index 209e6ba4e019e..06eee00847e50 100644
> --- a/Documentation/hid/hiddev.rst
> +++ b/Documentation/hid/hiddev.rst
> @@ -72,8 +72,10 @@ The hiddev API uses a read() interface, and a set
> of ioctl() calls.
>
>  HID devices exchange data with the host computer using data
>  bundles called "reports".  Each report is divided into "fields",
> -each of which can have one or more "usages".  In the hid-core,
> -each one of these usages has a single signed 32 bit value.
> +each of which can have one or more "usages". Each of these usages
> +is a single value, usually a signed 32 bit value, which is what
> +the hiddev API supports. (hid-core can process 64 bit values, but
> +these are not currently exposed through hiddev.)
>
>  read():
>  -------
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 1489f49dc53d0..5f4c7f06d0e96 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -101,14 +101,14 @@ static struct hid_field
> *hid_register_field(struct hid_report *report, unsigned
>
>   field = kzalloc((sizeof(struct hid_field) +
>   usages * sizeof(struct hid_usage) +
> - usages * sizeof(unsigned)), GFP_KERNEL);
> + usages * sizeof(s64)), GFP_KERNEL);
>   if (!field)
>   return NULL;
>
>   field->index = report->maxfield++;
>   report->field[field->index] = field;
>   field->usage = (struct hid_usage *)(field + 1);
> - field->value = (s32 *)(field->usage + usages);
> + field->value = (s64 *)(field->usage + usages);
>   field->report = report;
>
>   return field;
> @@ -337,7 +337,8 @@ static int hid_add_field(struct hid_parser
> *parser, unsigned report_type, unsign
>  }
>
>  /*
> - * Read data value from item.
> + * Read data value from global items, which are
> + * a maximum of 32 bits in size.
>   */
>
>  static u32 item_udata(struct hid_item *item)
> @@ -763,7 +764,7 @@ static u8 *fetch_item(__u8 *start, __u8 *end,
> struct hid_item *item)
>   return start;
>
>   case 3:
> - item->size++;
> + item->size = 4;
>   if ((end - start) < 4)
>   return NULL;
>   item->data.u32 = get_unaligned_le32(start);
> @@ -1016,7 +1017,7 @@ static int hid_calculate_multiplier(struct
> hid_device *hid,
>       struct hid_field *multiplier)
>  {
>   int m;
> - __s32 v = *multiplier->value;
> + __s64 v = *multiplier->value;
>   __s32 lmin = multiplier->logical_minimum;
>   __s32 lmax = multiplier->logical_maximum;
>   __s32 pmin = multiplier->physical_minimum;
> @@ -1299,27 +1300,17 @@ int hid_open_report(struct hid_device *device)
>  }
>  EXPORT_SYMBOL_GPL(hid_open_report);
>
> -/*
> - * Convert a signed n-bit integer to signed 32-bit integer. Common
> - * cases are done through the compiler, the screwed things has to be
> - * done by hand.
> - */
> -
> -static s32 snto32(__u32 value, unsigned n)
> +s32 hid_snto32(__u32 value, unsigned n)
>  {
> - switch (n) {
> - case 8:  return ((__s8)value);
> - case 16: return ((__s16)value);
> - case 32: return ((__s32)value);
> - }
> - return value & (1 << (n - 1)) ? value | (~0U << n) : value;
> + return sign_extend32(value, n);
>  }
> +EXPORT_SYMBOL_GPL(hid_snto32);
>
> -s32 hid_snto32(__u32 value, unsigned n)
> +s64 hid_snto64(__u64 value, unsigned n)
>  {
> - return snto32(value, n);
> + return sign_extend64(value, n);
>  }
> -EXPORT_SYMBOL_GPL(hid_snto32);
> +EXPORT_SYMBOL_GPL(hid_snto64);
>
>  /*
>   * Convert a signed 32-bit integer to a signed n-bit integer.
> @@ -1342,20 +1333,21 @@ static u32 s32ton(__s32 value, unsigned n)
>   * While the USB HID spec allows unlimited length bit fields in "report
>   * descriptors", most devices never use more than 16 bits.
>   * One model of UPS is claimed to report "LINEV" as a 32-bit field.
> + * Some digitizers report stylus transducer IDs as 64-bit fields.
>   * Search linux-kernel and linux-usb-devel archives for "hid-core extract".
>   */
>
> -static u32 __extract(u8 *report, unsigned offset, int n)
> +static u64 __extract(u8 *report, unsigned offset, int n)
>  {
>   unsigned int idx = offset / 8;
>   unsigned int bit_nr = 0;
>   unsigned int bit_shift = offset % 8;
>   int bits_to_copy = 8 - bit_shift;
> - u32 value = 0;
> - u32 mask = n < 32 ? (1U << n) - 1 : ~0U;
> + u64 value = 0;
> + u64 mask = n < 64 ? (1ULL << n) - 1 : ~0ULL;
>
>   while (n > 0) {
> - value |= ((u32)report[idx] >> bit_shift) << bit_nr;
> + value |= ((u64)report[idx] >> bit_shift) << bit_nr;
>   n -= bits_to_copy;
>   bit_nr += bits_to_copy;
>   bits_to_copy = 8;
> @@ -1366,6 +1358,10 @@ static u32 __extract(u8 *report, unsigned offset, int n)
>   return value & mask;
>  }
>
> +/*
> + * Classic HID code assumes 32-bit truncation for fields. Provided
> + * for compatibility and consistency of warnings.
> + */
>  u32 hid_field_extract(const struct hid_device *hid, u8 *report,
>   unsigned offset, unsigned n)
>  {
> @@ -1379,6 +1375,22 @@ u32 hid_field_extract(const struct hid_device
> *hid, u8 *report,
>  }
>  EXPORT_SYMBOL_GPL(hid_field_extract);
>
> +/*
> + * Extract larger, 64-bit fields.
> + */
> +u64 hid_field_extract64(const struct hid_device *hid, u8 *report,
> + unsigned offset, unsigned n)
> +{
> + if (n > 64) {
> + hid_warn_once(hid, "%s() called with n (%d) > 64! (%s)\n",
> +      __func__, n, current->comm);
> + n = 64;
> + }
> +
> + return __extract(report, offset, n);
> +}
> +EXPORT_SYMBOL_GPL(hid_field_extract64);
> +
>  /*
>   * "implement" : set bits in a little endian bit stream.
>   * Same concepts as "extract" (see comments above).
> @@ -1438,7 +1450,7 @@ static void implement(const struct hid_device
> *hid, u8 *report,
>   * Search an array for a value.
>   */
>
> -static int search(__s32 *array, __s32 value, unsigned n)
> +static int search(__s64 *array, __s64 value, unsigned n)
>  {
>   while (n--) {
>   if (*array++ == value)
> @@ -1497,7 +1509,7 @@ static int hid_match_usage(struct hid_device
> *hid, struct hid_usage *usage)
>  }
>
>  static void hid_process_event(struct hid_device *hid, struct hid_field *field,
> - struct hid_usage *usage, __s32 value, int interrupt)
> + struct hid_usage *usage, __s64 value, int interrupt)
>  {
>   struct hid_driver *hdrv = hid->driver;
>   int ret;
> @@ -1506,7 +1518,7 @@ static void hid_process_event(struct hid_device
> *hid, struct hid_field *field,
>   hid_dump_input(hid, usage, value);
>
>   if (hdrv && hdrv->event && hid_match_usage(hid, usage)) {
> - ret = hdrv->event(hid, field, usage, value);
> + ret = hdrv->event(hid, field, usage, (__s32)value);
>   if (ret != 0) {
>   if (ret < 0)
>   hid_err(hid, "%s's event failed with %d\n",
> @@ -1536,18 +1548,18 @@ static void hid_input_field(struct hid_device
> *hid, struct hid_field *field,
>   unsigned size = field->report_size;
>   __s32 min = field->logical_minimum;
>   __s32 max = field->logical_maximum;
> - __s32 *value;
> + __s64 *value;
>
> - value = kmalloc_array(count, sizeof(__s32), GFP_ATOMIC);
> + value = kmalloc_array(count, sizeof(__s64), GFP_ATOMIC);
>   if (!value)
>   return;
>
>   for (n = 0; n < count; n++) {
>
>   value[n] = min < 0 ?
> - snto32(hid_field_extract(hid, data, offset + n * size,
> + sign_extend64(hid_field_extract64(hid, data, offset + n * size,
>         size), size) :
> - hid_field_extract(hid, data, offset + n * size, size);
> + hid_field_extract64(hid, data, offset + n * size, size);
>
>   /* Ignore report if ErrorRollOver */
>   if (!(field->flags & HID_MAIN_ITEM_VARIABLE) &&
> @@ -1577,7 +1589,7 @@ static void hid_input_field(struct hid_device
> *hid, struct hid_field *field,
>   hid_process_event(hid, field, &field->usage[value[n] - min], 1, interrupt);
>   }
>
> - memcpy(field->value, value, count * sizeof(__s32));
> + memcpy(field->value, value, count * sizeof(__s64));
>  exit:
>   kfree(value);
>  }
> @@ -1672,7 +1684,7 @@ int hid_set_field(struct hid_field *field,
> unsigned offset, __s32 value)
>   return -1;
>   }
>   if (field->logical_minimum < 0) {
> - if (value != snto32(s32ton(value, size), size)) {
> + if (value != hid_snto32(s32ton(value, size), size)) {
>   hid_err(field->report->device, "value %d is out of range\n", value);
>   return -1;
>   }
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index 9453147d020db..badd51a8ea4ba 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -692,7 +692,7 @@ void hid_dump_report(struct hid_device *hid, int
> type, u8 *data,
>  }
>  EXPORT_SYMBOL_GPL(hid_dump_report);
>
> -void hid_dump_input(struct hid_device *hdev, struct hid_usage *usage,
> __s32 value)
> +void hid_dump_input(struct hid_device *hdev, struct hid_usage *usage,
> __s64 value)
>  {
>   char *buf;
>   int len;
> @@ -701,7 +701,7 @@ void hid_dump_input(struct hid_device *hdev,
> struct hid_usage *usage, __s32 valu
>   if (!buf)
>   return;
>   len = strlen(buf);
> - snprintf(buf + len, HID_DEBUG_BUFSIZE - len - 1, " = %d\n", value);
> + snprintf(buf + len, HID_DEBUG_BUFSIZE - len - 1, " = %lld\n", value);
>
>   hid_debug_event(hdev, buf);
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index bceccd75b488e..87ade0d6963cf 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -52,6 +52,7 @@ static const struct {
>  #define map_rel(c) hid_map_usage(hidinput, usage, &bit, &max, EV_REL, (c))
>  #define map_key(c) hid_map_usage(hidinput, usage, &bit, &max, EV_KEY, (c))
>  #define map_led(c) hid_map_usage(hidinput, usage, &bit, &max, EV_LED, (c))
> +#define map_msc(c) hid_map_usage(hidinput, usage, &bit, &max, EV_MSC, (c))
>
>  #define map_abs_clear(c) hid_map_usage_clear(hidinput, usage, &bit, \
>   &max, EV_ABS, (c))
> @@ -286,6 +287,7 @@ static enum power_supply_property
> hidinput_battery_props[] = {
>   POWER_SUPPLY_PROP_ONLINE,
>   POWER_SUPPLY_PROP_CAPACITY,
>   POWER_SUPPLY_PROP_MODEL_NAME,
> + POWER_SUPPLY_PROP_SERIAL_NUMBER,
>   POWER_SUPPLY_PROP_STATUS,
>   POWER_SUPPLY_PROP_SCOPE,
>  };
> @@ -402,6 +404,22 @@ static int hidinput_get_battery_property(struct
> power_supply *psy,
>   val->strval = dev->name;
>   break;
>
> + case POWER_SUPPLY_PROP_SERIAL_NUMBER:
> + /* Serial number does not have an active HID query
> + * mechanism like hidinput_query_battery_capacity, as the
> + * only devices expected to have serial numbers are digitizers,
> + * which are unlikely to be able to pull the serial number from
> + * an untethered pen on demand.
> + */
> + if (dev->battery_serial_number == 0) {
> + /* Make no claims about S/N format if we haven't actually seen a value yet. */
> + strcpy(dev->battery_serial_number_str, "");
> + } else {
> + snprintf(dev->battery_serial_number_str,
> sizeof(dev->battery_serial_number_str), "DG:%0*llX",
> (dev->battery_serial_number_bits+3)/4, dev->battery_serial_number);
> + }
> + val->strval = dev->battery_serial_number_str;
> + break;
> +
>   case POWER_SUPPLY_PROP_STATUS:
>   if (dev->battery_status != HID_BATTERY_REPORTED &&
>      !dev->battery_avoid_query) {
> @@ -485,6 +503,8 @@ static int hidinput_setup_battery(struct
> hid_device *dev, unsigned report_type,
>   dev->battery_max = max;
>   dev->battery_report_type = report_type;
>   dev->battery_report_id = field->report->id;
> + dev->battery_changed = false;
> + dev->battery_reported = false;
>
>   /*
>   * Stylus is normally not connected to the device and thus we
> @@ -526,7 +546,7 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
>   dev->battery = NULL;
>  }
>
> -static void hidinput_update_battery(struct hid_device *dev, int value)
> +static void hidinput_update_battery_capacity(struct hid_device *dev,
> __s32 value)
>  {
>   int capacity;
>
> @@ -538,11 +558,47 @@ static void hidinput_update_battery(struct
> hid_device *dev, int value)
>
>   capacity = hidinput_scale_battery_capacity(dev, value);
>
> + if (capacity != dev->battery_capacity) {
> + dev->battery_capacity = capacity;
> + dev->battery_changed = true;
> + }
> + dev->battery_reported = true;
> +}
> +
> +static void hidinput_update_battery_serial(struct hid_device *dev,
> __u64 value, int bits)
> +{
> + if (!dev->battery)
> + return;
> +
> + if (value == 0)
> + return;
> +
> + if (value != dev->battery_serial_number) {
> + dev->battery_serial_number = value;
> + dev->battery_serial_number_bits = bits;
> + dev->battery_changed = true;
> + }
> + dev->battery_reported = true;
> +}
> +
> +static void hidinput_flush_battery(struct hid_device *dev)
> +{
> + if (!dev->battery)
> + return;
> +
> + /* Only consider pushing a battery change if there is a
> + * battery field in this report.
> + */
> + if (!dev->battery_reported)
> + return;
> +
> + dev->battery_reported = false;
> +
>   if (dev->battery_status != HID_BATTERY_REPORTED ||
> -    capacity != dev->battery_capacity ||
> + dev->battery_changed ||
>      ktime_after(ktime_get_coarse(), dev->battery_ratelimit_time)) {
> - dev->battery_capacity = capacity;
>   dev->battery_status = HID_BATTERY_REPORTED;
> + dev->battery_changed = false;
>   dev->battery_ratelimit_time =
>   ktime_add_ms(ktime_get_coarse(), 30 * 1000);
>   power_supply_changed(dev->battery);
> @@ -559,7 +615,15 @@ static void hidinput_cleanup_battery(struct
> hid_device *dev)
>  {
>  }
>
> -static void hidinput_update_battery(struct hid_device *dev, int value)
> +static void hidinput_update_battery_capacity(struct hid_device *dev,
> __s32 value)
> +{
> +}
> +
> +static void hidinput_update_battery_serial(struct hid_device *dev,
> __u64 value, int bits)
> +{
> +}
> +
> +static void hidinput_flush_battery(struct hid_device *dev)
>  {
>  }
>  #endif /* CONFIG_HID_BATTERY_STRENGTH */
> @@ -850,6 +914,13 @@ static void hidinput_configure_usage(struct
> hid_input *hidinput, struct hid_fiel
>   usage->code = MSC_SERIAL;
>   bit = input->mscbit;
>   max = MSC_MAX;
> + if (field->report_size > 32) {
> + /* Deliver up to 64 bits of TransducerSerialNumber via
> + * MSC_SERIAL and MSC_SERIAL2.
> + */
> + set_bit(MSC_SERIAL2, input->mscbit);
> + set_bit(EV_MSC, input->evbit);
> + }
>   break;
>
>   default:  goto unknown;
> @@ -1243,7 +1314,7 @@ static void hidinput_configure_usage(struct
> hid_input *hidinput, struct hid_fiel
>
>  static void hidinput_handle_scroll(struct hid_usage *usage,
>     struct input_dev *input,
> -   __s32 value)
> +   __s64 value)
>  {
>   int code;
>   int hi_res, lo_res;
> @@ -1273,8 +1344,9 @@ static void hidinput_handle_scroll(struct
> hid_usage *usage,
>   input_event(input, EV_REL, usage->code, hi_res);
>  }
>
> -void hidinput_hid_event(struct hid_device *hid, struct hid_field
> *field, struct hid_usage *usage, __s32 value)
> +void hidinput_hid_event(struct hid_device *hid, struct hid_field
> *field, struct hid_usage *usage, __s64 value64)
>  {
> + __s32 value = value64;
>   struct input_dev *input;
>   unsigned *quirks = &hid->quirks;
>
> @@ -1282,15 +1354,28 @@ void hidinput_hid_event(struct hid_device
> *hid, struct hid_field *field, struct
>   return;
>
>   if (usage->type == EV_PWR) {
> - hidinput_update_battery(hid, value);
> + hidinput_update_battery_capacity(hid, value);
>   return;
>   }
> + if (usage->type == EV_MSC && usage->code == MSC_SERIAL) {
> + hidinput_update_battery_serial(hid, value64, field->report_size);
> + }
>
>   if (!field->hidinput)
>   return;
>
>   input = field->hidinput->input;
>
> + if (usage->type == EV_MSC && usage->code == MSC_SERIAL &&
> field->report_size > 32) {
> + /* min/max are limited to 32-bits by spec and cannot be relevant if field is
> + * this large, ignore them and send 64 bits through. We leave fields <= 32 bits
> + * to be processed later with normal clamping, for compatibility.
> + */
> + input_event(input, usage->type, MSC_SERIAL, (__u32)value64);
> + input_event(input, usage->type, MSC_SERIAL2, value64 >> 32);
> + return;
> + }
> +
>   if (usage->hat_min < usage->hat_max || usage->hat_dir) {
>   int hat_dir = usage->hat_dir;
>   if (!hat_dir)
> @@ -1415,6 +1500,8 @@ void hidinput_report_event(struct hid_device
> *hid, struct hid_report *report)
>  {
>   struct hid_input *hidinput;
>
> + hidinput_flush_battery(hid);
> +
>   if (hid->quirks & HID_QUIRK_NO_INPUT_SYNC)
>   return;
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index d91e6679afb18..23868a2e31187 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -95,11 +95,11 @@ static const __s32 mzero; /* default for 0 */
>
>  struct mt_usages {
>   struct list_head list;
> - __s32 *x, *y, *cx, *cy, *p, *w, *h, *a;
> - __s32 *contactid; /* the device ContactID assigned to this slot */
> - bool *tip_state; /* is the touch valid? */
> - bool *inrange_state; /* is the finger in proximity of the sensor? */
> - bool *confidence_state; /* is the touch made by a finger? */
> + __s64 *x, *y, *cx, *cy, *p, *w, *h, *a;
> + __s64 *contactid; /* the device ContactID assigned to this slot */
> + __s64 *tip_state; /* is the touch valid? */
> + __s64 *inrange_state; /* is the finger in proximity of the sensor? */
> + __s64 *confidence_state; /* is the touch made by a finger? */
>  };
>
>  struct mt_application {
> @@ -110,10 +110,10 @@ struct mt_application {
>
>   __s32 quirks;
>
> - __s32 *scantime; /* scantime reported */
> + __s64 *scantime; /* scantime reported */
>   __s32 scantime_logical_max; /* max value for raw scantime */
>
> - __s32 *raw_cc; /* contact count in the report */
> + __s64 *raw_cc; /* contact count in the report */
>   int left_button_state; /* left button state */
>   unsigned int mt_flags; /* flags to pass to input-mt */
>
> @@ -642,11 +642,11 @@ static struct mt_report_data
> *mt_find_report_data(struct mt_device *td,
>
>  static void mt_store_field(struct hid_device *hdev,
>     struct mt_application *application,
> -   __s32 *value,
> +   __s64 *value,
>     size_t offset)
>  {
>   struct mt_usages *usage;
> - __s32 **target;
> + __s64 **target;
>
>   if (list_empty(&application->mt_usages))
>   usage = mt_allocate_usage(hdev, application);
> @@ -658,7 +658,7 @@ static void mt_store_field(struct hid_device *hdev,
>   if (!usage)
>   return;
>
> - target = (__s32 **)((char *)usage + offset);
> + target = (__s64 **)((char *)usage + offset);
>
>   /* the value has already been filled, create a new slot */
>   if (*target != DEFAULT_TRUE &&
> @@ -675,7 +675,7 @@ static void mt_store_field(struct hid_device *hdev,
>   if (!usage)
>   return;
>
> - target = (__s32 **)((char *)usage + offset);
> + target = (__s64 **)((char *)usage + offset);
>   }
>
>   *target = value;
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index 2f073f5360706..6501f33dbc725 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -1827,7 +1827,7 @@ static void buzz_set_leds(struct sony_sc *sc)
>   &hdev->report_enum[HID_OUTPUT_REPORT].report_list;
>   struct hid_report *report = list_entry(report_list->next,
>   struct hid_report, list);
> - s32 *value = report->field[0]->value;
> + s64 *value = report->field[0]->value;
>
>   BUILD_BUG_ON(MAX_LEDS < 4);
>
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
> index fddac7c72f645..a8fb81cccb981 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -138,7 +138,7 @@ static const u8 pidff_effect_operation_status[] =
> { 0x79, 0x7b };
>
>  struct pidff_usage {
>   struct hid_field *field;
> - s32 *value;
> + s64 *value;
>  };
>
>  struct pidff_device {
> diff --git a/include/linux/hid-debug.h b/include/linux/hid-debug.h
> index ea7b23d13bfdf..280de6b7904e7 100644
> --- a/include/linux/hid-debug.h
> +++ b/include/linux/hid-debug.h
> @@ -16,7 +16,7 @@
>  #define HID_DEBUG_BUFSIZE 512
>  #define HID_DEBUG_FIFOSIZE 512
>
> -void hid_dump_input(struct hid_device *, struct hid_usage *, __s32);
> +void hid_dump_input(struct hid_device *, struct hid_usage *, __s64);
>  void hid_dump_report(struct hid_device *, int , u8 *, int);
>  void hid_dump_device(struct hid_device *, struct seq_file *);
>  void hid_dump_field(struct hid_field *, int, struct seq_file *);
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 58e635bf4ed09..f0520417a91d5 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -389,6 +389,7 @@ struct hid_item {
>
>  struct hid_global {
>   unsigned usage_page;
> + /* HID Global fields are constrained by spec to 32-bits */
>   __s32    logical_minimum;
>   __s32    logical_maximum;
>   __s32    physical_minimum;
> @@ -458,7 +459,7 @@ struct hid_field {
>   unsigned  report_size; /* size of this field in the report */
>   unsigned  report_count; /* number of this field in the report */
>   unsigned  report_type; /* (input,output,feature) */
> - __s32    *value; /* last known value(s) */
> + __s64    *value; /* last known value(s); 64-bit values are the
> largest we process */
>   __s32     logical_minimum;
>   __s32     logical_maximum;
>   __s32     physical_minimum;
> @@ -584,8 +585,13 @@ struct hid_device { /* device report descriptor */
>   __s32 battery_max;
>   __s32 battery_report_type;
>   __s32 battery_report_id;
> + __u64 battery_serial_number;
> + int battery_serial_number_bits; /* Actual number of digits in SN */
> + char battery_serial_number_str[20]; /* Space for "DG:" + max 16 hex digits */
>   enum hid_battery_status battery_status;
>   bool battery_avoid_query;
> + bool battery_changed;
> + bool battery_reported;
>   ktime_t battery_ratelimit_time;
>  #endif
>
> @@ -875,7 +881,7 @@ extern void hid_unregister_driver(struct hid_driver *);
>   module_driver(__hid_driver, hid_register_driver, \
>        hid_unregister_driver)
>
> -extern void hidinput_hid_event(struct hid_device *, struct hid_field
> *, struct hid_usage *, __s32);
> +extern void hidinput_hid_event(struct hid_device *, struct hid_field
> *, struct hid_usage *, __s64);
>  extern void hidinput_report_event(struct hid_device *hid, struct
> hid_report *report);
>  extern int hidinput_connect(struct hid_device *hid, unsigned int force);
>  extern void hidinput_disconnect(struct hid_device *);
> @@ -913,8 +919,11 @@ const struct hid_device_id
> *hid_match_device(struct hid_device *hdev,
>  bool hid_compare_device_paths(struct hid_device *hdev_a,
>        struct hid_device *hdev_b, char separator);
>  s32 hid_snto32(__u32 value, unsigned n);
> +s64 hid_snto64(__u64 value, unsigned n);
>  __u32 hid_field_extract(const struct hid_device *hid, __u8 *report,
>       unsigned offset, unsigned n);
> +__u64 hid_field_extract64(const struct hid_device *hid, __u8 *report,
> +     unsigned offset, unsigned n);
>
>  /**
>   * hid_device_io_start - enable HID input during probe, remove
> diff --git a/include/uapi/linux/input-event-codes.h
> b/include/uapi/linux/input-event-codes.h
> index 472cd5bc55676..612ca91a87326 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -816,12 +816,13 @@
>   * Misc events
>   */
>
> -#define MSC_SERIAL 0x00
> +#define MSC_SERIAL 0x00 /* First 32-bits of serial number */
>  #define MSC_PULSELED 0x01
>  #define MSC_GESTURE 0x02
>  #define MSC_RAW 0x03
>  #define MSC_SCAN 0x04
>  #define MSC_TIMESTAMP 0x05
> +#define MSC_SERIAL2 0x06 /* Second 32-bits of serial number */
>  #define MSC_MAX 0x07
>  #define MSC_CNT (MSC_MAX+1)
>
> --
> 2.29.2
>

