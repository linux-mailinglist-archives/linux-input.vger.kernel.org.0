Return-Path: <linux-input+bounces-9080-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE7A05E6B
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 15:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E4C23A072F
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9531925949D;
	Wed,  8 Jan 2025 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLfe3DtK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC48F6B;
	Wed,  8 Jan 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345918; cv=none; b=dW6nZAxCfkIyGNVsuzPb7rurkzWE9/VUi9sxt/KhsEGx9d0UaH4TzVt5sK1+6uVuE7okpAu5KAWNsv0FguZm4dIKyI1Tw2iLzlY+hq3SPnO36m9InUXdv6sP1GXSK4e4LheqQ5pkzQSkYYlmRbzmVyK8bqc9DVBSKXNd1QyMmJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345918; c=relaxed/simple;
	bh=8eoWSNUdXEOyEDkIBCthZaz3brfvVCqy/ghuZm+/be4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DlaDKN5R5c3jdFAWcLIPhdcDmTt5bqco4nIjS7SShQiha1lxbPcBEqkDauKeALbEvs1hRj+uee5m/ChHLj0mastkraj3RM3qDcIi8dmVecQBLaoSDsgvsQ+TxceYf2LSm5OIChX5WO2SkvObbBmYqNBTlfEL3FPf5DvucsQWgxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLfe3DtK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4362f61757fso166906715e9.2;
        Wed, 08 Jan 2025 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736345915; x=1736950715; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Ew6GZzOKJTWsW2/wdddy6D++YdqNgbSd4+cs8h112o=;
        b=YLfe3DtK+7g3HJB2XU2Kdco9lPjN8myG1Ekh6cavIYuJWW4NLOBPIeHod9pi/fF2WV
         7VsjbQ55acAYeUSO2DOKv6PdLCxKb7RWlHpO3vQoatCunxImA2Amkdcx7QTBjfT6cwZP
         PF4ZdgmxW0l3HL9FUi7FJ13LF2ldmPenvrdN33EUjFSXIus/bW0seC4SeJIrgx7ANN0J
         r5FKMS0P9pGxTMq5sO4YWzcxmTH1RiLHSKzdHKMeNQjvRRqBgB7sSihULHe5TYs8VTZJ
         tXGfuWBJ0DtVTHKKttk0t3wwQHbs++0mLv7VCWfmXiZ1uVJJmZPvL7VpoLMOjLzEv6aA
         33Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345915; x=1736950715;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ew6GZzOKJTWsW2/wdddy6D++YdqNgbSd4+cs8h112o=;
        b=W/EJr/KdHnSJUrzoCPDy7GlhVQUdJNbZgUJiwBUVRJ6bATQ947Kzrd/VwiQxK0SNRS
         WQ78BypqbfUGbMS56KwP8zAhnML/ENRivIlFKaxcAuYKf6uTQfgp92yDArEc3AfuCjgG
         uzFZCjQny+rXhPa3vDcODYH8j8RyInk33KkJSes7raqtBq+zZKijGcBMZqKhNVFZ3JsJ
         K+cg9Q1KBYTbr+tWY6QCWDnmWgMPSqES2pCwLRAQbUEm07M8DpbeUHLdmnado669wHRE
         N/EtynRcaHh5FQ2h/LAVetjfaNaAup+cNT3LcZySNMiORI6/o9DxH/Bu9URS3ZGV3uBU
         FD5w==
X-Forwarded-Encrypted: i=1; AJvYcCVBw0PJyVdL4obtyUi32bk12tJwkTRzoYGhAM38dyJ1EcOOOlJvyUb2nSd35oxGPuWRBlzQk73dEH0i+eU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOLUiYtgsqd0cblgT7f/Qc1UWYvoqI4ycKRLwXlCzyWrQr5mr
	oqHHWtOIJIczndz/2qepihY6BwUXs1rPgA/H3QMEdF0Z9bpYkBL6
X-Gm-Gg: ASbGnctrnoKKbfkS+rrKBuhmmmgyuLL8DAE3ZX0NvR9uhN4VIamXR4XaIQ8XkxQFaEh
	hwB1lsYXMVQUkuMQy3nVRX/nivmQ0iAgSLZvoDf5h+Y4RaLx1vwrXc9sgeRKkbHrkK+f0FWPeDf
	/bsquZB11S9yDKmF1MREFGuEmWjwuprSgLazZBQeiuh52kkwIC59TrlIYIxtkla7zJMCqYC6mlg
	qIZF7HI0L4rtOoPk34QMf+ne8j9zCjYeLnmLS1X7RWxiCH8K2fk/t2pHTPy
X-Google-Smtp-Source: AGHT+IEON0Z+j4lOs5k2SdwuaMhls7WLJBy+vzf5MD1q3cqHW4B+7HSKi0s3Qj59M4Spvkp6yO4BWg==
X-Received: by 2002:a5d:47a9:0:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38a872de5ecmr2906438f8f.20.1736345914554;
        Wed, 08 Jan 2025 06:18:34 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:8d2d:4e56:ba8b:6d36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e0215esm22564095e9.28.2025.01.08.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:18:34 -0800 (PST)
Date: Wed, 8 Jan 2025 14:18:12 +0000
From: qasdev <qasdev00@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drivers/input: Fix null pointer dereferences in
 input_ff_create() and input_ff_create_memless()
Message-ID: <Z36JJLAzwsFpggz2@qasdev.system>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Resending this patch as I have not received feedback since my initial submission on December 25, 2024. 
Please let me know if additional changes or information are required.

This patch addresses two null pointer dereference bugs detected by KASAN
in input_ff_create() (drivers/input/ff-core.c) and
input_ff_create_memless() (drivers/input/ff-memless.c).

- input_ff_create() log: https://syzkaller.appspot.com/bug?extid=dd5f8d6456680e55eb0a
- input_ff_create_memless() log: https://syzkaller.appspot.com/x/report.txt?x=10a51adf980000

The root cause of the null pointer dereference in input_ff_create() is
that it utilises the "no_free_ptr" macro in the line:
"dev->ff = no_free_ptr(ff);"
which effectively sets "ff" to NULL and makes "dev->ff" point to what "ff"
was initially pointing to. The code then attempts to incorrectly utilise
"ff" after it has been set to NULL causing a null pointer dereference to
occur in the following:

"
   for_each_set_bit(i, dev->ffbit, FF_CNT)
       __set_bit(i, ff->ffbit);

   /* we can emulate RUMBLE with periodic effects */
   if (test_bit(FF_PERIODIC, ff->ffbit))
       __set_bit(FF_RUMBLE, dev->ffbit);
"

To fix this I changed all accesses to "ff" to be "dev->ff".

The root cause of the null pointer dereference in
input_ff_create_memless() is that it also utilises the "no_free_ptr" macro
in the line: "ff->private = no_free_ptr(ml);"
which sets "ml" to NULL and makes "ff->private" point to what "ml" was
initially pointing to. The code then attempts to utilise "ml" after it has
been set to NULL:

"
   for (i = 0; i < FF_MEMLESS_EFFECTS; i++)
        ml->states[i].effect = &ff->effects[i];
"

To fix this bug I moved the for loop before "ff->private = no_free_ptr(ml);".

Reported-by: syzbot <syzbot+dd5f8d6456680e55eb0a@syzkaller.appspotmail.com>
Reported-by: Qasim Ijaz <qasdev00@gmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=dd5f8d6456680e55eb0a
Tested-by: syzbot <syzbot+dd5f8d6456680e55eb0a@syzkaller.appspotmail.com>
Tested-by: Qasim Ijaz <qasdev00@gmail.com>
Fixes: 5203b3a18c1b ("Input: ff-core - make use of __free() cleanup facility")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/input/ff-core.c    | 4 ++--
 drivers/input/ff-memless.c | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
index a235d2eb6b31..d9995f47efdb 100644
--- a/drivers/input/ff-core.c
+++ b/drivers/input/ff-core.c
@@ -322,10 +322,10 @@ int input_ff_create(struct input_dev *dev, unsigned int max_effects)

        /* Copy "true" bits into ff device bitmap */
        for_each_set_bit(i, dev->ffbit, FF_CNT)
-               __set_bit(i, ff->ffbit);
+               __set_bit(i, dev->ff->ffbit);

        /* we can emulate RUMBLE with periodic effects */
-       if (test_bit(FF_PERIODIC, ff->ffbit))
+       if (test_bit(FF_PERIODIC, dev->ff->ffbit))
                __set_bit(FF_RUMBLE, dev->ffbit);

        return 0;
diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index 0bbeceb35545..ce9fb88486ab 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -524,6 +524,10 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
                return error;

        ff = dev->ff;
+
+       for (i = 0; i < FF_MEMLESS_EFFECTS; i++)
+               ml->states[i].effect = &ff->effects[i];
+
        ff->private = no_free_ptr(ml);
        ff->upload = ml_ff_upload;
        ff->playback = ml_ff_playback;
@@ -538,9 +542,6 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
                set_bit(FF_SQUARE, dev->ffbit);
        }

-       for (i = 0; i < FF_MEMLESS_EFFECTS; i++)
-               ml->states[i].effect = &ff->effects[i];
-
        return 0;
 }
 EXPORT_SYMBOL_GPL(input_ff_create_memless);
--
2.39.5

