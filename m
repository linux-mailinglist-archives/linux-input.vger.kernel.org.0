Return-Path: <linux-input+bounces-12170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 899BDAABB6E
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 09:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8452A1C2452B
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 07:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85A321B90B;
	Tue,  6 May 2025 05:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ncnQjlXl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EC522F01
	for <linux-input@vger.kernel.org>; Tue,  6 May 2025 05:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746511137; cv=none; b=iKJYvHc164J8jkLBm/rswJs/2UoZD3BSNupyhpjNxrqKw1KjbHlXBcbpRPoXu4jM0YWxuMhUc5rs9wGk4QQaDi7AuOl+83V7XJ+9tQI7k5XoVG6FamBCj/RLFErrSuU5YOOVTuDh/lvORKVPUOHm+u0cV65eH1FpxcZ0wKaxXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746511137; c=relaxed/simple;
	bh=lHGjUreNtBKPMjSbSSELN5KxrhdXn9e06u3NrjNNqyM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=l16sOVUDgeQl5Qkbg9R1ai/26oOukUwU1OXq5hNvnAQcuy9pRu2FKvdGtb9NGkusGZL5ypwSdWvluaW2ZbjIql+XAtlwM09CgTu+eV29gyI/GFS9a9Bbw/I3fWfpkmGHkrKKAajVGWlr5ZF8tc9jKAki2hHcceVB6mq0ZxeBhD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=ncnQjlXl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736b350a22cso4338276b3a.1
        for <linux-input@vger.kernel.org>; Mon, 05 May 2025 22:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746511135; x=1747115935; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9RMzXmlz7UkanDilYbtO2LNwOeq3p6JuBHkzmKd9oc=;
        b=ncnQjlXlaPT7uujWK62WaGBAIoBtnBFbTe6QokHiWWujX4kCkJTSAR0o0ziRPrh4iQ
         QdfmLcima+ZLeeS94S8BKS2ZmVC68dbyBd7vgDU3Q4YXsKGwGfc+8xRUft6NSk8JRJdt
         Us3+c6AYOGvW9j1HfXSpDDGM+m9mQMBRUOWBguHyIQMGos+Oe6TVq8K0mq4Y7Q2pcMDv
         O+oZR3xQh21mIjRU+7GBVIJVJlz9GLVflpobBZWSSHurM0bBiNh+Qd1gZGLmWOFFjnox
         5gLFV8kOoTv+pg+Pv2WOtSKbABKDGKSQIFw+xKM+DO2BVoqIOy6F+RjKNK+ILyzVeapg
         BU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746511135; x=1747115935;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9RMzXmlz7UkanDilYbtO2LNwOeq3p6JuBHkzmKd9oc=;
        b=dFRauTkE11E9Eb6rRoxzkmXbBeBlXh3uLixsvUJg8g8AfuG14mwxVtiObAnWI+nHVp
         h/RHGZiU5OtXpT1dGB0qtWSNq485dSBrvampwqRniW+TPPE+r0iIu9xUPyRLWlMuPqey
         x9t6Y0/JA5NfTKvS9iE1025RiLslcJeGlvjEcjzXJ+Yehcs9mOuW0ML2xZuJ2KSvTzLj
         eVPf4z10TWjiSQUwh6neYyzDzqyk9OMPb5ZbgZ8PiwSKexwfxY0lR9BllQU6VXvCotSf
         QSumRkAisVIs8r3CzqMVFY1aG/CMo7H2YMEzGWTfF1r7JnDL+lDsMIHgi37a7ULOxug2
         lVqw==
X-Gm-Message-State: AOJu0YwkRrNvX6bwV+wLNYAib+oRnevYHS4WwMJBgz/Mwp+eZlr9NUR3
	dPgrYw3iKwhidWnbGORPZofwNj2bhLI68Vws6ioYIH3RWvkZZO94FDuVHAgSCOw=
X-Gm-Gg: ASbGncsKYXNKla9IFDHFIR9aPFDnrDURkbwK0fbbc9vDL3S5PuvNz1PG4QoBAgqiAE7
	NBkOT6MxAkEOW90W7mCkL3WBno/mhT9rqoGzS1g+3KUpzQvAdG5cGXz6QHVybtzu35rV6aoJQYr
	Aham1E+Ur+z9aZdNk9hGVmmyxrnJzeXbF4F2JuJetoRHl21Nqb3Ak0v6w7Xh5c1jPAaRxNVR7WQ
	VxVw/Q3JN7hipzoiNZZ9mrdtcemocvWZ7cqPcWxoodCj3GQXPrHi09B1tnxLZCfgGjBXtv9qeHZ
	XPykfkPCHJG1JAQxtu2gsU6EPbfOjeFijj7a/3r4buS1ZQed9GHoHET9kBn1fgNe9Qo/u4gbUni
	kpcJxvg==
X-Google-Smtp-Source: AGHT+IE1ALKtmymWe3IxwJGQDidvr9hFv4JXT7xekgdbvQ1bIbVtaLXBYn0P6rox6hbXUopZtRexcw==
X-Received: by 2002:a05:6a00:aa05:b0:736:33fd:f57d with SMTP id d2e1a72fcca58-74058ae66dcmr17568044b3a.17.1746511135383;
        Mon, 05 May 2025 22:58:55 -0700 (PDT)
Received: from ubuntu.huaqin.com ([202.60.227.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91cfsm7965444b3a.48.2025.05.05.22.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 22:58:54 -0700 (PDT)
From: Hua Li <lihua@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	javier.carrasco.cruz@gmail.com,
	zack.rusin@broadcom.com,
	namcao@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	tglx@linutronix.de
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hua Li <lihua@huaqin.corp-partner.google.com>
Subject: [PATCH] Input: gpio-keys - Detect long press events in sleep mode
Date: Tue,  6 May 2025 13:58:47 +0800
Message-Id: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

Previously, long pressing the gpio key could only detect short press
events and could not report long press events in sleep mode, we need
to recognize long press events in sleep mode and fix this issue.

Signed-off-by: Hua Li <lihua@huaqin.corp-partner.google.com>
---
 drivers/input/keyboard/gpio_keys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 5c39a217b94c..b546f38ecf8f 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -426,6 +426,8 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
 			 * handler to run.
 			 */
 			input_report_key(bdata->input, button->code, 1);
+			input_sync(bdata->input);
+			return IRQ_HANDLED;
 		}
 	}
 
-- 
2.17.1


