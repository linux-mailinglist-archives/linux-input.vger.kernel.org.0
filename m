Return-Path: <linux-input+bounces-9911-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3CA2F2EF
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 17:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36566188A1CA
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2142580F8;
	Mon, 10 Feb 2025 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMCYWpzP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F022580C9;
	Mon, 10 Feb 2025 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204126; cv=none; b=TXC9MVAHIf8Q6Z2Bvcb0bnkaY95jBB7HcSfbN48/RVYSQHeRImg2wQ/QNkwi2QZd8mX58Caz2cxJHP5JB6ew3cvdysmYLXanHDO/aukgcSA5mt+LSlf8q1yS7r5QtA9yLWaQJkU2ZT7/7eeJ0r/Z1ZCLTgebM0yGi7RtktZT98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204126; c=relaxed/simple;
	bh=UXDqlY9n1msb36iRIn+UVyGFu6AL1jpxFlahRfkA2VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anuRCUFJj/rnWI8+fwEASq/htobTbsMYX3ikvbKQAC5nNv+yQTpYS75c+rqQ9TcU2in/u2j3aRDAsdksXeXKUqmf3m5i83BNEJiwnlgHaD/7e7BPzF4ktoQQaPD4EDSKQM7PunxRvhiiNdhpJ+sAKskIass+IVHsU4PtEjEOrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMCYWpzP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so2981014f8f.3;
        Mon, 10 Feb 2025 08:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739204123; x=1739808923; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QAvIhc8+F4Z/iCQGPEOkeXSN7GErg7UTH2cuNvRR8uw=;
        b=HMCYWpzPI+Gz+1rxqjV8xKZHtURroX8KLTzYSkEwW8w+sIVzcruuk+GIU2bZ8OLcXT
         W1FMqbLxV8/Xig9F5cBGTKjj9tzI03Dx8plXBA+AZAH+KfhsihUp0Z/adlz0JuTj0xgM
         sOxRqsdzQ7AIJelHQF2eAEeGo9ypBKSljSkaRGWEGAngTXxmv+Hk9U+iAWeFpxWHN+Fw
         tmOBdbTt7BSJEL7T7qAhMxu1pixq3vBql4phWAqUcqOkCQAvn4FQ38UscmD1q5KzyPSi
         W7wcJc+mfCCoVTQZ3moF8iMA8d/DMP4pm3ZhXEy6Qi9It32Ok3bshLcqvF8jJi86f1Yf
         iHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204123; x=1739808923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAvIhc8+F4Z/iCQGPEOkeXSN7GErg7UTH2cuNvRR8uw=;
        b=XDxZMViDAoihvf6qCnhZQPENywXVJBEI9U2KOd68TNPteI0757U+nrKhVMnCco0F20
         8A49Uly1Dr5oKEiKDkvWG7LSo0+ES9+OIdksh4AZ1GT3tLOZfUHwm3tXHH4ygRw2DA5l
         RfedLnMWXOWcsmFPdiHMnWTQC293zfkMBW/0hahFShdBduJko+ObXwp/psoWLd1rEzM/
         hCc1AC4ZqMChqsDgCWobPbbUWx7i2Vjzm4VNv49em+CLOJuCwO3DJ0j3oDi4WhjFn1+a
         07O5kiYsj7FKT3TlpYK5n3EdredvFe6C3KdaD4FlRXRhzThQaGSti4HRhIZIrBdkAZnB
         rhww==
X-Forwarded-Encrypted: i=1; AJvYcCUaP1s+qpknMQKW538T2dpKYmydULHkQH7SO6VlWrZqdw6Yssk64hGziUXfcen1ZZpOFheAeAFCxcmRO88=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNtz2+V/j1XVXVFL2UcfEzkiMxCh+UORC7zK7JNVJzyKUQ8awF
	0QGD/XINy5TI0LjCC29maL1o0/elSb28wNiUECtuOlpToNaHfNARZmqTVzIg4PiuIW9fFNFLu7Q
	092FNhyjY/gzuYKUpNlw+SpYv9bVgkVqf
X-Gm-Gg: ASbGncsRtaspboCBkiCeuZwOuwuvHp+QEslBwN3FkHagUdGyAry0ju8x+foRwU6Qp+I
	iDYTBCQdWzGh5l90z/pHD8kt/G/ug6RHA18bPGeVkh47WLGC5fyme79byyNnQFSQo7yZrCpbbzQ
	==
X-Google-Smtp-Source: AGHT+IFnu09VB51eVbkID4img9JsElU5J7oM/IdYKee9PFnhjFeDbM1iN1xkor7JElGZV/CUF3Td52eXNDPXlqmKI/o=
X-Received: by 2002:adf:f58d:0:b0:38d:a8f7:cb73 with SMTP id
 ffacd0b85a97d-38dc9138f08mr10197975f8f.40.1739204123229; Mon, 10 Feb 2025
 08:15:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008233030.395126-3-stuart.a.hayhurst@gmail.com>
 <5cf187db-1eae-41a8-a33e-ef68a4f66db6@kernel.org> <afb96547-7ff3-4070-b960-33f4af7e3edc@kernel.org>
In-Reply-To: <afb96547-7ff3-4070-b960-33f4af7e3edc@kernel.org>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Mon, 10 Feb 2025 16:15:11 +0000
X-Gm-Features: AWEUYZkEOeEjc8YvJEaBxjaHn72XKgHjXq465jVSG4TIidsUrxtnbqoRx3Qg8UA
Message-ID: <CALTg27kaxGOzq2k-dAqbXZ0ez5e-WZRU47Z2eP5297VVHF81kA@mail.gmail.com>
Subject: Re: [PATCH v5] HID: corsair-void: Add Corsair Void headset family driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This effectively kills the system. We came here via:
> corsair_void_raw_event (hid_driver::raw_event)
>    -> corsair_void_process_receiver
>      -> scoped_guard(mutex, &drvdata->battery_mutex)

> And hid_driver::raw_event can be called from the interrupt context. This
> happened at:

Damn it, I was suspicious that it was too easy. It's been running for a year
without an issue on my system, I'll clearly have to read a bit more.

I'm not sure what the best solution is for this.
'corsair_void_process_receiver()' shouldn't be called frequently, and
the locks shouldn't be waiting on each other very often, so I suppose
swapping the mutex for a spinlock is probably the best option, instead of
increasing code complexity?

Happy to put a patch in for whatever seems best :)

Thanks,
Stuart

