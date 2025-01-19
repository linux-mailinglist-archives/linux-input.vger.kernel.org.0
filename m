Return-Path: <linux-input+bounces-9383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BCAA161EC
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EF733A2406
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2C91DEFE5;
	Sun, 19 Jan 2025 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWCYSHdo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C51C3BE7;
	Sun, 19 Jan 2025 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292445; cv=none; b=N5rd0L/uUaAEICwpBfsRnuATvqhWkpmFclmSbwHpGAQ4/vqCWq8knUQ1Fzq1y9EbN0jgemrR+HkeqB45NkbtCOUSGucMS+iTLOKODBENfyhzcyiXy4a6MCmAtNxlgdI+CAVmwUJfgLJqv+UgvKvtGx/ghWQXBXr2fl16y+LTdlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292445; c=relaxed/simple;
	bh=Dd8c/Dwq0fW1g9FPnwxGp41GFWRhEdc/TuF9ZVt+ZAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+O8mIj8AwN2MPH/mxF2dInyzGLXEVJk6YvNbOUhl0MlwJVo39jOjFCZOD2fXRB8BkTXx4kkLKw5N9mfK8eTjvVY4WSywf1Ebe8rZD+o/DjRj+VMHMkyHRMymetArFHrngTajSM4a6psoO1zZD0kUV41BS3HlHOJvTXJau7hRrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWCYSHdo; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3da226a2aso649837a12.0;
        Sun, 19 Jan 2025 05:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292442; x=1737897242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wx/v/RBt7IbO+aABg3VmqdraDDzoSLZZYAQhG1MP8wA=;
        b=IWCYSHdoKkitJ5me9JZexFi8lIweCq4LS4IzbVJOND7bLzZWJPswwBf6b2qwnDz1mp
         VUaNZzbVF7XBUWYm6f/GmGd9HEXx9BHC4jeB79QEeIhHpjmfEaKoTedw/78CM7DoObm/
         nfreljq75jcOudv2hgGUVtX/8+QNsc6aqrosRdOVnjK1IdvMRvArfXcmrAaGBuKO5/jX
         YosloBNvQUBGdQRDlvw5QZdUMXljLG/ooPgC99vCACdXgpKSLf8DA5g6TTA+c+RjOJjR
         60i8VpZrVE1jHKMwDnwZeZBogBSDUj/YgwqsLDwlVjX9Se3/roR0T/lIZKiQYyVU0D4w
         Y0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292442; x=1737897242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wx/v/RBt7IbO+aABg3VmqdraDDzoSLZZYAQhG1MP8wA=;
        b=JJVAGVvtyI6mzBrXGlrHIwMrQVNBer3JfrblsMEbGswIF0uoBnhvOHBS3rrhsxuyVW
         WymgGQxWSw5hPlzTIMFfOb4wEm2cyDheTiS0sXfRWledEbw56HIgKWo8Nz/Z7z0zhO22
         gQJWyvF5Scy1wP/qRXySZpi7EQBVTbBSeu0eZ39Ezh2MYAQfnGMwk88JzUKEbLn7TWKx
         qa2/BXO5zOvWtbllBSIkxty/fumOEtoZ6g5bkSLX7lAZ12SEUYQ8b/Z/mLWB09m5aUNA
         y+4qDvYW8qzXX5uha7YALzm0dUfjSgEFyKz37RRL+iFBwyGq2W/c57sIqfe/u6ZgkI79
         2bPg==
X-Forwarded-Encrypted: i=1; AJvYcCW9inHacwgFuzJLpEDeRKQgq5WdqTP5BHUPE1Wmw6/3Ta3w6oqYbq/SRvnLgNcsvXbl/YP4rZ/Y4A3k9w==@vger.kernel.org, AJvYcCWIIR+c53xt2GMe2fsHAht0sep5xuRjaWZcNCvPcgqvJvepXXGdoIN/s1XDpjkW1LwrVDXO/iQWnP4E@vger.kernel.org
X-Gm-Message-State: AOJu0YxWqdKrWSUa/NzufsQJ8ES+GQJ/xSzJfOwkLzeWKrL+P5ypgKdv
	FBv57L1d/UDlxBTUCN69d7AjH3rozg7/FNqD4+n20A7KQ218NSqyaJNKPypT
X-Gm-Gg: ASbGncuWHQQRWsJgH1ezTj8cCuC4j4GoWvla6J/yGBYrqYca4Vz0J8lvmPG46nsNAa6
	Ll2QgFR+nvKor1fVlfggaYrKvQ8DCpNNvmO+RzKxw1LCtXCmMhwteZEp1LQJjga0YENoq1Z1Lmn
	0ODo9tEMARRB1KS4HQZpGtYI9eV8hiOPMtAZ9QIJuiYv9srQcAp+8rqHnSwZqLlE8z1WRu+ShT7
	402+vpRbtGXBpXtg7U7uxMnc831PnxI4XKgAYxahIDBT7Ll7KMJEHZUqGrjwLqYGmeS2ZlfckDs
	sEmpugui9IA4pYKbkA+8807nX1ydhv4gQ+XpZTRd
X-Google-Smtp-Source: AGHT+IHOUcTy3/IAgVSjy24oKmLcXmNqD+fSkwV7sBQqMR6eXVC+JvLwyOSiJpbKXXIZAY4ftc3rqw==
X-Received: by 2002:a17:907:d0c:b0:aa6:273c:a616 with SMTP id a640c23a62f3a-ab38b26512emr355415366b.4.1737292441796;
        Sun, 19 Jan 2025 05:14:01 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:00 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 01/12] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Sun, 19 Jan 2025 14:12:52 +0100
Message-ID: <20250119131356.1006582-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux defines 0 length as infinite in its force feedback API
while USB PID defines NULL (0xffff). Most PID devices do not expect a
0-length effect and can't interpret it as infinite. This change fixes
Force Feedback for most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..3899d72a0b02 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -301,7 +301,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	// Convert infinite length from Linux API (0)
+	// to PID standard (NULL) if needed
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? 0xffff : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.48.1


