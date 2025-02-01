Return-Path: <linux-input+bounces-9653-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7184A248A7
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1D227A30FC
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391F51A8F8A;
	Sat,  1 Feb 2025 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNeRjYmk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDAB1A0BD7;
	Sat,  1 Feb 2025 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409965; cv=none; b=MWwB6b6pocdb5SXabV5iCn2uVXWcgTLX/DUwE+HxGrZbItCr3a2c/FgwpiSzdi1bCnIxcf/XBEkhSOwc2DhV/cLMZLB/GI082LYhTdge+KQxuS0q9/g7INRb6kA66HXcCVUDD69vr/1IrYpBVXQRIcLJiYDbB5WgO3jhDsI0emU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409965; c=relaxed/simple;
	bh=0pFjaeAZ+9vhycLHZ3O1MuBBHr1mZNnurKvZ0d++5Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pdzUZZAxxckget9VdwK84nBfMl+sApH3NTacRlImAgRLH2TM3CndJRJzYDwF1oCOY3u2bitnh5ugj2oWM0eGsJB3qlUB+nOpx1tvIta7HjwewCBUld2Bo+dIt98gyTUC7kQzjrN2CjwCTZxNQ+hQ/pQRabQMdjVxdkdxvIh6p4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNeRjYmk; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so540576a12.0;
        Sat, 01 Feb 2025 03:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409962; x=1739014762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps9IN3g7n3XWdbEnMnsQ2U0Qa8MzxOpT9XGRt4r9KNs=;
        b=mNeRjYmkzIXZuqUB3xCx/rc1UUXwwO1BL8CRMakKwYWw3Wjz2xgST5sZYrLdhirDRY
         2v4HtBCCHNlv3ET5dTC8tTjdCDlropunpny/DeUN8MTINCjoTxTiIdHjkVZkBHsmla+Z
         JYmYgvI+FaDmuhyHIv3HDr0EKLIF/mDY1Pewx7/hYdtGu4LkARsoNMewX9RhiJLCYand
         xuaqxFUIWTx24+ODlDwnb3w4touYPM5ch/8yaygiocmS/mms+AxTpupVwvG+mKTz9TvD
         z2Fib2rfupixK3Qzh+OZxsc0ucKOh2lYVts8HTl8F3RcKEpS7aocadkKGWkeunMZF7r0
         GHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409962; x=1739014762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ps9IN3g7n3XWdbEnMnsQ2U0Qa8MzxOpT9XGRt4r9KNs=;
        b=Sf4sQ3ifPC4TZf2gFDvG0DUNVmkxKsqcsPSyNwOtTAzhU//F1wyP6APnuHcrJtHtr0
         +2MYt+/c695Vot4q6fJYubNNmkE6ZwaSBkpn/rtpFtfdsVIFtURO78ZXScGQ4DF6MGCx
         pRCY8bYIyG+AJhsDt84BkGuUeIIRm1RkLF9Ngd3H+kw+tT256nLfl4Yf1pqQ+17e0SYn
         c63ngBTzAGH/uZZ4BEGU3keQkF0MBoLekgApSMr/tWzbQrDNk9Q+QqutwXm58EVzfi3d
         onOXNYyhY+zpU8pjKmYyt+jmMwn9Dt1QHkGiaWVJnniaB0eBMwnyTgB263xwW+Fqb70L
         3s0g==
X-Forwarded-Encrypted: i=1; AJvYcCWFC90l1N4PBcw3YVKcfqtaMGHFrwjESm8GRrJ8siXdY7FsGSS05qD4b0pfXuSRh6WQMnH/zQYh3zO7Ig==@vger.kernel.org, AJvYcCXHAT+YhC/RJvHRauJOs6i//vQcWSc5Ddo8M/rwmOyNtxEVQYI5R9huOAaAWTo0X0e8fF9Q4gD5fbul@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVO7Ex5I4Rrf68vO6/DyiDLHONTMVz8EsS1SJphuaSszroqqQ
	NAzwPHTU0G0OUQu1gINyRBpR5/kYk8wOM0mhYLKeDNuoZqgvCSgf
X-Gm-Gg: ASbGncuccJQoXpmKYh+DjpTBTtbRdszfgJL9eO2mAQjReyVdnsyYfKZ75y7bNFnCKJ1
	bzVOpCAgsTCZBuzK/SEy7Sgs0stLFG6661Bff0u1DJLyJ15aaXEgBdGebxvdpMgo0KFUXHC9S+e
	q3OQ+5/hqIfAQdF9lK8RjFJNWpmxBHzDNxpPuQPnG5FEniPvVAUP6wI4c4S43ywVESopCmVl68R
	rMTUm+ModQRjD7GcwQHDte7PWoVdn1gqtnfoDSfa4KgI/eCEZwaA4+IQtvb9q1C98gfcRhswqam
	OOsbF4VAH/HqxIlSud3Q1JEUxfg/aCYsPAEqV13yXI6HtyZbMyytl0xT4TRxfg==
X-Google-Smtp-Source: AGHT+IFg0T+SrTAOVc780nPTDwTM5gABwllpdbNV+dT9KnwVcpawg08bQoWt2eE2rhGITPyvqOkXRg==
X-Received: by 2002:a05:6402:2420:b0:5dc:1294:2dda with SMTP id 4fb4d7f45d1cf-5dc6e450206mr4396219a12.0.1738409961560;
        Sat, 01 Feb 2025 03:39:21 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:21 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 11/22] MAINTAINERS: Add entry for hid-universal-pidff driver
Date: Sat,  1 Feb 2025 12:38:55 +0100
Message-ID: <20250201113906.769162-12-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the MAINTAINERS entries for the driver

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fa7c5728f1e..810046532e0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10209,6 +10209,13 @@ F:	drivers/hid/hid-sensor-*
 F:	drivers/iio/*/hid-*
 F:	include/linux/hid-sensor-*
 
+HID UNIVERSAL PIDFF DRIVER
+M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+B:	https://github.com/Lawstorant/hid-universal-pidff/issues
+F:	drivers/hid/hid-universal-pidff.c
+
 HID VRC-2 CAR CONTROLLER DRIVER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 L:	linux-input@vger.kernel.org
-- 
2.48.1


