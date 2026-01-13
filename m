Return-Path: <linux-input+bounces-17060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1711D1ACB8
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 19:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F86E3010FD7
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 18:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9AE321456;
	Tue, 13 Jan 2026 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMwIPoNS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D686299923
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 18:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768327708; cv=none; b=nKgdq/dLPqKlq4BdFX1P4JKiICyLj4RVOTRcyXRGv95oXlV9a/2e7g7Nop8SOqDokV8Q6AeojtbScQCc8u4QrMVrfCsOUBQnLeS9gulmW3SiSXVhIg2I24/affMouEJiMFXdTAnQd6BPPEtTOUFyUKv9OXKsbH+Sq+dC+O4I5Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768327708; c=relaxed/simple;
	bh=PUqYLS2/zsFmqWi8AICg6hld+demEOhcQC0ifWXJP3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqAw4Fpmr1SInBGsNF2Ja6VjVVgGyf2NTgcwVZq0zSDQBhBkLE78N8boumfGj4xOSpYPBZggdhgLJ4zL2TQ8ip/Ntl3xa0dbn1PZjfiwXoGVrd5d5xFxbjhmh33R7IWDdC5F0ASQ4G1Ypy8CIC9cg3osPvMjysFV9olibh5L9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMwIPoNS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81db1530173so2113306b3a.1
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 10:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768327707; x=1768932507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUqYLS2/zsFmqWi8AICg6hld+demEOhcQC0ifWXJP3Q=;
        b=bMwIPoNSEUvqCOaR/qoBaK5IWwzf3uov+6Kc0tslT6dju/8J/1fFD5JHSSIIU7e3+5
         W9aQXMhgUg485xCTF02kqTEOb2Zx35Nc4nJIGFOXQ05LEqOQoOLhc136hG/BzmO66k+Q
         IPSj4heksup/xMJ77Mgner0ppb40UpbQXDnHmCIMLNUK+NohUelC10jF7Bx0n5Psj6yn
         mUkZhRaovSq4VFFITx1pX7wUnzmgI/PXlMzTbTSbY808f2/eFL9mM6ZWh+RArNbO7w9M
         bRBXEj8UIiADPQ33okzRXgqv4v9qI97E3PFVY9pxPqNWL5n8r+ixcc83NkSJqlQKEW0H
         XRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327707; x=1768932507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUqYLS2/zsFmqWi8AICg6hld+demEOhcQC0ifWXJP3Q=;
        b=ffRn8MvHD71rI5mz5FNIAmvL1I0dsaamBSdomuzeBDPpIyNDPH5p2MukOa5EpLTD/R
         vuGne7x/IJEnJH367JJf2PeLGIv0Uj4GU6tFqvJ6UbhoHiTsRmpAFXQcAcd4xDFXFpFa
         3h31z0BZ/g+FUQorxxhNTTdeJw+fk5yZoW5DEy4ruQagCkKEHLYw5yz6I0is8u7DUsaq
         efxbk9WzaMjPcHO1YQz5oOkUTykMewY+EEElyr/nH/RLgwibdR8kqBXvYrE82UFqACXr
         q8eAz3vwqqW/gBS6IrMJraPJgAqdru3sATnkRQxwOI0T25gMLb7Q5x9hnu4jvSZPK5B9
         n6HA==
X-Forwarded-Encrypted: i=1; AJvYcCXBOiCVOhFoZ4XdVT91EE0t7pfm6SZ6EhGt4hQ+kBw2tW72m/ixWF/8V6ThIbRrIJWagTe4V6EJXgK4ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLOTqtctYbPtI8Y2UgwxQOuxVywXz0/d7CdbSw9ClrDN4DCog8
	vYClzLlpt1KlY3JKIhb4S8d2Xj57a6KL6XvmtUjOVk0PmgHkwgb6HFNW+xzB7KP0
X-Gm-Gg: AY/fxX6B5g/KfVWr/J52g8u7xEwBQXqpxB6h97l2Ekv+//RXC1D2SfFTlvUWxb3CpTt
	mMd0snPzRJ7DBurptoZtkGMIueXrlD5vNiVu00YIpMqq7Vkq7Xe1deBjZJJofMecOQAFEd86jUS
	iMljFPLgx70VHsw5vSEIm1kYhvKdnb+zZeeP5amjYnSRtOfVKcz8z7c4/+ubtmevqqlyrzPVytu
	f+gH9jAkFGMZ7NnPCBoEiOiYb6i9fjWpy7/kcQu3BUwHnCu6cWc4zIdYgAgugWapl/ffIHFVrwl
	BbNC9CDvL39ua/NSpRXqyZ+0ye9CM06K/MDA1xmjuNZ6LvpMVzneRYI7gPzpwJBm0X4hp1xrEL5
	n6h485WrxW0GDi9JYun9DPLy4K+Wl0LrjQj8Mj6dFU6CP+CNEmGN/ab/rkn/9ZnR9jRyVaNrd8h
	irE+h4wmhFLA/Nj6WZReeejNoHxXpYco6kLv92MfUtgHSvWdqGzLscaqb4JEVBRe+T6dS6+p5IH
	4S4wRk5+pd4g15DMc6arp0HbmK/qBMfFONgF1phAz+mFAUhxIEA5NJeOvNv
X-Google-Smtp-Source: AGHT+IFDuQEqucfQxrsHVEv6S4l1hCuxXs3LplvzbnHhqb3pRr5cN/0XyqM1u4dZwntWKzjYt5BtfQ==
X-Received: by 2002:a05:6a00:a90d:b0:81f:1a4b:bf50 with SMTP id d2e1a72fcca58-81f1a4bc032mr9314346b3a.36.1768327706472;
        Tue, 13 Jan 2026 10:08:26 -0800 (PST)
Received: from anonymous ([113.252.77.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6772688asm12458869b3a.45.2026.01.13.10.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 10:08:26 -0800 (PST)
Date: Wed, 14 Jan 2026 02:08:22 +0800
From: kenkinming2002@gmail.com
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: override HID descriptors for some Haptick
 5288 touchpads
Message-ID: <aWaD_4oNWzSQIrZ3@anonymous>
References: <20251225190822.150872-1-kenkinming2002@gmail.com>
 <3sbccjhicn22ubkbgz23njhsektkrva3b2udaavg2onxmo5uah@2vt472vdjehm>
 <aV6d5mt2veL-vEvf@anonymous>
 <aWZEST09jJlVZOzq@anonymous>
 <ngcltngjjl5dc4nt5i3ui5pjvemt26kp4iqpbcpbllvwwbonfd@yspyfi423i3w>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ngcltngjjl5dc4nt5i3ui5pjvemt26kp4iqpbcpbllvwwbonfd@yspyfi423i3w>

On Tue, Jan 13, 2026 at 04:00:35PM +0100, Benjamin Tissoires wrote:
> On second thoughts, maybe we can have the HID descriptor dmi quirk in
> the kernel only. This way, the device should be presented to HID-BPF and
> the HID stack, and if there is something wrong in the descriptor, this
> shouldn't fail dramatically.

Unfortunately, this fail even more badly. The logs are consistent and
short enough that I will include one of them verbatim here but they are
also available on same github repository under logs
https://github.com/kenkinming2002/samsung-i2c-hid-bug-repro.

> [ 1976.296726] i2c_hid:i2c_hid_core_probe: i2c-hid-core.c: HID probe called for i2c 0x2c
> [ 1976.296960] i2c_hid:i2c_hid_fetch_hid_descriptor: i2c_hid_acpi i2c-SPPT2600:00: Using a HID descriptor override
> [ 1976.296965] i2c_hid:i2c_hid_fetch_hid_descriptor: i2c_hid_acpi i2c-SPPT2600:00: HID Descriptor: 1e 00 00 01 e2 01 21 00 24 00 1f 00 25 00 11 00 22 00 23 00 11 09 88 52 06 00 00 00 00 00
> [ 1976.296969] i2c_hid:i2c_hid_init_irq: i2c_hid_acpi i2c-SPPT2600:00: Requesting IRQ: 152
> [ 1976.297217] i2c_hid:i2c_hid_parse: i2c_hid_acpi i2c-SPPT2600:00: entering i2c_hid_parse
> [ 1976.297220] i2c_hid:i2c_hid_start_hwreset: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_start_hwreset
> [ 1976.297222] i2c_hid:i2c_hid_set_power: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_set_power
> [ 1976.297224] i2c_hid:i2c_hid_xfer: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_xfer: cmd=22 00 00 08
> [ 1976.357910] i2c_hid:i2c_hid_xfer: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_xfer: cmd=22 00 00 01
> [ 1976.358600] i2c_hid:i2c_hid_finish_hwreset: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_finish_hwreset: waiting...
> [ 1976.461915] i2c_hid:i2c_hid_finish_hwreset: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_finish_hwreset: finished.
> [ 1976.461925] i2c_hid:i2c_hid_set_power: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_set_power
> [ 1976.461929] i2c_hid:i2c_hid_xfer: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_xfer: cmd=22 00 00 08
> [ 1976.523047] i2c_hid:i2c_hid_parse: i2c_hid_acpi i2c-SPPT2600:00: asking HID report descriptor
> [ 1976.523057] i2c_hid:i2c_hid_xfer: i2c_hid_acpi i2c-SPPT2600:00: i2c_hid_xfer: cmd=21 00
> [ 1976.523723] i2c_hid:i2c_hid_parse: i2c_hid_acpi i2c-SPPT2600:00: Report Descriptor:
> [ 1976.523954] hid-generic 0018:0911:5288.00FC: item fetching failed at offset 0/0
> [ 1976.523970] hid-generic 0018:0911:5288.00FC: probe with driver hid-generic failed with error -22

It seems that the touchpad really does not like us only retrieving the
hid descriptor and not the report descriptor and end up returning an
empty report descriptor. We know that this is the device returning an
empty report descriptor and not me botching up my hid-bpf driver by
looking at the third line from the bottom which comes from the i2c-hid
driver:

> [ 1976.523723] i2c_hid:i2c_hid_parse: i2c_hid_acpi i2c-SPPT2600:00: Report Descriptor:

This would imply that for an user who do not have hid-bpf report
descriptor fix, he would change from having a touchpad that works most
of the time to never which is a horrible regression to have.

Judging by the fact that I seem to be the only person affected that is
on this mailing list and my full disk encryption setup which kinda
triggered this issue might not be the most common, I am okay with
keeping this as a local patch for myself.

On a side note, I have written and compiled a hid-bpf driver but not yet
figure out how to it to load even after installing it with udev-hid-bpf.
There is probably something blatantly obvious I overlooked. That is
besides the point anyway since there is no point in a hid-bpf driver if
the above issue is not fixed. I also do not know how to fill the vid and
pid field for HID_DEVICE from HID_BPF_CONFIG but that seems to me to be
only for some introspection purposes that is not used in runtime.

Thanks.

Yours sincerely,
Ken Kwok

