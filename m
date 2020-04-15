Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08AA1A983B
	for <lists+linux-input@lfdr.de>; Wed, 15 Apr 2020 11:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895208AbgDOJQl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Apr 2020 05:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895197AbgDOJQ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Apr 2020 05:16:27 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A92BC061A0C;
        Wed, 15 Apr 2020 02:16:25 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id u13so17722427wrp.3;
        Wed, 15 Apr 2020 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IMZr34DLiuyJZ3beOm7sdWkRARGgeSVE8nAirv9yqeY=;
        b=SOqJd+CYi9x0dN/VVS6CQ43b2URG/hf+83R7dZuYZbaCF694Ca4pskVpWbAmMRrQlS
         tuLOPcBXy58CbDVK/4Bq2XQ+Z18rhdR2m3capia9yPnDl99Rs67uX08KhF2zJv5rreY8
         6A77jIeM0sFC1MiwaznnwS6aC5YJ2mXHoaCFVpBsiIFyMg9B2RqKWHkw690+YKofKZzt
         KuThzAIu96FFU73LuPbQGWsWuPv/Ugm9ZBidNO1wbIBqC/eQTD1by0l3OfyzzMnYa1Mv
         dUl+b0+DhEqaSZohV1AHflK5SGasMBgP7HulxWkocbDhgeaeLWPEvadODiKxDP5T0TtX
         S8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IMZr34DLiuyJZ3beOm7sdWkRARGgeSVE8nAirv9yqeY=;
        b=R9aGBijHunQfyKgrbiUVnEyUMAsWjQY/HYkAZSJk7W82BMF8c69CvW3uTnkotrz2Q9
         mEQqRUW3IXrMMi1vDlHbNIzswqRe3phZ81ieY/NlW72PBfpJ45bkctB2vtNfCOt88iWB
         u2SEO377n48KgDNec34bZHJbjUE9FmKwT12chLqhQTNU/YzuI7pPb/C8HZM3JiC9IV6f
         hJ2s73B0pM0z8q8+k1SCMjUWtuZIb+EsHF2lwTRwaFXDg6y3a0YnNQxkiBO2S0GCi2wP
         qi430Y+XMqcp2UQSbacsK3igg7XwfBfzsiWUkOgSxNHHMtT4cl4im7rbOvwVQxqwY1rg
         XUEw==
X-Gm-Message-State: AGi0PuaD6eN2r/2jbrn32q8m8/tHM+gbabzSaExTFGMByKusbEoT81+r
        KKr+nZyjxoEfN5K+OO4TZiaqPE4RZEbH4puqYcY=
X-Google-Smtp-Source: APiQypJdnL7ZbWICCfhyBu6RpmUwljAELb5grKxtFHzAbyqek6V0hyt7THQEQKi1GpxhSeCtUi2VeOl1LFSInHf169Q=
X-Received: by 2002:adf:9321:: with SMTP id 30mr26589742wro.330.1586942183706;
 Wed, 15 Apr 2020 02:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
 <20200409230009.22551-1-dedsa2002@gmail.com> <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C2FB967974B98B224610C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <TYAPR01MB387100BC93864B0A93598BFBECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C914C96A8DCC47925502C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxLXT2fMdhmnfj3ZH2Ptc50nvMVU0nAvW-3fw-wAKb9rYQ@mail.gmail.com> <OSAPR01MB305753C5B0DD35DE7001436DC8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB305753C5B0DD35DE7001436DC8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
From:   Artem Borisov <dedsa2002@gmail.com>
Date:   Wed, 15 Apr 2020 13:16:12 +0400
Message-ID: <CAMr=fxKfJBWb45PuA-1t=-ZysyUVZZmXJH=D2bSacoh2akJ0Zw@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: alps: Refactor axis resolution logic
To:     Xiaojian Cao <xiaojian.cao@cn.alps.com>
Cc:     Masaki Ota <masaki.ota@alpsalpine.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tetsuya Nomura <tetsuya.nomura@alpsalpine.com>,
        "vadim@cirque.com" <vadim@cirque.com>,
        "pod.alcht@cn.alps.com" <pod.alcht@cn.alps.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi.

I can't quite understand your objections.
1. Do you mean that we can't use AUI1657 because there are already
drivers which do that (and I'm sure there are not) or that there are
more devices using 0x121E?
2. The second instance of product ID is not used anywhere in the code
at least for U1 so I didn't see any point to add another unused value
that replicates the previous one.
3. I obviously don't have any internal documentation to argue with
that, but you have mentioned above that aui1657 is just another panel
based on U1, Apart from that, the touchpad is fully functional with
the current code submitted which wouldn't make any sense if the report
IDs were wrong.

I'm running Arch with 5.6.3 kernel, though I'm not sure how that
information will be relevant to the patch.

Thanks.


=D1=81=D1=80, 15 =D0=B0=D0=BF=D1=80. 2020 =D0=B3. =D0=B2 10:47, Xiaojian Ca=
o <xiaojian.cao@cn.alps.com>:
>
> Hi Artem,
>
>
>
> We=E2=80=99ve reviewed your modifications, and already found some problem=
s as below:
>
> It=E2=80=99s not suitable to use HWID AUI1657 in the source code, we beca=
use there are many projects using the same touchpad. It will confuse the co=
der in the future.
>
>
>
> There are 2 places that maintain the Product ID/Device ID in the mainstre=
am driver, currently your modifications just maintained one of them.
>
>
>
> If we need to support the new Product ID/Device ID, then the report IDs w=
ill also be modified. Alps Alpine have different report ID list for differe=
nt products.
>
>
>
> BTW, what is your OS version and what=E2=80=99s its Linux kernel version?
>
>
>
> Thank you.
>
>
>
>
>
> Best Regards,
>
> ----------------------------------------------
>
> Jason Cao(=E6=9B=B9=E6=99=93=E5=BB=BA)
>
>
>
> From: Artem Borisov <dedsa2002@gmail.com>
> Sent: Wednesday, April 15, 2020 1:51 AM
> To: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com>
> Cc: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alpsalpi=
ne.com>; jikos@kernel.org; Benjamin Tissoires <benjamin.tissoires@redhat.co=
m>; Henrik Rydberg <rydberg@bitmath.org>; linux-input@vger.kernel.org; linu=
x-kernel@vger.kernel.org; =E9=87=8E=E6=9D=91 =E5=93=B2=E5=93=89 Tetsuya Nom=
ura <tetsuya.nomura@alpsalpine.com>; Vadim Klishko <vadim@cirque.com>; #ALC=
HT_ML_POD_CN <pod.alcht@cn.alps.com>
> Subject: Re: [PATCH 2/2] HID: alps: Refactor axis resolution logic
>
>
>
> Any updates on that yet?
>
> =D0=BF=D1=82, 10 =D0=B0=D0=BF=D1=80. 2020 =D0=B3., 06:28 Xiaojian Cao <xi=
aojian.cao@cn.alps.com>:
>
> Hi Ota-san,
>
> I need to study the background first, then I will update my understanding=
 about it.
>
>
> Best Regards,
> ----------------------------------------------
> Jason Cao(=E6=9B=B9=E6=99=93=E5=BB=BA)
>
>
> -----Original Message-----
> From: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alpsal=
pine.com>
> Sent: Friday, April 10, 2020 9:51 AM
> To: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com>;=
 Artem Borisov <dedsa2002@gmail.com>
> Cc: jikos@kernel.org; Benjamin Tissoires <benjamin.tissoires@redhat.com>;=
 Henrik Rydberg <rydberg@bitmath.org>; linux-input@vger.kernel.org; linux-k=
ernel@vger.kernel.org
> Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
>
> Hi, Cao-san,
>
> I got it. I also confirmed this touchpad is a special.
> What do you think this code modification?
>
> Best Regards,
> Masaki Ota
> -----Original Message-----
> From: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com=
>
> Sent: Friday, April 10, 2020 10:03 AM
> To: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alpsalpi=
ne.com>; Artem Borisov <dedsa2002@gmail.com>
> Cc: jikos@kernel.org; Benjamin Tissoires <benjamin.tissoires@redhat.com>;=
 Henrik Rydberg <rydberg@bitmath.org>; linux-input@vger.kernel.org; linux-k=
ernel@vger.kernel.org
> Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
>
> Hi Ota-san,
>
> Thanks for your checking.
> In fact, some of the U1 devices work as non-PTP.
> AUI1657 is using U1(KGDBCHA004A) whose firmware just supports mouse mode =
and legacy mode.
>
> Best Regards,
> ----------------------------------------------
> Jason Cao(=E6=9B=B9=E6=99=93=E5=BB=BA)
>
>
> -----Original Message-----
> From: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alpsal=
pine.com>
> Sent: Friday, April 10, 2020 8:29 AM
> To: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com>;=
 Artem Borisov <dedsa2002@gmail.com>
> Cc: jikos@kernel.org; Benjamin Tissoires <benjamin.tissoires@redhat.com>;=
 Henrik Rydberg <rydberg@bitmath.org>; linux-input@vger.kernel.org; linux-k=
ernel@vger.kernel.org
> Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
>
> Hi, Cao-san,
>
> Do you know AUI1657 device? This device looks U1.
> I think recent all U1 devices work as PTP.
> Linux also supports PTP, so I think we should add something ID to Linux s=
ource code. (I remember a something flag is already exist.)
>
> Best Regards,
> Masaki Ota
> -----Original Message-----
> From: Artem Borisov <dedsa2002@gmail.com>
> Sent: Friday, April 10, 2020 8:00 AM
> Cc: jikos@kernel.org; =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <m=
asaki.ota@alpsalpine.com>; Artem Borisov <dedsa2002@gmail.com>; Benjamin Ti=
ssoires <benjamin.tissoires@redhat.com>; Henrik Rydberg <rydberg@bitmath.or=
g>; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 2/2] HID: alps: Refactor axis resolution logic
>
> AUI1657 doesn't follow the same logic for resolution calculation, since t=
he resulting values are incorrect. Instead, it reports the actual resolutio=
n values in place of the pitch ones.
> While we're at it, also refactor the whole resolution logic to make it mo=
re generic and sensible for multiple device support.
>
> There are two main logical problems with the current code:
> 1. active_len_mm values are only used for resolution calculation on U1, y=
et are exposed globally as part of alps_dev structure.
> 2. The resolution calculation process happens in alps_input_configured, w=
hile everything else is calculated in u1_init function.
>
> These problems become more apparent when we try to support a device that =
doesn't follow the same resolution calculation logic as U1.
> Since alps_input_configured is a device-agnostic function, we should avoi=
d doing any measurements there and handle them in device-specific init func=
tions like u1/T4_init instead.
>
> To eliminate these problems we add global x_res and y_res values and popu=
late them on a device-specific basis in the according init functions.
>
> Signed-off-by: Artem Borisov <dedsa2002@gmail.com>
> ---
>  drivers/hid/hid-alps.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c index c2a2bd=
528890..494c08cca645 100644
> --- a/drivers/hid/hid-alps.c
> +++ b/drivers/hid/hid-alps.c
> @@ -83,8 +83,8 @@ enum dev_num {
>   * @max_fingers: total number of fingers
>   * @has_sp: boolean of sp existense
>   * @sp_btn_info: button information
> - * @x_active_len_mm: active area length of X (mm)
> - * @y_active_len_mm: active area length of Y (mm)
> + * @x_res: resolution of X
> + * @y_res: resolution of Y
>   * @x_max: maximum x coordinate value
>   * @y_max: maximum y coordinate value
>   * @x_min: minimum x coordinate value
> @@ -100,9 +100,10 @@ struct alps_dev {
>         enum dev_num dev_type;
>         u8  max_fingers;
>         u8  has_sp;
> +       u8  no_pitch;
>         u8      sp_btn_info;
> -       u32     x_active_len_mm;
> -       u32     y_active_len_mm;
> +       u32     x_res;
> +       u32     y_res;
>         u32     x_max;
>         u32     y_max;
>         u32     x_min;
> @@ -550,10 +551,6 @@ static int u1_init(struct hid_device *hdev, struct a=
lps_dev *pri_data)
>                 dev_err(&hdev->dev, "failed U1_RESO_DWN_ABS (%d)\n", ret)=
;
>                 goto exit;
>         }
> -       pri_data->x_active_len_mm =3D
> -               (pitch_x * (sen_line_num_x - 1)) / 10;
> -       pri_data->y_active_len_mm =3D
> -               (pitch_y * (sen_line_num_y - 1)) / 10;
>
>         pri_data->x_max =3D
>                 (resolution << 2) * (sen_line_num_x - 1); @@ -562,6 +559,=
18 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_data=
)
>                 (resolution << 2) * (sen_line_num_y - 1);
>         pri_data->y_min =3D 1;
>
> +       if (pri_data->no_pitch) {
> +               pri_data->x_res =3D pitch_x;
> +               pri_data->y_res =3D pitch_y;
> +       } else {
> +               pri_data->x_res =3D
> +                       (pri_data->x_max - 1) /
> +                       ((pitch_x * (sen_line_num_x - 1)) / 10);
> +               pri_data->y_res =3D
> +                       (pri_data->y_max - 1) /
> +                       ((pitch_y * (sen_line_num_y - 1)) / 10);
> +       }
> +
>         ret =3D u1_read_write_register(hdev, ADDRESS_U1_PAD_BTN,
>                         &tmp, 0, true);
>         if (ret < 0) {
> @@ -622,7 +631,7 @@ static int T4_init(struct hid_device *hdev, struct al=
ps_dev *pri_data)
>         pri_data->x_min =3D T4_COUNT_PER_ELECTRODE;
>         pri_data->y_max =3D sen_line_num_y * T4_COUNT_PER_ELECTRODE;
>         pri_data->y_min =3D T4_COUNT_PER_ELECTRODE;
> -       pri_data->x_active_len_mm =3D pri_data->y_active_len_mm =3D 0;
> +       pri_data->x_res =3D pri_data->y_res =3D 0;
>         pri_data->btn_cnt =3D 1;
>
>         ret =3D t4_read_write_register(hdev, PRM_SYS_CONFIG_1, &tmp, 0, t=
rue); @@ -675,7 +684,7 @@ static int alps_input_configured(struct hid_devic=
e *hdev, struct hid_input *hi)
>         struct alps_dev *data =3D hid_get_drvdata(hdev);
>         struct input_dev *input =3D hi->input, *input2;
>         int ret;
> -       int res_x, res_y, i;
> +       int i;
>
>         data->input =3D input;
>
> @@ -706,12 +715,9 @@ static int alps_input_configured(struct hid_device *=
hdev, struct hid_input *hi)
>         input_set_abs_params(input, ABS_MT_POSITION_Y,
>                                                 data->y_min, data->y_max,=
 0, 0);
>
> -       if (data->x_active_len_mm && data->y_active_len_mm) {
> -               res_x =3D (data->x_max - 1) / data->x_active_len_mm;
> -               res_y =3D (data->y_max - 1) / data->y_active_len_mm;
> -
> -               input_abs_set_res(input, ABS_MT_POSITION_X, res_x);
> -               input_abs_set_res(input, ABS_MT_POSITION_Y, res_y);
> +       if (data->x_res && data->y_res) {
> +               input_abs_set_res(input, ABS_MT_POSITION_X, data->x_res);
> +               input_abs_set_res(input, ABS_MT_POSITION_Y, data->y_res);
>         }
>
>         input_set_abs_params(input, ABS_MT_PRESSURE, 0, 64, 0, 0); @@ -80=
2,8 +808,11 @@ static int alps_probe(struct hid_device *hdev, const struct =
hid_device_id *id)
>                 break;
>         case HID_DEVICE_ID_ALPS_U1_DUAL:
>         case HID_DEVICE_ID_ALPS_U1:
> +               data->dev_type =3D U1;
> +               break;
>         case HID_DEVICE_ID_ALPS_1657:
>                 data->dev_type =3D U1;
> +               data->no_pitch =3D 1;
>                 break;
>         default:
>                 data->dev_type =3D UNKNOWN;
> --
> 2.26.0
