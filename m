Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6116171818
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 14:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgB0NAH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 08:00:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37093 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729036AbgB0NAH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 08:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582808406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yoC7+Q3k5WLnxp7SXHpb3nLNBOol+SI5ecqHeVBQT6o=;
        b=ZGEhpYwScSTEyOsrO+5V5uIMkh1lUJjDWDv6k/tkUUqA/MRgrqOzWXW4Nrr2ts5jJEu2f/
        /P01PNnnvLGlSGwjTmFXAzP3AlyaBgMmk1+ZPr3TgcIpIiiAmCUjiowXspKZdTMVHZAy16
        Y0RjcTKqicKxCZfUdW0LOmDXKMmRVTg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-jE6GbMJxMuKOKHf_rKNXcA-1; Thu, 27 Feb 2020 08:00:00 -0500
X-MC-Unique: jE6GbMJxMuKOKHf_rKNXcA-1
Received: by mail-qv1-f70.google.com with SMTP id g6so3602595qvp.0
        for <linux-input@vger.kernel.org>; Thu, 27 Feb 2020 05:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yoC7+Q3k5WLnxp7SXHpb3nLNBOol+SI5ecqHeVBQT6o=;
        b=DwWvp9AOjlImF1LVuV0XvdFH7lH8zUyJtRBHXsULjhLV9CNMdS3D6l2zwjEpX9whx3
         gXS2WXxa0vXl9D7fcWjwmvSgY/7JbtIMxJbNwlSKSl08qttek+0Ogasx8nlhOB0R5Y+Z
         Bfo+Nw+VZe4TY704aTD1y2s7rWexVepuSlN0KQ/iTXoYq368IaM6wxtaLRaSY8ywJ59x
         Ix1NVUJOesCX+vMrvyi3p9TFpGY6NXXVPehpOKowEznebdb2OpBn2IQBaVOfCEssIRSr
         rE3fzeUGgD7PYIQZtfmMUiRM63waJ1gFF3VYTats+aIEidapdc0OwO7rdm3mubqdPYgV
         +Kxw==
X-Gm-Message-State: APjAAAVUkGHW7RYkdSpI6/7VIo+WRbYbmkkg3SjfF+N4OTcTiym2KnVb
        zB54wZtUwDTgCF+rebdfK8d1uqGnmI2J3ykSGaaz1rfC+qVlnEbLtpnfSR4VLKDvOG24sEWYHLw
        wyf5Y7n1j0i7VPv2iCnvuf/f50WkcgiUUwOKEDsU=
X-Received: by 2002:a37:9d4f:: with SMTP id g76mr5470608qke.169.1582808400388;
        Thu, 27 Feb 2020 05:00:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyB1ZBwv26Y4cFnn7kCfXQx+GAZ2he0qsmK5T7PPrFu6gqCb7nTF+1RpD8WVb5jo6MI3w8uyYyLNKkU0qLlL0k=
X-Received: by 2002:a37:9d4f:: with SMTP id g76mr5470579qke.169.1582808400150;
 Thu, 27 Feb 2020 05:00:00 -0800 (PST)
MIME-Version: 1.0
References: <PR2PR03MB517975370D754EEF47E062BFE4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
In-Reply-To: <PR2PR03MB517975370D754EEF47E062BFE4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 27 Feb 2020 13:59:49 +0100
Message-ID: <CAO-hwJ+eua8-fNj9o8CxjFyM0i1+R9ZwPMroF9uLUH6NVu3Tdg@mail.gmail.com>
Subject: Re: [PATCH] Input: elantech - fix x_max/y_max values
To:     Bernd Edlinger <bernd.edlinger@hotmail.de>,
        "Dave.Wang" <dave.wang@emc.com.tw>, jingle <jingle.wu@emc.com.tw>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        Aaron Ma <aaron.ma@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bernd,

[adding Dave and Jingle]


On Thu, Feb 27, 2020 at 12:59 PM Bernd Edlinger
<bernd.edlinger@hotmail.de> wrote:
>
> Since 37548659bb2 moved the querying of the x_max/y_max

Hmm, I am pretty sure checkpatch.pl should have complained here: the
correct way of mentioning a previous commit is:
'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit
37548659bb22 ("Input: elantech - query the min/max information
beforehand too")'

> values from elantech_set_input_params to elantech_query_info,
> the returned x_max/y_max values are different than before,
> at least for some firmware versions.
>
> The reason is likely that this is now done before
> elantech_set_absolute_mode does run.  So it may happen that
> the returned values are exactly half of what they used to be,

That is weird. Can we get confirmation from Dave or Jingle about that?

> which makes input_report_abs in PS/2 mode report ABS_X values which
> exceed the x_max value, which is very annoying since the mouse stops
> to move then, and ABS_Y value become negative, which is benign.
>
> This was observed with a MSI GX70 laptop:
>
> elantech: assuming hardware version 3 (with firmware version 0x250f01)
> elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
> elantech: Elan sample query result 05, 0e, 00
> input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...
>
> Correct this by doubling the returned x_max and y_max
> value for this specific firmware version.
>
> Fixes: 37548659bb2 ("Input: elantech - query the min/max
> information beforehand too")

Stephen will complain here: see multiple google results when you
search for "lkml linux-next: Fixes tag needs some work"

Basically:
- SHA1 should be at least 12 digits long
- the commit title should not be split, even if it gets longer than 80 columns.

Cheers,
Benjamin

>
> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> ---
>  drivers/input/mouse/elantech.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 2d8434b..3399db8 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1720,6 +1720,10 @@ static int elantech_query_info(struct psmouse *psmouse,
>
>                 info->x_max = (0x0f & param[0]) << 8 | param[1];
>                 info->y_max = (0xf0 & param[0]) << 4 | param[2];
> +               if (info->fw_version == 0x250f01) {
> +                       info->x_max <<= 1;
> +                       info->y_max <<= 1;
> +               }
>                 break;
>
>         case 4:
> --
> 1.9.1
>

