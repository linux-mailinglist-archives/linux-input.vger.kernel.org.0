Return-Path: <linux-input+bounces-14843-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB9B83527
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 09:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A5794A2C81
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06382DAFA3;
	Thu, 18 Sep 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY0SVIFk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AC32D5C7A;
	Thu, 18 Sep 2025 07:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758180712; cv=none; b=XEKA8d4KZi79v5U9qqqfgaFeV1YjvkGrpP6ULqb6pxTnRZ94aHZX5FD8u8/r8OFY74XlIwi4Cs/5LZ/hAjmSFmPlCF6xTuf1Kst2dPy2NfrgWn/oEW0XymJcxcTNfBX3LB0CPYLQWAb8jcOMYtJDlLL/5UXprJz8+FtIWdCmY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758180712; c=relaxed/simple;
	bh=/eIrBLQ0qOJ04dG32rBtRV5+x+XYBcST2ZCEGrQ81b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcK5EzRhksWCJR23qJ8TctbMvmKNhko8Uy/4FMPIJ+I1Dn1cTug0j4tQussc5Dbjt/zneJ0jU8GM7qqXhENwr667g85fgJINtZuRt4qbb2lgTRFp7HC84WgW7ca4W8ghTSYcKx4ABs06vRerdydm/RcX+/2XAi6w5nceca0qUIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY0SVIFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC209C4CEE7;
	Thu, 18 Sep 2025 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758180712;
	bh=/eIrBLQ0qOJ04dG32rBtRV5+x+XYBcST2ZCEGrQ81b4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aY0SVIFkprGC4KWaH0L3pgEGKKhavn5OCL7cYHDgQl9AkIlrs7+Esg+I/2pUsqPJl
	 LL9+IrYjnkbtOTwEeV7JELqCFrqDUhCA5T5jv/KWTcgsdZ8cC4YRp7qlaS4Z6qZnff
	 23aKb5aCkN1vuZ5xj3kn4jgrKAb/5soyMJIj+Ec40kuwYofrlX6h2s11cYBD1euCaO
	 4VCDlgvJVw6VMftkuTGOLTVmOPXMEmE/vgOUltEVVgAgKSN6wImo9jVcf9QXUoKnYr
	 rOXyS7d+fb2QKt3zUTj7YYYdK7jcpzDxTDMhAoQ6297UQ6xN5HwPGxtgSKDWYpWMX6
	 gfuCnisMs1lpg==
Message-ID: <6e834cb7-565b-4a4b-bf90-4765f5fc9cc9@kernel.org>
Date: Thu, 18 Sep 2025 09:31:47 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] input: mouse: trackpoint: Add doubletap
 enable/disable support
To: Vishnu Sankar <vishnuocv@gmail.com>, dmitry.torokhov@gmail.com,
 hmh@hmh.eng.br, ilpo.jarvinen@linux.intel.com, derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
References: <20250901135308.52340-1-vishnuocv@gmail.com>
 <CABxCQKtEcFozTtuV3sutU3OyobTbpA82Uy=MyU0FQePPT7S2Wg@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CABxCQKtEcFozTtuV3sutU3OyobTbpA82Uy=MyU0FQePPT7S2Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vishnu,

On 18-Sep-25 4:37 AM, Vishnu Sankar wrote:
> Hello all,
> 
> Do we have any questions or concerns?
> Thanks in advance!
> 
> On Mon, Sep 1, 2025 at 10:53 PM Vishnu Sankar <vishnuocv@gmail.com> wrote:
>>
>> Add support for enabling and disabling doubletap on TrackPoint devices
>> that support this functionality. The feature is detected using firmware
>> ID and exposed via sysfs as `doubletap_enabled`.

Hmm, you seem to be using a firmware ID prefix match, combined with
a deny list of some firmware IDs with that prefix which do not support
this. How do we know this deny list is complete?

Also as Dmitry says you really should use the is_visible() callback
to not show the attribute at all on unsupported systems.

>> The feature is only available on newer ThinkPads (2023 and later).The driver
>> exposes this capability via a new sysfs attribute:
>> "/sys/bus/serio/devices/seriox/doubletap_enabled".
>>
>> The attribute is only created if the device is detected to be capable of
>> doubletap via firmware and variant ID checks. This functionality will be
>> used by platform drivers such as thinkpad_acpi to expose and control doubletap
>> via user interfaces.

Hmm, you refer to thinkpad_acpi as a possible consumer of this
functionality. But you only add a sysfs interface.

thinkpad_acpi will need some in kernel interface to use this.

Which brings me to my main question: thinkpad_acpi is the driver
receiving the doubletap events since these are send out-of-bound
and not through the ps/2 trackpoint protocol.

thinkpad_acpi already has the capability to filter out these doubletap
events and report nothing. Why is it necessary / better to disable
the doubletap at the trackpoint fw-level, rather then just filtering
it at the thinkpad_acpi level ?

I don't really see a big advantage in filtering these events at
the fw-level rather then in the kernel and we already have the
in kernel filtering.

Since this is highly ThinkPad specific it seems that the current
handling in thinkpad_acpi also logically is the best place to
handle this.

What new use-cases if any does this enable?

If you e.g. want some Lenovo specific control-panel GUI to
enable/disable this, why not expose the existing filtering
in thinkpad_acpi (which is hotkey controller only atm)
in sysfs through thinkpad_acpi ?

If we go the route of using the trackpoint fw-level filtering
as is done in this patch, then IMHO we really also should
make the existing code in thinkpad_acpi:

static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
{
        switch (hkey) {
        case TP_HKEY_EV_TRACK_DOUBLETAP:
                if (tp_features.trackpoint_doubletap)
                        tpacpi_input_send_key(hkey, send_acpi_ev);

                return true;
        default:
                return false;
        }
}

static bool tpacpi_driver_event(const unsigned int hkey_event)
{
	...
        case TP_HKEY_EV_DOUBLETAP_TOGGLE:
                tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
                return true;
	...
}

Also use the fw-level filtering rather then having 2 different
filters/enable-flags active with events only coming through if
both let them through.

But making the thinkpad_acpi code use the fw-level filtering
will require some sort of in kernel API for this which is
going to be tricky since these are 2 completely different
subsystems ...

So to me it seems KISS to just stick with the existing thinkpad_acpi
level filtering.

TL;DR:
- What use-cases does this new code enable ?
- Why can't those use-cases be implemented with
  the thinkpad_acpi level filtering?


Regards,

Hans






>>
>> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
>> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> ---
>> Changes in v2:
>> - Improve commit messages
>> - Sysfs attributes moved to trackpoint.c
>> - Removed unnecessary comments
>> - Removed unnecessary debug messages
>> - Using strstarts() instead of strcmp()
>> - is_trackpoint_dt_capable() modified
>> - Removed _BIT suffix and used BIT() define.
>> - Reverse the trackpoint_doubletap_status() logic to return error first.
>> - Removed export functions as a result of the design change
>> - Changed trackpoint_dev->psmouse to parent_psmouse
>> - The path of trackpoint.h is not changed.
>> Changes in v3:
>> - No changes.
>> ---
>>  drivers/input/mouse/trackpoint.c | 149 +++++++++++++++++++++++++++++++
>>  drivers/input/mouse/trackpoint.h |  15 ++++
>>  2 files changed, 164 insertions(+)
>>
>> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
>> index 5f6643b69a2c..c6f17b0dec3a 100644
>> --- a/drivers/input/mouse/trackpoint.c
>> +++ b/drivers/input/mouse/trackpoint.c
>> @@ -16,6 +16,8 @@
>>  #include "psmouse.h"
>>  #include "trackpoint.h"
>>
>> +static struct trackpoint_data *trackpoint_dev;
>> +
>>  static const char * const trackpoint_variants[] = {
>>         [TP_VARIANT_IBM]                = "IBM",
>>         [TP_VARIANT_ALPS]               = "ALPS",
>> @@ -63,6 +65,21 @@ static int trackpoint_write(struct ps2dev *ps2dev, u8 loc, u8 val)
>>         return ps2_command(ps2dev, param, MAKE_PS2_CMD(3, 0, TP_COMMAND));
>>  }
>>
>> +/* Read function for TrackPoint extended registers */
>> +static int trackpoint_extended_read(struct ps2dev *ps2dev, u8 loc, u8 *val)
>> +{
>> +       u8 ext_param[2] = {TP_READ_MEM, loc};
>> +       int error;
>> +
>> +       error = ps2_command(ps2dev,
>> +                           ext_param, MAKE_PS2_CMD(2, 1, TP_COMMAND));
>> +
>> +       if (!error)
>> +               *val = ext_param[0];
>> +
>> +       return error;
>> +}
>> +
>>  static int trackpoint_toggle_bit(struct ps2dev *ps2dev, u8 loc, u8 mask)
>>  {
>>         u8 param[3] = { TP_TOGGLE, loc, mask };
>> @@ -393,6 +410,131 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
>>         return 0;
>>  }
>>
>> +/* List of known incapable device PNP IDs */
>> +static const char * const dt_incompatible_devices[] = {
>> +       "LEN0304",
>> +       "LEN0306",
>> +       "LEN0317",
>> +       "LEN031A",
>> +       "LEN031B",
>> +       "LEN031C",
>> +       "LEN031D",
>> +};
>> +
>> +/*
>> + * checks if it’s a doubletap capable device
>> + * The PNP ID format eg: is "PNP: LEN030d PNP0f13".
>> + */
>> +static bool is_trackpoint_dt_capable(const char *pnp_id)
>> +{
>> +       const char *id_start;
>> +       char id[8];
>> +
>> +       if (!strstarts(pnp_id, "PNP: LEN03"))
>> +               return false;
>> +
>> +       /* Points to "LEN03xxxx" */
>> +       id_start = pnp_id + 5;
>> +       if (sscanf(id_start, "%7s", id) != 1)
>> +               return false;
>> +
>> +       /* Check if it's blacklisted */
>> +       for (size_t i = 0; i < ARRAY_SIZE(dt_incompatible_devices); ++i) {
>> +               if (strcmp(id, dt_incompatible_devices[i]) == 0)
>> +                       return false;
>> +       }
>> +       return true;
>> +}
>> +
>> +/* Trackpoint doubletap status function */
>> +static int trackpoint_doubletap_status(bool *status)
>> +{
>> +       struct trackpoint_data *tp = trackpoint_dev;
>> +       struct ps2dev *ps2dev = &tp->parent_psmouse->ps2dev;
>> +       u8 reg_val;
>> +       int rc;
>> +
>> +       /* Reading the Doubletap register using extended read */
>> +       rc = trackpoint_extended_read(ps2dev, TP_DOUBLETAP, &reg_val);
>> +       if (rc)
>> +               return rc;
>> +
>> +       *status = reg_val & TP_DOUBLETAP_STATUS ? true : false;
>> +
>> +       return 0;
>> +}
>> +
>> +/* Trackpoint doubletap enable/disable function */
>> +static int trackpoint_set_doubletap(bool enable)
>> +{
>> +       struct trackpoint_data *tp = trackpoint_dev;
>> +       struct ps2dev *ps2dev = &tp->parent_psmouse->ps2dev;
>> +       static u8 doubletap_state;
>> +       u8 new_val;
>> +
>> +       if (!tp)
>> +               return -ENODEV;
>> +
>> +       new_val = enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE;
>> +
>> +       if (doubletap_state == new_val)
>> +               return 0;
>> +
>> +       doubletap_state = new_val;
>> +
>> +       return trackpoint_write(ps2dev, TP_DOUBLETAP, new_val);
>> +}
>> +
>> +/*
>> + * Trackpoint Doubletap Interface
>> + * Control/Monitoring of Trackpoint Doubletap from:
>> + * /sys/bus/serio/devices/seriox/doubletap_enabled
>> + */
>> +static ssize_t doubletap_enabled_show(struct device *dev,
>> +                               struct device_attribute *attr, char *buf)
>> +{
>> +       struct serio *serio = to_serio_port(dev);
>> +       struct psmouse *psmouse = psmouse_from_serio(serio);
>> +       struct trackpoint_data *tp = psmouse->private;
>> +       bool status;
>> +       int rc;
>> +
>> +       if (!tp || !tp->doubletap_capable)
>> +               return -ENODEV;
>> +
>> +       rc = trackpoint_doubletap_status(&status);
>> +       if (rc)
>> +               return rc;
>> +
>> +       return sysfs_emit(buf, "%d\n", status ? 1 : 0);
>> +}
>> +
>> +static ssize_t doubletap_enabled_store(struct device *dev,
>> +                                       struct device_attribute *attr,
>> +                                       const char *buf, size_t count)
>> +{
>> +       struct serio *serio = to_serio_port(dev);
>> +       struct psmouse *psmouse = psmouse_from_serio(serio);
>> +       struct trackpoint_data *tp = psmouse->private;
>> +       bool enable;
>> +       int err;
>> +
>> +       if (!tp || !tp->doubletap_capable)
>> +               return -ENODEV;
>> +
>> +       err = kstrtobool(buf, &enable);
>> +       if (err)
>> +               return err;
>> +
>> +       err = trackpoint_set_doubletap(enable);
>> +       if (err)
>> +               return err;
>> +
>> +       return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(doubletap_enabled);
>> +
>>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>>  {
>>         struct ps2dev *ps2dev = &psmouse->ps2dev;
>> @@ -425,6 +567,9 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>>         psmouse->reconnect = trackpoint_reconnect;
>>         psmouse->disconnect = trackpoint_disconnect;
>>
>> +       trackpoint_dev = psmouse->private;
>> +       trackpoint_dev->parent_psmouse = psmouse;
>> +
>>         if (variant_id != TP_VARIANT_IBM) {
>>                 /* Newer variants do not support extended button query. */
>>                 button_info = 0x33;
>> @@ -470,6 +615,10 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
>>                      psmouse->vendor, firmware_id,
>>                      (button_info & 0xf0) >> 4, button_info & 0x0f);
>>
>> +       tp->doubletap_capable = is_trackpoint_dt_capable(ps2dev->serio->firmware_id);
>> +       if (tp->doubletap_capable)
>> +               device_create_file(&psmouse->ps2dev.serio->dev, &dev_attr_doubletap_enabled);
>> +
>>         return 0;
>>  }
>>
>> diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
>> index eb5412904fe0..256e8cb35581 100644
>> --- a/drivers/input/mouse/trackpoint.h
>> +++ b/drivers/input/mouse/trackpoint.h
>> @@ -8,6 +8,8 @@
>>  #ifndef _TRACKPOINT_H
>>  #define _TRACKPOINT_H
>>
>> +#include <linux/bitops.h>
>> +
>>  /*
>>   * These constants are from the TrackPoint System
>>   * Engineering documentation Version 4 from IBM Watson
>> @@ -69,6 +71,8 @@
>>                                         /* (how hard it is to drag */
>>                                         /* with Z-axis pressed) */
>>
>> +#define TP_DOUBLETAP           0x58    /* TrackPoint doubletap register */
>> +
>>  #define TP_MINDRAG             0x59    /* Minimum amount of force needed */
>>                                         /* to trigger dragging */
>>
>> @@ -139,6 +143,14 @@
>>  #define TP_DEF_TWOHAND         0x00
>>  #define TP_DEF_SOURCE_TAG      0x00
>>
>> +/* Doubletap register values */
>> +#define TP_DOUBLETAP_ENABLE    0xFF    /* Enable value */
>> +#define TP_DOUBLETAP_DISABLE   0xFE    /* Disable value */
>> +
>> +#define TP_DOUBLETAP_STATUS_BIT 0      /* 0th bit defines enable/disable */
>> +
>> +#define TP_DOUBLETAP_STATUS   BIT(TP_DOUBLETAP_STATUS_BIT)
>> +
>>  #define MAKE_PS2_CMD(params, results, cmd) ((params<<12) | (results<<8) | (cmd))
>>
>>  struct trackpoint_data {
>> @@ -150,11 +162,14 @@ struct trackpoint_data {
>>         u8 thresh, upthresh;
>>         u8 ztime, jenks;
>>         u8 drift_time;
>> +       bool doubletap_capable;
>>
>>         /* toggles */
>>         bool press_to_select;
>>         bool skipback;
>>         bool ext_dev;
>> +
>> +       struct psmouse *parent_psmouse;
>>  };
>>
>>  int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
>> --
>> 2.48.1
>>
> 
> 


