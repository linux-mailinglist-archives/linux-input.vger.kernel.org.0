Return-Path: <linux-input+bounces-9909-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233CA2F14F
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B4253A888B
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 15:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449BB23C388;
	Mon, 10 Feb 2025 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arnAmiK4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3272236E8;
	Mon, 10 Feb 2025 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200690; cv=none; b=e2hXmHhOahYkFvaX1PgiJpuXGETYCM2qlBZtfMdr0qabUUUwSsCGvmncMMQdw01NwwI8d6FBcvlO21i0WIivsLKosQQWWD4Nj6M2tSAztsY3snG+dX4b2kJ9NlLMh0NPbunRxQWSvema0/p4OGQtazgc24G+Z7Y5XeH/Lb/J/J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200690; c=relaxed/simple;
	bh=lrfFErT0tODJ+pWALufWpOmVarM8hUIruhZ1V9/qYZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q8nPXzIX/xZqIg7AeJsNXkryvbNzTmbj8V/4jC5W+fIcNIb/hOGzgXdL6UDAPUh44EgyNFKfK4cWN7NBNDLZPpRVx8D57kodCvspEh/Y+a8vvFlwMwJ556/TY3ACfdYmpZKTNp71N/uufWuUR9BN+qmgKhgRvbJ/RqP0fgWiPNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arnAmiK4; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-308e4bcd978so2238051fa.1;
        Mon, 10 Feb 2025 07:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200686; x=1739805486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdIl7nIKec+95hfoTV84ggU3uHfLmyJpZPBuhEb6jSI=;
        b=arnAmiK4nppDONM4vPmT+kaPTDaUptwPbmAP4fsUDbc7GxEIS1+d1KgBVAp/paUi55
         +Fu4ovCS5eLnWAr2NJNasgeNdLh8LUX72HFbmmmf/IVvc5H5xAZwCZxPYm2B5Dfp2HwQ
         4DaGZ6fP4q2WjGAeGAFrQ4eWmGEJAasE0VQOCY9p5SiF2XMTooEu4Afr8Q1Smrg+LTia
         HVpjCFWIb0T78JgxisQX5Kdv3p21OFZJnl9I3esmff5MpwRu8PIIM5rSMVnwWKrnGI1c
         gSj1PaQ7reZ2d9LQT7DSrYS/E7IP2QD2h6I/f9xJ7POmp2VcrQd86mICg/hJ01A/pcSN
         lDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200686; x=1739805486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdIl7nIKec+95hfoTV84ggU3uHfLmyJpZPBuhEb6jSI=;
        b=TTeaP/FMAPhdi8dyTgzAvmNYh16/0mmIRuiJD0PHup5nFDCpZztHYqK1lCV73xwupT
         7fzwftJEqkiccsZSNzTGYrWFkZ+GaaDDLpHap0tAdeXA96+UuyflPPUcDGj6D/+GUp5f
         AeT6D7GhvUyEU8bBgcqt3Va52hjnGrmFrcLFbCKBBEaT2GoXeADTJFnFIXEaMqhSzO++
         JqoN+BIc5q/HdlS+3BFBwlFMJl9pciyLUltY0PSGJrVrd699BkCVFgQBn1OhhYhHGpjR
         1W4c4lWVzeyUrFpwAv5xlAoBUH7TGDxOMfs/cu7DVNx/ZpgED/hu86+mZcWOdI9ZL7EB
         FiMw==
X-Forwarded-Encrypted: i=1; AJvYcCVq6mlKFcyW6RO55V9ndEHaWDORVZr+jEFvh2Jj4S8QD2xP1d41HtlY2vbZQ+xbeHq5rmePPqXXi8kilg==@vger.kernel.org, AJvYcCXwUMN48s9WxWLsYTae359+/ZxOCdYJfyub4Rsyn5fcbi6uMYkfmnH3MIeUeRe44Up8LanIWAZXH3rA@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqgngJfn5Jv4IgJSipGlZL1alARpb38VHAlyMqZQK/7ed+FJX
	NPyMoaoZyodmJB48/jzEwc2h9XobM2ZC6eeKUiyKH0MFUC792BL0
X-Gm-Gg: ASbGncvZxRmy4KHJx0TVu+PbaHxIxumcWC2KQ+eX3XS8Awy45Y06gjE+fCGcmIIH7MZ
	CPLJJ5/fJVjekRJkrF0QRdUT2fjlpbFK1MlImpv4dpaX6zAc94LPkKCHmvDelmGTo6HAOp1Z0cL
	3zaP2q6iD6OAzg9g6vp+5cpVnxmPbFh0Gkk9EO0R0VirlRtcLX1y6sTkY3sPJi5VGGqXsAAwNSp
	wkhM6POmfmuY0yZa9kYhgHqDWjPgbJOitaS2hJUUh3If7lSQxmz8cTuhyXYH7REBGj0zt8wOlfd
	VN9eWaMDWV6uNkxu2mHf+WkMknX2CVUPjY+DGsU/QMi341yUEiQasCEe11K5eg==
X-Google-Smtp-Source: AGHT+IGg7EnprS57JWRgy3CC++MOxRaZ0VOw7ROooNNSobT/G4recMQLicwe6mvwXgh2f4RJT8n2cg==
X-Received: by 2002:a2e:878a:0:b0:308:e8c0:ebdd with SMTP id 38308e7fff4ca-308e8c0f16cmr5890261fa.7.1739200686424;
        Mon, 10 Feb 2025 07:18:06 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178201sm12090561fa.16.2025.02.10.07.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:18:06 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 6/6] HID: pidff: Remove redundant call to pidff_find_special_keys
Date: Mon, 10 Feb 2025 16:17:54 +0100
Message-ID: <20250210151754.368530-7-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Probably left out as a mistake after Anssi created the helper macro

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index f31b95cca3dd..271f5d4e8b91 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1159,10 +1159,6 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 		return -1;
 	}
 
-	pidff_find_special_keys(pidff->control_id, pidff->device_control,
-				pidff_device_control,
-				sizeof(pidff_device_control));
-
 	PIDFF_FIND_SPECIAL_KEYS(control_id, device_control, device_control);
 
 	if (!PIDFF_FIND_SPECIAL_KEYS(type_id, create_new_effect_type,
-- 
2.48.1


