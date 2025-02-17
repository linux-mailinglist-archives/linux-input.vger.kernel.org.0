Return-Path: <linux-input+bounces-10105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAEAA38A09
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 17:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062733A6472
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 16:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28DC225790;
	Mon, 17 Feb 2025 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXnI11hK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B33A3E499;
	Mon, 17 Feb 2025 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811020; cv=none; b=ZgG+BBMlLkTZPtjJSRepiqtPSbMfcKIlHlhGCgCY+0Yl5wOB8QzhDHqAMyh9ib0NGpRw3nFOgBgcxzSQyGWu37Lg0csqNa2dYKX3ps5VuSujTiYMBbfghRAAi0ybLJcdtMHyOy6qFua5+3e1FCy32BqIqSQeGOh1806jaCJpy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811020; c=relaxed/simple;
	bh=yAEGnFq1fPaXAmVZjlGJVKmHOFgrUr8C7FYb/aComRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8weUvO+yfP8DiNV3L0wi5T7ENXh0UTmccSENvo7PkrtXPf76sWNod2xs0NvaE6loYJAIX+99Qc2CKWb5MfhtCy+4/ATKtswfOsQXrwHYpWx5fujxErlgyQaP65lx6yVuXW908eT8bGJj+ZaYDZeYrp43wfAk3yVG1DpFpQB4aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXnI11hK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f2339dcfdso68411845ad.1;
        Mon, 17 Feb 2025 08:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811018; x=1740415818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVha0vnwTsgyqq719hlczMyoarwoABW1JsVuks2CDC0=;
        b=cXnI11hKSa/Ib+LFz7xrKa8uGGXjKwjw05G5sCbdJU/x4fi5sW1ciViPGLTq35xfly
         wveoBchlnFmRW22tOGcOsAv+0YXJ2FQB59M0CGLAWRypBqQcZs/+AMAoEDJpreAvspS5
         i5WDn8NtZnOX625WnyDpq/5VR1gPO5y4rM3505DcPcp1D/VcsqFVmFQdZ3Y10kwYkTYn
         XQ7tMP0sYTRcjU4KGifGcwHWUgTE/U6kHs9mIt7wa2k4JJrtzzMDKwnImQEZD+YpGTO9
         ZPDLPnv3Kv7zSrjs8TZG3suKCO21UmbB2iN1UxYIrxehyLDjHNku7rnu6BvQR4435GK3
         Riiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811018; x=1740415818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVha0vnwTsgyqq719hlczMyoarwoABW1JsVuks2CDC0=;
        b=eGPOPm2y4wRJ0x/JLQO68sjZUqnPd78RiZYuY+IEA4lg4qX3O//Aq/LjlUNW2lRFya
         drBMRfQGvKSScSutd1o6WH14EPtr99cqIggTPDg9wuc+K74FqaqzyhEtfI8IUNx6Q5iV
         ZoFgGuoFCH7G31VwHj20O48r3YH56s4mGXz2FxQDEWGud9ZG/avOTm9x9JxxCj1i6vTq
         3fiwDywao9hivS8MHuIsal9HgotiTZU0/5FN2KA3LUDH0b9tegpy6KCUJARhEt8YUEVS
         bwfMrrCReiswmGQ4rLb2YvlMPE3FrrGwjMlrMQddoVT+7Wy39CISayVN5V4tBDgutalH
         DbJg==
X-Forwarded-Encrypted: i=1; AJvYcCV5UYa0Xz05KwKObvOiMfZ4y0lH94XPmALEtekXi+jiUP8KwSB7XCl8UqT/hYf5A8OabUWxB3ZUbfka3ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQeMbt3hnOgSheZi8JpbTddEkbc5e0VO3iQqq7UMDEe1g3pWh
	lvsTaji+s9v9GxvBniN1beegLp1sHr6NwyKoNQFjPgbP3M5XtOCsoM7H8LHg
X-Gm-Gg: ASbGnctU5qYvOWYI637QV88fabfMLmMDnaxa1cHYrHno5Nq9iNWXCgXOz/qpXwwglnl
	xcluxTmz6lDLydDTTLsXO5op6JljrJWvqVsNz6KUCxG8WOemjsDrC5DIRFEJmvZD3kMz7JEo7Iq
	ODAPFWtkWYVi+A7BcOJftFmhxKPVxncMjaOI4DHHgfHDUNT2qC4yYkqpR7MLWDt1zHnlHbEPJOs
	KnSCE5JQxYL+EVVqufiYtLoXFOQHZ7bXxxK1mqrg3zh5A4u/8EBLV+Q+EoSkSYAsPDtqqDQP+sK
	DXAiAL9vwqzyekqmojve
X-Google-Smtp-Source: AGHT+IGae3GRlXdF+pgCtKzT6SeTR9I+IgSqKay6v3m4V9/F3mIDQm6wX/S7ZeOX0WPK6at+hio4DQ==
X-Received: by 2002:a17:902:ce06:b0:21f:40de:ae4e with SMTP id d9443c01a7336-2210458f528mr177744535ad.9.1739811018447;
        Mon, 17 Feb 2025 08:50:18 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5585220sm72560555ad.215.2025.02.17.08.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:50:17 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH RESEND] HID: google: fix unused variable warning under !CONFIG_ACPI
Date: Tue, 18 Feb 2025 00:50:13 +0800
Message-ID: <20250217165013.3127063-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by the kernel test robot, the following warning occurs:

>> drivers/hid/hid-google-hammer.c:261:36: warning: 'cbas_ec_acpi_ids' defined but not used [-Wunused-const-variable=]
     261 | static const struct acpi_device_id cbas_ec_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~

The 'cbas_ec_acpi_ids' array is only used when CONFIG_ACPI is enabled.
Wrapping its definition and 'MODULE_DEVICE_TABLE' in '#ifdef CONFIG_ACPI'
prevents a compiler warning when ACPI is disabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501201141.jctFH5eB-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/hid/hid-google-hammer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 0f292b5d3e26..eb6fd2dc75d0 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -268,11 +268,13 @@ static void cbas_ec_remove(struct platform_device *pdev)
 	mutex_unlock(&cbas_ec_reglock);
 }
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id cbas_ec_acpi_ids[] = {
 	{ "GOOG000B", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
+#endif
 
 #ifdef CONFIG_OF
 static const struct of_device_id cbas_ec_of_match[] = {
-- 
2.43.0


