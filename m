Return-Path: <linux-input+bounces-16388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F3747C91164
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 09:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 232C634F260
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 08:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27AC2DE71B;
	Fri, 28 Nov 2025 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S7YiAuMP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MkD5TXou"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B892D5C83
	for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764317151; cv=none; b=rFRiNV3dlsnu3T0+yRWur1zTWJW5ReUImTNOoCth8wc93kt6uGDtY7VAuZ/xCHFiBP1LJQV6f3guMYezuISOXQXjeyE4eFyHWud6qJurNBXuJDvYDJvmATY0/s8JPAy7gNawueTn7o7cCHkTi19Kr/KrwNfpqZfb0XoTxt9mvMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764317151; c=relaxed/simple;
	bh=FPIIUOyTg8pGSe3VMid6kL7fnIsGm87S00jz238lCJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOTQqr5PSU6eSlwdup8IkGh/vhjbOZC9viLkF23c41OQI5txSQmoY7M74F52AbFYNlZ8e+2Zp8z4oOf8AgjPnCrvPGcyO+UkZBQBpMfxaDRSrayXDVDWaeKJi276gptj467HB6iZN2Z/rI1fxaY3xCxHNvSzXYDadSSYFg+DCjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S7YiAuMP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MkD5TXou; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764317148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3QLe2XaO0RWFOq1Znr3L5adsNAtxbfgecqm9jeMni8=;
	b=S7YiAuMPMZ3mWeZHXHw99dh4JpsNdOp8v5mmvvCuDreR4ceaLjRcAnDh009LdgmUdxNfRY
	AxTnba+j/1oZk4pieSNxpeloajPAJCTxQD9UQg2DCc2SUSpXFuf6UkT45SH34QUqIvJoDr
	TP+8qkg5vfowhsdlqYMzHK4OplQNPUs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-KtnkCGrxOkO3Opboyx5vrg-1; Fri, 28 Nov 2025 03:05:46 -0500
X-MC-Unique: KtnkCGrxOkO3Opboyx5vrg-1
X-Mimecast-MFC-AGG-ID: KtnkCGrxOkO3Opboyx5vrg_1764317146
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b72a95dc686so127751366b.3
        for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 00:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764317146; x=1764921946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3QLe2XaO0RWFOq1Znr3L5adsNAtxbfgecqm9jeMni8=;
        b=MkD5TXou2xqwn154AzTh64ECioMDP8zCyNwEnbPdZ/jtHegEJHA3D6rtf23jW19gHU
         m4EJ8b+AbPSMikrQSylovwCoAFTxW0zuZSaXj8v6lamDPwrmXr7G5+dcoKezksA4saoL
         iywQ0XtDiptb03qT9nqF99dvFJ5wZsBlfdvngaqay1gYC9CBw48YH7fdRxYfmv3KVqCe
         utdlt2ZkTAgGzgqfOnedsgTDfYXW9lt2BmuhPdelIqgnB8ip7y/ZJjCTlvpI8vGqo+Mi
         VXpDoHwYlaM3Vzek4uyptEW55kp7OON1PWdhO0tQkvt3g6AIDWcpJEdt/vkspnfUSmU6
         kqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764317146; x=1764921946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p3QLe2XaO0RWFOq1Znr3L5adsNAtxbfgecqm9jeMni8=;
        b=pM/HVCEY0kydT0FkNkyBXOkEfvcVtwQ52hzKcvnyqoAKmqlQKLBIGCoi2Cb5XtOufs
         AzAZG0ta1ZhHKjncMHhepbVWWegmYQVvO6WiZFF0CjoTJdsKULGCOA9niIyHcf473o8K
         VqdKzaWvbBJfdIvZGNpleWwIQErgNHHgyUhfb+fGxfnIIc72oBD19WN3fbiYjAOkgWnA
         vCT64tn2SnQl4uWHxh5dQB34DO/5mAP5UnqEQm2gQgBBxLBbGdoEHi2yRyVrtZMTskO8
         jbPHKqzBxfNx6p93jsUAgocPLkLJjN5hrMfI2mYiLEtQDfiyAfi8XZOsqnjGVvnXDPDI
         W/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYwlpiU6OpH9+xAB71deZEM5isgJ2NhxJ43+Qb+kNKbXqrow9qfLZhKIkGFAXjLCVSU85J7ZqEvgcr5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDQ36qEwU9eVXa+HgOyunvybKUUdYphmjnJpZ9j20sbPJ285w
	2lAU6VBikpmIxnTcORhAyiHG/lvdL5ABGBZM9fRuyJzericMzeTIMTMcCJEjDmPlcZCNsniA7aF
	Jq90HkRXOFmu38jepwF1sIP34mzq+/q3caQZJpgmIJf5g7VgT0F3PZWcXQIV0FB37Jn5D1iwWNI
	oP28UYXtOs6HGBTQ/1C3FmhxiW/vwYdoV4FLAdhI0=
X-Gm-Gg: ASbGncv13qz32VQpFCYpjpN7ox9rm9ODATvwi9WoCzeMwIS6Jb52gKGGMiAXOmeUl/B
	0ODezzlASgZJu3qow+SD54KUUST6qGKc7WAI/QGy8oGZIuEB9/YkPigZDbRITT7K8Q6jXk6qWkw
	b58KrOY0JVFfnZog5t1tZKaWoIipYIsLiI+IF6PZNMP3y3ucA5OR3q2HgfP9NyVRvTAMkhKBw0m
	TIp
X-Received: by 2002:a17:907:970d:b0:b73:8cea:62b3 with SMTP id a640c23a62f3a-b76c555d4e4mr1585063666b.41.1764317145508;
        Fri, 28 Nov 2025 00:05:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKK0ygpmbqqehPl2TIRSD7djKwvPkm+PmaYUeeZWjX873/DUZ190EeXFzXWzQKSZKNDymJ9vPo1YTZbY7aFJ0=
X-Received: by 2002:a17:907:970d:b0:b73:8cea:62b3 with SMTP id
 a640c23a62f3a-b76c555d4e4mr1585059566b.41.1764317145083; Fri, 28 Nov 2025
 00:05:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMBhvbYA=onQkkcgkODaTj=+tkybwo28Cdi6P3vodGpVZi8OVA@mail.gmail.com>
In-Reply-To: <CAMBhvbYA=onQkkcgkODaTj=+tkybwo28Cdi6P3vodGpVZi8OVA@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 28 Nov 2025 09:05:33 +0100
X-Gm-Features: AWmQ_bkLgWKix4gnWAJoUAVbND5jxAoYl0f5o50yL4aev8Kz282JnEE0s8Yv9uc
Message-ID: <CAO-hwJJRisVpZWeSA+3_fLaa8_52f7ypUocDcD+PojuF3KjHYw@mail.gmail.com>
Subject: Re: Regression: SYNA3602 I2C touchpad broken in Linux 6.17.7 (works
 in 6.17.6 and previous versions)
To: Vijay <vijayg0127@gmail.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 28, 2025 at 7:40=E2=80=AFAM Vijay <vijayg0127@gmail.com> wrote:
>
> Hello,
>
> I would like to report a regression in the Linux kernel affecting I2C-HID
> touchpads that run through the Intel ISH + DesignWare I2C controller.
>
> Hardware:
> - Laptop: Infinix Y4 Max
> - CPU: Intel (13th gen core i5)
> - Touchpad: SYNA3602:00 093A:35ED (I2C HID)
> - Bus path: SYNA3602 =E2=86=92 i2c_designware =E2=86=92 Intel ISH =E2=86=
=92 HID
> - OS: Linux (Arch/CachyOS)
> - Kernel config: Default distro config
>
> Regression summary:
> - Touchpad works perfectly in Linux 6.17.6 and below versions
> - Touchpad stops working in Linux 6.17.7 and all newer versions (6.17.8, =
6.17.9, etc.)
> - Desktop environment does not matter (Hyprland/GNOME both fail)
> - The failure happens before userspace loads
> - Touchpad also works fine in Linux 6.12 LTS
>
> This is a kernel-level regression introduced between:
>     Good: Linux 6.17.6
>     Bad:  Linux 6.17.7
>
> **Dmesg logs from broken kernel (6.17.7 and newer):**
>
>     i2c-SYNA3602:00: can't add hid device: -110
>     hid_sensor_hub: reading report descriptor failed
>     intel-hid INTC1078:00: failed to enable HID power button

Looks like i2c-hid can't even communicate with any I2C device, so this
is slightly worrying.

>
> And the DesignWare I2C controller logs around the failure:
>     i2c_designware 0000:00:15.0: controller timed out
>     i2c_designware 0000:00:15.0: lost arbitration
>     i2c_designware 0000:00:15.0: transfer aborted (status =3D -110)
>
> These errors appear only on 6.17.7+ and not on 6.17.6.
>
> On working versions (6.17.6 and 6.12 LTS), the touchpad initializes norma=
lly:
>
>     input: SYNA3602:00 093A:35ED Touchpad as /devices/.../input/inputX
>     hid-multitouch: I2C HID v1.00 device initialized
>     i2c_designware 0000:00:15.0: controller operating normally
>
> This narrow regression window should make it possible to identify the off=
ending
> change in either:
> - HID core
> - I2C-HID
> - Intel ISH HID
> - DesignWare I2C controller
> - ACPI timing changes
>
> I can provide:
> - Full dmesg (working and broken)
> - acpidump

Are you running on a full vanilla kernel?

The changelog between 6.17.6 and 6.17.7 is rather small, so it should
be easy enough to bisect and get the offending commit.

I have my suspicions on:
f1971d5ba2ef ("genirq/manage: Add buslock back in to enable_irq()")
b990b4c6ea6b ("genirq/manage: Add buslock back in to __disable_irq_nosync()=
")
3c97437239df ("genirq/chip: Add buslock back in to irq_set_handler()")

Because anything else is unrelated to any component involved in i2c-hid.
(But that's also assuming you are running vanilla kernels without any
extra patches.)

OTOH, I've booted a 6.17.8 and 6.17.7 shipped by Fedora and I don't
see any issues related to i2c-hid, so those 3 commits might not be the
culprits.


>
> Please let me know what additional data is needed.

Can you do a bisect between v6.17.7 and v6.17.6?

Cheers,
Benjamin

>
> Thank you,
> Vijay.


