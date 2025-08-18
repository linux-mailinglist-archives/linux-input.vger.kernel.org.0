Return-Path: <linux-input+bounces-14089-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF56B2AB7A
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 740FC726B22
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 14:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155362E22B0;
	Mon, 18 Aug 2025 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/3hGC1H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBCB21507C
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527340; cv=none; b=mvnHsMi6yyHqMb4KzSkt/GeqiIc0dvFQegKftKJkIdpD7LN/b2e5u9am3H8TSZ1iyF2rl8hCw1GGRg4tKW7wWe0WS+hJeQMuSKy772jj3IK70akMJuvzmcVaRjIjL57f0YPKVAHOSD3QCpfG/S6tWEr+pHiUJ6OJjuWbSfsKw0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527340; c=relaxed/simple;
	bh=41a2+FA9bH8X9sXvLwRCtUwLratquyBIH2dNcY3H2CY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=byXX19H3c+6x/5QZiNOw5TGMCsL5HVe6aPgeMGiFXkj739zm1V7pSFwC+xUSmfDgltfueDLMF9dI7t37U3DuroYEEX30RR7EBqw3JXWQ3/vYIzlvfQ/UOI7ZEEVewtL5czITLsk2mrj7w5J4Xx5ED2/uJG+3F5zFFs0ntpRP9Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/3hGC1H; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3e6649d783bso55462015ab.3
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527337; x=1756132137; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3tFznBWM0IW+McHrcF61sMaSKByQa6x4BTWeVHOyUXw=;
        b=h/3hGC1HYQrRlAE/RQSB32dPF1dobMrrppbfpWldAG6LHFx2zktmoeRje6CC5kxGiG
         aLRit/nVMqQhQELoN2pce1Y3OOL6qK7lzCfk2va/wkL12oTuyrM7q5zY00aEfUB4lHwg
         eguxf4NOmcAEP7YMlvdRlRvgeAxqLNLjp4Byi2KC6x3gHEHCjbLF8xGkwpuNoNghTRYU
         C8+3Fvz3ZdRsaJfK7FwdA7JKfT1SWE5CgHYymr+CHEXOfR1PgETr257d8B9iKd9MxVSO
         2rNBlmq94g0KOOBCZPAT6K0K0ibMC3XG8icK+toMHglvKTt9XZajRorWi+BeJNIermtW
         IMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527337; x=1756132137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tFznBWM0IW+McHrcF61sMaSKByQa6x4BTWeVHOyUXw=;
        b=ItiwKrC/dTHuPG6GocakrLuHQy+XetKeAr5LX+2OSbqg2PGQ2J1TZogg7M/Th8Ig+q
         aEmXveHpeOq+QTumprnGZhVblf2rPEtPkAkZDxP/mTVlhFnyiMEdh4a3jTFEOkEElFe8
         XN+Gmo77qLVATQ9u2Ked+KEClFf0TIYqFctdNzd7QWlMVk9YwKvd3XI20SEWW0u3Llso
         KzxmLC0l1qrdiBv3p5nxug0194UN1Vwp+DzkUp8xv+/nfhS3CXpLVbxmcGwLrL6OsJ/6
         rn7QL71AFk0KHnCQjgusRRwp0rte3UB5tJ4xwCpGFvnItboziq4RDeqKbdwDkTMTzQXP
         9ceA==
X-Gm-Message-State: AOJu0YwneNGo2nUWfw8EU3sU/WvN2rjlNXQgB8lt5vuUC6LHPQY8p4J2
	fUfRGbV8WWomdCv75KPtyOhduglwUw7aq/Ad8wxdFvWyBuV+nO3wqJVAvI9BLGGrO6NlramrYmi
	uR4m7F3pkQw==
X-Google-Smtp-Source: AGHT+IEBsBH62doUUoirtmqHQgZp9vQHBcGYX9e9luOmWcXQBkoj3b2JLGzvlK8O2+EdtDms+JwRqGLtS19k
X-Received: from iojp6.prod.google.com ([2002:a5d:8d06:0:b0:881:77ef:6edb])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1b05:b0:3e5:4b2e:3afd
 with SMTP id e9e14a558f8ab-3e57e7fdcb8mr245795495ab.8.1755527337603; Mon, 18
 Aug 2025 07:28:57 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:01 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-1-ca2546e319d5@google.com>
Subject: [PATCH v2 01/11] HID: add haptics page defines
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Introduce haptic usages as defined in HID Usage Tables specification.
Add HID units for newton and gram.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 include/linux/hid.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 568a9d8c749bc5547ff78d5abe6db7bce2f62d2b..344ab0e40f29afe55575e5a7544496b7bb48a266 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -156,6 +156,7 @@ struct hid_item {
 #define HID_UP_TELEPHONY	0x000b0000
 #define HID_UP_CONSUMER		0x000c0000
 #define HID_UP_DIGITIZER	0x000d0000
+#define HID_UP_HAPTIC		0x000e0000
 #define HID_UP_PID		0x000f0000
 #define HID_UP_BATTERY		0x00850000
 #define HID_UP_CAMERA		0x00900000
@@ -316,6 +317,28 @@ struct hid_item {
 #define HID_DG_TOOLSERIALNUMBER	0x000d005b
 #define HID_DG_LATENCYMODE	0x000d0060
 
+#define HID_HP_SIMPLECONTROLLER	0x000e0001
+#define HID_HP_WAVEFORMLIST	0x000e0010
+#define HID_HP_DURATIONLIST	0x000e0011
+#define HID_HP_AUTOTRIGGER	0x000e0020
+#define HID_HP_MANUALTRIGGER	0x000e0021
+#define HID_HP_AUTOTRIGGERASSOCIATEDCONTROL 0x000e0022
+#define HID_HP_INTENSITY	0x000e0023
+#define HID_HP_REPEATCOUNT	0x000e0024
+#define HID_HP_RETRIGGERPERIOD	0x000e0025
+#define HID_HP_WAVEFORMVENDORPAGE	0x000e0026
+#define HID_HP_WAVEFORMVENDORID	0x000e0027
+#define HID_HP_WAVEFORMCUTOFFTIME	0x000e0028
+#define HID_HP_WAVEFORMNONE	0x000e1001
+#define HID_HP_WAVEFORMSTOP	0x000e1002
+#define HID_HP_WAVEFORMCLICK	0x000e1003
+#define HID_HP_WAVEFORMBUZZCONTINUOUS	0x000e1004
+#define HID_HP_WAVEFORMRUMBLECONTINUOUS	0x000e1005
+#define HID_HP_WAVEFORMPRESS	0x000e1006
+#define HID_HP_WAVEFORMRELEASE	0x000e1007
+#define HID_HP_VENDORWAVEFORMMIN	0x000e2001
+#define HID_HP_VENDORWAVEFORMMAX	0x000e2fff
+
 #define HID_BAT_ABSOLUTESTATEOFCHARGE	0x00850065
 #define HID_BAT_CHARGING		0x00850044
 
@@ -423,6 +446,12 @@ struct hid_item {
 #define HID_REPORT_PROTOCOL	1
 #define HID_BOOT_PROTOCOL	0
 
+/*
+ * HID units
+ */
+#define HID_UNIT_GRAM		0x0101
+#define HID_UNIT_NEWTON		0xe111
+
 /*
  * This is the global environment of the parser. This information is
  * persistent for main-items. The global environment can be saved and

-- 
2.51.0.rc1.163.g2494970778-goog


