Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535472F668B
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 18:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbhANQ5K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 11:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40547 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725854AbhANQ5K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 11:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610643344;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gvG5zeYdPdQqBKF9FmrREo7jRDxXjGDpbxv2RBHypZs=;
        b=iQnCay6XCRBjLHWBjINEC/g8PfbRN5LqaOcIv8cASUgpODr8jmBKtAheETD0g1J6D1S+1/
        C0f/bR6r0TJ0KEfCsTtkvwV+LgjEhzVzAe9hadRhvXqfhSzVQOXJqy9V1WKVMqlK20gcIa
        qs593xABRZtW4Xo33gOKYGr9RS0mvEc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-ao7tCfbrNXmp_4jc--M7mA-1; Thu, 14 Jan 2021 11:55:42 -0500
X-MC-Unique: ao7tCfbrNXmp_4jc--M7mA-1
Received: by mail-pg1-f197.google.com with SMTP id y34so4161505pgk.21
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 08:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gvG5zeYdPdQqBKF9FmrREo7jRDxXjGDpbxv2RBHypZs=;
        b=L0XqVJUW3aOH/0Yg3W35Q9qru8u9riRw7/VyzXUxO5cKaO+dqk8ReDeMkNPZNrZc1c
         W4PCc5wdpB5EREYFOS0EGaI4MdoLSNnHY2OKC96bXTFypqFo2aDug9StireK/RdHm1iQ
         8lcgIb86TxvgMGv+jdrNDE3Emt20EP2bxalBE5X9NC/BRxCoaFnrv5yIhzysPwAybnMY
         F+krkl4QL511bcaK2FAOZsQcjNsIidNyfa4+hlPL0Pj/keGbSYeWqctYainHdgHi+0O6
         mWeXUhLIW35Jn5K/HTnR6ezXr/ugzrZ0y+MhxSjQ76X9qq06bZYlrN5GpU+W1bY14EQI
         +RyQ==
X-Gm-Message-State: AOAM531uvIzkjgyKNF9/jduWOOv+xAXXys7NJD9D77j+KYF69fevopmS
        EgNTzQdCydttSzYuHAZzlKmjRa06VO0RQ1HkvBApa8CjfSSv0lKjdx0i6FEk+Vs5eAv2QsX7eHW
        0otItmWuGaMhf6k3NDhMXKCEndehU9ULclSO1hHA=
X-Received: by 2002:a63:fb54:: with SMTP id w20mr8241131pgj.419.1610643341610;
        Thu, 14 Jan 2021 08:55:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwj0oaq7wJPmqVtxpDoRv/ZxctQoIlcmNV5zS1xFqfYX9eVtayplFJFYkKx7xBoEQwcJX+8OJbUvk8DeA47OM=
X-Received: by 2002:a63:fb54:: with SMTP id w20mr8241119pgj.419.1610643341401;
 Thu, 14 Jan 2021 08:55:41 -0800 (PST)
MIME-Version: 1.0
References: <2b4c5881-2047-407f-8bb4-623d9bd167c7@www.fastmail.com>
In-Reply-To: <2b4c5881-2047-407f-8bb4-623d9bd167c7@www.fastmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 14 Jan 2021 17:55:30 +0100
Message-ID: <CAO-hwJ+iA2vMMVEukDFGg_L6RPSRVfEhnB71yaTf-yPgkxLLNg@mail.gmail.com>
Subject: Re: HID: multitouch: Set to high latency mode on suspend.
To:     =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bla=C5=BE,

On Sat, Dec 19, 2020 at 5:55 AM Bla=C5=BE Hrastnik <blaz@mxxn.io> wrote:
>
> Per Windows Precision Touchpad guidelines:
>
> > The latency mode feature report is sent by the host to a Windows
> > Precision Touchpad to indicate when high latency is desirable for
> > power savings and, conversely, when normal latency is desired for
> > operation.
> >
> > For USB-connected Windows Precision Touchpads, this enables the device
> > to disambiguate between being suspended for inactivity (runtime IDLE)
> > and being suspended because the system is entering S3 or Connected
> > Standby.
>
> The current implementation would set the latency to normal on device init=
ialization,
> but we didn't set the device to high latency on suspend.

Just a couple of quick questions, do you have any reason to implement
this besides just trying to match the specification?

Have you checked if Windows is doing the same thing?

Cheers,
Benjamin



>
> Signed-off-by: Bla=C5=BE Hrastnik <blaz@mxxn.io>
> ---
>  drivers/hid/hid-multitouch.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index d670bcd57..28bac0f39 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1746,6 +1746,13 @@ static int mt_probe(struct hid_device *hdev, const=
 struct hid_device_id *id)
>  }
>
>  #ifdef CONFIG_PM
> +static int mt_suspend(struct hid_device *hdev, pm_message_t state)
> +{
> +       /* High latency is desirable for power savings during S3/S0ix */
> +       mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
> +       return 0;
> +}
> +
>  static int mt_reset_resume(struct hid_device *hdev)
>  {
>         mt_release_contacts(hdev);
> @@ -1761,6 +1768,8 @@ static int mt_resume(struct hid_device *hdev)
>
>         hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
>
> +       mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> +
>         return 0;
>  }
>  #endif
> @@ -2150,6 +2159,7 @@ static struct hid_driver mt_driver =3D {
>         .event =3D mt_event,
>         .report =3D mt_report,
>  #ifdef CONFIG_PM
> +       .suspend =3D mt_suspend,
>         .reset_resume =3D mt_reset_resume,
>         .resume =3D mt_resume,
>  #endif
> --
> 2.29.2
>

