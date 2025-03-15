Return-Path: <linux-input+bounces-10852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D380A6272F
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 07:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AE1919C3C35
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 06:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CB619047F;
	Sat, 15 Mar 2025 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="d49fuP0c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB8E18A6B5
	for <linux-input@vger.kernel.org>; Sat, 15 Mar 2025 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742019800; cv=none; b=Uplt1AbL+fRX60C2hbJSPVbR1+iaO8A0wIqYTk9c0lPQzPUzTlBxTV6rdaQLFb98XZR7NTuxiBe/T8VDVJ+Wlkv3V2F5Jlny7uZynMWOh+/DYFiRpH3K6UwSXM4oCnJRA4hFF4ILgZ1MOrQ331h7/20s2sqr6PZoDLH1gFSCrvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742019800; c=relaxed/simple;
	bh=UhBM4pXTlWVL12L7lqL0+yBZvc2QuVzc9NuuMd1x+bU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IW5Nz/ST2hrIOxbdDN5Zt62bgCzl8Nvid7ZycYQlz9x2qvLvziOleFx2ZuIdjxdyjUGkssmimq8ggy0m09OZnEDSM/MfQJdHnfRoyseD3wIP8gHEhc0A0nQj0X2oIwXGxNmeIu7qBh1pYeTNFuAlrKwcGgTTrJU1trlQZn1mMck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=d49fuP0c; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22548a28d0cso80159085ad.3
        for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1742019798; x=1742624598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0KszbQGYSFCwVUgrvxHeEGEUnJnSO7Z/8njq0GzUlMo=;
        b=d49fuP0cxjLOAacVpRk3LHSMwbit0ISU2US/HptD8YhrtZUbz71/nqt6Y7t1rV7log
         aFB42RNGx6JOyTrdYkzEiOJg8UtIZLbGsJbhpJo0VOh33BbRIHxKZ7I9Uqsmr0raA+Ep
         gAq63m2Gec9Czf5c0Mk/Bnq/JEwF5mifbo1wpssBbyCApr79Pbwq0AxDZPNmkrSVwXQS
         7H7R/og2O+pv5EpSUd5/ypb9MkaxEWnQDoV1sLhgPbypoAHzJKNp3ZoKPnas4Zv5+Vk7
         bNxQqCInPKSH2BVmIq++FYdSf/qRzwQ9PZSQ/CN8EwiTy0kbVt4rrnWsDGGAceZX2Pk8
         Q+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742019798; x=1742624598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KszbQGYSFCwVUgrvxHeEGEUnJnSO7Z/8njq0GzUlMo=;
        b=LUnPz6oznR+o1x2PPtKLvj+xQ70oJ4lPRgvA9zjUd3qWPGykwAWdybgdoqmpmYPLJ2
         fLBjsZp/3iMe3McdJaGPedgJ5t0xbopArTCzkTJb6OE+2DYHA09kc04+sX5JqN1Gy2Nw
         up4+KnUU34IzlJwgRclgGHvUo3T0h5+dndz49Xg+phjSpIr4PwZCCnGkfeIM19TvRsd5
         bHrfB41OjkpljX4GpKL8m8xiZgp8KqodKbAo4XRUqCaSrBv95YuJJiz2mnwcohKUMFui
         1dQ/RLdZMlgD9eujwT2BIG3RokUIRocoMyLVEoFLIJw0AVHULoS0k0IOq7Dl5Lwi6/lu
         3P5A==
X-Forwarded-Encrypted: i=1; AJvYcCWQskE24tAgOgV+3fp1TihuzgD4Uq6op8sd2jheSn4+YeZYbNsd6I8WpT92f5hOvqTum2qhQFK3p7LwBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvRzw+5qx/W3exxbwxeiHsrGc5ubGXrKiVRhoUBjLxK2tugx/
	4N6GMdTmwzfn0hE/6ddGt2dpDCNQX22NgskD5GFjDP9NplA16ENJkVjnNTGt5VE=
X-Gm-Gg: ASbGncuPdOyx7VEGiVaaBFb544y44S9vh/a0MFolWUojNyoihT8RoBey4MkAul0ze3y
	MBlmls++ouekSduq6ji7VIr/Zx/rsXLgxO4IpzCmiSNNf7UoXu6XOmwxfuS18lyNWahkZLXxP0A
	vItrsf3A7eauJuPZdgRL3wWoL2Oqai/2/GPDg8oc5WHAnliBREzWbINNpAGQ7EypBuLKJSRumTo
	9ny0EXgWCB0xhTr2H85idGOzZBJIl2y4JyP6h6MASTK6v5XJ1OmvcWByQN8mSsl3qLrxcR45UKq
	E7dfNAEreIxzpp56T8Igz4G5LFDj/nhg4ASaMM6uboUkII8nTQKZ/jUGSc/oIWe8WYnJEr+NBce
	sMHJ5JPcEbqpz3+28bICi
X-Google-Smtp-Source: AGHT+IGY+JD/8omgd5y0cv+isNKK+7SjEmHaBED8D/f2KvED9loo4lspOXbT86nTlHw856WYq5ydqg==
X-Received: by 2002:a17:902:ef4d:b0:223:8256:533d with SMTP id d9443c01a7336-225e0b1961fmr75841485ad.46.1742019798054;
        Fri, 14 Mar 2025 23:23:18 -0700 (PDT)
Received: from zhk-CBG100025892.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa6absm38405815ad.90.2025.03.14.23.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 23:23:17 -0700 (PDT)
From: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: benjamin.tissoires@redhat.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	phoenixshen@chromium.org,
	lschyi@chromium.org,
	Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Subject: [PATCH V1 RESEND] HID: google: add whitebeard USB id
Date: Sat, 15 Mar 2025 14:23:05 +0800
Message-Id: <20250315062305.1606963-1-zhouhaikun5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 1 additional hammer-like device.

Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
---
 drivers/hid/hid-google-hammer.c | 2 ++
 drivers/hid/hid-ids.h           | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 0f292b5d3e26..c3bd9448ef56 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -576,6 +576,8 @@ static const struct hid_device_id hammer_devices[] = {
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_WAND) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_WHISKERS) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_WHITEBEARD) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, hammer_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e400624908e..981908a9e1dc 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -527,6 +527,7 @@
 #define USB_DEVICE_ID_GOOGLE_DON	0x5050
 #define USB_DEVICE_ID_GOOGLE_EEL	0x5057
 #define USB_DEVICE_ID_GOOGLE_JEWEL	0x5061
+#define USB_DEVICE_ID_GOOGLE_WHITEBEARD	0x5074
 #define USB_DEVICE_ID_GOOGLE_STADIA	0x9400
 
 #define USB_VENDOR_ID_GOTOP		0x08f2
-- 
2.34.1


