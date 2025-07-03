Return-Path: <linux-input+bounces-13343-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85728AF66EC
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 02:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36E557AAA3B
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 00:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89DD15746F;
	Thu,  3 Jul 2025 00:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUfLwwuH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D069EEB5;
	Thu,  3 Jul 2025 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503790; cv=none; b=pWZrZgUcAI6/jz52fu9uFyv7bvUo72JrJwUUrI1L3bAYj7t6fOQccSP7U9GtnnK78VLOX1CHS0AGOrbCcaPdXxVN5uFoVK16bIC2kBUm3uYAn09b+92jwR8yD+/HLXKqUHeJI0ZEP77ce5YvNxfLBxn1adA7mKIWNYbNMDDsrxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503790; c=relaxed/simple;
	bh=M9kWEGAhDW825E2dRVpfz8rVhUGV1kb2l+v53XfQ6oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/jr5xf1hWAcJG8a6YRR9ogSiT++OBIkEJ4+TAHyLAlOLDHgozfax/Lotbr/0t60HynxexJSuVtJZSnzfYApgUEuIRShFM4X6032v7Kw3tZbk+OIO049aQ8tHsV6sCi2HSmE5EYwvAhXcqTFMbHU559lb8zBMYdW/f/A0Irs9/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUfLwwuH; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74b52bf417cso873323b3a.0;
        Wed, 02 Jul 2025 17:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503789; x=1752108589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmDi07nOjAzfthy7KOI6FMj+Sn5t55qF/tEJAm78X24=;
        b=fUfLwwuHAzACMj668BlVjPmEBuo8yPqr9D2i84Ndz/ir+0w+quPFjUGS1bvl9FBWJT
         el13ibFKUD2Igt4K3hJAWDyIF4+4cqiThB2+ejmvjY7hloz6ti60SqhoOQGzhsnL0USu
         pJny+uDCzIGCJ9+27Fn3uT+iNRYqNia23sw43ErSR6KqmulE4C+xZC4uV2qXRpiX0LCW
         1+WLc0mtqJL91Hot+UXDUnERrYgJ/haCGicYHDpU7KZR0yN+c6m/4jSTkYiIW95g+4f2
         iB8cHrtV09dHVdRjm0YLqIxMoBs+kZFNqFegqS/8hqKxDJHcc0iFxLgzzkiE7Noa99PL
         m8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503789; x=1752108589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmDi07nOjAzfthy7KOI6FMj+Sn5t55qF/tEJAm78X24=;
        b=aX0iF/d5dqvoQFAsOtq+HnSyhALUMBWaCkTlNa5NhfFqCEdVk2G3kqiLPtC4tmrN0z
         HxoJfZZzqvEXR3KRcgQx7CCv9v0CEVQ8936cfQ+8GtCERHE26Gf7EJjWilsLurxDAJe4
         hox5X862nyegVR52g024nZgYbo+MiwZyM/DnIuhK+foc2yzhIQV5w/X5Dw0ZI4E0yMZq
         H/TGNx8U1J3mQTmHcCj2ia05MQFBVy9XY0sQ6HYt09H0859x1extmDJeBZu6x7EIEI4p
         Dy9Yt/xji/znBgv/DZhzWMuGdWwILQRYIo5Y2icJGkGAKJPG6n7VyPnoVIYuNFpvDSJt
         acXA==
X-Forwarded-Encrypted: i=1; AJvYcCUpHiHa5YiLStpxxOzDscpukyVtpe+Uhq3HfOHYgq6djsU3gn1L3BP7QN3GeJQ+LI7XUZvZp8iHTlk=@vger.kernel.org, AJvYcCVIYH/doTR10H/A3RetX+XAc5MtklEhzATLnEbGILKIs9jf6iJOI7xHtkihYM9v7kfTIDWojq01UIVZ4NzD@vger.kernel.org, AJvYcCVj7TEaG4rxcspzhbebzdzjfYYeiBDuwH22GorEcrrcwV8PTM7HOI6I+e4lrKR0o4n21RerLrXmpnQNu3A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6jEBFStez7EB0BUR4Qj+LP/t1icOofo9a8mPcI93IpfcLkf9h
	Do1sNYnx6F6eTGJEnz4ixp5pPNWg3SfQ/nWph3qp/ilDjp8byoNBVF/a
X-Gm-Gg: ASbGncvzXX9INgd6CdQOv3Ys6hovo+F7Rvk0CWKhHSjhIe8bxGHEaS+/utlQ85NqfO4
	Y9kT8uMuJwBj6hgfP5mOgIbN0oSAFkIWIKgBd3VC7qKsZLp1AEgLfSVA5y5kTAHhaGy4Jsa28Ii
	WUf4ov28ttLxwyXQ9vtugcemnOsrlKSdZw3AKRdbL/V+mcNVPqYYYIz0XH+44rsTkAlBU4mQCBa
	HU2Q5GyMB/t0JtCf0dh2eq6gbj2hsf64p3XYe6Q67NaxLwkB76jYZGPiy/wXVrai3m/QTIFXhYn
	OyjJch8xD3kBrUJ81BvlUigIzgYyhqyIyMYxeSy2FJeTev2GO4YPLtCg1aSIo3tLfI5jaWMlcvu
	EyhLPqSXr0tKXMq4TH/t6kIFnzx7zVR4uKdGXhJQtlw==
X-Google-Smtp-Source: AGHT+IGh5Wi3j/XRvpI+hFQo5glrzU9rr/IvkQwz8hOUSysPgjMEczChL3NjTTFUt5yfJTGeueA/RQ==
X-Received: by 2002:a05:6a21:e92:b0:1f5:9208:3ad6 with SMTP id adf61e73a8af0-2240c4a44afmr2490229637.41.1751503788634;
        Wed, 02 Jul 2025 17:49:48 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c7546sm15369815b3a.111.2025.07.02.17.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:49:48 -0700 (PDT)
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
Subject: [PATCH 1/6] HID: Include firmware version in the uevent
Date: Wed,  2 Jul 2025 17:49:38 -0700
Message-ID: <20250703004943.515919-2-derekjohn.clark@gmail.com>
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

Userspace software fwupd probes some HID devices when the daemon starts
up to determine the current firmware version in order to be able to offer
updated firmware if the manufacturer has made it available.

In order to do this fwupd will detach the existing kernel driver if one
is present, send a HID command and then reattach the kernel driver.

This can be problematic if the user is using the HID device at the time
that fwupd probes the hardware and can cause a few frames of input to be
dropped.  In some cases HID drivers already have a command to look up the
firmware version, and so if that is exported to userspace fwupd can
discover it and avoid needing to detach the kernel driver until it's time
to update the device.

Introduce a new member in the struct hid_device for the version and
export a new uevent variable HID_FIRMWARE_VERSION that will display the
version that HID drivers obtained.

Cc: Richard Hughes <hughsient@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/hid-core.c | 5 +++++
 include/linux/hid.h    | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 46d552b1d250..1b18e0dadbac 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2839,6 +2839,11 @@ static int hid_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	if (add_uevent_var(env, "MODALIAS=hid:b%04Xg%04Xv%08Xp%08X",
 			   hdev->bus, hdev->group, hdev->vendor, hdev->product))
 		return -ENOMEM;
+	if (hdev->firmware_version) {
+		if (add_uevent_var(env, "HID_FIRMWARE_VERSION=0x%04llX",
+				   hdev->firmware_version))
+			return -ENOMEM;
+	}
 
 	return 0;
 }
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 7f260e0e2049..ffc81a8c7a49 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -667,6 +667,7 @@ struct hid_device {
 	char name[128];							/* Device name */
 	char phys[64];							/* Device physical location */
 	char uniq[64];							/* Device unique identifier (serial #) */
+	u64 firmware_version;						/* Firmware version */
 
 	void *driver_data;
 
-- 
2.50.0


