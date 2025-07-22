Return-Path: <linux-input+bounces-13623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBAAB0D1BF
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 08:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE771AA5187
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 06:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CC522CBE6;
	Tue, 22 Jul 2025 06:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+CwmpQj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3805C1D6DB9;
	Tue, 22 Jul 2025 06:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753165110; cv=none; b=tmlzlIyx7uf/T6xblc0PHpO94Tnbii16ZXYkSjL51r1PbsLyri9/RSWwJdz8bDjgFkqwcjRWaWekaC1dHJdRcrZ/j0DXQmHvv4DNDN/9qOULTWVfkm0EkX3TDHgvSKuTWi0jnAIzCv8wijJEG4eNKnr/xLZbJiFCtAqfC+DYTPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753165110; c=relaxed/simple;
	bh=3UA6Ar8A0xjj3pi1VnE5cBS2CaGqdVH3Y2CbdyYIaIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qu3FDQrOReTf5DyPf83PU0N07zH9CtgHZvV+HazIwxkBlvA2GMc06x/0rTUp0KxKMC+9ShhsjxT5wbtI3kcJuPf/jQ5RtpcDJOIIfCQiEhba2F8BUtU5swFAz/poMif+0oiy7X6U0Ap5E2K+6WWDyhaTGwk8x4rNz49CxxUpuDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+CwmpQj; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ab39fb71dbso61961191cf.3;
        Mon, 21 Jul 2025 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753165107; x=1753769907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g591JV7Lll7dveL4Ui28HG8oXXAGz8E3BlnpzXheLN4=;
        b=j+CwmpQjsH4dZSKBPFswi8cfRnBWQHgT0QUaHLaLZiK6c7qsQtVw75cXGXov2aVBp4
         bA6Q0LRtxF5wJocde/64Y5MOyybm807i2F2DXITMNqGKtjNHOSUqci/jKnZBqPUWuWNj
         jfKOLC/zSaPVTyKOxx9Q4gJc1oHQs74GSmWoReKHbfwjOkfjfCpVGHpPidGQn31mPGeD
         OUYHL9emBP8qcrs0FCJR3LpLWI9ZDTR5J2O1Sjml2Vn8n6w/Tg5hpxkqM8LKibrKj/pZ
         3tUDJ6k+qWzDf4vbsjKITsCnGhORRrxgOm0zgaO2lmOFdBrFKbIqS3ie03UvVnJMy8wt
         FJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753165107; x=1753769907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g591JV7Lll7dveL4Ui28HG8oXXAGz8E3BlnpzXheLN4=;
        b=xTOlMBZHW2ARiJh3O4bwUzgI+3YiBENT7xn7MtTBnjizHVMkLaogUx/vThkXmgNZGx
         EhaT3I7ahivBPWi6qZzjAF24XNpm5HSBWx70eK5LBcB7Nfo66NbWYxC3TUtodkWNqyYv
         5ecpRDuVep74NbsnkKZRw5LkTkKxxWzGulLh0XyoL2/mZd8bt3AzdA4eSsFoQKxHotAU
         /9UZtbJsMuTGLygRDt8iUWU8dopsxmcKLYnsfTsT1iZmeb2F4L6tfl+6a0EFROM4L5X7
         88rY/zugqNsMqUajMV2KowyRcMvTJVwneobx6fkHezPlOs/A7PkWBUDe8zpFW35qw3lY
         7ixg==
X-Forwarded-Encrypted: i=1; AJvYcCU24OdvjMXdDeGUbzhJgZ7YyVd3lOLjGGzVzMNThltan49Q+n13tQfdN2Vzn9tOkgU/dHEWHiF7odWoNA==@vger.kernel.org, AJvYcCUWElwxQX2+LAVWHeLZosSLPgYoZZW+SCmGLigTWm0+iMxBSw6vLwLzNpmwrvyxRZJsFJBYyp4ScR6+LjuN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzse4vREuiUxRUyxls5MY7Q+Ce44vxwg2FJb0OcTxs9Ha5d5jf5
	RdH8L79m1pW/Tfs8LUIYzjRlo/ypfu5ne9f53e0j0Nk4x3NKtbpCcduwa8Q0Z7lM1KH8xx18lpE
	8IVVZBP+FZ68eLxw8YSq6hmU4JRwWS/k=
X-Gm-Gg: ASbGncu8ZL+twdR7QPPUj7I4ecrrONPzNjHbM8d769kTv4ObjnfGPoBajsESgSUFghs
	feivW1fCpP8GPO2o64VDUk743rXZcsAne61g5zrBgyyxgYgkh+jSliZb3V5RSkkfFD2PEr710qm
	j213hnIzmNfVJI5NGp+9QIAfsTeXXrNa/3IrkyPcn4PqwRUA6Lt5+SQmr1faCTyuWGfru9vciFa
	8GPOZFB
X-Google-Smtp-Source: AGHT+IHkWGztWe6BDJ2uioDwfmFupXEEi7HThTeunVyKy8Mnt755Zxuor9DCXiBgyE66Xb3EhMocfOmPmgq78Qsl4Ew=
X-Received: by 2002:a05:6214:529a:b0:706:c5f3:1da0 with SMTP id
 6a1803df08f44-706c5f32e0emr182664836d6.36.1753165106845; Mon, 21 Jul 2025
 23:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet> <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
 <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com> <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
In-Reply-To: <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 21 Jul 2025 23:18:15 -0700
X-Gm-Features: Ac12FXyNgPQ2XAD25FbDzjEaJqQ5SPj3zc4XmK8veuB5jZ0vymP-1u9lezLlJyw
Message-ID: <CAEc3jaD8tUNW6hkPHDp=iGmdwD5m3uKg0vNtyZr-u1mmPSAkVQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian and Jiri,

One thing I forgot to bring up is whether it is best to have the audio
plug logic have its separate input device or have it be part of an
existing (e.g. main gamepad). The patch currently creates a separate
input device. Originally we added multiple input devices (gamepad,
touchpad and sensors) due to axes and button collisions really.

For this feature there is no collision. There are not many devices in
the kernel, which support these audio EV_SW. I see for example the
Switch 2 controller has a mini jack port as well. Some xbox
controllers too (though audio not supported in the kernel from a quick
glance or at least no HID or xpad driver features for them).

I don't have a strong opinion yet. Initial feeling was perhaps have it
on the 'main' input device. But on the other hand, I'm not sure what
software is normally listening for these kinds of EV_SW events. What
would be listening for this like a pipewire?

Thanks,
Roderick

On Mon, Jul 21, 2025 at 10:47=E2=80=AFPM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Christian,
>
> I just got back from Japan (trip was a bit extended). In the meantime
> I had some of employees had a look as well.
>
> The audio patches towards the end seem to be okay. We tried to dig for
> the official volume numbers, but they were too hard to find (too many
> layers, too many repositories). When we use a PS5, the default volume
> for the headset and speaker are both close to 70% (just eyeballing).
> At the hardware level the volume is quite non-linear and internally we
> use a mapping table (not sure what the curve is based on). For the
> speaker this starts at 0x3d as you found out already. The 70% volume
> for the speaker seems to correspond to a value of 93 and headphones
> 83.
> The set pre-amp gain of 0x2 is a common value we seem to set and means
> +6dB, so change comment around to mean that I guess.
>
> As for the other patches I'm not entirely sure yet. I know they were
> well intended, but let me just say, they rubbed some of my team
> members quite the wrong way resulting in some heavy discussion. I have
> somewhat similar feelings about the ultra strict checkpatch toggle as
> well.
>
> We had to move mountains to be allowed to even upstream controller
> code among our limited time (it is closer to a hobby thing, even
> though many products nowadays use it as well). So that's a factor
> which adds up a bit as well.
>
> I think some of the patches we could live with if it came to it. There
> is no real agreed up full kernel standard (as it is contentious). So
> for example we tend to prefer more uint8_t family, where older kernel
> style was more u8 and the kernel allows for both. I think we would
> probably lean towards keeping it at the modern form.
>
> Some of the macros also felt a little too magical. Our feeling tends
> to be if you have to go many layers deep to understand what a macro or
> line of code does (and it is easier to then printk the value),
> something feels off...
>
> Thanks,
>
> Roderick Colenbrander
> Sr. Director - Hardware & Systems Engineering
> Sony Interactive Entertainment, LLC
>
> On Thu, Jul 10, 2025 at 2:31=E2=80=AFPM Roderick Colenbrander
> <thunderbird2k@gmail.com> wrote:
> >
> > Hi Cristian,
> >
> > I'm on a business trip to Japan, I started looking during my flight
> > last weekend. But due to meetings haven't had a lot of opportunity. I
> > may have a little bit of time in the coming days in between meetings.
> >
> > Thanks,
> > Roderick
> >
> > On Wed, Jul 9, 2025 at 10:24=E2=80=AFPM Cristian Ciocaltea
> > <cristian.ciocaltea@collabora.com> wrote:
> > >
> > > Hi Roderick,
> > >
> > > On 7/3/25 10:48 AM, Jiri Kosina wrote:
> > > > On Wed, 25 Jun 2025, Cristian Ciocaltea wrote:
> > > >
> > > >> The Sony DualSense wireless controller (PS5) provides an internal =
mono
> > > >> speaker, in addition to the 3.5mm jack socket for headphone output=
 and
> > > >> headset microphone input.  However, the default audio output path =
is set
> > > >> to headphones, regardless of whether they are actually inserted or=
 not.
> > > >>
> > > >> This patch series aims to improve the audio support when operating=
 in
> > > >> USB mode, by implementing the following changes:
> > > >>
> > > >> * Detect when the plugged state of the audio jack changes and togg=
le
> > > >>   audio output between headphones and internal speaker, as require=
d.
> > > >>   The latter is achieved by essentially routing the right channel =
of the
> > > >>   audio source to the mono speaker.
> > > >>
> > > >> * Adjust the speaker volume since its default level is too low and=
,
> > > >>   therefore, cannot generate any audible sound.
> > > >>
> > > >> * Register a dedicated input device for the audio jack and use it =
to
> > > >>   report all headphone and headset mic insert events.
> > > >>
> > > >> It's worth noting the latter is necessary since the controller com=
plies
> > > >> with v1.0 of the USB Audio Class spec (UAC1) and, therefore, canno=
t
> > > >> advertise any jack detection capability.
> > > >>
> > > >> However, this feature can be implemented in the generic USB audio =
driver
> > > >> via quirks, i.e. by configuring an input handler to receive hotplu=
g
> > > >> events from the HID driver.  That's exactly what has been accompli=
shed
> > > >> via the "ALSA: usb-audio: Support jack detection on Sony DualSense=
"
> > > >> patchset [1], which has been already merged and should be availabl=
e in
> > > >> v6.17.
> > > >>
> > > >> Unrelated to the above, also provide a few driver cleanup patches,=
 e.g.
> > > >> make use of bitfields macros, simplify locking, fix coding style.
> > > >>
> > > >> [1] https://lore.kernel.org/all/20250526-dualsense-alsa-jack-v1-0-=
1a821463b632@collabora.com/
> > > >>
> > > >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.co=
m>
> > > >> ---
> > > >> Changes in v2:
> > > >> - Updated cover letter including a reference to the usb-audio patc=
h series
> > > >> - Updated 'HID: playstation: Make use of bitfield macros' patch to=
 drop
> > > >>   DS_STATUS_CHARGING_SHIFT and use FIELD_GET() for battery status =
ops
> > > >> - Replaced 'HID: playstation: Rename DualSense input report status
> > > >>   field' with 'HID: playstation: Redefine DualSense input report s=
tatus
> > > >>   field' changing data type to a 3-byte array instead of renaming =
the
> > > >>   struct member (Roderick)
> > > >> - Updated 'HID: playstation: Support DualSense audio jack hotplug
> > > >>   detection' according to Roderick's feedback:
> > > >>  * Used DS_STATUS1_ prefixes for the plugged status register and r=
ename
> > > >>    its bits to match the datasheet
> > > >>  * Defined MIC_VOLUME_ENABLE bit of DS_OUTPUT_VALID_FLAG0 register
> > > >>  * Renamed the newly introduced audio controls members in struct
> > > >>    dualsense_output_report_common: headphone_volume, speaker_volum=
e,
> > > >>    mic_volume, audio_control, audio_control2
> > > >> - Restricted audio jack hotplug detection and event reporting to U=
SB
> > > >>   operation mode only, since Bluetooth audio is currently not supp=
orted
> > > >>   and it might have a negative impact on the battery life (Roderic=
k)
> > > >> - Rebased series onto next-20250624
> > > >> - Link to v1: https://lore.kernel.org/r/20250526-dualsense-hid-jac=
k-v1-0-a65fee4a60cc@collabora.com
> > > >
> > > > Just for the record -- I like the v2, and am inclined to merge it, =
but
> > > > would prefer doing that with Roderick's Ack, so I am waiting for a =
bit
> > > > here.
> > >
> > > Could you please confirm you are fine with the latest changes so that=
 Jiri
> > > is able to merge the series?
> > >
> > > If you cannot find the time to look into every detail right now, we c=
an
> > > still take care of any non-essential matters afterwards.
> > >
> > > Thanks,
> > > Cristian

