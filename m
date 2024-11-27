Return-Path: <linux-input+bounces-8293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8679DAE33
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 21:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58E0DB21148
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 20:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75EB14B07E;
	Wed, 27 Nov 2024 20:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Prbgf/7n"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A156202F87;
	Wed, 27 Nov 2024 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732737604; cv=none; b=JsfB/jb4zsm3clZi/HpvEj8dH2n4ao8ndbNgJ8sDyFr2I/5aetXCHUQyWDaODWodYHcoLMQ0UMTGHD4PIsI4aaoUOmj4zQENLsrhHgoJ1TiqiiyhqDz6AOHERgjX8qtO+sxp4qdu2E20XKDPSMwmUIQoFY/ZU/2pt95SB1Z7B6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732737604; c=relaxed/simple;
	bh=hmIxX4nmKJ/KpxkWr4aXnfd/U3L3DijeyqEGV56Cmsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NazC689IjNtIyhn81NQEMXFadPHA4DpMDgWV7kxJAH+4ihDVlpZ9Eh6npQwDZg/m7jEQV9owfEF3gagDdT9XN9pm0g2UDtyrVILTBODQQFyA80GanRn9GmWo1tCu7hDc/S6jy94gr489w9UKqSPsH+p8xqQV+p/gQ/6RiApe7yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Prbgf/7n; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21269c8df64so673065ad.2;
        Wed, 27 Nov 2024 12:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737602; x=1733342402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JnlDLsmM5qv+EK/8poCXPvkvDh4sjlL4kNug7GuHXU=;
        b=Prbgf/7np5aLFEU8O90Xi4/XrHaV2llgv0QQF90ELA2Z4GJxxMvhvq+tOADtxcfEcP
         wgNOl4IZ99xi/I2jlH7d+GQDuu4VkdWMsGUdOVlqaaoSvvNZYoCtRkYx9pV7abmFenSs
         TMoD42NYgr6fpmyzeC9N793OArEcg35lfKPtw97Tzj1SWuortTiD0LZJiE+/WIh7Knh+
         HZkm/N/o7sMVDkzH67iLjY7PpqwxEofxG0HRXFCCS92WEZeM2bz+2UFdZEqKCHRl73K6
         yAfReqRKFLINAUWoH2eFGrg1CxnNKTdivoP85dX21ycTueFxTlLdyed8wdJ6FBuM2Q96
         4VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737602; x=1733342402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JnlDLsmM5qv+EK/8poCXPvkvDh4sjlL4kNug7GuHXU=;
        b=smjFNHpgte1OEZOrxS5ZxJdDzRBUG9QZDgx1miTaM9Kv34/T0uKYx6NfhzyQ427Fbw
         FLlLLX4hmFYypl4eUjJuoyHrD65U437U4nWfn5YnYb+jXO3CaEEBMfh1GrNcMhqH8t2i
         Wn+MphcnovsRP0TkDlTgABwcRpmGQXYh9BiVM8xTSvqp70UhaDyJeewIXMw8A8eFTx3v
         0E4eHpKJ/lIEzC82H1FEmv998UmPgo38YwrcgjnZ6UpUljZUCs3dB3NTok4Pc8e/eDGI
         4d9r8LY1GRQun75QxkHXZh+B32XxgxgSmWN4y8rOuroQOuUoe0qZ8Ml205SbLubvd4ZM
         Hv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQpwksiYR/wAA777SFXAD6QBxkN/FwP5KPI0DbN7OxRsCDNwxqbeV0FwIvfdYeH3KHBY3z0xwCanDH@vger.kernel.org, AJvYcCWSWjU19+l5iaPNhxxm3xNp3crzwpsC93y0WHwxlbWzkSbpV99Ea5/PK+xt1ZW3oD3gXdVi3Kzvqs9on6g=@vger.kernel.org, AJvYcCXpRNICt7IiBr2ZIessPCGxWbacKVjGPhIDJiGLc4sgJ+qSs6jy1s+CLWUqrKrKFGQVK0I9iUFlzKjOLqZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YwoIYqgBUBOupdNQx9R5JB+p3JhYRHYf9rnaPryB1Y3pDMKWDoz
	zUdI5tzJ16uxbwKY8hmL2Zx+VnvRZys0CoBtBvrnPRDeC+9Db0A5
X-Gm-Gg: ASbGncsmr+z8SJgB3b5futEFV4x9bnQJVgjyTdAsuMIECGZwOHPM915FG4GekmJsloy
	RgGyeRnUpdqr7Vh9N/y1/4BVdMZvXH40gPd56rPzuo1bwuf/gFnrSMESRs+NEfN0rLofOSK/8f2
	fpw2Keh0/+o5aw+VDkLiNopQuhWoELgOK8oUVjeDnPVr21F0Z5VLwWuOPGbXUSoDQZFKAwoPH73
	AWl4b6ICRzvDktte7TQyYXhVOyFLoE2pEFWYNr+b3IlSljO49c=
X-Google-Smtp-Source: AGHT+IEGL7M9GjZwTDz8gnOB4Fc/ReaRn8//tUsUDCeh7CYPkfHbRbhoJ/aTMpOuF0TfqhinENoEIA==
X-Received: by 2002:a17:902:e752:b0:212:4739:27b2 with SMTP id d9443c01a7336-215010861afmr48871945ad.5.1732737602170;
        Wed, 27 Nov 2024 12:00:02 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc23a35sm107317255ad.250.2024.11.27.12.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 12:00:01 -0800 (PST)
Date: Wed, 27 Nov 2024 11:59:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z0d6Psrk5f8-hXe6@google.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <Z0aCSBNEAJlgNIAI@google.com>
 <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>

On Wed, Nov 27, 2024 at 09:24:16AM +0100, Sasha Finkelstein wrote:
> On Wed, 27 Nov 2024 at 03:22, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > +     u16 checksum;
> >
> > Does this need endianness annotation? It is being sent to the device...
> 
> Both host and device are always little endian, and this whole thing is
> using a bespoke Apple protocol, so is unlikely to ever be seen on a BE
> machine. But i am not opposed to adding endianness handling.

In this case the endianness handling will be "free", but will still show
good code hygiene.

> 
> > > +             slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
> > > +                          fingers[i].state == APPLE_Z2_TOUCH_MOVED;
> > > +             input_mt_slot(z2->input_dev, slot);
> > > +             input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
> > > +             if (!slot_valid)
> > > +                     continue;
> >
> > Shorter form:
> >
> >                 if (!input_mt_report_slot_state(...))
> >                         continue;
> 
> Sorry, but i fail to see how that is shorter, i am setting the slot state to
> slot_valid, which is being computed above, so, why not just reuse
> that instead of fetching it from input's slot state?

You are not fetching anything, input_mt_report_slot_state() simply
returns "true" for active slots. You are saving a line. You can also do

		if (!input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER,
					fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
					fingers[i].state == APPLE_Z2_TOUCH_MOVED))
			continue;

> 
> > > +     ack_xfer.tx_buf = int_ack;
> > > +     ack_xfer.rx_buf = ack_rsp;
> >
> > I think these buffers need to be DMA-safe.
> 
> Do they? Our spi controller is not capable of doing DMA (yet?)
> and instead copies everything into a fifo. But even if it was capable,
> wouldn't that be the controller driver's responsibility to dma-map them?

Yes, they do. From include/linux/spi/spi.h:

/**
 * struct spi_transfer - a read/write buffer pair
 * @tx_buf: data to be written (DMA-safe memory), or NULL
 * @rx_buf: data to be read (DMA-safe memory), or NULL

> 
> > > +             if (fw->size - fw_idx < 8) {
> > > +                     dev_err(&z2->spidev->dev, "firmware malformed");
> >
> > Maybe check this before uploading half of it?
> 
> That would be an extra pass though the firmware file, and the device
> is okay with getting reset after a partial firmware upload, there is no
> onboard storage that can be corrupted, and we fully reset it on each
> boot (or even more often) anyway.

OK, please add a comment to that effect.

> 
> > > +     error = apple_z2_boot(z2);
> >
> > Why can't we wait for the boot in probe()? We can mark the driver as
> > preferring asynchronous probe to not delay the overall boot process.
> 
> A comment on previous version of this submission asked not to load
> firmware in probe callback, since the fs may be unavailable at that point.

But why do you assume that the fs will be available at open time? There
is a number of input handlers that serve internal kernel purposes and we
could have more in the future. They will open the device as soon as it
is registered with the input core.

It is up to the system distributor to configure the kernel properly,
including adding needed firmware to the kernel image if they want the
driver to be built-in.

Thanks.

-- 
Dmitry

