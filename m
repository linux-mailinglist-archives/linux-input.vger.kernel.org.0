Return-Path: <linux-input+bounces-6553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3D97953D
	for <lists+linux-input@lfdr.de>; Sun, 15 Sep 2024 09:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14ED28388A
	for <lists+linux-input@lfdr.de>; Sun, 15 Sep 2024 07:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA2422087;
	Sun, 15 Sep 2024 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhGp1eIz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A421A1C;
	Sun, 15 Sep 2024 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726386924; cv=none; b=dfOChXxGIyqxlsdeOqDSGTUFLj+7bK5SKadnkf0RCqztJSGfZtNacBjofdO1+H2NAOETkfs5ClO1A0xHu/Mz9Mjk3I9yHEmVewXB//NPGEG6cpa2I0/4E1KtZ+ENxDRB16W65YcVqJ6zzkgB76jluUR4xRjCs0i9ATl8GiSkxDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726386924; c=relaxed/simple;
	bh=QralsGpTk/VE7c1/yICJm16dg/6F7TBywR1ptd4plqU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tb1/8fss8f8uXbZGmXbH5ecNq5u8yMiXos0R3p8DEGJ6EwGKnooabv7QUbcYIxikthCP2J2FA57CX5bQewoRzwlwptceTa2uXrYGSrw8uYdA/VkG8saxdqfxlKpBtyJDzjYaWsFjn3rpuo7RkTjJcTCxCBWK0Tdo+Tq6KJTM3LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhGp1eIz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso508022966b.0;
        Sun, 15 Sep 2024 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726386921; x=1726991721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QralsGpTk/VE7c1/yICJm16dg/6F7TBywR1ptd4plqU=;
        b=KhGp1eIzqWcE/Lp6mnIKvOQqqLM28ERUGXzJ3eXN0JNuhB1zd6idU56U7bC8u6xZe6
         UPEu04DCcq+H7Hz2OnSyYLs/kc2Cbt/+P1rMF72tTloY1FtYxiu2Sc0Xpy7s7mbn2ADo
         V3tLx/ndsYu7/NdkVhTwrLB0O2QLTfz33pj3atlclUFYvG2OO8W6a9kzaVExZkN2PWnQ
         Z8mVYO+cbkT8udPqHndGpufnLRvY+Q8BMgw2IXYfPuaw2A4FTkELa1To5g3AEAkL04bX
         ow90vXOc4jgG9eE6EDPkfN6sBDJrI0xGWoDgSdEdW+J6QKQW4Fe28lJyhCq8K/b41uip
         W2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726386921; x=1726991721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QralsGpTk/VE7c1/yICJm16dg/6F7TBywR1ptd4plqU=;
        b=XJ1gfevuzcvjE3qstTEqObQIGG+yEITA1TDLe95t07A5e29uoZqX8A213kA8hcC8XU
         pbgLnZO+FQUcR5919DhR3pwLE3u16p5IOsDrATdpNQIALznhnFfmzsNEOTaIB1kE4Rz5
         RDw0Zrl6iEdQw8u5VhvI7dhNV6ENWdssO1y+rzX6PFNZE3Q+Iz0AmD9+0SireqbWEUmb
         P8re4j3KB6LDsll6vjIp638Be7MR2lta3X0AENsNzX1vXxomikdESMnTfgV2o8r9pkx4
         hIMSBggya4VRlRFpXHiXqmnygj5y1mEfOcY/VVWU8M/CVBSqpxkI31JrszwQwbO6HYId
         zpQA==
X-Forwarded-Encrypted: i=1; AJvYcCVc+TUHyifB1I89sxc5k59dXzzi9kAlxq5Y2QIsF8Ez1wmiUMVAqBAW3EnopM8pkatQMHsubm8C46fMhWY=@vger.kernel.org, AJvYcCVhiSQX6E9Gpew/touNRm9Rvw9zPl3bTCPx3UJGHHN6oiGln4c24cBhqJOVnsx8/mLyhcoD694ZAr/JDdI=@vger.kernel.org, AJvYcCW/u8IyvMOSBw42bZt05uudpnuLYl9ZehS+c9WT3zVSOIHjX/b7elEFVLg8FdCmBNS0Hf6vWzlLwpCT@vger.kernel.org, AJvYcCWslBRVf9IGmPAmH/WmbaYlMUPCJEh6zXYNcbRrsf6Y4mLBq7AH9gZSW/QdGggXtZm54L8FParzoAn3bfY8Lw==@vger.kernel.org, AJvYcCXFDP2D5CjGAEBPRCxbNCmLdnhR9eJQy4D4UuI3cCWm4Otu8wQp/q4fkW+lc2iNt6gFsaJd1xu6MgUkW1QR@vger.kernel.org, AJvYcCXQ8laiwz/vTGWPyyvgaOOBraqMNqqM2jyg3BWRMnIrPs3SiIU8XhngqMmnOgvBMyTSdi0fEi9SS0bH@vger.kernel.org, AJvYcCXWZ2HdmcVMdGy8TCUxbq1Im47/EqIfnr6Ymzphb0dD9GRRpHjGOq/aXllmYZNVGFNBLC42lWEVBrEf@vger.kernel.org
X-Gm-Message-State: AOJu0YybRTt05DmhFbqrBlqRpxOac/6E+UYSHvaRoeluwLe9VZ+aylng
	Iafr3iL3nTk0zj3iFrHlO87toI8H0/WecHSW9MzYCEe28OKVpImg
X-Google-Smtp-Source: AGHT+IGPQI+t4lYTwiuu4hyJoLvLouchr9DqQvDvbSEOgzDQJG8ZpceHMqTZzT7/DgMVYuW1CsOVDg==
X-Received: by 2002:a17:906:259a:b0:a90:126f:bcbf with SMTP id a640c23a62f3a-a90126fd1c5mr1196022766b.10.1726386920479;
        Sun, 15 Sep 2024 00:55:20 -0700 (PDT)
Received: from foxbook (bin105.neoplus.adsl.tpnet.pl. [83.28.129.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f4375sm166709266b.73.2024.09.15.00.55.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 15 Sep 2024 00:55:20 -0700 (PDT)
Date: Sun, 15 Sep 2024 09:55:14 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <mathias.nyman@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
 <alsa-devel@alsa-project.org>, <bgoswami@quicinc.com>,
 <broonie@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
 <devicetree@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
 <gregkh@linuxfoundation.org>, <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <mathias.nyman@intel.com>, <perex@perex.cz>,
 <pierre-louis.bossart@linux.intel.com>, <robh@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait
 for completion
Message-ID: <20240915095514.6b01fefb@foxbook>
In-Reply-To: <a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
References: <20240913103237.2f5dc796@foxbook>
	<a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

> Maybe the last sentence is not needed.=C2=A0 When we are using the
> secondary interrupters, at least in the offload use case that I've
> verified with, the XHCI is completely unaware of what TDs have been
> queued, etc...=C2=A0 So technically, even if we did call the default
> handler (ie xhci_handle_cmd_stop_ep), most of the routines to
> invalidate TDs are going to be no-ops.

Yes, the cancellation machinery will return immediately if there are
no TDs queued by xhci_hcd itself.

But xhci_handle_cmd_stop_ep() does a few more things for you - it
checks if the command has actually succeeded, clears any halt condition
which may be preventing stopping the endpoint, and it sometimes retries
the command (only on "bad" chips, AFAIK).

This new code does none of the above, so in the general case it can't
even guarantee that the endpoint is stopped when it returns zero. This
should ideally be documented in some way, or fixed, before somebody is
tempted to call it with unrealistically high expectations ;)

As far as I see, it only works for you because isochronous never halts
and Qualcomm HW is (hopefully) free of those stop-after-restart bugs.
There will be problems if the SB tries to use any other endpoint type.

Regards,
Michal

