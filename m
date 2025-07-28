Return-Path: <linux-input+bounces-13706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA62B14405
	for <lists+linux-input@lfdr.de>; Mon, 28 Jul 2025 23:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AAB53ADC60
	for <lists+linux-input@lfdr.de>; Mon, 28 Jul 2025 21:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15234225765;
	Mon, 28 Jul 2025 21:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IvbZJRHE"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE821EB5B;
	Mon, 28 Jul 2025 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753739285; cv=none; b=oeM3WCNMVVEL8hqVEuMB3tt46+6PJfgPmx6XvjWAto/bC2hMyhlzITQe6j3mQ+yS6BnIMUKwhrXF8aBVgzZ2959dzcrzpkI4RT/Nh2qvcLH0oRBcTBjaz30CG9933OCN+/z/iubqN6ARDhAtDFpsD+WSJlEhRMz/iKbIBncX/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753739285; c=relaxed/simple;
	bh=4433PIpt0cKrB9fJR5imMElT9aORtINpuQhy2/OTGyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7JahPNasyfcudRtYlgIdCFOkEblVjONzDiRCeFbvDy8P4HSjMySG04Qi4kmsl+lb5rgDpJel6UJV98N5qGFC3E0311FLsKaamiSpZAlu98riu1vBkIREKFsSJeCDwGfiqGgpdLMGYmznwayTQbuaFCDv9fFm4Io6gunU279DXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IvbZJRHE; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753739280; x=1754344080; i=w_armin@gmx.de;
	bh=zYyKlgF1twAF+GOSYvErVoZ1pzfEKSWLfY+QFdeJncE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IvbZJRHEIjIrCju8rDQ5rK7enR7rAMss5kq1xNo6M8s4aNdjXgP0bZ2A4kGb6erv
	 5N69+1kHvO1jEhRTvLeWOUxzvdx7jnl2XzPim9tnotKh6SVTyOd+mUHdSyDWzkKZ7
	 4Fo+sxtz30t0wCC80XWtUp+xX1MGA2/lap59ZF9WwzFAyf5qXcw2WD/w6Qlx1TvBA
	 CG6K+00WYTBLnrwkmaxgA5R3QSbquIu0z8DPElGrrYa+pcaU+NPrkWhtBfqivLiU9
	 AGut9RWZ8PK+k8hu5q7uAz15ck4CdxdkKA1Ma3G7CkJ7YwB/lBMSWR6u1o8lFLzku
	 ZQMrn5fQ+k5Hgjk8Rg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1v1KNH2euq-00JDtc; Mon, 28
 Jul 2025 23:47:59 +0200
Message-ID: <2aa477f3-526e-4b06-826a-83f95633c040@gmx.de>
Date: Mon, 28 Jul 2025 23:47:57 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Add WMI driver for Redmibook keyboard.
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Nikita Krasnov <nikita.nikita.krasnov@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>
References: <20250727223516.29244-1-foxido@foxido.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250727223516.29244-1-foxido@foxido.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sJ1shPZkp8Qq/nhtQPNRq8IxBzR4Y2RJH+gB9dBymOskof8yTj8
 Nj/0HcsMa2rG+CXTR8E782c2LRxEGSFwzLnOS3swU/nELZGmWlDJW/PM0LJ8oQ8iXFcHd7b
 /RLJH2fv7ja+qqYIH+iFUNjD6rlxWuh5I4rfKZeK1NqmJBDKocCJVQrUEBOCtKnY+SsvxpN
 TpmVN/d6z/IqqNxow/sHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2Ss5DlKt4QY=;J/seEG2hE015hacprILZaS8xhTV
 t6wSE7EAXQpaHqpxPKRvqFjYMY09ZFT4eLD6WNLCrhZPrL7qWLWj4RqJ+0cDo+jSqdnC/LRPA
 2CMG76B6CIuOxFAWEPuHY2sBKc55W3YtoYdjxfk0r9OqLEsRag+YpQxWM6eyIR13reiswvRYQ
 yrvjLphXunWbzqr/YRPoR1vC8giBSyfQEvxnyi87eix5mDEdhHIPauwcrP18AU+ncdNW9kDVo
 p+0DulcPh4w5aLif3hoptXyPiLOWUckJKlXb/Xrd5crhWvaK/b8H/R7IHcD7hf19Ujj1i4u+f
 u26sCBCFskGOEnLG+szUb96G6RSQRWr78r/qV9Kq4t9oK+EeK3mnuz4vNSAw3T2EtHPjSfCae
 OhqjhzHo5Ogm7jcXWnrBomn/74ELvgwsYoKuAHHsd4zcMAZoss8i+tIyAm/PGbrpf4z6zaYk5
 MmTAKXhX5G0WWe4OhGYKPpm59/Fxh793IxdHjZmxb3Gli9AeFxPMJv6dsEB4qN0+QQBjxkfG0
 T3OSkyYzdfqB9SOTyEdLwtEX0i8twufbZSLgYOxKyIF/BdGjIJzjh2phj4wylpFZvO89l5bgi
 m6oE4RU0f2Kz1M1X5KqTw4a4L6ZcaphQis29dcANoqbHd+FQkv87dN0p+ppkINg9EcMnS5MrI
 zVhvyuJhUxTAuXDt+91bwbR/0sXYTSreRr0YSqE6lP88nd9OFfr1/EnvMG4pfEGrQmM/iZ5Yw
 AMyhXzXXezPvw0XkbHX1Ea9pbXSJzr+Cb/Y3tP5cx1utt1Jg0HsIGs3G/xLVpB0G/fsw41y9J
 ZQ+wSUuBGr50xHQuD5J/mwQTDYLAUZlpvFC3Nrxw3H6lEcgUgc4BaHSvpvVu+2T/8yDYrg3di
 VcKSrWM0kswHEmjQTj27xTRM6r8UMyt//I3q/65/UbCj1ASFYv7/Ye8xv2ex6KSTb925SM3CE
 q4UL3Yo4lQIItK9rhEK8sZxBDOaCZQkraMiPPjhCz+M9ih43VNqJEIyt3yAFsk7jxu5oHB8VV
 p3lHQTGEsveNq13JVTdDWaYIQ8fe5Fz5AooXQ2xnsJPiT/pqQnRQr57THUBTqS9oEVnUesQOC
 FXNb89l0FtPqZrv+5Vr8Jf4A2oXcRYmOCVuWFfrkbbNZxNT8cOot3tyqH4gSrTRud2rxf0R0O
 PB6F7yZl9PtEy5s0Urk2v1l0yaNkfTOnToz+Lbv9xdwQJpETebQP2kdG6xRvmbzCT6BJWbV30
 YypGG2S9mt32kPI4zvfxtf1LeiobV7AbudnTy5zkeepzO084WIhV0plL1M5tibFVqY9acbEdD
 1o4FezLi0dzV6sgdtXhK1GD9TfxxH6WqLbsx/+nmZfNjAr7+4loFyoXK9N9AIDkAxFBhsh8E2
 WIHklpQNnA6y4uEsZeV9JiPj+lmb/+qe2VpsUUF3SWglaiDh7wLXZ4MWOAtgs5wdpMBhK6o2k
 LsxKCMfi8RwKRZLCI90aE6VlmkxV3W/PqfL4NNHP6OruiHMmTVZrXaNjM/QfTv0ezsqNzBgc+
 PmM+cYZtR3U1X530z4qaEUjpw3Uytce9H+naxnTF+5gEFEvHGz5LFfcQeMKMONwY/ZH+3dQH7
 Fq9kVr2Ii40Mu1oSbcEvLgky9MgP9F7zHf5Yx4DutIYdencHacLvJ0DVhwHaxTGFwsFuO1L3n
 OEkVOdzvLXTzAVr0GsI5+W/1eUaCWckkXyBcNSgifN3yck4hBSN/qCkX9u0Pwd+AxWkFe18ME
 gB4U9tbachhCxl2pwpJTdit4k2SrmJs4FKX92t58FguuAWIPqkFKIVKRERV+uXF4ilUZkqIDy
 QQVD+lPz/tKdyYZMyaPj2bkmnoaeHprkMFIFo8tZw777QzOTHTi2Sf8L2IhKVsf6HYpeLDOky
 yOppOSkhyhPgsTkE7h/B+8s8ih3h6iHNWnWt3V3CxKOlU16YcvyXqUzbT9m9ZCx3SZyuz4oFw
 9ud4JdXE8ttvIeA+L61WFI+R9TBxCgCCbde2Tk3FFczUTGg6cCArrzhnZEOkFael46OUrWJrT
 uP/duj0zSYBNxseyjyijYpAsLPXL7HiXuMYsK/6rpRsuaAVNiP6DM1r0zL2goGyq/7Egqe7m1
 QEkKM3Rj5Bm4TL+m1oSLDURa6CgpbF9N4GUfsDBlmORyC4/yERPHAhYsKR4iIpDxv1IhomkSd
 kkX5orAcrD+08JHOXhNPbstJL0/BdfRQKbWVZW9Nqzav1L+aGWVqqRrykVJxZcjx36fRzcm5y
 P3LW/VvjDfKNgkPewM2dGv+0wH9Pkuq8kQym56cbWb1nc7B1fKZM7WDbgShq8Vr+zGOVLxwtP
 ZwE4THT/zlI1+oaJpT6HsNTtLGTmZkFgsc9ZIqVcW8eMBtGCwYFjF5APQxdcxYoyIFK5izFka
 TqFbDN7DKa21PkedczQm0nyKJtTBns55kf3NJ5Zt0zwHFZ4UKualCVpJW9gDTeI27Dm3BGyTU
 HjJXZ8m5XYicts8s555yrvsjVzj3wfP8ARjcfkfzTXSpkTrsFWUQPuyBv1F1ost1mkdYU4ufP
 szu00DEEsbpTza3pCLFcFx6IPkEVt/y/y/X7GAR18z+mKID+DetEx5MXRG3b6LLJKMsHapBAr
 mpgTfjdwrhPebYzkDHn1Aki0hWWnyWnMOK9rQwBS2SBWHFlDfGlbcq+0jGtZeM/Hil4u8eEND
 yl9tmnBkd0irAs6MqnjaEHKZKFiwPoXFzMBOEN3qx1E9Zfhe613uvNKtgHqd1kNCVEqrpYVBQ
 JoioPINuPWtVNIx6bwQeVJOtg/2JNcGpN7b4usBFohUfoYSp9+oz9sLNEn81ZhlAp+7JAbLrK
 8nujxO5IMPblgEpZoktJ56LO/1HT+X+25ELtm3u0SyzqdNKTi5a7bqCaZy0UbcucNsLqLfRqC
 KibVBoXVVL4Cs3I2/9dZWDxjDezDmsHpoy9F4y5s+pn27KO69jpTVFclHpG/auh5lYPPpyyo9
 UsvL5O5XiAa40M4WnYpnzJ+9JophlK5PnTpGDSHbZ4i5sBumeVltM6WpZmynjDNciY7I7QMsz
 GdJJltYo/jvTpEBZAloqzVuo9dkJl0DQiPiYhX9RZFGAZp6cYIYS+ElOTGNoXvh0FbMh9c2YT
 M/M2/k483t9JysWTF4QUK88QLwm8SAR2HKcKIHvHSLB66inQATqzgPzpYDcbczQFHO4Qv5NjR
 QApfdZzBXsN29aKFfqKDK6+w26DEe3yVfdXGYeX2s00Y7rGCgVgupr1ejwtla8G6fGOwQAdDm
 K0haNvqzHxkz05NVUQtIu11TR7xMrSAS0fHBHnJlmzN79rvUC1BQxSMC/r2bjsfGf0ZsfT/iB
 3w7deaLYrIfkkmCwKdUnA+6B2ufG3aNP+BFnylvhPbeG68mrPGCStZtWOLz93G84elbSHqq4r
 HgIFTgDRSyXfdE63XbeJOcUPB5Ygl7j3s/K0yMEqdzT4sThL/ETYA2yQnX3HKyczuzEp9RA5o
 Q6X32AKkf9CTVzjAdy4bM7f8REzObjrLOsj87bAt2RsrXIOnyiVcf0+4yoqbTnAa96uNhBTe+
 i97sCW/VOt9P6MHmrFnMMsmONKSuTjeK6r+l4toVAIS9

Am 28.07.25 um 00:34 schrieb Gladyshev Ilya:

> This driver implements support for various Fn keys (like Cut) and Xiaomi
> specific AI button.

Interesting, i was just talking with another person about implementing a W=
MI event
driver for the exact same WMI event device. I CCed the person involved in =
the discussion
so that he can test this driver on his device as well.

All in all the driver looks promising, but there are still things that nee=
d to be improved
before we can include this driver in the mainline kernel. For details see =
below.

Also please CC the linux input mailing list in the future so that they can=
 give feedback as well.

> Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
> ---
>   MAINTAINERS                      |   6 ++
>   drivers/platform/x86/Kconfig     |  10 ++
>   drivers/platform/x86/Makefile    |   1 +
>   drivers/platform/x86/redmi-wmi.c | 164 +++++++++++++++++++++++++++++++
>   4 files changed, 181 insertions(+)
>   create mode 100644 drivers/platform/x86/redmi-wmi.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10850512c118..b3956f3d2eb8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20965,6 +20965,12 @@ S:	Maintained
>   T:	git https://github.com/pkshih/rtw.git
>   F:	drivers/net/wireless/realtek/rtw89/
>  =20
> +REDMIBOOK WMI DRIVERS
> +M:	Gladyshev Ilya <foxido@foxido.dev>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/redmi-wmi.c
> +
>   REDPINE WIRELESS DRIVER
>   L:	linux-wireless@vger.kernel.org
>   S:	Orphan
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e5cbd58a99f3..b8d426e6b5a3 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -109,6 +109,16 @@ config XIAOMI_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called xiaomi-wmi.
>  =20
> +config REDMI_WMI
> +	tristate "Redmibook WMI key driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	help
> +	  Say Y here if you want to support WMI-based keys on Redmibooks.

"Say Y here if you want support for WMI-based hotkey events on Xiaomi Redm=
i devices."

> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called redmi-wmi.
> +
>   config GIGABYTE_WMI
>   	tristate "Gigabyte WMI temperature driver"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index abbc2644ff6d..56903d7408cd 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+=3D huawei-wmi.o
>   obj-$(CONFIG_MXM_WMI)			+=3D mxm-wmi.o
>   obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+=3D nvidia-wmi-ec-backlight.o
>   obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
> +obj-$(CONFIG_REDMI_WMI)			+=3D redmi-wmi.o
>   obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
>  =20
>   # Acer
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/red=
mi-wmi.c
> new file mode 100644
> index 000000000000..0bb6ea7b1081
> --- /dev/null
> +++ b/drivers/platform/x86/redmi-wmi.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* WMI driver for Xiaomi Redmibooks */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/wmi.h>
> +
> +#include <uapi/linux/input-event-codes.h>
> +
> +#define WMI_REDMIBOOK_KEYBOARD_EVENT_GUID "46c93e13-ee9b-4262-8488-563b=
ca757fef"
> +
> +/* Supported WMI keys ... */
> +#define ACPI_CUT_PAYLOAD		0x00000201
> +#define ACPI_ALL_APPS_PAYLOAD		0x00000301
> +#define ACPI_SETUP_PAYLOAD		0x00001b01
> +#define ACPI_CST_KEY_PRESS_PAYLOAD	0x00011801
> +#define ACPI_CST_KEY_RELEASE_PAYLOAD	0x00011901
> +
> +/* ... and their mappings */
> +#define WMI_CUT_KEY		KEY_PROG1
> +#define WMI_ALL_APPS_KEY	KEY_ALL_APPLICATIONS
> +#define WMI_SETUP_KEY		KEY_SETUP
> +#define WMI_CST_KEY		KEY_ASSISTANT
> +

Why not using sparse-keymap for this?

> +/* Keyboard backlight key (not supported yet) */
> +#define BACKLIGHT_LEVEL_0_PAYLOAD	0x00000501
> +#define BACKLIGHT_LEVEL_1_PAYLOAD	0x00800501
> +#define BACKLIGHT_LEVEL_2_PAYLOAD	0x00050501
> +#define BACKLIGHT_LEVEL_3_PAYLOAD	0x000a0501
> +
> +struct redmi_wmi {
> +	struct input_dev *input_dev;
> +	/* Protects the key event sequence */
> +	struct mutex key_lock;
> +};
> +
> +static void redmi_mutex_destroy(void *data)
> +{
> +	struct mutex *lock =3D data;
> +
> +	mutex_destroy(lock);
> +}
> +
> +static int redmi_wmi_probe(struct wmi_device *wdev, const void *context=
)
> +{
> +	struct redmi_wmi *data;
> +	int ret;
> +
> +	/* Init dev */
> +	data =3D devm_kzalloc(&wdev->dev, sizeof(struct redmi_wmi), GFP_KERNEL=
);

sizeof(struct redmi_wmi) -> sizeof(*data)

> +	if (!data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	/* Init mutex & setup destroy at exit */
> +	mutex_init(&data->key_lock);
> +	ret =3D devm_add_action_or_reset(&wdev->dev, redmi_mutex_destroy, &dat=
a->key_lock);
> +	if (ret < 0)
> +		return ret;

Please use devm_mutex_init() instead. You can also drop the comment then.

> +
> +	/* Setup input device */
> +	data->input_dev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_dev)
> +		return -ENOMEM;
> +	data->input_dev->name =3D "Redmibook WMI keys";
> +	data->input_dev->phys =3D "wmi/input0";
> +
> +	set_bit(EV_KEY, data->input_dev->evbit);
> +
> +	/* "Cut" key*/
> +	set_bit(WMI_CUT_KEY, data->input_dev->keybit);
> +	/* "All apps" key*/
> +	set_bit(WMI_ALL_APPS_KEY, data->input_dev->keybit);
> +	/* "Settings" key */
> +	set_bit(WMI_SETUP_KEY, data->input_dev->keybit);
> +	/* Custom (AI?) key */
> +	set_bit(WMI_CST_KEY, data->input_dev->keybit);

Please use sparse-keymap for setting up all of this.

> +
> +	return input_register_device(data->input_dev);
> +}
> +
> +static void press_and_release_key(struct input_dev *dev, unsigned int c=
ode)
> +{
> +	input_report_key(dev, code, 1);
> +	input_sync(dev);
> +	input_report_key(dev, code, 0);
> +	input_sync(dev);
> +}

Using sparse-keymap would allow you to drop this function and instead rely=
 on the autorelease
functionality of sparse-keymap instead.

> +
> +static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
> +{
> +	struct redmi_wmi *data =3D dev_get_drvdata(&wdev->dev);
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
> +		return;
> +	}
> +
> +	if (obj->buffer.length < 4) {
> +		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length)=
;
> +		return;
> +	}

The MOF description of the WMI event looks like this:

class WMIEvent : __ExtrinsicEvent {
};

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root=
/WMI/HID_EVENT20"), guid("{46c93e13-ee9b-4262-8488-563bca757fef}")]
class HID_EVENT20 : WmiEvent {
   [key, read] string InstanceName;
   [read] boolean Active;
   [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDet=
ail[32];
};

As you can see the buffer should contain at least 32 bytes. Please check t=
his even when you are only using the
first 4 bytes as some WMI events might return fewer than 32 bytes of data =
in order to signal a firmware error.

> +
> +	/* For linearizability */
> +	guard(mutex)(&data->key_lock);
> +
> +	u32 payload =3D ((u32 *)obj->buffer.pointer)[0];

Please use get_unaligned_le32() from linux/unaligned.h as the buffer might=
 not
be properly aligned for 32 bit integers.

> +
> +	switch (payload) {
> +	case ACPI_CUT_PAYLOAD:
> +		press_and_release_key(data->input_dev, WMI_CUT_KEY);
> +		break;
> +	case ACPI_ALL_APPS_PAYLOAD:
> +		press_and_release_key(data->input_dev, WMI_ALL_APPS_KEY);
> +		break;
> +	case ACPI_SETUP_PAYLOAD:
> +		press_and_release_key(data->input_dev, WMI_SETUP_KEY);
> +		break;
> +	case ACPI_CST_KEY_PRESS_PAYLOAD:
> +		input_report_key(data->input_dev, WMI_CST_KEY, 1);
> +		input_sync(data->input_dev);
> +		break;
> +	case ACPI_CST_KEY_RELEASE_PAYLOAD:
> +		input_report_key(data->input_dev, WMI_CST_KEY, 0);
> +		input_sync(data->input_dev);
> +		break;
> +	case BACKLIGHT_LEVEL_0_PAYLOAD:
> +	case BACKLIGHT_LEVEL_1_PAYLOAD:
> +	case BACKLIGHT_LEVEL_2_PAYLOAD:
> +	case BACKLIGHT_LEVEL_3_PAYLOAD:
> +		pr_debug("keyboard backlight WMI event, no action");
> +		break;
> +	default:
> +		pr_debug("unsupported Redmibook WMI event with 4byte payload %u", pay=
load);

Please use dev_dbg() here. Also using sparse-keymap would allow you to ski=
p all of this and
instead let the input subsystem do the matching.

> +		break;
> +	}
> +}
> +
> +static const struct wmi_device_id redmi_wmi_id_table[] =3D {
> +	{ .guid_string =3D WMI_REDMIBOOK_KEYBOARD_EVENT_GUID },
> +	/* Terminating entry */

Pointless commit, please remove.

Thanks,
Armin Wolf

> +	{ }
> +};
> +
> +static struct wmi_driver redmi_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "redmi-wmi",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS
> +	},
> +	.id_table =3D redmi_wmi_id_table,
> +	.probe =3D redmi_wmi_probe,
> +	.notify =3D redmi_wmi_notify,
> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(redmi_wmi_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, redmi_wmi_id_table);
> +MODULE_AUTHOR("Gladyshev Ilya <foxido@foxido.dev>");
> +MODULE_DESCRIPTION("Redmibook WMI driver");
> +MODULE_LICENSE("GPL");

