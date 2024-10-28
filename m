Return-Path: <linux-input+bounces-7730-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BAB9B2C73
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99AC280DFD
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 10:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212511D223C;
	Mon, 28 Oct 2024 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c7gFfzld"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F21D47B0
	for <linux-input@vger.kernel.org>; Mon, 28 Oct 2024 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730110353; cv=none; b=FavIvCs4jdeagchk9RAhudeKtt3NRz1Bcpj6jiKW99uIlsugINLZwjF8c4NheFJ6SNoR/NWNp1uJnU6elsvgYmnqCOuXaQ6dF8OQXf30ry4wWrqyjyTBBw+SqDuFQBVTvHoR07iLZVgcPQ3XA/nTMHWKZLCwzA58mLyX8D/JK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730110353; c=relaxed/simple;
	bh=4bCSwXGldVFEtUT5qrvYVydkbPDWuToQV+lF2z5ko1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJ7bIexFL9qbZ1ALMGUZasNH5DB5jrG9zOZwMF6J9JTHgGmIi7JuVZF0zYY7ABh2vKDy+Q2zLrjMs/h1HsgVulqhYLbw/w3L0+K7TRa7IZ4cvXwMSvId9wAzPkbfrRNYDtL+u3OYoBDoKe0tsJNV1JOBbPSipESLtnQ4HtiaVDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c7gFfzld; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7181eb9ad46so2524531a34.1
        for <linux-input@vger.kernel.org>; Mon, 28 Oct 2024 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730110350; x=1730715150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/Nw+Z2C8++SkotXhnvxy5oczDl/NlKLGO4AgXeyxps=;
        b=c7gFfzldP44+pIcn7kWVc/GEBmRlzRW9K7L7u0J8Izx5y8VPQppRx3YkLhEzlAEcvJ
         1SMGbxEuDOTw5mdgWWSSx1I3YRYMcM76gu8QZgVpEfPJcgfhFFAVo9AE/D16N4fgTTxk
         /ynUpCAbBxzHDrGyhTpmBiLM/GVCA7VGsOiiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730110350; x=1730715150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/Nw+Z2C8++SkotXhnvxy5oczDl/NlKLGO4AgXeyxps=;
        b=iPeTAP1dpzBqePrh8l+nuURYhT1J5baayhFjbo1E1eksFialX8FfC2qt1h8N8SNpza
         R1/Mqymo9y36fCxKbzpIESnMPJodgg1LRAY3fwlBH8yKnQcEctkdG87PNNH34Le2zBgn
         QcPig2hBLz8JzV58DiuVCqMgtz9ZfauosJMYk3tNkiBIdKjIMwpKL8ASabC5xnZZsfzb
         NR1RAxqGPYC/Wg3HIre25HplXm2SopRf/KNqT9PBpqH7g6cKiXC+Um3KjeHMWIUH6Shx
         +urirtxK0SvwTh59EvaPxmRcduwnSJsUoWJjcrML0nDVKvPnzA3rqYIEd+ngc74rWLYU
         UAFw==
X-Forwarded-Encrypted: i=1; AJvYcCWWbCT3xI+JkHp+M6zfW0SzU+W/n2Ut2woNS/lDRPiWZ9clWR2SKPGuFYHNGQMxN+OgJm9JWLtEQVFE4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs791V2ITD43YVBwf6HE188pfbokdfQyQEdgptVYV+lFUMQgT6
	BtKDL7MrvCdWfAoa+fdhsuQkDTEqrGL1Z+crxBV94xyoq1Z2QjjF0957Hjj5xQ==
X-Google-Smtp-Source: AGHT+IHU7X7YnOpDH71s5rrRZNp8zyVeEUWpYp93iX9QSZPr5jCTuWTJHx74iwaLdzUD4h7eRmC4bA==
X-Received: by 2002:a05:6358:57a2:b0:1bc:7c89:6018 with SMTP id e5c5f4694b2df-1c3f9e6315emr78856255d.9.1730110350005;
        Mon, 28 Oct 2024 03:12:30 -0700 (PDT)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d279126sm305483385a.9.2024.10.28.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:12:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Oct 2024 10:12:23 +0000
Subject: [PATCH v2 3/5] iio: Add channel type for attention
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-hpd-v2-3-18f6e79154d7@chromium.org>
References: <20241028-hpd-v2-0-18f6e79154d7@chromium.org>
In-Reply-To: <20241028-hpd-v2-0-18f6e79154d7@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Harvey Yang <chenghaoyang@google.com>, linux-input@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Add a new channel type representing if the user's attention state to the
the system. This usually means if the user is looking at the screen or
not.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/ABI/testing/sysfs-bus-iio | 7 +++++++
 drivers/iio/industrialio-core.c         | 1 +
 include/uapi/linux/iio/types.h          | 1 +
 tools/iio/iio_event_monitor.c           | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 89943c2d54e8..d5a2f93bd051 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2339,3 +2339,10 @@ KernelVersion:	6.10
 Contact:	linux-iio@vger.kernel.org
 Description:
 		The value of current sense resistor in Ohms.
+
+What:		/sys/.../iio:deviceX/in_attention_raw
+KernelVersion:	6.13
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Boolean value representing the user's attention to the system.
+		This usually means if the user is looking at the screen or not.
diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 6a6568d4a2cb..bdfb51275b68 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -95,6 +95,7 @@ static const char * const iio_chan_type_name_spec[] = {
 	[IIO_DELTA_VELOCITY] = "deltavelocity",
 	[IIO_COLORTEMP] = "colortemp",
 	[IIO_CHROMATICITY] = "chromaticity",
+	[IIO_ATTENTION] = "attention",
 };
 
 static const char * const iio_modifier_names[] = {
diff --git a/include/uapi/linux/iio/types.h b/include/uapi/linux/iio/types.h
index f2e0b2d50e6b..12886d4465e4 100644
--- a/include/uapi/linux/iio/types.h
+++ b/include/uapi/linux/iio/types.h
@@ -51,6 +51,7 @@ enum iio_chan_type {
 	IIO_DELTA_VELOCITY,
 	IIO_COLORTEMP,
 	IIO_CHROMATICITY,
+	IIO_ATTENTION,
 };
 
 enum iio_modifier {
diff --git a/tools/iio/iio_event_monitor.c b/tools/iio/iio_event_monitor.c
index 8073c9e4fe46..ed9a677f1028 100644
--- a/tools/iio/iio_event_monitor.c
+++ b/tools/iio/iio_event_monitor.c
@@ -63,6 +63,7 @@ static const char * const iio_chan_type_name_spec[] = {
 	[IIO_DELTA_VELOCITY] = "deltavelocity",
 	[IIO_COLORTEMP] = "colortemp",
 	[IIO_CHROMATICITY] = "chromaticity",
+	[IIO_ATTENTION] = "attention",
 };
 
 static const char * const iio_ev_type_text[] = {
@@ -183,6 +184,7 @@ static bool event_is_known(struct iio_event_data *event)
 	case IIO_DELTA_VELOCITY:
 	case IIO_COLORTEMP:
 	case IIO_CHROMATICITY:
+	case IIO_ATTENTION:
 		break;
 	default:
 		return false;

-- 
2.47.0.163.g1226f6d8fa-goog


