Return-Path: <linux-input+bounces-5812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E295DC01
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B402841C1
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C981547CF;
	Sat, 24 Aug 2024 05:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8iqDV6a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276461514EF;
	Sat, 24 Aug 2024 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478662; cv=none; b=kpRtCg1uYvlatMWb4JBuFaNQvHhXWm1uOVnMH4OPdwFRHzy1iKZQVp0HtcQceDqyhbcfciOVhBliD2bTOsv10+ABE5Fsy9bAGISamC/XPR63w/a7NPtrseq6TJY+L4VZ8LxBryE9pxJrwV9c3fievx0Pvx4+w7FXvbRH31TnJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478662; c=relaxed/simple;
	bh=LOjd101Xy/X/zP6hxJ0OIH+TJD3G+l/KW1/diVKMQII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADV1Nh0hrrGKSSJghY5T9rlvRpW1D/yt7v0Jo+OnEoZzJsYbj394pzF+eVzV7+EgfoO3aE7uZGgiU1ODcAlYKpQAaw1adywEvDzdQ36B+xMhIyQj4jlfMUp3byxHkxInrE/a6XqrMFNUvfdhOzoOaJSleVxdtUcQKW6F/PkkKZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8iqDV6a; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-201df0b2df4so20890085ad.0;
        Fri, 23 Aug 2024 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478660; x=1725083460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiwPVBWS9hQXQBSqTAgjSYAnOWrQbyMBgnrH83inBt8=;
        b=b8iqDV6afX42GNG4MH2f3yvr5i5rxp1oYwzVdlRYyCDiclkcHofPLQgC+XXba1XkNF
         sg3z8Fa8ahELNUzUYlzdkj1dagl96q1qIK1jbb6ykOnw3hNS8SeTjflkaufVo2AqpQrQ
         cyimM9yh7/OJP8iKCh/X1DOJzwHyHCsJ5HPoJOJBNd+3TWl4N1kkds5UvjmEnG3YnStr
         +jIBAXGxWBwfJsFCBkDlFYnTPHUJFCEgKT8DzkkA280wJalNQK1ufoDzmzPi5n/fxDzr
         +WowCYMBoawJLhs2HAlRnmT0U7HqS5eJRLLM6l/x07Biq5RS9+UlPVZRvMBvB16YIWg7
         GNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478660; x=1725083460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiwPVBWS9hQXQBSqTAgjSYAnOWrQbyMBgnrH83inBt8=;
        b=DfNdAbS06nIker/IcHlYRLlth4vXCBTRkhNoKaId0AXM/JhGmKYykCirZp5wmehJMT
         19G21N+hm//NO/X3MLOmHBRTyL9ZZcJxJxZcay7s97eG/SEXu2oWhmFc4Ux0x8TySijX
         XhFgDqTk9jf9l8moWbx1dNX1x0jO9gzlP08WpfF66T05m5DRFwLSuk3bbdUM7cHwm7ps
         rIaW4onkV0KjKe8vuVXyqj+rIUVFmNGExjxEXkOcOcV8cULjL3eqt9NS5TCI2QsiGNaz
         T1HOG3R5DYUZESdmu8ctzFARgp/xGpSfdB5cq4SEckvH2dD4swMAe8w0/vwBp3KbFek8
         lvWg==
X-Forwarded-Encrypted: i=1; AJvYcCVICxVIYhbCJTftE9gBy1mffj8QvsMw3imI3NhzISrPM/USEWkwuRhw2R/RPz41pkPkNE/I7l0yk0gArQ==@vger.kernel.org, AJvYcCWaYngq1AStHNOIs4QFU0ouikWuviqcZmzFBlXV9ELJ/vi7e1oRyshu64XOOW5kGbJl+DQa7v5yTKy6lvAG@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQbR2nXrTDhPCYEbjPtuMR6wrsH48Ds7kG5rvyTLmvmjNpMES
	R39y9kZVhCFXBETxBgUX3C7VMMLWu8OQMGXcLclTAnr0PhS1Ls0Q
X-Google-Smtp-Source: AGHT+IGushiJY78lKaJuM8cDmw+yw0Me0YLR+sRvnCRsA53D6RqunKu/mX3NIrcsLzRDAdg6MWaF1A==
X-Received: by 2002:a17:902:da8d:b0:1ff:393d:5e56 with SMTP id d9443c01a7336-2039e4cab1emr52244185ad.36.1724478660123;
        Fri, 23 Aug 2024 22:51:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:50:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/18] Input: zforce_ts - do not explicitly set EV_SYN, etc bits
Date: Fri, 23 Aug 2024 22:50:28 -0700
Message-ID: <20240824055047.1706392-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Input core and various helpers already do that for us, so drop the code
setting these bits explicitly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 5a8f79b800e6..a6f6cc5d8a3f 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -814,10 +814,6 @@ static int zforce_probe(struct i2c_client *client)
 	input_dev->open = zforce_input_open;
 	input_dev->close = zforce_input_close;
 
-	__set_bit(EV_KEY, input_dev->evbit);
-	__set_bit(EV_SYN, input_dev->evbit);
-	__set_bit(EV_ABS, input_dev->evbit);
-
 	zforce_ts_parse_legacy_properties(ts);
 	touchscreen_parse_properties(input_dev, true, &ts->prop);
 	if (ts->prop.max_x == 0 || ts->prop.max_y == 0) {
-- 
2.46.0.295.g3b9ea8a38a-goog


