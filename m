Return-Path: <linux-input+bounces-622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202680A89A
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 17:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32073B20A83
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 16:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8A13528F;
	Fri,  8 Dec 2023 16:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc8qMAJI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772BB1FC9
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 08:18:21 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2866b15b013so489847a91.0
        for <linux-input@vger.kernel.org>; Fri, 08 Dec 2023 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702052300; x=1702657100; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jCQaj1kJQx2qrYKp0DDSquY141tZqx5YIEXZv20s37E=;
        b=Oc8qMAJIeJhsbUEabB+LEnOfprmtXoi6bfA/OSH8IifSRNHQQe1B+TAtwb+AGjSwlM
         2H+RR21PRzzckmurx4GEd5ILhPFmSUElXq37g/4xUjm69wSFLEbkOQ86HnQxXP/xoJR1
         YwfS5/V0oI4q39LIZqXf6belSQw24PJfEFz4u8/113lpgBa0QqoHb9QXEGhF6YJAI3Bs
         /G1h2SqISK64tDVPGk4/gPBNpKfx1DDrqe/VPjtf3tur4fzmYcVgKy+Omw+ihWImeUnc
         S7gCZ0sJLTfGEoPMDfMTN1oq+aCyrw405JUVArbm69cHp4Q1VAHhk67x9bDc08423nUQ
         vaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702052300; x=1702657100;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCQaj1kJQx2qrYKp0DDSquY141tZqx5YIEXZv20s37E=;
        b=NbwVa9usdTBgXJ6ylXWdqqosQOPMKqvVZzd4BURL2mmXBvzWx4tkVGZDX67fVX2x4Y
         EDBqJq8Cimv9S/KrKYAVZRaX0s7yrGgjYcOrVNAb+S7Ct3xJttpiexoYbsm0wRjAoIJT
         MuZl3w/2eM32e7WFQw7avMOHOz1dxHEYL6HZIr1qurNoADLLpuOVDVyA07jHTnMWHtLy
         WdELZlFmWcvgif6heIn/JjqasnaO3rsMxpciri/ocLpY3lJmIPCH5TnqtK8Lhwbr21GP
         HS9UoQQzJ3Sqto8TXkZUkODqelEzqa2aEI5iwOlFnXd4qXXEjH4oJ+p5jNTIPoAd7KDI
         2yMQ==
X-Gm-Message-State: AOJu0YwuSZpPpFU+M2RGIuzV915I1BXC4gTmGzdCiqMIbNsf9qS5fvca
	lEP/lSl6kqrgP1diKApBpn3NYPywpnjEjCvwIRtzdi90P/4=
X-Google-Smtp-Source: AGHT+IGN26YhuiKaNsR5VdJnY14U+7IK8oE4qHrsw/bgCrhQiUJQSBOP5GbrSJKqXPhYBPTgIFX3BVTRRSTWmpwYhsU=
X-Received: by 2002:a17:90a:6345:b0:286:4055:63e0 with SMTP id
 v5-20020a17090a634500b00286405563e0mr654115pjs.0.1702052300608; Fri, 08 Dec
 2023 08:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martino Fontana <tinozzo123@gmail.com>
Date: Fri, 8 Dec 2023 17:18:09 +0100
Message-ID: <CAKst+mA+ROeY34G8E_hA4q35H1MWcJJqEtvdHWnXebav1dJdLA@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: use slots for led patterns
To: rymcclel@gmail.com
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	"Daniel J. Ogorchock" <djogorchock@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Funny timing, I was working on a patch for the same thing too.
Instead of using a bitmask, I used ida_alloc (just like hid-playstation does).
I'll leave my version of the patch here, for comparison's sake.
(It has no description, and it wraps on the 8th player)
I can't properly test either of them, since I have only one controller (though
every time I connect it, only the first LED light up, as expected).

