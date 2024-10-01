Return-Path: <linux-input+bounces-6925-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B75998B7D8
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 11:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3513D284CE8
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 09:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D6E4594C;
	Tue,  1 Oct 2024 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fic+QCxg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D0919D897
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773481; cv=none; b=haHJgN/7s7ovH4aYHDGIoutSvrUyb8gU3RiYH+J3OP+8YOzJfBMMwJEk6q69gu+YMeCb8HEBQsZoyFf3p0beYGqecGhjwa0bDp/bjd2t0L+J3oOCt/ePijJUVSJKJfezZDoayR7EuMsUv7XnDZSwogdKts3b6MycAyGu5KCwZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773481; c=relaxed/simple;
	bh=vuOTWteA3rNi8KzeoaQPhq7nNBKkHHe1c4HauXnUydk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN2yZ2nlPcvx9X4OsaW3GsBMMwjajf2ArcW/laahR24FhRHKVWTYN9WIiI6MmeUyyc2V6gsT38NakZ9qsHiJf5mn7BBz1yKa5L/yhGOh3O3mBqsHyOeRFCNMiDgLinhesj2zm1gKGq5g2A+1hgD4zy8vBNFkvoYNIm1LIgEzqAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fic+QCxg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20ba8d92af9so7911815ad.3
        for <linux-input@vger.kernel.org>; Tue, 01 Oct 2024 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727773479; x=1728378279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zo2K4LMTSzcvx83cyJB2sbCeHYXXAP4bPD1FD2gfPcQ=;
        b=fic+QCxgVuqg5UsfzfLNTmKGUns6dZWzNU1/jp63H/jrqrTOVbG2nMYRpjU/yiWJjn
         XKzFZlWBIYKRUCQZ6exe3iBmRxQiF+K1NPcRPwZT5LFG24bW8hjSXxLjO1DxGWav0yuJ
         YOGEihG6dCF3Rdx1OFQxCWBqFpbrYFLBxYtYZEf+8oYPBtpm2Ow4Xgg0Zw7lpglA8dH6
         P4kW534IOQCCpZ08yylT5/YqUfvXIwMjPlQVgSw31XXsAv3QOJDFcfwl42fZM1bGuRzI
         9ecOJCzTpWnp6xMP4cjTMyMK1net/9J4iNhrj9FA8xcIQIszhOp9V1ooDQF8AYENVBPW
         JJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727773479; x=1728378279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo2K4LMTSzcvx83cyJB2sbCeHYXXAP4bPD1FD2gfPcQ=;
        b=DUXofLfQMHtywDX4INnnB3t3R4xOvsPXp6Fq/WgK05Ti9bQsD8kYjAxuFxjFcThqiX
         MTEhqczNYpUvvkHn3wVwOJyKAmR3Wnw/RAV+PTk2A3h0tQc3RaZrjoRJbyk/uAoB9hyf
         IVe44GrKLqAmSTwFR5vod9GyfCEoHqGUTRg3ep37Cz59b6bm8vA3GagGHNYVftl5P8Jf
         tunrKLDqY2pJXG5BiuHaiz1We50qyVaHMZD+6ewA0rmu71cEERVqL3BHCc1BArUo7GVq
         WqSq8inYhMnaCbcGBaa6xwKYdbUcqal8xI/1zkxIDt/3S2ZXTSV46hLO3fssa2RHWzLt
         ZaoA==
X-Forwarded-Encrypted: i=1; AJvYcCVZHFnWq3ziTvf8FsEsajdoaEUDibc6QD8o+4NJ0X7iDG2Kmanu9LtTZXO2DprCjAosWUCWy3S181GjSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrhDPwhjeOu1Q0d7bwl/h6Zq780s1CZtILzzGqw4I3EzkcPTm
	n2UNSwn6tC4S/N68KmEFPHok07ovinlGJsT8QBGjT8/+BZtI+7fo5hbSuoQfXGA=
X-Google-Smtp-Source: AGHT+IGC6bQ7YzXYfMemUlUb+iTeP1/mU77MCHzAUZu9iXRNRox3/KDU7qsr97YAbwIXcy+NTSLBvg==
X-Received: by 2002:a17:902:ec85:b0:20b:8ef2:c84a with SMTP id d9443c01a7336-20b8ef2cb6emr76883415ad.53.1727773479332;
        Tue, 01 Oct 2024 02:04:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e63914sm65507595ad.291.2024.10.01.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:04:39 -0700 (PDT)
Date: Tue, 1 Oct 2024 02:04:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>, Huacai Chen <chenhuacai@kernel.org>,
	linux-input@vger.kernel.org, Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <Zvu7JOw0N6XB4ON6@google.com>
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
 <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
 <Zvu4mMaOzuL3tDTW@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zvu4mMaOzuL3tDTW@google.com>

On Tue, Oct 01, 2024 at 01:53:44AM -0700, Dmitry Torokhov wrote:
> On Mon, Sep 30, 2024 at 05:59:01PM +0200, Benjamin Tissoires wrote:
> > Hi,
> > 
> > On Jul 04 2024, Binbin Zhou wrote:
> > > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > > supports both clickpad and touchpad types.
> > > 
> > > At the same time, we extended the single data packet length to 16,
> > > because according to the current PixArt hardware and FW design, we need
> > > 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> > > 
> > > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > 
> > It looks like this new driver made in v6.12-rc1 but is already breaking
> > other touchpads in fedora:
> > 
> > https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> > 
> > The reported touchpads used to work properly but are now directed to use
> > the PixArt PS2 driver instead of the old one (I would say it should be
> > using Synaptics).
> > 
> > I haven't touched PS/2 in a long time, so it's going to be hard to
> > pinpoint the error from my side, but it seems that the new driver is a
> > little bit too greedy.
> 
> OK, I gonna revert it and hope PixArt folks will figure out less greedy
> probing sequence (or maybe we need to push it down a few sports).

Although, as I am trying to read the referenced bug, one of the
reporters are saying that they touchpad is USB:

SysFS ID: /devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3:1.0
ysFS BusID: 3-3:1.0
Hardware Class: unknown
Model: "Synaptics Unclassified device"
Hotplug: USB
Vendor: usb 0x06cb "Synaptics, Inc."

so I am not sure how PS/2 device would interfere with that.

Could you give me access to the attachments on the bug so I can take a
closer look? And hopefully the original reporter will submit their data.

Thanks.

-- 
Dmitry

