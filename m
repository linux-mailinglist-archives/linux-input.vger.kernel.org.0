Return-Path: <linux-input+bounces-13179-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E58AED3C4
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 07:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469621728F7
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 05:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8B41A2381;
	Mon, 30 Jun 2025 05:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqUcwz67"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B70736D;
	Mon, 30 Jun 2025 05:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260813; cv=none; b=KWeAjlnrxEn125x8fDEEL65H0Xku+xrvE2jj+rx0VBgNN9nuuDnAKw9CxtVi+2YtbEVlctcuuLiMxGqUp8yDxAbTnTGWqxQTD+w/8PYsN79zLU6YOnhvMh8veO841gZ07C3DjkHvB6++PDEDsq0Ke3LtfaU6YSsxIsAoKI44518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260813; c=relaxed/simple;
	bh=X01KpDvK/ZG/ntgsn9hKY7oG3ZQU0KFjK73/vQfttlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkRJVMH1qMUr3BuiednhG7k0Z0CINok9/Cce3b4JOrhWyyv5/mpWImhaLyXQwjHZ7CU/Ev/4nsmdTE5Qj6VvJmIzcu9eFg4wP18Ymbr4LL8/PqdGYZ/YQjO0cojyBQ4O6HRj1zLze6an/5ggVH1IvGgMW11ISG73zERGOyOEwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqUcwz67; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23649faf69fso12364165ad.0;
        Sun, 29 Jun 2025 22:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751260811; x=1751865611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WaJ4C0zWWu9yrnACARDN83F3kZ6XpuexPtSIsWrNK/g=;
        b=BqUcwz67lG0FJ2Dce7cTkGKVX2n8D7BeMsPiGdcmpD0ZlWoXKv6k8BtdJiWT0Ev4wN
         C+3DUMdXJ37YHXrjO1gpun2FHILB84rdRKoRNv172ibpjq34pbAJtmzSc1ixeAlSZ9tR
         WAzO1O/sm4QDMy6RB331drBXq/JilOxV0itM2Lzi5bziqntdl+WpK8cZ1OZPXPtPKtEC
         ZhjiGoQTHjv3xV7P0bgvMeC1KvT/6vDqvPEJ4NnL7qpiJCk7AgEVFXmei8A2/wV/51vo
         thtz7Evy6fEzDHlqoivFZ63K++8SxscQraw9c02JSlS/ZLLjmlRt2K2Wi87gIF1AgjzD
         z30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751260811; x=1751865611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaJ4C0zWWu9yrnACARDN83F3kZ6XpuexPtSIsWrNK/g=;
        b=tZ87clol1pMqJ8/YHCegQ9fh5i+jjCqT6H3Bu8UJENLjz+rOTHbyF1a+qfzvkkRo13
         SkVIZ/vdaFTc1he7a/o8z12TghsPOONXm968xFF/v/o8FXXctiW7VcxWdNf2VbXTH4wo
         WXvxrpI1DcSzoZD2o+8vcBbBtLzo3akJMhMU5sUwlOMyUlaJl6wq8/lX3QFCvMNTK9rg
         cRx4qJn3FZaz9cL/RLzoscmuBwfENCSqrwdHGhV+AonXEHeHWkp8U0d5HkGTG28Pd9Ai
         EJu/pK0FE3SXWtGbka20299mUnie05ORPHnS8abanlFZJbvrGsrDrJZm9NKh5YyjFNQ8
         pE9A==
X-Forwarded-Encrypted: i=1; AJvYcCVDygYGztf+ouUBdunLCJyhNRXA0dj6rkwkwtZC+Re7XM1j9DzOz6oDiUlPBYgPouBthapdFBrzCLT54A==@vger.kernel.org, AJvYcCXFJIiz8xYLZhKJ3w+f+GHzgFo43djAr8sCMCt3DgOhrk/5JxDyRRP7E4xaghulgEmwLI4mXKInTEnEVi3K@vger.kernel.org, AJvYcCXyPpK4E7pY0t61mewsZ+ZTyBTk9u9O0TpWKQ8eq2ecFVWgjckdcdfABz5kNYR5uaB+kFGNKWQziGVpZFmN+5XPwd7C4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ULMspON0NCVD+aQf5Mwl6U3Ww6zwf54KhsWCBsMSRdyp6z4v
	zeHZGz/HlU84fumN/7xyneRFrHMQ/LyzP8UZAkHuIjOsAJc8cqZGG7jc
X-Gm-Gg: ASbGncvctnjBg8hv/D1CK86HmJA8ejUh3mFjUDTYLr11Hvq54nwNuzlgpnYZLt1u+bz
	A0GWxi+iAsOrpn3cRibuJLGX685vxdJXdHAQQfta1/TOaMFSLHwKETyh6p59eSIJmOvJ6KsfDx3
	C+kZO2XGqe3zIK8bJkV3lb3rjctixxFDJ36Ui8JNsAFG2xILKHgLIl2oPpCb4XZVPnuCbhK7TF7
	BY05951NVtBPtZejrbQrh+9/OI2O4E6XmEYxWxSbNHyhyGo02i/xBdPUXtOXCSyuaopoeV0fJLa
	W5EnfpHQRqVmxJw9u4XBKv8FAffC0otqdjTbtNcr6J4J8/CFG69EgytcV15LzQ==
X-Google-Smtp-Source: AGHT+IGljq9y7uyYbWJk8IEUOp3noeR3/2KTd8Pg83rOjo/0K4IILNVBfNxEreQd5THLNbtRj5CfVw==
X-Received: by 2002:a17:902:d603:b0:234:8c64:7885 with SMTP id d9443c01a7336-23ac48b6862mr175872145ad.53.1751260811397;
        Sun, 29 Jun 2025 22:20:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1837sm75936735ad.65.2025.06.29.22.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 22:20:11 -0700 (PDT)
Date: Sun, 29 Jun 2025 22:20:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, pali@kernel.org, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, hansg@kernel.org, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, 
	jay_lee@pixart.com, zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Vishnu Sankar <vsankar@lenovo.com>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint
 Doubletap handling
Message-ID: <bviu4igchqy6bvu54fw6afts7ooctlmmcutdq6tc4rutzhjvfs@o56kezrit6un>
References: <20250620004209.28250-1-vishnuocv@gmail.com>
 <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl>
 <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com>

Hi Mark,

On Mon, Jun 30, 2025 at 05:42:45AM +0900, Mark Pearson wrote:
> Hi Dmitry,
> 
> On Fri, Jun 27, 2025, at 2:14 PM, Dmitry Torokhov wrote:
> > Hi Vishnu,
> >
> > On Fri, Jun 20, 2025 at 09:42:08AM +0900, Vishnu Sankar wrote:
> >> Newer ThinkPads have a doubletap feature that needs to be turned
> >> ON/OFF via the trackpoint registers.
> >> Systems released from 2023 have doubletap disabled by default and
> >> need the feature enabling to be useful.
> >> 
> >> This patch introduces support for exposing and controlling the
> >> trackpoint doubletap feature via a sysfs attribute.
> >> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> >> This can be toggled by an "enable" or a "disable".
> >> 
> >> With this implemented we can remove the masking of events, and rely on
> >> HW control instead, when the feature is disabled.
> >> 
> >> Note - Early Thinkpads (pre 2015) used the same register for hysteris
> >> control, Check the FW IDs to make sure these are not affected.
> >> 
> >> trackpoint.h is moved to linux/input/.
> >
> > No, please keep everything private to trackpoint.c and do not involve
> > thinkpad_acpi driver. By doing so you are introducing unwanted
> > dependencies (for both module loading, driver initialization, and
> > operation) and unsafe use of non-owned pointers/dangling pointers, etc.
> >
> 
> Do you have recommendations on how to handle this case then?
> 
> This is a Thinkpad specific feature and hence the logic for involving
> thinkpad_acpi. There are Thinkpad hotkeys that will enable/disable the
> trackpoint doubletap feature - so there is some linkage. I'm not sure
> how to avoid that.
> 
> Is there a cleaner way to do this that you'd recommend we look at
> using? It's a feature (albeit a minor one) on the laptops that we'd
> like to make available to Linux users.

I believe if you define the doubletap as an attribute (see
TRACKPOINT_INT_ATTR or TRACKPOINT_BIT_ATTR in
drivers/input/mouse/trackpoint.c) then whatever process is handling the
hot keys switching this function on or off should be able to toggle the
behavior. The difference is that it will have to locate trackpoint node
in /sys/bus/serio/devices/* (or maybe scan
/sys/devices/platform/i8042/serio*) instead of expecting the attributes
be atached to thinkpad_acpi instance.

You just don't want to have one driver directly peeking into another,
because then it starts breaking if you unbind or force use of a
different protocol, etc.

Thanks.

-- 
Dmitry

