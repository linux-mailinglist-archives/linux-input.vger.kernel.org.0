Return-Path: <linux-input+bounces-16894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABCBD09B0B
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 13:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19CE130ACF21
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 12:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261AA35B134;
	Fri,  9 Jan 2026 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sGEkuf8R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4BE35B133
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961603; cv=none; b=QEQAFJzLK6sqTzLU44l5yf1HpzxudHXBIRLUvAvKInQlQthfk5oTiineyr6Mdh7F7GZXHchKCsHgmZfi878VaYSnxW01LNtyfiEbsR3G39p+WMOEJhDKqHhsserYXfhiBmbMU14de7ROKeoR+VnMHV+W8tsJJG6fpao7I10NcZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961603; c=relaxed/simple;
	bh=iMRVrJzSE+GyLgmViTq/putV9uCGa4LPKqf3e9Nfrj8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SsveHaUGbJkcXLwznpoe2ULDX+qGj7sNhjUZJ6pvscKVIdp8fLrLokXDE466ZsgM5tKXv5pw3FeA0HLeQbdgH8WsRijrDJIBF7Ia3N5HhO6SfQ2AoCc9ZYZJBKaB4Bp2116vtje9rkcHnLizNkNLC3Re3Oyy83qIvFafHQgE9sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sGEkuf8R; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477c49f273fso42499535e9.3
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 04:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767961600; x=1768566400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jj7OuZji+8vObLTTIbsOyz5P9pzf1c3nnJrd5t8yFgc=;
        b=sGEkuf8RMzqahIfSRzEfWZqlbKgr5kHoC6e5sE3gzIyvALXA6LWO0wjxAIIcvWJfgw
         8yGSNz4vPObOWD2V0a4fqGTPWB/y4KP8GXkiBmxguSJjDLJByuFjp2wUp51dUOoO95iQ
         fqnKf8PbtIi1tqoYR6pmGERAsUDMhRnzjjPawP4mUNIRsdeUM8NKmvXpkfZwKvTZ59nq
         1fHnGzNiP2ANCJIG/m4spqwqbK6mdkayDvlGyJe/36G+BCIGxDk6Vg/NZly907V3DDID
         Qf/N37eWWmeGDzu4f51eyuf/hxQm30wULEsAsGW1ZUk1usoeHnDr4RxipRcySLD724pU
         0Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767961600; x=1768566400;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jj7OuZji+8vObLTTIbsOyz5P9pzf1c3nnJrd5t8yFgc=;
        b=Sh+hyX/qAYbbrLfgon8H+FA+gHNYglVpHlYq6EUEzMwUCFDUi8qVJ4PqYgd1YE9BvW
         VHISF5s8bDQOt7VG7s2Ip9dblfM/AS84x/xrbZjpEnCbO6tkM639GgJIjhb/6LOVIg7o
         6co70yeN6ekXADXZb65acWzvKHtZkDM0ibcRGbO/Y3IUPAszZBu9MzL9Tm937sG9elKO
         AY2aVcjUQFDm63wlGqkawOXPhwEcYw6ObZG/QRcZTuQIOmCUsf6BJK3yZunHNQ0mI+vb
         z2DfcONUiS27s4mDajlnaK07NP1xRLIJpKmGFWuo31sxnchKPGukcZqLKF7ZFboqK0YZ
         897w==
X-Forwarded-Encrypted: i=1; AJvYcCUbfdgsYLM7VqP//w3Bg0ZJr1hFCsyZwkNguYooukDDGf5L1kgefk/qezD+Mb1YrPliGPkQ2HDtd5xniw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytCL8TWGMGG5ZdDwwmI/FhAY1CXQI5589cfEwCyd5c25pn5+oK
	vtYXG1hazz+gvZnQ/9ToL+G+hK5L9Novh0K0ohEYWRYxmPZ3h+/YYhlys6AskFVrCvbng45fl3y
	4KgW4IA==
X-Google-Smtp-Source: AGHT+IH+c7sUtySN/EBQ7cXCwSIA7jTKknmKEuEpqnF/ahCj4VsN237crbe4BLsLvj1hSLAz3LFMItFqX0U=
X-Received: from wmbdv6.prod.google.com ([2002:a05:600c:6206:b0:46f:b32b:55f])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1994:b0:47a:80f8:82ac
 with SMTP id 5b1f17b1804b1-47d84b39efcmr101569275e9.26.1767961600085; Fri, 09
 Jan 2026 04:26:40 -0800 (PST)
Date: Fri,  9 Jan 2026 13:25:58 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109122557.3166556-3-gnoack@google.com>
Subject: [PATCH v2] HID: logitech-hidpp: Check maxfield in hidpp_get_report_length()
From: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>
To: "=?UTF-8?q?Filipe=20La=C3=ADns?=" <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, stable@vger.kernel.org, linux-input@vger.kernel.org, 
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
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hi=
dpp.c
index 9ced0e4d46ae..c5e132a6c085 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4313,7 +4313,7 @@ static int hidpp_get_report_length(struct hid_device =
*hdev, int id)
=20
 	re =3D &(hdev->report_enum[HID_OUTPUT_REPORT]);
 	report =3D re->report_id_hash[id];
-	if (!report)
+	if (!report || !report->maxfield)
 		return 0;
=20
 	return report->field[0]->report_count + 1;
--=20
2.52.0.457.g6b5491de43-goog


