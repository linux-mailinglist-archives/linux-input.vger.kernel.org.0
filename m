Return-Path: <linux-input+bounces-15957-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 522DFC43A30
	for <lists+linux-input@lfdr.de>; Sun, 09 Nov 2025 09:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3AFC04E3B16
	for <lists+linux-input@lfdr.de>; Sun,  9 Nov 2025 08:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C232BE7B4;
	Sun,  9 Nov 2025 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAwzjIZk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022D32BE622
	for <linux-input@vger.kernel.org>; Sun,  9 Nov 2025 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762676698; cv=none; b=lJgeV8pzEHKNhAZQpKOBnmONUO3TXz5ebniHpNZZ4Moge5iueU6fHBX1rHHwyy62oh10URsHSeVYuH03joQS9Dji277AgS8gU2YeScDEE9XrYD3fLtrRNoLF0dJVc3+OPCobqI7nCmKuE4sCq2/tST8XA8dDhBD9+oLd1b37XvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762676698; c=relaxed/simple;
	bh=8QutaIOTS2UKgLlFlZpPLDmzPaijAHjAoxtwNrbsxkM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdNox7DeD55U6GEEWoLLKVrR6liecKjHFlU2NSDhXno5vEMQqgWR+aVnGtrp88yhqohuTGMJrxAAVScUX9Jow6ZDn+WCqA0B0M4TZVZD/T8CbB/ld4j/HZwJwFtIpSdlxVVLCAve8asGI4ORjHFNY5cnad1eX/rz064bjcQtEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAwzjIZk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so376354566b.0
        for <linux-input@vger.kernel.org>; Sun, 09 Nov 2025 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762676695; x=1763281495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsY9vujuUkA8+9u3dm1loJg3PkrFnGp+k0msPuKoiXI=;
        b=hAwzjIZkXo2S12Yzlenw0TuyK96zMI9CQ5FVw7W9i42ybBTGbsqdo4+KJjwlpoXzPp
         PZC22KohFVTO/LUAjhl6w8VMqmals8yTwyP6sFrhaFHKuNmi8bvOthfx0e++QKMsE1mz
         p0z2jVY6V6oInrJufK+18LThmPUFe0wQHl+6fYF9aYPNSrlP2HEd3MWieShz+r+gga8I
         /Z7UMFbxvdqMkYHsgpa+rP14R38EXhDW/H8oUrkz8OYBNoHMTMXfCS+9dBI6JzM7b50L
         oy7WnySFbn2LOVWaqyZPKHCXvqwnDlcQ0Q3crNsZqACvvEfDARXPDKhsZq6eKSPwxmJO
         dOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762676695; x=1763281495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsY9vujuUkA8+9u3dm1loJg3PkrFnGp+k0msPuKoiXI=;
        b=cPqCEuD0ggc3CxsV2UUCypgxObCW7L5Mht6f3uJz1JNfYj0lK4Ne9p31zzD5E7pPTJ
         n/9pMhED2RPfQqOQVoK9HAiIrxlADgl75wF6t6drgWQN9MGXdd+T1MijJ3z0D3YMLnCi
         dU5Hpbh1sNHkOZ7WDSj5OaWsLSpOLlHYyv/fcAJEOtWaJXEplUoJkPa/UnY0x5td94D8
         pkRPKopPLb+vZvSE26BbSWHo4VDb2SdttaxmCW8a9MrQu+4iI37knjsHjwU2WbOAJdd+
         7Lxje7mOAgljwk60KuWp2+kRFnMfaOoB+OtMoPYsg2KkzqS3KY1fRiYoTUtP8X8q6nEY
         3DGg==
X-Forwarded-Encrypted: i=1; AJvYcCVZZCSouUZReOZ4nSA0g9Tt9SrlWo2BapBJt9ibTci3QJv7gwb5pCiZtY5TN/tCNcOatKEr/X14mnFXIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1DaeNNS+FCAWTNwAKtVyEtWdXBdtaJbwYOmbUopOsfS+BSqz
	UQuQ2H2jZRZe0o+6/fKlhrcywDUOvlmDrtnyUp2QwEyzdFDVs26lGHpQ
X-Gm-Gg: ASbGncv80rH/7IvcLeY0n3Qwx3eU7SGno7t9iEvVgH6DTAVcSq7eiF39JI7v2U9jflN
	JmthYcFip3MGtVlhSRSHbHijquLpBoPr8xxH7cyj3b/JHKfQoBt6KMZQMpNfNUWqrYsVwZpEPAe
	3ffZ7yaRzJuMcVgj2RcM0ykX/GrIWsQtO+SUKPjP5nu9JIfL1BO8Cd7r1TdwSWeeSMwVAfV6eqZ
	uBRmOCIxUw4h6zOFU+cMBOffIDSqIqiSaSwG51z4JsxBZRO4jeDXHMhMfkRnVxyzy/iyQuxX6pn
	4htFLxraTL5UD/X0dRJFL5irsCMk4e96KUqt7ulYy6atmdwLi6bA7+OQCRKg5pZr3gUS0dgleSu
	uy+a9l2peqW6gjYCCL20acc5yz2L6L/dRBS030YBDST+3a4yUPe0sfJ+0je3dTEzw1h7gW/jNta
	Vm1tw38lBU8UDZh7JrtbwEAhefuj7KI9M=
X-Google-Smtp-Source: AGHT+IHaWgjaeW7jvwLPGVE4BhBjXl+cVU/lxIG2fay1zIq+LJVECaQIY3bgCDLJU8dqHSKKTTKOiQ==
X-Received: by 2002:a17:907:3ccb:b0:b72:d43a:4fab with SMTP id a640c23a62f3a-b72e05e5a05mr361558066b.43.1762676695173;
        Sun, 09 Nov 2025 00:24:55 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d461sm794755966b.47.2025.11.09.00.24.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Nov 2025 00:24:54 -0800 (PST)
Date: Sun, 9 Nov 2025 09:24:50 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: The-Luga <lugathe2@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Terry Junge
 <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <20251109092450.693bcbe5.michal.pecio@gmail.com>
In-Reply-To: <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
	<3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
	<CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
	<d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
	<CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
	<c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
	<CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 9 Nov 2025 02:18:44 -0300, The-Luga wrote:
> The speaker has a physical knob that changes brightness. When the
> speaker is disconnected from any USB port, the knob works fine
> increasing/decreasing brightness. When connected to Windows, rotating
> the knob (either increase or decrease) changes brightness normally and
> the speaker does not reboot (without needing any vendor software).
> When connected to Linux, rotating the knob causes the speaker to
> reboot.
> 
> All brightness changes/reboots in the previous logs were done by
> rotating the speaker's physical knob.
> 
> I believe this is a firmware bug on the speaker. My hypothesis: after
> each brightness change the speaker expects a particular USB response
> (the default response Windows sends). If it does not receive that
> response, the speaker thinks it is disconnected and resets.

I haven't attempted decoding your usbmon traces, but based on Terry's
comments, the device disconnects immediately when the knob is rotated
without even sending any HID packet. The original trace begins with
root hub traffic - likely disconnect notification, followed by failure
of a URB waiting for HID data from the speaker, and new enumeration.

If anything, it looks like Linux is doing something to the speaker
which makes it enter an invalid internal state and then the firmware
panics next time the knob is rotated, before anything is sent.

I wonder if there is some way to block 'usbhid' from ever binding to
this device (not just unbinding it later) and see if that hepls?

What happens if you pass to Windows and back, then rotate the knob?

Regards,
Michal

