Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A2E1D2FCF
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 14:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgENMbb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 08:31:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28495 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726037AbgENMba (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 08:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589459489;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IC7wNvc1KoCN385ncv17shCU85JeTnTd4QoMBztI0Zs=;
        b=C4X3PJpgavCFRlBhhFc8FvTRHf5H6dphbADxiAo/blNM+oLjNCY6GVYAMsOBObf1hp7V5s
        T0fLN6zsq8u01MLPXRXKV/opY7TCzbcSm1XalI+DVoxbbykTMysNNsfHEJJbDzePOPLI91
        chmjxXLUwkf3d4wtYO4uzoVab/Wlab0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-4O3TBfemP_a3_oy72ToM_w-1; Thu, 14 May 2020 08:31:27 -0400
X-MC-Unique: 4O3TBfemP_a3_oy72ToM_w-1
Received: by mail-qv1-f71.google.com with SMTP id g15so2721393qvx.6
        for <linux-input@vger.kernel.org>; Thu, 14 May 2020 05:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IC7wNvc1KoCN385ncv17shCU85JeTnTd4QoMBztI0Zs=;
        b=nrUcNahzVTYSCJ4KNRry+Vsu61PVIPLBO1tTKpEFzxLAkNOXfXkcuk0rCC0eIFR4nN
         7vUCXqIi63yCMa1DSiorKmF0dSA/JkU3bxa8Yz59M50A+EGRG/S7OFrbSIF/ta6r0iG2
         NSJXk2QoU3R5KKk0laC8L0tdAmwFk9quhhqTBnrcY4SN7Wibv1yY5i0V0jaEfqJWqh07
         FeYZTi1hdZ+YFSr7N8a2Dv8tyn2T4q+aPzUeppNIvqLUJyuGh224MQd2N9NKAodVx4Jq
         YAmjnzGShtV+0x9xZ48c5hEc5L7K8SDKEKJZaC2QMCha0QFs4ZxAY5t8vCSywPMWJaYQ
         J+4A==
X-Gm-Message-State: AOAM5305pYMV8CCQAXOCgdkshHEzo+EEIaMNjvHH1NAGtK5DBeskoG8L
        24YVzzbxnXN+2tgVR0lzTu6OhA/eUxxyNV5pfRXIGV8eU2iCQAUC2iyLTG2sqfJ0t0XQ0euUKOD
        DbLzkDsYhmqy9ohyJpWXQRD6Gb4I12nShHWrfFyI=
X-Received: by 2002:ae9:f445:: with SMTP id z5mr4611463qkl.169.1589459487092;
        Thu, 14 May 2020 05:31:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk1B42zxQrUeJmu5JV1N3T+LBWqUNXdPbZWfwMHRdWpS6Wtm/WT8Uhcygn4Gg8AQsyb8LLXAkfGHHtK7HrX8A=
X-Received: by 2002:ae9:f445:: with SMTP id z5mr4611433qkl.169.1589459486735;
 Thu, 14 May 2020 05:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200514111448.GA855579@jelly>
In-Reply-To: <20200514111448.GA855579@jelly>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 14 May 2020 14:31:15 +0200
Message-ID: <CAO-hwJJjoEyoKokK6DS_Kb0su2bkC2wzMx-gzaWQcG+dn5vVdw@mail.gmail.com>
Subject: Re: [PATCH] HID: input: do not run GET_REPORT unless there's a
 Resolution Multiplier
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, Wen He <wen.he_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey,

On Thu, May 14, 2020 at 1:14 PM Peter Hutterer <peter.hutterer@who-t.net> wrote:
>
> hid-multitouch currently runs GET_REPORT for Contact Max and again to
> retrieve the Win8 blob. If both are within the same report, the
> Resolution Multiplier code calls GET_FEATURE again and this time,
> possibly due to timing, it causes the ILITEK-TP device interpret the
> GET_FEATURE as an instruction to change the mode and effectively stop
> the device from functioning as expected.
>
> Notably: the device doesn't even have a Resolution Multiplier so it
> shouldn't be affected by any of this at all.
>
> Fix this by making sure we only execute GET_REPORT if there is
> a Resolution Multiplier in the respective report.
>
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> Tested-by: Wen He <wen.he_1@nxp.com>
> ---
>  drivers/hid/hid-input.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git drivers/hid/hid-input.c drivers/hid/hid-input.c

Seems like you git format-patch is still busted, you are lacking the
'a/' and 'b/' in front of the files, and so the patch fails to apply
because 'hid/hid-input.c' is not in the tree.

Cheers,
Benjamin

> index dea9cc65bf80..a54824d451bf 100644
> --- drivers/hid/hid-input.c
> +++ drivers/hid/hid-input.c
> @@ -1560,21 +1560,12 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
>  {
>         struct hid_usage *usage;
>         bool update_needed = false;
> +       bool get_report_completed = false;
>         int i, j;
>
>         if (report->maxfield == 0)
>                 return false;
>
> -       /*
> -        * If we have more than one feature within this report we
> -        * need to fill in the bits from the others before we can
> -        * overwrite the ones for the Resolution Multiplier.
> -        */
> -       if (report->maxfield > 1) {
> -               hid_hw_request(hid, report, HID_REQ_GET_REPORT);
> -               hid_hw_wait(hid);
> -       }
> -
>         for (i = 0; i < report->maxfield; i++) {
>                 __s32 value = use_logical_max ?
>                               report->field[i]->logical_maximum :
> @@ -1593,6 +1584,17 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
>                         if (usage->hid != HID_GD_RESOLUTION_MULTIPLIER)
>                                 continue;
>
> +                       /*
> +                        * If we have more than one feature within this report we
> +                        * need to fill in the bits from the others before we can
> +                        * overwrite the ones for the Resolution Multiplier.
> +                        */
> +                       if (!get_report_completed && report->maxfield > 1) {
> +                               hid_hw_request(hid, report, HID_REQ_GET_REPORT);
> +                               hid_hw_wait(hid);
> +                               get_report_completed = true;
> +                       }
> +
>                         report->field[i]->value[j] = value;
>                         update_needed = true;
>                 }
> --
> 2.26.2
>

