Return-Path: <linux-input+bounces-14884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B5B8792D
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 03:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A81E31B224C6
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 01:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21E61F151C;
	Fri, 19 Sep 2025 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmWAhIhx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C87A17A31E
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758244352; cv=none; b=ZscaHlU/Vj2gxFX5knsto51y02LGuC41mDAv6U8uIbPQRl6yLIcyLkMZKq7JBFW8GboQJCGxloOzTZE/qnTmBrOGvc9/LkLEdBrYfyD5EgM0NdvtodDUe+JXZ2J0SJ8fr/d0a8tcU/2oknTR/AOcs0A3Mvh23ZU+kuLOU7lxzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758244352; c=relaxed/simple;
	bh=NG9G6qkcd55l7sxI5pzc5l+YODe2sfMn5viC5nVCsbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezNVN4kYC6nWhbapySIgt3yDVY77CSvCj8KcsUVC8qCju6W+UiYJ3O17XDv/ZnawcF4kLyXcb8B0rAFbZKKXiieeQ/mlqwJ/p3OjkV2BpKW3cXnymeS4ODHcz3uizfKMHf/12viMvPcXXfLdQx9DSHWVjD1YxPQPziDOwPrgf0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmWAhIhx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-26058a9e3b5so11499615ad.2
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 18:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758244351; x=1758849151; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A48yMdinMY4TsMoA5WhtjSNisYijRwjFPVTZOj60lQ0=;
        b=WmWAhIhx1udw9SygcsB/pxfIw/Uw1Bv5PgEROxlmI4wIaaOmsQaoyZFx5oKJZbHKd/
         ZLQLcIrGPqM1OWRCN0T7e2cOBiHrzSB3kQa6kITUV4+cxlQkv0tebCVlQO4CcGqzVhcR
         2U5SjB1+ynG9DewR20KhFrn1vrcL2pu9PFZv+Wktz0lWmrRRpgx+9u4aHE+P75FsCZh3
         TyWpSS5qI5pYg2mibIYv6mSmx6uSxKAIrFz0u8+qy+Yqe/iY+FAjtAlYQ9aJxHpsD7Up
         1dMRsZR6xI7oEydr+nZCV1ZJfCy12qOM4BZcili7DJnokWUrzrsp/4TjmjfHrvrHXMVT
         3Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758244351; x=1758849151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A48yMdinMY4TsMoA5WhtjSNisYijRwjFPVTZOj60lQ0=;
        b=HP6fC2Q24rJHyxgZBLwclrIN8XY8kzgI+6bx3kULxUnU7u1kCCsZFr/47kvfae6oTU
         hqtKM4NdnIP6C7ytNzfqkGbkJBTcHYoW1xki5/cGTWKZ7lTc2sSVM2W2rqbi42pdilNg
         pUxzTc7Rv2jKb/jqPY+Z6I/f8u2Y77btB6veg4ddWG8KplJS5puiHF1oxOljoiHqHyF+
         S5Z/CC6A1FegOcox1iy7qYOeY8xSUkdjO/J8wkEIMzY3WddVcObP97waHp9x5/njv0+5
         8qnyqcDTzqVIJbeG5xYy8y4scLqxJ+ATeeCl/NduUOIVC4Og5xbYQ6sfg7Cr6zioO2aW
         mtOg==
X-Forwarded-Encrypted: i=1; AJvYcCVLb/CXvudYrTq1S/xJWhm96w6pqP4dDYndHr0jmSnKIUmtr3ei9Ik4Qrir7MVsq2WCgO5zzeC+rR9QEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkGHsqzd0tvcFqCYPkTYd20yOpAHGF6gtbVxzmw8920PzM7ZYK
	HGI82H685DtF7hbFUhzZ2O3junoUyq6YAGTOBG+NIzXhbVoZTWOxKpA9KlZgcw==
X-Gm-Gg: ASbGncvhcvhN0J3U3rGPwJe6kkHu0DdXfkX30x3GivhX7hfSSLpmqixcw3Mm9/wimle
	jE2IOb+PPFgAZh8zjtiWW2SXvEXh1/Rw4sJE891E9notE/UpGcbSMLvXNyPEVsU02OPomDPLaxe
	VlVt4TTdYbdkDeHl64uzI0+2IJQcKzo7ANht0hJvQ3MwM5VNvMxB/2LckpcN1S/CHRBOjkslyx6
	a1tEx7begjZvjyaIa3XQs/17Cbaj/zN1Cu1zwnFoP+Z9Zx7T2VDtz+1a5VjbcDSUZk+cckjelSG
	VLNAANSgmZC/ZDfBfqJJgcb3bt4uUKOmZBSWVJn1KiNUQaHVU9oNVV4kdjUSFI3yAc2YEJGAlz8
	wA8oBVmC00uBIue/WjkBZDhk=
X-Google-Smtp-Source: AGHT+IGjYX11oCrTtfxdx4vWRKTaE6PAVgpbO6Y8EQGn0PtwNPXtesJFTQwPRO+jaBSBsmPP7H+GGQ==
X-Received: by 2002:a17:903:944:b0:24c:b39f:baaa with SMTP id d9443c01a7336-269ba579989mr18144535ad.49.1758244350465;
        Thu, 18 Sep 2025 18:12:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8e3e:e1c9:1151:50c3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55199e08f1sm402995a12.24.2025.09.18.18.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 18:12:29 -0700 (PDT)
Date: Thu, 18 Sep 2025 18:12:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, hmh@hmh.eng.br, 
	ilpo.jarvinen@linux.intel.com, derekjohn.clark@gmail.com, mpearson-lenovo@squebb.ca, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v3 1/3] input: mouse: trackpoint: Add doubletap
 enable/disable support
Message-ID: <fgizjuhcnl6rfawrqnabkhijf5uzbczen6k5zp6z44hycjqylx@6qzi54baxivx>
References: <20250901135308.52340-1-vishnuocv@gmail.com>
 <CABxCQKtEcFozTtuV3sutU3OyobTbpA82Uy=MyU0FQePPT7S2Wg@mail.gmail.com>
 <6e834cb7-565b-4a4b-bf90-4765f5fc9cc9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e834cb7-565b-4a4b-bf90-4765f5fc9cc9@kernel.org>

On Thu, Sep 18, 2025 at 09:31:47AM +0200, Hans de Goede wrote:
> Hi Vishnu,
> 
> On 18-Sep-25 4:37 AM, Vishnu Sankar wrote:
> > Hello all,
> > 
> > Do we have any questions or concerns?
> > Thanks in advance!
> > 
> > On Mon, Sep 1, 2025 at 10:53 PM Vishnu Sankar <vishnuocv@gmail.com> wrote:
> >>
> >> Add support for enabling and disabling doubletap on TrackPoint devices
> >> that support this functionality. The feature is detected using firmware
> >> ID and exposed via sysfs as `doubletap_enabled`.
> 
> Hmm, you seem to be using a firmware ID prefix match, combined with
> a deny list of some firmware IDs with that prefix which do not support
> this. How do we know this deny list is complete?
> 
> Also as Dmitry says you really should use the is_visible() callback
> to not show the attribute at all on unsupported systems.
> 
> >> The feature is only available on newer ThinkPads (2023 and later).The driver
> >> exposes this capability via a new sysfs attribute:
> >> "/sys/bus/serio/devices/seriox/doubletap_enabled".
> >>
> >> The attribute is only created if the device is detected to be capable of
> >> doubletap via firmware and variant ID checks. This functionality will be
> >> used by platform drivers such as thinkpad_acpi to expose and control doubletap
> >> via user interfaces.
> 
> Hmm, you refer to thinkpad_acpi as a possible consumer of this
> functionality. But you only add a sysfs interface.
> 
> thinkpad_acpi will need some in kernel interface to use this.
> 
> Which brings me to my main question: thinkpad_acpi is the driver
> receiving the doubletap events since these are send out-of-bound
> and not through the ps/2 trackpoint protocol.
> 
> thinkpad_acpi already has the capability to filter out these doubletap
> events and report nothing. Why is it necessary / better to disable
> the doubletap at the trackpoint fw-level, rather then just filtering
> it at the thinkpad_acpi level ?
> 
> I don't really see a big advantage in filtering these events at
> the fw-level rather then in the kernel and we already have the
> in kernel filtering.

That is an excellent observation, thank you Hans. The frequency of these
events should be extremely low, so cost of simply ignoring events should
be miniscule...

Thanks.

-- 
Dmitry

