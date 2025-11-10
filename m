Return-Path: <linux-input+bounces-15972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC6C45092
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 06:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE2C53ADDD4
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 05:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0125F23B605;
	Mon, 10 Nov 2025 05:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LacHBl70";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFXxq60y"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFDB15A85A
	for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 05:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762753665; cv=none; b=bc7qcxayAnVcJCee90hdEl63uBLFWKQtHQhvNbITppt/iY37tubjtCJAbqSKq4yWb8pLUIwdr5eGCB8oizmdxJNVe/y6H/q/wD+c66YzGAYddPWU/qgbgLAak/bq/83MzZQT0QQ+6qvYNTYwwZM1WJJ95OhgcHg4YLbjQJ4bDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762753665; c=relaxed/simple;
	bh=YJ3BZTtfcw/RfpDQRx5abrEDF8mvR1AzdIWq9uO4+4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZ3POXXD7XUMI1yY+D/rd+itYo0KFOFQ4PIR240Qq6evgCLLlDM3TudHh30WsLUiruYzEf3d24dw5Hgc7Otng7YuD3pYLKBnu1/Iwn28rCMRi/ZZNgmtBMXkXuDbt9iD/kfbYZd09ttQBopXJwysjCf0geVLOvCjCrx8f0V+cH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LacHBl70; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFXxq60y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762753663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RQaAl37qZpJp8CXFfUzE16/w8LUDu3uajsmunq/iTJE=;
	b=LacHBl70OVG3WFIAJUKmTg8r2AP9qgUX9zBjs/MCjNTOAcgZml2RR8b6uxaxgQA4AimuKY
	Za9R73a/G6VVcSJw4340GKlZIaoj7VA24exgX9kLp1TC0PAZJHe/axtm495Xz00DDLd0iK
	U/bmGMcMsYvvRZ2TVrGlEsXd/AYvPAY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-sjTD2_hjMZmmz3nOIJWaRQ-1; Mon, 10 Nov 2025 00:47:42 -0500
X-MC-Unique: sjTD2_hjMZmmz3nOIJWaRQ-1
X-Mimecast-MFC-AGG-ID: sjTD2_hjMZmmz3nOIJWaRQ_1762753661
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6416b2de86bso2126746a12.0
        for <linux-input@vger.kernel.org>; Sun, 09 Nov 2025 21:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762753660; x=1763358460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQaAl37qZpJp8CXFfUzE16/w8LUDu3uajsmunq/iTJE=;
        b=IFXxq60yn7NQQgsW6QAwSmGflQY5cR2p2r6Jevbmqipvf8iBKChXoDcokETmnxIJUC
         b/KVytCo2vUHPIHqxy7b/+diIhXxZFpGWUgK4r3Uwu8bRHIuvMPk5vSfiRxxEtgaA2rI
         hRVBB6wxg/I6vqRQtHvgsVlfLxjZfeBA0PM2vPaEnkKNLq+fFWa0jD7hbqw+1jdhpKmr
         DC5zIf+aVp0lnP7h0WG2xZmBIf8Sz377xRBFoCXtlgodQknnbCchLZS1fF2S2O5qrf/t
         mfXrVTUoQoXT4ro2ksyJQQkOFbRkwR5IUWHtYTBOf4iCxFuru7QLSP/L+iaaXpvn+DXX
         kfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762753660; x=1763358460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQaAl37qZpJp8CXFfUzE16/w8LUDu3uajsmunq/iTJE=;
        b=lzQp+RmgkBf2FYKvFtKrVSsGcgV9DBzqNpqlk29z2sKJRqeJ1xF6LAEDDcnrHgZnJO
         Eq0Z4sj8ADg+hgfjHmKgQbNl9d515IueAHpFbwBqCD+VzdAcKmCYHIwK+Ar66j0owt+0
         zj95+LS2vy3PwPLRLV+Jg8GEAsg6IxX7Ny205amtgPr1nbwXuzxACRKR32AwzZhAjVc3
         p9Z8Iat7lfeiddfqftmn5GzrK9+HxuHudLlqwgoXE7Uc1wJc43xGtyebr98+Um+47Fc3
         dgMuFwL3cnACHB3NRgr6EbBgQCY+MS4tD9KKuC7fbqRIax0b/sLwRv9nTa2cDEevI8a/
         Z6dw==
X-Forwarded-Encrypted: i=1; AJvYcCUL8GXeKr+QrrAo9pVSSug3OzpWw6wE32cxgV/r9jmOuvurakz3zIki9S2mWyjtWCPi/6qSotDOLPiNIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNQagGSpBaExWM/DqC6Zz1wv6zWlmOf7+gPGb2Svb2fyC4yuX
	7C4h5jsmIv7oGFfZhH69tAEeF3RL3QIh73bd92vwuc3UNKeirwm5cf00pLmgfW/v4gxiGVhA+2S
	utCFrJGkDdicTb7A/tqJelRKP6db1i4Odf2vBoj2uRtfVrslBFHfXbxmP8qCR0e5qARrJRfY8
X-Gm-Gg: ASbGncteu9OFFD6B9qNDYdFb30Mf6etoos8cW9dLD8KilsihfTeR4NV1pJZX3qwOGVz
	oyW4rHgx6Nh4lAIknWc6X6RK5a9A6RIo25leGevBsLWKThn3NQMIQDLmzUHL9M6mk5Mr9jW9eNo
	m+6pP+9S5dfe7+e9Lh8TD0Y8ZoF5Kw0Y98A/YtobV3pjWjZ8uYbXeqHBya8tfKjTOZsTsAyq7vw
	J5HI/LPs24gf39H7rSH7S15kgwoPUq6i2LZS+cZPVOga+Dgp4a8A1fT8wIffh4HG3ucWgTORErb
	5IXKi/PQu9D9fJ38Rd1fDBOBrP5CW3EtmePxH3LaGmS+/S7JgWS4iDXTU2JHRSnEd9s7PTUubb9
	Y/RBEbgiOnwIcboeNYQG6qVXEBXLl9UoLKa3hDuTatS0AtP0f
X-Received: by 2002:a05:6402:1450:b0:640:7690:997e with SMTP id 4fb4d7f45d1cf-6415dbfba36mr5698082a12.3.1762753660472;
        Sun, 09 Nov 2025 21:47:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFztFBKZhlPJh2YWtsA5qKNwBUxmLe/vKjcOZksHYngaDToN73r0z6KmaOZay6WJDpaRa9mmQ==
X-Received: by 2002:a05:6402:1450:b0:640:7690:997e with SMTP id 4fb4d7f45d1cf-6415dbfba36mr5698062a12.3.1762753660148;
        Sun, 09 Nov 2025 21:47:40 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm10365924a12.11.2025.11.09.21.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 21:47:38 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Job Noorman <job@noorman.info>,
	Frank Li <Frank.Li@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in HIMAX HX83112B TOUCHSCREEN SUPPORT
Date: Mon, 10 Nov 2025 06:47:33 +0100
Message-ID: <20251110054733.441893-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a311c777f298 ("dt-bindings: touchscreen: consolidate simple touch
controller to trivial-touch.yaml") aggregates a few touchscreen yaml files
into a common trivial-touch.yaml, but misses to adjust the reference in
HIMAX HX83112B TOUCHSCREEN SUPPORT, which refers to the removed file
himax,hx83112b.yaml.

Make HIMAX HX83112B TOUCHSCREEN SUPPORT refer to trivial-touch.yaml, in
order to inform the maintainer on changes to the device-tree binding
relevant to that hardware driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 982998ec1134..2a881629003c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11213,7 +11213,7 @@ HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
 F:	drivers/input/touchscreen/himax_hx83112b.c
 
 HIMAX HX852X TOUCHSCREEN DRIVER
-- 
2.51.1


