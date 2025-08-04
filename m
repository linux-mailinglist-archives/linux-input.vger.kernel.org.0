Return-Path: <linux-input+bounces-13804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298BB1A432
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 16:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB84A1630B7
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 14:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC23B273D6D;
	Mon,  4 Aug 2025 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHKzsDRz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE527057C
	for <linux-input@vger.kernel.org>; Mon,  4 Aug 2025 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316688; cv=none; b=Qtkl3SoKrJW2PyuHNvGMCYng3b2NpzCfHUku3qm5R+kztoqUfYBnDe90dG3pYGNdoTvpa8RndHWt9H9rBSQ9Zt8LzrHVGAeAewJaA6mw+NymYOC8ukfFOqtxqgmDAHntfhUIsjasHIHtIzTIcCqLVhcLS/wscaJ5e5rnJ4Iwsec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316688; c=relaxed/simple;
	bh=iPB28TrEQ4MzyoHFPSBZfFSdBRfwDn75E/cHEkPI3WM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QMN8diOwU943x0v0sG9pM9I6NpukHN4zzT1BbakfUlSWIkybkJ/zTE/BdTK1OUayA1G8ckTX9bZVl6Ogu8BcZuxK3QTkqB5Ve/FbIh5ybl/EXlRcl6N9yRaZnKc3YjB/RX+KewOVp5qaXkWpLls50vRvHc70soVhv68mRScMxiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tHKzsDRz; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3e40058db50so41394615ab.1
        for <linux-input@vger.kernel.org>; Mon, 04 Aug 2025 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316684; x=1754921484; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XcyO4Be4c4JXobjE7cGf2J4UxRVRdyWKCOO7WXUW/0=;
        b=tHKzsDRznyqF+49xYcriauuQh5hkkGMhguYP7PddHXjnP9tgeOepaGHoHKtzsPxZZ8
         87B0JHZDH6Ppv5kHueKs5k/Yaf9FJ3+69E6mjtmQ9jSWYNgzxdc+IPzExs49bln2wdE9
         XHlwMvj9MEbaJunsvD4pSkoWlqqlfIoLrN5ilHxVenn/LmZ611akmhzikSh/g2/NgNyP
         bDfOY9cNEZOSmGZLpQ7m2FJeOaYZU/gHo91yC+T9NVgw5BqeEEjCdvAKlQtDnWkUXoY/
         QIjyHJRC30IsgfXy70z8bsYJ4fbcD/WV+KH7V4F+1YmdFLghskaRIulceRSldpqLfeEn
         G6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316684; x=1754921484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XcyO4Be4c4JXobjE7cGf2J4UxRVRdyWKCOO7WXUW/0=;
        b=iYKqMn1Khy9BEakBbFSADzlABBa3uybFuoshp+EqJkQ+ikmiPeSHhm6h6J30N3uax9
         dRMqKdjWrSAGWglaCmNR/BZ5C8xpW7UVNQIipFMs5SNF4g6zC02FW6fMXnDM9hX9Qqse
         EM1TLS2BBpxerswJy/aCzSRDPAk7/BRGCnAGeI4L7PVMRTLSjpPJPYHeu+weyFhgUFlM
         VtCsKjAWdHNuwt33bn1ak6NHGLISqmI9N4QXI7lG989oM5JemLjQYpC+P/Y6Yu6uW7vu
         GGONZ9DGKDzOEtzAp5pPVOAXsGBHHwZ1hxx0X26IrQ0hInMQNwT1Zd7wGQsmLr8i1ARy
         YWDQ==
X-Gm-Message-State: AOJu0Yyb4TPZnJj0PlMYmd/tXIlz65CaXrByAc7p90xSAkWBOtSOwAf1
	afMc3BY9MmoMuZ8kTHOPFhArZZpLXXRCk2SNN+Gi7ThAIbK79hy7Pu3wIR9l+syL4dormvPrhN7
	7UUTUniAzBw==
X-Google-Smtp-Source: AGHT+IGQi4BTJ2NRlvn9MIpnL6hO8RfWm/njfcBlrxUeB0NVxLukwkbFNqqbpuRQl0T8A20PSlKvv7sC5069
X-Received: from ilbec19.prod.google.com ([2002:a05:6e02:4713:b0:3e4:90c:613a])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:2789:b0:3e0:4564:4ef9
 with SMTP id e9e14a558f8ab-3e4160fb669mr165839005ab.4.1754316684472; Mon, 04
 Aug 2025 07:11:24 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:20 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-5-138ca980261d@google.com>
Subject: [PATCH v2 05/11] HID: input: allow mapping of haptic output
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
2.50.1.565.gc32cd1483b-goog


