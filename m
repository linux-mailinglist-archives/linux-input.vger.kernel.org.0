Return-Path: <linux-input+bounces-11060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AFFA6C2D8
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 19:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6CC3B3B34
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 18:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB1F22D7BA;
	Fri, 21 Mar 2025 18:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="F60sIcSK"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBDE22FDE6;
	Fri, 21 Mar 2025 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742583360; cv=none; b=swMNE4TN97a/VNlnMMM03xQPnzgiqrWt6SEPdeJZHp/xD7rgDECdBaND0pRM4SGL2GCO9mIrrLLr4wVJjzAp1TvZHb/cFc+7GszLIcGRDA1T55CkLQx9i94GV2ljlpSRZp5pQhK3vre6v3AFtIX8STHlXn6yP/aSxDP0Nre7AnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742583360; c=relaxed/simple;
	bh=x05Plpmeo1PJj+6dTFmuKDs2+xe1nWBOFu4P+azMJ4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxV+U3zjUVQvutd9A2+KnZGnbwf31L44Zj0IKcIJfKpH9yL7HvKh+X4w57YKAwA3uj1osgYHRGq8q/brYRgbk6IlDonChaCfuX75NSjgWj2TUviCSowAndvnXSLGJtlRSJdv8rRDgPgma9rqDipH4EV89GKFs228XNKeVheCEco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=F60sIcSK; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 89BDD2E0958E;
	Fri, 21 Mar 2025 20:55:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742583349;
	bh=9H7yx/twSjz/Jy9BzXd3yKQXbaiYBBXr72AU2+qsP8w=;
	h=Received:From:Subject:To;
	b=F60sIcSKrVpXFedq9e9x6KhtcPNhL54jXz3IYgEZjHxP8DLlxNV/rvT9cyuLWSl+G
	 KJf1cu+8ZTtBUMImsLdNc38qgXRCND0v2wDytt02Is1/UUq+xXQl6JrdDQDpPeOcKG
	 9JQerPECk8p87PHqhmB8paI/NNCRMiTTt6vVDpH4=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30b83290b7bso24473381fa.1;
        Fri, 21 Mar 2025 11:55:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZZAgs/nsHxm1SWrTtorfHE/Bc6PSsZAx6XO9V2jtqLVAhmRVPsuf+XUjLIMoIT6olmiG+WTi/Xpzdx2ulS+xJZI072Q==@vger.kernel.org,
 AJvYcCWtFuj+SbkgVT2s2wTT25YIoreGE/CGEDpjbQKPZwM3eYiJ/QnomZKYT2WafchCpbdXLRjRWVEobuXNVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMC5gbOO1PEGPbKYUCO0KIgnSHaf8q+DT5TGC6gj+cxAgzfPGW
	PBhaNKihy5Bws6yoDsngQmAq8j6tOmH3ko026pH2TZd5t71Hfxy0j3MsHmrxv72cfCq6hySsyh0
	s4ZWwYZHQ7vE+uqkXJLyxFsak8C0=
X-Google-Smtp-Source: 
 AGHT+IFcpwAw3vmY7WN1HvOnwXWNL3v/7V1tY8qOm/wNaJtGfgJw3Sa2WtB566UJ/cvOzD5AOBhNbYsKHs1lFVdvK94=
X-Received: by 2002:a05:651c:1a0b:b0:30d:694d:173b with SMTP id
 38308e7fff4ca-30d7e32dda3mr14482141fa.33.1742583347677; Fri, 21 Mar 2025
 11:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321035106.26752-1-luke@ljones.dev>
 <20250321035106.26752-3-luke@ljones.dev>
In-Reply-To: <20250321035106.26752-3-luke@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 21 Mar 2025 19:55:36 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFxbzpHhmWGAjWFB49Mc5Pdo4Xj76kghB-D_b5a2c7s_w@mail.gmail.com>
X-Gm-Features: AQ5f1JqHaCPi6W0YPr62W7OJA5sAvWPxB01far2SHO1eqn-bh4DQasjbWmlyHU0
Message-ID: 
 <CAGwozwFxbzpHhmWGAjWFB49Mc5Pdo4Xj76kghB-D_b5a2c7s_w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] platform/x86: asus-wmi: Refactor Ally
 suspend/resume
To: Luke Jones <luke@ljones.dev>
Cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174258334890.28790.270238327236252425@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

This series would benefit from some pr_info as it does important stuff
for bug reporting. I had to add some myself.

On Fri, 21 Mar 2025 at 04:51, Luke Jones <luke@ljones.dev> wrote:
>
> From: "Luke D. Jones" <luke@ljones.dev>
>
> Adjust how the CSEE direct call hack is used.
>
> The results of months of testing combined with help from ASUS to
> determine the actual cause of suspend issues has resulted in this
> refactoring which immensely improves the reliability for devices which
> do not have the following minimum MCU FW version:
> - ROG Ally X: 313
> - ROG Ally 1: 319
>
> For MCU FW versions that match the minimum or above the CSEE hack is
> disabled and mcu_powersave set to on by default as there are no
> negatives beyond a slightly slower device reinitialization due to the
> MCU being powered off.
>
> As this is set only at module load time, it is still possible for
> mcu_powersave sysfs attributes to change it at runtime if so desired.
>
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/hid/hid-asus.c                     |   4 +
>  drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
>  include/linux/platform_data/x86/asus-wmi.h |  13 +++
>  3 files changed, 108 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 599c836507ff..66bae5cea4f9 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -624,6 +624,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
>                 hid_warn(hdev,
>                         "The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
>                         min_version);
> +       } else {
> +               set_ally_mcu_hack(false);
> +               set_ally_mcu_powersave(true);
>         }
>  }
>
> @@ -1430,4 +1433,5 @@ static struct hid_driver asus_driver = {
>  };
>  module_hid_driver(asus_driver);
>
> +MODULE_IMPORT_NS("ASUS_WMI");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19..10936a091c42 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -142,16 +142,20 @@ module_param(fnlock_default, bool, 0444);
>  #define ASUS_MINI_LED_2024_STRONG      0x01
>  #define ASUS_MINI_LED_2024_OFF         0x02
>
> -/* Controls the power state of the USB0 hub on ROG Ally which input is on */
>  #define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
> -/* 300ms so far seems to produce a reliable result on AC and battery */
> -#define ASUS_USB0_PWR_EC0_CSEE_WAIT 1500
> +/*
> + * The period required to wait after screen off/on/s2idle.check in MS.
> + * Time here greatly impacts the wake behaviour. Used in suspend/wake.
> + */
> +#define ASUS_USB0_PWR_EC0_CSEE_WAIT    600
> +#define ASUS_USB0_PWR_EC0_CSEE_OFF     0xB7
> +#define ASUS_USB0_PWR_EC0_CSEE_ON      0xB8
>
>  static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>
>  static int throttle_thermal_policy_write(struct asus_wmi *);
>
> -static const struct dmi_system_id asus_ally_mcu_quirk[] = {
> +static const struct dmi_system_id asus_rog_ally_device[] = {
>         {
>                 .matches = {
>                         DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> @@ -274,9 +278,6 @@ struct asus_wmi {
>         u32 tablet_switch_dev_id;
>         bool tablet_switch_inverted;
>
> -       /* The ROG Ally device requires the MCU USB device be disconnected before suspend */
> -       bool ally_mcu_usb_switch;
> -
>         enum fan_type fan_type;
>         enum fan_type gpu_fan_type;
>         enum fan_type mid_fan_type;
> @@ -335,6 +336,9 @@ struct asus_wmi {
>         struct asus_wmi_driver *driver;
>  };
>
> +/* Global to allow setting externally without requiring driver data */
> +static bool use_ally_mcu_hack;
> +
>  /* WMI ************************************************************************/
>
>  static int asus_wmi_evaluate_method3(u32 method_id,
> @@ -549,7 +553,7 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>         return 0;
>  }
>
> -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
>                                  u32 *retval)
>  {
>         return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
> @@ -1343,6 +1347,44 @@ static ssize_t nv_temp_target_show(struct device *dev,
>  static DEVICE_ATTR_RW(nv_temp_target);
>
>  /* Ally MCU Powersave ********************************************************/
> +
> +/*
> + * The HID driver needs to check MCU version and set this to false if the MCU FW
> + * version is >= the minimum requirements. New FW do not need the hacks.
> + */
> +void set_ally_mcu_hack(bool enabled)
> +{
> +       use_ally_mcu_hack = enabled;
> +       pr_debug("%s Ally MCU suspend quirk\n",
> +                enabled ? "Enabled" : "Disabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_hack, "ASUS_WMI");
> +
> +/*
> + * mcu_powersave should be enabled always, as it is fixed in MCU FW versions:
> + * - v313 for Ally X
> + * - v319 for Ally 1
> + * The HID driver checks MCU versions and so should set this if requirements match
> + */
> +void set_ally_mcu_powersave(bool enabled)

I just AB tested setting powersave on boot and it seems the behavior
is similar. Since this will only happen on new firmware, it should be
OK even though I would rather distros use a udev rule. Note the MCU
difference in the OG Ally might cause different behavior and there
might be other smaller issues with longer term testing.

By the way, why not turn off powersave on old firmware instead? That
would be where the regression is. If anything hid-asus should check
and disable it on lower firmware versions, not enable it on new ones.
Ideally before sleep, just like you had it last march.

> +{
> +       int result, err;
> +
> +       err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, enabled, &result);
> +       if (err) {
> +               pr_warn("Failed to set MCU powersave: %d\n", err);
> +               return;
> +       }
> +       if (result > 1) {
> +               pr_warn("Failed to set MCU powersave (result): 0x%x\n", result);
> +               return;
> +       }
> +
> +       pr_debug("%s MCU Powersave\n",
> +                enabled ? "Enabled" : "Disabled");
> +}
> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
> +
>  static ssize_t mcu_powersave_show(struct device *dev,
>                                    struct device_attribute *attr, char *buf)
>  {
> @@ -4711,6 +4753,18 @@ static int asus_wmi_add(struct platform_device *pdev)
>         if (err)
>                 goto fail_platform;
>
> +       use_ally_mcu_hack = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> +                               && dmi_check_system(asus_rog_ally_device);
> +       if (use_ally_mcu_hack && dmi_match(DMI_BOARD_NAME, "RC71")) {
> +               /*
> +                * These steps ensure the device is in a valid good state, this is
> +                * especially important for the Ally 1 after a reboot.
> +                */
> +               acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +                                          ASUS_USB0_PWR_EC0_CSEE_ON);
> +               msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +       }
> +
>         /* ensure defaults for tunables */
>         asus->ppt_pl2_sppt = 5;
>         asus->ppt_pl1_spl = 5;
> @@ -4723,8 +4777,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>         asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>         asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>         asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> -       asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> -                                               && dmi_check_system(asus_ally_mcu_quirk);
>
>         if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>                 asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> @@ -4910,34 +4962,6 @@ static int asus_hotk_resume(struct device *device)
>         return 0;
>  }
>
> -static int asus_hotk_resume_early(struct device *device)
> -{
> -       struct asus_wmi *asus = dev_get_drvdata(device);
> -
> -       if (asus->ally_mcu_usb_switch) {
> -               /* sleep required to prevent USB0 being yanked then reappearing rapidly */
> -               if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
> -                       dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
> -               else
> -                       msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> -       }
> -       return 0;
> -}
> -
> -static int asus_hotk_prepare(struct device *device)
> -{

Using prepare is needed for old firmware, you are correct. The s2idle
quirk does not work prior to suspend but it works after. But if that's
the case, why not keep the previous quirk and just allow disabling it?
You still call CSEE on both.

> -       struct asus_wmi *asus = dev_get_drvdata(device);
> -
> -       if (asus->ally_mcu_usb_switch) {
> -               /* sleep required to ensure USB0 is disabled before sleep continues */
> -               if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
> -                       dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
> -               else
> -                       msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> -       }
> -       return 0;
> -}
> -
>  static int asus_hotk_restore(struct device *device)
>  {
>         struct asus_wmi *asus = dev_get_drvdata(device);
> @@ -4978,11 +5002,34 @@ static int asus_hotk_restore(struct device *device)
>         return 0;
>  }
>
> +static void asus_ally_s2idle_restore(void)
> +{
> +       if (use_ally_mcu_hack) {
> +               acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +                                          ASUS_USB0_PWR_EC0_CSEE_ON);
> +               msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +       }
> +}
> +
> +static int asus_hotk_prepare(struct device *device)
> +{
> +       if (use_ally_mcu_hack) {

For some reason on my device, even though I go through the
compatibility check with a custom log

> Mar 21 19:00:29 arch-dev-tools kernel: asus 0003:0B05:1B4C.0003: MCU firmware version 313 is compatible.
> Mar 21 19:00:29 arch-dev-tools kernel: asus_wmi: Enabled MCU Powersave

During sleep the quirk is still active. So behavior is OK.

Again, with custom log in quirk:
Mar 21 19:03:24 arch-dev-tools kernel: asus_wmi: Ally device detected,
disabling USB0_PWR_EC0_CSEE

So the previous quirk is still active. It is also obvious because you
can see the light fade, which does not happen without the quirk, where
it just cuts.

I think you have a race condition here, where asus-wmi enables it
after you disable it.

So I force disable it.

When I do force disable it, with powersave on, the light cuts after
the screen turns off, as the USB gets put into D3 before the CSEE
call. Other than that powersave behavior is similar.

Powersave off regresses (at least visually) a lot. First, it blinks
before sleep, as the controller gets confused and restarts after
receiving the Display Off call even though it is supposed to be in D3.
It also flashes a previous color which is weird. Then it flickers
after suspend. It also seems to not disconnect and reconnect, which
might increase standby consumption. On the original Ally, as Denis had
said, the XInput MCU might stay awake, so key presses might wake the
device too.

But RGB does not seem to get stuck anymore in my ah 30 min testing?
Perhaps over a longer play session with hours inbetween suspends there
are other regressions.

So if I compare it to the previous quirk, I find it a bit of a mixed
bag. The previous quirk is very solid and never fails, on all
firmwares. The new quirk makes sleep and suspend faster on new
firmware, but at the cost of some visual blemishes (at my current
testing; there might be other regressions).

If you still want to go through with this series, IMO you should keep
the hid check and the previous quirk. Then, on new firmwares, you can
tighten the delay. 500ms prior to suspend and removing the quirk after
suspend completely should do it. As you see from my previous email
timestamp I spent more than an hour on this testing, so I might not be
able to test again (I did most of the testing without any userspace
software running, only turning it on for the RGB if powersave turned
it off)

On the series I developed I kept 500ms before D3, the controller needs
300ms to shutdown otherwise it causes the above. Yes, it has other
(structural) issues, but I'd like to completely rewrite it and resend
closer to 6.16. The powerprofiles + hidden choices stuff gave me some
ideas.

Whatever you end up doing, make sure to test the RGB, as powersave
turns to force it off.

Best,
Antheas

> +               acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> +                                          ASUS_USB0_PWR_EC0_CSEE_OFF);
> +               msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +       }
> +       return 0;
> +}
> +
> +/* Use only for Ally devices due to the wake_on_ac */
> +static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
> +       .restore = asus_ally_s2idle_restore,
> +};
> +
>  static const struct dev_pm_ops asus_pm_ops = {
>         .thaw = asus_hotk_thaw,
>         .restore = asus_hotk_restore,
>         .resume = asus_hotk_resume,
> -       .resume_early = asus_hotk_resume_early,
>         .prepare = asus_hotk_prepare,
>  };
>
> @@ -5010,6 +5057,10 @@ static int asus_wmi_probe(struct platform_device *pdev)
>                         return ret;
>         }
>
> +       ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> +       if (ret)
> +               pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> +
>         return asus_wmi_add(pdev);
>  }
>
> @@ -5042,6 +5093,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
>
>  void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
>  {
> +       acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>         platform_device_unregister(driver->platform_device);
>         platform_driver_unregister(&driver->platform_driver);
>         used = false;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 783e2a336861..9ca408480502 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -158,8 +158,21 @@
>  #define ASUS_WMI_DSTS_LIGHTBAR_MASK    0x0000000F
>
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> +void set_ally_mcu_hack(bool enabled);
> +void set_ally_mcu_powersave(bool enabled);
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  #else
> +static inline void set_ally_mcu_hack(bool enabled)
> +{
> +}
> +static inline void set_ally_mcu_powersave(bool enabled)
> +{
> +}
> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> +{
> +       return -ENODEV;
> +}
>  static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>                                            u32 *retval)
>  {
> --
> 2.49.0
>

