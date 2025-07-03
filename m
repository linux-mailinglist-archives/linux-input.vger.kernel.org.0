Return-Path: <linux-input+bounces-13344-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B115AF66F0
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 02:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC94352101A
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 00:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4883918A6A7;
	Thu,  3 Jul 2025 00:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPTdXp2s"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2C155326;
	Thu,  3 Jul 2025 00:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503792; cv=none; b=NDTOsjBZB8rbyxPbCqb9zvnKgDU+Nef8jiPcJQkVsolvulBYzYiFeWulLNFtg2bQhT+bwakk6WKHZUBtGMf8o/kBlN9XBEwoO1/4v1K2IwbLHjZIoK2wcfpGBOEsQuCYVNB6Uk/MmpU/ItZn1ULiijH7MgqTC3Y/Kzv+qsEX9/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503792; c=relaxed/simple;
	bh=kbOJ+SVzxgHgcjtJAwuuBtJZsGqx2HGLyKpoLGigDFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=maVi76907IAwHtGN5tgDknbiwVW9EXGe1DsvUIb8yPJbMxwjJJHqfWH7wEB+8rB0VXhf0uJk1PshQVGGRhy6KncWzrZ5BZ2OfWBN0Sr/nwHNLwHh/SVL6nC83H5TfYFYYOqCU6T+J/4bATVP6Z3pVZw2vqQDGNO/EHs0QjG7axE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPTdXp2s; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74af4af04fdso350203b3a.1;
        Wed, 02 Jul 2025 17:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503790; x=1752108590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGATnmCcv8bKEMSFbUJtU/clKEjpCFE8Kdapoxyn7mE=;
        b=LPTdXp2so+xsPlABvYy9ar+yWP7DoyZA0IpEAf/Rb512syBIAFI5Gt5jP9DG42MIHN
         HmUMJ1SGKC6jIbmjvJ4OHjaA1C4gjQeuAb514kEwN/v1oJakq2xyyIElcHdLZ07EnhKV
         wHi8bXlihCOvOC2ssvPdvMpF5AQAZXieXOAkCxNX0//95AiXgtrG0SmwaOGgdxHKOm1R
         DTXueD8fEV4c6aOShvhpXwAn1BcNS8mwVsHg6ije8JjvyWOhK/BEFgYs656NEOQmi/0j
         yNEvi2Rb/nh+nMS8uFvAQWXTPJ5PkYAZ3Lmn6/c+XoWfh9hTVE9E6eqBIYlzCC6nSGLI
         /U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503790; x=1752108590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGATnmCcv8bKEMSFbUJtU/clKEjpCFE8Kdapoxyn7mE=;
        b=gNh3oJEXCzeixHUI28ReJNuGgWLIV3Q8zCchDQZTNK/lbi1V2huDlhPnGATdymiD2+
         xCls85pz+VUuYCPtqMBl+KoLqY12DpigpYoG0lmVZzHT3Wns8bc8sIpY9Ci7jMYuYx7W
         3tfqcE0ZtoLhkWy+TcWW67x/NMmtjFw7BZsaXqVdzUxwENapdEXQjt7fozJyL97SP/dU
         5pIy/F/c4DWJ0tbQWhccA2qUTvdm6WCcZZE9ZIeLKeC7iaqV9qgusDJCM2rLVK2Ga257
         QxjaJ4Aea6RoY9j5+CLoe04k8oohB8KFx3mwt43R297D3Qd7mhZcef/u2nr8/Ql9lLyq
         eW+g==
X-Forwarded-Encrypted: i=1; AJvYcCUl9Vyia/XgvoVxduf+Me9aK9RrMG4KLmZ6f+1Fu6pih14TgudvCXvlQjVGhRf3xu2RGc+eBT7FbiohBTw=@vger.kernel.org, AJvYcCVTWd8K4UzoRDlDOY8nGixZtZCfLSF1ca7GsXhQebtpoflZra2h9G8RQRXfrqxza0ymUXAnNTJSYBEhNAR+@vger.kernel.org, AJvYcCWtLguG7YGCSPiVMlyIRhb1IMtwmn0GdRJZgEIApEGsS+shbxrNvUpvR5Mc006ktaiPudwAY1wEWUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0NB7028V+oLzwSXUBL4QCPQ/nbpd07T3o012GGDxhs/Cu5xp5
	7mCBZzRHL1fZbTnE90SStUA/XmYxYLCtWFdUvpoKE6Oohd76/kkcHytD
X-Gm-Gg: ASbGncv9bNuNFs3R+/BwqgzaaU7dw2hqtx0Fq4ngYcRNCNR2L60SnA7YkfZh1CCf3Ut
	AHHwJBGf2WZiqFbc+qEBx3JEVzKqM0BQ1NuYFYQ/VdCNYzXab+u9+weYPRtXKdaFWc+Zu4fE7N6
	kMzhK2ZYiV0HxPYXAGOwatnCXSgZewaEInttwRUPzW75CaN3ZcDDGTEF4R8vrMOpdRfX3X+o4Wx
	xsNL4XwFwWtBYbEF67cT5x7De5iFlWlnN+cYawwGEPiNWXSoNIb630qT73qFCMW07kjASVLvJ9L
	7SbPFvMLA7ro66W75l4AWI+XVzCIgquzWRSiGaKNb3XpI3Mi++8hQ9ZQ2fnnwUFQsblnkmsflJh
	wkn0Via4k7xtp4hU6csMLoO51D5Nq6cjd2BGa64S2Ipxp9Cmay8fj
X-Google-Smtp-Source: AGHT+IGe2LurB5rUoqZZosD68WDNmWiYaJOb+Z8NX91En/ga3S3mVE2ErPuv7Vwu37y5rc2kmSWmng==
X-Received: by 2002:a05:6a20:394b:b0:220:1843:3b7b with SMTP id adf61e73a8af0-224873caebbmr298895637.4.1751503790057;
        Wed, 02 Jul 2025 17:49:50 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c7546sm15369815b3a.111.2025.07.02.17.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:49:49 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Richard Hughes <hughsient@gmail.com>
Subject: [PATCH 2/6] HID: Allow HID drivers to add more uevent variables
Date: Wed,  2 Jul 2025 17:49:39 -0700
Message-ID: <20250703004943.515919-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703004943.515919-1-derekjohn.clark@gmail.com>
References: <20250703004943.515919-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Some drivers have static information that can be useful for userspace to
have, but maintaining a sysfs file is overkill. Add an optional callback
for drivers to be able to add their own uevent variables.

Cc: Richard Hughes <hughsient@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/hid-core.c | 6 ++++++
 include/linux/hid.h    | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 1b18e0dadbac..de95470066d9 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2844,6 +2844,12 @@ static int hid_uevent(const struct device *dev, struct kobj_uevent_env *env)
 				   hdev->firmware_version))
 			return -ENOMEM;
 	}
+	if (hdev->uevent) {
+		int ret = hdev->uevent(dev, env);
+
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
diff --git a/include/linux/hid.h b/include/linux/hid.h
index ffc81a8c7a49..36e3c167c7ff 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -680,6 +680,7 @@ struct hid_device {
 	void (*hiddev_hid_event) (struct hid_device *, struct hid_field *field,
 				  struct hid_usage *, __s32);
 	void (*hiddev_report_event) (struct hid_device *, struct hid_report *);
+	int (*uevent)(const struct device *dev, struct kobj_uevent_env *env);
 
 	/* debugging support via debugfs */
 	unsigned short debug;
-- 
2.50.0


