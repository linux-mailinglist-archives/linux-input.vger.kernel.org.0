Return-Path: <linux-input+bounces-9616-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 687FFA225C1
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBF7618873BC
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D411E8835;
	Wed, 29 Jan 2025 21:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb5jsoA+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715271E7648;
	Wed, 29 Jan 2025 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186199; cv=none; b=jzS6fyLuhzfq3ZGI14Wui6nwxpkhV/zpJ82zUh7azLpvyq1seYtndllzTR5Mq4wsqm12MS1ICJfRoSRCpQHwC6lw8eFSFfI64o06IeMdU54CX2M4FdEXZrVuGhblfLArawOpJwJCKAF4rgWRWxIzcsMHvywH2lcKCe6P9qZIysY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186199; c=relaxed/simple;
	bh=u94tzlJBeeh1o0N3oAcI3ehsU+IVSPnmakK1VBt+T0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u6LQJLAx8jFDyL3UALJ5768KVXWxusNK9VorDdyOcxtue/GAhXz0O6ngZEn5GPrPJx/vXdsHhX65nTnqB3bRYu5XDfXEMmk2N4nu+Woiw5UcAkMVoQ2pp84WLOodzvCqcK9SuAI99v5b/svwKDCIvxfIlIJC5bUgXe/SXIPtuTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb5jsoA+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5426a29c81dso16290e87.2;
        Wed, 29 Jan 2025 13:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186195; x=1738790995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJu35yqnkA7n+3+y8BqSuaQXbB7YgLfXvINfiSbRaCE=;
        b=Mb5jsoA+VmKav+5he/To4v4qGiQHlcNyUR/WpgEzGi6LdqVb5fl1ECpIZ1hoZMoRCz
         0sv9RrLXJDn/ghr2cHEJfdXOTkmE0OYo17BoN9ntHdzPAtM/45MOzrYgeQh7lYDcmOEA
         YEsIBOqfqpEG6YDqUrs2Qb71ElQbniGZ1BmZ4k9HxQP8T+RGSpmcrBTAzX3nAH23c9P+
         cqCoYtizz3j4QUngChLg2us8NybODehUauKQ0Z5EXD6cyUCHwXSfnNdI4d/uOlDIOInh
         IE3nN0gjCMVWrfysbRiCuMNey2ML7vL+MZXb88pw0/GIvp0VvufFQs17nEpXcv2RLQpI
         gk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186195; x=1738790995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJu35yqnkA7n+3+y8BqSuaQXbB7YgLfXvINfiSbRaCE=;
        b=vse7fIEa+4rhQLl3QnAndZogs+1i5h3PUmZpMLXfQ4qAHvElASiH2acYzHehcBbCRL
         P2zz4cmaB77Um/hxSyA4y2NMUo8U9RBQhqfUsVwy0zJ0BsvqXsOyQCiBqespPr9/GLel
         4aoR1F7FsmzJfpXtSWOCQIQMJI3mMI9e2k/DD+w7gpTHK2T9o36w1ckzBubR6VQECFGj
         1K3EOSOoEyyyuPxNuYbXYtJQnF47Aoef9NPWA6yhXx4F391ANvfhcd0luf4456kClBHt
         h8ugnh3MJB6atr0RkR2Bo2KbO8UWWJqmblNrGWqrBtCg0fn7egmeEMpa1BFJY6gKrIxP
         Oq/A==
X-Forwarded-Encrypted: i=1; AJvYcCX/gGKczlhceGQSak7qjLQk2qy9XZeyUKZYxRhepyJefnGfbLbcilRmz2TNBUhSwTBPTBiXj//NgoxQ1A==@vger.kernel.org, AJvYcCXxNBxdCAQzGmYOWytOeLnoMHXNHNAX0dwD+hv1T3w3lA3NCuMzMyMkBbigkChZbKK6OhWGAj4naL74@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1vIaMJXj3b9InP1fHnXoonrsYnoEKsoxRePkaAtUKHq4bKxr
	iHfYVfuxj/Cdx6pe2wKv7qz293msF+G80QtJHgb0DUAGkGAgiIlt
X-Gm-Gg: ASbGncvk9VFwL14gfQh9r/dyNBvg/9vONRjhT45TgKZdo8vx89APzWwBWNw3X+Gc7gt
	ZQlyIV474X5Uiw3sGIzGneIcRXdF1W4ym5GmyUpv1CL94Zlz9XtTF7KAILBSqGQKJ/TqEltbcDc
	lVm1wjcAihYJScJnKozLvKFRIh32QJOa+dwia/kZpHItbvfgfVXWLcZDU9VL3ZZkl/+vcqDoBB0
	wTsFT69JBw9PyYl7mHUcOpW+e5qCEMT9TBoXFbSjGFO8cp5juU9Ap911EuGF6ChPpnd2BoCB9pX
	DgND61wjDOkAQfx76hHKjWvdpJXDrlygJ8vTOMoW2bISHX6Y5VnFl3o8ZwjYRQ==
X-Google-Smtp-Source: AGHT+IHueg9S/6JZAVk8Bcei3nKIf2eZqChw0OVwPKO7n73FiKKb5WHOLAtjzBtkFzm4n36yQXZNMA==
X-Received: by 2002:a05:6512:b97:b0:542:1137:612e with SMTP id 2adb3069b0e04-543e4be9a14mr585983e87.6.1738186195378;
        Wed, 29 Jan 2025 13:29:55 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:54 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 11/21] MAINTAINERS: Add entry for hid-universal-pidff driver
Date: Wed, 29 Jan 2025 22:29:25 +0100
Message-ID: <20250129212935.780998-12-tomasz.pakula.oficjalny@gmail.com>
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

Add the MAINTAINERS entries for the driver

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
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


