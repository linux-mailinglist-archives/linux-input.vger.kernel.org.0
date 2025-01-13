Return-Path: <linux-input+bounces-9166-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D90A0AF27
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 07:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F08003A5BF6
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 06:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845F9145A16;
	Mon, 13 Jan 2025 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXycQ17v"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6601946F
	for <linux-input@vger.kernel.org>; Mon, 13 Jan 2025 06:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736748940; cv=none; b=XQmo5a217cx9ZCWEKSxz5MturE++zuK73mii+CFQDE4/iu5betGmbdRG3IbrW8hqmzIESQQovVJ+WjDx9AhFqojyfJMqOp6Y/T/OeFPw+DOQu/K+a8G4mhobpA/j6RADCZtUTugvdheRCfZOwYxW5pf0o1TqhXmKswDS6Yh756E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736748940; c=relaxed/simple;
	bh=jZM2Oim+yvm9dmPZ5N+UxvdnNoH/Obp7GLrSsmPeFuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eP4/4dYl0p66XiSV2ZpjnKBZwN5zuNALZ/NpK7EVtRnl4VgClvQiapQ/XB4buHU1M5vQGAXtOKsqWexxBNxZbqs3iTSwe9cD73p6bIGq4oPIyQVhT6URBr1UfV2zccKVo4G3btIoxB3MmShRDC2peVXEzIdc99AWMj+K1Ark9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXycQ17v; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso7570040a12.3
        for <linux-input@vger.kernel.org>; Sun, 12 Jan 2025 22:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736748937; x=1737353737; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=98PjTuGlZltocfOKiyHAfnS09uRyKDbPFTkx0Rrc0+g=;
        b=DXycQ17veTSvcAujx8i0psMPmd1ePkVE2Y5VtTcB1cIEeagOU034TxRLAz9R0vMjM+
         6xAB/ntK3GqAyx5/IRRouyOhCeszPPFawn63I8Oq//l0BoL339zWqxMmwH9tXHM07Y9Q
         4qsDoFjAnb4yH9DKTj1UTietcjZtYbtQAnSMDGKwzUvC4XaJq4JGe+IDloOlexmy5E15
         +ZT0t/X64P9NthiUMlLlJV0/w/T0hADhAz6W7g4JbdHbQv55HMCO6JZW3LpyqwTsa9gd
         6lKVys9qIItUikqZpTzlWx55Yr3fvum3viSPRZgTIeLv4a9AT6rzeu9CRubBa5yPdZhC
         wOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736748937; x=1737353737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98PjTuGlZltocfOKiyHAfnS09uRyKDbPFTkx0Rrc0+g=;
        b=ZoFK+GVyFd6JsalpwSC+3C9J9NbImZxeY57Lt88Q62O13Np/MAmIzOTeHWujSXjs4y
         3oc7IdTBgp/xME3dn/n2nrotmQstSW4AnT7LEZQSoq2GCx35Vl4S/yVpqyE6OKs086jb
         AosVE+RAFQl4tvaFxDbFyeEBw7e9rcAkc02HI2QZ9vnneaRqsbMGj6xjGn+Fy9pgto0X
         QvJRYeUU5N8F7vL7pIuu15PO58hHcZRavLp5I/Z3m16MtS8bTKIR/cRKDSYfyUulpaZK
         jA+Mnbvc49CoU0e2YRx1UDbxz9UZCFCsSahgcDA35WDrBByb2sLySA0B5YpvXTg7pFre
         ICPg==
X-Gm-Message-State: AOJu0YzL37UDEEkXALXBd90nlYDBEsgWnlsYfu6BC9374usgskYYY5S7
	N1jlQ6ozIf8vuKSDgCVAe5YBrWYKDliUq1smF4I6q9gPhRCKUQB4h8G45xZ/UgjS5FtR2NkbPcy
	A
X-Gm-Gg: ASbGnct5RQGFWs2YmRYOGs/zKsTIwGThhK5GKvewNyD46WkxLrMmiIac8Qqkg4qUnVu
	qT3/hUXGo9Vae5ItV6s0w4Q4gg4GfNFZLyntItT2MNWIUJKYUFHw11laVA5EGFkYR5kpK0ZR2ZL
	NyvCcfkbo1yz2oG7R4ji7nexbbtkkRXNQiZNuXBGEt/05V4dnwd9hA4STOCsJk04FEDC+D/IRQD
	Kh5hxyENwdOX2jQMmnaxP0HloavhzffGUcIdbSjKGpnhz+Ptlj8boeoQV0hng==
X-Google-Smtp-Source: AGHT+IEbS8OCZde7sAM3yD+r7qZ2q2j2wSHz3lpjfN0nFsMoDpCxWgsf1EtwQePudxwy1WkHsc2xyA==
X-Received: by 2002:a05:6402:350b:b0:5d9:cde9:2b88 with SMTP id 4fb4d7f45d1cf-5d9cde92bffmr369391a12.27.1736748937035;
        Sun, 12 Jan 2025 22:15:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c371sm4542131a12.11.2025.01.12.22.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:15:36 -0800 (PST)
Date: Mon, 13 Jan 2025 09:15:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Even Xu <even.xu@intel.com>
Cc: linux-input@vger.kernel.org
Subject: [bug report] HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C
 ACPI interfaces
Message-ID: <fa15885b-4560-4b96-b103-ca40c338f103@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Even Xu,

Commit 5282e45ccbfa ("HID: intel-thc-hid: intel-quicki2c: Add THC
QuickI2C ACPI interfaces") from Jan 6, 2025 (linux-next), leads to
the following Smatch static checker warning:

	drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:59 quicki2c_acpi_get_dsm_property()
	warn: potential memory corrupting cast 4 vs 2 bytes

drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
   116  static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
   117  {
   118          struct acpi_device *adev = ACPI_COMPANION(qcdev->dev);
   119          struct quicki2c_subip_acpi_parameter i2c_param;
   120          struct quicki2c_subip_acpi_config i2c_config;
   121          int ret = -EINVAL;
   122  
   123          if (!adev) {
   124                  dev_err(qcdev->dev, "Invalid acpi device pointer\n");
   125                  return ret;
   126          }
   127  
   128          qcdev->acpi_dev = adev;
   129  
   130          ret = quicki2c_acpi_get_dsm_property(adev, &i2c_hid_guid,
   131                                               QUICKI2C_ACPI_REVISION_NUM,
   132                                               QUICKI2C_ACPI_FUNC_NUM_HID_DESC_ADDR,
   133                                               ACPI_TYPE_INTEGER,
                                                     ^^^^^^^^^^^^^^^^^
This says INTEGER

   134                                               &qcdev->hid_desc_addr);
                                                     ^^^^^^^^^^^^^^^^^^^^^
But this is a u16 so it corrupts memory.

   135          if (ret)
   136                  return ret;
   137  

regards,
dan carpenter

