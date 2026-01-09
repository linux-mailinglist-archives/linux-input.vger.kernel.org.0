Return-Path: <linux-input+bounces-16890-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98876D08C78
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 12:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 956A230737B0
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 10:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CB133AD95;
	Fri,  9 Jan 2026 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2hOeA2En"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD2032B9A1
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956270; cv=none; b=IMnUF6hZiwPv3dSAY5mxsUIjJecYkvlCgKMe/NrlSeRJ86qvY+v3yE/OtMNmY0x8sHcmuTCeKo75PfELTAgm6xaXCScmisIpKa6iDA3PfuPLyQWrfnXrpOP0c9Cb5DZscPsA1GnjGRIWpXppCkB3dq5t7WQcRKXmwhUz59/DZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956270; c=relaxed/simple;
	bh=BV4AJVCIkQ7Kk+Jnj4NXkmgD+SbFo0pAYLC60JU4RH4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OP71I/sbIIJD2KlvBn9F2GOhFK6HzN2/bpvoBEQ/nm6jwV0q9irVeby2CwfP6fSSCHLi7YkaJxOuZJclDw+sPVrp1rtn/+NMHXtg8pPzxNvayEQzEmBlCAnJjU4219NnEK4m0GL8g5Vwylmg/R1aIj0xpVi1ucg6RRcHbOO+br4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2hOeA2En; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430fdc1fff8so2558559f8f.3
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 02:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767956268; x=1768561068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ktWp+9N/Z/cyyA+90rtGcJz4hXLOKelheDUBzzaTS2U=;
        b=2hOeA2En7gxgYTOL90TbntCqK5VhlyFuMA6RLnqE3gCz5HATLPK79D/0V9Se8haYD3
         CXLgnvm73MaKSZT8+uoLbaSU2G7g9bQDDIXR3qFZN7Np83dhuHES71QqKqowOy5SCO0j
         8zfuvVNr1h5f05VQpZzTF2Nfc7pG94C1RtwrFmY4nOZGfXU8kncLuRLzkvZdcl7RaBJZ
         0K0aoWcdRyWYbofg3CA67Q2c0CBsVxUYGdJ0bUVNWHpD6hZBNNdL8VrhlYXoPo7Rxz4l
         Y30cgjGSeYRvQID458j12RYE7VeiY84GjPy5P4aI6YpYGTN3CEysiJy9FgJc8Z4j1WND
         UbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956268; x=1768561068;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktWp+9N/Z/cyyA+90rtGcJz4hXLOKelheDUBzzaTS2U=;
        b=suem2O+ZeS1bkAGu5X/TeuNRn/U/XsOsHmIeLdSsfqwCHxePXjW0NcwfSRWGB2Xu6J
         6/d9V2G9jzLMPurgHK0Q5kIksza1Ci6AG4MK3I9X+mYnNwvLuyVPesHLpyVB/6FpycNr
         QiNWf4cU0Atx9DwYN289IhGTwaDSUZspWQ2zS3uqX/RcqqZSC+r2JMTvBS88Th9txz3J
         i9Zy1thvlNJQkD+CSfCDaiAjxQ++7/Wl+2Exr9z3FWdzxCT+MEGikyxmQgghqOLGaRRF
         7sbKoLVqPaLpdVa3zXMhternk27doz6RdIcdYw50/B4l1EMOUGWcvfP94sozRgNSAX+Z
         vSVg==
X-Forwarded-Encrypted: i=1; AJvYcCUQZcim8Z60cPlWwsGWK6BoGe4GRZHOeM9PYMM8PIMY9sHtRwTYjlI9FqRptDsifO4hS1H3RLv7IkoR+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YygDW86I7GdSDUZYJ62WETS2Hb9SeADiDK+QFlW3Z9KXYuqUG4N
	c309hDx/tm0WxHQdfTDHMypbCR8GZS67hOUkKLLmRh/hpawneV26zATW30qz0sIsO69owDtYHFF
	K+o07BA==
X-Google-Smtp-Source: AGHT+IG/vVhRUhgl4KK8GRKvzE2aTXhHBrVgM4JwE8Xaw/gHTBeXq2u65eFaK0PnLSdp8TTSTm89freMBls=
X-Received: from wrs4.prod.google.com ([2002:a05:6000:644:b0:432:ddce:2845])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2906:b0:431:32f:3159
 with SMTP id ffacd0b85a97d-432c36282d7mr10253406f8f.7.1767956267745; Fri, 09
 Jan 2026 02:57:47 -0800 (PST)
Date: Fri,  9 Jan 2026 11:57:14 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109105714.3140851-2-gnoack@google.com>
Subject: [PATCH] HID: magicmouse: Do not crash on missing msc->input
From: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, stable@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fake USB devices can send their own report descriptors for which the
input_mapping() hook does not get called.  In this case, msc->input stays N=
ULL,
leading to a crash at a later time.

Detect this condition in the input_configured() hook and reject the device.

This is not supposed to happen with actual magic mouse devices, but can be
provoked by imposing as a magic mouse USB device.

Cc: stable@vger.kernel.org
Signed-off-by: G=C3=BCnther Noack <gnoack@google.com>
---
 drivers/hid/hid-magicmouse.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 6e7c189f4d1d..b8932f02b6ee 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -726,6 +726,11 @@ static int magicmouse_input_configured(struct hid_devi=
ce *hdev,
 	struct magicmouse_sc *msc =3D hid_get_drvdata(hdev);
 	int ret;
=20
+	if (!msc->input) {
+		hid_err(hdev, "magicmouse setup input failed (no input)");
+		return -EINVAL;
+	}
+
 	ret =3D magicmouse_setup_input(msc->input, hdev);
 	if (ret) {
 		hid_err(hdev, "magicmouse setup input failed (%d)\n", ret);
--=20
2.52.0.457.g6b5491de43-goog


