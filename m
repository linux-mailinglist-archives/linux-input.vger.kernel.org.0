Return-Path: <linux-input+bounces-9393-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B27A16201
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C276F7A3140
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343EE1DF752;
	Sun, 19 Jan 2025 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAMneQLK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747701A296;
	Sun, 19 Jan 2025 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292459; cv=none; b=SLw4pb4J2x617OYau5m+Fr4G0c+i/QG+VXvMfgoIStig8DG2ehmF1/kBdlstEA95BeL1chdGU10xrRq0c2/B9oLI6aaKW02o3uSH1W9a/n93JVjaq6cYYBjRuimQ/jNMXhFAsZAAkdIiF0D0W737JI1qvYY+hXWfSPkgl1QBO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292459; c=relaxed/simple;
	bh=X3oKAxgWxe+mG27lNFrl/Y7mzZe6FgJZQ2Qc1O2lB3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUYhcz3ULaNauZOBtKhRN0BC6RerNw1uuYH8K9w24kOh6XUZEXFUcyo6Cgy1EAutdUj1C0RdXqjbg2qpnjvfbLDhDQPkUfH8czRqguQYH75gvc0n/cL9iq1Xkz4Ou+1eHplDEjUQnAoCAv08ZygGHHhbxXrAQMup/mL2wtJ3LMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAMneQLK; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so555994a12.0;
        Sun, 19 Jan 2025 05:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292455; x=1737897255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCCUBNWASTjznoIXvGN8A5Fk5P/E/6o9JpFjC/mi7rk=;
        b=WAMneQLKX+/5n5IhDIVxu5jpxoJ8w5KtN4WCqDl/YPqiIQA+ZI6NvoaESnkBq9kmOx
         Z9pA0kuewrVWrE6pbolMdc5U+/yxACbJqrkjiCN9xv5txCrNGR9czFDhhlVLTqOCWY55
         zh1+RkXnYG46W5GOizH5b0zhoyyg5nnWWjpkUHrgaCDMusnzo86zI7D8RwGBq6ZJ2qYK
         fAlsVy+VXrQDiZCiI9wDNqseKMvaPlT3nTgP4mxDkuTeYc79FJuwsecEiYLlLun0iT8i
         9g2+6w/Ycaw/wbcWPB8RI/NCS8ZAcljsFd9e4o/LR+yfYIXrEHcd/4zXjbZxG2U6XphS
         fcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292455; x=1737897255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCCUBNWASTjznoIXvGN8A5Fk5P/E/6o9JpFjC/mi7rk=;
        b=QbjZE3ON7V8PZy1+XKo2AMxnCKlaagLzs3ve9xlTLIiNA7EdC8xaV/qECfNpUTuUQe
         ZG7NlEPa067xIHCG2eyAdR0aqhwZNnCZtNJootk3G/dpV2tjHvidRroPlrfGXFU46Hnh
         7WcOUIcGuP5K0w791ImH7vJqk06Wguv4HGo/U1Bgs6DK+1yL8bJspmPeFLhHJ4NUkcst
         CWE+AaNXLcuzjuQ1wY+IYFyIWzO3Z5BWEDnRmo4UcZzoevCE3nie5ofv/1Mnm4V/RXbU
         nwPji93le6kwAdBqM8zagv2SEQrgexEOa0ZcB3hTdLF96mbpd9xF2V5frzXbFNxV33kE
         EqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDWU5VpnFkOBiBlh7S/frrwDvmFx/nns6zbGPQMQU6V9LSq8P0Rl5KpcaSjbIDUeUek6CsBoO2YrzB@vger.kernel.org, AJvYcCXQKGTk6vTgPdo/JB7byoSdAUDf8EO1p0KS2HKBkYRnJumRodI4fcP5ZxzEvh1zjylh6PLCj7eKQqcO/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2TcohOdnk6ZlzksxD0DV4tmPq4n3/BCh6o5PEsQUnGmKSYPf
	TXvIwYlsFaObddqjCAZdOuaIGIUNr8d8jXEIXK08Jb8WNqErhEOg
X-Gm-Gg: ASbGncthEh/mCPSCDUH/lD5ZMww4J68NegQ4/DUDz7qfLqY4VUUcKiwo9pfmAsxoStB
	e3RRZf8B0iTfzjWTgTO25oszlv1jRe6iP9wx7GUokwiXDvyqveIBVGSZLNj6vlCh9uqJJxqBppT
	VjiRRBH2NnnJj6okKkrunGjFxLpnjuKmqx+1BYQtOWqscivfaYDidXpDfqxAoAIG6r9HHQipwsG
	Q6e/vgo8aCNF0fNiQdZKv6xjBpJ2RBC7GZ9Rs8wP8NAntFToleZaFi73d2YNB/1/rC7pW/hTD10
	ii5v7lo5x/j8GW+bqfzAi/dEP8y0mTuSvfH5fG0O
X-Google-Smtp-Source: AGHT+IEzMxVyBIYMH2rTEmj0ysUnUj4pxn6lE5tRahZTA3EvhJmLUlV1xK0boOcSUGCFy5YXWZEJ3A==
X-Received: by 2002:a05:6402:2811:b0:5cf:6635:858f with SMTP id 4fb4d7f45d1cf-5db7d2f8aacmr3152457a12.3.1737292454640;
        Sun, 19 Jan 2025 05:14:14 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:14 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 11/12] MAINTAINERS: Add entry for hid-universal-pidff driver
Date: Sun, 19 Jan 2025 14:13:02 +0100
Message-ID: <20250119131356.1006582-12-tomasz.pakula.oficjalny@gmail.com>
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

Add the MAINTAINERS entries for the driver
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..0a6ee05b6467 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10212,6 +10212,12 @@ F:	drivers/hid/hid-sensor-*
 F:	drivers/iio/*/hid-*
 F:	include/linux/hid-sensor-*
 
+HID UNIVERSAL PIDFF DRIVER
+M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-universal-pidff.c
+
 HID VRC-2 CAR CONTROLLER DRIVER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 L:	linux-input@vger.kernel.org
-- 
2.48.1


