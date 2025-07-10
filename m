Return-Path: <linux-input+bounces-13481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8567B00DE2
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 23:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF5F63AC81D
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 21:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B402FE369;
	Thu, 10 Jul 2025 21:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRC+szzT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0402FE336;
	Thu, 10 Jul 2025 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183075; cv=none; b=j01w5b0ratakmm97QvK+YGeCcpPS1B7t1K6qno2ZQuCJ6RCt4BVzord2IDmqVjh2IcWvVJ44VWkAF0LnH1VEHOMZ3YUtTBq1G9QuRH6O9TDuvGlSAq+CMZQBMZTZrwMfVAIV2m+kQGD0pLuYoieecLxT5CzZX5PeaGJANJiv600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183075; c=relaxed/simple;
	bh=Nctyclrjk+ndKQoQ3tLQBAyFqbPo3Ojpr+ZjQeMrZJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJ3jD9euxaqah5bxc7mc9cKPJMfU6uohpXlTK6fN8IXe+W7svwoRtqYQ/RlirNb5w/x6f6D1nG/9yYNwbITYRzbuRC8M7XVx09bvE5zdn0QicoeJ9oP+l9x5W8f+h6G0UigcZPFj+fRT3ECQHlw96HvsO+BkzX0FJPPwBV5ZMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRC+szzT; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a5903bceffso17998381cf.3;
        Thu, 10 Jul 2025 14:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752183072; x=1752787872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TsdunL4dTHjJttP2v8TD9tL9e2bTjXIwIri8DS4OCY=;
        b=IRC+szzTGIWnKlyjpBHX4oZfDv/C9yIJzWhEJFvSmzNUDoluF9RWM38pZFPo33iH5t
         wDnGMDdAg7hpvkXIutvVfx9P2i/FiuyJM9u0v6u4kH+jHXuMuiDWPCxNsOjnzJvXFBb6
         CsEjx+4iHgsKo0n3b4WKORWUWP5fSyj2cXCNVT3qZb5ZgvWLrj1HuXZMrmrSG4Xd8k4D
         G2DIoAHc49nSJaGbUIXfMWnTFZZXcSiwKGLNf2aV17+CqFc7svi1YaDGGa0iIUYt2lkS
         yI0LOIOpIXSjagNETrvsul/9EFIEjfq4q87mXl/oJgTpmVqKMRGN7u5LzmP18LunGBXh
         LozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183072; x=1752787872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TsdunL4dTHjJttP2v8TD9tL9e2bTjXIwIri8DS4OCY=;
        b=EKk6WEaG7np8QCUwrrXY6zFCWlJmm8vCDmiJjpda7260VzdLA4UZCOEQxm8D/mq82a
         kEVU5y9RMy1bSFX1Ya4CEDK6NNcjlwL9rKXofHCY/2ACLEzkJgcTYwDE2yHXAoin83Sy
         Vsej+wXESfVvMpEIu02YTy5c0ZmdSvTNd3SwWdgIRbOmALWIwR1QO0aiLT+Jb3iAMQtF
         XRiBO7EwNNGhL2kRsTil8RQQWg2MLsiVd3jZUL58zJlaXgDLajKZz+v7LJr511xN9awX
         zaPOCDlTSkba7PJBEJxVaW1U9B771RKB9QAMZVmgubMcv8iYQDE6UQj4Z/jC+QdPQMgN
         TnvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvmpGeESPFHrqX/hFBqzcwZHeD2581Qg2Ct4G704x1VEnJy6MNdoTwEYOJfaUiQHCcoQF0ef9DK5V1lA==@vger.kernel.org, AJvYcCWvj0F4VwUCQIwLMS0dQFeRk30pV/864EYOhN4fOgXOgWwPDuTiqD2LmwvjXtulu0cWWWzRwtU7fsPovUbh@vger.kernel.org
X-Gm-Message-State: AOJu0YxIEpIwozVU9ejIODx1mZApD4anid8jTSdhvUU6VZlLIGtLribe
	f/96BMHL5MKEisg4qMyeDQC10OF/a8pMQNFARxI7a2PEdy04O6KSL4flabbJRq+ePkVBN8Cy97o
	q/hhxfA+6MWJUgpCsZGqyHJycCXYOVYc=
X-Gm-Gg: ASbGnctR50UqGrtLDS86GDtuAnMxucCUd2NGOhA2ukXlsczbpAKXRlqj1rycFLkBF8h
	o99O6wCsCMa488Ayu37DRePcgHQbqX9Njf4SWa7nkiy2eRC1MJDGjiDkLX8T4kckRBboaqg9Njr
	ZOLby7I2J8VZyOEeTu49E/C6/Gm/7WRZmD4blfOi1vqy3R
X-Google-Smtp-Source: AGHT+IHCjNSe1NH7PYjS/h13gizFuUMlrFFqiG8jA+gI/TL6Q7vmhHDgXLVikqrjMHSjLLmV1MsN9n8OwUxgYg+9F0k=
X-Received: by 2002:a05:6214:2028:b0:704:7df7:c1a0 with SMTP id
 6a1803df08f44-704a6f09ff7mr260826d6.7.1752183071901; Thu, 10 Jul 2025
 14:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet> <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
In-Reply-To: <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Thu, 10 Jul 2025 14:31:00 -0700
X-Gm-Features: Ac12FXycgdWwNBL-QInwL1WTEq-l_sAvNSycG34OjJyEXXy5ta7XPR_MFYDo3Wg
Message-ID: <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian,

I'm on a business trip to Japan, I started looking during my flight
last weekend. But due to meetings haven't had a lot of opportunity. I
may have a little bit of time in the coming days in between meetings.

Thanks,
Roderick

On Wed, Jul 9, 2025 at 10:24=E2=80=AFPM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Hi Roderick,
>
> On 7/3/25 10:48 AM, Jiri Kosina wrote:
> > On Wed, 25 Jun 2025, Cristian Ciocaltea wrote:
> >
> >> The Sony DualSense wireless controller (PS5) provides an internal mono
> >> speaker, in addition to the 3.5mm jack socket for headphone output and
> >> headset microphone input.  However, the default audio output path is s=
et
> >> to headphones, regardless of whether they are actually inserted or not=
.
> >>
> >> This patch series aims to improve the audio support when operating in
> >> USB mode, by implementing the following changes:
> >>
> >> * Detect when the plugged state of the audio jack changes and toggle
> >>   audio output between headphones and internal speaker, as required.
> >>   The latter is achieved by essentially routing the right channel of t=
he
> >>   audio source to the mono speaker.
> >>
> >> * Adjust the speaker volume since its default level is too low and,
> >>   therefore, cannot generate any audible sound.
> >>
> >> * Register a dedicated input device for the audio jack and use it to
> >>   report all headphone and headset mic insert events.
> >>
> >> It's worth noting the latter is necessary since the controller complie=
s
> >> with v1.0 of the USB Audio Class spec (UAC1) and, therefore, cannot
> >> advertise any jack detection capability.
> >>
> >> However, this feature can be implemented in the generic USB audio driv=
er
> >> via quirks, i.e. by configuring an input handler to receive hotplug
> >> events from the HID driver.  That's exactly what has been accomplished
> >> via the "ALSA: usb-audio: Support jack detection on Sony DualSense"
> >> patchset [1], which has been already merged and should be available in
> >> v6.17.
> >>
> >> Unrelated to the above, also provide a few driver cleanup patches, e.g=
.
> >> make use of bitfields macros, simplify locking, fix coding style.
> >>
> >> [1] https://lore.kernel.org/all/20250526-dualsense-alsa-jack-v1-0-1a82=
1463b632@collabora.com/
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >> Changes in v2:
> >> - Updated cover letter including a reference to the usb-audio patch se=
ries
> >> - Updated 'HID: playstation: Make use of bitfield macros' patch to dro=
p
> >>   DS_STATUS_CHARGING_SHIFT and use FIELD_GET() for battery status ops
> >> - Replaced 'HID: playstation: Rename DualSense input report status
> >>   field' with 'HID: playstation: Redefine DualSense input report statu=
s
> >>   field' changing data type to a 3-byte array instead of renaming the
> >>   struct member (Roderick)
> >> - Updated 'HID: playstation: Support DualSense audio jack hotplug
> >>   detection' according to Roderick's feedback:
> >>  * Used DS_STATUS1_ prefixes for the plugged status register and renam=
e
> >>    its bits to match the datasheet
> >>  * Defined MIC_VOLUME_ENABLE bit of DS_OUTPUT_VALID_FLAG0 register
> >>  * Renamed the newly introduced audio controls members in struct
> >>    dualsense_output_report_common: headphone_volume, speaker_volume,
> >>    mic_volume, audio_control, audio_control2
> >> - Restricted audio jack hotplug detection and event reporting to USB
> >>   operation mode only, since Bluetooth audio is currently not supporte=
d
> >>   and it might have a negative impact on the battery life (Roderick)
> >> - Rebased series onto next-20250624
> >> - Link to v1: https://lore.kernel.org/r/20250526-dualsense-hid-jack-v1=
-0-a65fee4a60cc@collabora.com
> >
> > Just for the record -- I like the v2, and am inclined to merge it, but
> > would prefer doing that with Roderick's Ack, so I am waiting for a bit
> > here.
>
> Could you please confirm you are fine with the latest changes so that Jir=
i
> is able to merge the series?
>
> If you cannot find the time to look into every detail right now, we can
> still take care of any non-essential matters afterwards.
>
> Thanks,
> Cristian

