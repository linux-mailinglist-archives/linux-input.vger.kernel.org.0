Return-Path: <linux-input+bounces-16813-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E0CFD627
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 12:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5D693021E50
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 11:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269F01F7916;
	Wed,  7 Jan 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVTsplsr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9B22D781
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 11:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784800; cv=none; b=E0/TSslkbrs8NB/vCzx5nv8RvQwbst1gjkshrhLVPTrjHMxvTSLEtap4dvuxJ4tVKmsXvjHwVW/PxqWJ3abESbgEFSKEJHtjjs6PYPPa5Kw9YDCFaH2I83EkNznKS3LNtd2LbMLPgkpfAyDSDnfObsBaQTLxNHeHd2FpSV0KLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784800; c=relaxed/simple;
	bh=QYQ/Tenj9VD73GvoYKFgS1MCPUqnEZ5PE+voW7tk/W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=laiVbVc8WiXFb/qMEguRaCuB5KKeKsZnzBy7CB8Q6k1zREKxf36y8ylrBKpHHaEEhN7ChsDlHuabJDZ1GrrX4U9uHXuiWxkRY7TgrmXJP1pJuAslDJSkbOAe705MS2Bo52Sjdyw4mrweunU6O4+7TrJCqWCPF4O3SgtneXjD6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVTsplsr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so285626f8f.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 03:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767784797; x=1768389597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfzI6OCmxPct0eg13aJ+Pa91tOV5Ev9gjI/JOm5uc8g=;
        b=JVTsplsrOa0mhuxMDthHBp9GSAPfarROtz6aPHBUb+y1wJMmvTJYKjCaleL8StMU86
         HrgiJkpdONFf39QdTwRPDeZKDB1dVV906l3q9dNbbzKEpN1rjlqZgn2FQQvOdsNHFK/M
         MJ2Qd17/x9yRG1GOj0dKf/0weO+dk8t4ekEQczJwbTmLgz3SW3Wk2mLGAW6dai5mfikp
         mrfQ+G1UVUZ3l0AAh5bpsN0y5SCYZk4dSQ0te0rc5bfrmuNMlqZv3TyeOY/mKPEV0Ycc
         D6VfisG4TXqGtAvlaKXXYOYEmzwrbQJ9z7aGrx5qbqHXGTIJg0dNKMo+9T7GzfZfix6K
         7juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784797; x=1768389597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfzI6OCmxPct0eg13aJ+Pa91tOV5Ev9gjI/JOm5uc8g=;
        b=Fk/1lno6jOFuiLFeazvSeV1e/qoJG25azLB1bClt28jJaQ8nRuASVfzxTaBjjm75c2
         PZTllNRrF2aOjKzqOaDvSumtsonuhL8fcqLBX+6CIJv+SDLKWliEua3croWA9ynDmQfb
         IHxnMIilbQxZLk96oHrai1Bc5xozOm+2E/szjeCU9N2I7r6uvuFoPwryutCeURSbBPML
         P4K9JQIRsIxKdVrbSyZARXlVx+lEL7SwOI7srMmN65k1jeZWLYwoHQzSXQXwOsszwukl
         EN+IKJ5QmR1NV1yHfDvxCz1g1B60vHlmYzSCDvXp2A90OYG6oR2NTwTk3muEw12pv9k1
         8tiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8VtzS5Q8N1C8aC4P5LNGREtBW4eWOnXLJTP8mFy+qqEGkQDdK7KRfEf2w+64vWSiob0fMz1a9ZowepQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjYAQpm3XhLuKizSyQ/fxkhRsJxitNEY3K5hcfKYc+/rJXNGmx
	xXl+rJA8S6wmjJAeCTHANLwtFkw48VGqB2UhxScCavNIn+esPOe+3NpT
X-Gm-Gg: AY/fxX4tNxwOBqwDI12vSJwYx1yQ3Q+clvFH2CFkjq/kJwDimRYbNW2vEfQrdS4ilLr
	EtPpxjKwp43PK3B8eL7z6lZMQSV5CUT+IAery9NA15b/pSWk/7D7BOa68B8wtfp/68l+IHHCHj4
	9Spy6bZyXJitNuWerLhNi5UzBOLYcLeMxaeT96AYCpgXCt8+UVDN8PDXdMGm0e1C0w4epyVKcpi
	mqvfBt4FpgyvtPg/93/oKSelj2Ljj/4VlBuaUQKAnIs7/RZCiv/RQcMfJ6iKMCb7awFe9a+RbP0
	RjMZH9o7r+cdki24iCrYfpu6vU82+6Xpjyz+jSiY0vnEP38PdtV4hRubpsEDGMW1p3X6F5GqGm+
	XMG+bw3/D6Elbm6GmGgjZrY9LncPBkjPiNn02EkHkEcpct+CCSiR4ioznynxJ1yHFb9eHyT2ngS
	ZStZkUJdDwwfHJR32uRRgyZ+bQPL/qcd7zUZEjixU=
X-Google-Smtp-Source: AGHT+IHWRfbq+kxzHYgTZvQJTfaehRZsPZYwKklKaJjrDC9krc4UjrzenuB5I84TIr0A0FoJ89My3w==
X-Received: by 2002:a5d:5d86:0:b0:430:fcbc:dc4a with SMTP id ffacd0b85a97d-432bcfd2232mr6316681f8f.19.1767784796529;
        Wed, 07 Jan 2026 03:19:56 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm9733210f8f.32.2026.01.07.03.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:19:56 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: superm1@kernel.org,
	benato.denis96@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ionut_n2001@yahoo.com,
	sunlightlinux@gmail.com
Subject: [PATCH v2 0/4] HID: asus: Filter HID codes and add WMI fan control for ROG laptops
Date: Wed,  7 Jan 2026 13:19:42 +0200
Message-ID: <20260107111945.48018-2-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

Hi Mario and maintainers,

Thank you for the review feedback on v1. I've addressed all the issues:

Changes in v2:
- Split the monolithic patch into 4 logical patches as requested
- Fixed include order (linux/acpi.h now before linux/dmi.h)
- Added #define ASUS_FAN_CTRL_KEY_CODE for 0xae instead of magic number
- Added #defines for the filtered spurious codes as well for clarity

The patch series now:
1. Replaces magic number with existing HID_UP_ASUSVENDOR constant
2. Filters spurious HID vendor codes (with proper #defines)
3. Adds WMI communication infrastructure
4. Implements Fn+F5 fan control key handler (using #define)

This eliminates kernel log spam from unmapped HID codes and enables
proper fan control functionality on Asus ROG G14/G15 laptops.

Tested on Asus ROG G14/G15 series laptops.

Ionut Nechita (4):
  HID: asus: Replace magic number with HID_UP_ASUSVENDOR constant
  HID: asus: Filter spurious HID vendor codes on ROG laptops
  HID: asus: Add WMI communication infrastructure
  HID: asus: Implement Fn+F5 fan control key handler

 drivers/hid/hid-asus.c                     | 60 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.52.0


