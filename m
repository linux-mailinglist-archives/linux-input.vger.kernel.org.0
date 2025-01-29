Return-Path: <linux-input+bounces-9623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D80DAA225D3
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B76AC7A2D59
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167981EB9E2;
	Wed, 29 Jan 2025 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RW7yxqeP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201451E47B3;
	Wed, 29 Jan 2025 21:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186209; cv=none; b=or/fFx/3qHmDI0esUkosPPKkn5Giv/aAGN8sU4lJP5LzHAzQe9JeXNqVfqCPK/KeN5xHb6GJytJ/wqXX7vIO16dXvh0RU2Q0/1xtdpiMdJfqJ/eY3tKDSyGlKyIXpUjbOFuCfQogIKJ4E+1H+8VlpaOkMpNt2jdCTLyrSd+RmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186209; c=relaxed/simple;
	bh=upc0huaMUErf1cPjnKu1oEXsWM2cicamvfM0Mh6YjGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nNk1H2NCMjDIrSZsOuEioQDLLy+TXNDi2Lx7mfdWsZrb1jOIEjWMYZrrSF5d6e+44/ccwTMbhoBL1CuqOxJpF3z8dEJ8zgQuFbOekJg6RYnvwSMnXam4r7IPGs3jmlhjfTPVqSJbdb0yx1gCBXI1/mTRpSCdg7m0Inn8nN83mxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RW7yxqeP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e36a1cf4fso15287e87.0;
        Wed, 29 Jan 2025 13:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186206; x=1738791006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsJSUlcX/sY1UV/qhU+jMDcWcR1sDmY+0kNDCFcAE6w=;
        b=RW7yxqePdQm2GoYr7v+mC3LlwpoH79fyLKEVWJx3alasBTYm0vy0JGh6ZV+aiiBekI
         xaMGYutT7DXa9ZyqQRTq/Q4lpeNuM3Aw/uNTM6PGiAHgH2h3ete9QMAl4AiQDObslE+H
         m86zp366rKAt+LtZCZ9II82Tg2lKepp1b1BQWi/TCO5u9ZyTTM1oyuzMqIHMeVm+FzyO
         emoo8EZrEbTXGFA4CJGd8rxHbNZ8iYDIn3Jk3WSmWF4TY0Yi2PqG9/q6FVyzFV4eJ7rm
         j5D5REnpgbw7aKSZsodv89sGkftTrzNkzFeyDOORq1zees27pMPT6XB+rl5duTE3IHmZ
         SRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186206; x=1738791006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsJSUlcX/sY1UV/qhU+jMDcWcR1sDmY+0kNDCFcAE6w=;
        b=oL9PUsID5CngQ17OTkjBn5oQekYqolFQG4yd7g7982MubmA2h0mMh0t/3JLEYB3KSD
         YSTZAHrPvhMFOAvvVG7ZOB1q/tA6qvf0eYlrdc4s0cIB3G8/ScZGQxjeRVluTTmlmpl4
         5awnh7VMIfZGZT2iZvQwWugDIB0DvgINDxTuLdz2ereyvvgg5e6RF2G4x1BDnVDR0ayH
         UtlNEhiI0B5E+myvE1CKATnd0ni1+x7vuzIVy/QqjDkQAUkpu/YpCcboCRTfZ/gvlIJb
         HoM6E38qDcWCpO7nowXVtVzWbdCQ/O1I6bpVgk1Gm1N7ssU4ItrEMMIKBL2GDeIyoFt1
         JyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsogEdO2nzl00C6h4CcT++fsMiFG6LCdrtyI/ZmBoySL5HyHwEZ6ua/MyxUQGQNNgYKHLD4cYdabNl@vger.kernel.org, AJvYcCXxElcJFYQ0Xw1iFGd1nYce+LVhVPTlhtcYQOwo6aXQGXCbK8LtJgq50ZfoWX0DOlhY/pwABkADIjlB3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ZSTf8eCfhcjwZ5S+045HyQ/Egp1AEXt+YNslWhiiRxCQNEOj
	c1aydcJ+6gFCO8HW0tpzMCVRmsHikraStZo2f4rAqwLIkNmgNAYL
X-Gm-Gg: ASbGncuV3k5FFctZuwE4YeAPix18qV3Lu12OUpyQsBMzAHfWkVgX5C7EINMEau1reER
	Bo82SP25klkJhEr/JIUPumffQ4XFgYLlqROMy/Ho2kwg+i+ljBvdbI3PfNCAv0kCRFUVn/lGK0E
	6q7FCHBiqf/VdhlCod25ylxXUhrbptFyMeFGlXwKXfRNuNBHrN8ExRq9wdyilxeyWCkglrGTH9N
	QhtcxdKjU4BcQ+qtg3JZK6BtOmAWf0JZKnwaKHSymq1H5nKBX+1tkKut2fpMfOPTu7K6j1yfjE6
	B//WP8MOhxc80o98qZlmNbDWI/zIu/xS7k2uyvOxdb1Js+VUO8oh4m/4nXwNIg==
X-Google-Smtp-Source: AGHT+IGB4g5CDahT5Jyl2GG2+UYumD9mBc0UaYBTXXyP0rc0nDzfF5jyl3a00o8XQKC5/AkSPYUDnQ==
X-Received: by 2002:a05:6512:1042:b0:53e:3756:80b4 with SMTP id 2adb3069b0e04-543e4c3a317mr580027e87.12.1738186205852;
        Wed, 29 Jan 2025 13:30:05 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:30:05 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 18/21] HID: pidff: Fix null pointer dereference in pidff_find_fields
Date: Wed, 29 Jan 2025 22:29:32 +0100
Message-ID: <20250129212935.780998-19-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <forest10pl@gmail.com>

This function triggered a null pointer dereference if used to search for
a report that isn't implemented on the device. This happened both for
optional and required reports alike.

The same logic was applied to pidff_find_special_field and although
pidff_init_fields should return an error earlier if one of the required
reports is missing, future modifications could change this logic and
resurface this possible null pointer dereference again.

LKML bug report:
https://lore.kernel.org/all/CAL-gK7f5=R0nrrQdPtaZZr1fd-cdAMbDMuZ_NLA8vM0SX+nGSw@mail.gmail.com

Reported-by: Nolan Nicholson <nolananicholson@gmail.com>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index c518fcdeb6e8..b791e37e564c 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -926,6 +926,11 @@ static void pidff_set_autocenter(struct input_dev *dev, u16 magnitude)
 static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
+	if (!report) {
+		pr_debug("pidff_find_fields, null report\n");
+		return -1;
+	}
+
 	int i, j, k, found;
 	int return_value = 0;
 
@@ -1050,6 +1055,11 @@ static int pidff_reports_ok(struct pidff_device *pidff)
 static struct hid_field *pidff_find_special_field(struct hid_report *report,
 						  int usage, int enforce_min)
 {
+	if (!report) {
+		pr_debug("pidff_find_special_field, null report\n");
+		return NULL;
+	}
+
 	int i;
 
 	for (i = 0; i < report->maxfield; i++) {
-- 
2.48.1


