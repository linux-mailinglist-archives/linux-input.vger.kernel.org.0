Return-Path: <linux-input+bounces-14114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B2AB2B455
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 01:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC793B7222
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 23:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE44E273D9F;
	Mon, 18 Aug 2025 23:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6pnQoVB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3642F26FA6F
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 23:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558636; cv=none; b=SCQC+zE24HZWfWRTrsxyqqZScwk8N8FWK7DXAfkdYMis1CqSlPv/soTX3IjkEU16MVna1fGrpByOoR2FZtjO/emj1BIpmUoOxZRqJ/RF9tHCYoWIs87pC3SYi3+K51ZrAtFj/FWTRHScIpw3t2VJGRWACIGz+lSPLba1CgAsFWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558636; c=relaxed/simple;
	bh=fmhEJJJB/E1FFPI5LjG9ozybSomAbkYBLER6Pk9jyms=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bHJRBBgMoqH9Hl0/TkFV8alIq6uDKKjjmJOxYxWvkfim8dtcp60Uqr9wy3gRLxKA+M/IuDkIbOxQ/VcJAmrxwF1QWdWIYDiIIATAb9poNk9M/tzRy1GVPm6gSiS1Dc8/OX4+fvmuRFcmNB0e1USjOBT09D+WJsdtE3VVnmxxNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H6pnQoVB; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3e67189ba24so9994265ab.2
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558634; x=1756163434; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H0QevRU85Pi+9axz8eFxpRKcQRe8ukOlLHQx9hBgz38=;
        b=H6pnQoVBSjnxDHOw8nUX5IrGcTb67khWH+mXN0py21h+cRLyrLx//f4BOCbEj00O5g
         7tHDfWumzYoT6SYRxw75nATdGvB5jnY/2YR9UY4ofnYDcdkzeXwrDEOJX7KXCFQps+Ds
         9GkTxwcDlwdNFQSZaRjFL+FYaO9sTq133m3KmgOolIjCqFmFTdKGUsjK1D+6VKz1FjSA
         UELLJNDzOd3Jf2Wp3y9H5prYCVNHlIC8v8C9iXfvoI8i0Iaa8nCvZlGs1IDR57ommzpn
         KTyD+2Dot2X1GZr0K78chufYGyigTTOGekN8qYMXmI0NwBpMm8gvufYXsxkL7PAeomfo
         Y+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558634; x=1756163434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0QevRU85Pi+9axz8eFxpRKcQRe8ukOlLHQx9hBgz38=;
        b=qCz1wjr8b8ypcxn0+DRbe1iaVrg00hjp/lasCgGD4OxIbZnXy5boi5xqS4GhyAQ058
         fRau6qzTJRs7IA0+JgnUI9HhB0N4saSJrdXzFY6R+d+061awnAP0Yyw2wCZcFl+GL9sT
         d9jo8pNy0Hg3dyEmw9R1IeqLZvMMn4oRel9cKG79qGTNQvxg/uSNhqX9xZ2OcoxKPWRJ
         6Pqvd0Umeb2kWOKVpAxso1pXkFKU6ZcmTXkA9IM7ag76PO/ginN71AJHFGEo7tg/eeQ8
         6S+tmKTKnGInspGAIHhVCXzgqEbi3hxl1jnLGk0nfi7op8orXl6Rq3jq6MtfX2NuPY/A
         GEsg==
X-Gm-Message-State: AOJu0YxcusExyt4eCgwfvnAQ4dg9QaomCf6b9FyBIP13bmii3qL/Fo2O
	C+B1upMRSn4FeIasyXlydtMMjZyv5M47dmIU5NEht5+Ed/nw94aV0FA/dD3rZ33xGrcStXlpPvS
	zJTLII0FR6A==
X-Google-Smtp-Source: AGHT+IFCfiADlQxcsJnYSe59mlfocD3gP94iu57cJNx0vOjYhVOrRJWHhrHJK//rZTjPILcmNtM8bbwrPkcR
X-Received: from jabc24.prod.google.com ([2002:a05:6638:c218:b0:50a:68a6:1578])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1a26:b0:3e3:cc1b:2b5e
 with SMTP id e9e14a558f8ab-3e676627764mr9826585ab.15.1755558634367; Mon, 18
 Aug 2025 16:10:34 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:42 +0000
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-1-e4f9ab0add84@google.com>
Subject: [PATCH v3 01/11] HID: add haptics page defines
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
2.51.0.rc1.193.gad69d77794-goog


