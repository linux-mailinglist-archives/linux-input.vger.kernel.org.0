Return-Path: <linux-input+bounces-16023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD1FC51F4C
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 12:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C003AB82D
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 11:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB1330FC07;
	Wed, 12 Nov 2025 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bksxmV7N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120130F55C
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946294; cv=none; b=F5NW+kr1sQT4SwxDwTSbzqBeWTXQSeS2zSekZfehccONIraXXjRY4S/PUtgal3XA0pUcOE5sux78WgOTwEdgaTMf2GowZjkVzYLZyafqdKFVL8S9E2Yy2AK98MwE2+/hIM/UAA8++11KIY6rNTFBmjzfLkOMCWFIAeSXrYloO+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946294; c=relaxed/simple;
	bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBoqGxtRJjDAd1ehC0Dn7VyS5kgkZ0zfIb36WLUp4lCvsCoej9JPCmrud57IQUPhDns3g7YwtVxWwrP4E2zkHW8qxqBWRaq17CyZL0x4J+7M0nqgmf3eyVyMkNGfEiR81X5MNDPgMyyBLFG5FBycOcJQU4GfozP46Pry7EpfKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bksxmV7N; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b98a619f020so602523a12.2
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946292; x=1763551092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=bksxmV7NhAfJOfVVXpYwCLqkXJZnvmfYJgUt6D3L+x/lVF2MNTVa3I+nR7mDjTu0Sr
         HX/fvD/EGFUr4mR+Q0lHjXky+kUeP00UzTUUThQZMYIo4d+DISeEc0YbAIeIxdMvr6JE
         dBnrnp8KhSUMJoXx26evMA8D1xQVK6qX5PIhhmFE5P1kKrEkdM4O4d4yGQ5LEoyY0Osr
         h1g2nId3CC6R1G06Ak28izvx73+/pSRGaa8EGVRimKd48g2453r/b4i5qV+coCYwVVHP
         qS++CG+Zo2ey46b9VgFSr0pSE3n1jLxx5trbKzPQfZY9nnG2jujo2esNj5aXw1XS8Bz7
         TOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946292; x=1763551092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=R0Q1lBAGl2cc3+wXzBUW8VAuqRkR0otUqE8GENDk2dQUaoBLl5pDOPK85gNaDucGuJ
         PJWY5FwwQVilC7YF1WY4U+se4qgi1/E8DsdG2j3yF8UFo00oOlBE+AH+f9EmOCU4TyL+
         Yr6QDxBkozkLTnjFD+fTyu5IlosUmVbK6UA9D39QG7/GZ/QPsQwA+/T3kJYHv4R9LAB1
         1Qpmgw+mtWsOYg3TmTIgqrDSTC/zhoItFoF4Mpf4xrRfVx/2Zhb6zRk/OnvzuBCfV8Vo
         3UHNC5WbM76F1rMnHVHu1zNTUt/asNflL99l+sIfM3in2VdkCWkm5KD/GUFTSZRhAf3b
         LNMg==
X-Forwarded-Encrypted: i=1; AJvYcCWaKSRB1l9wO9/WDv+u6J5qhsz+HtzNDvDB0kqrUaxMUpwR4lAHD9rGbKE4X+a+h0BhehGUZuV+XQCf7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5tvoKD/U994D7OMy69KnrjBtdnkB5e2MmHd2nZMn4iROXbXTR
	vsZioXa5kRn+iGxMPTTtaIH5eVhyNTMW4VkVRQPtR45A/ZXAw75HE5qD
X-Gm-Gg: ASbGncunYWJevQ+1RYdrvKQpLrA3fLHUkXOyJ/yE8sS2bBIYd8faIpPLFkIGUiz2Q5V
	pwNd1TCw/n6hfnj0H5ix8U6Y3m5YCUvCW0UzEf5F5TChRUWw6NhWAXc2BiiPHPGrzPDYJkoN0l/
	ZbKJh158oiLKuOwYYtMjoxxC8KpTGeDERm5mjLf2uiX7j359MQcLz7kDDDRAfxWkrQl6kyKxZc4
	1eb3a2oh3XAcHbzKE8LhQ2fNjSHBEv9Hhi7v6LT5nL8aC0dh0PFM8Q2SAD1ycL63VnhG1aN0mT5
	9o1ES9K7DhoOatkT8s0W43VR2MPIS/8/9rZzdzkbw3cG1RIUQ/s9/FyMBZ8zRZ3+3VjdgzGbWbT
	EpkxhPOKrgWt6O+gtZKkN8QyHV+0SzbvUq/0ycEByCFkw2Um0/+HofPjFuRixoclqcLbfHGDevo
	cP27iydjNjBcpemRL20m94MRwymF9f6VppTMZHMEcCLYluNYg5pP8khEKx4bmkqVqwq58pXKzad
	ZyNVXo5kMOx7FSH4QiwebDASJYcL5os2ylslMvzbv68wY0vWOcL/gk=
X-Google-Smtp-Source: AGHT+IELfcxDjkTjHjE9o1zeO9QJOYdqpFiv0rmTaYc64N3Xo1j3VaCkx7ujy498PmB8+3B+SyLiqw==
X-Received: by 2002:a17:902:e948:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2984ee01fb9mr30708195ad.42.1762946292125;
        Wed, 12 Nov 2025 03:18:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:11 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:51 +1000
Subject: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUejzpjy/vkkvernsg0f1VocNBsYcmoPfGGcYNvqp
 94524SxYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNXqRgz//d6GbizPvxkYE//8vkPl+4R5pvWLTsfJFmx87tjWwd0lx8jQpZzsKay
 ZNaeq6ohQs4Oau4P32Xf26tccFrxZZXi3cwY7AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.2


