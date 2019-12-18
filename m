Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E933124C47
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 16:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfLRPyX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 10:54:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28224 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726985AbfLRPyX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 10:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576684462;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oBt3q5tDWb7mMBAZbMmFadoNaLdYgRriJv8G1o0LfIk=;
        b=dFKhCwQ2TYqoxbzO3UIkgX7UvxfHdlWkOs6scVU7in30q4fOv8BlA5KLQTJIUv17eDBsDI
        H4xouJCNmYJovdNGTln87m2lY92jzrsURwKlTRzHU2NC6aYB+JHduqQHV085/hx/JtsbNT
        cpxWZzBrqMzkuxsbxyD+ERaYw5k2Aqg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-DHdCZSqWNzqLbwQUDrKzMQ-1; Wed, 18 Dec 2019 10:54:21 -0500
X-MC-Unique: DHdCZSqWNzqLbwQUDrKzMQ-1
Received: by mail-qk1-f200.google.com with SMTP id f124so1570934qkb.22
        for <linux-input@vger.kernel.org>; Wed, 18 Dec 2019 07:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oBt3q5tDWb7mMBAZbMmFadoNaLdYgRriJv8G1o0LfIk=;
        b=Mwba82vQxlG/C5Xwy37pJ010U2k3bpw4crQ5Z/Nj0zdfDfjOxi29FJl4PPCuIbYgQP
         6+x3Yk4GhM5PHFqWEAAM2UoNOyXlL5/AkOG/JuY41NAo8DBnaIDPOTS0v6FJee3gnjtI
         hS16JWBs3V+TCjrHZ+Ddpgnq4M45EYIuJiLfMHbX/eH/jT9RUTY4NJ4TZGD+MrfO5KJU
         CpMhjE9XOTHccAzCUnYgN/JQ47Zxmn3Ov3Yit76x2ruPy9STvPV+s6pCw7YXb/XMqszM
         sbG+77qpV+HAx+5Uave/w/wPUPRHVpf/xJBFpDO4Kllhpn7i1xJzpt+P2HOg0Lj539X/
         Hn4w==
X-Gm-Message-State: APjAAAVB4aj/db48bt5hojoFjHZ4w2fWKUr7svp3wFEI4C29+nVKlSeb
        qsNwxKGxJMoAB3ceKspsS+ECq30umm7FgvKq3S6MfRC2bJz3WAjpkDTXlbBSUogXSCpdb8Hn2s7
        L9fBnMAA7mlcIwSIA6TBgSeSV5fFfXYNuGZBWmd0=
X-Received: by 2002:a05:620a:11a3:: with SMTP id c3mr3222033qkk.230.1576684460514;
        Wed, 18 Dec 2019 07:54:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqy88Ju6X0JTZo0hbxeY0gxnxVkGnr3ljAL2f2tju/lT8Vno8HmtNYXr2JVuE7E3pEaPiYdvs0dTmRTyYJfC5vE=
X-Received: by 2002:a05:620a:11a3:: with SMTP id c3mr3222019qkk.230.1576684460304;
 Wed, 18 Dec 2019 07:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20191216181857.10783-1-jason.gerecke@wacom.com>
In-Reply-To: <20191216181857.10783-1-jason.gerecke@wacom.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Dec 2019 16:54:09 +0100
Message-ID: <CAO-hwJLCvA3ZmncsC3t5W3vvhb0vcZg81mkeEXLgqiUmtk_HZQ@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Recognize new MobileStudio Pro PID
To:     "Gerecke, Jason" <killertofu@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 16, 2019 at 7:19 PM Gerecke, Jason <killertofu@gmail.com> wrote:
>
> From: Jason Gerecke <killertofu@gmail.com>
>
> A new PID is in use for repaired MobileStudio Pro devices. Add it to the
> list of devices that need special-casing in wacom_wac_pad_event.
>
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> ---

Thanks,

Applied to for-5.5/upstream-fixes

Cheers,
Benjamin

>  drivers/hid/wacom_wac.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index ccb74529bc78..d99a9d407671 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -2096,14 +2096,16 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
>                     (hdev->product == 0x34d || hdev->product == 0x34e ||  /* MobileStudio Pro */
>                      hdev->product == 0x357 || hdev->product == 0x358 ||  /* Intuos Pro 2 */
>                      hdev->product == 0x392 ||                            /* Intuos Pro 2 */
> -                    hdev->product == 0x398 || hdev->product == 0x399)) { /* MobileStudio Pro */
> +                    hdev->product == 0x398 || hdev->product == 0x399 ||  /* MobileStudio Pro */
> +                    hdev->product == 0x3AA)) {                           /* MobileStudio Pro */
>                         value = (field->logical_maximum - value);
>
>                         if (hdev->product == 0x357 || hdev->product == 0x358 ||
>                             hdev->product == 0x392)
>                                 value = wacom_offset_rotation(input, usage, value, 3, 16);
>                         else if (hdev->product == 0x34d || hdev->product == 0x34e ||
> -                                hdev->product == 0x398 || hdev->product == 0x399)
> +                                hdev->product == 0x398 || hdev->product == 0x399 ||
> +                                hdev->product == 0x3AA)
>                                 value = wacom_offset_rotation(input, usage, value, 1, 2);
>                 }
>                 else {
> --
> 2.24.1
>

