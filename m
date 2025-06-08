Return-Path: <linux-input+bounces-12734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2450AD13A4
	for <lists+linux-input@lfdr.de>; Sun,  8 Jun 2025 20:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ADEA3AA636
	for <lists+linux-input@lfdr.de>; Sun,  8 Jun 2025 18:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28A518DB1A;
	Sun,  8 Jun 2025 18:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2fpRLGQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0907E54673;
	Sun,  8 Jun 2025 18:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749406107; cv=none; b=VZjT7M9kV5jeCJm29SsUG5gCACNBRnOShINTSHLKfi2RWDuB5xkNECr3KTE/VDOMg9sj4+Zp73RJjvazmygkRvJxR52korSN0NC1HOR53NmeYCM8QqEmovCNffXC1XvmA1wg4mSM9RbmuPximoAQjpiQl0G9bH41SODj9BEVmdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749406107; c=relaxed/simple;
	bh=YRzBMWNvMQrUT0C6+8hN4fqFMs9saZah8OLG7lORPgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekz2WqdPUPuKPNEf+NI/1SF0hMyww5JFjEAD6gcMbtBlnKv4Ur3vD8RIUdN68MCcDo+AwEuyUotL0Jo9e4Fy/Zi4C02UiDjaOfcgPBN7gLQ5tyrrDTZWXgj9M3mcPZy3G04QO3YrR9sMJ1QJOJfwhhhmQ8JLRx1gf/iVUY6nV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2fpRLGQ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso39712416d6.1;
        Sun, 08 Jun 2025 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749406105; x=1750010905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFQ7caybu9rQddJ9irYmtvrlk/s+4EGu9XOi4WyXEX4=;
        b=H2fpRLGQvDAOf3FHksVqnhnzOAjKDggndoqXcASfB79emMMkGp3udfPTu8junaAJqd
         2rIpg7yLgG0t4ttzsF3wcqGXsAWrg/IYNncf0mKiI6g1rNsci5yKkQrL+pAvkoa1WsYE
         C4UygTGaMvlcRYcANDSDmaZgdiKbv0gWdoeulKbVuLigyuOhUOsNgGIK8QxZYrlV6DAL
         zu9e3M1BU/qvta6uBLiFxjpJmlRtLWvV0Ddheq87ZGskClj0hVDkGQKIRCcrq6nnHQMz
         YBYzFeWMVWH9kNrsERZfNS0QtVaBy1mP82HVIPRRcnzf9KqLfAfGPnzfYW+MQTkOOrqA
         Il1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749406105; x=1750010905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFQ7caybu9rQddJ9irYmtvrlk/s+4EGu9XOi4WyXEX4=;
        b=TqsmgPNqwNoJo0cyeAqHOWWZKrX7Ez7DVBlYaKVBtCzw7t7Zy11OEkPWM1Zc3/yxk+
         ku7IfWla04j0wN7ut24v3+TYUU+9D8p10sqSGdrRSb/kyZjVDMNBXZe+AZ+g+Lw/Z+MS
         NTduMJNtIZn+vPpR3aQmleGLpicX+OEqCtHgEnMAAd+QhTc0gUpsgTIFafH9YTRqjpSy
         egWYU/63HyF/zghCFqyCPJaQdOpkUZdVdtrmqhlCtPqYp07JcW/V2kA4HoK6zWLHTnr3
         kW2dXjTgP0RRM+f28Lfwr8RmBO+qLy5kxHpHyS6e+ubyDf4zYvXAlhb5EoGKSgEd1So8
         +73Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0gewzXNsXWRgLT9I2K3eZ3SVBICOI3QSxNlcYcYa2F7BnpA0FEhgSCIinWEF+/NlxNtHjirTA0qMD6/M9@vger.kernel.org, AJvYcCXmWVAJ9tBIayIiFziThPcFTVECsmaH5GI+ARAgWLPSGL7a+HbRUSFh1pRN6Y+3mG7tL8TwSI0bWcrEBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL1awRuW2tKZJQlFlo0+X0URY8FY/J7kGCmrYR1ka0QElq8zzY
	XQQz5hjyVzvkKYdXaNsqvaBAuHvx0FgJsv6DVVDt80Bs1lJHFt55PAVFRFaQgFloVW/3ytJ4rOL
	DjbAChAnsdzLu3ot828OdzmwgqsjfhdIVuQ==
X-Gm-Gg: ASbGncsJ3+ZfuiIq9NtuKveAP7dOXbao/G7x9BrLz6b76Zt19tCJpP4XhK9EA2lFSAM
	mI/ghk0s6CU2u/22TQfYxXjZ2TbQ5SpvE+FTucA/YrClSRfLdlzNLiknNNByjxeTUJnYMv2O2Cw
	pHSSStRSWLe3/sJIDaLAiK3U/IoemkWFILOg==
X-Google-Smtp-Source: AGHT+IF5V7NFVj1dygApgejA4rFQzCP0XZt02o2UIOL+T37G4goLT4zvr8qB+A+pOr1HXTAbaurTyJNNdQ3NK7avPuU=
X-Received: by 2002:ad4:5ce8:0:b0:6fa:cdc9:8afa with SMTP id
 6a1803df08f44-6fb08f54be2mr172769956d6.17.1749406104638; Sun, 08 Jun 2025
 11:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508210148.799578-1-titanv3585@gmail.com> <20250508214305.836406-1-titanv3585@gmail.com>
In-Reply-To: <20250508214305.836406-1-titanv3585@gmail.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Sun, 8 Jun 2025 11:08:13 -0700
X-Gm-Features: AX0GCFvczihxTsEvy0_u8di2ZRyXfc5GG-9Xlv3uaNVs6P8bJbpH6F2sUSHaYO8
Message-ID: <CAEc3jaCEENSMbWFcQyjWLP+4UPv3_2inARZLJsmXYF7zVbhkug@mail.gmail.com>
Subject: Re: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
To: Vadym Tytan <titanv3585@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the late reply (business travel / vacation). This is the
only code I left out during hid-playstation creation. At the time when
I added this to hid-sony it felt like a good idea. But we later found
out the console wasn't even using this code itself. We haven't had a
need for it in various embedded projects. The code had significant
impact on battery (especially when set to like 1ms). The timing itself
was not that stable, it made it better from the hardware side
(measured using a BT packet sniffer), but there is overhead in
bluetooth stacks, which makes the timing not that predictable

Do you have a strong use case or reason to add it back?

Thanks,
Roderick

On Thu, May 8, 2025 at 2:43=E2=80=AFPM Vadym Tytan <titanv3585@gmail.com> w=
rote:
>
> Between v6.1 and v6.2 versions of Linux kernel,
> DualShock4 related code was moved from `hid-sony.c`
> to `hid-playstation.c` (near DualSense code) and
> Bluetooth poll interval adjustment functionality was lost
>
> Signed-off-by: Vadym Tytan <titanv3585@gmail.com>
> ---
>  CREDITS                       |  4 +++
>  drivers/hid/hid-playstation.c | 64 +++++++++++++++++++++++++++++++++--
>  2 files changed, 65 insertions(+), 3 deletions(-)
>
> diff --git a/CREDITS b/CREDITS
> index f74d230992d6..137c3636e318 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -4001,6 +4001,10 @@ S: 44 Campbell Park Crescent
>  S: Edinburgh EH13 0HT
>  S: United Kingdom
>
> +N: Vadym Tytan
> +E: titanv3585@gmail.com
> +D: Minor game controllers features
> +
>  N: Thomas Uhl
>  E: uhl@sun1.rz.fh-heilbronn.de
>  D: Application programmer
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 1468fb11e39d..fd51f00b0516 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -337,7 +337,7 @@ struct dualsense_output_report {
>   * 0x3F - disabled
>   */
>  #define DS4_OUTPUT_HWCTL_BT_POLL_MASK  0x3F
> -/* Default to 4ms poll interval, which is same as USB (not adjustable). =
*/
> +/* Default to 4ms poll interval, which is same as USB (adjustable). */

The not adjustable referred to USB, which is not adjustable. So keep
that one the way it is.

>  #define DS4_BT_DEFAULT_POLL_INTERVAL_MS        4
>  #define DS4_OUTPUT_HWCTL_CRC32         0x40
>  #define DS4_OUTPUT_HWCTL_HID           0x80
> @@ -542,6 +542,7 @@ static inline void dualsense_schedule_work(struct dua=
lsense *ds);
>  static inline void dualshock4_schedule_work(struct dualshock4 *ds4);
>  static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, ui=
nt8_t green, uint8_t blue);
>  static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds=
4);
> +static int dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8=
_t interval);
>
>  /*
>   * Add a new ps_device to ps_devices if it doesn't exist.
> @@ -1738,6 +1739,43 @@ static struct ps_device *dualsense_create(struct h=
id_device *hdev)
>         return ERR_PTR(ret);
>  }
>
> +static ssize_t dualshock4_show_poll_interval(struct device *dev,
> +                               struct device_attribute
> +                               *attr, char *buf)
> +{
> +       struct hid_device *hdev =3D to_hid_device(dev);
> +       struct ps_device *ps_dev =3D hid_get_drvdata(hdev);
> +       struct dualshock4 *ds4 =3D container_of(ps_dev, struct dualshock4=
, base);
> +
> +       return sysfs_emit(buf, "%i\n", ds4->bt_poll_interval);
> +}
> +
> +static ssize_t dualshock4_store_poll_interval(struct device *dev,
> +                               struct device_attribute *attr,
> +                               const char *buf, size_t count)
> +{
> +       struct hid_device *hdev =3D to_hid_device(dev);
> +       struct ps_device *ps_dev =3D hid_get_drvdata(hdev);
> +       struct dualshock4 *ds4 =3D container_of(ps_dev, struct dualshock4=
, base);
> +       int ret;
> +       u8 interval;
> +
> +       if (kstrtou8(buf, 0, &interval))
> +               return -EINVAL;
> +
> +       ret =3D dualshock4_set_bt_poll_interval(ds4, interval);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +
> +struct device_attribute dev_attr_dualshock4_bt_poll_interval =3D {
> +       .attr   =3D { .name =3D "bt_poll_interval", .mode =3D 0644 },
> +       .show   =3D dualshock4_show_poll_interval,
> +       .store  =3D dualshock4_store_poll_interval,
> +};
> +
>  static void dualshock4_dongle_calibration_work(struct work_struct *work)
>  {
>         struct dualshock4 *ds4 =3D container_of(work, struct dualshock4, =
dongle_hotplug_worker);
> @@ -2493,6 +2531,9 @@ static void dualshock4_remove(struct ps_device *ps_=
dev)
>         struct dualshock4 *ds4 =3D container_of(ps_dev, struct dualshock4=
, base);
>         unsigned long flags;
>
> +       if (ps_dev->hdev->bus =3D=3D BUS_BLUETOOTH)
> +               device_remove_file(&ps_dev->hdev->dev, &dev_attr_dualshoc=
k4_bt_poll_interval);
> +
>         spin_lock_irqsave(&ds4->base.lock, flags);
>         ds4->output_worker_initialized =3D false;
>         spin_unlock_irqrestore(&ds4->base.lock, flags);
> @@ -2513,11 +2554,16 @@ static inline void dualshock4_schedule_work(struc=
t dualshock4 *ds4)
>         spin_unlock_irqrestore(&ds4->base.lock, flags);
>  }
>
> -static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint=
8_t interval)
> +static int dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8=
_t interval)
>  {
> +       if (interval >=3D DS4_OUTPUT_HWCTL_BT_POLL_MASK)
> +               return -EINVAL;
> +
>         ds4->bt_poll_interval =3D interval;
>         ds4->update_bt_poll_interval =3D true;
>         dualshock4_schedule_work(ds4);
> +
> +       return 0;
>  }
>
>  /* Set default lightbar color based on player. */
> @@ -2659,7 +2705,17 @@ static struct ps_device *dualshock4_create(struct =
hid_device *hdev)
>                         goto err;
>         }
>
> -       dualshock4_set_bt_poll_interval(ds4, DS4_BT_DEFAULT_POLL_INTERVAL=
_MS);
> +       if (hdev->bus =3D=3D BUS_BLUETOOTH) {
> +               ret =3D dualshock4_set_bt_poll_interval(ds4, DS4_BT_DEFAU=
LT_POLL_INTERVAL_MS);
> +               if (ret) {
> +                       hid_err(hdev, "Failed to set poll interval for Du=
alShock4: %d\n", ret);
> +                       goto err;
> +               }
> +
> +               ret =3D device_create_file(&hdev->dev, &dev_attr_dualshoc=
k4_bt_poll_interval);
> +               if (ret)
> +                       hid_warn(hdev, "can't create sysfs bt_poll_interv=
al attribute err: %d\n", ret);
> +       }
>
>         ret =3D ps_device_set_player_id(ps_dev);
>         if (ret) {
> @@ -2678,6 +2734,8 @@ static struct ps_device *dualshock4_create(struct h=
id_device *hdev)
>         return &ds4->base;
>
>  err:
> +       if (hdev->bus =3D=3D BUS_BLUETOOTH)
> +               device_remove_file(&hdev->dev, &dev_attr_dualshock4_bt_po=
ll_interval);
>         ps_devices_list_remove(ps_dev);
>         return ERR_PTR(ret);
>  }
> --
> 2.49.0
>
>

