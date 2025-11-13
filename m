Return-Path: <linux-input+bounces-16061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A75FC54E24
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 01:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B063B5203
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 00:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EEE14C5B0;
	Thu, 13 Nov 2025 00:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ETNt6AIl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HaKbi++R"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F27083C
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762992922; cv=none; b=hJg5HqQW0V7WpWiv/HeeDjEY+BU35ku3Os9UO4KauGsMxkKyJ2+PpKMOPEAT3Tfwf6Sg01DACaCXt9bnwHM7rO9lJc93vhjRNFN4tCGyNulTIeWAjoOszJUhYtQlOq9MxOqLCKp6s12Czq7qeKIJzGKoWFD9GcBZKYmfOgTOEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762992922; c=relaxed/simple;
	bh=ydcwlK/oAd5xKfTx+JL5DKXX5NzldMKD7eXI7AFie1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSWMivNGfJbXpDp/UNiwiLJrtjY5trwo+420cLlNUHreamZnkyGoHEcCXx9U+0kRd4cIaDj29nRPiF6nEg/qM3DcwPSKBFnwlyIvTg16Ms+K8fQFmt4D5F4bZyQGHi46I6AA7t9cdBaP2wx6vJShjQFXqyeh5ZlbOIwJPJuZbko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ETNt6AIl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HaKbi++R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762992919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDL7LoYP5gq9XMI4WP3Ykdi7uKdtvjM1bMJQ7leEYXw=;
	b=ETNt6AIlQmqMZXKGf6+QCPDObG35IJEUshDmka8vo2llV8S6BXckwxF6H7hnANGO6wJcaS
	/eSlbWzSZPqgAZr76DY+0bWUSmI1e57yG0iOoe6pu4G9tXfnSvBhIRSeS8xyTA8yBd/4Vf
	X8BK7VNmNf6uo2RuZqKRKCszJ9iJrNg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-0BNw9MTUMPyDkUqfztJ3Sw-1; Wed, 12 Nov 2025 19:15:16 -0500
X-MC-Unique: 0BNw9MTUMPyDkUqfztJ3Sw-1
X-Mimecast-MFC-AGG-ID: 0BNw9MTUMPyDkUqfztJ3Sw_1762992915
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so2600035e9.1
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 16:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762992915; x=1763597715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDL7LoYP5gq9XMI4WP3Ykdi7uKdtvjM1bMJQ7leEYXw=;
        b=HaKbi++R60K0/KueJmIxlS7t/IVYai39FyTNO31Wdao9i8mHLOSIOZJgB9s20IfBr0
         Trasm41BzoJooztcYlb8PJQbwkAi1tAjk51oFzZYmjxCbw1ymLaqYE1iUYsp9kp8Qx6l
         KxD5NkPRjrWTbY6XSY/3XExgtb+TDvv7TS/++1uxrZLwiiNm6JHXgoLd/rMI+oZTZn+K
         sdi27i3LYccA+XFdb4/UPzH8Ixpkqgu0Ty2sSJR1bdHyczMlajPDyiCB0WkpVZTa4uEv
         2cWNbbkQDx9gnn3/P7fjBajFeQjQVwBQvxRFosazcuLM2hsSMhjDNRm5d7+m+pgsmbvv
         oKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762992915; x=1763597715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TDL7LoYP5gq9XMI4WP3Ykdi7uKdtvjM1bMJQ7leEYXw=;
        b=tglNNVUstCwmp6u2hOnujMTQzm0irFnPus4vLHht1psLwca/iGdUbxtGLK6Y+z2UEb
         BBsUtUT84wpexf3BdDx50RZiWxkhhUzKgT7oMBl0bs4om62rnxvO4fg09U3kcLHnav+D
         lCmg3SV/PgHWECfJy6nBSbpkgOIWh5khKMvrH49ivvwQLthpZLtQEovvQlWix3AET6m9
         ULOBHY3yPkaRFZ5acvxlG+slKsg9PAEEwKr+gHkG9fr1n3BNFI/F4wlS5ozOi5MqUU49
         IAcg7XvPjowxvR5k11qGgc1GTPBh3axBA6sCnz2KMuJXJ3CyRlmImq0mz06KzgdYDbaE
         G/UA==
X-Gm-Message-State: AOJu0Yz2T5FuCozouM754E6n7E5TVzalJvHIS+Nz3oszuwvpJxojaQvw
	rKPqMwgu5VTrrALKUBv2wqsOG6x8FQeBXo4CZDhe+LbabWT7umBa7zFMrxKT/A4Dem9cDqnkaL3
	N7+MHU9jbRsh6QMtUr6lgW1jAC1BleGP18fXaB/zx83HmoxlXxJhHeEtUVPXxn3UGoUiIOjH1uA
	2Y/bpYHYFa3a0meREhPp3tU5C3ldVGhRqTrqBoVdEH8V8WHqYO
X-Gm-Gg: ASbGncs/E4XOoHpNahL7LfcmDR/As0pNi4p7/IHCRQUDXAkIg8kVhuDDu7LG6QeQWep
	Xr+mzZt7RcDWDek8amg39Yn7imZoenF28WIhyEdGAQlD3XtLII5iq0rR9ANLyX84iRV7yoFgVxh
	OThbcpD/JWJP/ofadhDh2qsbhUd71NfAwRd3GN1tntovCeDDbDGlutGPVRxySIyb/v6EJYid+22
	aUtMPs/s9H/AbCtxkAIUHWviECbMS6uEgY94VnKSKdJD2Kj9IHmT9sCiXyWDA1pvqbT4pQ3gFkM
	3C/7TKMlghIDAT4XVWTZj6M382ff7AK1VhE2B3+vJyOjfvHkHNXO1y+1jN/qKBtvuQr86x74Jg+
	Dfe1c4bRl4xJFlw==
X-Received: by 2002:a05:600c:1ca5:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-47787093944mr51874625e9.21.1762992915226;
        Wed, 12 Nov 2025 16:15:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH44t5VADhoiFQdYlbkmvZ6vHu5ra7JAo9+e2PeUxapHpCteCkYYf67077+vK51LHvqgAh/8w==
X-Received: by 2002:a05:600c:1ca5:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-47787093944mr51874445e9.21.1762992914844;
        Wed, 12 Nov 2025 16:15:14 -0800 (PST)
Received: from sissix.lzampier.com ([2a06:5900:814a:ab00:3725:2991:6cf3:b3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b589sm432983f8f.23.2025.11.12.16.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 16:15:14 -0800 (PST)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-input@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH v2 1/3] HID: input: Introduce struct hid_battery
Date: Thu, 13 Nov 2025 00:15:03 +0000
Message-ID: <20251113001508.713574-2-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113001508.713574-1-lzampier@redhat.com>
References: <20251113001508.713574-1-lzampier@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct hid_battery to encapsulate battery state per HID device.
This structure will allow tracking individual battery properties
including capacity, min/max values, report information, and status.

The structure includes a list node to enable support for multiple
batteries per device in subsequent patches.

This is a preparation step for transitioning from direct power_supply
access to a more flexible battery management system.

Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 include/linux/hid.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index a4ddb94e3ee5..63422130de20 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -634,6 +634,36 @@ enum hid_battery_status {
 	HID_BATTERY_REPORTED,		/* Device sent unsolicited battery strength report */
 };
 
+/**
+ * struct hid_battery - represents a single battery power supply
+ * @list: list node for linking into hid_device's battery list
+ * @dev: pointer to the parent hid_device
+ * @ps: the power supply device
+ * @capacity: current battery capacity
+ * @min: minimum battery value
+ * @max: maximum battery value
+ * @report_type: type of report (HID_INPUT_REPORT, HID_FEATURE_REPORT)
+ * @report_id: report ID for this battery
+ * @charge_status: current charge status
+ * @status: battery status (unknown, queried, reported)
+ * @avoid_query: if true, don't query battery (wait for device reports)
+ * @ratelimit_time: time for rate limiting battery updates
+ */
+struct hid_battery {
+	struct list_head list;
+	struct hid_device *dev;
+	struct power_supply *ps;
+	__s32 capacity;
+	__s32 min;
+	__s32 max;
+	__s32 report_type;
+	__s32 report_id;
+	__s32 charge_status;
+	enum hid_battery_status status;
+	bool avoid_query;
+	ktime_t ratelimit_time;
+};
+
 struct hid_driver;
 struct hid_ll_driver;
 
-- 
2.51.1


