Return-Path: <linux-input+bounces-1542-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525984173D
	for <lists+linux-input@lfdr.de>; Tue, 30 Jan 2024 01:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 883F11C2200B
	for <lists+linux-input@lfdr.de>; Tue, 30 Jan 2024 00:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC99D26A;
	Tue, 30 Jan 2024 00:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpF3aWz1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3862AD16;
	Tue, 30 Jan 2024 00:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706573009; cv=none; b=CWpK9P7AmKBTPlVGY0ysy/UI5PRfrkZ9E/ztOfSPhSeD0BaZSDBYLm1dsPB3ykHNzhAf+/dPEt9IjRau7RdYHK3tIBz1sWGzh+FvmX5saqS3RFhC6N4RzzvvTzou+K38+DmSdbc21WlH2PKNa/5Ah4bgHOnrSCloKJHn/VqhbPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706573009; c=relaxed/simple;
	bh=aKmREnzFzgaG1OovRPdN20/tIbKem5GExczkraauNtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noBWqZlIaR1M7PpiIZj7XpAxk7treqiTVNddQK9G/q2ubMiHDiWWiMrN6G8inrl2KRzKqvGU6tTxaEdZ2igdVdxNLrXVTR/gqhJ5Ml9/G2GIRghy3Zsq9cGmnSAso+ECLyfsaXPj8bUCG7BmKfBfGw5Y9/Ni9l1MuA+sQmY69aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpF3aWz1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ddcfbc569dso1487448b3a.3;
        Mon, 29 Jan 2024 16:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706573007; x=1707177807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x6AX2tmKlQJuH5vaoUXClrVktpvQ77kaUr8lCS+lqF8=;
        b=PpF3aWz1Xw2L/YZRUzh/wtreNZMgeTCw+O/RTnKE2JZJCJhs1yLSF0UvGgxaCrHnmY
         mWPYGPTw1nXv9ZM6mVfb5R1vbtPYOq2xEgXlLXPcGlzbpj6uKoRVCXDerUyR9ZSYDI4b
         nIq63A9e0F3zv4S2xmVktNfsAfmI9LOzcMllKRV0GGkJhaboFKPXxX574J9oHgDT3spt
         TvpM5a6fBJDMwhrEXEH7i0RwVP8xA+ZKS2BF0qAXCnv1XBdAtKk1i52/mpPv37tDCxbQ
         AOLzW8TS3z8kdNkg2GVoJSHTK4OdoiTX6zkEDqdyn1BZM0cktr41hzwbarlFCaHGiWFg
         dMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706573007; x=1707177807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6AX2tmKlQJuH5vaoUXClrVktpvQ77kaUr8lCS+lqF8=;
        b=A4rdz5syOz6AfOq+bvXpZCTm7GZGkmDnshyEEYq34rZnpe7jNJwDvLv3j8TmFo4irZ
         RnDUKdfQkMjiBxgG8i0jMvY3TSiGD99dXsi6y0zLFPaR/7fBKFO4cddu+ttRL/Uruidm
         ce7mY7hHdqh1XDz9rOj5/5FwRdN4YuW7ZQQXgPitpuy8+Qo6zrHT7yqAtTSdRr2oAts2
         bKaw2chE5zCNQR942VlUPgtAg8dw9LGQrFuuFNert0i3oupiBGP0ZCXpE8u3j5rfF5Fb
         feULLbKHfWlfq/pIc26onvpsPbHTr+9tZ1gVRwKYA1WXddoG6W55tUz+UZDTYMZ/HEn2
         EtIg==
X-Gm-Message-State: AOJu0YzcPoxGr7BF1yxSKt2y8M0l2e+0QCCtxe900AWjGTtSTh+v0k4D
	i53s0HhCx/wfQ3jRYEzhCmrenAxs8gozLvu1hEOtvzA4UqBtnT2TG0NHzvyl
X-Google-Smtp-Source: AGHT+IExGftfV1j0UJC6kyaBYy7ZOgbGgH97rcjMAGxmtr9pN9htLL/UJWJQ2w/csFcwubQKRKCLNw==
X-Received: by 2002:aa7:9823:0:b0:6db:be80:cad5 with SMTP id q3-20020aa79823000000b006dbbe80cad5mr3516819pfl.20.1706573006984;
        Mon, 29 Jan 2024 16:03:26 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d8dd:9292:9e40:5ce5])
        by smtp.gmail.com with ESMTPSA id lo1-20020a056a003d0100b006d9b2694b0csm6310115pfb.200.2024.01.29.16.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 16:03:26 -0800 (PST)
Date: Mon, 29 Jan 2024 16:03:23 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Gerecke, Jason" <killertofu@gmail.com>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@joshua-dickens.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	stable@vger.kernel.org, Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH] HID: wacom: Do not register input devices until after
 hid_hw_start
Message-ID: <Zbg8yxO91S9_DZl9@google.com>
References: <20240129223545.219878-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129223545.219878-1-jason.gerecke@wacom.com>

On Mon, Jan 29, 2024 at 02:35:45PM -0800, Gerecke, Jason wrote:
> From: Jason Gerecke <killertofu@gmail.com>
> 
> If a input device is opened before hid_hw_start is called, events may
> not be received from the hardware. In the case of USB-backed devices,
> for example, the hid_hw_start function is responsible for filling in
> the URB which is submitted when the input device is opened. If a device
> is opened prematurely, polling will never start because the device will
> not have been in the correct state to send the URB.
> 
> Because the wacom driver registers its input devices before calling
> hid_hw_start, there is a window of time where a device can be opened
> and end up in an inoperable state. Some ARM-based Chromebooks in particular
> reliably trigger this bug.
> 
> This commit splits the wacom_register_inputs function into two pieces.
> One which is responsible for setting up the allocated inputs (and runs
> prior to hid_hw_start so that devices are ready for any input events
> they may end up receiving) and another which only registers the devices
> (and runs after hid_hw_start to ensure devices can be immediately opened
> without issue). Note that the functions to initialize the LEDs and remotes
> are also moved after hid_hw_start to maintain their own dependency chains.
> 
> Fixes: 7704ac937345 ("HID: wacom: implement generic HID handling for pen generic devices")
> Cc: stable@vger.kernel.org # v3.18+
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

Tested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

