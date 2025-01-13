Return-Path: <linux-input+bounces-9193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB91A0B779
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E46164288
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6400B23A565;
	Mon, 13 Jan 2025 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj9BrStD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400022A4D2;
	Mon, 13 Jan 2025 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772582; cv=none; b=eW3dSC8lhu9FSBn0SFuJeE4eryyUzrc22jLad1hogpKOFhDSv/YKJ1EvK9rLsc0HBNA9z32osFAKZaRo7K8WIceszeslv7SE2XHSYndPFaV5bqA0FUQlxXMNtqkIxj+OrOreu6ADgFclucDQ+QyDp+PcpG5YVkVd5yHbq0J9RMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772582; c=relaxed/simple;
	bh=AsqtBCn/763fag4qo+cCuu2010gu/LUWczGp21PxJdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7XPM3VTwg/pPc7MaBojUcmb9XqHxmXVFpW9M+9vdM+BAoRWvTMvBnR9hZh0HK+PNQ72bN4qXaLUhqM2wjtGD6DZA+QNZQy8smMljYevygLqNeMVuQB+mWz+2Ru4VlPBanNU3UU6CXC4PmiWW3HzQpdthyxvCs2KD/XRq6CloZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mj9BrStD; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30156c52c25so2416211fa.0;
        Mon, 13 Jan 2025 04:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772579; x=1737377379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZFzKdNYm2y3H3rB33WTR2xrLGfvEaCqZxtdd9rlq9E=;
        b=Mj9BrStDYrNiCxr45d9caiQ9cugAiGR55rPT+UJcwvyYiRPlQqrtwKJxNE7+Yar6Ru
         o0pJaacie+6CtkhTBANiLDrk8DFEvvtq1p/K1c6pYivUo2KVx2vjeheX6P09wVxj8Tic
         NDqouuCC1gVUJDc5Cu7H0Z06GTWGr9ZHsuXAdxgC0EG5I8YAG4vedmwosLSMKWl/bNKg
         RkyHO7qTLsqIkfA7L8so7gteSNsj/4A8kvMqrfSalCyoDqCc9nzXou/CNSwvp8ezBrz6
         R6kOlqse5CVMExNNG864zj8+v18TmdncHeUZhmnHST2NcN4h6tS41iLZq9/M5RSWPzMT
         bAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772579; x=1737377379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZFzKdNYm2y3H3rB33WTR2xrLGfvEaCqZxtdd9rlq9E=;
        b=HJN7hh07NBBg7q3BS77h71rIGSVbuFNQCKMWM3123PacHDK4ofmVa8MP76XjTrtYiR
         fFzhVNr2sO83qlpsvikQT0SEUDK5WSJNss1Lysg9FLIDNhdCOBDqpPbiodOOGCK1U5zz
         CoXLagpkYnAud9WjDTOQzXBx5dWu845tZ6aFgorZAb9DNPU5z6LV7W4OPYjq/A/D06fV
         CQBynx1inTAB4g8EtVVFE69x2B9FQKVvpaWA6W2iMzS8r7hjJiNjdfADHx1Rr5b600ge
         1VnISQxay1aSpKHybyK7W7IdUYCHRLS7Qy6uMrFZlivrkYsrJdPO62TJWSdE5KOH4eND
         TeyA==
X-Forwarded-Encrypted: i=1; AJvYcCVorj7ofxR4S3/YtjBCDCA2RTt/exdBsmVUloZUVJeWL57mj47BPnEY47rIbWEF0PbpS7lu6UF+deyo@vger.kernel.org, AJvYcCWLavvtvDx92SKDQf9NauBeaKzK4YqG3IAC2qlyQCne+VIXSptMiwZggm/R7CSFxRn/kfA0J8m9zZrgcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvZFGcqdvT0HQrsgsWEZ/XHow3NrCblG+Q8WEMciYqCW1ItuA
	LYq4d0AqSFzFXxleyQy384wAoBSDUUblkiG0psHSIQKSMvvAEFCH
X-Gm-Gg: ASbGncvess+5Jv0iiTlJKjuE3QURJmNYTrTH4xPYGYgapM8iNDPTzvJE5Yd78xVQFkz
	0mOs+mrGZhF1EV43fcD0tnal3e5k/mV2WQuq7WhcMql0MLEqZOi/ss1t7BybEk05QzOFbRBK5W9
	6ds6ulSAT9F/185A+EKZeABY4M3YuH8OC3IDeoIXEraCD4d6K2qQYFBKnhlH/4/aXECMc3OgB/D
	vqkHYGowpcAOh96A69bstF2l0Mn6EcVRKnPaKz5UDSyHDNnHSB2mHotYr8p7Y4KDU6NywWPnLJ4
	k0qJJTt5vCQwOs1MvzEd0tIXvLU=
X-Google-Smtp-Source: AGHT+IGYPxX6Ph06tSbiahG+i/xvxxzUSZjFXa2hgtW1G53OKDh3RUuU4CubkFsaL5doUpgWExA4bg==
X-Received: by 2002:a2e:be21:0:b0:300:38ff:f8e1 with SMTP id 38308e7fff4ca-305f4543831mr23133101fa.2.1736772578824;
        Mon, 13 Jan 2025 04:49:38 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:38 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 11/11] =?UTF-8?q?MAINTAINERS:=20Add=20Tomasz=20Paku?= =?UTF-8?q?=C5=82a=20as=20hid-universal-pidff=20maintainer?=
Date: Mon, 13 Jan 2025 13:49:23 +0100
Message-ID: <20250113124923.234060-12-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
2.48.0


