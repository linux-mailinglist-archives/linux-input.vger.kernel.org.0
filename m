Return-Path: <linux-input+bounces-13622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA37B0D15D
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 07:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3EB33B00EB
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 05:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FE028B4E0;
	Tue, 22 Jul 2025 05:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+OfOwjB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7852AE8B;
	Tue, 22 Jul 2025 05:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753163235; cv=none; b=YKwo2Vx+f+hm+/wXY4KLxo8wvUJ9OPuTxKXNBOnh8lcPOshSdCmgdLatdiGI825kDE604C6qawZ4MDRo7fq7tONuSCfEZMH8tKx7/wHhrSnGWpsFvT9GtIwixGhcE6eDVsEd9Z9KR7mSktx902Qc6wxoIFbLRmmJkiGgTpqXayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753163235; c=relaxed/simple;
	bh=4KTMcMNqa+Cs50akbCmfe4w7zBHigyKxTjl0IWyGT9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfHeU8liAs+KXRYl+MG5U/SFAk+Ao4eda9jf2tjcTyF5j8KVRrFwStbwiXyfR50Ibo/sAq2KQOgT9sOM2TL+w40Xyh+AzK6L8FhvNdJcJBE1tby14TFaPQt3n21nkfyrfY2MlrCszJtiAxOSuBIkLzZVy0+R80I5MzoZEjC+uD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+OfOwjB; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7de159778d4so473490585a.1;
        Mon, 21 Jul 2025 22:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753163232; x=1753768032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4az7oS3cJK4znd7m6hzbxOfo+D7DIH7z4MXzj8mANU=;
        b=R+OfOwjBTPQckVmYjEEBPu3VpVJbI8jiQ+Jpfqg9/PvsRPOMV7fh27MX5YMtho2JYB
         EHcALmUif7uICfRqrH+F5Q3F5nJTRvAXRYGsjrzaxdYJMqwfAKUjJAe4rowQ5c+UA/0L
         k/8SClBzXe3w+RH5HGT1b1KtJJgxWao6rC6awHlwhSmSz7N2YptxIUqcFcETdu0nmqui
         xd+sV2Qc+pRwHu0QMlVImKyaYzvtvGSd/qrtp0DlQxH/FlaL9SFNDKuEnGeX11d+zbRH
         /xAy87G5HykIqfjtEmyoZEHhTnQ8QYHHNDkklFB/2UAal1YcvhErnHvpmbWUifSujktm
         FAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753163232; x=1753768032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4az7oS3cJK4znd7m6hzbxOfo+D7DIH7z4MXzj8mANU=;
        b=MM3KF45z00sZjz8vTTN+xHWwMhDoPFodX44KnqRJAKbR7NNk6PI78L69gpy1nFwftl
         BplUOpWEOzdiJvusxB3s3ArgpqtDBQG8apBfPZPyKbLGM+kDW/VcrqbxNGmzu3PW6wkT
         iTHuTEovoz3U0em6RbLBaTsCB68GqpLcsO1PBbbZ/JdMNc7/G7xynPD5RQi7uPhJZWgE
         sKNZeEtXuCDvii9r/rm8zetbs/vLSB8AUpZlgRT8adbgz4jhKWFF5xondpUlV6NlnySH
         sy4Y09FSb/HHOsyyZ33gPlKBxZU+L5yfNWNK41eV3+8tndAU3TT8GuOyvoQ2Js+bFRiu
         4gmw==
X-Forwarded-Encrypted: i=1; AJvYcCVkW1KFOiQ9QNvsDL3tcO9r3xtPKjchVRqOrA4mABVaKAmrcsqzH4d+03ZzQ9u+wP1gznjhfThI74toWbyG@vger.kernel.org, AJvYcCX4XuNWty6NLpcXkoCWgVpm3dhJ0TWLvyKZfDBdkpmNMGK0lTU69gFtYPWo3rPTcimcDFuRnt/szO0UDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAeLLyPWxh4OUU9H93b2I6sucYjmI9HA3r39Et5sIuPh4PNkRa
	amhJYNcJDqvjt8INpsPuh7po//4/iZl74m1uLV2tcTqxPqkP/xEHPhkIOTyNyFKcTmrrfs4IKbO
	bYY/KfCqT0ZhL0sybEQQCuz97WYirAx0=
X-Gm-Gg: ASbGncsKuwFe5rBvHwluDr5xyEhD0luUilTqKXeOlsOXAw3AzJOSaBKm+1clg4n+JRh
	oB1CfJzNGiqGTOBIeqtPPeh0Y4D8Xf5JpYGmDS2tg9SZ7/pJVOy0P90Y73ua8yjFf/MjCB8REw+
	FeRZ42XSbKUpaUvGsatZV9o2ASzWJ6miyn0fptkpdVCg+o3z4y8/XSuWxQbO/DuZxCtieDX/9Id
	Qp/VNIuPhn+daLrIi8=
X-Google-Smtp-Source: AGHT+IHj7uZcjEGUf2a3Kt47PuPScQ7waQRxbjRqzMOqSNcrB+dm3z9uHThN3oEZFcyLvA+N8NAsISPEdQITGUMPp54=
X-Received: by 2002:ad4:5c43:0:b0:703:c1d0:b358 with SMTP id
 6a1803df08f44-704f6adbab8mr336694116d6.28.1753163232230; Mon, 21 Jul 2025
 22:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet> <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
 <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
In-Reply-To: <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 21 Jul 2025 22:47:01 -0700
X-Gm-Features: Ac12FXzDbvmmPc0WpbDb6J93GVU9pfXb9f9xfOSeIwJj4AonZZo1JR1KPlShXns
Message-ID: <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

I just got back from Japan (trip was a bit extended). In the meantime
I had some of employees had a look as well.

The audio patches towards the end seem to be okay. We tried to dig for
the official volume numbers, but they were too hard to find (too many
layers, too many repositories). When we use a PS5, the default volume
for the headset and speaker are both close to 70% (just eyeballing).
At the hardware level the volume is quite non-linear and internally we
use a mapping table (not sure what the curve is based on). For the
speaker this starts at 0x3d as you found out already. The 70% volume
for the speaker seems to correspond to a value of 93 and headphones
83.
The set pre-amp gain of 0x2 is a common value we seem to set and means
+6dB, so change comment around to mean that I guess.

As for the other patches I'm not entirely sure yet. I know they were
well intended, but let me just say, they rubbed some of my team
members quite the wrong way resulting in some heavy discussion. I have
somewhat similar feelings about the ultra strict checkpatch toggle as
well.

We had to move mountains to be allowed to even upstream controller
code among our limited time (it is closer to a hobby thing, even
though many products nowadays use it as well). So that's a factor
which adds up a bit as well.

I think some of the patches we could live with if it came to it. There
is no real agreed up full kernel standard (as it is contentious). So
for example we tend to prefer more uint8_t family, where older kernel
style was more u8 and the kernel allows for both. I think we would
probably lean towards keeping it at the modern form.

Some of the macros also felt a little too magical. Our feeling tends
to be if you have to go many layers deep to understand what a macro or
line of code does (and it is easier to then printk the value),
something feels off...

Thanks,

Roderick Colenbrander
Sr. Director - Hardware & Systems Engineering
Sony Interactive Entertainment, LLC

On Thu, Jul 10, 2025 at 2:31=E2=80=AFPM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Cristian,
>
> I'm on a business trip to Japan, I started looking during my flight
> last weekend. But due to meetings haven't had a lot of opportunity. I
> may have a little bit of time in the coming days in between meetings.
>
> Thanks,
> Roderick
>
> On Wed, Jul 9, 2025 at 10:24=E2=80=AFPM Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
> >
> > Hi Roderick,
> >
> > On 7/3/25 10:48 AM, Jiri Kosina wrote:
> > > On Wed, 25 Jun 2025, Cristian Ciocaltea wrote:
> > >
> > >> The Sony DualSense wireless controller (PS5) provides an internal mo=
no
> > >> speaker, in addition to the 3.5mm jack socket for headphone output a=
nd
> > >> headset microphone input.  However, the default audio output path is=
 set
> > >> to headphones, regardless of whether they are actually inserted or n=
ot.
> > >>
> > >> This patch series aims to improve the audio support when operating i=
n
> > >> USB mode, by implementing the following changes:
> > >>
> > >> * Detect when the plugged state of the audio jack changes and toggle
> > >>   audio output between headphones and internal speaker, as required.
> > >>   The latter is achieved by essentially routing the right channel of=
 the
> > >>   audio source to the mono speaker.
> > >>
> > >> * Adjust the speaker volume since its default level is too low and,
> > >>   therefore, cannot generate any audible sound.
> > >>
> > >> * Register a dedicated input device for the audio jack and use it to
> > >>   report all headphone and headset mic insert events.
> > >>
> > >> It's worth noting the latter is necessary since the controller compl=
ies
> > >> with v1.0 of the USB Audio Class spec (UAC1) and, therefore, cannot
> > >> advertise any jack detection capability.
> > >>
> > >> However, this feature can be implemented in the generic USB audio dr=
iver
> > >> via quirks, i.e. by configuring an input handler to receive hotplug
> > >> events from the HID driver.  That's exactly what has been accomplish=
ed
> > >> via the "ALSA: usb-audio: Support jack detection on Sony DualSense"
> > >> patchset [1], which has been already merged and should be available =
in
> > >> v6.17.
> > >>
> > >> Unrelated to the above, also provide a few driver cleanup patches, e=
.g.
> > >> make use of bitfields macros, simplify locking, fix coding style.
> > >>
> > >> [1] https://lore.kernel.org/all/20250526-dualsense-alsa-jack-v1-0-1a=
821463b632@collabora.com/
> > >>
> > >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > >> ---
> > >> Changes in v2:
> > >> - Updated cover letter including a reference to the usb-audio patch =
series
> > >> - Updated 'HID: playstation: Make use of bitfield macros' patch to d=
rop
> > >>   DS_STATUS_CHARGING_SHIFT and use FIELD_GET() for battery status op=
s
> > >> - Replaced 'HID: playstation: Rename DualSense input report status
> > >>   field' with 'HID: playstation: Redefine DualSense input report sta=
tus
> > >>   field' changing data type to a 3-byte array instead of renaming th=
e
> > >>   struct member (Roderick)
> > >> - Updated 'HID: playstation: Support DualSense audio jack hotplug
> > >>   detection' according to Roderick's feedback:
> > >>  * Used DS_STATUS1_ prefixes for the plugged status register and ren=
ame
> > >>    its bits to match the datasheet
> > >>  * Defined MIC_VOLUME_ENABLE bit of DS_OUTPUT_VALID_FLAG0 register
> > >>  * Renamed the newly introduced audio controls members in struct
> > >>    dualsense_output_report_common: headphone_volume, speaker_volume,
> > >>    mic_volume, audio_control, audio_control2
> > >> - Restricted audio jack hotplug detection and event reporting to USB
> > >>   operation mode only, since Bluetooth audio is currently not suppor=
ted
> > >>   and it might have a negative impact on the battery life (Roderick)
> > >> - Rebased series onto next-20250624
> > >> - Link to v1: https://lore.kernel.org/r/20250526-dualsense-hid-jack-=
v1-0-a65fee4a60cc@collabora.com
> > >
> > > Just for the record -- I like the v2, and am inclined to merge it, bu=
t
> > > would prefer doing that with Roderick's Ack, so I am waiting for a bi=
t
> > > here.
> >
> > Could you please confirm you are fine with the latest changes so that J=
iri
> > is able to merge the series?
> >
> > If you cannot find the time to look into every detail right now, we can
> > still take care of any non-essential matters afterwards.
> >
> > Thanks,
> > Cristian

