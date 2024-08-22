Return-Path: <linux-input+bounces-5748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269D95BB5C
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 18:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2505C284816
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 16:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C951CCB5B;
	Thu, 22 Aug 2024 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlzsDJsS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5791CCB32;
	Thu, 22 Aug 2024 16:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724342873; cv=none; b=SXyKAZGwqJWhMt6/PNA9nHr2EYiT1a2+kBNQkNqqX0knUNflH1BBILxsouHNNEgMW1Uj0Ra0teA82CWYt+T81GZ+0iTsfhsYVb6SWKISaHOwfPWuAU1brLMbiJjq4QVz7monyQMbeRrW8T+UhOsQFCkQPWuwnLKxD3i+9gGKsFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724342873; c=relaxed/simple;
	bh=cUzKD+tbdq4LCnt/hKs7v+W/NuTP44c3Dn9kHLS0iE4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RCCRxIyprG9nVJGbWn70l7yyfE+fJ+fxrUwBknfSXTxlPx6vgq+b5pua2kUwLbpMtHJMKSwgCBrWboxsVDUaAnHwwMdJuZNsJbREM8XVzJif8mq8CHyHrUXm8cPu+CnP2mK5uA1rWUbVdPFj9g/1Db5/zp+MYWwGMn6x4SIOTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlzsDJsS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bf006f37daso1680271a12.1;
        Thu, 22 Aug 2024 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724342870; x=1724947670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IEbh7R+lyfHz4shEop2PmKNu/aR/WKGPaVWFITmcvSs=;
        b=RlzsDJsShzecQDul2EyWbgMQSI/Nol9RKu93SOonmHaVgnjQ+KtlLl1wZ3L0alNqMz
         UsQM5uZnLhP6lAPyTTeWLppOdV+937A+88FyaBSJ51DRpJ0d0Lr3md30x9vFI5AdVMCR
         5yDa1J+TbD8OwHESkI4g6NWsVcPumr6tOoPNF4ZmSMx8WJzPBpMILykedhaTptawgfLC
         fWzofLcU2nrwy8rt36RffDI7iLd7aDgVGF7d6mE9X49x4p3nJgiBh2XKry6zXLYxcljQ
         /g8rWs/RNBJqA3bg2yzUSbZvbDjWPIXRHwLQOFTgUeqNAXMSYJYKog5j3KW+cbxPsbxz
         v/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724342870; x=1724947670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEbh7R+lyfHz4shEop2PmKNu/aR/WKGPaVWFITmcvSs=;
        b=n+zbU3Pn+aVaTq7oV1zA5jbDv5bzIlaUfRTf4R9x7gQ7cmNjshs2LjHlygVjivT+lx
         kR1TSAZxM8BD4u9TZzunmP48VdPmNZ3CLqCA/DALLSBl7ZSXi7fabFO89UtDUdIUFeMQ
         mwVvTtKnxMfoUl+w+OUkZfywkdODAoGEdi9LBg4fKUry2ewsig3hv6OMmfZuvPYU0YaW
         dl4l6FuqJrHp04IvzRD/OowsJDT4AnPFqIXSIVAMDNrvSp+n8/ljMCrMgxWxRjTwIVUr
         J/iS1RtTdA8C2tCEsXpJYtB3BWwd76nrq0CRYN8RuBzc4FwAvZ93h9qOiVG7DFsbtC2+
         7riQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmVr9v09/M4DkpDsXD9rviw2hVgftGJ/8OJ36kQKuVY1HLtpuEOK9EADPgcGDkyV3mS3KhGdEZtHVlnA==@vger.kernel.org, AJvYcCXjOdaHhL+nyjfptqlQZRIbr/qhBCTnmIT2hPI3NAhRtlRaNTg8tzR8AUxHkdJ/tFoIov1vX3QCHuv6g3kU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8bMTmoDOgtxkwNmkByd+q2favdgiDuwQd1vu8AKdHjwXZQKY4
	83fJL8AjocDdR8jF27woK9odADCU/Xpfc6JkFdSCchr+DUscXNFW
X-Google-Smtp-Source: AGHT+IEQK0DXEj0cR9UbP/9Q3VS+SCXUX+hL3q26r9MJ66k5phO/X/TjOVexBqoVQB5Hw9KG2Ba+qQ==
X-Received: by 2002:a05:6402:26c7:b0:58c:b2b8:31b2 with SMTP id 4fb4d7f45d1cf-5bf2c032b11mr3590049a12.17.1724342870286;
        Thu, 22 Aug 2024 09:07:50 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3eac85sm1070680a12.48.2024.08.22.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:07:49 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: uclogic: make const read-only array touch_ring_model_params_buf static
Date: Thu, 22 Aug 2024 17:07:49 +0100
Message-Id: <20240822160749.635225-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the const read-only array touch_ring_model_params_buf on
the stack at run time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-uclogic-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 5bab006ec165..d5277d2fd229 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -842,7 +842,7 @@ static int uclogic_params_huion_init(struct uclogic_params *params,
 	__u8 *params_ptr = NULL;
 	size_t params_len = 0;
 	/* Parameters string descriptor of a model with touch ring (HS610) */
-	const __u8 touch_ring_model_params_buf[] = {
+	static const __u8 touch_ring_model_params_buf[] = {
 		0x13, 0x03, 0x70, 0xC6, 0x00, 0x06, 0x7C, 0x00,
 		0xFF, 0x1F, 0xD8, 0x13, 0x03, 0x0D, 0x10, 0x01,
 		0x04, 0x3C, 0x3E
-- 
2.39.2


