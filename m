Return-Path: <linux-input+bounces-13521-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62AB042DD
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CEC43BFA27
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0B625DCF0;
	Mon, 14 Jul 2025 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmrlTTkc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8BD25CC6C
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 15:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505785; cv=none; b=NspBMxpKRnO1njxyJPZMi8BH3BBBbk0z34ue9W4bdsKjiObkIiM+Qi+Q/62OTcNEBKgtgPrVvY+0YhotlfT/lgduRC1/FxaRPv17JLzuhBMtl1h275nu+4vYrnKjNb2Jfbp6+NjI+4lu0mermrKDgxz933McO+Q95G+R8WaHaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505785; c=relaxed/simple;
	bh=/xx44fZm9CFefiwNufDk2tw2SX+xzRq16zogo7FXey4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DiyNHVK4edSf8vqlRcvk4aXTBfM0iSN7dSW+hMdCruanfdrkDm69+EfJfDWflXU72XU7EDtNIKOzGRQqp/e32cIs5TgfQVz3GADt7rtFwc1FBc5P76+GykhSXe/ugQYPXASRo1zu6tQIX8H6VcJngcSmF76xSxab6uP31HwdbLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmrlTTkc; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-61143269a8cso3697551eaf.2
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 08:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505783; x=1753110583; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=67bqH3GyDp5YSS0C73rDz9/lGoijs6/n2SixQxLDey4=;
        b=XmrlTTkcuaMOcHWBnyg+r6lVthSGu9jWM1R1oPpthAHtrxnh+0n/ZLKGOHvknPAq+U
         cBtzPfslmgunbmi0dlLbK1V7+Im+Nhm7X6sn4oGyby8Hy+u7UcnBKKDw/Lw4DYbd1L7Y
         BFHP1QWha7in6hWKVRhcfRPEXVKrHHLUN2JZHoLTiGNXscVHo9L9cDXiE52U2CJsOowf
         0k6wm7/BHuo7NxggkVKugM7WsGHikosJHkgnR82N1sj5w1MzfbRQKZEnRQLlhiCkPKfQ
         hQUZSMyFEHlVxYS1IbnMqva5zr/1UwI4JBCQKxemtiunnsoeBEnHvwl3LW21A4slcuzA
         Mi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505783; x=1753110583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67bqH3GyDp5YSS0C73rDz9/lGoijs6/n2SixQxLDey4=;
        b=QbOeEvSEe6WWDBddUMf9orZvxlLlwpbKVpb45cq9PCt9l68Q4Zvq+i6legepYGDoY3
         FlU5meuddT4uHmlcXKDwngM+ujtoiCKPE6AUrs1kO3G8q+JOp/45XDwiD0jVfYV61RHb
         35qtP0RqOn9hGgWrn3JawALK4Dkb2FVLueVMBFLfpehlocS97JHC5VgXqC6E+Eb+j7lk
         yG0jOF8zShwcTlXk2oSXqiC/asIEg3SV9IYlkrsw2fOtIPLbFn697uU1PiXZ03DMO7Tf
         m69YB0Ro0HLIqccMdRNhtIppkoDfLm9J/ukwbdBs3is0mRj+qrrR3Smvkm4hHlavrT86
         YZ3Q==
X-Gm-Message-State: AOJu0YxH4vI7FQSU8elETWmD+FJtWMnpfnUGFCnsCxdjifgH0HWNE90v
	TfsRXbv+IM1Lmaqo2NCu37zlE5i0jZpDZ8xcmh7QUUa5M5Wt5PsP9/aAfLvSb5ntqOCE+t/QlD9
	FVLQguDr+fw==
X-Google-Smtp-Source: AGHT+IGuSQqfqovrFAWMf6k1waoV/ChJgmKytwt31JmlAyf3zT371GAzTFjKdu0b7R7LKngAf0vQQJHsGIF7
X-Received: from oabwn16.prod.google.com ([2002:a05:6871:a910:b0:2c1:64e4:adb9])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e609:b0:2ea:7101:7dc1
 with SMTP id 586e51a60fabf-2ff27166c23mr9125788fac.33.1752505783196; Mon, 14
 Jul 2025 08:09:43 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:38 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-5-71c7c05748c9@google.com>
Subject: [PATCH 05/11] HID: input: allow mapping of haptic output
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

This change makes it possible to parse output reports by input mapping
functions by HID drivers.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91ebd8d8bdafaac07b5f85693b179cb4..d42c1fbd20a1cc01c04f93cf10f1d1c18043929c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -682,9 +682,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	if (field->report_count < 1)
 		goto ignore;
 
-	/* only LED usages are supported in output fields */
+	/* only LED and HAPTIC usages are supported in output fields */
 	if (field->report_type == HID_OUTPUT_REPORT &&
-			(usage->hid & HID_USAGE_PAGE) != HID_UP_LED) {
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_LED &&
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_HAPTIC) {
 		goto ignore;
 	}
 

-- 
2.50.0.727.gbf7dc18ff4-goog


