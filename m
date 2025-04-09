Return-Path: <linux-input+bounces-11678-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D76CEA83333
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 23:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1016F189FFCE
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 21:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CED72153F1;
	Wed,  9 Apr 2025 21:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JC5NO1EH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F195D215180
	for <linux-input@vger.kernel.org>; Wed,  9 Apr 2025 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233594; cv=none; b=MyjhwIbVj+b65upWuKRRLQ0f+yIVPksucxdTM6sg9Au5HOGzTB+7KSn/aU/e7ZGOj+zKTg4RnLOIwtg1TUIBZxPMgMkKrFt9AMESc9TdbJUEEQfZbAw0Xxo23wE2PBPjAkOKYtd2ypUaykwFJzOqXiOwq38koPf7/4FroTXf87E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233594; c=relaxed/simple;
	bh=VH7C3fbZSWHG4p9mAtu/ltYwyPzY5ezt3mC+xRh7Qqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFNK+Q5xRaO0ruTGyVrqboNEtutYvni9VVQ09tI5KfX1agxBeYWCwAB73bo666QUAg5OtNWXoXlKCoehv3Me+Gpn1TuiorxaKg6eZXXI/5megSAJceK+/IXcHi4aPyBGKPy/8q2KmoVpRkvVZAbkn8+vD3BUhTNPnbjTB+BFEfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JC5NO1EH; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso56904b3a.2
        for <linux-input@vger.kernel.org>; Wed, 09 Apr 2025 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744233592; x=1744838392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHgRFvB8FjhuGT2gYITkIRAQiONl4kQCS7c6Zx8TIxw=;
        b=JC5NO1EHitm1RrPxMKmQkmz5STr9H622Fgbchi3cMhXrJC3Jr/CsV1Ty2HUKNG55R+
         gpzK3YeCg7w7zvABORIRb3PKJdfj2iVjGtzNDGQp98JoeWwBtNUsC/vmatnwv+PJbOz9
         fNLzLX9susuBmmlt2E34h02oMrzejihkP1gz4PFKduYhGoRdsK+qemtvejgLrk7R20we
         4rFlTqKRVe2FqyJsdUyN0WCvZ3Rws05fIgVacUlzN2+0zVO0L35PJ/SS61q72BpzK0ug
         igvxbhLFqR46WdY9Nhg2R1Rw0PKlJFPld50NRyTTgCJzl6hDJZs+gzkvQTg2PFa7F+Vg
         Zf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233592; x=1744838392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHgRFvB8FjhuGT2gYITkIRAQiONl4kQCS7c6Zx8TIxw=;
        b=cEfJ4OYMx1ruUZ7bmkpiWrj80zB+jidxWFxMJsaRcSYy1osnMw3SckHYBeaOMcx6Dw
         k++ypI0LgUoKcKQiontsAmMphkvqe6V9/g1xileXHnSxTPAWgksBYI9Nl8ctq1eNru0L
         qGvh5s6Sg/ausRr+4zsBJHUyjNGabUKlEfB7kbTPJ8Lsw+tjNcgzBiap8kjTP4peZXon
         0PipAa7s0eMiX4AQX9HcYT36iYfcV9ji5xBPyXdq92KycWuo8TMK+zfiJUIxM1X6sg2N
         R2AYcxOgWAMmcB9O2N3wREfI5aj9eRoOVGZC8KCHlj7qAJBLs0jvwNboL/WdkaqDKjUw
         f9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVLVYmczTkkNvN/jPynsV7UJERxvLPy4jtrctJSsYZo9n2lPfR0IKaO3WApPHF4PoLLmi/A7FH1BTMoNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4bGnLwDoar5yfsCar2fq4vic+a+0EuFoKGSz+0Ut8qQTLHLq
	wC3+zrdxAfDVE9retDOp8O35s5CaP5+SeysKvq0F6jQzV683r0SWUuIe+w==
X-Gm-Gg: ASbGncs6ltn/iiOUaYkQ2XcgYD2PUEzGyXp78vGMMxicycOOC7n6al6AwvbzvwU/SZI
	maUXQa2xqlbNYGfYSKPdlwR+AdRs021hvp3qMijDlaEuHP+FJM4giFjjEV5phSEVFrQxoJQubMi
	bOSsmaOA9gJTMLaec9ghLpOdto4VPiysJI07c8RyWE33B2bK4mwTVjkJ72/O3yGUGIKowJ5TAU6
	GmuxCNNXixYk9ySktSFrLYrZrVWhrqhjGFkU1PKYTdlN75rm5NqoXFqyJqvHoAFyd0M7d0RaQBM
	O56jCvH9vtFBFVzeCIwNzfQGa6Dnj4sZUDkaBzziPw==
X-Google-Smtp-Source: AGHT+IFJdkt6G0vbaehboKlVJ4EAIz3Uc3uahqarnGCyysmsnk3S8t/yzJWxLF0YcOrdqAXnZ4NLwQ==
X-Received: by 2002:a05:6a00:240a:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bbec49f99mr530015b3a.0.1744233591973;
        Wed, 09 Apr 2025 14:19:51 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cff4:8871:54bb:4c97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d4945asm1899092b3a.68.2025.04.09.14.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:19:51 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:19:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: jt <enopatch@gmail.com>
Cc: Aditya Garg <gargaditya08@live.com>, linux-input@vger.kernel.org
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Message-ID: <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>

On Wed, Apr 09, 2025 at 03:41:50PM +0100, jt wrote:
> On Tue, 8 Apr 2025 at 12:36, Aditya Garg <gargaditya08@live.com> wrote:
> > Can you try adding psmouse.synaptics_intertouch=1 and i8042.nopnp to grub and restart?
> 
> As requested, I have tried adding the following module parameters to
> the grub command line:
> 
> psmouse.synaptics_intertouch=1 # just psmouse
> i8042.nopnp # just i8042
> psmouse.synaptics_intertouch=1 i8042.nopnp # both psmouse and i8042
> 
> but each time, the results appear to be the same i.e. the device
> continues to be recognised as "PS/2 Generic Mouse".

What about the main touchpad module? Is it still identified as "SynPS/2
Synaptics TouchPad"?

I guess there are 2 separate problems - one with Windows using SMBUS
mode for the main touchpad whereas we are sticking to the legacy PS/2
mode, and the separate one with the trackpoint not being identified as
such.

Could you please boot with "i8042.debug=1" kernel command line option
and post the dmesg?

Thanks.

-- 
Dmitry

