Return-Path: <linux-input+bounces-3456-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348F8BBF1C
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 05:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80B5C1C20AEA
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 03:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A34217CD;
	Sun,  5 May 2024 03:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCMmv3MM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2573F57CA1;
	Sun,  5 May 2024 03:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714879563; cv=none; b=dx8k2eWlv6xy8Lfz5i5aurxo53HASMUc4UpxjdMlmGx5Lrc/8wr3zsTrVmn8O7DJVnnDeNh5nkw1jUAcaZ5r20Ct1DytORhbsF8J/LO1pJzp46tuJA0eo28rVQ4vyl+M4Ke8bbVz7h0L32E+r2Nwrd2FnCt6pBwExet4ACSm5BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714879563; c=relaxed/simple;
	bh=qwhxciGn2PipbrhsGf+RvM7M0cAKkc2iSkWTiSfsEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6mVRFQINYD7x71Gy9LGkSJgTkuuND7lGM8569KXayM7njLaV7pAKIiIhZ9RCdlppCjNqw31DzbcBNNdrX97RiQTLDsj44hdJFCoanBDGFlEECSwAYpHOacHLbN2ydj5zaqRxBLJ+P+IrauXEOPHihAQGwVaktvppKtYQNB0Qso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCMmv3MM; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c8317d1f25so580110b6e.3;
        Sat, 04 May 2024 20:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714879561; x=1715484361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyJIwsc9SksZNB9Kcpl3KAmQCI0F7dWlRViskv6/xSA=;
        b=cCMmv3MM6R/peX9wSOmEqdRjwPi2QuC+mj80yjtqfh3NNaOS+xZfuCwMUzWlGFy96D
         b0N9LCXb26Dlkv7HBxN8H4Xw0qw2/B5TvCcgVNlbUPW8DcJluSrwdZ/1REQKGHVK/FNp
         568+rX7W4k4CQCbFJdXx+qHL5gShv5/6m42QaxNmB6Kq8D0SwE7Hb6TxuXxbhtxA7gsS
         ZK7xY3U1iAbD35Akvs5PzEgGfjzt0+dwff1ak3sES3N2zUYfvUrE3rN72yQJGrfEWXyK
         1mijFKMA1yYYP38fZ9MwgOr4/1K+5CpZtiCEwhwAE28HQKNXkZKgI/kSNo9y6xjG3zj5
         al2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714879561; x=1715484361;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyJIwsc9SksZNB9Kcpl3KAmQCI0F7dWlRViskv6/xSA=;
        b=L7yyOESfNZfh24smoDDjeQ0vewGyg+6vGlcEE+eP8nEeq/vTVgclvjQS8KmrR2KIIh
         qP9/iKwiX94JToqzCRuTQIjrwCVP9qZXmIF20uMjdPcITr9cFC1huXhpPlSc9Y4DMHOh
         GKWaIwNOshN2XR4/OP4766VQ9m/wpIQDjiry3PHjXAV6AJyjfo7Zcm3mzU7oJQGLuRXh
         StDqiPxBORIbE+de20t1vy+fzL/bbNOCXjfopzMGICTVOMbfxQvJH3kWFrPPTVHLcaTR
         6KPrkQB9Lv/ECJv0Aw/5aMQh+loxBeblfn0Hx2DNU6ZRjqHBwXOcaLABBWNtLipb56dq
         Ackw==
X-Forwarded-Encrypted: i=1; AJvYcCVpRWujzqU0+dPTcuSA9DIC2DnlUKV2fXFzegJgnbkQ9h9Mp6syhWYh6jwOs/nEAmdsBZ6fpEy6lLvecfWcjND+Sg9VTn1ZJ/hBoa0=
X-Gm-Message-State: AOJu0YwK3ZzYxZV89wCIvSLkG52MI2lbFkngEfUSvZU99B8rTPO5hKGP
	ieKkWHoTH5skHUXbaNtdHRfeg0sLVvW7L33/iNdO776fZ8L8+hU57plilw==
X-Google-Smtp-Source: AGHT+IFQ9MpIfoSbFw9ZetnVpORTn4QV6Vk0afKnm1IhVyVO2UEHSUQoh5yzxlzB7G3RF1u0TyplUA==
X-Received: by 2002:a05:6808:1894:b0:3c9:65af:1935 with SMTP id bi20-20020a056808189400b003c965af1935mr2493289oib.29.1714879561165;
        Sat, 04 May 2024 20:26:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4d8a:a433:4df7:fed8])
        by smtp.gmail.com with ESMTPSA id fd18-20020a056a002e9200b006f44d32fc4bsm3479328pfb.78.2024.05.04.20.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 20:26:00 -0700 (PDT)
Date: Sat, 4 May 2024 20:25:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.9-rc6
Message-ID: <Zjb8RrOFLHFSk_Gv@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.9-rc6

to receive updates for the input subsystem. You will get:

- a new ID for ASUS ROG RAIKIRI controllers added to xpad driver

- amimouse driver structure annotated with __refdata to prevent section
  mismatch warnings.

Changelog:
---------

Uwe Kleine-König (1):
      Input: amimouse - mark driver struct with __refdata to prevent section mismatch

Vicki Pfau (1):
      Input: xpad - add support for ASUS ROG RAIKIRI

Diffstat:
--------

 drivers/input/joystick/xpad.c  | 2 ++
 drivers/input/mouse/amimouse.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

Thanks.


-- 
Dmitry

