Return-Path: <linux-input+bounces-9950-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9020FA30D9A
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D94407A2F4C
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E56524C68F;
	Tue, 11 Feb 2025 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InKwrOwO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF0424C664;
	Tue, 11 Feb 2025 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282584; cv=none; b=NGgiK+zynsLNF5fbIU21ECQoaJrO/O5D0iK2/yNZeg35GV1xZL/NxRmlK3McjneSb75e/EgdcQfWe6cJEREFzoNCBxlraOwrE85379dpCUHEoJ1fBfOm8IdNTvHVUV0l8kQ7jmEePvdniracLuTGbCrS69ynvjrHx6q4y1yB2QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282584; c=relaxed/simple;
	bh=rXfdeBMTBbtfJmYSRFooYj8KDxEnwCU5eVGSMsWbnNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpaL37VJC/7bnZAYZxm3/3EyB9F9+kFYWJMfmYq4H2vA/wd9ouB8yKcdQoUeXUYZDUk+Fr2hc2uwK96lymnia6gPXRzAUyRf9b8Y32P/6i4gfyajTkT49BKom2wO4fN/U1SPyQPyTZOxmen0hkOWEHBI/rEF3pqzgfwjQBMcG08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InKwrOwO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5450268e513so557363e87.3;
        Tue, 11 Feb 2025 06:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739282580; x=1739887380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3jtMK7Cdw1QSg+0fiYiiJDikVdcPsB7CP5Wzet0gf8=;
        b=InKwrOwOgLu+RESNoFDtkR0EjLmEc4pYTomJ3gbrzZQOuz0KMU+uwOPDCtWytV29ya
         8Uhq5PnjGOyaqLkgntkuyJBTPaiLD9zzZxYhbV/G5esWd2cyQgI1RU/5lFia2qMzV5GR
         m33pRnQXOxZv8xRbu1i9SrWmcIp4OYzJ05LhhDSVoGX61Rfbjq6fqjTaiepWT67iHsBP
         TOEimJ0SADBU9kx9oFlgrDsQpUCrCrzZiu74TKEfeGSFFFFHSoYy6ZKXu/VOhC/RkUpJ
         QemlLD7gxmcgMkrTclWxVzQIcTXAgHpSlgrFaszDrBnbXsJk4C2EXS28iLszPER6gOGN
         43BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282580; x=1739887380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3jtMK7Cdw1QSg+0fiYiiJDikVdcPsB7CP5Wzet0gf8=;
        b=YfOzKftNynSHLfyiMH0b855+u1vhF8FR8qTrqYi5EN5nsAE/RRVcf6svVsUZOzqnQ9
         LzmxPuTp562taWPSN2wdcarNwtn9+7UK0MtxCQR1LlfLWVrjPO5DUSDcHtCR2JOfDYVU
         PKGe2IJ0KvsKtkftdttHH4KgIG88J5rI7hnsB1XnCSHjywjug47NEOP7PPPhVRkyguKN
         X2yFlyxWmUSGZbiWfdZS3u2vCm2enbNrcefJju7LgGtuEpNi5Ys+ulAEZjoDbK49qkaQ
         6rH76ihGL6TS+7aiNmdcaeT5w0tbdjCNzkPhZjK4NtbcyqUQGmFV74JBgPfkybA4hFsw
         fVEw==
X-Forwarded-Encrypted: i=1; AJvYcCUQiT9ued4JHZ4zguFG5+8nmlIQhwzx8aIE109MRQzvPWUHY+0/selNulZiFG3m7K6CJNXeycHBp6L0@vger.kernel.org, AJvYcCX9JK8UNuHYoisXgHvpkvpxQc+3wjVaPDE4TzDxVbBFVXFQnBBqG9bFAGXyqR++gskVXlASjM4Y9zMQJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQmnyS1wUod1s7IFaN9s0HqpsnYV+XKR9Q9gxNxWg3OYebxXYQ
	eqxZdJyxPjEOXTeKhHueLQQ76CX4HnrKXe9ulj/qV/ADnDIUqsG9MSnqM2u1
X-Gm-Gg: ASbGnct1eD3LKap4XssdCA22u8kKQYpDhFDTzHV0x7HWKwwa7sf14Uo/yN+A/wjCzd9
	1DajE64DHZWJnsTi+GRiXIfA4Xft7uU/3UubEOx8DJH9/dBpI+5STItY8pb6JYF568iyvWOtu1q
	htLnDdbcdTeT3a0+/rj7aHpVJ3nJ1tg60sIJ3UVBVO7d9VFBLm0viSBqGaLvslnTO0dwvJ90Np5
	R+Wx8/fHrd+dxzTvuQsFVb8NSNqg7GmYHQe/yaxIYlQXQ7lDaLm5jiP43WJwW67lkNchKQMKbg6
	bdu6+D2pPpn9bha67Oxu10y+WL01l4UzLQRHwhixd5avU4sl8SWYQc4stp2qrA==
X-Google-Smtp-Source: AGHT+IH1D4AMGufWjQwGssvu6ILYKgy4YLH0BrY3nShVfo0iJwi3qqyLT2MsgIpVXk3Em0kUcwajkQ==
X-Received: by 2002:a05:6512:3444:b0:545:842:fd34 with SMTP id 2adb3069b0e04-54513ad6c1amr256299e87.6.1739282580240;
        Tue, 11 Feb 2025 06:03:00 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545014af0d0sm1118721e87.184.2025.02.11.06.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:02:59 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 1/6] MAINTAINERS: Update hid-universal-pidff entry
Date: Tue, 11 Feb 2025 15:02:47 +0100
Message-ID: <20250211140252.702104-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211140252.702104-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Oleg Makarenko as co-maintainer

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7c37bb8f083..df40587f6ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10258,9 +10258,10 @@ F:	include/linux/hid-sensor-*
 
 HID UNIVERSAL PIDFF DRIVER
 M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
+M:	Oleg Makarenko <oleg.makarenk.ooo>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-B:	https://github.com/Lawstorant/hid-universal-pidff/issues
+B:	https://github.com/JacKeTUs/universal-pidff/issues
 F:	drivers/hid/hid-universal-pidff.c
 
 HID VRC-2 CAR CONTROLLER DRIVER
-- 
2.48.1


