Return-Path: <linux-input+bounces-13459-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62749B00102
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 13:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E01233BB6EF
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 11:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFBF25485A;
	Thu, 10 Jul 2025 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsbjY5kj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1D24DD1B;
	Thu, 10 Jul 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148712; cv=none; b=V8Fl7PmNfwGHBVmBaIhjcqXh/J1AYBDDeeJAkUWfmnX8iMy09qC5H9BFbI5HtR7WfKL6dJ9od2rfldaafRMXSkGys4FQ/4wMue8ifHI9bbpmS8weWrp8zarKxvENnAvUcs3lzgf4nIwH84PAml+DWO2C3CVvp8kS3j+2JqT5VJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148712; c=relaxed/simple;
	bh=phIl8APHRhPIycM6T9xgoZ0LkCXuLTSGetz9ZKiWESY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HAGNj9QaLiHOx158gx5EElY6O9q/Eusf5trCkOb7gub1VCAOQRQNmU/fmSUSkbolscNbY8Ye7Dnw+h50I3UScSOTnT/YGeThgebD4OPjJvwCxqRnZ2kcLmxmpIlnZMBpOC9rmgAmbmKeCT53G6hnaXy8U3HZB9UeRp9bvBFvzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsbjY5kj; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so992105a12.3;
        Thu, 10 Jul 2025 04:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752148710; x=1752753510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYAG94f3cdFe/xFr6SsC7bkBwmMBOuw9aXBootYb5SI=;
        b=fsbjY5kjDYSUvTB9/gZV0AzmNY/EefVenpyiwicsTn6iDMDswjGummbxVtQjoojGkb
         0iYTrTwmtQg/mIcdCvvhG9iMz8gzQIcKG2xFVHbpFON6jQB+74ZF1aW7Oz1Ji1PtF2bZ
         zvZaqHLz5K+QGRxcv9I7OYA9M8vc56vIcpTLQDCKQhSpKK3nCdYKKQd6gupRYcq+Da+h
         dwUGPvDGvxNcT4FVwpe9C3SguiH/+rM+KgDPKNI1owUyhWD2k0KNH9TIRustNKbzfJm2
         RE7T94XaOOpmO1SjirAQR5jR2QSUAZpLhEaS7dKhcsozRvOAPA9bY6BJHq0UL4e2sH4/
         jYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752148710; x=1752753510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYAG94f3cdFe/xFr6SsC7bkBwmMBOuw9aXBootYb5SI=;
        b=KfF2ouh1WBYqwJXWKrwXFuqBIXnUKXyr8lUCHbRVAAPqE2MhAcduD1ptyuOXg6JpnG
         DjfPbS5wlIA24zXLFsUeyuzGvL6SrDN2O8mE75byfitSb5hmMmO3jcJf0BMlO6rV4dVt
         PolkBx9xCevhBK+jnHFr2FUvwy9RQ8MBNsikb82ReWVjZ7cPXsmYtYlBS6swYRRpZ2os
         73O9idGbJw+9mAoY0Gm+TmwIv+umkCyq+U3v+TshAOv9nWDVB6N5mKtFuhK+NqSUe75m
         YtPKaUmZgqax71MXCycdEpdjG3uVPztetGAG0Ie8h0x3ED8o44BaFcjdt4qpjTO+FhBr
         Wo+w==
X-Forwarded-Encrypted: i=1; AJvYcCU3IzY+qffUzmRxtlasbHDJmbiBm22v+wXClvvL0egD2mmrTrNtyfiG0J6f1TAIpQb2/59pViCuAsIn08We@vger.kernel.org, AJvYcCVB8imflZ2S28LvZwZsEl5pMQh66FfkxGCqapaEDdxFLAkrcHnkcOXJTe5SGRudc1ps4buujOzcRIkLIDA=@vger.kernel.org, AJvYcCWTURUc0FLfN9ZuvJBtBp6xUgLP/tMwoGdsYpf0tcHMemWcXRDtbZ/TiXOiMT9ZhweGrUcvjmm5GiBb@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXzZtpxSnoOTRFIaEhjuHeLtVj1KMspiiJzvtC+MD2/qDKsLl
	Xct1K3HDq7wiD6mEneBjY2pt1jcg+TCUQr5njteEWtVQF7aiXND0rD5P
X-Gm-Gg: ASbGncusiJeEtmm5Cb2LDH4/oua+QCMmAZLuh9Elt04WD8fMDI9S/jmht5vGFBewaGA
	4BYmWgSRxYIO/keH9lgRJN6B4dTt0s7k4cA+JLt6c+YVUv6ak5h1MKkMl9O8QsSCyClKt6bbSwJ
	eOH14kDgmr9J/bcNXh6U1o/i1xPNG8Ddwk+9GkRUhYAJ3ZV/S6snpKphmT15SR1KuJqeRpfY/Mg
	NmHWyNq5zCWa45m0YxjjOi1pf6gsJiwZOEGLJKQZeLJ9WNyY7g4es2UB3rZc3aYnjHksKUKs19f
	//kzp6s5y5/5Q/IlkYdlGE8v716WTdMH3V5Y3Yezmxg82Hgj7xEZU2D77J7r8kE=
X-Google-Smtp-Source: AGHT+IFdsFuMSTURrwmuDpYpWhonrZgTX3su3tw7c5E/wekRv3ilQ1zodr1Iaoebzy9KO2usRdOYhA==
X-Received: by 2002:a17:90b:164b:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-31c3f03860dmr4002613a91.25.1752148709962;
        Thu, 10 Jul 2025 04:58:29 -0700 (PDT)
Received: from nuvole.lan ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4284732sm18510685ad.10.2025.07.10.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:58:29 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Len Brown <len.brown@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Luke Jones <luke@ljones.dev>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Charles Wang <charles.goodix@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/2] input: touchscreen: goodix_berlin: Add stylus support
Date: Thu, 10 Jul 2025 19:57:31 +0800
Message-ID: <20250710115733.226670-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a new input device dedicated to stylus reporting,
allowing handling of stylus-specific data such as pressure, tilt, and
side buttons. The implementation distinguishes between touch and stylus
events and ensures that the appropriate input device reports each event.

base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- use existing input properties (Krzysztof)
- add handling for touch up event
- Link to v1: https://lore.kernel.org/linux-input/20250605054855.403487-1-mitltlatltl@gmail.com

Pengyu Luo (2):
  dt-bindings: input: goodix,gt9916: Document stylus support
  input: touchscreen: goodix_berlin: Add stylus support

 .../input/touchscreen/goodix,gt9916.yaml      |  12 +
 .../input/touchscreen/goodix_berlin_core.c    | 240 ++++++++++++++++--
 2 files changed, 234 insertions(+), 18 deletions(-)

-- 
2.50.0


