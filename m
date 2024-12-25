Return-Path: <linux-input+bounces-8774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8169FC6EB
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 01:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E91E1881E71
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 00:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7E114036E;
	Thu, 26 Dec 2024 00:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvkorTxJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C71304B0;
	Thu, 26 Dec 2024 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735171213; cv=none; b=Gb4gJ+6ErN4nEYw5VPYJj7RLsNVQeU0GLfo0xLDlJvx0UeXfwK7LjWzmmU4M/mSOAp7n4LQZm2HfoPkcXdaE1b4mR6azAuw5UCZubbpeOLcbmq4VFlzNLGd3U+4r70Fg+o46kzPVfld5tusU9zfaidO9CVDLX3JnKKd9rOuPSSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735171213; c=relaxed/simple;
	bh=d1AsfjqoYThxP5n/3D7szp5N5+Cn7vUNNgM64kRwT74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjLj9154K7nYOdEbUokiT/QYT64NTRWkUy/iM/Y65irCZLhPwgxm5OMqbHIxsXz2aojXp9MJ7h4IeBeoyqhf4iVbxfgZqUNpT3tZyX6dMVGwC2bwkPG+D2ZwQ8nZjq4GHbjDOa1VDw4yVfk+c25r5gehMKh59mDj3CTMOP8s+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvkorTxJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso40721235e9.0;
        Wed, 25 Dec 2024 16:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735171211; x=1735776011; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Xi2ylbv/Y/sMb8tL0ZV1pBOqJMcnlsx4pQhhyCTKTs=;
        b=fvkorTxJb1t/KWhXQfG4mlM+37MO6+gZNT8P3oQf/NtKWwa+SgnAuZXO5XMT0njYXS
         TtYvstlHVf2bR48dlojT2TSygskSBIA/Eo6r5vVdOm0ffKso2KysHvq13jgnSe/srUSl
         TnSd8CUJJP/EHHFaewvD2ixPKv9AoAZ3MmLta6LWadmhEGp/ohDRGxKf2OueTjwxoZEM
         as4LdFpwmDe7z+Ye2oAQEIrjsCxN9SG6FmGWJJj0IAL/57yZmBj95Inr72y5kU/KCatY
         4ErE1PXlnAvuYIwlpS8PfSuwt8QrWet6HjoKEHfedFnqB5CoXT5p+WGFz7GMcvmJUWRT
         5LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735171211; x=1735776011;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Xi2ylbv/Y/sMb8tL0ZV1pBOqJMcnlsx4pQhhyCTKTs=;
        b=IKGLuusOWvcpaBbhjPBs8eooEziwr/H44Et8UGdrZgUlF9gPGaUM+U6D6USVmEE4x9
         bZNDQnlF8p2G9pH1laqfEudMoFZ9iXTj6lQBqJyExa7ToSBNC1x4keVQAcj/8MDsVQn4
         8p5LUP111XxvLljFyUIfOG9yK9bU/2qRZpTihId37UR5mmVKDMetLu/IOg4IoN0YCPec
         BNTNyzJW4U1pOG3vV04WOv/F7PYYhJPwXY/gphuhUkCLPZCKHg/gLKSCb1L1Q4N5X8cf
         AMsA+KC/Um5ZR6z4QuGXLnGwBi04prtmgjm9HpAGqay7gaXTJn680HQnQKjouy72wwu1
         wgnA==
X-Forwarded-Encrypted: i=1; AJvYcCV1D8BQxOSeX9lb2M8uLmsY3QyJTYFEPiOpJERpvtgqn4UK/eA/shrbbBfmonRntWaXvmrh329DMvPqIDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAIlkqOLzSaMGBwdug6CqnTv5H9nxM/8ghazhogQIbyfmnNnQU
	6I9wg2uVwWJlcVgQko+isDC26/p2itYx7IhSpF9emn7wncXNpQDt
X-Gm-Gg: ASbGnctgLfri/wUlQCET3h19Vfk3daORs/YKEFQtjtW7aFjZQCv6zdIo9vR+W/v1Epq
	pwo1yRUkdSUe5WQmuDz/jG1BrGiREfukvjwY0V2xVbnbBM4/q4GfTbdG3TJiFfJ7JdU0doNTHvr
	jvIqBABizp9atZKH1TSBj9zpsdXVbrWFPL+Mo5lu/Qm5mcpCT7PzQbq5ijwkpm+k6Obu7m94emj
	33knFBngkw8d72kWHepb2XlwsNSoreX1mLwzbh9DHCODAGewKjRM4+SeNg=
X-Google-Smtp-Source: AGHT+IFTwIbj/9EVoDTAbkttkqXKPBUQ+EBDbxI/6ISnpz9wctXkT7hldhAvQ7LkTKShsh9YVlyT/A==
X-Received: by 2002:a05:600c:3b86:b0:434:a1d3:a326 with SMTP id 5b1f17b1804b1-4366854848dmr168452615e9.6.1735171210293;
        Wed, 25 Dec 2024 16:00:10 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:ee5d:263e:ad4:9007])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8472d5sm18299139f8f.47.2024.12.25.16.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 16:00:09 -0800 (PST)
Date: Wed, 25 Dec 2024 23:59:48 +0000
From: qasdev <qasdev00@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/input: Fix null pointer dereferences in
 input_ff_create() and input_ff_create_memless()
Message-ID: <Z2ycdA6j6oMvj7Td@qasdev.system>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
-		__set_bit(i, ff->ffbit);
+		__set_bit(i, dev->ff->ffbit);

 	/* we can emulate RUMBLE with periodic effects */
-	if (test_bit(FF_PERIODIC, ff->ffbit))
+	if (test_bit(FF_PERIODIC, dev->ff->ffbit))
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
+	for (i = 0; i < FF_MEMLESS_EFFECTS; i++)
+		ml->states[i].effect = &ff->effects[i];
+
 	ff->private = no_free_ptr(ml);
 	ff->upload = ml_ff_upload;
 	ff->playback = ml_ff_playback;
@@ -538,9 +542,6 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
 		set_bit(FF_SQUARE, dev->ffbit);
 	}

-	for (i = 0; i < FF_MEMLESS_EFFECTS; i++)
-		ml->states[i].effect = &ff->effects[i];
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(input_ff_create_memless);
--
2.39.5

