Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7357BFACFD
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 10:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKMJa5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 04:30:57 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54694 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727133AbfKMJaz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 04:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573637453;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KfiIJYnhwIPb8ies+GY26eVHRvipn+z/HevJMP92/8A=;
        b=XKiI/JubTH57aGQE9bXdRegVHcbKTV3OgcfykwYnPHoF6zIWlqntw/16GUEEtjzCLh+2wj
        5vFed1NHzrileFTAiqXsy/V/foxN/gCETx7qBbJ1LVC23pF2iVCXA7LWJ4BcaGW+5JutYD
        g84/lnJI/EbkbFSo7bj+1HWMSgvuTJA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-zpvWSOcHNra_bkn1c26FaQ-1; Wed, 13 Nov 2019 04:30:52 -0500
Received: by mail-qk1-f197.google.com with SMTP id r2so1105902qkb.2
        for <linux-input@vger.kernel.org>; Wed, 13 Nov 2019 01:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hz47sGg839T2K5KCo2tSAJMtBP36J6bni/N4ATh4qyY=;
        b=aq7/DmsT4XLYmaaX35TAqUtyAndJMOw+vUCYGwpDzYaakNSL1warSxZruggGh2s482
         YkvcrRkgxb74OAghc+EKeMsldFbitKlO829XOpNteTuHHKNRGBsVzXYjygvJ7NCAI7ap
         iDaGzdbHF+lt2SjFUn73U1gkm6dEEIQCo3Ev7r+CkcxV2PjM4L/EiAkyeyEcQ3Wtgjzg
         56CyB8kL1huvbKxyp6YlDZzmOYndZkM3Y3sQBj7/GYJDjhDK9X22Sa6yt0HSrr24JoJj
         PJ+mVle7//hRTAHcw0iHjRv/puER/wszuZAw3ucN6qlEbPUHRY7Ex5PrFfV2MAU5GKfb
         T4bw==
X-Gm-Message-State: APjAAAUBF0PwYUnSqQHb+4GyRd7N9OZBRaxnDwXWrDKqakHAI3KR6c0G
        4LUCRzPd/q8HH3FcJeAfgZaj2K5N7wM4hpJNNTuRVh8Y5CE85HZeKu9P8mA6YnULByi6Lld2CvA
        f7I2pk6DDDrXZs8nGLrjaqFguFRQkgD7rYK1yVGQ=
X-Received: by 2002:ac8:1c03:: with SMTP id a3mr1631533qtk.31.1573637451861;
        Wed, 13 Nov 2019 01:30:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQpDT1ZafGlHqigVXzWNpvKLF+xEID7Y+nNygKPNFImm3esWvrN1WNXzuqvEPRocHYM7fdnYrsZIt18L3KZ6U=
X-Received: by 2002:ac8:1c03:: with SMTP id a3mr1631512qtk.31.1573637451614;
 Wed, 13 Nov 2019 01:30:51 -0800 (PST)
MIME-Version: 1.0
References: <e1e05bd3-19f5-0dfe-66ad-70717c1c29c6@codeaurora.org>
In-Reply-To: <e1e05bd3-19f5-0dfe-66ad-70717c1c29c6@codeaurora.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 13 Nov 2019 10:30:39 +0100
Message-ID: <CAO-hwJLdz1sA4tNsLLgZKGA7Ko6dqt9VF5T2nh5uczHxU532HA@mail.gmail.com>
Subject: Re: Query regarding hid-multitouch.c driver in 4.14/4.19
To:     Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm-owner@vger.kernel.org, prsood@codeaurora.org,
        gkohli@codeaurora.org
X-MC-Unique: zpvWSOcHNra_bkn1c26FaQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Neeraj,

On Wed, Nov 13, 2019 at 4:11 AM Neeraj Upadhyay <neeraju@codeaurora.org> wr=
ote:
>
> Hi,
>
> I have one query regarding hid-multitouch.c driver and need your guidance=
 on
> how hid-multitouchc can restore/support the original behaviour, where, fo=
r
> devices, for which application is not
> HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD, and has
> HID_DG_CONTACTID usage in its report, can still use generic input mapping=
s.
>
> We are using kernel versions 4.14 , 4.19 respectively in 2 different
> projects:
>
> 4.14:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/dri=
vers/hid/hid-multitouch.c?h=3Dv4.14.153
> 4.19:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/dri=
vers/hid/hid-multitouch.c?h=3Dv4.19.83
>
> I checked the application for our hid device, it's HID_DG_PEN, device
> also has a HID_DG_CONTACTID usage defined in
>
> its report.
>
> In 4.19, is_mt_collection is set to 'true'. All multitouch code paths or
> input mapping is configured
>
> mt_allocate_report_data()
>          ...
>          for (n =3D 0; n < field->report_count; n++) {
>                          if (field->usage[n].hid =3D=3D HID_DG_CONTACTID)
>                                  rdata->is_mt_collection =3D true;   //
> is_mt_collection is set to 'true'
>                  }
>          }
>
> mt_input_mapping()
>          ...
>          if (rdata->is_mt_collection)
>              return mt_touch_input_mapping(...)  //
> mt_touch_input_mapping() is called
>
> mt_event()
>          if (rdata && rdata->is_mt_collection)
>              return mt_touch_event();  // mt_touch_event() is called
>
> However, in 4.14, the behaviour was different, mt input mapping was done
> only
> for HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD , and because our hid device is
> HID_DG_PEN, generic mappings were applied for it; with these settings,
> device
> responds to events.
>
> static int mt_input_mapping()
>          if (field->application =3D=3D HID_DG_TOUCHSCREEN ||
>              field->application =3D=3D HID_DG_TOUCHPAD)
>              return mt_touch_input_mapping();  // This is not called.
>
>
> mt_touch_input_mapping()
>          case HID_DG_CONTACTID:
>                          mt_store_field(usage, td, hi);
>                          td->touches_by_report++;
>                          td->mt_report_id =3D field->report->id; //
> mt_report_id is not set.
>                          return 1;
>
>
> Looks like this behaviour changed, with below commits:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/d=
rivers/hid/hid-multitouch.c?h=3Dv4.19.83&id=3D8dfe14b3b47ff832cb638731f9fc6=
96a3a84f804
> 8dfe14b3b47f    HID: multitouch: ditch mt_report_id
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/d=
rivers/hid/hid-multitouch.c?h=3Dv4.19.83&id=3Dba6b055e0f3b4ff4942e4ab273260=
affcfad9bff
> ba6b055e0f3b     HID: input: enable Totem on the Dell Canvas 27
>
> Can you please suggest on how we can support/preserve the original
> behaviour?

Hmm, I would initially say that a firmware that exports Contact ID for
a Pen is definitely wrong. The Contact ID usage has been introduced in
https://www.usb.org/sites/default/files/hutrr34.pdf and is
specifically for multi-touch, not multi pen.

Anyway, couple of questions:
- does the device supports multi-pen?
- can you share the report descriptor and a few events when triggering
this particular report (ideally with hid-recorder from
https://gitlab.freedesktop.org/libevdev/hid-tools/

Cheers,
Benjamin

>
>
> Thanks
> Neeraj
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member=
 of the Code Aurora Forum, hosted by The Linux Foundation
>

