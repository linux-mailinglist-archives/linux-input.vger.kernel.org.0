Return-Path: <linux-input+bounces-14115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C548DB2B45B
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 01:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8070E7B0346
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 23:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE4327C866;
	Mon, 18 Aug 2025 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u3Lzo8WX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA5A27146F
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 23:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558641; cv=none; b=pU1BrJPvBqefIcJxUdqeP8QwnRuo1Rnt1rQAo0zhWEhzCV3CgBVgeb+lROETIVW1CnpPPTTebCNO/VTsPOeOpQYrT5eUEbn76UtaWpOvNs3Y/4jmDq+34rH/Y3xumOWKm0/k/stkXPvnWywMsYIDekuluIBoGARvTIdwRBT7BTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558641; c=relaxed/simple;
	bh=kyVuZ1ePOiBKb24SnEItkzkqQ35cVznwS9078OsQVq0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K5JL4XDh1c48g5sFrnnhTxKTZIM+NaQBqcnp59fyVQAx47wlEY51lCwfg8E2yKCrBkxmxT5n8LBiaen/lRVTgGyu/oTsfH4d4h6oeaugLLFlES7n27ReT1qJo3zu7eFE+z5IWjt+f117yQCNGsKkRqQ9UxvIX4a3H73lXo4QuLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u3Lzo8WX; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-88428cc6d2fso608668039f.1
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 16:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558639; x=1756163439; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tCcFbkxPQyh6tgMC7pg429eb+U79ldGABIAzkJx5VBc=;
        b=u3Lzo8WXbQo3EYRwCke8IX9fW4gFHt1yCv/HpHqZ3GVaX9CAR5jDhZNLxBzGWhYvEF
         qWNtHfVGkCTWXaa1z0LywyGKRsH1D9Wgx9SXA0S2HxZ11HrJTKozL2tMyorOxruisXCS
         qGMlJYxBpohAXrYuXD0faoDn5k8iek9993JBqYFGcYR5h7vEvalPxU1Nzd5PPrbn/MtV
         yVCX+iOSe7aTtEjV8Yk090r78LXgSobsypYBqymT5TSrZtnDzlVhLdt+U0I6hfEbYpiC
         F+3OUCKciY3bVaKE8W8q2q8tnKPMW0IKP4Lz5cU/hDV6oqK3StJLOxk8bbB2lfDzKw0x
         S3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558639; x=1756163439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCcFbkxPQyh6tgMC7pg429eb+U79ldGABIAzkJx5VBc=;
        b=ARwGCmlTE35KQjY85vrn/tbk6nfuFBFYr+qX/vgslcjOkpQZcrLFyD814zBFbtu6F+
         G15wXzF4tp/E9VB84tyE2qPm2fLiVHkuYQTkPHJWYMtiCZrUCejKzDgnZFiTWIXvubrG
         FEu3EXQiRC2FfZ76UsU6t84JIMIzYGkp98POlD5XsQxH/hqZrHcUyfhq/MGhH1ocfcm+
         mdWHKTdLb1yKMKg+N6jBuZVte1NxSG1U0uIJaBPQ3l1IyFDb/aO5NQcH/cyI0zwrzdXC
         uSt5GmAbC9ltzfNEV8H3rQN/vba1+g95ocnTOdYLabojOXj5jGd8Sz+EyP0sSGLryacJ
         CloA==
X-Gm-Message-State: AOJu0YxNgmj1lXe+IhfoRLUM90QhWhTeXZAghINrRKbeSN4u1r8H8dOr
	ofRNlf3Kc214yubdwlj+XL6/8FoP9ppqRPRfO9LYWlaq0pU7U9iQEb6BxU25gL5fjJqz1Emne6L
	ROkvFGro4kw==
X-Google-Smtp-Source: AGHT+IFH4d2TZoQ5zu2dR3bo/GDEtSZKym2ory9RtgV29M5CZHpcDZ6mOgVVAF88TxZXYNhFPp6HjoXISFcs
X-Received: from jabhb19.prod.google.com ([2002:a05:6638:6c13:b0:4fd:c6b9:3df7])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1d97:b0:3e5:42aa:4c37
 with SMTP id e9e14a558f8ab-3e676c09cc3mr5883325ab.2.1755558639036; Mon, 18
 Aug 2025 16:10:39 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:46 +0000
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-5-e4f9ab0add84@google.com>
Subject: [PATCH v3 05/11] HID: input: allow mapping of haptic output
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
2.51.0.rc1.193.gad69d77794-goog


