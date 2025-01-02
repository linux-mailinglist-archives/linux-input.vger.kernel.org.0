Return-Path: <linux-input+bounces-8849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F39FFAFF
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 16:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 333B2160484
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 15:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903D51AF0C7;
	Thu,  2 Jan 2025 15:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Gb+MD+BA"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092D522F;
	Thu,  2 Jan 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735831728; cv=none; b=j1flXpHbffqaI1pX4jvB/GFK/hm6v+Un0ZwQRazUPtfic4F1Buq+M8svL9uiwc2bwdUsutbqAnK07j7uLSVo5l43ipmhg11GlVKhUjSvNeXLB0qI57bb7Qoe59GtmrXZ1EvV1RI0eJ8xaaRMi4+k8C+/CkvS0WMoZYD2eqyMEQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735831728; c=relaxed/simple;
	bh=eQts9Ut/yxzRHPeIcieJEApu6AEeHfG+mcEFJASL5r0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jv05ppNcsvPaMw5K8Ej2fdfVze2ynDf73+SRyTCVR4MI2CuFQnof720TQsn3L7CESBXGN/yWSU8HilWfRzoIj+CH28lxWS0U3nWcEnAURD1nzJT902eO4RohH+JGOXgy0HT8kx2pXmWIwLBCMDa4MONn5gnyCdGJUaQvZT8eU10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Gb+MD+BA; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735831723; x=1736436523; i=w_armin@gmx.de;
	bh=/d7ohZEcMFMyy/ARCWKZyzJMq1mOSFI8j85eYZASREw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Gb+MD+BAlcCLFbIajmNrA6HRJ3m9ot9vOsMXBXDrwxDzXkuLaq8qVQEY6eBrY2Ff
	 Q54IZB5axMdZ83pPSEch7PLWnMO1TgCD136bCsC+yJ+HlHluUTBAAftjK3WGxvXTh
	 Jr1LYN8Z+GTRNxAjztiafXyh2bCwTH2KBJWMLXZHi8FybI2gK14kxv9looZCI/E4Q
	 rrDevidPUVu3mLwqGL9qeZil424begEOEt8HeyBHaubRNhw3iebsmwBq4vEZOeHD0
	 qAyYTnc9yasWQ4C1PwWZZAGAKrrI1ZPGQHWrIaVMLoN8ceb3ebXgl/LNzqGWUzx0W
	 0rm9w1yoeLMxbYho+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNpH-1tuzEV3urF-00hlqm; Thu, 02
 Jan 2025 16:28:43 +0100
Message-ID: <b44f5e56-e05a-4f0e-a9e0-2b5fe5cefa1f@gmx.de>
Date: Thu, 2 Jan 2025 16:28:40 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Input: i8042 - Add support for platform filter
 contexts
From: Armin Wolf <W_Armin@gmx.de>
To: dmitry.torokhov@gmail.com, o2g.org.ru@gmail.com
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 corentin.chary@gmail.com, luke@ljones.dev, mjg59@srcf.ucam.org,
 pali@kernel.org, eric.piel@tremplin-utc.net, jlee@suse.com,
 kenneth.t.chan@gmail.com, coproscefalo@gmail.com,
 linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, josh@joshuagrisham.com
References: <20241222215042.7709-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20241222215042.7709-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QSqWAFTafiXFnpUff4JHENEVx/NtCubtKNUa1khwbSMNzkp6YMS
 dvgSi3VpP0eqVROTUwXTMjFcAilrG/UEQVlfxY1sC+RM7ED7hlj3jHx3JmHBBfeW7jipfPG
 hGomUWZt5ybjsGa5NA4O3iZ9PTZSAurivaIxRINW/4xX1e2i8Y9aEMqcz6e7xtXBPZiF+/4
 wJBEao84ZxpbxtultSUWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TvlIa9L+FGg=;zbH3ZtcHinAgOj5fJNxLh9uSRe7
 2IOXb0k3WXhBDfhPMzoGR80XwTr8xEP9QKmXyFcZ497U9qc+4HHigpRSGbIaWB05iRhie18VD
 sgL4WJEEYSDBsCT5+BNtM7E66qBvfYaLmtETzPl66O6ojhs7Dfcvtov7udteTSuJn1WwBRxgh
 CpkCVxWTLFy061mnc62FB/yXwcUSU02MZo5M2uiMyTBUI5gLdYzgoddi597dzkJuoYP5ACe4O
 EIQjIGjnOOFOhMkDeApn4KunHBHhCCg+fGL97qbVpxbaHGaE0AC77X7Yl+phOQJNLpTRxl1+p
 ZkZJ7u45dwGWGmlZYPC/oZBq/UwDwNZFy3x5daboZt3pGvfJF/ZSCR2fs3M5+ZeAEjKDobqPp
 skDAXVl0KT4LSnYEYmrzv+ECpnq3Vs58oc3Y0oBNtTjUp40axjfr5/gC8hObovQ2rZOOfGQri
 egrNfaGIu43AlDBFzydFzlHNeEpC1ISo9uexYmpUZX8mCt0jecOTIxv6zHOCfEscnzv/3H8OR
 1Y8/ub4VqRrQVTfK8Nv4S/QCrLHQ/GRItUf6aHnL2vL9+AzHoZ5CGRbIS8FQGB0t41hQnna8c
 BQUg4xBsO1+RAVrQYAMJwnwQWA3oeNMpqYhfMhtADEa1S8bwhO7pIOHblYPV7HSx45aniLgNF
 fZ50PHnY2jRxslnm+R04gdlKyj2E3bW0DeJ79OrLwnUdz4LX2PMv2rwe4Prd5xXgtHEFPCFPk
 mSftMWuPLI2ZyhIaxTxuaZR8KP/994rtYIU+bErFOplEHp7GUuky7BO0etMO4flGDLXZNfQyO
 iUwxDGZnz3cmRwQXnYCQtrGS170MjykerD6stb3yvAI7SBQ+cbNY9ybvs1hGHyIB3J0lGBC2k
 NZDCzlgV8ZnwPdCblSqIxSPg9HzDfIdWxrzzRpScb04lGANCA+JcNZklTpzTX2MXBtYr60eep
 +U/bN5tjHK9JWDCxF3ZaN3V1W+YmtksKBfbZREAyHg48f8fHlDVAVc8o3wSqlyKcZS4at2s7o
 +r+Xbk6B9Z6Oq84PWTmBKW/JPzkOju8uNIOkCknui91rMj+9/575SH0ngawYxXaLWfxe3JmB2
 pBXh00OBgN1osmDBJj0A9exrnMFPHs

Am 22.12.24 um 22:50 schrieb Armin Wolf:

> Currently the platform filter cannot access any driver-specific state
> which forces drivers installing a i8042 filter to have at least some
> kind of global pointer for their filter.
>
> This however might cause issues should such a driver probe multiple
> devices. Fix this by allowing callers of i8042_install_filter() to
> submit a context pointer which is then passed to the i8042 filter.
>
> Also introduce a separate type for the i8042 filter (i8042_filter_t)
> so that the function definitions can stay compact.
>
> Tested on a Dell Inspiron 3505.

Any updates on this?

Thanks,
Armin Wolf

>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Changes since v1:
> - add kerneldoc for new typedef
> - add Reviewed-by tag
> ---
>   drivers/input/misc/ideapad_slidebar.c   |  4 ++--
>   drivers/input/serio/i8042.c             | 17 ++++++++-------
>   drivers/platform/x86/asus-nb-wmi.c      |  3 ++-
>   drivers/platform/x86/asus-wmi.c         |  2 +-
>   drivers/platform/x86/asus-wmi.h         |  3 +--
>   drivers/platform/x86/dell/dell-laptop.c |  6 +++---
>   drivers/platform/x86/hp/hp_accel.c      |  4 ++--
>   drivers/platform/x86/msi-laptop.c       |  6 +++---
>   drivers/platform/x86/panasonic-laptop.c |  4 ++--
>   drivers/platform/x86/toshiba_acpi.c     |  4 ++--
>   include/linux/i8042.h                   | 28 ++++++++++++++++++-------
>   11 files changed, 48 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/input/misc/ideapad_slidebar.c b/drivers/input/misc/=
ideapad_slidebar.c
> index f6e5fc807b4d..ab2e0a401904 100644
> --- a/drivers/input/misc/ideapad_slidebar.c
> +++ b/drivers/input/misc/ideapad_slidebar.c
> @@ -121,7 +121,7 @@ static void slidebar_mode_set(u8 mode)
>   }
>
>   static bool slidebar_i8042_filter(unsigned char data, unsigned char st=
r,
> -				  struct serio *port)
> +				  struct serio *port, void *context)
>   {
>   	static bool extended =3D false;
>
> @@ -219,7 +219,7 @@ static int __init ideapad_probe(struct platform_devi=
ce* pdev)
>   	input_set_capability(slidebar_input_dev, EV_ABS, ABS_X);
>   	input_set_abs_params(slidebar_input_dev, ABS_X, 0, 0xff, 0, 0);
>
> -	err =3D i8042_install_filter(slidebar_i8042_filter);
> +	err =3D i8042_install_filter(slidebar_i8042_filter, NULL);
>   	if (err) {
>   		dev_err(&pdev->dev,
>   			"Failed to install i8042 filter: %d\n", err);
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index 509330a27880..cab5a4c5baf5 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -179,8 +179,8 @@ static struct platform_device *i8042_platform_device=
;
>   static struct notifier_block i8042_kbd_bind_notifier_block;
>
>   static bool i8042_handle_data(int irq);
> -static bool (*i8042_platform_filter)(unsigned char data, unsigned char =
str,
> -				     struct serio *serio);
> +static i8042_filter_t i8042_platform_filter;
> +static void *i8042_platform_filter_context;
>
>   void i8042_lock_chip(void)
>   {
> @@ -194,8 +194,7 @@ void i8042_unlock_chip(void)
>   }
>   EXPORT_SYMBOL(i8042_unlock_chip);
>
> -int i8042_install_filter(bool (*filter)(unsigned char data, unsigned ch=
ar str,
> -					struct serio *serio))
> +int i8042_install_filter(i8042_filter_t filter, void *context)
>   {
>   	guard(spinlock_irqsave)(&i8042_lock);
>
> @@ -203,12 +202,12 @@ int i8042_install_filter(bool (*filter)(unsigned c=
har data, unsigned char str,
>   		return -EBUSY;
>
>   	i8042_platform_filter =3D filter;
> +	i8042_platform_filter_context =3D context;
>   	return 0;
>   }
>   EXPORT_SYMBOL(i8042_install_filter);
>
> -int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned cha=
r str,
> -				       struct serio *port))
> +int i8042_remove_filter(i8042_filter_t filter)
>   {
>   	guard(spinlock_irqsave)(&i8042_lock);
>
> @@ -216,6 +215,7 @@ int i8042_remove_filter(bool (*filter)(unsigned char=
 data, unsigned char str,
>   		return -EINVAL;
>
>   	i8042_platform_filter =3D NULL;
> +	i8042_platform_filter_context =3D NULL;
>   	return 0;
>   }
>   EXPORT_SYMBOL(i8042_remove_filter);
> @@ -480,7 +480,10 @@ static bool i8042_filter(unsigned char data, unsign=
ed char str,
>   		}
>   	}
>
> -	if (i8042_platform_filter && i8042_platform_filter(data, str, serio)) =
{
> +	if (!i8042_platform_filter)
> +		return false;
> +
> +	if (i8042_platform_filter(data, str, serio, i8042_platform_filter_cont=
ext)) {
>   		dbg("Filtered out by platform filter\n");
>   		return true;
>   	}
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/a=
sus-nb-wmi.c
> index ef04d396f61c..a3d4b98045f8 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -50,7 +50,8 @@ MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: =
-1:auto 0:disable 1:kbd-do
>   static struct quirk_entry *quirks;
>   static bool atkbd_reports_vol_keys;
>
> -static bool asus_i8042_filter(unsigned char data, unsigned char str, st=
ruct serio *port)
> +static bool asus_i8042_filter(unsigned char data, unsigned char str, st=
ruct serio *port,
> +			      void *context)
>   {
>   	static bool extended_e0;
>   	static bool extended_e1;
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus=
-wmi.c
> index fdeebab96fc0..6c674de60ec0 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4824,7 +4824,7 @@ static int asus_wmi_add(struct platform_device *pd=
ev)
>   	}
>
>   	if (asus->driver->i8042_filter) {
> -		err =3D i8042_install_filter(asus->driver->i8042_filter);
> +		err =3D i8042_install_filter(asus->driver->i8042_filter, NULL);
>   		if (err)
>   			pr_warn("Unable to install key filter - %d\n", err);
>   	}
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus=
-wmi.h
> index d02f15fd3482..018dfde4025e 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -73,8 +73,7 @@ struct asus_wmi_driver {
>   	void (*key_filter) (struct asus_wmi_driver *driver, int *code,
>   			    unsigned int *value, bool *autorelease);
>   	/* Optional standard i8042 filter */
> -	bool (*i8042_filter)(unsigned char data, unsigned char str,
> -			     struct serio *serio);
> +	i8042_filter_t		i8042_filter;
>
>   	int (*probe) (struct platform_device *device);
>   	void (*detect_quirks) (struct asus_wmi_driver *driver);
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/=
x86/dell/dell-laptop.c
> index 5671bd0deee7..58b860b88fff 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -725,8 +725,8 @@ static void dell_update_rfkill(struct work_struct *i=
gnored)
>   }
>   static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
>
> -static bool dell_laptop_i8042_filter(unsigned char data, unsigned char =
str,
> -			      struct serio *port)
> +static bool dell_laptop_i8042_filter(unsigned char data, unsigned char =
str, struct serio *port,
> +				     void *context)
>   {
>   	static bool extended;
>
> @@ -884,7 +884,7 @@ static int __init dell_setup_rfkill(void)
>   		pr_warn("Unable to register dell rbtn notifier\n");
>   		goto err_filter;
>   	} else {
> -		ret =3D i8042_install_filter(dell_laptop_i8042_filter);
> +		ret =3D i8042_install_filter(dell_laptop_i8042_filter, NULL);
>   		if (ret) {
>   			pr_warn("Unable to install key filter\n");
>   			goto err_filter;
> diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/h=
p/hp_accel.c
> index 39a6530f5072..10d5af18d639 100644
> --- a/drivers/platform/x86/hp/hp_accel.c
> +++ b/drivers/platform/x86/hp/hp_accel.c
> @@ -267,7 +267,7 @@ static struct delayed_led_classdev hpled_led =3D {
>   };
>
>   static bool hp_accel_i8042_filter(unsigned char data, unsigned char st=
r,
> -				  struct serio *port)
> +				  struct serio *port, void *context)
>   {
>   	static bool extended;
>
> @@ -326,7 +326,7 @@ static int lis3lv02d_probe(struct platform_device *d=
evice)
>   	/* filter to remove HPQ6000 accelerometer data
>   	 * from keyboard bus stream */
>   	if (strstr(dev_name(&device->dev), "HPQ6000"))
> -		i8042_install_filter(hp_accel_i8042_filter);
> +		i8042_install_filter(hp_accel_i8042_filter, NULL);
>
>   	INIT_WORK(&hpled_led.work, delayed_set_status_worker);
>   	ret =3D led_classdev_register(NULL, &hpled_led.led_classdev);
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/ms=
i-laptop.c
> index e5391a37014d..c4b150fa093f 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -806,8 +806,8 @@ static void msi_send_touchpad_key(struct work_struct=
 *ignored)
>   }
>   static DECLARE_DELAYED_WORK(msi_touchpad_dwork, msi_send_touchpad_key)=
;
>
> -static bool msi_laptop_i8042_filter(unsigned char data, unsigned char s=
tr,
> -				struct serio *port)
> +static bool msi_laptop_i8042_filter(unsigned char data, unsigned char s=
tr, struct serio *port,
> +				    void *context)
>   {
>   	static bool extended;
>
> @@ -996,7 +996,7 @@ static int __init load_scm_model_init(struct platfor=
m_device *sdev)
>   	if (result)
>   		goto fail_input;
>
> -	result =3D i8042_install_filter(msi_laptop_i8042_filter);
> +	result =3D i8042_install_filter(msi_laptop_i8042_filter, NULL);
>   	if (result) {
>   		pr_err("Unable to install key filter\n");
>   		goto fail_filter;
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/=
x86/panasonic-laptop.c
> index 22ca70eb8227..2987b4db6009 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -260,7 +260,7 @@ struct pcc_acpi {
>    * keypress events over the PS/2 kbd interface, filter these out.
>    */
>   static bool panasonic_i8042_filter(unsigned char data, unsigned char s=
tr,
> -				   struct serio *port)
> +				   struct serio *port, void *context)
>   {
>   	static bool extended;
>
> @@ -1100,7 +1100,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device =
*device)
>   		pcc->platform =3D NULL;
>   	}
>
> -	i8042_install_filter(panasonic_i8042_filter);
> +	i8042_install_filter(panasonic_i8042_filter, NULL);
>   	return 0;
>
>   out_platform:
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/=
toshiba_acpi.c
> index 78a5aac2dcfd..5ad3a7183d33 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -2755,7 +2755,7 @@ static int toshiba_acpi_enable_hotkeys(struct tosh=
iba_acpi_dev *dev)
>   }
>
>   static bool toshiba_acpi_i8042_filter(unsigned char data, unsigned cha=
r str,
> -				      struct serio *port)
> +				      struct serio *port, void *context)
>   {
>   	if (str & I8042_STR_AUXDATA)
>   		return false;
> @@ -2915,7 +2915,7 @@ static int toshiba_acpi_setup_keyboard(struct tosh=
iba_acpi_dev *dev)
>   	if (ec_handle && acpi_has_method(ec_handle, "NTFY")) {
>   		INIT_WORK(&dev->hotkey_work, toshiba_acpi_hotkey_work);
>
> -		error =3D i8042_install_filter(toshiba_acpi_i8042_filter);
> +		error =3D i8042_install_filter(toshiba_acpi_i8042_filter, NULL);
>   		if (error) {
>   			pr_err("Error installing key filter\n");
>   			goto err_free_dev;
> diff --git a/include/linux/i8042.h b/include/linux/i8042.h
> index 95b07f8b77fe..00037c13abc8 100644
> --- a/include/linux/i8042.h
> +++ b/include/linux/i8042.h
> @@ -54,15 +54,29 @@
>
>   struct serio;
>
> +/**
> + * typedef i8042_filter_t - i8042 filter callback
> + * @data: Data received by the i8042 controller
> + * @str: Status register of the i8042 controller
> + * @serio: Serio of the i8042 controller
> + * @context: Context pointer associated with this callback
> + *
> + * This represents a i8042 filter callback which can be used with i8042=
_install_filter()
> + * and i8042_remove_filter() to filter the i8042 input for platform-spe=
cific key codes.
> + *
> + * Context: Interrupt context.
> + * Returns: true if the data should be filtered out, false if otherwise=
.
> + */
> +typedef bool (*i8042_filter_t)(unsigned char data, unsigned char str, s=
truct serio *serio,
> +			       void *context);
> +
>   #if defined(CONFIG_SERIO_I8042) || defined(CONFIG_SERIO_I8042_MODULE)
>
>   void i8042_lock_chip(void);
>   void i8042_unlock_chip(void);
>   int i8042_command(unsigned char *param, int command);
> -int i8042_install_filter(bool (*filter)(unsigned char data, unsigned ch=
ar str,
> -					struct serio *serio));
> -int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned cha=
r str,
> -				       struct serio *serio));
> +int i8042_install_filter(i8042_filter_t filter, void *context);
> +int i8042_remove_filter(i8042_filter_t filter);
>
>   #else
>
> @@ -79,14 +93,12 @@ static inline int i8042_command(unsigned char *param=
, int command)
>   	return -ENODEV;
>   }
>
> -static inline int i8042_install_filter(bool (*filter)(unsigned char dat=
a, unsigned char str,
> -					struct serio *serio))
> +static inline int i8042_install_filter(i8042_filter_t filter, void *con=
text)
>   {
>   	return -ENODEV;
>   }
>
> -static inline int i8042_remove_filter(bool (*filter)(unsigned char data=
, unsigned char str,
> -				       struct serio *serio))
> +static inline int i8042_remove_filter(i8042_filter_t filter)
>   {
>   	return -ENODEV;
>   }
> --
> 2.39.5
>
>

