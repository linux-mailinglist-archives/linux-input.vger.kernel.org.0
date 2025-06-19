Return-Path: <linux-input+bounces-12962-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C6ADFFE9
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 10:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12B997AECE6
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 08:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DE54A1D;
	Thu, 19 Jun 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KW91+g12"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FB02641F3;
	Thu, 19 Jun 2025 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322121; cv=none; b=qIPQ0Bk0vwf1ESwMgG7DnDiE52aIpQCXwjhDcasZvsj2a2JDmdVAZLlM/LyooR43FhPYhx9iWKK3IpZsgjItRkGZXaJjqC1Cq7h6cFbe5T93L0E1tudtgaz9L+K5vLs0wcJK5yi8HavFzV30r4uOKrIdmYL6tORQeq1SnXSjxMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322121; c=relaxed/simple;
	bh=fnG3UYTBXQwWDGnKURkUlDJVYi+d9in9GWlEID8z8Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zpqof3kh56jPlzG6KW4POnclo7YtM4Ki7UEo/AN53TBwgmStrO9tKDAb8uPJIg9c7THHw/R/WzXWSv3be3RL+YNxqnbkBYyJVmKIrOjz+PATHNC+UccwBmH2zdy4TcbRBrLlb+wbxzNIJv9KmUmuyfxyzQWwWdI284vF1UQaGS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KW91+g12; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4530921461aso4103925e9.0;
        Thu, 19 Jun 2025 01:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322117; x=1750926917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9nFCq9OfuG7pkBTDyjuTc6I9PQsj+gS8fWvj5scqkI=;
        b=KW91+g12IeA4Londqj0ub1iv3g6O+Wpxvf+Lykz4/QxpaAGN0z2620c5EeMRvBRoYE
         UKttHSmr4nq2DE3ODlgkYPm45GxrSgSeCEVflLU4FBFru90ifRJR16ArVwCCfWr0qlJm
         fYn1G8B1AAGF83zIE6kdmOuwTLJqjyXjfgq8hAnGL8gEf0XAoEVNZ7nfJzRn+BZWuMTq
         UOjlYBmpODktx0Me1MFpuRT8m1pnYXt6iOwLaKe1UpDQJmvrwJefNrdt7xS1lEUicxed
         NNclaatKxchAFPqAhwhcxG67Kr8UuiHLtS/yPg6kgik2jFeBDfouEvTX5Hb+S8PZzuMY
         CgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322117; x=1750926917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9nFCq9OfuG7pkBTDyjuTc6I9PQsj+gS8fWvj5scqkI=;
        b=iL1CrjmYP0TjysAWejs38ORuPLvdH20OM/eVkK0phmYr3ZBDhekxXpJAPQ0OQ3pMME
         ScNPa6cdLh1ZWo7A2jLLBPHmWNtus0LNpPCZjN/V5rg6+xpzz3OqylR4WjioixPo7c6s
         mELmoMqy8bo+u5Vq3g1jbp0EwOF9rqPLEz1GFSdFzG/neTJaWCBPmN3NO4LK3gYMRULM
         lp5M0mCFhVUz1Q7ElROjiLciFRaN+n8C97CTNvXVj3N6soPDAdzo7FaTFhhH3e0sbu4w
         bfltI1wZSe1ldEuBmkOj0KvswoUp7OHAz/NOPvSyA+fXVFwsgP5Q1cCVZCLeOoTQLdjV
         8tJw==
X-Forwarded-Encrypted: i=1; AJvYcCUVSnP+P31uhi/6kFpXpQ/7LK/4o1tK0sPBHe2Tx01r32Nk0w9sBWiqdxwma9Gsvto9hbWZUDlzjLSj9g==@vger.kernel.org, AJvYcCVKTNLS4QlwDg25kbwyHcV4TM/n3CIP+nOs96zMuiUPhOIhsRDGrQbJ8KcVhYp57Q7Gie/inFZz6kwjRIma@vger.kernel.org
X-Gm-Message-State: AOJu0YysBnR7lWI+V2zCazIFel2x04ckOAlxe25l7JK/RZg5Rcfuiknb
	zF2bAsz6SkK06plJOaAonHZM2WVEemIWiWT9guaYKOkUt+U+WfIC95HE
X-Gm-Gg: ASbGncuBwipm4ykCfDlVaL9W67blVqD3KLdCP8TMMpxghkCddUV2V6fsIyt7QuOPDg+
	6Q8QRrvMP4x0wV86C0vXTMLJAIL5LABH596jYGq6DCRQxSifOoJ6dtChtXT3TRMeJWpv95svtbL
	6FNyT94AwgXkrHOtRwv7zl2Fi/1ztHt6VQyit6d02w8+f4JTvLrRI/1VejNH0UIzca/s0f6zJmc
	s5d/A/jRR19X+ppPBzHAS3rytw0zUYyya448BqNkCwrrEt2wpA2God3TGiRWxPdhXadjeKL7e0S
	Yjn9hCxci2jDB3R0snq/z+35fE/YXv3yFAXiXjFFit3QNWmk2U9qxHYNBQ8t
X-Google-Smtp-Source: AGHT+IEEnxlQVoOldWNtJDXkuWNQYZerflt41TaiDMPC57mF6/kf81w0B75l8q/ink35vX3K9wm/JQ==
X-Received: by 2002:a05:600c:4e0d:b0:453:c39:d0d0 with SMTP id 5b1f17b1804b1-4533ca6905bmr206186135e9.13.1750322116820;
        Thu, 19 Jun 2025 01:35:16 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e97a915sm21500195e9.7.2025.06.19.01.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:35:16 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] HID: uclogic: make read-only array reconnect_event static const
Date: Thu, 19 Jun 2025 09:34:56 +0100
Message-ID: <20250619083456.1835598-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array reconnect_event on the stack
at run time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-uclogic-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index a6044996abf2..b3d56057cec9 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -1341,7 +1341,7 @@ static int uclogic_params_ugee_v2_init_event_hooks(struct hid_device *hdev,
 						   struct uclogic_params *p)
 {
 	struct uclogic_raw_event_hook *event_hook;
-	__u8 reconnect_event[] = {
+	static const __u8 reconnect_event[] = {
 		/* Event received on wireless tablet reconnection */
 		0x02, 0xF8, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 	};
-- 
2.49.0


