Return-Path: <linux-input+bounces-6978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F49198C1DF
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 17:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA9182857B0
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADEE1C9EA7;
	Tue,  1 Oct 2024 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGx8/Vb2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179531C8FD5;
	Tue,  1 Oct 2024 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727797361; cv=none; b=N530ICVTFLsllxSJSCeEGC8jGiPjYR1aUnoR1hg/dHl/Isy6Tf1AaseLG7GQE4ZCWL1dajir9mtxwb1qt3WxVHwZKaoO+aUr1ZQhpUtENap7j3sY3XK+CY2/+gsyVRRFgKcu1ZRbzJvwMilOcoyrGbiCIDRZnip8L0YEjNem2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727797361; c=relaxed/simple;
	bh=02hzgVw8bH6CztEufYV4J2X0niV6dR0jFwpw5ic1gm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+EnjGt/fnJ6TcofqdVPeB5p07pnP8Hby+5GJtNljIAgrRqHDQmzn3Mtrtufo5RfTcoiulOD8wQeRpkTPu+k8qbb5Y9ZH7xbEUdk/LPPax8Ln8JEASt8Fv7E2B2SQnx8joSTg8mMF6dfhkVnnLb47Q/bmbqyTlsDuwvSfzSfCls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGx8/Vb2; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-718d91eef2eso3998552b3a.1;
        Tue, 01 Oct 2024 08:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727797359; x=1728402159; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZqtXKxlUHtQqFwavxIwLnWa/YowVxtdypLuN23OVYs=;
        b=bGx8/Vb2tTTiwgeK1IDoxwA7tjkoBDTnKnzLZurs+h3JS6jezJ7byrGHZaw/2fwlvF
         BbQprOcF4HLZ4D9IsYhu3WUiGrkEZWpObzR1BiQqpKCUd19K9N+o6Sjpll0oCx/7C8JO
         KTkW6jEsfy8VssMj5aNgoNHEUMXWJ5mk5Oizmsl19J9WoWa7rvk8P/x+f6ZMl/10AdHk
         ttebmd6YR4zbDXALn47hEvk872Px3m6ecsrASLq6ysESid9ytW/3GvFTFrpuoBgdcTzC
         EXJ9v5OD7Lk9KnD8LxnY8StZrZOj0z+yugBFE9HbrgPHhz53dDbatCARIk5HWn+McHaZ
         u8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727797359; x=1728402159;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZqtXKxlUHtQqFwavxIwLnWa/YowVxtdypLuN23OVYs=;
        b=k8kncckBtB8iR76wTkaebPQ5ifZDUuboPU/bZr4tCYQwowNG/CfQI4G08zQCICd5XU
         6Tjiswcox3e9drOO2uvGehVsJnj0wbUPSDckVJNsXsCNNXF0s5cgmWgruJwXv4I+89pZ
         qSo3xMnLJUdZ7E2s2Qa6alyIjKt1xjEWfX8zrupZKCmhQYGcudyvd7sz9eGFJuMRcnnP
         cA2sL2FmFmcAiosu5eoTQlEXhGsmrUA2o85FToDlniVhUebp4iHxF0Xqoq7VKxavFpFz
         NLax08CV5QuBeVQQDf+X+QXhRZwaElF3KC9+MKftJfSjYUZwoh+Wab+w71kZyuyWMMdN
         GaZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZkHY54dmRtjYmUFFv13DR+mjH0tYZFkejzZXUrl7NWrGleMwkC0f+htgUMavwm0ku5RB0IR+uAWgnuBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfAp9695qIrDVfwnRECkuOQix5zLzbTUGkqMTbhfCj+PrTTL/J
	R0HCUGHC9fHtMjoGwBqPwXuQCHS4ni94ptSjuyGhin5kBhxwQccJ
X-Google-Smtp-Source: AGHT+IFmzi1XTbPS1D7pkB77wCQcZl++lZ0gH+AVt7EtloFa+mMA8w1JZMMuAD7KU1yjLLM43LkKGg==
X-Received: by 2002:a05:6a00:2e90:b0:714:228d:e9f2 with SMTP id d2e1a72fcca58-71dc5fbc9aemr28926b3a.3.1727797359267;
        Tue, 01 Oct 2024 08:42:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bb694sm8203084b3a.65.2024.10.01.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 08:42:38 -0700 (PDT)
Date: Tue, 1 Oct 2024 08:42:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: simplify code in fetch_item()
Message-ID: <ZvwYbESMZ667QZqY@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We can easily calculate the size of the item using arithmetic (shifts).
This allows to pull duplicated code out of the switch statement, making
it cleaner.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 988d0acbdf04..00942d40fe08 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -754,35 +754,32 @@ static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
 	}
 
 	item->format = HID_ITEM_FORMAT_SHORT;
-	item->size = b & 3;
+	item->size = BIT(b & 3) >> 1; /* 0, 1, 2, 3 -> 0, 1, 2, 4 */
+
+	if (end - start < item->size)
+		return NULL;
 
 	switch (item->size) {
 	case 0:
-		return start;
+		break;
 
 	case 1:
-		if ((end - start) < 1)
-			return NULL;
-		item->data.u8 = *start++;
-		return start;
+		item->data.u8 = *start;
+		break;
 
 	case 2:
-		if ((end - start) < 2)
-			return NULL;
 		item->data.u16 = get_unaligned_le16(start);
-		start = (__u8 *)((__le16 *)start + 1);
-		return start;
+		break;
 
-	case 3:
-		item->size++;
-		if ((end - start) < 4)
-			return NULL;
+	case 4:
 		item->data.u32 = get_unaligned_le32(start);
-		start = (__u8 *)((__le32 *)start + 1);
-		return start;
+		break;
+
+	default:
+		unreachable();
 	}
 
-	return NULL;
+	return start + item->size;
 }
 
 static void hid_scan_input_usage(struct hid_parser *parser, u32 usage)
-- 
2.46.1.824.gd892dcdcdd-goog


-- 
Dmitry

