Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB5899AC6E
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 12:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391832AbfHWKGW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 06:06:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46974 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732134AbfHWKGV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 06:06:21 -0400
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3B5E9756
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 10:06:21 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id l17so9329678qtk.16
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 03:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vUUAeJTtmIxTNqg7kNNROuCzphWk1QF2DOAGWrCpWnQ=;
        b=H2PEfvpNkLQsBoUPTkzPzcW/my+tT4rx7Vbx0HlSHay7Dbm4ek/i3QCp1V/0D+uu+m
         +Doa8VC/6MyF/SdnKV2ZW8see8r3vnwPco17dU/GKuJViXTPH8DTdFceiZqZbvYt3L0m
         I0QZdlsOjJ8wcLRc05BV9KZDLcGFIb11d9VNLGIhWLVznZU5i5sdiJacSkO3Qp2d80BM
         ntwkaUHk4AernzV43lq5Zz2+rm+859ztZ2+hQZrMVEmuhVgUlb4ujkNok+wShQTkWBwD
         sMO9D80bV89a78cMI/GwUXHz4YexN6/7qtz/+/Zc0mdnotS05FPHFAUomdqOQMt4CX0X
         lIvQ==
X-Gm-Message-State: APjAAAUA7SEDQmwEFfDEHMeJbTLhfSYekmloDI4o5c90h9FMgT2guiQJ
        svt0Ave3rZFe6kRaQu/X/OGwUqmSGplmj1Ze+1bk83zX9WyfaXNuMF3sLkb4WpKHXxdKE4p9r8C
        lIZAt8KSa3bHceF71vInZ93+XTWpI7yt69P0OgP8=
X-Received: by 2002:a0c:ea4f:: with SMTP id u15mr3171947qvp.115.1566554780531;
        Fri, 23 Aug 2019 03:06:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5wdvO61FFMPBv7cBENwR71pjtOKIzpiJF9bqI6Dig5gj1cRdn0UNzY6fNdL3OJKVDZOFvuGqiNV3oIZX9WEM=
X-Received: by 2002:a0c:ea4f:: with SMTP id u15mr3171936qvp.115.1566554780277;
 Fri, 23 Aug 2019 03:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190812160804.11803-1-benjamin.tissoires@redhat.com> <f97403fd-4bf0-f82b-06e7-8bf4dcb2b2aa@redhat.com>
In-Reply-To: <f97403fd-4bf0-f82b-06e7-8bf4dcb2b2aa@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 23 Aug 2019 12:06:07 +0200
Message-ID: <CAO-hwJL2PeHNWsaPvWER7dSaG3iHPGZuWhLY54Z_dpTN=pBaPg@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: add support of the G700(s) receiver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 12, 2019 at 6:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 12-08-19 18:08, Benjamin Tissoires wrote:
> > Both the G700 and the G700s are sharing the same receiver.
> > Include support for this receiver in hid-logitech-dj so that userspace
> > can differentiate both.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> Nice, looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

thanks

Applied to for-5.4/logitech

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
>
>
> > ---
> >   drivers/hid/hid-logitech-dj.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> > index c547cba05fbb..d6250b0cb9f8 100644
> > --- a/drivers/hid/hid-logitech-dj.c
> > +++ b/drivers/hid/hid-logitech-dj.c
> > @@ -959,6 +959,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
> >               break;
> >       case 0x07:
> >               device_type = "eQUAD step 4 Gaming";
> > +             logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
> >               break;
> >       case 0x08:
> >               device_type = "eQUAD step 4 for gamepads";
> > @@ -1832,6 +1833,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
> >         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> >                        USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2),
> >        .driver_data = recvr_type_hidpp},
> > +     { /* Logitech G700(s) receiver (0xc531) */
> > +       HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> > +             0xc531),
> > +      .driver_data = recvr_type_gaming_hidpp},
> >       { /* Logitech lightspeed receiver (0xc539) */
> >         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> >               USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED),
> >
