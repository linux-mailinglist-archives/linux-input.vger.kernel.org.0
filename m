Return-Path: <linux-input+bounces-16892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D185D08C6F
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 12:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 999B43013BFE
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 10:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E420F33B6D2;
	Fri,  9 Jan 2026 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hrZZHUD/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F79633ADBA
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956388; cv=none; b=H7dMX/hcoZW10rNVuocdByIIo6rcVVLOuS6aZ+IoWCyLPvIW4dv7mpDhayoRc76aHCwydubIdoNs/VHAkF2SJA/tVbQtjtcuXw8CpJZjJdyTvVieNkwevWzxxJ+++iCALcHd6WIpoGgc6C45V/ubus29o6I2yPOaG4VKviQ687o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956388; c=relaxed/simple;
	bh=aRGZ9qzbchOvsbf2Q4Kz7fpOm3YpF5AuousM35WA2qE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jxYlIWCGQYBoFPUWxR4BH/Dxh1IEK5iNEsAJv1SrcULGeWYHn9JQ6VYGRGJL43juJnqDA8zlf4UT/61Z0J1yzf0u7sllTHSNv1H3eizYzSZ+I4JyWcGp3jYuU3eEemTXhb6FCs9rqwR2Oe3tzd6JfyLX6gNxMEYHmPcBzp0N3UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hrZZHUD/; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4325b182e3cso1966682f8f.2
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 02:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767956385; x=1768561185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BeYkiy+yrJYsuxPNsd+qFQLKTrLZTJuUBJuKTSPotM=;
        b=hrZZHUD/mRo/76m2wjFXl3x9fHMpB2sBmmZcjU/RGUSqzSu43W2j90Jpkgfi0jRLKo
         9PVMlm1oSjekeeyRqmUXLgpfXSZyKRjKHBuAfLE90OkuDzheAOLt83bW0f8vEmoL4TgO
         YqCzPAQRcsMMMAt+L3QUw7dTNpJCA64HX2Ofi54QO88QOfy6wvLVOVGPW77e3So22PWJ
         hRjtH7WZpb/UtDg+ByeDBW+TeOAbh8iQzgv6Y0t2EQEwibWPupo/fr61MooF1u81E+JV
         YwDhJ1yMsZk0L9fouP7Ei95StPvGb3Y0Vz7JBI7ojdnUPTyju0vF4gRGid8twBZxxD7V
         YGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956385; x=1768561185;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BeYkiy+yrJYsuxPNsd+qFQLKTrLZTJuUBJuKTSPotM=;
        b=iC6GnmfmL2WqPTKdvTPSNIQ8uReaX9V+huJCp/rpOMSogSFzqTVSK8LNFxdhP5m6ow
         2FqIl3NxmgTs3JOXoH0DziQUl3/N9RMT7Sfo2pQngpfyHIEwMdO0pTLOk7usMhJgR3lW
         cSksz1Tvs9g7PP2N4SfLuIVlO6f++/aD8VNH3H6Gs/FKTguVyQGb6gjK0f57xDYeWsGa
         MHdsKEzS4nl8H2vAsggDppaJSsMZ2tRYx/yolZBCH+5YQP0pl8tBsQhdZU1Je30O2p3v
         vfdyJD3cm8Ky9pN+OSfAkkadliZy9t7qWQ8qG33d3qxN3lY61S0pINQRsNBOR27N8Cre
         Ezzw==
X-Forwarded-Encrypted: i=1; AJvYcCUcROS32NvllOZsCZR12H77ndfe9sJ3bbaScEohjNWJ+Y0D2fdQxUWgSWNjbMFEJFPBq8VtWHVrMWSkwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8oZqMINoMTLhNtV7G3YXSizictpKN1Elm/KY8s5J9FIKVyHZB
	AoygJcouxB7bOedjWuL3XzJzE4OYRERthaRa4woZf0QREqLcbRc7zbrSQ3K2iR+sUIHavfgceQ0
	mSk3F3Q==
X-Google-Smtp-Source: AGHT+IEU/LfzdhagkXfQaGZDe5g5h6ujSqoTY9VNtMtwT5eRJQAkPQzFbBLfVz9mtXaqRNuODe+khiaU+4c=
X-Received: from wrbch8.prod.google.com ([2002:a5d:5d08:0:b0:429:de3f:827d])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:40cd:b0:432:84ee:186f
 with SMTP id ffacd0b85a97d-432c379dc44mr11574766f8f.33.1767956384941; Fri, 09
 Jan 2026 02:59:44 -0800 (PST)
Date: Fri,  9 Jan 2026 11:59:12 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109105912.3141960-2-gnoack@google.com>
Subject: [PATCH] HID: logitech-hidpp: Check maxfield in hidpp_get_report_length()
From: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>
To: "=?UTF-8?q?Filipe=20La=C3=ADns?=" <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, stable@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do not crash when a report has no fields.

Fake USB gadgets can send their own HID report descriptors and can define r=
eport
structures without valid fields.  This can be used to crash the kernel over=
 USB.

Cc: stable@vger.kernel.org
Signed-off-by: G=C3=BCnther Noack <gnoack@google.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 9ced0e4d46ae..919ba9f50292 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4316,6 +4316,9 @@ static int hidpp_get_report_length(struct hid_device =
*hdev, int id)
 	if (!report)
 		return 0;
=20
+	if (!report->maxfield)
+		return 0;
+
 	return report->field[0]->report_count + 1;
 }
=20
--=20
2.52.0.457.g6b5491de43-goog


