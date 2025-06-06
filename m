Return-Path: <linux-input+bounces-12728-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9DAD0840
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 20:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D85AE17A2DB
	for <lists+linux-input@lfdr.de>; Fri,  6 Jun 2025 18:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FCA1E7C1B;
	Fri,  6 Jun 2025 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwdXnTQ0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658FE323D;
	Fri,  6 Jun 2025 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235819; cv=none; b=pj2zRw6l4JwELWxfIk4Fr/jve9nfN8ofBi8EOQTBT6tPe96RbkJ20dU/TVzGEcKP4FloCfmP6yFxaneOQDAg6yQs6zd5xqb7GLxbEeAcolCvV7JoPaY9IKEep10WpEpoEj1LdZ/3XZ8ykSmgPF5oR7TbJvoI1OJbwTpgrwTAxSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235819; c=relaxed/simple;
	bh=U4P2tnNseozPuuy/skT7kmujiUB/sLQ43YhfGdq+IVA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OnvK7by6PyrLu7OvUtcRqovEVlv/Rr2w8dO8XgXF4KJMqvLSObZrMsRkRBJHkiF41vjIHZZDlRAMz0pkCCVotRDyfy1JvuUpcbkYQ5uzenapoQ7KPjS/u3CkryjtHwKH5yveb+4PeW5ATvtvgE1KiSBPnM+8wmPpeB2ayJZMPhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwdXnTQ0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442f9043f56so13451555e9.0;
        Fri, 06 Jun 2025 11:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749235816; x=1749840616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Md9dvw0OrzD5ybuFEtQ1C4p9sLs5X9fR5lPCIeJYTOA=;
        b=ZwdXnTQ04duvx3ATIOMGvQ8MWO4UyjuY1hSqk+FWIdoQqLeoLYnKo2ieO6OnvtRIcf
         +ZT1xD0hIakMcnnF6E+Qxy3plrhxoauzfD7ByQeingbCjrSYLcpUVJgEzNSkouNxgRk7
         5wi+eTp/yzksCvqmjEjNPsILjg8E9L07KV90GMPSOuyfYUmj9YtiwVmLbJUIhbrMkZEC
         TYYyzo7NO+FW/ZSiabRP42fvWCIAckJrlpFjhSvicIh4YB4z4k/eKusSrv6XpWP4BQQP
         ouzfKc34s1vbmmY83+lPsBefAiIBQxucTHbIuWO9Fk8aZe8uPojS1HDZNUmBlp9+UsQh
         u/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749235816; x=1749840616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md9dvw0OrzD5ybuFEtQ1C4p9sLs5X9fR5lPCIeJYTOA=;
        b=QtxweBBnMb5KUOEEFJPsynM8RiWrhPbDvWa9TA6kgEvsSXvn5Wg8O5aV5Tx00kkcQn
         1DeK/DXkd7LZBaLX2y48Bcef/dVctBPh+mhuBlpb4rufwGAUY/8xCTbmL2qBEan2Iktw
         AZbFgFPjABqXOwiLnLoPDSna/kVP8Ov8gDFxu6rePUWb55Ru2C6W4FSSjDun+p4quxaE
         wL0QYIOiNDzkMKqq+mopQH54zLIMtu7mmszM+RuYgNR+uHHpkb7ccciWE24P6i9cIAjV
         aPZ1maC74SHzLdQxn9zk6Q4bQnquLrYh5mqhzyJwgFz22zjoxF0Nyedul3nOLkrqgB/H
         MFSw==
X-Forwarded-Encrypted: i=1; AJvYcCWl+jbaLUUwt6sN84Z5AtTxT62PyEDItKvPdVv8D58hGv4pDz9elcO6gQx+H0TL21kiC4PgL6Ni4vMNww==@vger.kernel.org, AJvYcCXpDOfLrLs4frIY1xLMa5Xsk/VrJ/brPiCLdPc4RVBPmQcYODLXXqhPJGGgs13BitZAb3XAxKuN+iGSLXZg@vger.kernel.org
X-Gm-Message-State: AOJu0YymnDxuTLUhR63WbxEIEBIgtct+E/gi7rt13SgTMopgZw3QtvO1
	b+bGO2z9DSVV6uBb9q2AvN2Bnzk/iJVwCZ/MedS963FtJZ90zVRqEr0a
X-Gm-Gg: ASbGncvroTLWu8EnfPWxhWKHfaMR8JhL8Rag6j6N8vMuspI2ITzlK1b4XC0MRF2WMLy
	xJ8YxSRiM8eP5HJJAlz2Y9Gv8XVot/poSNWJOIhqshUKR2XObj2VE2BAz5oKfXqaABxp0/UxucD
	II5s68BEtLM0qokUxrJUNUssh7eq4u9VSDlK1aK+Vjp5mu26eTwpBcLQBLt1H2fjdoFRDQjdPvn
	3zFzdN8bh5+UJs01wAAPMx3fc/Rs/eA4Pyz7chkVVT55cE1Sw8dfiwj1k/gqrWzkCtPfnC3i0Ix
	qqvyBv8mP2j4NybG3N6KjYd9rx7WUoqHjOa/Mg03hjsgD5ej+pMr
X-Google-Smtp-Source: AGHT+IGuIlWNHzSSG+6amTKVvjhqDcEXZJVvPSig4Vit3wsbpXI0vNRPDn8jiXTCepXBAWmLwrUrow==
X-Received: by 2002:a05:6000:310d:b0:3a4:edf5:b952 with SMTP id ffacd0b85a97d-3a5319a7945mr4071838f8f.36.1749235815459;
        Fri, 06 Jun 2025 11:50:15 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:44e7:a1ae:b1f1:d5a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435771sm2713057f8f.63.2025.06.06.11.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:50:14 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>
Subject: [PATCH RESEND 0/3] HID: wacom: fix resource cleanup issues
Date: Fri,  6 Jun 2025 19:49:56 +0100
Message-Id: <20250606184959.35915-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a few resource cleanup issues.

Qasim Ijaz (3):
  fix memory leak on kobject creation failure
  fix memory leak on sysfs attribute creation failure
  fix kobject reference count leak

 drivers/hid/wacom_sys.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.39.5


