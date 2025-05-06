Return-Path: <linux-input+bounces-12162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E594AAB88D
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 08:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A0E3B4B8C
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 06:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8AC2FC104;
	Tue,  6 May 2025 02:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="At87cP+O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2D44A62C;
	Tue,  6 May 2025 00:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746491504; cv=none; b=olLnxjCWjDOLAfrxIKlkMobhJ/QeGth2unDmxpFyw6VhMA+n/6ZJ81iCEaUlEYYBOeCNr9jDOeMZUUEnTXHK/pV+cfUkvxz1LmVTTUDx5deF626RYIdP0ax6DFJMP7tG/PxQKstl7iTl4QMaMeccjBGz2vwpKNtU2VgNpgKMFWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746491504; c=relaxed/simple;
	bh=J4W3QlDUEySP7cK+t9SrKwMzhMxe07fnSzbb4JHve/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qEETe5zn3wgMdCVdSaEA8vPd4DyP0s2lECbwpOmRVpVHbHPHgv1eNKUid71f/C0pygSaTneq/ERpWIp1Qvvsc7mEdGyUt10ZxbtzQcgTogDHsrzSHvD2voKHLwimQHe04mV3uRqPG5I9gQPksQlvKdc7up1EeDc8/0d9evy7uXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=At87cP+O; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-309d2e8c20cso6600146a91.0;
        Mon, 05 May 2025 17:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746491501; x=1747096301; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNHr0ZTyT4NKYzLBz84B7MhfveuNCJxLE4chWNqht24=;
        b=At87cP+OdX7eBUCW6HYnMSiQrIvNEClea7P6PdOuRtxaMMOukfLnvVAsDdI/ZnDHPl
         W34yJ+SX12rwk3FBxpH+h0Mb5OT8xt+otXwcmIvrK6AIkV7RToCZU9FFVQlUQwUBAQkh
         xJdceDJckUZAC5MLwFH3ZMsjcjY77yuUoS956gW7FtVbcwstyy+o023ekSlu3LhYf15Q
         zjqNVbb6+icOLU/dgKt2OvfG3Ip98GTI1ilwk//3kKNnC/+vDhlwfeIgdCICrD/NBasX
         jlnsv+4A5XYr2rtSBTtnNv2KE2AJoTL2AUh1G2WWNx61xlWuj+PYMSN8FyQYL2Qlr/rC
         T43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746491501; x=1747096301;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNHr0ZTyT4NKYzLBz84B7MhfveuNCJxLE4chWNqht24=;
        b=dMQ1PQ4d3rb9jZfF2OolDwU1FAt4Dqp3ISZhxkOHYS75FBSdCBXFdxYnFydbpoBBiR
         Ux3vgwc4ChZE67GGKTWIxsa2q9Xgw/hr0VERhgdVdf07fvzO3DLRA3aU051Arp7qrB2+
         /7D4ZHNAwx3AeChNRzUYh5W6SvsDo5RwFjE52lqog+s6mCas8tpA1wwL1pzgvJGlbi27
         XXMjxwoe6IdL9G33wfs+PIkDqgylQkorYp7zaFiJ4BsLKIxeWHr3CMN724DYVmPQuDwK
         JpkgwgGxVfdODa6vw0Tww4NpxyL70RuQrkV8mdLjjS90TMZz92qtxW/+iz2VvKYN1AnA
         KYSw==
X-Forwarded-Encrypted: i=1; AJvYcCXVkfZ5fIZYBeUudUU8DckDik2PNRcvWSFgwHjmK1AQit8eio26dLZrJikCjg7rxDrP4J/QKDLHp9Mlz4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw3/tIUBScYdVQTJWCNOs5BlWc0MYlFgUxrPWvnI3aKX4z/jvU
	8IaUdz+jpgxNsn+IYt7yCuXMsTv5EHzVvDHOoCmZG2FLlCw0Tw9FbAopiQ==
X-Gm-Gg: ASbGncvUaooS5JLip1wrV4p3WENPAj4KTnPvF10R0Z/Hcjc+6+sMMRDY3TJ43Ux3S3E
	+zpCliyrz8QrnOQlIT7oGeO5iaGCDGw7mG3bnDuDvfbk2tu3KoKTUTVt0Huw2w8VN0xRwp//ThM
	Vkod8C7MvKQfYizc05na9g91u93nsLVrZcfzfhbU57QLIScTFrwDLK7y0ZOUrS+OcifRhnF6mgy
	gwrLDVH/+lwrXpmQYXsIQi185FodxeSMLWqyTWFnfdrdnDyA/nc5ni1UZrpwKT64LmaOQF/Led2
	Sgs597zVavJFW3D4zn8V85DTOHCRPHR+vyJ5elZgbg==
X-Google-Smtp-Source: AGHT+IE69qUFAPVURFOW89Aa5yjzLl3Jvp+TiBQvi80s5DXqUlNolA7Vy6vs8n3rxNe3o+bVU1bmRg==
X-Received: by 2002:a17:90b:1e4b:b0:309:e351:2e3d with SMTP id 98e67ed59e1d1-30a7dae582amr1464158a91.12.1746491500631;
        Mon, 05 May 2025 17:31:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17ab:9e47:29ba:57e6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm9801128a91.22.2025.05.05.17.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 17:31:40 -0700 (PDT)
Date: Mon, 5 May 2025 17:31:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: jt <enopatch@gmail.com>, linux-kernel@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Peter Hutterer <peter.hutterer@who-t.net>
Subject: [PATCH] Input: synaptics - enable SMBus for HP Elitebook 850 G1
Message-ID: <iys5dbv3ldddsgobfkxldazxyp54kay4bozzmagga6emy45jop@2ebvuxgaui4u>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The kernel reports that the touchpad for this device can support
SMBus mode.

Reported-by: jt <enopatch@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 309c360aab55..fdb471060118 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -190,6 +190,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
 	"LEN2068", /* T14 Gen 1 */
+	"SYN3003", /* HP EliteBook 850 G1 */
 	"SYN3015", /* HP EliteBook 840 G2 */
 	"SYN3052", /* HP EliteBook 840 G4 */
 	"SYN3221", /* HP 15-ay000 */
-- 
2.49.0.967.g6a0df3ecc3-goog


-- 
Dmitry

