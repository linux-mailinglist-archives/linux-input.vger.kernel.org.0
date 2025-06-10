Return-Path: <linux-input+bounces-12789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB34AD4343
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAFEA7A2195
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384BD24468A;
	Tue, 10 Jun 2025 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsl87wDz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10835231825;
	Tue, 10 Jun 2025 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749585010; cv=none; b=NuUwos4ebkMDV945i8mvX1P8pJELRHnckwh2xDo2qDev2i0Mr2AN99YHtjjXmw4lWC0VyNSOHTRobggFZV2KJzRggQLWQt9+xkjeflDDxTd7B1yy/BAcWraVy/Q/8um8neaIie3PHrZLVGmml3Mc8WKB/ZtZwCYf4M4H8LUlFpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749585010; c=relaxed/simple;
	bh=UX2m2jHf9wv3qfCttGY+NSJstGRmeEAzzVHcQy644po=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HgmN/7hQSO18hKTZucfAyY1s5NHCBWN1I/A2C6vCiOqJabQu2aGMLA/ycSdnUNBZGNqWAwJrbAJmZz+kWBbX6x0p5KWeGOrg1tjpA3dpweD/kCcEZqrHX3SfF2sQBtxFFWy6KKosKC7DKubCsVFkgIQ/uLj75+xVOvXzPgMIE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsl87wDz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264B0C4CEED;
	Tue, 10 Jun 2025 19:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749585009;
	bh=UX2m2jHf9wv3qfCttGY+NSJstGRmeEAzzVHcQy644po=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nsl87wDzRfQfgxOCo//++N+8OmSLIjGT4zB6hO/oJ2rzsM3RDF+Snrf0wA8oyP/ql
	 c7TlBgF54DKpk2V3nmdDTbr/PqLmHk75T0yqGAypB5rsE7e1apmMEm9NEAIy9QTGnZ
	 BCHjpLqHIWp1QjvMTOvrWkoTR5buRYv7ZLhSwAX4AWCAFq7IXOcX8pSvoKGW2UwV2E
	 P/RdeQcCeEPZyi58sSXF+QKabIfJ8ERQ6U130ZpNr0jMBGHhypgr7iX6r7U0eorrHL
	 PZKtJQt2lCzC4if+wqfOl3N4iDKfJoUJwAfcJu9hz0CCTHZXtCBmrOMfYQdPYoGP+F
	 VANDp2V1EnW9g==
Date: Tue, 10 Jun 2025 21:50:06 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY
In-Reply-To: <20250605072959.91625-1-zhangheng@kylinos.cn>
Message-ID: <2197sns5-472r-q5q5-p94s-spsp107q1067@xreary.bet>
References: <20250605072959.91625-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Zhang Heng wrote:

> MARTLINKTECHNOLOGY is a microphone device, when the HID interface in an
> audio device is requested to get specific report id, the following error
> may occur.
> 
> [  562.939373] usb 1-1.4.1.2: new full-speed USB device number 21 using xhci_hcd
> [  563.104908] usb 1-1.4.1.2: New USB device found, idVendor=4c4a, idProduct=4155, bcdDevice= 1.00
> [  563.104910] usb 1-1.4.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  563.104911] usb 1-1.4.1.2: Product: USB Composite Device
> [  563.104912] usb 1-1.4.1.2: Manufacturer: SmartlinkTechnology
> [  563.104913] usb 1-1.4.1.2: SerialNumber: 20201111000001
> [  563.229499] input: SmartlinkTechnology USB Composite Device as /devices/pci0000:00/0000:00:07.1/0000:04:00.3/usb1/1-1/1-1.4/1-1.4.1/1-1.4.1.2/1-1.4.1.2:1.2/0003:4C4A:4155.000F/input/input35
> [  563.291505] hid-generic 0003:4C4A:4155.000F: input,hidraw2: USB HID v2.01 Keyboard [SmartlinkTechnology USB Composite Device] on usb-0000:04:00.3-1.4.1.2/input2
> [  563.291557] usbhid 1-1.4.1.2:1.3: couldn't find an input interrupt endpoint
> [  568.506654] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
> [  573.626656] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
> [  578.746657] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
> [  583.866655] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
> [  588.986657] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
> 
> Ignore HID interface. The device is working properly.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


