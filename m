Return-Path: <linux-input+bounces-12756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C773AD2D04
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 07:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84D8B188F33A
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 05:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD4225D528;
	Tue, 10 Jun 2025 05:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMcQAc8G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740504C96;
	Tue, 10 Jun 2025 05:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531907; cv=none; b=U4iywn02R1sEBXy0czUedyrqcyYycaGHpqnCl9Z0A3p1vfqkaaRSbuY046ypawbOtThh4FriDRz7IdhF1B/xVYqYvY0OKMGbPx8kKHFhhcgGND42p9Ku5EAFEXbFmzYGjglKTlQ4zhgJ5ndBsfIg7SnJkGRBcZQ9szGFq6NByv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531907; c=relaxed/simple;
	bh=pREx/uzgP3tAcFvG4sigzu0gzJ/wJn95R54bz25K7fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8YJkDa2Z0/p1WNrDq0fERSdGu99yrY2AY4B6IKUaIF80E0p65Vf3Tatl92XWY3PHn9Mw1yHsZK244Emv1WCfRO9PJY0hrKJthEypSygLzVMGlEgrsAt2ta0xx4v5wZcMGIAD79cY+h/J0TRXt/VlLOmuMUbO1Tz3N/tjrA8O1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMcQAc8G; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fafaa60889so34214206d6.3;
        Mon, 09 Jun 2025 22:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749531904; x=1750136704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j674pjNX4gUcHDPlAbHSFCGYPQqvQCVxVnD3yaqZay4=;
        b=TMcQAc8GogF8BOqx5M3VeXC9OE4/urZebQJg1fptf/5bdz3OKP3wRiNJGcZEYM03tZ
         L3lZAM5+mjUJaj0ADp1LyLTIHoKiFh5CKzS78Q5RSZysF7kpp2YVhwNMm42hB7zMEaYs
         IWeFh82zpKDxP3yqSYBNxjs+Jne+cD/w0tryWpfeakh4/uTx3OJYA8+7NeJ9vz1yRMnm
         t5lQg+FUN6FllsorIMnNwALBWvKphk6wuAKeKV+qb7oPVsc3itWwUkk7KfegeVH3lahx
         YgTB2ww9waFw9pS6u5EgF/eFqIkcL2L7w5frHHlGrBikaOEzHPF4npgrsS5E92qdG5Uu
         QCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531904; x=1750136704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j674pjNX4gUcHDPlAbHSFCGYPQqvQCVxVnD3yaqZay4=;
        b=r5OyeUc3qi/4c5lgqs1HJcIuhm8KzjPP7X7XHIikHiclSJlNGvNTr0o/4++Jyw5YW4
         FRSSNc456L43lDQy1ypJvT/NjsxC3JVzeng/a+KvqOY1c2C/KYb0gHBnlTHNtffPOYaV
         TkKbzabmgsEBa8bdcdObjbJh+4MnscRpK4zj0eoFvjlQZHjRsE9/eFCOM0LCXL2+Xvtd
         UiEe7iod52I1ioo0p+sC6s9lwTRatA7ous2SKpamyZ0Rm2WGmKId0hpYzcR2djpRd4X+
         Pfre6N/KKflnkCrMw4eE9B5uZctb4b1wVr2dqKd5pcGPpV3ij7td6OlVgZ6SVvOoplY1
         w9jg==
X-Forwarded-Encrypted: i=1; AJvYcCUCrrjggcH0tGaASOfM3oXTSMx9D6MTXsHnQonBKn/+Ed2N2ISKWjh2WlHjROUrRTfRidBJ1C3PGjjfHQ==@vger.kernel.org, AJvYcCUTxZysrw2mTHg0CWRjyX45Ikn2UFhpKruBhQp0Z0ZewnwxLs1jbUKmeEl/AfovV2NMgSMR/YfhVP5zhOmk@vger.kernel.org
X-Gm-Message-State: AOJu0YzwbrGercdx8UhNJxg0JDS/1CIbe2ZRrbF6Kjn9a3snIradfyCS
	kDtto7aPMz2fNHwl3hkXTRwLcbP3iZRJIApw84fb6XwYCNbE+yKgIA8xj5bA4J3bBlY6k7WOJfK
	LKR7sw5AQUV+R9B3PHIFF29tCyhNd3fQ=
X-Gm-Gg: ASbGncuERcf2fCcXcnovmAbfk4qNyKWCZNeB39Yj4rOTOC9W5lFiHMYj2OFph3Ds7za
	GKdpezfIp5XD/gr9UyvHCBoEfK6O7e36KaTcVC/llV0I6d0enABvh3XmVBIBam9s4CEjpzlgvF9
	a1nY5uQb5DQROLTjDR2Rnfo2sKWMYXBBvI6mL/M2/KJWV6wgNoxGO+qxM=
X-Google-Smtp-Source: AGHT+IFExwrBCtgc1N9HmMnC6TjO0iYi0Xa06wcyJ/nd7FckAm67lsfg3wy0qbt0GOFCmossstKu1GZx/m9ZB9UFCgc=
X-Received: by 2002:ad4:5ecc:0:b0:6fa:c5be:dabe with SMTP id
 6a1803df08f44-6fb08f5bc1emr278034196d6.19.1749531904293; Mon, 09 Jun 2025
 22:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com> <20250526-dualsense-hid-jack-v1-10-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-10-a65fee4a60cc@collabora.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 9 Jun 2025 22:04:52 -0700
X-Gm-Features: AX0GCFvAxk1VZrYQB-5TosNHSTZjbtSS7ERBBKqIYm1BrMXXAfLjW8byDofjhJ8
Message-ID: <CAEc3jaAm4gws8drVKvQGYHoAT4fb5i7sSPJ0LFiSGHaVAzKZnA@mail.gmail.com>
Subject: Re: [PATCH 10/11] HID: playstation: Support DualSense audio jack
 hotplug detection
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Thanks for sharing I need to have a closer look to see what we do on
the console as well (we want to keep behavior where possible in sync
also due to official PlayStation use cases on embedded devices).

At least use this logic only for USB, we should not register these
nodes or apply such settings for Bluetooth. Just setting these on
bluetooth without audio I could see affecting battery life a bit. But
in addition, I honestly don't really see a path to supporting
Bluetooth audio for the DualSense. It would add confusion for users.
The reason, I don't think there is a good way for adding audio is that
the DualSense is very, very complex. In Bluetooth mode we have our own
ways of doing audio (non-standard), which is already tricky. Above all
else the audio is compressed and not PCM. The only way to do it is
probably in userspace in something PulseAudio like. So before rushing
adding this also for Bluetooth, I want to limit this to USB.

I'm sharing some other feedback in line. It is small stuff, but in
particular I like to keep datasheets and code in sync, so of it is
around naming. It allows us internally for easier review as well.

There are some areas I need to study some more and get internal
documentation, so I don't have thorough feedback on the audio code
itself yet.

Thanks,
Roderick

On Mon, May 26, 2025 at 6:04=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> The default audio output path on DualSense controller hardware is set to
> headphones, regardless of whether they are actually inserted or not.
>
> Detect when the plugged state of the 3.5mm audio jack changes and toggle
> audio output between headphones and internal speaker, as required.  The
> latter is achieved by essentially routing the right channel of the audio
> source to the mono speaker.
>
> Additionally, adjust the speaker volume since its default level is too
> low and, therefore, cannot generate any audible sound.
>
> It's worth noting the audio functionality is currently not supported for
> Bluetooth, hence it's limited to USB connectivity.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/hid/hid-playstation.c | 86 +++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 83 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index b7777d3230b2fe277a4a2217ef6b1eff9cfad182..ed8e67c5bf5d3a9e9721da31a=
6bd84f0b6802b14 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -117,6 +117,12 @@ struct ps_led_info {
>  #define DS_STATUS_BATTERY_CHARGING             GENMASK(7, 4)
>  #define DS_STATUS_BATTERY_CHARGING_SHIFT       4
>
> +/* Plugged status field of DualSense input report. */
> +#define DS_STATUS_PLUGGED_HEADPHONES           BIT(0)
> +#define DS_STATUS_PLUGGED_MIC                  BIT(1)
> +#define DS_STATUS_PLUGGED_JACK                 (DS_STATUS_PLUGGED_HEADPH=
ONES | \
> +                                                DS_STATUS_PLUGGED_MIC)

Like I mentioned in patch 10, there are 3 status bytes. So let's call
this DS_STATUS1_. The other 5 bits in this one are unrelated to audio.

Official datasheets call these 'HP_DETECT', 'MIC_DETECT' and
'MIC_MUTE'. I guess we should use those names.

> +
>  /* Feature version from DualSense Firmware Info report. */
>  #define DS_FEATURE_VERSION_MINOR               GENMASK(7, 0)
>  #define DS_FEATURE_VERSION_MAJOR               GENMASK(15, 8)
> @@ -144,13 +150,18 @@ struct ps_led_info {
>  /* Flags for DualSense output report. */
>  #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION             BIT(0)
>  #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT                   BIT(1)
> +#define DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE            BIT(5)
Just for completeness also add BIT(6) which is MIC_VOLUME_ENABLE
> +#define DS_OUTPUT_VALID_FLAG0_AUDIO_CONTROL_ENABLE             BIT(7)
>  #define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE      BIT(0)
>  #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE                B=
IT(1)
>  #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE          BIT(2)
>  #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS                     BIT(3)
>  #define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE  BIT(4)
> +#define DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE            BIT(7)
>  #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE    BIT(1)
>  #define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2            BIT(2)
> +#define DS_OUTPUT_AUDIO_FLAGS_OUTPUT_PATH_SEL                  GENMASK(5=
, 4)
> +#define DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN                  GENMASK(2=
, 0)
>  #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE                  BIT(4)
>  #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT                     BIT(1)
>
> @@ -193,6 +204,11 @@ struct dualsense {
>         u8 lightbar_green;
>         u8 lightbar_blue;
>
> +       /* Audio Jack plugged state */
> +       u8 plugged_state;
> +       u8 prev_plugged_state;
> +       bool prev_plugged_state_valid;
> +
>         /* Microphone */
>         bool update_mic_mute;
>         bool mic_muted;
> @@ -237,7 +253,8 @@ struct dualsense_input_report {
>
>         u8 reserved3[12];
>         u8 status_battery;
> -       u8 reserved4[10];
> +       u8 status_plugged;
> +       u8 reserved4[9];
>  } __packed;
>  /* Common input report size shared equals the size of the USB report min=
us 1 byte for ReportID. */
>  static_assert(sizeof(struct dualsense_input_report) =3D=3D DS_INPUT_REPO=
RT_USB_SIZE - 1);
> @@ -252,11 +269,15 @@ struct dualsense_output_report_common {
>         u8 motor_left;
>
>         /* Audio controls */
> -       u8 reserved[4];
> +       u8 headphone_audio_volume;              /* 0-0x7f */
Just call this headphone_volume
> +       u8 speaker_audio_volume;                /* 0-0xff */
Just call this speaker_volume
> +       u8 internal_microphone_volume;  /* 0-0x40 */
We call this one mic_volume
> +       u8 audio_flags;
We call this one audio_control.

>         u8 mute_button_led;
>
>         u8 power_save_control;
> -       u8 reserved2[28];
> +       u8 reserved2[27];
> +       u8 audio_flags2;
This one we call audio_control2
>
>         /* LEDs and lightbar */
>         u8 valid_flag2;
> @@ -1304,6 +1325,46 @@ static void dualsense_output_worker(struct work_st=
ruct *work)
>                 ds->update_player_leds =3D false;
>         }
>
> +       if (ds->plugged_state !=3D ds->prev_plugged_state) {
> +               u8 val =3D ds->plugged_state & DS_STATUS_PLUGGED_HEADPHON=
ES;
> +
> +               if (val !=3D (ds->prev_plugged_state & DS_STATUS_PLUGGED_=
HEADPHONES)) {
> +                       common->valid_flag0 =3D DS_OUTPUT_VALID_FLAG0_AUD=
IO_CONTROL_ENABLE;
> +                       /*
> +                        *  _--------> Output path setup in audio_flag0
> +                        * /  _------> Headphone (HP) Left channel sink
> +                        * | /  _----> Headphone (HP) Right channel sink
> +                        * | | /  _--> Internal Speaker (SP) sink
> +                        * | | | /
> +                        * | | | |     L/R - Left/Right channel source
> +                        * 0 L-R X       X - Unrouted (muted) channel sou=
rce
> +                        * 1 L-L X
> +                        * 2 L-L R
> +                        * 3 X-X R
> +                        */
> +                       if (val) {
> +                               /* Mute SP and route L+R channels to HP *=
/
> +                               common->audio_flags =3D 0;
> +                       } else {
> +                               /* Mute HP and route R channel to SP */
> +                               common->audio_flags =3D
> +                                       FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS_=
OUTPUT_PATH_SEL, 0x3);
> +                               /*
> +                                * Set SP hardware volume to 100%.
> +                                * Note the accepted range seems to be [0=
x3d..0x64]
> +                                */
> +                               common->valid_flag0 |=3D DS_OUTPUT_VALID_=
FLAG0_SPEAKER_VOLUME_ENABLE;
> +                               common->speaker_audio_volume =3D 0x64;
> +                               /* Set SP preamp gain to ~30% */
> +                               common->valid_flag1 =3D DS_OUTPUT_VALID_F=
LAG1_AUDIO_CONTROL2_ENABLE;
> +                               common->audio_flags2 =3D
> +                                       FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS2=
_SP_PREAMP_GAIN, 0x2);
> +                       }
> +               }
> +
> +               ds->prev_plugged_state =3D ds->plugged_state;
> +       }
> +
>         if (ds->update_mic_mute) {
>                 common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_MIC_MUTE_L=
ED_CONTROL_ENABLE;
>                 common->mute_button_led =3D ds->mic_muted;
> @@ -1407,6 +1468,25 @@ static int dualsense_parse_report(struct ps_device=
 *ps_dev, struct hid_report *r
>         }
>         ds->last_btn_mic_state =3D btn_mic_state;
>
> +       /* Parse HP/MIC plugged state data */
> +       value =3D ds_report->status_plugged & DS_STATUS_PLUGGED_JACK;
> +       if (!ds->prev_plugged_state_valid) {
> +               /* Initial handling of the plugged state report */
> +               scoped_guard(spinlock_irqsave, &ps_dev->lock) {
> +                       ds->plugged_state =3D (~value) & DS_STATUS_PLUGGE=
D_JACK;
> +                       ds->prev_plugged_state_valid =3D true;
> +               }
> +       }
> +       if (value !=3D ds->plugged_state) {
> +               scoped_guard(spinlock_irqsave, &ps_dev->lock) {
> +                       ds->prev_plugged_state =3D ds->plugged_state;
> +                       ds->plugged_state =3D value;
> +               }
> +
> +               /* Schedule audio routing towards active endpoint. */
> +               dualsense_schedule_work(ds);
> +       }
> +
>         /* Parse and calibrate gyroscope data. */
>         for (i =3D 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
>                 int raw_data =3D (short)le16_to_cpu(ds_report->gyro[i]);
>
> --
> 2.49.0
>
>

