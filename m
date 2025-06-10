Return-Path: <linux-input+bounces-12755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CDAD2CCD
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 06:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA5373AF6D6
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 04:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF7E219A81;
	Tue, 10 Jun 2025 04:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czLcgfcW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6251F8691;
	Tue, 10 Jun 2025 04:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749530417; cv=none; b=fxizqA4mlN+EZyXgbJWC2cFmsC1/1T/LK97JXwq10Bn4Qhzk4KsTf7HNSy4MRyJMbi+dtVZa1xczAKkW+YW+vkJsp1TcQ0S/oqg8HLKTyIwocH0RNAFTDo06xcryo0YMG0bmNcowccF94OIp4RDhvULci/yi+xr1TnOw7JihULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749530417; c=relaxed/simple;
	bh=XjQ3CDtMBnkk0BRptvtsBqN2rCFGOTvBfwKuX5eC58s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4v2aeBCh/5fGQS+blE77PXOvnl//c591p7fASYW2/1c+2NEDwvYI1JQFPzLpKEQI/bS2HHLWn41e4sqhmn0u1Tgw3FHEBPvzaR8/k6b7vJ2WdfDAQftmJysGe3CVhz1XHlSLiJEod44Qrd0gpPHw+YvNEowvh3gLKuxvffVd4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czLcgfcW; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d0a2220fb0so533051585a.3;
        Mon, 09 Jun 2025 21:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749530414; x=1750135214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruItdLhPj6rYuzrqjcoNX4GqgvobJlpmsgOq1JVT/X4=;
        b=czLcgfcWvczEllV1JS9Kv8GO3vJNvuwQDkuzCW/mpjqbTsha69yds3ee5qMu9iBorU
         4clTjQi/cObX+qxKyjTcZmgSPZ6nQ4rsl/xt657QRev8ijU98IcXlniVvJVxmoxn6eUP
         Qa0k+27W69+topzhiVYV4P4Z+dmg7strg73ZxbDl1J/Ed8L9HZrvZnut6ueZRn506jiD
         3vrTWOcX/S/f7HbpKv8dpqUu+k2GtnZMLQUgy8uom0Wnib8Me/jbOBFY07trdZjffom4
         br3/K7z1VDsAbOE1mBkELWY0EIACT5yarjGNRDWR+XLs2W4ilnjWLjU/w0PyFgzH/RN7
         h5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530414; x=1750135214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruItdLhPj6rYuzrqjcoNX4GqgvobJlpmsgOq1JVT/X4=;
        b=TIt2bWLyqUb+eEvuh03Fv6amt1wdlRA+0fxIoOBpSuhwUceJ7H9/BOHOLWPhH+47Jd
         yaDKeRwgebKRpKi2k72M762XYIDMva9+RaRrQ2ytVa5Lg06tDafLHZoegEd4NYa25SHk
         ee80uTJ64QkRX+Sh4d2IWVF6RUhKIetPB8BYCW+Hb8DMff3PCBet0fPkPSjpg9T0yhpk
         9J8hVcTmA3mswxZXjaG2ZKfM9imFcod0qiDpz8t7DgMZrU8vdo8eO5Ll2vS/HNqAS2YA
         sFjDYfupr2/0dNEYQLlfKy+QGIn2Am6vMJFv7zQCvykFCdMk/UtrWkZYXalIhkvpxX+t
         +2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcofXog0mNEJ9Jxbr9D7twOjOqsaYTCvS2IAxUy14jqwUIliC5lE/TwK8A5FkizLOB1o4O00NYeaDmtg==@vger.kernel.org, AJvYcCXcO4zq9o4EoecQXvpi07nzHSFQaJs4OrKka6GnROx75eOeeoRIX/if/cbu9AmSu24j56AUOWPBwiPtxCEp@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJ1xeJ0CFNnXO7iOX7vFWEBxX9kshriomAAZTeoUZqRaZTvXy
	CPwIIqH3AGwuILvVuPmeKcHSo4A3aLKYxwrkdDeLGtesokfgBmHBvdP6c7ZuuAjmsDiY/HfWDbZ
	oy3pYvxDEjeP2uKTnA/eD4O/bEj02AjA=
X-Gm-Gg: ASbGncskJVbGsQYL0p0wXKXDbxPora8YRBBGkmo3tuxDPmCxYKcLwlsKcMOB/eqf1tt
	8RSQ0Xul3HNyLpwp2ch9Y025IAZ++3iOUex4C7/FE3Xi+/jFNTNw7bWciE0EyXRz8Q3neTEVlFW
	FVkgvNlx/AdMUsl/V479SqCkpBK52I5ANxLIC2rY5DlHp8
X-Google-Smtp-Source: AGHT+IHUPosBu5bIPaWQQNlnivk/yrYSEQdGZzwchQrOZpgw6Fc7FA9JlcAb0oDcXvTV9XIad/s1Ws/plrHNX4LG+uI=
X-Received: by 2002:a05:620a:24c9:b0:7ce:be04:f838 with SMTP id
 af79cd13be357-7d229861062mr2317029285a.18.1749530414362; Mon, 09 Jun 2025
 21:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com> <20250526-dualsense-hid-jack-v1-9-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-9-a65fee4a60cc@collabora.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 9 Jun 2025 21:40:03 -0700
X-Gm-Features: AX0GCFv2q4MWsnWNWknqadP7RtZvAVl7Z5KO--Al5KsMfK-2Zy_9HiqO5oyzKf0
Message-ID: <CAEc3jaC-jm0kG3oM1z5BgW4FnXfgKztFg3rFyNUzKHieXxFh-Q@mail.gmail.com>
Subject: Re: [PATCH 09/11] HID: playstation: Rename DualSense input report
 status field
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

At the time I didn't document all parts of the HID report as not
everything was needed. When adding in the audio stuff, let's call this
one by its official name. There are officially 3 bytes of status, so
the correct thing is to technically make it a 3 byte array of status.
The official register names contain DS_STATUS0_.., DS_STATUS1_..,
etcetera in the name, so I would like to keep things aligned with our
datasheets.

Thanks,
Roderick

On Mon, May 26, 2025 at 5:54=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> The name of the 'status' member of struct dualsense_input_report is too
> generic, since it is only used to provide battery data.
>
> In preparation to support handling additional (non-battery) status
> information and avoid ambiguity, rename the field to status_battery.
> For consistency, also rename the related DS_STATUS_* bitfield macros.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/hid/hid-playstation.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 937b14679c8b17c5d3d245eae1cc4e0e56dadb71..b7777d3230b2fe277a4a2217e=
f6b1eff9cfad182 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -112,10 +112,10 @@ struct ps_led_info {
>  #define DS_BUTTONS2_TOUCHPAD   BIT(1)
>  #define DS_BUTTONS2_MIC_MUTE   BIT(2)
>
> -/* Status field of DualSense input report. */
> -#define DS_STATUS_BATTERY_CAPACITY     GENMASK(3, 0)
> -#define DS_STATUS_CHARGING             GENMASK(7, 4)
> -#define DS_STATUS_CHARGING_SHIFT       4
> +/* Battery status field of DualSense input report. */
> +#define DS_STATUS_BATTERY_CAPACITY             GENMASK(3, 0)
> +#define DS_STATUS_BATTERY_CHARGING             GENMASK(7, 4)
> +#define DS_STATUS_BATTERY_CHARGING_SHIFT       4
>
>  /* Feature version from DualSense Firmware Info report. */
>  #define DS_FEATURE_VERSION_MINOR               GENMASK(7, 0)
> @@ -236,7 +236,7 @@ struct dualsense_input_report {
>         struct dualsense_touch_point points[2];
>
>         u8 reserved3[12];
> -       u8 status;
> +       u8 status_battery;
>         u8 reserved4[10];
>  } __packed;
>  /* Common input report size shared equals the size of the USB report min=
us 1 byte for ReportID. */
> @@ -1462,8 +1462,9 @@ static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
>         input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & =
DS_BUTTONS2_TOUCHPAD);
>         input_sync(ds->touchpad);
>
> -       battery_data =3D ds_report->status & DS_STATUS_BATTERY_CAPACITY;
> -       charging_status =3D (ds_report->status & DS_STATUS_CHARGING) >> D=
S_STATUS_CHARGING_SHIFT;
> +       battery_data =3D ds_report->status_battery & DS_STATUS_BATTERY_CA=
PACITY;
> +       charging_status =3D ds_report->status_battery & DS_STATUS_BATTERY=
_CHARGING;
> +       charging_status >>=3D DS_STATUS_BATTERY_CHARGING_SHIFT;
>
>         switch (charging_status) {
>         case 0x0:
>
> --
> 2.49.0
>
>

