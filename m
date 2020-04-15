Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C546C1A9B69
	for <lists+linux-input@lfdr.de>; Wed, 15 Apr 2020 12:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896387AbgDOKPf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Apr 2020 06:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2896380AbgDOKPI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Apr 2020 06:15:08 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296DBC061A0C;
        Wed, 15 Apr 2020 03:15:08 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e26so16746053wmk.5;
        Wed, 15 Apr 2020 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/zRBzjuHe09XX+ASHR18JZ4wD2e8PXmcgCw8d6ovqXw=;
        b=dOoAlluFyHSrFw43ItWWLX2UpI2pSe42D9rTSaKVTmD/7I05a5OVvnSRoXqtUEESkp
         /gs7Nt7HLTYA7JZVnrRA/5YJT6FCmqn2xKiqnHm3NlXSguxW8FC6/+KYipcqIntxCWgb
         3i5x/LVKTwqWmQ+qxv8XerfFD48ndIjltbfAmu+gCwnVVPmZJMMJPtOYM/H1RSmgmCS3
         LSeDrewqzeaIQ3QDq6oh6dcGvPqb6ZQLzoLmZsPZi5lMLvlO2RrJwlylLUjo6lIJtjyk
         vB3ed1uvPWpnV8+n5QG5NiWmi7gKtGZ139Wj7ql12R0auTEyE03zy+Eu78ZT1Jq7LoUe
         yh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/zRBzjuHe09XX+ASHR18JZ4wD2e8PXmcgCw8d6ovqXw=;
        b=rTCszI1AI7h9jKEBR6JOzX1QTSdu7oJm6fOmeag01rbDO/FRz3UPjnxaEE/ZD/0M7L
         xaNhmfTApd2xqJ8JycKtrHhIHJmdSHzy0WV4OT2x9D+nODyWAqg/PuiNJYDD2+1g3eVu
         9OuWmC1iHkIuD8cy3Uwewan4ocxSrFeO6uGT26ox6LmoT4Tenb5NbqRDqTZotNUGPwYS
         2X3S+erQEBLxs414Y3Lp+H67aaqILBgXcIn3xVdlL6be8AKy2/MEPqG+Uxh2V+sgh7Uy
         pMcQhIYtd4pLB8HNTJ4G1n0HHdRnsxxlLGHXLWpCirBsJIcBdW2W0IHZyoXhpgdJwmcN
         uO1w==
X-Gm-Message-State: AGi0Puay2jfigooouIFCc+mwJACVtLDh2MfNZpJkjh4BgBX49uiXMupb
        KDzLoV+cH6IeaQE5gsFgWV6S57vuBVBFa43XbLIo4EhE
X-Google-Smtp-Source: APiQypL6lTCs1Mc1240kTevwB9ce5PwGotFvOEvS9sUNuF7nYxoZAMRuQm89tdXdd84qrJ/3zvpN9L4FpApLCpJungY=
X-Received: by 2002:a7b:c456:: with SMTP id l22mr4325937wmi.148.1586945706583;
 Wed, 15 Apr 2020 03:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
 <20200409230009.22551-1-dedsa2002@gmail.com> <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C2FB967974B98B224610C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <TYAPR01MB387100BC93864B0A93598BFBECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C914C96A8DCC47925502C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxLXT2fMdhmnfj3ZH2Ptc50nvMVU0nAvW-3fw-wAKb9rYQ@mail.gmail.com>
 <OSAPR01MB305753C5B0DD35DE7001436DC8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxKfJBWb45PuA-1t=-ZysyUVZZmXJH=D2bSacoh2akJ0Zw@mail.gmail.com> <OSAPR01MB30571BF938FF882F7FB22853C8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB30571BF938FF882F7FB22853C8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
From:   Artem Borisov <dedsa2002@gmail.com>
Date:   Wed, 15 Apr 2020 14:14:55 +0400
Message-ID: <CAMr=fxJK3=Ytna5WuMOWc=nNJ3ZvwSJRx4-epoktw_vULBm0Tw@mail.gmail.com>
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

Well, at that point it's something you should talk to hid maintainers
about. The base patch is already submitted and scheduled for 5.7 as
it's enough to make this touchpad work. The second one is mainly
necessary to fix the deadzones around the corners and that was the one
to review. If you prefer to not have any major refactoring until you
prepare a better patch, I'm okay with that, since we can workaround
the resolution issue via libinput quirks for now.

=D1=81=D1=80, 15 =D0=B0=D0=BF=D1=80. 2020 =D0=B3. =D0=B2 13:54, Xiaojian Ca=
o <xiaojian.cao@cn.alps.com>:
>
> Hi Artem,
>
> Thanks for your checking, my feedbacks are as below:
> 1.It is about the coding style that we should not use HWID in the string =
"HID_DEVICE_ID_ALPS_1657", there are a large number of HWIDs using this tou=
chpad. We should use the device type information in this string, such as "U=
1_UNICORN_LEGACY".
> 2.This is also about the coding style, we'd better make sure they are the=
 same with each other, or just leave one list there.
> 3.If we'd like to upgrade the mainstream driver for only this project, th=
en it works, but for the other projects, it has problems. If there is enoug=
h time, we'd like to prepare a better patch for most of our products.
>
> Thank you for sharing the kernel version. I think, the review result woul=
d not be reliable if we don't have the correct source code of your kernel v=
ersion.
>
>
>
> Best Regards,
> ----------------------------------------------
> Jason Cao(=E6=9B=B9=E6=99=93=E5=BB=BA)
>
>
> -----Original Message-----
> From: Artem Borisov <dedsa2002@gmail.com>
> Sent: Wednesday, April 15, 2020 5:16 PM
> To: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com>
> Cc: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alpsalpi=
ne.com>; jikos@kernel.org; Benjamin Tissoires <benjamin.tissoires@redhat.co=
m>; Henrik Rydberg <rydberg@bitmath.org>; linux-input@vger.kernel.org; linu=
x-kernel@vger.kernel.org; =E9=87=8E=E6=9D=91 =E5=93=B2=E5=93=89 Tetsuya Nom=
ura <tetsuya.nomura@alpsalpine.com>; Vadim Klishko <vadim@cirque.com>; #ALC=
HT_ML_POD_CN <pod.alcht@cn.alps.com>
> Subject: Re: [PATCH 2/2] HID: alps: Refactor axis resolution logic
>
> Hi.
>
> I can't quite understand your objections.
> 1. Do you mean that we can't use AUI1657 because there are already driver=
s which do that (and I'm sure there are not) or that there are more devices=
 using 0x121E?
> 2. The second instance of product ID is not used anywhere in the code at =
least for U1 so I didn't see any point to add another unused value that rep=
licates the previous one.
> 3. I obviously don't have any internal documentation to argue with that, =
but you have mentioned above that aui1657 is just another panel based on U1=
, Apart from that, the touchpad is fully functional with the current code s=
ubmitted which wouldn't make any sense if the report IDs were wrong.
>
> I'm running Arch with 5.6.3 kernel, though I'm not sure how that informat=
ion will be relevant to the patch.
>
> Thanks.
>
>
> =D1=81=D1=80, 15 =D0=B0=D0=BF=D1=80. 2020 =D0=B3. =D0=B2 10:47, Xiaojian =
Cao <xiaojian.cao@cn.alps.com>:
> >
> > Hi Artem,
> >
> >
> >
> > We=E2=80=99ve reviewed your modifications, and already found some probl=
ems as below:
> >
> > It=E2=80=99s not suitable to use HWID AUI1657 in the source code, we be=
cause there are many projects using the same touchpad. It will confuse the =
coder in the future.
> >
> >
> >
> > There are 2 places that maintain the Product ID/Device ID in the mainst=
ream driver, currently your modifications just maintained one of them.
> >
> >
> >
> > If we need to support the new Product ID/Device ID, then the report IDs=
 will also be modified. Alps Alpine have different report ID list for diffe=
rent products.
> >
> >
> >
> > BTW, what is your OS version and what=E2=80=99s its Linux kernel versio=
n?
> >
> >
> >
> > Thank you.
> >
> >
> >
> >
> >
> > Best Regards,
> >
> > ----------------------------------------------
> >
> > Jason Cao(=E6=9B=B9=E6=99=93=E5=BB=BA)
> >
> >
> >
> > From: Artem Borisov <dedsa2002@gmail.com>
> > Sent: Wednesday, April 15, 2020 1:51 AM
> > To: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com=
>
> > Cc: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alpsal=
pine.com>; jikos@kernel.org;
> > Benjamin Tissoires <benjamin.tissoires@redhat.com>; Henrik Rydberg
> > <rydberg@bitmath.org>; linux-input@vger.kernel.org;
> > linux-kernel@vger.kernel.org; =E9=87=8E=E6=9D=91 =E5=93=B2=E5=93=89 Tet=
suya Nomura
> > <tetsuya.nomura@alpsalpine.com>; Vadim Klishko <vadim@cirque.com>;
> > #ALCHT_ML_POD_CN <pod.alcht@cn.alps.com>
> > Subject: Re: [PATCH 2/2] HID: alps: Refactor axis resolution logic
> >
> >
> >
> > Any updates on that yet?
> >
> > =D0=BF=D1=82, 10 =D0=B0=D0=BF=D1=80. 2020 =D0=B3., 06:28 Xiaojian Cao <=
xiaojian.cao@cn.alps.com>:
> >
> > Hi Ota-san,
> >
> > I need to study the background first, then I will update my understandi=
ng about it.
> >
> >
> > Best Regards,
> > ----------------------------------------------
> > Jason Cao(=E6=9B=B9=E6=99=93=E5=BB=BA)
> >
> >
> > -----Original Message-----
> > From: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alps=
alpine.com>
> > Sent: Friday, April 10, 2020 9:51 AM
> > To: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com=
>; Artem Borisov
> > <dedsa2002@gmail.com>
> > Cc: jikos@kernel.org; Benjamin Tissoires
> > <benjamin.tissoires@redhat.com>; Henrik Rydberg <rydberg@bitmath.org>;
> > linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
> >
> > Hi, Cao-san,
> >
> > I got it. I also confirmed this touchpad is a special.
> > What do you think this code modification?
> >
> > Best Regards,
> > Masaki Ota
> > -----Original Message-----
> > From: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.c=
om>
> > Sent: Friday, April 10, 2020 10:03 AM
> > To: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alpsal=
pine.com>; Artem Borisov
> > <dedsa2002@gmail.com>
> > Cc: jikos@kernel.org; Benjamin Tissoires
> > <benjamin.tissoires@redhat.com>; Henrik Rydberg <rydberg@bitmath.org>;
> > linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
> >
> > Hi Ota-san,
> >
> > Thanks for your checking.
> > In fact, some of the U1 devices work as non-PTP.
> > AUI1657 is using U1(KGDBCHA004A) whose firmware just supports mouse mod=
e and legacy mode.
> >
> > Best Regards,
> > ----------------------------------------------
> > Jason Cao(=E6=9B=B9=E6=99=93=E5=BB=BA)
> >
> >
> > -----Original Message-----
> > From: =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota <masaki.ota@alps=
alpine.com>
> > Sent: Friday, April 10, 2020 8:29 AM
> > To: =E6=9B=B9 =E6=9B=89=E5=BB=BA Xiaojian Cao <xiaojian.cao@cn.alps.com=
>; Artem Borisov
> > <dedsa2002@gmail.com>
> > Cc: jikos@kernel.org; Benjamin Tissoires
> > <benjamin.tissoires@redhat.com>; Henrik Rydberg <rydberg@bitmath.org>;
> > linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
> >
> > Hi, Cao-san,
> >
> > Do you know AUI1657 device? This device looks U1.
> > I think recent all U1 devices work as PTP.
> > Linux also supports PTP, so I think we should add something ID to
> > Linux source code. (I remember a something flag is already exist.)
> >
> > Best Regards,
> > Masaki Ota
> > -----Original Message-----
> > From: Artem Borisov <dedsa2002@gmail.com>
> > Sent: Friday, April 10, 2020 8:00 AM
> > Cc: jikos@kernel.org; =E5=A4=AA=E7=94=B0 =E7=9C=9F=E5=96=9C Masaki Ota =
<masaki.ota@alpsalpine.com>;
> > Artem Borisov <dedsa2002@gmail.com>; Benjamin Tissoires
> > <benjamin.tissoires@redhat.com>; Henrik Rydberg <rydberg@bitmath.org>;
> > linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH 2/2] HID: alps: Refactor axis resolution logic
> >
> > AUI1657 doesn't follow the same logic for resolution calculation, since=
 the resulting values are incorrect. Instead, it reports the actual resolut=
ion values in place of the pitch ones.
> > While we're at it, also refactor the whole resolution logic to make it =
more generic and sensible for multiple device support.
> >
> > There are two main logical problems with the current code:
> > 1. active_len_mm values are only used for resolution calculation on U1,=
 yet are exposed globally as part of alps_dev structure.
> > 2. The resolution calculation process happens in alps_input_configured,=
 while everything else is calculated in u1_init function.
> >
> > These problems become more apparent when we try to support a device tha=
t doesn't follow the same resolution calculation logic as U1.
> > Since alps_input_configured is a device-agnostic function, we should av=
oid doing any measurements there and handle them in device-specific init fu=
nctions like u1/T4_init instead.
> >
> > To eliminate these problems we add global x_res and y_res values and po=
pulate them on a device-specific basis in the according init functions.
> >
> > Signed-off-by: Artem Borisov <dedsa2002@gmail.com>
> > ---
> >  drivers/hid/hid-alps.c | 41 +++++++++++++++++++++++++----------------
> >  1 file changed, 25 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c index
> > c2a2bd528890..494c08cca645 100644
> > --- a/drivers/hid/hid-alps.c
> > +++ b/drivers/hid/hid-alps.c
> > @@ -83,8 +83,8 @@ enum dev_num {
> >   * @max_fingers: total number of fingers
> >   * @has_sp: boolean of sp existense
> >   * @sp_btn_info: button information
> > - * @x_active_len_mm: active area length of X (mm)
> > - * @y_active_len_mm: active area length of Y (mm)
> > + * @x_res: resolution of X
> > + * @y_res: resolution of Y
> >   * @x_max: maximum x coordinate value
> >   * @y_max: maximum y coordinate value
> >   * @x_min: minimum x coordinate value @@ -100,9 +100,10 @@ struct
> > alps_dev {
> >         enum dev_num dev_type;
> >         u8  max_fingers;
> >         u8  has_sp;
> > +       u8  no_pitch;
> >         u8      sp_btn_info;
> > -       u32     x_active_len_mm;
> > -       u32     y_active_len_mm;
> > +       u32     x_res;
> > +       u32     y_res;
> >         u32     x_max;
> >         u32     y_max;
> >         u32     x_min;
> > @@ -550,10 +551,6 @@ static int u1_init(struct hid_device *hdev, struct=
 alps_dev *pri_data)
> >                 dev_err(&hdev->dev, "failed U1_RESO_DWN_ABS (%d)\n", re=
t);
> >                 goto exit;
> >         }
> > -       pri_data->x_active_len_mm =3D
> > -               (pitch_x * (sen_line_num_x - 1)) / 10;
> > -       pri_data->y_active_len_mm =3D
> > -               (pitch_y * (sen_line_num_y - 1)) / 10;
> >
> >         pri_data->x_max =3D
> >                 (resolution << 2) * (sen_line_num_x - 1); @@ -562,6 +55=
9,18 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_da=
ta)
> >                 (resolution << 2) * (sen_line_num_y - 1);
> >         pri_data->y_min =3D 1;
> >
> > +       if (pri_data->no_pitch) {
> > +               pri_data->x_res =3D pitch_x;
> > +               pri_data->y_res =3D pitch_y;
> > +       } else {
> > +               pri_data->x_res =3D
> > +                       (pri_data->x_max - 1) /
> > +                       ((pitch_x * (sen_line_num_x - 1)) / 10);
> > +               pri_data->y_res =3D
> > +                       (pri_data->y_max - 1) /
> > +                       ((pitch_y * (sen_line_num_y - 1)) / 10);
> > +       }
> > +
> >         ret =3D u1_read_write_register(hdev, ADDRESS_U1_PAD_BTN,
> >                         &tmp, 0, true);
> >         if (ret < 0) {
> > @@ -622,7 +631,7 @@ static int T4_init(struct hid_device *hdev, struct =
alps_dev *pri_data)
> >         pri_data->x_min =3D T4_COUNT_PER_ELECTRODE;
> >         pri_data->y_max =3D sen_line_num_y * T4_COUNT_PER_ELECTRODE;
> >         pri_data->y_min =3D T4_COUNT_PER_ELECTRODE;
> > -       pri_data->x_active_len_mm =3D pri_data->y_active_len_mm =3D 0;
> > +       pri_data->x_res =3D pri_data->y_res =3D 0;
> >         pri_data->btn_cnt =3D 1;
> >
> >         ret =3D t4_read_write_register(hdev, PRM_SYS_CONFIG_1, &tmp, 0,=
 true); @@ -675,7 +684,7 @@ static int alps_input_configured(struct hid_dev=
ice *hdev, struct hid_input *hi)
> >         struct alps_dev *data =3D hid_get_drvdata(hdev);
> >         struct input_dev *input =3D hi->input, *input2;
> >         int ret;
> > -       int res_x, res_y, i;
> > +       int i;
> >
> >         data->input =3D input;
> >
> > @@ -706,12 +715,9 @@ static int alps_input_configured(struct hid_device=
 *hdev, struct hid_input *hi)
> >         input_set_abs_params(input, ABS_MT_POSITION_Y,
> >                                                 data->y_min,
> > data->y_max, 0, 0);
> >
> > -       if (data->x_active_len_mm && data->y_active_len_mm) {
> > -               res_x =3D (data->x_max - 1) / data->x_active_len_mm;
> > -               res_y =3D (data->y_max - 1) / data->y_active_len_mm;
> > -
> > -               input_abs_set_res(input, ABS_MT_POSITION_X, res_x);
> > -               input_abs_set_res(input, ABS_MT_POSITION_Y, res_y);
> > +       if (data->x_res && data->y_res) {
> > +               input_abs_set_res(input, ABS_MT_POSITION_X, data->x_res=
);
> > +               input_abs_set_res(input, ABS_MT_POSITION_Y,
> > + data->y_res);
> >         }
> >
> >         input_set_abs_params(input, ABS_MT_PRESSURE, 0, 64, 0, 0); @@ -=
802,8 +808,11 @@ static int alps_probe(struct hid_device *hdev, const struc=
t hid_device_id *id)
> >                 break;
> >         case HID_DEVICE_ID_ALPS_U1_DUAL:
> >         case HID_DEVICE_ID_ALPS_U1:
> > +               data->dev_type =3D U1;
> > +               break;
> >         case HID_DEVICE_ID_ALPS_1657:
> >                 data->dev_type =3D U1;
> > +               data->no_pitch =3D 1;
> >                 break;
> >         default:
> >                 data->dev_type =3D UNKNOWN;
> > --
> > 2.26.0
