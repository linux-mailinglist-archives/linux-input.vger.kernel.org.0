Return-Path: <linux-input+bounces-12730-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9B3AD0849
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 20:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B342D189E1CC
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 18:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EE91F4CAF;
	Fri,  6 Jun 2025 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="me1vbtH6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5601F4CA6;
	Fri,  6 Jun 2025 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235843; cv=none; b=IEvdk8RqO6C6YdLq1uDdekRQlKFFOSgA6p6WSwLJd21cuE7qZWnva/8fwcbtzm6wj6O9Jf+/0be5KSL6zbHl6pV8abtpbF6OZHIrMDla4Mbt763t21b808gobV6V4+v896aKQweu8agU3WHOx3jdb7dtps8iCXIOQoaV5yT0iYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235843; c=relaxed/simple;
	bh=nkUvevFHBEYITDhC9X1tL+mMaruxONFG3+Czq5DEl9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uWswFyBxCvlyuVXxfwO7ByeAEn3HppEPtBd0NlSSEeSj8+R/FFXvATRavhMMWxV0G+j2QckL0fP2oOHyS9rAvSOlhYEbV3He+culhfRauxDvUKDRdYQBkhOs98zDmmGP5nJGq1nGRRyZdeKLJaMAqhcBmvtgFLs0MirADnIRI1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=me1vbtH6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so2069921f8f.1;
        Fri, 06 Jun 2025 11:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749235840; x=1749840640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ltlfK4VAqY2/afqznk26/g8AZIhvK7lNV10GKBdt3Y=;
        b=me1vbtH6MEGbQcmahN0p6knfB/lYCu6dfCA5Buy8JM5iIP99OQoFYvg2pOyB/+9DuZ
         6/W0mfhFeJD1WXoBrzd1J9GeXDYVEOkLHTv8S973wfxzN3cZ2g7jSK9qZLhKHmZU91JV
         ZT5XAq59/4lv1maxPcYYxBBKPtTsKZaJVmbRdoy0hswc94rB59JSehbAMLQx6mxN97rl
         /IFvpypgxlCX7nQ9EGpwD0DvoLRTHb7KbL6G44jqUF9upTrgwPuALfhYtStOXJKDn5UR
         +Tifb8tjFhfoVmp+dyn53cOEOBUnWvhIJ8BKb3dfYQSDaXiuHp/Yw8QK0z6+aGuFxNgD
         83dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749235840; x=1749840640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ltlfK4VAqY2/afqznk26/g8AZIhvK7lNV10GKBdt3Y=;
        b=RC1NMxnmvpQByIk3EA1BVdzvVsLtGAghTaOurSosRUMI2nwPd8wvG0uZ3DH/7uc+Br
         9IPeJcH3pcgXoPyzLFnzNkzfA3X9z+CCNasy8yGb7XdzC1xEKRsI0Zwo6rpY29ysy8LG
         udLK1qcUU8UCzZKI7xV+mKcLPlfQhRsrIsIo1qyP7DBaQm89UUGitdRSPjOahJFt5a4G
         3eENd4Nc2Dawxxluetc60rsrW878bFeraJmQdrN7yga956pvQK70MZzfSsxWl7+WIsW4
         vm060pmD10O1dQFziSE7VK0CPaGliAZPZB90hNSX29FiIOIF7C8krBLRpBYhNp0Xv2Nm
         P5eA==
X-Forwarded-Encrypted: i=1; AJvYcCUYmtNTNyfVV4m4S87eoPPV9lO5SiQ3XlgcDzPOw967Eb9/8Z/wtaLCQTTV+CJo5JoibeIl2XcHZzsnk2zd@vger.kernel.org, AJvYcCWb08Uj+GX6uCAZkStDzwGo8cLiYG8VYaYlRbkmNLV+0gRIOehBko1t3LqeYloXbL3KR3KeIS4G@vger.kernel.org, AJvYcCXnjE5uxaBJ2gLZiKLUb8Hnqq4Xjs5dadDmTyUDIss/bcYLdsG2N9d/JEJnEArD3oxPZQzqWIHcdZJTGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4/0he5YAHi2I01ZLTIFDhSFlwrgar3gY5NTm1pg701NSdqbo
	VxyIJz4k8yiiDIFd7HdCxrYqAFUNSMeLSK63gqDqtUm3uarYH7xmPwl2
X-Gm-Gg: ASbGncuXcbiGU5f7XYsVIksSxG2vIVpTMChJ11ZeGSYfJcLA1jodn3mMvrIMuUK077E
	YK5GsZsDPWEPlZNb+K5+MXvzmu+v2qyMvOSVdtEdUdUsetN/KbgN2KNMqtpvoDLw2J2Aokhev8N
	EYA4Y5z8a79YVv8wWrEs7iaNnCxwA4iAQYAK/PzvDOAAkPzYHuqGW27nbFw//sZDjyP35Pt31v0
	c7jf8GguOyprjCMw5cE3xOTMcN3oHNetWkYmR3hySygRipc43gpSRpXc9Hay9+s4+3slYjF/Pm2
	J5+pc/Xl9VS2tK0jwlZSTYFQwm5EqeMKELHIxUXdEN6sjk47ZSOADSGGlpi5Sfs=
X-Google-Smtp-Source: AGHT+IH/94E4mFrP2ewqInyn6q7B0DYxbzwousQ8WeFchqMQvKFsIJ3pYFutAaYmNC1kQE6AwEk9oQ==
X-Received: by 2002:a05:6000:2088:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3a531cbd87bmr3380350f8f.51.1749235840320;
        Fri, 06 Jun 2025 11:50:40 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:44e7:a1ae:b1f1:d5a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435771sm2713057f8f.63.2025.06.06.11.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:50:39 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND 2/3] HID: wacom: fix memory leak on sysfs attribute creation failure
Date: Fri,  6 Jun 2025 19:49:58 +0100
Message-Id: <20250606184959.35915-3-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606184959.35915-1-qasdev00@gmail.com>
References: <20250606184959.35915-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sysfs_create_files() fails during wacom_initialize_remotes() the
fifo buffer is not freed leading to a memory leak.

Fix this by calling kfifo_free() before returning.

Fixes: 83e6b40e2de6 ("HID: wacom: EKR: have the wacom resources dynamically allocated")
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/wacom_sys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index ec5282bc69d6..58cbd43a37e9 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2058,6 +2058,7 @@ static int wacom_initialize_remotes(struct wacom *wacom)
 	if (error) {
 		hid_err(wacom->hdev,
 			"cannot create sysfs group err: %d\n", error);
+		kfifo_free(&remote->remote_fifo);
 		return error;
 	}
 
-- 
2.39.5


