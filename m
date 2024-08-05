Return-Path: <linux-input+bounces-5318-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4879471E7
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 02:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F400FB20A82
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 00:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9042319F;
	Mon,  5 Aug 2024 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml4CaVoq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A35AD4C;
	Mon,  5 Aug 2024 00:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722817087; cv=none; b=qC0pJ39IJP6Sm61TdlRLOyhGLYsi1n5SkjrHu07E+CPO19bu8dIpzgvcftp9Cl6VtNh2JAXy0fT0wAwBQfeVrDutePvQz7g/jq4SpWCIoBVbeMqR8jWxQvGx3cPApvNrPdCV0byYfB+Wf+4dU85kObSEurN4oGRS6Rl8PKym20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722817087; c=relaxed/simple;
	bh=2u5bKg32RnUE0JHYFevexuJKU8FWiAfi4AxrXvlEd+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0FOm+AVQdQNhwUthro1kpONBOKMXsyO6qyTHb9XjCV+NQGmSc7CGV/BlU3sh4AqcHtHQ0307s+pp5tqjycbqRBik0DEjr3HqJQpYJ275fs8VyRoaEpahw9Q5YFB1Sa+UCcTGMkTL9Nci49wfAQKM6QgkjuJXpYTuQTY9dU2fIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml4CaVoq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ff3d5c6e9eso42414795ad.1;
        Sun, 04 Aug 2024 17:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722817085; x=1723421885; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vo/TexU9VIWSnzqTJ8Eucg635MFh0vJtSlaI7PhSbhg=;
        b=ml4CaVoqzH3a3a9lyWnJrfM29OnT2GZeqSVG61r0cg7nlKvhqDDHRjcb23lcDb698h
         HmtkxPPGmJJNOHPYKX0W6GW8/WB7MUHkkycvRw0K5NmL0UGGNF9MDfUTqV6VViBxTAyM
         1YBpHWh4rGt5XoOJf27QN0e3teZ0TQDa6sHY2lc1m6xMfdJl1plDiop95t/cQu2tGqq1
         VXgFLwQbgKrLgm/MVRKybvXas2lc+FiHRLbJ/1nDv9LH+WXE8tiSwhTj/Trha1S9gGXC
         qm8Fw7aKrQoQQTCsA98BfhmiBesKgNdnMOuxx08lCEH8sDRkbIiYSIQr/8fCkVclf8Fe
         07+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722817085; x=1723421885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vo/TexU9VIWSnzqTJ8Eucg635MFh0vJtSlaI7PhSbhg=;
        b=f18VmmnG/dhf6838ZZuOfP9fJHsfdcdVp/3t6ej/+4RISw899YCtMTCs2ZBuA5a/QM
         /lmIs8mkdjti850rJd2SKJ2YaCvhaF1flEVGQUS92fKioyQFwX35hqGIJEVPZ1+gav0L
         PwuQWBYh436BYGZtJMGDVI+W5KzJPHooViUuwNmE66XqU38465uF+GWg0gywykCtvwqg
         Bf5smMVBPbtI9etrCJ83qRiqtlDH0gDVxRPfqhxdcv6dDtFR/hV3zMty9GvwiuoF77rl
         moWS99Hz5iYIynxHVVYlYTb0HtzVzwEklSW9e4F/sxt0dCoWlMvOIEvravMIvCmTH8mH
         /61Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7QnSY33Cm1A2JdFNPZ4YMYzlkzSoEyF5rSfahskA1k6udHEbFrxCWABuXs9IGGmfg+lV+F5dhFrGZvdZaBG+bgGDDrl5lNEMM9e7O
X-Gm-Message-State: AOJu0Yzs37ij+1w7quN57Xa3YmPUWO3NIjxRux+1kDxUJR7AeC/nObkA
	iCUKW9E3zE83K4BWzjJ8Vw1/zlKr8c/kOOzhUCE7o8pF5VMeMM3a
X-Google-Smtp-Source: AGHT+IEAKl/AU1kenLjH7lw7HfcO9O0ZZVmyOb3nlO5CMDcRISYJXaBAvoL1IN8WnYfAYDY8knlinw==
X-Received: by 2002:a17:903:22d1:b0:1fd:7097:af58 with SMTP id d9443c01a7336-1ff5727d560mr97301965ad.11.1722817085318;
        Sun, 04 Aug 2024 17:18:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f6d093sm55031575ad.117.2024.08.04.17.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 17:18:05 -0700 (PDT)
Date: Sun, 4 Aug 2024 17:18:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: cyttsp - stop including gpio.h
Message-ID: <ZrAaOu_vf-cVBhRn@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver does not use legacy GPIO API, stop including this header.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cyttsp_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 132ed5786e84..3e77cca4f5ca 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -17,7 +17,6 @@
 #include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/property.h>
-- 
2.46.0.rc2.264.g509ed76dc8-goog


-- 
Dmitry

