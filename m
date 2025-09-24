Return-Path: <linux-input+bounces-15024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A8B98375
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 06:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2611C4C1257
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 04:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF781DE892;
	Wed, 24 Sep 2025 04:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDPmJuQ+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D713AC15
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 04:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688655; cv=none; b=BAo/PEALYeugUI6jqkd9uqhVvjeHJpK5MxBm/FQ4kirYFoxkDQxWXu5H8rpon8j0EXvE0seEBSi7t54TS9DdyfcbbX8X0SoIQWw6uBmuOOlHlUZbtOhQbg4OjTEyoaBuzWR/MejZCGcaegv1qd6JzEivEc/dteN4gHKkZpdpIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688655; c=relaxed/simple;
	bh=RRDPP8ixAZkfYkD+0XWsW143p6YSMBD1DDMJaAaF9t8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=psFYd9Qq7zHveA7Cn1iQ7xUPfiggHq14epsrbKORCQSTQajkS+rOf/zzIDxEvQqB22JrkmFiytYn9rI92ngok5954xr8VpMIVXenebQaJdX5QfyPQ4M9vQttDUM1CJ0SqH027jiclFalOVanEGVgpGLefhvB0FXQ8o7llSx4xpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDPmJuQ+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f22902b46so3802265b3a.0
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 21:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758688653; x=1759293453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2AtE3wb9Esvjdk98Ay0zc20hm41uPjRxNV/m1l3tfU=;
        b=FDPmJuQ+BWsfiGxlPG+z73LuLzo4Wo1eLPCrwRh6AphmmSi6IpidqE61hptb/75X7J
         zPd/F5UvhCuUnrGKlrYkS8MkPk0u5dFxRcKE4aHYRrdQdnbrG3cQQzEHHWAc9XTJqnzU
         xPHHPOl3cO8AUKptrczWetLHIoqQfhkFXQy22T1yccCmvnukYdZStJyWOpcnMhpFarqP
         XdEJFtadJ9KiyA+mpm5NRTHkOfuGoujNFOuhGdirzBSUgw8OIIO37nvn0Aiir4mf2ws8
         uewPHlO2RBxEOPsOOknNTU8bSmppFDNH5WNLc5cxrGuWdPBVxYAIGNZeyESTfnEdSfQl
         bN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758688653; x=1759293453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2AtE3wb9Esvjdk98Ay0zc20hm41uPjRxNV/m1l3tfU=;
        b=J7bqxI9cRctQsbJzvHtRplga47VQjm1nGWn2ej3zPNFoVsTP5bsDyNf1/iwlF5dgpD
         +3AK80zz3Mg4KD664jwqXdp95cH2TkdVpgZoUYtCXXOVywmiH7OOq4tFjpFQ8qZ6yVss
         9eZl19/s5lBZ/kqDYw/1i6ZYcX5pVGMDVBdDA0Qf9eOilLcIgWQutVcFr6NL7b1sTQAD
         F53tDy6Hr5UqQNgCKVIbRjCs01Tg8lV+SmxqyVoqXyN+g7tJhlQkc7Exu0+zqum4uijj
         j6ZhXUSGrER1Zj6j4kuvwfbGleT6ylSge8APVJvWLofmaKR77keRuCR6ecsI2pRh5lIX
         CWvA==
X-Forwarded-Encrypted: i=1; AJvYcCWb0F2ml7Nc6ZBTu28ofPuK4lXSIFuIKFkEwQLNIyUFYW/u7XxRyeAmJuysAw3f16IuPFBxbZ7l8t+JSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jRz2Jt+wb3w2lK5EgiHK1R0uDmlRjFfgiLmgKT1obRuKGUd6
	NskC72ap2Cc8GXlIWxryePYFzi5D46LU+Fa9mSy5t38ykwJFT5G7dNl9
X-Gm-Gg: ASbGncty4M3a47frWfDIgf4mOoprjwj+oOXDLU2J56fZbRJHaXZbneQjfHfLHTfmc5Y
	N4yMIUUKzD7xns8+4JinWXEEjwWAlWuQO3blL8O5JejypY4OXrhkbYdxQuB3Y5YK3OsMo0dKlR4
	LQCo5HJb6zJLP9YpWe9/NoiQ9bXr3wTvnSP5FVuxm3mqMngjrL5qz0DkyJR3u9yaLIYbbLsCwJ/
	OQxLHUdhwgQSvidZ9tWIEmWZGJ2coCUdHJFiK8jGtA0/i8NJfJoSi00FOGm1+9CO2xsTdeVz8Zy
	SMc9TLy9IGlhTicvBBAhQjqrjyTEPfa8u5EFJD55Hoc/cXvs7YX3z7Pa6qxbWSaZWOkioLYSmPX
	lnmowte2tev2fXri9w+vGM62Sl4OLFTGy/Q==
X-Google-Smtp-Source: AGHT+IELiGCDwK/3N8AD/xB8vMByTAfUuiT/2C6BA80wtfiX+6BqvaDzI/YKAnY9RJbUWABNVlvMBg==
X-Received: by 2002:a05:6a20:bc89:b0:2d9:b2ee:784a with SMTP id adf61e73a8af0-2d9b2ee9d54mr2716962637.20.1758688653537;
        Tue, 23 Sep 2025 21:37:33 -0700 (PDT)
Received: from embed-PC.. ([2401:4900:60e0:7677:7e66:bbb0:5e83:be39])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b552882b177sm12122235a12.11.2025.09.23.21.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 21:37:33 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: even.xu@intel.com,
	xinpeng.sun@intel.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: mpearson-lenovo@squebb.ca,
	srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device Id's
Date: Wed, 24 Sep 2025 10:07:20 +0530
Message-Id: <20250924043720.5545-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing PCI ID for the quickspi device used on
the Lenovo Yoga Pro 9i 16IAH10.

Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=220567

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Change the max_packet_size_value to align
with MAX_PACKET_SIZE_VALUE_MTL

 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 6 ++++++
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 84314989dc53..14cabd5dc6dd 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -33,6 +33,10 @@ struct quickspi_driver_data ptl = {
 	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_LNL,
 };

+struct quickspi_driver_data arl = {
+	.max_packet_size_value = MAX_PACKET_SIZE_VALUE_MTL,
+};
+
 /* THC QuickSPI ACPI method to get device properties */
 /* HIDSPI Method: {6e2ac436-0fcf-41af-a265-b32a220dcfab} */
 static guid_t hidspi_guid =
@@ -978,6 +982,8 @@ static const struct pci_device_id quickspi_pci_tbl[] = {
 	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT2, &ptl), },
 	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT1, &ptl), },
 	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT2, &ptl), },
+	{PCI_DEVICE_DATA(INTEL, THC_ARL_DEVICE_ID_SPI_PORT1, &arl), },
+	{PCI_DEVICE_DATA(INTEL, THC_ARL_DEVICE_ID_SPI_PORT2, &arl), },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, quickspi_pci_tbl);
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
index f3532d866749..c30e1a42eb09 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -21,6 +21,8 @@
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT2	0xE44B
 #define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT1 	0x4D49
 #define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT2 	0x4D4B
+#define PCI_DEVICE_ID_INTEL_THC_ARL_DEVICE_ID_SPI_PORT1 	0x7749
+#define PCI_DEVICE_ID_INTEL_THC_ARL_DEVICE_ID_SPI_PORT2 	0x774B

 /* HIDSPI special ACPI parameters DSM methods */
 #define ACPI_QUICKSPI_REVISION_NUM			2
--
2.34.1


