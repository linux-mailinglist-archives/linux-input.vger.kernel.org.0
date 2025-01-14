Return-Path: <linux-input+bounces-9228-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD31A108B1
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 15:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C4C1889FDB
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 14:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C36514600F;
	Tue, 14 Jan 2025 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jurpx9Tp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C4F13E02E;
	Tue, 14 Jan 2025 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736863738; cv=none; b=Wnux/iYS9a9a5Fabc47PQIqh1vK6sznglEI3lp/4uGdrlUJn6dihU/JZ63S41t8DfbsmVjJsf61CXU5Eo8H3Ff0aXouYMPmRnP6zAuiIHKy2Yi2xlZxNucfqa16Dk28fcybJtcXWqOeyie8lzdCg0GU1c7HYTCXH9FmRvLKySCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736863738; c=relaxed/simple;
	bh=LKLfIkczdAeAEqoQum/VH0YMDdlw2/4likL6Vp+GRnA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdsezGjQj1Us9R7Pej6Cfq6LEZ903X4Tjj6NUjG6zj+shgqz4VHkwVwDjIHJsY8qhcDmLoWuRdo49b1hq9Z0S47ciNkMyliyxUHQxqwPX0Kgxf9esXHDN9PEzGbCVHf8dlz4OgFnrB9R2VDu1n5FCzX6v0RRSC4iBg6O29senDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jurpx9Tp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso1064019366b.2;
        Tue, 14 Jan 2025 06:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736863735; x=1737468535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb1b/9RqdKd5KXtgNSScAQgWp7C/b3VuxIQL7OqFmG8=;
        b=Jurpx9TpQNlRflh0YdEdXlLCXsZeje6G6OjTwLaMuIbDwFy25/uT8/mi0YZtIPpF58
         vcy01Ps12qNMWRXDCvO0DXwaRNfD6NX7atlTohafdCceCmtLpmDdMGKgntAbvxMFZxuw
         dGIJlptf3su5AdBDCJy3Vk679IBwKc6EHEVlZiESOyDr4BFr0FOnjtADxUun1kXEKkqe
         g6fsgZfQrnWLsx29j2vCRXm5NKGRhY0+9bSf/1G/kVYlBSf15PdCP7rVqTCqhZJR4PvY
         ig583Ce/vP0ljxu2qAshtj4+L2Jck+RlvN0p/whGzTDMbPF2DxMZEWYuXCoJUvliEoHJ
         S0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736863735; x=1737468535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb1b/9RqdKd5KXtgNSScAQgWp7C/b3VuxIQL7OqFmG8=;
        b=g7QtVdmSsZX8v+L9tAEFSGafAHJ8ECZSOcMiDyXt9tR1NUlMEnKrTF45MVQCJJo9Q4
         LsKFkyeG1vlQ31TSwZ0SM61v0DC0kUK9mR0QF4yVDzs2/aJBKQwR+ROhDCOy1Q4LUSLq
         WiA5ZZ+byeUs5ChJe7H+W0KuMLZn1ukCn2BjzQK8kAyxKGvmcyYYSq+gJMSbfMZngXzZ
         LByV94V4+xxtFMKggHwYRzkpetspaUN5+v0p4p1SGpPTLyMAKKCTwmJ5CetqO6bHDnSu
         M/WWopCityNtsr+EaXptORXs/sGnI5a9rh27/lkHKxHO0++5yTUiEZ2Gzo9DYkK8AoXN
         0SwA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Vf/rtmmq6AQ7Jx3h8s22hdReYqUNmFrZGSItbEgY8AwQK2DT+XrTG+q6/Z1t44Ftf6famE+yIIJHNy3v0w==@vger.kernel.org, AJvYcCUBrInkz870dzIJbzRQwJuYKG297QYQvPwXiWPyS2cfyv3+N1XFWDlf+PSD70THJKDRXHb+aCO0ps/cDvc=@vger.kernel.org, AJvYcCUniEMLj8i8+SMRWidsYyVEh0unfB/bgNNglIGDGTp/BG024/k2lQtYGnDIMYlbobV+phbsgwfmRtNSoXA=@vger.kernel.org, AJvYcCVEwDj1LxljVlo1s4qpDZs/olapNMudWRjjxdy8D5RX+zERj8Qt5rk9tq/tq6C+kL5R2NixjRunpfwQ@vger.kernel.org, AJvYcCVjNhr7D/6/HuPoQwrY35p7uld/pyIQ5qAZ1+7LmQNBoCGI6rFCPNy9Bj0EABTmo3uH1OXByA4/v0RF@vger.kernel.org, AJvYcCWIbo0gKRFx4/ssxv8RnE5b99MCAaadutgjVwoEMFDPLimjlYjPyW6Rdtbch3IVj/KwAczCPCBiGTNU@vger.kernel.org, AJvYcCWa9uBzll5iOTeYo5YDbs71Z+Hwh1WrihTuIuasPtvyyBpAI4N67v63wh/4wj4NEpQItjhyCksbAiPQQ+As@vger.kernel.org
X-Gm-Message-State: AOJu0YyxMR6fD/PUNUFUOseLKtOGE1VdEv8RgfR69j+SR6H3gaSb2HDl
	S1hUv/IjRRW9LKUTVkPRi0jksAIBTkci9NwpaA0bPK6nlmaNVTsk
X-Gm-Gg: ASbGncsp2zXKh1M3DhXB0+PgnAJ7SD/Evb4rxtZUS6wnASmJ9re3c+taDclQc/lhrGn
	giPKbsLMziTQfui5rgEOacFRscluLUEmkMGwRyNta5F/EgDwBvLaFFXAGaHlKX+lrcGLHHisXTg
	6M0YkGl8jBd+kl1t98pIxvtRD5fX5Hz2k6Im68XQkvbosjHRt50XF7P7M0A0xabHR8GiSo3AnyM
	eh3tIYbIIe2XCr/bD0jZFZFkyc12TDAgYKjorMTo3x3v6f/jPw9XAmng/L1TZ/RjMgJjvbO6A==
X-Google-Smtp-Source: AGHT+IHg+26ImkrnaHx4f06Z3uIYfL6CCoYkDwVz3k6+euEU7ujJitxiK1iLBauB18LY8tUFYwPmBw==
X-Received: by 2002:a17:906:f59a:b0:aa6:9503:aa73 with SMTP id a640c23a62f3a-ab2abcb1135mr2473124266b.51.1736863734231;
        Tue, 14 Jan 2025 06:08:54 -0800 (PST)
Received: from foxbook (adqh124.neoplus.adsl.tpnet.pl. [79.185.141.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9647299sm640635166b.177.2025.01.14.06.08.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jan 2025 06:08:53 -0800 (PST)
Date: Tue, 14 Jan 2025 15:08:47 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <devicetree@vger.kernel.org>,
 <dmitry.torokhov@gmail.com>, <gregkh@linuxfoundation.org>,
 <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <mathias.nyman@intel.com>, <perex@perex.cz>,
 <pierre-louis.bossart@linux.intel.com>, <robh@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
Subject: Re: [PATCH v32 01/32] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
Message-ID: <20250114150847.1c3c9ebe@foxbook>
In-Reply-To: <f8a9e454-72f4-4979-b29d-109700b2a204@quicinc.com>
References: <20250113143632.63c52d74@foxbook>
	<f8a9e454-72f4-4979-b29d-109700b2a204@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks, I think I now see how this is meant to work.


Cover leter mostly discusses the ALSA side of things, but not low level
details of xHCI operation, such as who will be ringing doorbells and
how, handling IRQs, updating event ring dequeue, or handling halted EPs.

So for the record, as far as I see:
1. There is no API for ringing doorbells or even getting a pointer,
   the coprocessor needs to have its own access. Fair enough.
2. Same for event ring dequeue, but the driver must clean up leftover
   unacknowledged events after sideband operation stops.
3. Linux IRQ handler never needs to worry about sideband interrupts.
4. Resetting halted endpoints is not implemented at all, I think?
   So this code is currently mostly useful with isochronous.


And the 'skip_events' flag only exists to enable ring cleanup when the
interrupter is removed? In such case I think it's overkill.

The code would be simpler and its intent more visible if 'skip_events'
were a new parameter of xhci_handle_events(). Existing IRQ would call
the function normally, while xhci_skip_sec_intr_events() would use the
new parameter to suppress event handling in this one special case.

It would be immediately clear that skipping only applies on removal.

You could completely get rid of PATCH 01/32 because 02/32 would no
longer need to set this flag on the interrupter, and the 'if' branch
adedd by 01/32 could go into 03/32 where it logically belongs.

Just a suggestion. I simply don't see any need to have a flag which
causes events on a ring to always be skipped as a matter of policy.
Your code doesn't seem to require it. Probably nobody ever will.


Regards,
Michal

