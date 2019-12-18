Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 998F51249F3
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 15:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfLROoY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 09:44:24 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55843 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726921AbfLROoY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 09:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576680263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=joJVqPDloIrR1QDlqpej3wOFdp1Q41SUYVLzur/FTuo=;
        b=DBCVn91pDVjd2srODsEoaifW94Jpq8qHimAvVUJBw0D63/48fEa29e7r4jV13FAO5rUxHe
        unzcYlf2Q7jsobARw1DlOzgoGz8fSC6h/aEJFVvagvFoItK52m9xh7yQEBBVCTeZB39bm/
        kbrNWWllilbeBmRfcmIlV4zSmQxCkJk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-bPjYXIkXPB66yNzJ9DLZnA-1; Wed, 18 Dec 2019 09:44:21 -0500
X-MC-Unique: bPjYXIkXPB66yNzJ9DLZnA-1
Received: by mail-qt1-f200.google.com with SMTP id e8so1513542qtg.9
        for <linux-input@vger.kernel.org>; Wed, 18 Dec 2019 06:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=joJVqPDloIrR1QDlqpej3wOFdp1Q41SUYVLzur/FTuo=;
        b=H7xBDm6daclfUioyS9BZlGwNu3/mizOR2Q+lgrCQWN+0YzP2OWsrxzKeQTkbaXplIq
         BKZdIGpuIFmJvBhqpA12oAy5pk+3MRDYkZ25YxFSgmnRUmqzl5RUEzNDRQqOnjtmBVfP
         qYcBvxiFZDfuPldFjri69auk/Fb/DNqzt2ApSB8NadBSiRsdsq4G1HsivcKl/yhoerJZ
         D24zcns3xmntTxRx5/P6lVu6UZm6Ps018vLKeJymNlk7GhXiIbt2xPfAMGIehAYr25qp
         smnSeKHzpiG6KOJtjY0zJGABSFvV19iuU4i4K9Bzm+bNtoQRHPHpZmKACW1M6ewqOZxt
         YuLg==
X-Gm-Message-State: APjAAAUr42ZRdKIuuPLJseSQYhhqf8meM6UqyqKeGfQuHgiDrzYNezkR
        sQaAu1NN8V/WNB9nn6gKCIN/Rn3VIbxFh4Eq6U9FoM2zuqL3XZVBmhG14MpIs1bFS5+h5n5rZ8y
        ZR9c9TI2VM5qLmQ5k7N/mxEWvMprSr3HUyOM8oak=
X-Received: by 2002:aed:20e5:: with SMTP id 92mr2466771qtb.294.1576680261089;
        Wed, 18 Dec 2019 06:44:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqwA2D58EayAhd0q01/R0PSPIzaG/BmW2J4URFqns/k5EB204vHrkCQjlDW8Kc73wq9TI84QwNIle+XiOgNEkFc=
X-Received: by 2002:aed:20e5:: with SMTP id 92mr2466752qtb.294.1576680260854;
 Wed, 18 Dec 2019 06:44:20 -0800 (PST)
MIME-Version: 1.0
References: <_0snBXtGhwWiRLYmuVIeDLYkvksMVMxiBv1lW_bTTaFpcVN45l6yCU5gWZ_5oJr8SQOZA6qCZSkVskkEX0ZePpboYtDYRsTdVg3xfcwmw6M=@protonmail.com>
 <haSzI6CpbhKWB-YGuSryCNj3sW6YXUkBlN1LZyy6pyoYPUD-Z7DwCkoRnVY-1iHX3FlxpsydH2YF_effQsePpDZnTp7937mNgvLVPjneUYY=@protonmail.com>
In-Reply-To: <haSzI6CpbhKWB-YGuSryCNj3sW6YXUkBlN1LZyy6pyoYPUD-Z7DwCkoRnVY-1iHX3FlxpsydH2YF_effQsePpDZnTp7937mNgvLVPjneUYY=@protonmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Dec 2019 15:44:09 +0100
Message-ID: <CAO-hwJJWwu3O1_qCdhEZ_yzd366x9JDvWFXpqb7=60LrDNWbxQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Logitech HID++ Bluetooth LE support
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mazin,

On Sun, Nov 24, 2019 at 10:05 PM Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> On Sunday, October 27, 2019 1:44 PM, Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> > This series allows hid-logitech-hidpp to support Bluetooth LE HID++
> > devices. Only the MX Master (b012 and b01e) is added right now but more
> > HID++ Bluetooth LE devices can be added once they are tested.
> >
> > Changes since [v7]:
> > - Squashed "HID: logitech-hidpp: Support MX Master (b012, b01e)
> > over Bluetooth" into "HID: logitech-hidpp: Support translations
> > from short to long reports"
> >
> > Changes since [v6]:
> >
> > - Based patch on "HID: logitech-hidpp: rework device validation"
> >
> > - Removed the need for additional quirks
> >
> > Changes since [v5]:
> >
> > - Fixed bug where added quirks would overflow an unsigned long
> >
> > - Changed the reserved quirk class bits from 0..20 to 0..15
> >
> > Changes since [v4]:
> >
> > - Omitted "HID: logitech: Add feature 0x0001: FeatureSet"
> >
> > - Stored WirelessDeviceStatus feature index in hidpp_device
> >
> > - Made Bluetooth quirk class alias quirks instead of vice versa
> >
> > - Omitted non-tested devices
> >
> > Changes since [v3]:
> >
> > - Renamed hidpp20_featureset_get_feature to
> > hidpp20_featureset_get_feature_id.
> >
> > - Re-ordered hidpp20_featureset_get_count and
> > hidpp20_featureset_get_feature_id based on their command IDs.
> >
> > - Made feature_count initialize to 0 before running
> > hidpp20_get_features.
> >
> > Changes since [v2]:
> >
> > - Split up the single patch into a series
> >
> > Changes since [v1]:
> >
> > - Added WirelessDeviceStatus support
> >
> > [v7] https://lore.kernel.org/lkml/t5LOL-A4W7aknqQdC-3TavitC94BY_Ra1qyxCZMh_nprrDNSl4UF-jYpWtaDSU-0oQ5xzRyAo9o_mvSnA78bib_p6I3ePSJnTrp3Eb0X_yg=@protonmail.com
> > [v6] https://lore.kernel.org/lkml/ggKipcQplIlTFmoP3hPnrQ-7_5-C0PKGd5feFymts3uenIBA8zOwz47YmKheD34H1rpkguDAGdx5YbS9UqpwfjT5Ir0Lji941liLVp--QtQ=@protonmail.com
> > [v5] https://lore.kernel.org/lkml/Mbf4goGxXZTfWwWtQQUke_rNf8kezpNOS9DVEVHf6RnnmjS1oRtMOJf4r14WfCC6GRYVs7gi0uZcIJ18Va2OJowzSbyMUGwLrl6I5fjW48o=@protonmail.com
> > [v4] https://lore.kernel.org/lkml/uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPrxNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=@protonmail.com
> > [v3] https://lore.kernel.org/lkml/l7xYjnA9EGfZe03FsrFhnH2aMq8qS8plWhHVvOtY_l4ShZ1NV6HA6hn9aI-jAzbLYUGFCIQCIKkx9z42Uoj4-AZDwBfRcAecYIn-0ZA5upE=@protonmail.com
> > [v2] https://www.spinics.net/lists/linux-input/msg63467.html
> > [v1] https://www.spinics.net/lists/linux-input/msg63317.html
> >
> > Mazin Rezk (2):
> > HID: logitech-hidpp: Support translations from short to long reports
> > HID: logitech-hidpp: Support WirelessDeviceStatus connect events
> >
> > drivers/hid/hid-logitech-hidpp.c | 69 +++++++++++++++++++++++++++-----
> > 1 file changed, 59 insertions(+), 10 deletions(-)
> >
> > ---
> > 2.23.0
>
> I recently saw "HID: logitech-hidpp: Silence intermittent
> get_battery_capacity errors" get applied into the kernel, would I need to
> rebase this patch on top of https://patchwork.kernel.org/patch/11243871/

No worries, your series still applies cleanly (git magic).

I am in the process of doing some final tests for this series, and I
plan to merge it for 5.6. Sorry we missed 5.5.

Cheers,
Benjamin

>
> Thanks,
> Mazin
>

