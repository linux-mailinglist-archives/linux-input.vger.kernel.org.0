Return-Path: <linux-input+bounces-1566-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A34843B89
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 10:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297301C220F9
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 09:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD5769D00;
	Wed, 31 Jan 2024 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKe50600"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BBC69D02
	for <linux-input@vger.kernel.org>; Wed, 31 Jan 2024 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706695077; cv=none; b=t1aSqUvP5j8hE1ieZOLR7dy/p3ibiRPJKVx3Xh5soHdsisNCv8vVSVwlEBzna8YuouUtOFBn32ph7RCx2nw9rzG9o+lFJjenBy8CBOuKXipuyHevHQkmIdFOljizkBuwEpBLfsIgAZLURX5NLmQwJSWJC0uOMlc72pf9+wph/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706695077; c=relaxed/simple;
	bh=uJ8CHYYT4dvem+7W+JJDFp1el7H1cjBMm17tWDT3GiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXtqWk5vgHo3EaN9ufoX/GVtVIwBaNaAv1DXeYJ63t28xREW0o00hjrB7jqKCAycltJO31UVIzzb09JCLf3jDq9fcT9/sRSY7INPDKjBpPdHrW0kw2vVvzyGcKnA2kjaSbGWXjErEDben/jJKMU7YjAyxjPXSgPO5jRE/cXBabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKe50600; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706695075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3JEysCXRHAT92wPhPM7QEv3/4oTwikWcJbcmbdh2Ow=;
	b=NKe50600EBp43Tl46KyuX3YBZ5z4z0j5dWacihKeFN2t21Cut36mmGRHqNzIwJgDqQQtF1
	SePWB9sMr7/ftv94FLvi5W92amABqFBe7O08YLyiRp0t5aEXggcTSY7LVmppJCtNU8TtUG
	wy+N0dlMBmP0sTmqkdmFtQ6xb00Aboo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-syiSERr4MOysyyWDVqtTiw-1; Wed, 31 Jan 2024 04:57:52 -0500
X-MC-Unique: syiSERr4MOysyyWDVqtTiw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a35a649c608so182425966b.2
        for <linux-input@vger.kernel.org>; Wed, 31 Jan 2024 01:57:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706695071; x=1707299871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3JEysCXRHAT92wPhPM7QEv3/4oTwikWcJbcmbdh2Ow=;
        b=OcLJhZOQXCouSF3bBxBL95SOs+AyEa3A5jMLcOG7BtscJtj24ZyDZJW+3Uoppjuxa0
         2eVDeQldliA4bLE0vzzKhh3ZG+unWZdN8u2I19ATy466o7gOUTfS2TVQ5Ha2dPQR0h78
         F7CUWCikZnKNQ5eN2skaNj94u3fjt5P3Zh+hXRyfPj73PnyjRyMTFVqv0HOfKkZcU/iY
         K3K8xaCoOzJIFxcxZ0cKMlYWretgtSh7n9BOA+rR6VUoJUoD6bptBoa7gLWcK2/b4gVu
         YI8U219M6NZG+yhL7ohZRChPjhiJs+M36IyzXki3L7LOgMqEr5XYzOPnHEthMDDvug4v
         PaRg==
X-Gm-Message-State: AOJu0YwO7qnGrm+KCrnEoE4Uq1tPqHDfKC7trGQx6LywlRiEd3LknHRr
	pmRlsiX6WuQIhPpXDbwToG3Yo36XNiZsMQh8x7shk0raL1AGg/YjcsVbbSOSi5OBcV6KuA2wVrL
	zlWkcf5CjO0XH+57NymJZ6f84ACxW98ziL7NhFI4ReFwAb6FMaUHANVQfmuErR6SuqyfLLVX1aQ
	IJN2g73UsbiW1zCeF+yUwHkrfZrt7GajM4i5E=
X-Received: by 2002:a17:906:16c7:b0:a36:7f6b:306 with SMTP id t7-20020a17090616c700b00a367f6b0306mr604715ejd.76.1706695071626;
        Wed, 31 Jan 2024 01:57:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgHP1nwiXMMru0WG+4Kqez/KPIqym6zauOKBmSbCnrUqD+xqVdKmqmtrDk4SkQUtsk72HFb6PSNQdPcTyshlI=
X-Received: by 2002:a17:906:16c7:b0:a36:7f6b:306 with SMTP id
 t7-20020a17090616c700b00a367f6b0306mr604706ejd.76.1706695071312; Wed, 31 Jan
 2024 01:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQPD4S1zyUMUyJbOb8i5a+URsLCrGMKPKD47es8OgCoKKwRQg@mail.gmail.com>
 <CAEQPD4T+C_RaP_z96XRXj1teGiDMZu1MsPn8hAQ5FhSoaajZaA@mail.gmail.com> <CAEQPD4RSFJN5TvU2vwHL=w1TkMzxD+v1=jxyyNzZDMyPane=BQ@mail.gmail.com>
In-Reply-To: <CAEQPD4RSFJN5TvU2vwHL=w1TkMzxD+v1=jxyyNzZDMyPane=BQ@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Wed, 31 Jan 2024 10:57:39 +0100
Message-ID: <CAO-hwJ+OFxRqoL4RYaKMR_PfmpBJuyWUGcDXRrp7jWuYfT=CyQ@mail.gmail.com>
Subject: Re: Suspected bug in hid-microsoft.c
To: Taco Jerkface <tacodog311@gmail.com>, Siarhei Vishniakou <svv@google.com>
Cc: linux-input@vger.kernel.org, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

[Adding Siarhei who added support for those controllers in the kernel]

On Wed, Jan 31, 2024 at 7:27=E2=80=AFAM Taco Jerkface <tacodog311@gmail.com=
> wrote:
>
> Resending without HTML:
>
> Hi,
>
> I hope this is the correct contact for this report, I found you as the
> maintainer in the hid-microsoft.c.
>
> I believe there is a bug in the microsoft bluetooth driver for the
> Xbox Elite Series 2 controller.  I have been experiencing issues with
> it that I initially thought were SDL related.  However the SDL team
> seems to think this is driver related. My SDL bug report information
> is here:
>
> https://github.com/libsdl-org/SDL/issues/8907

Hard to say anything with that bug report because we don't know what
those tools are supposed to do, and how they access the device (hidraw
or evdev).

Note that the bluetooth version is using uhid because it's a BLE controller=
.
Basically when there is a BLE controller, bluez handles the transport
layer from userspace, and injects the events through uhid so that it's
handled as a normal kernel device.

So there is no "uhid userspace driver", bluez just blindly forwards
the events/reports/commands as it is told.

>
> Basically, SDL reads the controller correctly when connected by USB,
> and if I run "controllermap" with root permission, but with user
> permissions it misreads

Using root or not shouldn't change the way your program sees the
device: if you are capable of opening it, then you should get the same
output.

However, the immediate explanation that would come to my mind is that
you are not using the "same" controller in both cases:
- maybe that when you use it with root you are talking to the device
through hidraw
- maybe when you are not root you are talking to the device through evdev

Again, not knowing the tools doesn't help me here :(

>  the number of buttons as 122, the first paddle
> button on the back seems to act like the "screenshot" button from the
> 1914 controller, and the other paddle buttons are not read.  All
> buttons read fine with evites, but the paddle buttons "KEY_UNKNOWN"
>
> type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 0
>
> Please let me know if there is a better contact for this, or if there
> is anything I can do to help identify the problem.
>

Ideally I'd like Siarhei to answer here. But in the meantime, we could
fetch some logs from the device itself which would allow me to better
understand the issue:
please use hid-recorder from hid-tools[1] to get the logs, and attach
the whole output, with a recording of the events that are problematic:
$> pip3 install hid-tools
$> sudo hid-recorder

Please dump 2 hid-recorder outputs, one with USB, and one with
Bluetooth, with the same event sequence if possible so we can compare
between the 2.

Cheers,
Benjamin

[1] https://gitlab.freedesktop.org/libevdev/hid-tools


