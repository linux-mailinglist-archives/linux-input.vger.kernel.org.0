Return-Path: <linux-input+bounces-13342-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 727E3AF66E9
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 02:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0315A7A8A40
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 00:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4827142E67;
	Thu,  3 Jul 2025 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frdZT27G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384972C9D;
	Thu,  3 Jul 2025 00:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503789; cv=none; b=iZFsZ1Pz3vriA6BZruBUI8jBwL3cHg7kEi+hdxiNRQhGoNcYPgUyh7Xg52Ntiz/FR0zpe9sK/PlbYP7h8x9Ttw1aZogYWHvxzAtL+GrFqA8sPdAJhdwDVxHH4fmBkfFFVcJ5kcvOpPybHGJr4A12SzVBX8M2Q8ATQKfwygqexEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503789; c=relaxed/simple;
	bh=L1MwWh8rgDab++DZ+PqjpfY4euT0vjx8GWVkXg+1pDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbZ7KQC/CViuwOExTgjIt6Uuwzmg32oVsW9xZRPdoeQfROUmwidorkwzT0fictRRx7Sdk+l5x7EdOzUONa9aGpfeILK0MefbFL2nfUAmu/oYTEUKV1nWDO2eKd61xWjWzMq/cJ+TtGWgJHOm/iu24Dnyz4YyyQ8J5fGUeFn+EPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frdZT27G; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b52bf417cso873317b3a.0;
        Wed, 02 Jul 2025 17:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503787; x=1752108587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0v8+lPN0LjX1t8hZDa4PteXqqs4jfj1L4KXQ05PyY3c=;
        b=frdZT27G8Mj+KLFEkZTtrH86BmzQRJo91FqhvosvHsQBUGy4ZlrcVXip5HGESZkRs7
         Oz83dm5oLT6pJoMMIE/1Du9u0IU2rxBZYRgaBjv+LVXeTyipkboWU5YPV5aD3eUxLAE3
         cVWqDo8yh/m2e27QAwUI2V0RRkfQHfdtIX4ylJA1p/J1yIIu4a6iFzaSqRPF70/ooCLN
         3/+IbH3GLj3q5aNoUy7wEIMSrNpESwllqdhnzUpBKLPHpfatnA48GbUEJy93/3IgH73Q
         d5uBinucGUyNJwdwDP/zFbekh8EbfuNFHbyMEAH8k3FDwoVi7aPshPrBEVoG+tCi84tR
         KQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503787; x=1752108587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0v8+lPN0LjX1t8hZDa4PteXqqs4jfj1L4KXQ05PyY3c=;
        b=Yw1CnQz7vOZDc7PB8saEuJxHNcSCUcrqvKFBe1RqLLrGIJQ1Fkt9cdV/EHOno5ljVG
         v2YvJBFW5f858FiOunbkP1hQKPFK0gz9oGeF7in2X/0HqoqdwrcsIaWCjrJuAUp/fcFa
         n+prUeKzAQ3fghMwrEZ0+qgsmX9AuQfW082aIZAbK6zbd3s7HI9j+QX/cFvZ4juRIl2B
         UU8+L8RlfAR51se35tWbf+y9YhARkxgSdCZVS78p5z9gmlfYDPLPGSwAGhPEVthUZTKR
         Cd0v6R3gvBHKatCF/sj9ydjeUl1Sm39IqZNtKxeiG5BdHvJD78jxvLYMT8DgLGEOoJW4
         unkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBxIX9lngWpTcfp2K7+Ph55LH736kTgOPrgrXUl9z7JiS7jboaj84DuSAexS76yrgu8MibKVXRiHe/7ZEE@vger.kernel.org, AJvYcCWjxBHDvVFMZL4ngXSEAOByW7WUm8JTCXgakzQvnjU1+lIJjTMhGkHD6trF55QynWIbeJW56Hyqf+g=@vger.kernel.org, AJvYcCXXbRcVTg1DdRIa0rGspA006UUmojaqpk5KPy4v8p6GiuIobcooGFcSmNPmqaDtHu0tqmih3arq0RUbeco=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfXk1eKzuDAs7AZnbolc5dMr6r+OUtrkm9IZwVtKGcLjyaCQsE
	uq6i59cz0rDQOBt8LXkTC2VoJg0/NapQo3GHUu3v1eRHP61hNYO8yiUbdcyNE/yu
X-Gm-Gg: ASbGncsNVJ4hnEb+gSofmBVC3f4RIa8TbhF7nMpo8aSjJkDScajFJuVVVTqg/zazTM7
	tmHVksuvEKCGISyoSFakcL3iPUuoqe58pS2klJfUnc+i9byM9gkZqX98rmMP+I34dhS8T4tr58q
	dv53E5iiZXt2BuSQv1i2zT52kMrekeJQ1P79rVEcmEcqFNm0etC7KaoS3urqiovQLvkD9ULM2EW
	hNdcekG8qlPEsLZS5LnLkDcsPWj8hUfj+XjKdkSrCbmcq6gWmkxKNNKVSdcEMwtkyh8WhnnFWgo
	Vb9T7/RUBQOV4tMJSIwmGuNf3AzWorRzXBrpUT7MVLd8JCbRLiUcarZBMDPR6CgVW5IQMjEX+oD
	6gwbbh6VQRO7bSpk2Du+Y9caxcWVIdtlHFIFUrkksKQ==
X-Google-Smtp-Source: AGHT+IEOpiyaMTnUtNn3q+j4XbjQsCRzSZEZSxW8lJvZ4NcbiqziIphrqw+KUrsEQZVfByyZA5OoWA==
X-Received: by 2002:a05:6a21:3282:b0:21c:f778:6736 with SMTP id adf61e73a8af0-2240b7d8998mr2173358637.27.1751503787271;
        Wed, 02 Jul 2025 17:49:47 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c7546sm15369815b3a.111.2025.07.02.17.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:49:46 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] HID: Add Legion Go S Driver
Date: Wed,  2 Jul 2025 17:49:37 -0700
Message-ID: <20250703004943.515919-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Legion Go S's built-in
controller HID configuration interface. In the first patch a new HID
uevent property is added, HID_FIRMWARE_VERSION, so as to permit fwupd
to read the firmware version of the HID interface without detaching the
kernel driver. The second patch adds the ability for an hid_driver to
assign new/arbitrary uevent properties for static data that doesn't
benefit from having a sysfs entry. The third patch adds the VID and PID
for the Lenovo Legion Go S MCU. The fourth patch adds ABI documentation
for the config interface introduced in the final patch. The fifth patch
introduces the core lenovo-legos-hid driver which acts as a routing
interface for the different endpoints. The sixth path introduces the 
config lenovo-legos-hid driver wich uses both the HID_FIRMWARE_VERSION
as well as arbitrary uevent properties. Additional interfaces and config
properties are planned to be added in a future series.

Patch 6 introduces a checkpatch WARNING that I'm unable to resolve:
WARNING: ENOSYS means 'invalid syscall nr' and nothing else
1292: FILE: drivers/hid/lenovo-legos-hid/lenovo-legos-hid-config.c:1085:
+       case -ENOSYS: /* during rmmod -ENOSYS is expected */

This error handling case was added as it is experienced in the real world
when the driver is rmmod. The LED subsystem produces this error code in
its legacy code and this is not a new novel use of -ENOSYS, we are simply
catching the case to avoid spurious errors in dmesg when the driver is
removed. If there is a way to prevent this error from being triggered by
checkpatch in the first place, that would be an ideal remedy, but I'm not
aware how that can be done at this time.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>


Derek J. Clark (4):
  HID: Add Legion Go S ID's
  HID: Add documentation for lenovo-legos-hid driver
  HID: Add lenovo-legos-hid core
  HID: Add lenovo-legos-hid configuration endpoint interface

Mario Limonciello (2):
  HID: Include firmware version in the uevent
  HID: Allow HID drivers to add more uevent variables

 .../ABI/testing/sysfs-driver-lenovo-legos-hid |  269 +++
 MAINTAINERS                                   |    7 +
 drivers/hid/Kconfig                           |    2 +
 drivers/hid/Makefile                          |    2 +
 drivers/hid/hid-core.c                        |   11 +
 drivers/hid/hid-ids.h                         |    4 +
 drivers/hid/lenovo-legos-hid/Kconfig          |   11 +
 drivers/hid/lenovo-legos-hid/Makefile         |    6 +
 drivers/hid/lenovo-legos-hid/config.c         | 1518 +++++++++++++++++
 drivers/hid/lenovo-legos-hid/config.h         |   19 +
 drivers/hid/lenovo-legos-hid/core.c           |  122 ++
 drivers/hid/lenovo-legos-hid/core.h           |   25 +
 include/linux/hid.h                           |    2 +
 13 files changed, 1998 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-legos-hid
 create mode 100644 drivers/hid/lenovo-legos-hid/Kconfig
 create mode 100644 drivers/hid/lenovo-legos-hid/Makefile
 create mode 100644 drivers/hid/lenovo-legos-hid/config.c
 create mode 100644 drivers/hid/lenovo-legos-hid/config.h
 create mode 100644 drivers/hid/lenovo-legos-hid/core.c
 create mode 100644 drivers/hid/lenovo-legos-hid/core.h

-- 
2.50.0


