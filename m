Return-Path: <linux-input+bounces-360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6A7FFE6D
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 23:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 795DA1C209C0
	for <lists+linux-input@lfdr.de>; Thu, 30 Nov 2023 22:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4432659142;
	Thu, 30 Nov 2023 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gEOTIOgt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6466210DC;
	Thu, 30 Nov 2023 14:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1701383109; x=1701642309;
	bh=kDz6GRm/hWtSvVtD3dqxU7Yl5I9tqNGfec+dHcSxHzM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gEOTIOgtDWmLB5lg0FeZ9PAbtjBHoYsmI2Do/359hGHwBUHk91Ae1xAIZt6W2r8Q4
	 nUb7Hki00P2pDsubO+5J9jtCAjy1Srnx4hd21x/NA4z1ZA2WCG/Ye9opRtfmFNAU2M
	 QpfDV8qXb8TA6x9mlCamOOhD3mCbwI8ZOwfxh7kWty/d21ug5BhhPVubowCcSEifW9
	 A3qxsLvNloK8XaRu8Q9v1DURx/1R7HbhypGJoGXwLYvmHo2AZvtGjuVIW72TpiFKVJ
	 KJE/QcHpXaK3wA7gJG1gAPpjVnKCQLItGBkXlZZqkqnQxCHO/9xXoKGTqLo7KdlcXW
	 2v7uQvu55gzgw==
Date: Thu, 30 Nov 2023 22:25:00 +0000
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
From: David Revoy <davidrevoy@protonmail.com>
Cc: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, Eric GOUYER <folays@gmail.com>, Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>, jkosina@suse.cz, jason.gerecke@wacom.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
Message-ID: <xG1_-ipfam98DC9VwbLcH9Rnvu8MbVw9-fWMLHN4hKquTDdAL-nFDpLcf5ZsMQDD1WBnT39Uqtopi42ZWjrKfdzv8D-iMJZgRNln_W5VE3M=@protonmail.com>
In-Reply-To: <CAO-hwJKnH=Brhq7Jv020qQLROarvFiewnRb__0ZF9WVqDuqxLQ@mail.gmail.com>
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm> <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com> <CAO-hwJJ+nx72_TPfxcWRPBDZdDaPrO5yMNH4Y_mj6ej651Mesw@mail.gmail.com> <nFHw6XePiH5p60JsbQSbssRkiuABiTiR_n5fIYFZjPgkV3ObjjZuwTC84BJ_1vXYVufPbG3UvZ1L7ODSrrGlq9CrI7BTKhsV5QeAQoakV18=@protonmail.com> <CAO-hwJ+jwmTE-v7FsPi3f70mB8SqUha7Ek9DtptZ0auiFpGM7w@mail.gmail.com> <CAO-hwJJoCp0_kxf_HHN9n9EWy9YDSY4rP8ysYNrNg2xTUYtKEQ@mail.gmail.com> <evHI05gyKuWwynY1WdyVvXqKPUaPE8W34cc3tFfp9FWh94TWfA9FWfHun7AAscF9lqfbiYsLKGC7kTSZ9xWNZg88-PTpbGTLcFMc9D3P2HE=@protonmail.com> <CAO-hwJLinACPsk=mEHrEz_YJroknmm=9PcX8byHiqEDxqOConQ@mail.gmail.com> <CAO-hwJKnH=Brhq7Jv020qQLROarvFiewnRb__0ZF9WVqDuqxLQ@mail.gmail.com>
Feedback-ID: 5460171:user:proton
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

> I've updated the HID-BPF filter, and you can find it in the latest pipeli=
ne[0].
> I've removed the extra "Stylus" and you should have a better
> experience with the upper button now.
> [0] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/jobs/52148274

Thanks for the update!

> I think we are done with the XP-Pen Pro 24. But now I wonder if the
> Pro 16 (gen2) doesn't also have those glitches.
> Could you send me the same debug sequence as the last time
> (transitions from/to touching the surface while holding the upper
> button) but on the 16 now?

Sure, here is the same action, three time but now on the Pro 16 (Gen2):=20
https://www.peppercarrot.com/extras/mailing-list/hid-records/XPPEN-Artist-1=
6-Pro-Gen2/2023-11-30_XPPEN-Artist-16-Pro-Gen2_pen_tip-contact-and-press-re=
lease-upper-stylus-button-while-pressed-x3.txt

Have a good end of week,
David.

