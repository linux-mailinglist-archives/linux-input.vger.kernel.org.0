Return-Path: <linux-input+bounces-7722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 170399B2496
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 06:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0D752819BA
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 05:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9588118DF68;
	Mon, 28 Oct 2024 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcxZTpQF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE1F156960;
	Mon, 28 Oct 2024 05:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730094624; cv=none; b=EtTZl7WNbef0dluwvPHeoXm6Ltq9mHrIbqK2/usTdyuocaK4A+B1YUfQ2+Xl0Z5Vw8TGIxvWCHDU841OcnvAbY2jNzW/mXX41bB8k2FMrzol9IsILMX8XOF3foTTlCCYGvbYOLiTpCfBNNy1+RYohBZ+72zPDlVGT4u4347zVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730094624; c=relaxed/simple;
	bh=6089eLmYoYCs9n4wvoEj5jL3O+euu1IPR5Om6YXpsik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8WofajZg/GPeT72ZdTglg8DYTI2ZUIhOfYsLad0J3zrnijRNV6+w8hvEhoAYvPjKdWIwBAXLgFQEq4W2qw1XXr5ubgw6B9TlBMEwNgsbbPXdnd5aa6BMlPcNU0T1U3OQJmLrRQ/D1cxcmXqCRbKboUSHm7dcdbSTgVSkNiZS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcxZTpQF; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-656d8b346d2so2505877a12.2;
        Sun, 27 Oct 2024 22:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730094622; x=1730699422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDmzN5DfzsOxVfEZOdwvRauJb5doMI+saJqSFlyjXMQ=;
        b=BcxZTpQFnp0lw67/lvAluAK+9LhNaBNtgznoB3AZ6XojEQTnLxDtnMN/QGAEw4QcZv
         ZwsVyOJNp1G/qLNi7p2ukn6jkGEw5OPHzpDJSO5W1rrEiX5ArrIozbNmfmj4s2f+3K50
         ava0uWPT9025yrFBUmt2T0ag8aIoX9WEWcLdCsKwKuYn8gjDEn2P/bLIDXw4cxkRVBl1
         XxurTI+0MGCcxfNZ0FgISJ2BloP0zzgkKDqqVaIcD+bseQU/Ije/MNThzyNYDy30mXlo
         1Lej3KDGwL9jX25/in9zC3LMGtKXhT3Yc4J6ND5QvgJSY81gfqDkbA0TEnstQLp45hk0
         Lf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730094622; x=1730699422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDmzN5DfzsOxVfEZOdwvRauJb5doMI+saJqSFlyjXMQ=;
        b=JBVIenTMFiZVovNngyFuPnMutViCOGtrSFpSiICTB+HCG7ARM/TjKDXsh0AYaasaET
         pzCcRapOuTJ9sz361w+P6lM2YqGbeSZB90MPSgFz2IcG1la8eUveb9+rmTn1kT12kXM0
         AgYbBrHaRrO9i9aaGuLUdnUkKrr1tbA+nj2o8zd1iNsJAMBSnA0FE8zY+jAAnO4Krrij
         PPAtSkGq37moPdzVtZIkYYxzjPrmXQg7YoE/c+ttQWYAKrAtlLOUsVIjjDFJ2gISmNAn
         4tNyL8PuWn7eGPiIpZU+Scu9fKRnyvDOusbkUSbytsgmph21GzHBlg/wXbo26qJWJEzI
         8eWA==
X-Forwarded-Encrypted: i=1; AJvYcCV2iQtriO9NpSmdbcp8/ZbymU5NOIWQHzYvcTAloI0EAKfcZ04dyrAkgbXk6kVypwHLMwcmUHbp+c90qH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkz13FCaXBXSeFPjeN7ZS5XhUE/YsFFW46JAOQ9uiaO5lio1rI
	pJAjG5rF59U2thmzlZM4CsOpbyOcbV9fCmclrxUs9m1+trd7RA4Zh6Vn8Q==
X-Google-Smtp-Source: AGHT+IHS7TzPyJ3jlTTpkwZmntE8lF1SJInROpJkcO4cGW6fy3Ig2oPWNSMvqiq/rJ7NTSKgts0ROw==
X-Received: by 2002:a05:6a20:bf27:b0:1d9:c615:944e with SMTP id adf61e73a8af0-1d9c615a15cmr2749603637.4.1730094621603;
        Sun, 27 Oct 2024 22:50:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e9cd:720b:a97f:8af8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e36a044bsm6225854a91.25.2024.10.27.22.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 22:50:21 -0700 (PDT)
Date: Sun, 27 Oct 2024 22:50:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: maple_keyb - use guard notation when acquiring
 mutex
Message-ID: <Zx8mGiWOw1Av28TX@google.com>
References: <Zxr4TeGwDGIIyzwH@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxr4TeGwDGIIyzwH@google.com>

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: fix typo pointed out by the kernel test robot

 drivers/input/keyboard/maple_keyb.c |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index 91a1d2958109..1a8f1fa53fbb 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -132,14 +132,11 @@ static void dc_kbd_callback(struct mapleq *mq)
 	 * We should always get the lock because the only
 	 * time it may be locked is if the driver is in the cleanup phase.
 	 */
-	if (likely(mutex_trylock(&maple_keyb_mutex))) {
-
+	scoped_guard(mutex_try, &maple_keyb_mutex) {
 		if (buf[1] == mapledev->function) {
 			memcpy(kbd->new, buf + 2, 8);
 			dc_scan_kbd(kbd);
 		}
-
-		mutex_unlock(&maple_keyb_mutex);
 	}
 }
 
@@ -211,14 +208,12 @@ static int remove_maple_kbd(struct device *dev)
 	struct maple_device *mdev = to_maple_dev(dev);
 	struct dc_kbd *kbd = maple_get_drvdata(mdev);
 
-	mutex_lock(&maple_keyb_mutex);
+	guard(mutex)(&maple_keyb_mutex);
 
 	input_unregister_device(kbd->dev);
 	kfree(kbd);
 
 	maple_set_drvdata(mdev, NULL);
-
-	mutex_unlock(&maple_keyb_mutex);
 	return 0;
 }
 

-- 
Dmitry

