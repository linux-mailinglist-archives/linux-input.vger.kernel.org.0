Return-Path: <linux-input+bounces-5345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CB947E71
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 17:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76A6AB23355
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 15:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D82341746;
	Mon,  5 Aug 2024 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ayb207jW"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA71F3CF5E
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722872755; cv=none; b=MZCs/ZZyeNwRSxm4GG7t/eCkiQjpFzIOWmwV7Z3yNgo7iMpPw7BgA2YaIm4YVPPxofbOmVGc74uyInzbKzOl8mBQhKGEB6YQlG1/WYDJWdR4FS3LtR22V+8P+n0SdNfAQ3B3GI1GRDoDmZ2OS3zHUA9rvBfFt5dQ69RSVzuGIkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722872755; c=relaxed/simple;
	bh=j5Uv25CTOYlUpavsEpr0Ns8/eFSMPGpCF/oZOSqJNlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQoYRFPZvNQQHqkqtlRjzr6SdERIfJiDA+9ZRGnS5SLDvHgajT/eqrd4d59RJVXspX93oXZ3uEl79XWO+qsxRhR+CTiF2KwmXFFd6eOu3uMk/CIzEpkx17t+slZKlaSl1Cuj62GyzJJUfHjlUvh+Fft5+qqF/JeXVwmxmPQGpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ayb207jW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722872753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S4iwKDgHUmnVrUBbpp8w2UcZ/4fISxkc4J9qTt9x01I=;
	b=Ayb207jWK8HGVBTOmd8h+tave/Hr6H3UqICJOUfi4iMfd4pPmh9at2Eq/kcJjh+F0LZocH
	4XVxm43QFlORLSP7wcBNyOFiEQHP7QYngdNKwKIwfY4Y0xt8z9Zdiy5UOYjyTZbG132JHd
	8t/RIbyAktF+wVyC9buqU3MNWeD9EOc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-K1qVVO9MOKS37cDYTuxErg-1; Mon, 05 Aug 2024 11:45:51 -0400
X-MC-Unique: K1qVVO9MOKS37cDYTuxErg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77e044ff17so690766466b.3
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 08:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872750; x=1723477550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4iwKDgHUmnVrUBbpp8w2UcZ/4fISxkc4J9qTt9x01I=;
        b=H06AsdG571KePI4yuBGW/oKRzTsLIE9wLMO6BLrIxXMXN+4L31/1azmNlRyBSCgrbR
         BZVU0GbbX0mgkK0I1mGh2Za4ckbiiaoekyscq9YEbKL9l8lT2/ABIOZDcE42ieTDBpXt
         2jTtsyjnsIf4bu2YW8Kdfca6luLqxUsgzZmVCEA66AyuROaFuVmdC5P7N2uJMUtcYnCO
         /kJ0a5Wd+tq9Ec+N5RC+EI8zTLuF3J67VO9o1ydYailp7IsUHVIyYCxvLs1TRhVGm94P
         sX+MlQ3ghP+7Vx75Ak1Y8RigamgiChau1+uorKVl4pOasRCDPmKdkIZxqsJnAioEhMam
         mDdg==
X-Forwarded-Encrypted: i=1; AJvYcCUb+y0/txqnmGtDed/Y2JRF+u020n9lARiua07N1CkbZFhrGLcaFZg/fIWFMZX7jWxNuH1+RPpQmmRXcO9ySG/4f02PUEwFJ9je+OQ=
X-Gm-Message-State: AOJu0Yxbs2WOjYKekUm20LJKjd/9lOSafr0HUDDL1szAJ2hT/5SvIKk9
	ZOQjiut0fLM4JJjtho1s/AkA2TEFTxtccBoLPgik6EbxxlljoSvwqi9Po/k0DY/NHxmsfw+QOAN
	Itn1hCVqzlLiizB+Ix887WNpfcm3YhjBm5D5HTsS3EUFtdX9aWOA/oOtP4qka
X-Received: by 2002:a17:907:1b10:b0:a7d:3ab9:6a5d with SMTP id a640c23a62f3a-a7dc5130c90mr730345666b.69.1722872750234;
        Mon, 05 Aug 2024 08:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo04Sa6g3Vg0jT4zuHL7kQ/eErvdNwA+GPT0MKgfSzgJvZpYHn0GBCbFeKIiHUOzk2RSFhxw==
X-Received: by 2002:a17:907:1b10:b0:a7d:3ab9:6a5d with SMTP id a640c23a62f3a-a7dc5130c90mr730268466b.69.1722872720746;
        Mon, 05 Aug 2024 08:45:20 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d4dd45sm464397466b.104.2024.08.05.08.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 08:45:20 -0700 (PDT)
Message-ID: <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
Date: Mon, 5 Aug 2024 17:45:19 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, Jonathan Denose <jdenose@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, stable@vger.kernel.org
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZrDwF919M0YZTqde@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxim,

On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
> On Mon, 05 Aug 2024 at 16:16:08 +0200, Hans de Goede wrote:
>> Commit 07a4a4fc83dd ("ideapad: add Lenovo IdeaPad Z570 support (part 2)")
>> added an i8042_command(..., I8042_CMD_AUX_[EN|DIS]ABLE) call to
>> the ideapad-laptop driver to suppress the touchpad events at the PS/2
>> AUX controller level.
>>
>> Commit c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux
>> port on/off on select models") limited this to only do this by default
>> on the IdeaPad Z570 to replace a growing list of models on which
>> the i8042_command() call was disabled by quirks because it was causing
>> issues.
>>
>> A recent report shows that this is causing issues even on the Z570 for
>> which it was originally added because it can happen on resume before
>> the i8042 controller's own resume() method has run:
>>
>> [   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
>> [   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
>> [   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
>> [   50.247406] i8042: [49434] a8 -> i8042 (command)
>> [   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
>> ...
>> [   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
>> [   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
>> [   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
>> [   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
>> ...
>> [   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
>> [   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
>> [   50.248407] i8042: [49435] aa -> i8042 (command)
>> [   50.248601] i8042: [49435] 00 <- i8042 (return)
>> [   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55
> 
> What exactly is the issue? Is it just a few errors in dmesg, or does
> 8042 stop responding completely?

When this issue happens at resume the touchpad stops sending events
completely because the i8042 driver's resume() method fails and exits
early.

> 
> I've seen something similar when I enabled the touchpad while moving the
> cursor, but it was just a matter of a few lines in dmesg and a protocol
> resync, both touchpad and keyboard worked after that.

Right, the problem is that in this case the i8042's resume() method
is failing, which I believe causes the Elan ps/2 driver to not get
re-attached to the aux port on resume.


> 
>> Dmitry (input subsys maintainer) pointed out that just sending
>> KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON which the ideapad-laptop driver
>> already does should be sufficient and that it then is up to userspace
>> to filter out touchpad events after having received a KEY_TOUCHPAD_OFF.
> 
> I believe it's not the case (at least it wasn't back then). The whole
> point of my patch in the first place was to make touchpad toggle work
> properly on Z570.
> 
> Userspace (GNOME) supports two variants of hardware:
> 
> 1. Laptops that disable touchpad themselves and send out
> KEY_TOUCHPAD_ON/OFF to report the status. Upon receiving these keycodes,
> GNOME just shows the status pop-up and relies on firmware to disable the
> touchpad.
> 
> 2. Laptops that just send KEY_TOUCHPAD_TOGGLE whenever the key is
> pressed. GNOME maintains its own touchpad state and disables it in
> software (as well as showing the pop-up).

You're right I had forgotten about this. There is really no reason
why GNOME cannot also suppress events after a TOUCHPAD_OFF event,
but atm it indeed does not do this. We could fix this by patching:
plugins/media-keys/gsd-media-keys-manager.c of gnome-settings-daemon
to also update the TOUCHPAD_ENABLED_KEY setting when receiving
KEY_TOUCHPAD_ON/OFF. Something which I think we should do to,
but that will not help solve this bug since we cannot rely
on users having a fixed g-s-d.

So: self-NACK for this patch. (which is a bummer because I really
liked being able to just remove this)

> That means, userspace is not filtering out events upon receiving
> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
> is weird. It maintains the touchpad state in firmware to light up the
> status LED, but the firmware doesn't do the actual touchpad disablement.
> 
> That is, if we use TOGGLE, the LED will get out of sync. If we use
> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.

Ack.

So how about this instead:

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 1ace711f7442..b7fa06f793cb 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
 	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
 	 */
-	if (priv->features.ctrl_ps2_aux_port)
+	if (send_events && priv->features.ctrl_ps2_aux_port)
 		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
 
 	/*

Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
correctly reflects the state before suspend/resume in both touchpad on / off states ?

Jonathan, as the reporter of the original suspend/resume issue, can you check if
a kernel with this patch + ideapad-laptop re-enabled no longer has the suspend/resume
issue you were seeing ?

Regards,

Hans





> 
>> Given all the problems the i8042_command() call has been causing just
>> removing it indeed seems best, so this removes it completely. Note that
>> this only impacts the Ideapad Z570 since it was already disabled by
>> default on all other models.
> 
> While I agree that i8042_command() is not a perfect solution, I don't
> like the idea of breaking the touchpad toggle, even if "only one" laptop
> model is affected. Can we suppress input events from the touchpad in
> some other way, purely in software? I.e. don't call i8042_command(),
> don't disrupt the PS/2 protocol, but instead let ideapad-laptop tell
> psmouse to stop generating input events for a while?
> 
>> Fixes: c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on select models")
>> Reported-by: Jonathan Denose <jdenose@chromium.org>
>> Closes: https://lore.kernel.org/linux-input/20231102075243.1.Idb37ff8043a29f607beab6440c32b9ae52525825@changeid/
>> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/ideapad-laptop.c | 37 ---------------------------
>>  1 file changed, 37 deletions(-)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index 1ace711f7442..255fb56ec9ee 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -18,7 +18,6 @@
>>  #include <linux/device.h>
>>  #include <linux/dmi.h>
>>  #include <linux/fb.h>
>> -#include <linux/i8042.h>
>>  #include <linux/init.h>
>>  #include <linux/input.h>
>>  #include <linux/input/sparse-keymap.h>
>> @@ -144,7 +143,6 @@ struct ideapad_private {
>>  		bool hw_rfkill_switch     : 1;
>>  		bool kbd_bl               : 1;
>>  		bool touchpad_ctrl_via_ec : 1;
>> -		bool ctrl_ps2_aux_port    : 1;
>>  		bool usb_charging         : 1;
>>  	} features;
>>  	struct {
>> @@ -182,12 +180,6 @@ MODULE_PARM_DESC(set_fn_lock_led,
>>  	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
>>  	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
>>  
>> -static bool ctrl_ps2_aux_port;
>> -module_param(ctrl_ps2_aux_port, bool, 0444);
>> -MODULE_PARM_DESC(ctrl_ps2_aux_port,
>> -	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
>> -	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
>> -
>>  static bool touchpad_ctrl_via_ec;
>>  module_param(touchpad_ctrl_via_ec, bool, 0444);
>>  MODULE_PARM_DESC(touchpad_ctrl_via_ec,
>> @@ -1560,7 +1552,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
>>  static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
>>  {
>>  	unsigned long value;
>> -	unsigned char param;
>>  	int ret;
>>  
>>  	/* Without reading from EC touchpad LED doesn't switch state */
>> @@ -1568,15 +1559,6 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>>  	if (ret)
>>  		return;
>>  
>> -	/*
>> -	 * Some IdeaPads don't really turn off touchpad - they only
>> -	 * switch the LED state. We (de)activate KBC AUX port to turn
>> -	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>> -	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
>> -	 */
>> -	if (priv->features.ctrl_ps2_aux_port)
>> -		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>> -
>>  	/*
>>  	 * On older models the EC controls the touchpad and toggles it on/off
>>  	 * itself, in this case we report KEY_TOUCHPAD_ON/_OFF. Some models do
>> @@ -1699,23 +1681,6 @@ static const struct dmi_system_id hw_rfkill_list[] = {
>>  	{}
>>  };
>>  
>> -/*
>> - * On some models the EC toggles the touchpad muted LED on touchpad toggle
>> - * hotkey presses, but the EC does not actually disable the touchpad itself.
>> - * On these models the driver needs to explicitly enable/disable the i8042
>> - * (PS/2) aux port.
>> - */
>> -static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
>> -	{
>> -	/* Lenovo Ideapad Z570 */
>> -	.matches = {
>> -		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> -		DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
>> -		},
>> -	},
>> -	{}
>> -};
>> -
>>  static void ideapad_check_features(struct ideapad_private *priv)
>>  {
>>  	acpi_handle handle = priv->adev->handle;
>> @@ -1725,8 +1690,6 @@ static void ideapad_check_features(struct ideapad_private *priv)
>>  		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
>>  	priv->features.hw_rfkill_switch =
>>  		hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
>> -	priv->features.ctrl_ps2_aux_port =
>> -		ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
>>  	priv->features.touchpad_ctrl_via_ec = touchpad_ctrl_via_ec;
>>  
>>  	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
>> -- 
>> 2.45.2
>>
> 


