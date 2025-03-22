Return-Path: <linux-input+bounces-11074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD7A6C84E
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 09:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5BE91B6152F
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 08:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224851D5147;
	Sat, 22 Mar 2025 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="nM7Kzwib"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D41D5CD4;
	Sat, 22 Mar 2025 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742631874; cv=none; b=Hl/bF67eiNXGQcPMUKYcg8DZ+QQz+m7FM2zzRenSwYGn6/HxgGypnnxP3/AZfxvkZs/Kb6Yj9n1Jlq5xC7WEJfDN+UzrtmEfuFJnwiJiRzH83bsUGZm99aIkJzhJJ3xbFwppIDmLS7+2NQRtPl3oSe2w+a7zkWwSUb4/PaycFnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742631874; c=relaxed/simple;
	bh=SqS8z7KHpvHGnZNRuHVawuBSvatVXXXPBPGxLDmrKhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0ZhZMvLAvDQRhqTHEepO1K6BtxG6OnLUHcxQ1mD4WLTEbNdhJq188V3QMle3Xr3RTKvqB/y8TwUZywqTKt8dnniNggBWi0fLL/W3CokRTB2GcMMoUq623QxNO6yt1CZG/nyjW3mhAFJG9fN9tYh27+9RyDQ7eKDbgIuBmF5vDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=nM7Kzwib; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 998CB2E07CC0;
	Sat, 22 Mar 2025 10:24:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742631868;
	bh=2mnH5f2i3QWondhxfIZWaF5IcvSDAv/cAsBENt9TQJ8=;
	h=Received:From:Subject:To;
	b=nM7Kzwib06cNU7idFOH9tsGN1m6kKvrvTNn48pJwvi6tNfP0zz+X/3a//VQGi2n0h
	 OEUq0nuaInvJmHw0rdwWJylBvVcT+rpujmV0p1+IgQ9iazG92NJ+s9blFLSaRooJ9N
	 eoglFifK9afL+nkXXGEZRiexxQg7spTPymlv1/ZU=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso29525091fa.3;
        Sat, 22 Mar 2025 01:24:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUkZvkVCXS47SBoOvtRjIjpx00yaUQXM2hmCqc7IIIRe4AU6SHPadFpQ5SsRkHaWQbh3B5Sygb292QKDw==@vger.kernel.org,
 AJvYcCWUUoE4y6TXgJG0ywnPVvihf9vWevkPH8EqZDUuV5Nh230LIV1aIlZLjjpDGyNAHUevQXzXuAfYX2Hk2S1n/2+uYNyK9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGwRbb+pRU3Rpa5seaVgWj1VTWF1xeT1YJ2LvULbGHlmq0/cSX
	cxRYTdVuTd8UiS8mBNAEVegDsIVSd7BcVyXPfI/FT0qOyZzc6woXl1vZ1H5LuLY7ru2KFLDhaqz
	vd+79U45wYRiMRjvBy/e6zLsJGjg=
X-Google-Smtp-Source: 
 AGHT+IHXgl7rO6bdJ8l74or1Ogp+ek/mXENYbDjE/lQYWfZ8eghREQSmIjTGWGSV3upIHoViiD1GbOLPhRPTbaLY4hY=
X-Received: by 2002:a2e:be1d:0:b0:30d:62c1:3c0a with SMTP id
 38308e7fff4ca-30d7e2aa82cmr27267081fa.25.1742631865661; Sat, 22 Mar 2025
 01:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321035106.26752-1-luke@ljones.dev>
 <20250321035106.26752-3-luke@ljones.dev>
 <CAGwozwFxbzpHhmWGAjWFB49Mc5Pdo4Xj76kghB-D_b5a2c7s_w@mail.gmail.com>
 <81c9f2a5-a875-442a-8890-be39c8d416c3@ljones.dev>
 <CAGwozwE-GAjXnR-anoeLa94TrS02U8PQQEAC+BB6ZE06+KSJmQ@mail.gmail.com>
 <9c4e9ae7-a338-4489-90d9-ef296f062a12@ljones.dev>
In-Reply-To: <9c4e9ae7-a338-4489-90d9-ef296f062a12@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 22 Mar 2025 09:24:14 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFNLwMvyUwDO=OaXoBDZCp1868dYZSM=9PJOdnxtsG0Ew@mail.gmail.com>
X-Gm-Features: AQ5f1Jq2o8yHaUqBomnsbNGALg0Jf9UvMNWL58hBGVleenVc40OhUSj8QSoDWvg
Message-ID: 
 <CAGwozwFNLwMvyUwDO=OaXoBDZCp1868dYZSM=9PJOdnxtsG0Ew@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] platform/x86: asus-wmi: Refactor Ally
 suspend/resume
To: "Luke D. Jones" <luke@ljones.dev>
Cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174263186704.3326.15902686143281673980@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sat, 22 Mar 2025 at 09:14, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 22/03/25 18:07, Antheas Kapenekakis wrote:
> > Let me reply to this real quick so you have something to work on. The
> > rest I can reply in a few hours
> >
> > On Sat, 22 Mar 2025 at 01:33, Luke D. Jones <luke@ljones.dev> wrote:
> >>
> >>
> >> On 22/03/25 07:55, Antheas Kapenekakis wrote:
> >>> This series would benefit from some pr_info as it does important stuff
> >>> for bug reporting. I had to add some myself.
> >>
> >> I did have some but was asked to remove it.
> >>
> >>> On Fri, 21 Mar 2025 at 04:51, Luke Jones <luke@ljones.dev> wrote:
> >>>>
> >>>> From: "Luke D. Jones" <luke@ljones.dev>
> >>>>
> >>>> Adjust how the CSEE direct call hack is used.
> >>>>
> >>>> The results of months of testing combined with help from ASUS to
> >>>> determine the actual cause of suspend issues has resulted in this
> >>>> refactoring which immensely improves the reliability for devices which
> >>>> do not have the following minimum MCU FW version:
> >>>> - ROG Ally X: 313
> >>>> - ROG Ally 1: 319
> >>>>
> >>>> For MCU FW versions that match the minimum or above the CSEE hack is
> >>>> disabled and mcu_powersave set to on by default as there are no
> >>>> negatives beyond a slightly slower device reinitialization due to the
> >>>> MCU being powered off.
> >>>>
> >>>> As this is set only at module load time, it is still possible for
> >>>> mcu_powersave sysfs attributes to change it at runtime if so desired.
> >>>>
> >>>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> >>>> ---
> >>>>    drivers/hid/hid-asus.c                     |   4 +
> >>>>    drivers/platform/x86/asus-wmi.c            | 130 ++++++++++++++-------
> >>>>    include/linux/platform_data/x86/asus-wmi.h |  13 +++
> >>>>    3 files changed, 108 insertions(+), 39 deletions(-)
> >>>>
> >>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>> index 599c836507ff..66bae5cea4f9 100644
> >>>> --- a/drivers/hid/hid-asus.c
> >>>> +++ b/drivers/hid/hid-asus.c
> >>>> @@ -624,6 +624,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
> >>>>                   hid_warn(hdev,
> >>>>                           "The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
> >>>>                           min_version);
> >>>> +       } else {
> >>>> +               set_ally_mcu_hack(false);
> >>>> +               set_ally_mcu_powersave(true);
> >>>>           }
> >>>>    }
> >>>>
> >>>> @@ -1430,4 +1433,5 @@ static struct hid_driver asus_driver = {
> >>>>    };
> >>>>    module_hid_driver(asus_driver);
> >>>>
> >>>> +MODULE_IMPORT_NS("ASUS_WMI");
> >>>>    MODULE_LICENSE("GPL");
> >>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> >>>> index 38ef778e8c19..10936a091c42 100644
> >>>> --- a/drivers/platform/x86/asus-wmi.c
> >>>> +++ b/drivers/platform/x86/asus-wmi.c
> >>>> @@ -142,16 +142,20 @@ module_param(fnlock_default, bool, 0444);
> >>>>    #define ASUS_MINI_LED_2024_STRONG      0x01
> >>>>    #define ASUS_MINI_LED_2024_OFF         0x02
> >>>>
> >>>> -/* Controls the power state of the USB0 hub on ROG Ally which input is on */
> >>>>    #define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
> >>>> -/* 300ms so far seems to produce a reliable result on AC and battery */
> >>>> -#define ASUS_USB0_PWR_EC0_CSEE_WAIT 1500
> >>>> +/*
> >>>> + * The period required to wait after screen off/on/s2idle.check in MS.
> >>>> + * Time here greatly impacts the wake behaviour. Used in suspend/wake.
> >>>> + */
> >>>> +#define ASUS_USB0_PWR_EC0_CSEE_WAIT    600
> >>>> +#define ASUS_USB0_PWR_EC0_CSEE_OFF     0xB7
> >>>> +#define ASUS_USB0_PWR_EC0_CSEE_ON      0xB8
> >>>>
> >>>>    static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
> >>>>
> >>>>    static int throttle_thermal_policy_write(struct asus_wmi *);
> >>>>
> >>>> -static const struct dmi_system_id asus_ally_mcu_quirk[] = {
> >>>> +static const struct dmi_system_id asus_rog_ally_device[] = {
> >>>>           {
> >>>>                   .matches = {
> >>>>                           DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> >>>> @@ -274,9 +278,6 @@ struct asus_wmi {
> >>>>           u32 tablet_switch_dev_id;
> >>>>           bool tablet_switch_inverted;
> >>>>
> >>>> -       /* The ROG Ally device requires the MCU USB device be disconnected before suspend */
> >>>> -       bool ally_mcu_usb_switch;
> >>>> -
> >>>>           enum fan_type fan_type;
> >>>>           enum fan_type gpu_fan_type;
> >>>>           enum fan_type mid_fan_type;
> >>>> @@ -335,6 +336,9 @@ struct asus_wmi {
> >>>>           struct asus_wmi_driver *driver;
> >>>>    };
> >>>>
> >>>> +/* Global to allow setting externally without requiring driver data */
> >>>> +static bool use_ally_mcu_hack;
> >>>> +
> >>>>    /* WMI ************************************************************************/
> >>>>
> >>>>    static int asus_wmi_evaluate_method3(u32 method_id,
> >>>> @@ -549,7 +553,7 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
> >>>>           return 0;
> >>>>    }
> >>>>
> >>>> -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> >>>> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> >>>>                                    u32 *retval)
> >>>>    {
> >>>>           return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
> >>>> @@ -1343,6 +1347,44 @@ static ssize_t nv_temp_target_show(struct device *dev,
> >>>>    static DEVICE_ATTR_RW(nv_temp_target);
> >>>>
> >>>>    /* Ally MCU Powersave ********************************************************/
> >>>> +
> >>>> +/*
> >>>> + * The HID driver needs to check MCU version and set this to false if the MCU FW
> >>>> + * version is >= the minimum requirements. New FW do not need the hacks.
> >>>> + */
> >>>> +void set_ally_mcu_hack(bool enabled)
> >>>> +{
> >>>> +       use_ally_mcu_hack = enabled;
> >>>> +       pr_debug("%s Ally MCU suspend quirk\n",
> >>>> +                enabled ? "Enabled" : "Disabled");
> >>>> +}
> >>>> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_hack, "ASUS_WMI");
> >>>> +
> >>>> +/*
> >>>> + * mcu_powersave should be enabled always, as it is fixed in MCU FW versions:
> >>>> + * - v313 for Ally X
> >>>> + * - v319 for Ally 1
> >>>> + * The HID driver checks MCU versions and so should set this if requirements match
> >>>> + */
> >>>> +void set_ally_mcu_powersave(bool enabled)
> >>>
> >>> I just AB tested setting powersave on boot and it seems the behavior
> >>> is similar. Since this will only happen on new firmware, it should be
> >>> OK even though I would rather distros use a udev rule. Note the MCU
> >>> difference in the OG Ally might cause different behavior and there
> >>> might be other smaller issues with longer term testing.
> >>
> >> I have both the OG, and the X so I've thoroughly tested both, and others
> >> have tested also. I'm against the udev rule as IMO powersave should be
> >> the default since it has such big powersaving benefits. The main issue
> >> though is that it needs exposure in userspace in a way for users to
> >> easily change it - if they run steamos or similar that won't happen so I
> >> do prefer making it default in driver and let other distros handle it.
> >
> > The option is sticky so even without setting it it defers to the
> > user's previous choice with windows. IMO it somewhat goes somewhat the
> > other way. Because powersave affects suspend behavior (ie resume takes
> > longer) and linux does not have a lockscreen, it is a lot more
> > debateable. You also cause a flip flop in case the user does not want
> > it, where it goes from false to true and that might cause issues as it
> > is a sensitive attributte.
>
> I know it's saved to nvram. What issues do you mean?
>
> >>> By the way, why not turn off powersave on old firmware instead? That
> >>> would be where the regression is. If anything hid-asus should check
> >>> and disable it on lower firmware versions, not enable it on new ones.
> >>> Ideally before sleep, just like you had it last march.
> >>
> >> As above I really think it has big benefits, and the hack does still
> >> work for those older FW.
> >
> > Older firmware does not support powersave with your series. But if the
> > user uses older firmware, you leave powersave on so the controller
> > breaks
>
> It doesn't break though. The quirk was heavily tested with and without
> powersave enabled. And on firmware before the fix ASUS put out. This
> testing was also part of what enabled ASUS to pinpoint the root issue.

But how is this quirk different?

> >>>> +{
> >>>> +       int result, err;
> >>>> +
> >>>> +       err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, enabled, &result);
> >>>> +       if (err) {
> >>>> +               pr_warn("Failed to set MCU powersave: %d\n", err);
> >>>> +               return;
> >>>> +       }
> >>>> +       if (result > 1) {
> >>>> +               pr_warn("Failed to set MCU powersave (result): 0x%x\n", result);
> >>>> +               return;
> >>>> +       }
> >>>> +
> >>>> +       pr_debug("%s MCU Powersave\n",
> >>>> +                enabled ? "Enabled" : "Disabled");
> >>>> +}
> >>>> +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
> >>>> +
> >>>>    static ssize_t mcu_powersave_show(struct device *dev,
> >>>>                                      struct device_attribute *attr, char *buf)
> >>>>    {
> >>>> @@ -4711,6 +4753,18 @@ static int asus_wmi_add(struct platform_device *pdev)
> >>>>           if (err)
> >>>>                   goto fail_platform;
> >>>>
> >>>> +       use_ally_mcu_hack = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> >>>> +                               && dmi_check_system(asus_rog_ally_device);
> >>>> +       if (use_ally_mcu_hack && dmi_match(DMI_BOARD_NAME, "RC71")) {
> >>>> +               /*
> >>>> +                * These steps ensure the device is in a valid good state, this is
> >>>> +                * especially important for the Ally 1 after a reboot.
> >>>> +                */
> >>>> +               acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> >>>> +                                          ASUS_USB0_PWR_EC0_CSEE_ON);
> >>>> +               msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> >>>> +       }
> >>>> +
> >>>>           /* ensure defaults for tunables */
> >>>>           asus->ppt_pl2_sppt = 5;
> >>>>           asus->ppt_pl1_spl = 5;
> >>>> @@ -4723,8 +4777,6 @@ static int asus_wmi_add(struct platform_device *pdev)
> >>>>           asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
> >>>>           asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
> >>>>           asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> >>>> -       asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> >>>> -                                               && dmi_check_system(asus_ally_mcu_quirk);
> >>>>
> >>>>           if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
> >>>>                   asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> >>>> @@ -4910,34 +4962,6 @@ static int asus_hotk_resume(struct device *device)
> >>>>           return 0;
> >>>>    }
> >>>>
> >>>> -static int asus_hotk_resume_early(struct device *device)
> >>>> -{
> >>>> -       struct asus_wmi *asus = dev_get_drvdata(device);
> >>>> -
> >>>> -       if (asus->ally_mcu_usb_switch) {
> >>>> -               /* sleep required to prevent USB0 being yanked then reappearing rapidly */
> >>>> -               if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
> >>>> -                       dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
> >>>> -               else
> >>>> -                       msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> >>>> -       }
> >>>> -       return 0;
> >>>> -}
> >>>> -
> >>>> -static int asus_hotk_prepare(struct device *device)
> >>>> -{
> >>>
> >>> Using prepare is needed for old firmware, you are correct. The s2idle
> >>> quirk does not work prior to suspend but it works after. But if that's
> >>> the case, why not keep the previous quirk and just allow disabling it?
> >>> You still call CSEE on both.
> >>
> >> The change is just the result of a dozen or so people testing many many
> >> scenarios while I worked with ASUS to find the root cause of the issues.
> >> I am *so* glad we were able to get it properly fixed in FW.
> >
> > Can you justify it as being better than the previous one though?
>
> Yes, faster resume, and more reliable.
>
> >>>> -       struct asus_wmi *asus = dev_get_drvdata(device);
> >>>> -
> >>>> -       if (asus->ally_mcu_usb_switch) {
> >>>> -               /* sleep required to ensure USB0 is disabled before sleep continues */
> >>>> -               if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
> >>>> -                       dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
> >>>> -               else
> >>>> -                       msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> >>>> -       }
> >>>> -       return 0;
> >>>> -}
> >>>> -
> >>>>    static int asus_hotk_restore(struct device *device)
> >>>>    {
> >>>>           struct asus_wmi *asus = dev_get_drvdata(device);
> >>>> @@ -4978,11 +5002,34 @@ static int asus_hotk_restore(struct device *device)
> >>>>           return 0;
> >>>>    }
> >>>>
> >>>> +static void asus_ally_s2idle_restore(void)
> >>>> +{
> >>>> +       if (use_ally_mcu_hack) {
> >>>> +               acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> >>>> +                                          ASUS_USB0_PWR_EC0_CSEE_ON);
> >>>> +               msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> >>>> +       }
> >>>> +}
> >>>> +
> >>>> +static int asus_hotk_prepare(struct device *device)
> >>>> +{
> >>>> +       if (use_ally_mcu_hack) {
> >>>
> >>> For some reason on my device, even though I go through the
> >>> compatibility check with a custom log
> >>>
> >>>> Mar 21 19:00:29 arch-dev-tools kernel: asus 0003:0B05:1B4C.0003: MCU firmware version 313 is compatible.
> >>>> Mar 21 19:00:29 arch-dev-tools kernel: asus_wmi: Enabled MCU Powersave
> >>>
> >>> During sleep the quirk is still active. So behavior is OK.
> >>>
> >>> Again, with custom log in quirk:
> >>> Mar 21 19:03:24 arch-dev-tools kernel: asus_wmi: Ally device detected,
> >>> disabling USB0_PWR_EC0_CSEE
> >>>
> >>> So the previous quirk is still active. It is also obvious because you
> >>> can see the light fade, which does not happen without the quirk, where
> >>> it just cuts.
> >>>
> >>> I think you have a race condition here, where asus-wmi enables it
> >>> after you disable it.
> >>
> >> I'm a little confused. By previous quirk do you mean the older one
> >> before this refactor? asus-wmi doesn't enable anything, it only sets a
> >> bool on module load, and since the hid-asus module requires some symbols
> >> from asus-wmi the module load order is set in concrete to be asus-wmi
> >> first, with hid-asus making the correct calls after verifying the
> >> firmware version..
> >
> > Let me rephrase. "previous quirk" -> "older firmware quirk".
>
> Understood, thanks.
>
> >> from asus-wmi the module load order is set in concrete to be asus-wmi
> >> first, with hid-asus making the correct calls after verifying the
> >
> > The module LOAD, not the WMI PROBE. I tested 2 restarts with this and
> > in both the probe of hid-asus happened both times BEFORE the probe of
> > asus-wmi. So you end up using the older firmware quirk on newer
> > firmware.
>
> I never encountered this, but yes I can see that it would be an issue.
> What I'll do is since use_ally_mcu_hack is a global, that can be checked
> in the asus_wmi_add(). I'll switch to an int and use negative for
> not-initialised.
>
> Thanks for pointing that out.
>
> > This is a very big bug, since the quirk improves the MCU behavior a
> > lot and it means that on most of your testing/users testing of this
> > series the quirk has been active. As it is a race condition, maybe it
> > is active on eg 70% of the boots. But that still improves the
> > perceived reliability of this series. To fix this you might need a
> > second var.
>
> If you continue to test I might suggest unload/load the hid-asus module
> after boot. As above I'll fix correctly.
>
> >>> So I force disable it.
> >>>
> >>> When I do force disable it, with powersave on, the light cuts after
> >>> the screen turns off, as the USB gets put into D3 before the CSEE
> >>> call. Other than that powersave behavior is similar.
> >>>
> >>> Powersave off regresses (at least visually) a lot. First, it blinks
> >>> before sleep, as the controller gets confused and restarts after
> >>> receiving the Display Off call even though it is supposed to be in D3.
> >>> It also flashes a previous color which is weird. Then it flickers
> >>> after suspend. It also seems to not disconnect and reconnect, which
> >>> might increase standby consumption. On the original Ally, as Denis had
> >>> said, the XInput MCU might stay awake, so key presses might wake the
> >>> device too.
> >>
> >> The Ally OG has two MCU yes, one is for the gamepad only, and that one
> >> does stay powered. With powersave enabled only the RGB/keyboard MCU has
> >> power removed. ASUS never made it clear to me which was primary and
> >> secondary, not that it matters here.
> >>
> >>   > Powersave off regresses
> >>
> >> Yes this is the standard behaviour of powersave-off. It's essentially
> >> the exact same as laptops (and the Z13). Cutting power to the MCU is
> >> unique to the Ally and they added it in bios/fw revisions while bringing
> >> up all the features over time.
> >
> > It is not. With the quirk it is much nicer as the light fades properly and once.
>
> We might have been talking past each other.. I was assuming you talk
> about the status LED, whcih blinks when suspended with powersave off.

No, I was talking about the rings. They do a momentary flash with a
stale color as if they are broken when powersave is not on. The power
mask is set so that it doesnt do the blink with the status light, so
that should not happen.

> > For the last 6 months I have been using my series, where it also does the same.
> >
> >>> But RGB does not seem to get stuck anymore in my ah 30 min testing?
> >>> Perhaps over a longer play session with hours inbetween suspends there
> >>> are other regressions.
> >>>
> >>> So if I compare it to the previous quirk, I find it a bit of a mixed
> >>> bag. The previous quirk is very solid and never fails, on all
> >>> firmwares. The new quirk makes sleep and suspend faster on new
> >>> firmware, but at the cost of some visual blemishes (at my current
> >>> testing; there might be other regressions).
> >>
> >> I'll make sure I do some further testing this weekend. But I no-longer
> >> have older FW on the MCU and I'm not going to go through the process of
> >> downgrading it when we should be encouraging everyone to update since
> >> there are very real improvements.
> >
> > That is OK, especially if you end up using the previous quirk which
> > has been very thoroughly tested on the older firmwares.
>
> It might come to that. In the end it shouldn't be an issue either way
> for new FW where it disables.
>
> >>> If you still want to go through with this series, IMO you should keep
> >>> the hid check and the previous quirk. Then, on new firmwares, you can
> >>> tighten the delay. 500ms prior to suspend and removing the quirk after
> >>> suspend completely should do it. As you see from my previous email
> >>> timestamp I spent more than an hour on this testing, so I might not be
> >>> able to test again (I did most of the testing without any userspace
> >>> software running, only turning it on for the RGB if powersave turned
> >>> it off)
> >>
> >> Thank you for taking the time to test, it is appreciated. I assume you
> >> tested on newest FW? If you can, I'd love a little more detail on your
> >> sceanrios so i know what to check.
> >
> > Yes, newer firmware. Test setup was a KDE arch build, no gamescope
> > with no userspace touching the controller running on firmware 313 as
> > you see in the log.
> >
> > To make sure RGB was on/working I flipped hhd on/off before/after suspends
>
> How long did you wait? With powersave on it's something like 2-3
> seconds. You can guage it by when the gamepad begins to respond again.

Around 10. It was completely outside the suspend path. I made sure for
it to not interfere.

> >> On new FW the patch fully disables the CSEE calls and delays making it a
> >> NO-OP essentially. I'd much rather fully remove the hacks and have only
> >> a version check with warning but there's still folks on older fw. TBH as
> >> bazzite has a much larger reach than I in handheld, it would be
> >> wonderfully helpfull if bazzite encouraged users to fully update their
> >> Ally devices - it can be done through a win2go usb safely.
> >>
> >>> On the series I developed I kept 500ms before D3, the controller needs
> >>> 300ms to shutdown otherwise it causes the above. Yes, it has other
> >>> (structural) issues, but I'd like to completely rewrite it and resend
> >>> closer to 6.16. The powerprofiles + hidden choices stuff gave me some
> >>> ideas.
> >>>
> >>> Whatever you end up doing, make sure to test the RGB, as powersave
> >>> turns to force it off.
> >>
> >>
> >> Speaking of RGB, I found that userspace control of it could run in to
> >> issues with powersave - something like racing against enablement vs MCU
> >> being ready. With the hid-asus-ally driver I moved RGB control in to it
> >> and exposed the LEDs as "RGB RGB RGB RGB" in the mcled class dev. Making
> >> userspace use that instead works really well and means that it could use
> >> the "device ready" check.
> >>
> >> So I suspect that might be what you're seeing, I assume you're still
> >> using hidraw calls for it in HHD?
> >>
> >> I'll clean that series up this weekend and send (tagging you ofc). Maybe
> >> there's some ideas in it that could be useful for your recent LED patchwork.
> >
> > What I see is that once powersave triggers a controller restart after
> > suspend, the RGB stays off until it is set again. Not the end of the
> > world but not the prettiest. However, that means that to be able to
> > see what the MCU is doing, you need to reenable RGB after suspend.
>
> Yes it's depending on userspace for it. Part of the reason is because
> it's switched to mcu software mode for LED. I might revisit that
> however. MCU hardware mode will always restore regardless of userspace
> (but doesn't allow rapid addressing).
>
> > As for what I found in my testing, perhaps there is a ready check for
> > Aura, but the other mode works fine without one. Yes it is a bit
> > tricky though. Because of the controller restart/reinit, if userspace
> > is not aware of it it can set the rgb color before that finishes so it
> > gets lost. But all of that has been dealt with long ago.
> >
> Using a decky plugin to set LED (assumign we're still talking about
> hid-asus-ally) hasn't shown any issues - the RGB is put in a work queue.
>
> I will submit a V4 later this weekend. Thanks for testing so far, it's
> been helpful.

Its mostly in the brief second after suspend or 2-3 seconds during
boot that it happens before the takeover. I would strongly look into
using something more basic.

Antheas

> Cheers,
> Luke.
>
> > Powersave on/off, all firmware levels, back buttons, RGB, all work on
> > bazzite pretty much always. Which is why I was never in a rush to tell
> > people to update their firmware. But yes, doing that reorder in s2idle
> > is something that will take a lot of thought and care to upstream.
> >
> > Antheas
> >
> >> Cheers,
> >> Luke.
> >>
> >>> Best,
> >>> Antheas
> >>>
> >>>> +               acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
> >>>> +                                          ASUS_USB0_PWR_EC0_CSEE_OFF);
> >>>> +               msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> >>>> +       }
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +/* Use only for Ally devices due to the wake_on_ac */
> >>>> +static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
> >>>> +       .restore = asus_ally_s2idle_restore,
> >>>> +};
> >>>> +
> >>>>    static const struct dev_pm_ops asus_pm_ops = {
> >>>>           .thaw = asus_hotk_thaw,
> >>>>           .restore = asus_hotk_restore,
> >>>>           .resume = asus_hotk_resume,
> >>>> -       .resume_early = asus_hotk_resume_early,
> >>>>           .prepare = asus_hotk_prepare,
> >>>>    };
> >>>>
> >>>> @@ -5010,6 +5057,10 @@ static int asus_wmi_probe(struct platform_device *pdev)
> >>>>                           return ret;
> >>>>           }
> >>>>
> >>>> +       ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> >>>> +       if (ret)
> >>>> +               pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> >>>> +
> >>>>           return asus_wmi_add(pdev);
> >>>>    }
> >>>>
> >>>> @@ -5042,6 +5093,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
> >>>>
> >>>>    void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
> >>>>    {
> >>>> +       acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
> >>>>           platform_device_unregister(driver->platform_device);
> >>>>           platform_driver_unregister(&driver->platform_driver);
> >>>>           used = false;
> >>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> >>>> index 783e2a336861..9ca408480502 100644
> >>>> --- a/include/linux/platform_data/x86/asus-wmi.h
> >>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
> >>>> @@ -158,8 +158,21 @@
> >>>>    #define ASUS_WMI_DSTS_LIGHTBAR_MASK    0x0000000F
> >>>>
> >>>>    #if IS_REACHABLE(CONFIG_ASUS_WMI)
> >>>> +void set_ally_mcu_hack(bool enabled);
> >>>> +void set_ally_mcu_powersave(bool enabled);
> >>>> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
> >>>>    int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> >>>>    #else
> >>>> +static inline void set_ally_mcu_hack(bool enabled)
> >>>> +{
> >>>> +}
> >>>> +static inline void set_ally_mcu_powersave(bool enabled)
> >>>> +{
> >>>> +}
> >>>> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> >>>> +{
> >>>> +       return -ENODEV;
> >>>> +}
> >>>>    static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
> >>>>                                              u32 *retval)
> >>>>    {
> >>>> --
> >>>> 2.49.0
> >>>>
> >>
>

