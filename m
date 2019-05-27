Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689822AD72
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 05:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfE0DzI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Sun, 26 May 2019 23:55:08 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:21728 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfE0DzI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 May 2019 23:55:08 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="30761750"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with SMTP; 27 May 2019 11:55:05 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(169547:0:AUTH_RELAY)
        (envelope-from <kt.liao@emc.com.tw>); Mon, 27 May 2019 11:55:04 +0800 (CST)
Received: from 192.168.33.46
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(119323:0:AUTH_LOGIN)
        (envelope-from <kt.liao@emc.com.tw>); Mon, 27 May 2019 11:55:02 +0800 (CST)
From:   =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>
To:     "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Aaron Ma'" <aaron.ma@canonical.com>,
        "'Hans de Goede'" <hdegoede@redhat.com>
Cc:     "'open list:HID CORE LAYER'" <linux-input@vger.kernel.org>,
        "'lkml'" <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com> <20190521132712.2818-9-benjamin.tissoires@redhat.com> <CAO-hwJJXGTZq7zRVhcFNwh-kOo0rUhZOsNtFX1yA93Km=L+ynA@mail.gmail.com>
In-Reply-To: <CAO-hwJJXGTZq7zRVhcFNwh-kOo0rUhZOsNtFX1yA93Km=L+ynA@mail.gmail.com>
Subject: RE: [PATCH v2 08/10] Input: elan_i2c - export true width/height
Date:   Mon, 27 May 2019 11:55:01 +0800
Message-ID: <00f901d5143f$f5ea8420$e1bf8c60$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQMBv+jJqV7WAwqWtnh8gdestIYR9QKF0mzQAgyUPwekAGglcA==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcOTIwNzNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0zMzMzMTMxYi04MDMzLTExZTktYjdjYy01YzUxNGY0NmFhNDVcYW1lLXRlc3RcMzMzMzEzMWQtODAzMy0xMWU5LWI3Y2MtNWM1MTRmNDZhYTQ1Ym9keS50eHQiIHN6PSIzNjU1IiB0PSIxMzIwMzQwMjkwMTM3NDM0NjEiIGg9IncwQmlIY3p1dmg1YUNNVzhoWVUzekRSWS9YST0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

-----Original Message-----
From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com] 
Sent: Friday, May 24, 2019 5:37 PM
To: Dmitry Torokhov; KT Liao; Rob Herring; Aaron Ma; Hans de Goede
Cc: open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height

On Tue, May 21, 2019 at 3:28 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
>
> The width/height is actually in the same unit than X and Y. So we 
> should not tamper the data, but just set the proper resolution, so 
> that userspace can correctly detect which touch is a palm or a finger.
>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> --
>
> new in v2
> ---
>  drivers/input/mouse/elan_i2c_core.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/mouse/elan_i2c_core.c 
> b/drivers/input/mouse/elan_i2c_core.c
> index 7ff044c6cd11..6f4feedb7765 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -45,7 +45,6 @@
>  #define DRIVER_NAME            "elan_i2c"
>  #define ELAN_VENDOR_ID         0x04f3
>  #define ETP_MAX_PRESSURE       255
> -#define ETP_FWIDTH_REDUCE      90
>  #define ETP_FINGER_WIDTH       15
>  #define ETP_RETRY_COUNT                3
>
> @@ -915,12 +914,8 @@ static void elan_report_contact(struct elan_tp_data *data,
>                         return;
>                 }
>
> -               /*
> -                * To avoid treating large finger as palm, let's reduce the
> -                * width x and y per trace.
> -                */
> -               area_x = mk_x * (data->width_x - ETP_FWIDTH_REDUCE);
> -               area_y = mk_y * (data->width_y - ETP_FWIDTH_REDUCE);
> +               area_x = mk_x * data->width_x;
> +               area_y = mk_y * data->width_y;
>
>                 major = max(area_x, area_y);
>                 minor = min(area_x, area_y); @@ -1123,8 +1118,10 @@ 
> static int elan_setup_input_device(struct elan_tp_data *data)
>                              ETP_MAX_PRESSURE, 0, 0);
>         input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
>                              ETP_FINGER_WIDTH * max_width, 0, 0);
> +       input_abs_set_res(input, ABS_MT_TOUCH_MAJOR, data->x_res);
>         input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
>                              ETP_FINGER_WIDTH * min_width, 0, 0);
> +       input_abs_set_res(input, ABS_MT_TOUCH_MINOR, data->y_res);

I had a chat with Peter on Wednesday, and he mentioned that this is dangerous as Major/Minor are max/min of the width and height. And given that we might have 2 different resolutions, we would need to do some computation in the kernel to ensure the data is correct with respect to the resolution.

TL;DR: I don't think we should export the resolution there :(

KT, should I drop the patch entirely, or is there a strong argument for keeping the ETP_FWIDTH_REDUCE around?
I suggest you apply the patch, I have no idea why ETP_FWIDTH_REDUCE existed. 
Our FW team know nothing about ETP_FWIDTH_REDUCE ether.

The only side effect will happen on Chromebook because such computation have stayed in ChromeOS' kernel for four years.
Chrome's finger/palm threshold may be different from other Linux distribution.
We will discuss it with Google once the patch picked by chrome and cause something wrong.

Cheers,
Benjamin


>
>         data->input = input;
>
> --
> 2.21.0
>

