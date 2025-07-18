Return-Path: <linux-input+bounces-13587-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F184B099D2
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 04:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09D5D4E776B
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 02:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4565B19E975;
	Fri, 18 Jul 2025 02:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="T1uJ1SPh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915263597A
	for <linux-input@vger.kernel.org>; Fri, 18 Jul 2025 02:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752805987; cv=none; b=Ai0gJOb3EsYXr3kylVZCVhnJ0CjF5FOhiUMVqPz1+p6pXtTmdw4qn59mv07vZjY83ACP64u72HCwAEHGpcnipvZTjv3jJWSKc+hIK/TxjUaR0VwNL+KJUxJSQUWl4KqJwHIJotRqEQX+eM/jRZwuTgtOFda+nHkK+SJ/vsuQVqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752805987; c=relaxed/simple;
	bh=89bnQW+oktKcTyzm3uVj6bqJ+aYdcbbK78X79RkfeJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VyzAs3wViFgzJdkcTO8vY5bYY9OU1LuHwIy5lmne1JjIQlTD0Bp0Iu7RDfzx/P9i9eeOzNayfD0zGEXwr2vMVFtWSYk3LzgYXrnh3reAezUYX+iUOeKh6HPlkPSi8LkrldZZSYHaRMD3zIGglnliN8HRI9LlARi0W1GFpyV+3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=T1uJ1SPh; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so15404896d6.2
        for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 19:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752805984; x=1753410784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RAAxqCyABf2wKOyI2JrUTfPsrV0FctrO/kmfudYcNWA=;
        b=T1uJ1SPh0pz2vOJlDFVr48DUWCSzSkG+wxmNhCBEmgTSCmXTyvXZc0fJKuZ9xQl8BW
         gvQUgDdyFdD1Z+bTOuLNWnNPPljJbKm5WrL1O950Z92oQq3rrKEA/hLa4PhUp7banwFi
         cuNDPao5i0PxK/RrdtO723qDYRMOeXB5U/i8RioUDDZ119JCK9V1HMVqGY8woH+LN1yU
         IvY4Mr0EjASaXbKEvXRWjp0UJlEJ+vlFqNtHbnzpREa09vGkobsy+wrswFtNOtPQkNgj
         lRCx7EpIfV0CdzsQXM9+pjzQfwzw2xWjvALhri3T9mvWfM4VZBBisUYRGMud45Bwly2a
         AO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752805984; x=1753410784;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAAxqCyABf2wKOyI2JrUTfPsrV0FctrO/kmfudYcNWA=;
        b=W/NFZuQfBKhYMVVoHqXzBHMvyCMkGeqaU6g7ZmBIUHWIgxkrlFfETomm12CKV/aNW2
         b2yipOgrMe9tCPiFUSB+/hngF7rP4b12GFmsRxkv6QXw9Y+YnVJU8oqlY9N9ScYNWuEE
         n6uXZ23xwzsi0ImfUpPCLEulrEecWSgdPoYiMk6JP5su7br4D8iuxXBbc+gp+X8oI+e/
         VP2ltLlZHaOSCvkxBVbrRdwcgLOUaihzWH0FBnCIgT++kXQNo7GbzJzVDH4Y1GlzHeg4
         qpKuO/TW0vprDinRpTbyBPr+dD/yKMjfq73HzFOc22hiNmEn1rvqX3rWdr4d/arY3QqR
         5Thg==
X-Forwarded-Encrypted: i=1; AJvYcCWciBmVcNEevf2RWkWaQOgNg6gBKXX+U460AuqJJIbr2+e0ip7UKjD2v4r3+qKS8AAYR6MXgcMK9KL6yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAjxZNtvfp8RXPhBRhlFF8pciTlexjN6/CHKp4vttbMUQnALBP
	1JM9HtuYKZctwuUWVekB/dsLJUqBkJ2cihwbdEoUmnDty0Lwe+W+aNm/rtGw/RSIdA==
X-Gm-Gg: ASbGncvRreKshqXevBZY/vnuHSv2F074wvw2eVuOuy9JqHdT5q8rHN5ZfZJqauEctlR
	eVoNk7a3YV+k7rguIl3slh/W6tlC5mxzeaA7xJn7ogsno/e8M4X43Q94F5kOyjDZcA5QF0Ipu99
	IgAUJsi/Kej9rGNv/UZxQvrUj7eKyAr62770o70bFMCLsnGt5I9FE6n2m2U8rTdMl70/dkpdS2o
	iUb7DqbkI0XwkZ+6/xoOo4BdHqzkoWaOWq7T93tBx9geTyhb+y6NtmsAQ7OkeHjBWbN+qRRFon0
	GUHclO5U16qA7nxIrEm+JYSXw5yKvqclKFIQluQKa73LRTPd3GI42vyYs8nsMDF/K4m2Fjb3Quq
	etYZxVYTVnl4f0omoP60ewh80fFINN8tffA==
X-Google-Smtp-Source: AGHT+IFJ9QJwDmkGC1pVZ1xl39FDaaEiu3s0ssAkHsMaNYPPDTi72o1uGIAwXmkkTkx4lPm2Uxy6TA==
X-Received: by 2002:a05:6214:390b:b0:6ff:a74b:c691 with SMTP id 6a1803df08f44-704f6a6b004mr125670216d6.17.1752805984307;
        Thu, 17 Jul 2025 19:33:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::317e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b90d3cbsm2669716d6.43.2025.07.17.19.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:33:03 -0700 (PDT)
Date: Thu, 17 Jul 2025 22:33:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>,
	jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] HID: core: Reject report fields with a size or count of 0
Message-ID: <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68791b6f.a70a0220.693ce.004b.GAE@google.com>

Testing by the syzbot fuzzer showed that the HID core gets a
shift-out-of-bounds exception when it tries to convert a 32-bit
quantity to a 0-bit quantity.  This is hardly an unexpected result,
but it means that we should not accept report fields that have a size
of zero bits.  Similarly, there's no reason to accept report fields
with a count of zero; either type of item is completely meaningless
since no information can be conveyed in zero bits.

Reject fields with a size or count of zero, and reject reports
containing such fields.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/68753a08.050a0220.33d347.0008.GAE@google.com/
Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
Cc: stable@vger.kernel.org

---

The commit listed in the Fixes tag is not really the right one.  But
code motion made tracking it back any further more difficult than I
wanted to deal with, so I stopped there.  That commit is from 2006,
which is already far enough in the past.

 drivers/hid/hid-core.c |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -313,7 +313,14 @@ static int hid_add_field(struct hid_pars
 	}
 
 	offset = report->size;
-	report->size += parser->global.report_size * parser->global.report_count;
+	i = parser->global.report_size * parser->global.report_count;
+	if (i == 0) {
+		dbg_hid("invalid field size/count 0x%x 0x%x\n",
+			parser->global.report_size,
+			parser->global.report_count);
+		return -1;
+	}
+	report->size += i;
 
 	if (parser->device->ll_driver->max_buffer_size)
 		max_buffer_size = parser->device->ll_driver->max_buffer_size;
@@ -464,7 +471,8 @@ static int hid_parser_global(struct hid_
 
 	case HID_GLOBAL_ITEM_TAG_REPORT_SIZE:
 		parser->global.report_size = item_udata(item);
-		if (parser->global.report_size > 256) {
+		if (parser->global.report_size > 256 ||
+				parser->global.report_size == 0) {
 			hid_err(parser->device, "invalid report_size %d\n",
 					parser->global.report_size);
 			return -1;
@@ -473,7 +481,8 @@ static int hid_parser_global(struct hid_
 
 	case HID_GLOBAL_ITEM_TAG_REPORT_COUNT:
 		parser->global.report_count = item_udata(item);
-		if (parser->global.report_count > HID_MAX_USAGES) {
+		if (parser->global.report_count > HID_MAX_USAGES ||
+				parser->global.report_count == 0) {
 			hid_err(parser->device, "invalid report_count %d\n",
 					parser->global.report_count);
 			return -1;

