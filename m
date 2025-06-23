Return-Path: <linux-input+bounces-12999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02AAE4188
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 15:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7A147A0654
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 13:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DC82192F8;
	Mon, 23 Jun 2025 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfnmM9Oo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CFC1C8FB5;
	Mon, 23 Jun 2025 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683820; cv=none; b=RingqqXp+56rGniHgIQ/g4IDRpQdrKGpPYwWTAxdNTbDcHai02oBPFqXGHhEshaS9AT122EnKDHcaZCm+G32zXwcqLvYyyWZF854i3YkTG8ZabQR2yV99QMjBuw0/y6CIu3W8YAMoqHVZj/En+mJ0p1zDv0F1cyN+Bxo0zrFWSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683820; c=relaxed/simple;
	bh=JYjxA6sUl6o0+54HzN/yYhYWmaQGx7YU0U32uNmwmzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cI9A5C3EFRnBfL+U4MHch0fdTyj59Pj/5+IeO/vrgjK1ciiZBt0W2JCF2snMumjFdIl2dL4sTNildT5YfLvCjJpUjxpWBmBtw6OIANHWCvPZ6qwmCZAvYi9fHxVNDKwtlG9TJwKh28tDDcgnMvU12VViNCv1Oo6UNq7Z7+JaQn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfnmM9Oo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74931666cbcso1285127b3a.0;
        Mon, 23 Jun 2025 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750683818; x=1751288618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYjxA6sUl6o0+54HzN/yYhYWmaQGx7YU0U32uNmwmzE=;
        b=KfnmM9Oo0BqPlj0G3MTvAXhEzJT9jy8OEHqNNDbaMc+oGYspBOEvih4C1d8dtDhMWX
         UDCNHL/tP39cwGjSLOo+uyw/4fOXkUVWWB8q0Wi+r11KMfeJjHuS3qKSTUAh1ZXhRJna
         zv3OvyNjOz9v5mlZqGDNODU1AlNfFO5kAq5S21wxo9Au7vPzjwJNzgEIe6BWc4Kq+vio
         jvkftbZ8b/2P9AvsNJOzzUITM8xTBU/sryPTLPwQM9wl8UjSwsvstFkQjRZdbr82J3f7
         KlbAXk1t4/EmtQ1heBIFobE46s8sjW8ACy2nv56FHW13lvrBw2kNyDqn4omzBSvcZnUm
         cu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683818; x=1751288618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYjxA6sUl6o0+54HzN/yYhYWmaQGx7YU0U32uNmwmzE=;
        b=sp/zQOER0MGgYSy8pEyzRxZ8QwzN9xEUEs36q7IPRIrbjG6UP+XH/9NTTFNQQyhNqn
         P5/2Mgr5Y7puJm1x2EtR4Uks+n4ljkJ9lWpP1ZB8ZtFc3K20s7nQ8TRhaxglAwg5WViz
         +xdy27LHBtbtCA7kOwi3mUV4WutjeXVRvnl55StrFssCwK6ZVKa5l3cpfSV8r24C9Dch
         9cvjqVp5ke/pob3FWiqVgft6OY/6+c5K5eWMPzk0RdiydOeXDdee48mPoqCFI4fPo9bN
         UJhvXbLYGK8lLdsR3KOkGVsBrqUuuu7p3DTONj3+sr4JRrgKcHJyoXYe5eIHF4d78uyz
         Ov2A==
X-Forwarded-Encrypted: i=1; AJvYcCUK3k36J02/JY6vJpKjsJNPgaJtYwtC0uui7Xphfd16biY2md3S5qEp2GKrpm5V4Vzf1cfQJsYc6SkOMUWb@vger.kernel.org, AJvYcCXvn3377xccG5ejNMDm9ueL+NObdb7xBrTSk4/VTCTlshsstlv5ZwoctTgurvNzb/T5eoEaywF1FCoh7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUBqg2BrTZSk5vLLiDsNW1o33g8Rdc1zL+jkQsE9rVwDDQDHKi
	otcewwtU30zXO6Qu+8/Rr0R26FHVyQ6F+KVbTZpmjFvKLdfJ81A0Cm5T
X-Gm-Gg: ASbGncvkGM6sY3yQmtAtBU/SsX1wruPyNxGG236r7wA512LUuW2txv52s54NEZjaq1A
	nFjXbrQEBHV9KMwy68JsOL/bHDLnF1NBObdgWF9oxxXEXI0SmZwMP7FB1Sb6z3pze1VByPfQ0T6
	FORRJHY1149LRbHYAfHsnq4fMcVaeaKPmivGJ1JhLAjscQUmfCTeT8/Dl5149WVRarSTJ5ga+g7
	jjwLt8gxriUhEheAofdAw6HW9sADfWcou9VUIrtUbj1cv4bjU0C5McszwQNICtfABvKyLNwFGK3
	KjSmne4nK4KEx1WL/ezt3aGPZd1hA77CFJ7aoNRuRzi6tq6pBkQfkYqJ2sUwuVvRbqJOgrAQCfZ
	1Fh+B0tRxgPTKhJGGvTct
X-Google-Smtp-Source: AGHT+IGbONCUw03Vbmj1rT18wsxojWTJeUT7V/XBF8Gx8tmnw29uvbM1WuEYo/dCTZRtnVZYI+3FWw==
X-Received: by 2002:a05:6a00:a1f:b0:746:26fe:8cdf with SMTP id d2e1a72fcca58-7490d4b80a9mr17258983b3a.7.1750683817802;
        Mon, 23 Jun 2025 06:03:37 -0700 (PDT)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7949:b195:766f:55f8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a4a4c45sm8558658b3a.66.2025.06.23.06.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:03:37 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	danascape@gmail.com,
	gregkh@linuxfoundation.org,
	lains@riseup.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] Writing a Driver for Xinmeng M71 Keyboard (Battery Status Support)
Date: Mon, 23 Jun 2025 18:33:33 +0530
Message-Id: <20250623130333.330397-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2n706qq8-45os-9959-7427-83r26344q434@xreary.bet>
References: <2n706qq8-45os-9959-7427-83r26344q434@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you very much for the response,

I was able to parse the raw event and get the data, I am currently trying to figure out how to fetch the data on-demand and read the values,
I took hid-kysona as reference.

I will be sending a patch soon for reviews

Thank you very much,

Sincerely,
Saalim Quadri

