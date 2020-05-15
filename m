Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84861D4754
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 09:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgEOHse (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 03:48:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21090 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726694AbgEOHse (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 03:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589528912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lrkIfwxeCEshEwlTxrSJjVZzwBnFuKqAWZhVkJHKVPc=;
        b=DiraknC33qeFjffEqUZXFKXhZMICr6E1iMEAgoQpYlo4BBg+6hw+U3ZGu0Mifd0iKOYoZe
        bjQVydays0JG0nx+4gJwQ5gkHKBdBJAWnbZ7d61F0NAcaRBXWt76/WJASuQuK8vnlRivxg
        JIp3Aj6HvQoCN36mgigQOAzfR0kPyWQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-38_ZdLfSNUGAwZ1b3GpE8A-1; Fri, 15 May 2020 03:48:30 -0400
X-MC-Unique: 38_ZdLfSNUGAwZ1b3GpE8A-1
Received: by mail-qv1-f71.google.com with SMTP id z1so1733631qvd.23
        for <linux-input@vger.kernel.org>; Fri, 15 May 2020 00:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lrkIfwxeCEshEwlTxrSJjVZzwBnFuKqAWZhVkJHKVPc=;
        b=ceU+7BIuTW/PdhtCEeMsoCFaKGKT9HihY5sqlRobrOaDwe3uA/A/1P9JOoJrKXQUwK
         GCG65sxtivek/JYqQmshMSfu87EsMCUAEgvqF4tbrYRWlJen6MxAcv02/Je8NY8zL1tx
         a88+hs0Uya8OFvIi2j1MkmnHVu3WN5bnYaYT0abQ5IJJsSNH0DfnRl5fZeHgC0vHOsBz
         Wg4EIiwgDQOqxmYGjCg7YCMJ5axG44eQk8/0dhJGCmYAdzzfbyKfDbHuCMTfPWkIkI1f
         5fAjXSx0d92YXk6dxTunVcFodhLvqWQu2RBU5nFuLRJq+y2/FZjZezzXVrsSeJKU5nZu
         cxFQ==
X-Gm-Message-State: AOAM533I+8oPUtAy0KjxyDr2PLVdEyDb2hcF/Fb/MxpcNrwKxu2ODv6h
        lKC9rG/F6x7QAnu4Ns6NT+gxqC/fwHb1c7v7flBgRy0634TwuAnFlYzggKXZyyqZFG2frTl/xa/
        2xdlSDTTBWCVsGZhc1CGrz5tdZmcvZUN65mI2ttk=
X-Received: by 2002:ac8:6edd:: with SMTP id f29mr2047663qtv.345.1589528910059;
        Fri, 15 May 2020 00:48:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw387Z4mFpYQMaigLmnc38PZNS3LcKkK3D3mkWbK6rvh+WwNGtUDHE7i5kLJQgehMJxE+xgWxvS80JI/uOKoG8=
X-Received: by 2002:ac8:6edd:: with SMTP id f29mr2047651qtv.345.1589528909731;
 Fri, 15 May 2020 00:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-hwJJjoEyoKokK6DS_Kb0su2bkC2wzMx-gzaWQcG+dn5vVdw@mail.gmail.com>
 <20200514224929.GA1026616@jelly>
In-Reply-To: <20200514224929.GA1026616@jelly>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 15 May 2020 09:48:18 +0200
Message-ID: <CAO-hwJ+FbXu2X7j3tCuKDtVp7UAmSz6m8nipZX4Je1CQf2TdQQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] HID: input: do not run GET_REPORT unless there's a
 Resolution Multiplier
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, Wen He <wen.he_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Peter,

On Fri, May 15, 2020 at 12:49 AM Peter Hutterer
<peter.hutterer@who-t.net> wrote:
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
> Same patch as before, but this time with diff.noprefix set to false again.
> Too bad that setting messes up format-patch :( Apologies for the broken
> one.

Thanks for the quick respin. I was about to apply it, and then I
realized that something was off (see inlined)

>
>  drivers/hid/hid-input.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index dea9cc65bf80..a54824d451bf 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
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

I think here we said that the reading of this particular feature was
mandatory by Microsoft, but what if a device doesn't like it.
I wonder if we should not guard this against HID_QUIRK_NO_INIT_REPORTS
too, in the event we need to quirk a particular device.

(BTW, I prefer this version compared to the first draft you sent me :-P )

Cheers,
Benjamin

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

