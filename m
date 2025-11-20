Return-Path: <linux-input+bounces-16226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FE5C71844
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 01:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 284C14E0EC2
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 00:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8930310957;
	Thu, 20 Nov 2025 00:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKpUjEPS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914BE555
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763597642; cv=none; b=Ib7WzVcfsc/sC0UwuusjbsAYnlF0icVIHWIO0MkAJvJT2YitAaV3phsVzvkJjA5eVwPqu9xMg/fT1Xk7jhOHvJh80QigzJD4JDth6/AfWOqX2HMeYB2dSD96Bs5u48zmQWGq58gZVthKXhBS00HLgSBNuh9NcKD9NDdxSsGlrvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763597642; c=relaxed/simple;
	bh=9DugvHPi0McrMQ5K/52KmimENvD+AKOpeEuhyosMwLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LyzxieG+S24+aK4LGdBCWklIClmQbPKh0E/tFnqHLl4CBmAJM5K3oUu+Hpyd1BGEabSBdzDoZFaM0tjNcFHfVpOM1BCpzk4nMmUJlGyvEpHOr/Tv8ZaAxMnxK6Ql1cak1akbM3oKq440QMyrJYnPCFUObedbmPL7zaofnqsTPKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKpUjEPS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so379876a12.2
        for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 16:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763597638; x=1764202438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssXVbc3nG/vIeUyc2Lf6nq928EPu7VwgXwut3m6I2iE=;
        b=hKpUjEPSt+E/EggDLrVfHwADRFFKQ9kRaAgTUu57V0Y7lPijszQJeGMYH7zja8DfAI
         j1v+nfpnkTf7ZlCSGQWVnKAtVi8U9u6pp4NaVDJtLcZpkUqfoZjiDbjA2QTg2GjOhNcJ
         PYjaaYrX2LVV9fThK0Mv3/vVbW5aXsip69eRa1tLA+v7ovv3vzpJ5iMBehQ8ngROiGqg
         5mc1RUII2FNiPQPrx8DBuQZ29WcMs7+0WEIzcKnEmp89eHHqbopV3mAIRKJqVOBD9SV8
         gvWvRf59/aTKC/osWj0A2+koE6PVO7yW928EFq0BnKyTu/7boMub8j2h6uX+1/Ijxekr
         3Pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763597638; x=1764202438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ssXVbc3nG/vIeUyc2Lf6nq928EPu7VwgXwut3m6I2iE=;
        b=MdwzLY0FrWau6s4KdvimF0IHpQuFMQgFpSe0Okeph8bg6VeJ6rNj5xBYRqPQe8f8z6
         SxGbcfIcyzOFuN/Pd+0sdBSv8Kgdv2lm2U9Dk+sEr/gqd+zRpfXDatleP5SlLD1uT7CU
         xrUPm89ZJMBZLnayPTToTasuRLm97iY17ut40kx0Gi8dbRPWPuwvvTBxyIhq9W5Ltq6w
         MAFJ1186jc9OamiFoq6Ckak27TI0X7CiU9R8nUm4ttf7JyKULV74k4KmR2/kclqxEivN
         wQ8MaN4AdkRMLmZwQT3/VEUJFXlQaAHxwxH+aizATIiMP/xMdelhmw/NbixxeqoESBsS
         f+3Q==
X-Gm-Message-State: AOJu0YySNTT5gJcCFDouTAM373RngQBNPM3skytdmZXZP7vBt1HcHc4m
	v5OBJBV6YnEm4MTQmpSelgs6b4ujggdS2qaf1JReKru4dtzw7tk6i/0CSQSHoFmPlDsdWpvHY+F
	XVde+hf6qtsmCy34aJOWPU+Q189xDs5BC0w==
X-Gm-Gg: ASbGncvWZMFOdTEHycp1wotVSDHRX79nmPQyZloQuMmoydYtzWlixgIsJrDBBBqt2wF
	ChT7su/yZ3ABSV2XmjSMIMnFNk5P0bJn7iPdJ5df0JuFl4B98GZ158zxY42Ne2anD5zxCQyCIMb
	iIgcZ/fSV45dP3TTcXFd1prRwfh9wASHw3VmMm2QQjhmgiNR3D4LqqY0brU1tI4h+RZfAzuaGCl
	+Be6VBBvKR02kKtHpP0C6TRbVcDaephB2HgO51RMTxQgPx4JOJdMwgFjUdRKs5FudrN+RVO6GeR
	CjGvvytnqulxe7mespfjTExUI0Y9vejCQ23kH7o=
X-Google-Smtp-Source: AGHT+IFmwtLuk7/qQt1VJzXS/lY0aani85vr061EVQPG2WbfWp14fjtOe5MeaJbeOfBb95fy9JgcaoKiO/cJ8mK5RKE=
X-Received: by 2002:a17:907:9812:b0:b73:5b9a:47c7 with SMTP id
 a640c23a62f3a-b7654f3e545mr105644766b.51.1763597637531; Wed, 19 Nov 2025
 16:13:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027203742.23740-1-ping.cheng@wacom.com>
In-Reply-To: <20251027203742.23740-1-ping.cheng@wacom.com>
From: Ping Cheng <pinglinux@gmail.com>
Date: Wed, 19 Nov 2025 16:13:44 -0800
X-Gm-Features: AWmQ_blhlI7Lt5S2h-qtk320x_KhRD5smbWMXzngbr6AVfiFLse9bUJPhVbMjE8
Message-ID: <CAF8JNh+H=Duf-DnbU5tonMLx2yeSrOQUSMFs8VA9SrzN13Bu_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
To: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Cc: benjamin.tissoires@redhat.com, jikos@kernel.org, Dmitry.Torokhov@gmail.com, 
	stable@kernel.org, Ping Cheng <ping.cheng@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin and Jiri,

Can one of you review and merge the patchset?

This patch was from me. The second patch for selftest followed
Benjamin's suggestion

Cheers,
Ping.

On Mon, Oct 27, 2025 at 1:38=E2=80=AFPM Ping Cheng <pinglinux@gmail.com> wr=
ote:
>
> HID_GD_Z is mapped to ABS_Z for stylus and pen in hid-input.c. But HID_GD=
_Z
> should be used to report ABS_DISTANCE for stylus and pen as described at:
> Documentation/input/event-codes.rst#n226
>
> * ABS_DISTANCE:
>
>   - Used to describe the distance of a tool from an interaction surface. =
This
>     event should only be emitted while the tool is hovering, meaning in c=
lose
>     proximity of the device and while the value of the BTN_TOUCH code is =
0. If
>     the input device may be used freely in three dimensions, consider ABS=
_Z
>     instead.
>   - BTN_TOOL_<name> should be set to 1 when the tool comes into detectabl=
e
>     proximity and set to 0 when the tool leaves detectable proximity.
>     BTN_TOOL_<name> signals the type of tool that is currently detected b=
y the
>     hardware and is otherwise independent of ABS_DISTANCE and/or BTN_TOUC=
H.
>
> This patch makes the correct mapping. The ABS_DISTANCE is currently not m=
apped
> by any HID usage in hid-generic driver.
>
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> Cc: stable@kernel.org
> ---
> v2: updated pen/stylus checks
> ---
>  drivers/hid/hid-input.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index f45f856a127f..141359de5ce5 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -860,7 +860,7 @@ static void hidinput_configure_usage(struct hid_input=
 *hidinput, struct hid_fiel
>
>                 switch (usage->hid) {
>                 /* These usage IDs map directly to the usage codes. */
> -               case HID_GD_X: case HID_GD_Y: case HID_GD_Z:
> +               case HID_GD_X: case HID_GD_Y:
>                 case HID_GD_RX: case HID_GD_RY: case HID_GD_RZ:
>                         if (field->flags & HID_MAIN_ITEM_RELATIVE)
>                                 map_rel(usage->hid & 0xf);
> @@ -868,6 +868,22 @@ static void hidinput_configure_usage(struct hid_inpu=
t *hidinput, struct hid_fiel
>                                 map_abs_clear(usage->hid & 0xf);
>                         break;
>
> +               case HID_GD_Z:
> +                       /* HID_GD_Z is mapped to ABS_DISTANCE for stylus/=
pen */
> +                       if (field->flags & HID_MAIN_ITEM_RELATIVE) {
> +                               map_rel(usage->hid & 0xf);
> +                       } else {
> +                               if (field->application =3D=3D HID_DG_PEN =
||
> +                                   field->physical =3D=3D HID_DG_PEN ||
> +                                   field->logical =3D=3D HID_DG_STYLUS |=
|
> +                                   field->physical =3D=3D HID_DG_STYLUS =
||
> +                                   field->application =3D=3D HID_DG_DIGI=
TIZER)
> +                                       map_abs_clear(ABS_DISTANCE);
> +                               else
> +                                       map_abs_clear(usage->hid & 0xf);
> +                       }
> +                       break;
> +
>                 case HID_GD_WHEEL:
>                         if (field->flags & HID_MAIN_ITEM_RELATIVE) {
>                                 set_bit(REL_WHEEL, input->relbit);
> --
> 2.51.0
>

