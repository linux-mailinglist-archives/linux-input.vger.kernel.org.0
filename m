Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4B115C0C6
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 15:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgBMO5R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 09:57:17 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25382 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725781AbgBMO5R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 09:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581605835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OG+hnrSnkCgWf7UG021Y7MWPAq7aPjND81Zb6RKMks0=;
        b=ASHeKd4G1NISrcqezwbZKd03mykmxNrIwZmAS8pcNlP3CTA3lrKKvoHugX3O7xQ45kItx+
        9mpbLSFFWGpq1U5h629HwG1vCRGQKToZ164D534hiQ2uJfZ3QtUC055XUBKznyo7DBCYBC
        jVU6THMIBz0+GosFWpaFGcgtkJWlqYg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-FeZVajQwPwKMn7oCprtghw-1; Thu, 13 Feb 2020 09:57:08 -0500
X-MC-Unique: FeZVajQwPwKMn7oCprtghw-1
Received: by mail-qk1-f200.google.com with SMTP id z64so3868737qke.10
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2020 06:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OG+hnrSnkCgWf7UG021Y7MWPAq7aPjND81Zb6RKMks0=;
        b=tJCypuyMOWpeTx2s68hQAwnlkx3wL8MAaxYMwzBQDp5VO1w8Hen2pyr6OQyUn2w7zq
         /CTXXUyx0UDHNQZoNjtfYB6tsLWUeTkzHkt3au83JMiTJ19CHAXL9aYd3iARxCSzOHMF
         0bqGzO7G3UR9Nqo++/C71LTC+jK9GzHxtnOTLgmDRCT+UXGAW2I+YPyrIavncRxofx2G
         yXiBST1O2ZEvGoPRC/tm+zTqe/fKUr/DekKfaytYiO1a0bUrVu+Ar0E5d6C487Ct+AOq
         8iJY+seqFX4+q/2PEO4tPtVRjSVWd5UYlXEZmCNclhgx3C7FPVEcaozV5Loei7HrdkIR
         uiTg==
X-Gm-Message-State: APjAAAXri7+UaTYpofgm20TAyNsQ5JZFC5zHuTysqBuUSQoL0z07NzgB
        vssx+eFQVXNgxFOnBdpb9MSNDOmIWzKraSUS0jODcaTPdljxUnUbhMrYlFv5hh7EIUK2N1ctHLU
        wXD1D6o+2GwrIajld+KyZvztFRcMPP71e69AYy7A=
X-Received: by 2002:a0c:b61c:: with SMTP id f28mr12127445qve.101.1581605828169;
        Thu, 13 Feb 2020 06:57:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqw79GfvtUnCv32Ralzh9mb3Ib+MuApX3vGAqTZi5554x+i/wsufiurBMmJpzi5QIWYX18IaVCdLBTvAhDT4Dq0=
X-Received: by 2002:a0c:b61c:: with SMTP id f28mr12127419qve.101.1581605827808;
 Thu, 13 Feb 2020 06:57:07 -0800 (PST)
MIME-Version: 1.0
References: <1581476197-25854-1-git-send-email-Sandeep.Singh@amd.com> <1ce6f591-1e8b-8291-7f18-48876fd70e10@redhat.com>
In-Reply-To: <1ce6f591-1e8b-8291-7f18-48876fd70e10@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 13 Feb 2020 15:56:56 +0100
Message-ID: <CAO-hwJJkWkpApB-i0tHxEb0BeWcMpFLwSsOWKKdzGKnJEbHA_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] SFH: Add Support for AMD Sensor Fusion Hub
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sandeep Singh <Sandeep.Singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Nehal-bakulchandra.Shah@amd.com, Shyam-sundar.S-k@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Feb 12, 2020 at 3:45 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/12/20 3:56 AM, Sandeep Singh wrote:
> > From: Sandeep Singh <sandeep.singh@amd.com>
> >
> > AMD SFH(Sensor Fusion Hub) is HID based driver.SFH FW
> > is part of MP2 processor (MP2 which is an ARM=C2=AE Cortex-M4
> > core based co-processor to x86) and it runs on MP2 where
> > in driver resides on X86.The driver functionalities are
> > divided  into three parts:-
> >
> > 1: amd-mp2-pcie:-       This module will communicate with MP2 FW and
> >                          provide that data into DRAM.
> > 2: Client driver :-     This part for driver will use dram data and
> >                          convert that data into HID format based on
> >                          HID reports.
> > 3: Transport driver :-  This part of driver will communicate with
> >                          HID core. Communication between devices and
> >                          HID core is mostly done via HID reports
> >
> > In terms of architecture it is much more reassembles like
> > ISH(Intel Integrated Sensor Hub). However the major difference
> > is all the hid reports are generated as part of kernel driver.
> > AMD SFH driver taken reference from ISH in terms of
> > design and functionalities at fewer location.
> >
> > AMD sensor fusion Hub is part of a SOC 17h family based platforms.
> > The solution is working well on several OEM products.
> > AMD SFH uses HID over PCIe bus.
>
> I started looking at this patch because of the phoronix' news item on it.
>
> First of all I want to say that it is great that AMD is working on
> getting the Sensor Fusion Hub supported on Linux and that you are
> working on a driver for this.

Yep, couldn't agree more :)

>
> But, I've taken a quick look, mainly at the
> "[PATCH v3 5/5] SFH: Create HID report to Enable support of AMD sensor fu=
sion Hub (SFH)"
> patch.
>
> AFAIK with the Intel ISH the sensor-hub itself is actually providing
> HID descriptors and HID input reports.
>
> Looking at the AMD code, that does not seem to be the case, it seems
> the values come directly from the AMD sensor-hub without being in any
> HID specific form, e.g.:
>
> +u8 get_input_report(int sensor_idx, int report_id,
> +                   u8 *input_report, u32 *sensor_virt_addr)
> +{
> +       u8 report_size =3D 0;
> +       struct accel3_input_report acc_input;
> +       struct gyro_input_report gyro_input;
> +       struct magno_input_report magno_input;
> +       struct als_input_report als_input;
> +
> +       if (!sensor_virt_addr || !input_report)
> +               return report_size;
> +
> +       switch (sensor_idx) {
> +       case ACCEL_IDX: /* accel */
> +               acc_input.common_property.report_id =3D report_id;
> +               acc_input.common_property.sensor_state =3D
> +                                       HID_USAGE_SENSOR_STATE_READY_ENUM=
;
> +               acc_input.common_property.event_type =3D
> +                               HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
> +               acc_input.in_accel_x_value =3D (int)sensor_virt_addr[0] /
> +                                               AMD_SFH_FIRMWARE_MULTIPLI=
ER;
> +               acc_input.in_accel_y_value =3D (int)sensor_virt_addr[1] /
> +                                               AMD_SFH_FIRMWARE_MULTIPLI=
ER;
> +               acc_input.in_accel_z_value =3D  (int)sensor_virt_addr[2] =
/
> +                                               AMD_SFH_FIRMWARE_MULTIPLI=
ER;
> +               memcpy(input_report, &acc_input, sizeof(acc_input));
> +               report_size =3D sizeof(acc_input);
> +               break;
>
> And the descriptors are hardcoded in the driver so as to fake a HID
> device.
>
> So going through the HID subsystem seems like an unnecessary detour,
> which just makes things needlessly complex and harder to debug
> (and extend).
>
> The HID devices which the current patch-set is creating ultimately
> will result in a number of devices being created under
>
> /sys/bus/iio/devices
>
> And this are the devices which userspace uses to get the sensor data.
>
> IMHO instead of going through the HID subsys the AMD Sensor Fusion Hub
> driver should simply register 4 (*) iio-devices itself and directly
> pass the data through at the iio subsys level rather then going the
> long way around by creating a fake HID device which then gets
> attached to by the hid-sensor driver to ultimately create the same
> iio-devices.
>
> There are examples of e.g. various iio accel drivers under:
> drivers/iio/accel/ you could start with a simple driver supporting
> just the accelerometer bits and then extend things from there.
>
> Benjamin, Jiri, Jonathan, what is your take on this?

Hard to say without knowing AMD roadmap for that. If they intend to
have an ISH-like approach in the end with reports and descriptors
provided by the firmwares, then it makes sense to keep this
architecture for the first revision of devices.
If not, then yes, this is probably overkill compared to what needs to be do=
ne.

Sandeep, can you explain to us why you think using HID is the best way?

On a side note, I don't necessarily like patch 4/5 with the debugfs
interface. It's adding a kernel API for no gain, and we should already
have the debug API available in the various subsystems involved.

Cheers,
Benjamin




>
> Regards,
>
> Hans
>
>
> *) One for accel, gyra, magneto and light each
>
>
> > Sandeep Singh (5):
> >    SFH: Add maintainers and documentation for AMD SFH based on HID
> >      framework
> >    SFH: PCI driver to add support of AMD sensor fusion Hub using HID
> >      framework
> >    SFH: Transport Driver to add support of AMD Sensor Fusion Hub (SFH)
> >    SFH: Add debugfs support to AMD Sensor Fusion Hub
> >    SFH: Create HID report to Enable support of AMD sensor fusion Hub
> >      (SFH)
> >
> > Changes since v1:
> >          -Fix auto build test warnings
> >          -Fix warnings captured using smatch
> >          -Changes suggested by Dan Carpenter
> >
> > Links of the review comments for v1:
> >          [1] https://patchwork.kernel.org/patch/11325163/
> >          [2] https://patchwork.kernel.org/patch/11325167/
> >          [3] https://patchwork.kernel.org/patch/11325171/
> >          [4] https://patchwork.kernel.org/patch/11325187/
> >
> >
> > Changes since v2:
> >          -Debugfs divided into another patch
> >          -Fix some cosmetic changes
> >          -Fix for review comments
> >           Reported and Suggested by:-  Srinivas Pandruvada
> >
> > Links of the review comments for v2:
> >          [1] https://patchwork.kernel.org/patch/11355491/
> >          [2] https://patchwork.kernel.org/patch/11355495/
> >          [3] https://patchwork.kernel.org/patch/11355499/
> >          [4] https://patchwork.kernel.org/patch/11355503/
> >
> >
> >   Documentation/hid/amd-sfh-hid.rst                  | 160 +++++
> >   MAINTAINERS                                        |   8 +
> >   drivers/hid/Kconfig                                |   2 +
> >   drivers/hid/Makefile                               |   1 +
> >   drivers/hid/amd-sfh-hid/Kconfig                    |  20 +
> >   drivers/hid/amd-sfh-hid/Makefile                   |  17 +
> >   drivers/hid/amd-sfh-hid/amd_mp2_pcie.c             | 243 ++++++++
> >   drivers/hid/amd-sfh-hid/amd_mp2_pcie.h             | 177 ++++++
> >   drivers/hid/amd-sfh-hid/amdsfh-debugfs.c           | 250 ++++++++
> >   drivers/hid/amd-sfh-hid/amdsfh-debugfs.h           |  14 +
> >   drivers/hid/amd-sfh-hid/amdsfh-hid-client.c        | 260 +++++++++
> >   drivers/hid/amd-sfh-hid/amdsfh-hid.c               | 179 ++++++
> >   drivers/hid/amd-sfh-hid/amdsfh-hid.h               |  85 +++
> >   .../hid_descriptor/amd_sfh_hid_descriptor.c        | 275 +++++++++
> >   .../hid_descriptor/amd_sfh_hid_descriptor.h        | 125 ++++
> >   .../hid_descriptor/amd_sfh_hid_report_descriptor.h | 642 ++++++++++++=
+++++++++
> >   16 files changed, 2458 insertions(+)
> >   create mode 100644 Documentation/hid/amd-sfh-hid.rst
> >   create mode 100644 drivers/hid/amd-sfh-hid/Kconfig
> >   create mode 100644 drivers/hid/amd-sfh-hid/Makefile
> >   create mode 100644 drivers/hid/amd-sfh-hid/amd_mp2_pcie.c
> >   create mode 100644 drivers/hid/amd-sfh-hid/amd_mp2_pcie.h
> >   create mode 100644 drivers/hid/amd-sfh-hid/amdsfh-debugfs.c
> >   create mode 100644 drivers/hid/amd-sfh-hid/amdsfh-debugfs.h
> >   create mode 100644 drivers/hid/amd-sfh-hid/amdsfh-hid-client.c
> >   create mode 100644 drivers/hid/amd-sfh-hid/amdsfh-hid.c
> >   create mode 100644 drivers/hid/amd-sfh-hid/amdsfh-hid.h
> >   create mode 100644 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid=
_descriptor.c
> >   create mode 100644 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid=
_descriptor.h
> >   create mode 100644 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid=
_report_descriptor.h
> >
>

