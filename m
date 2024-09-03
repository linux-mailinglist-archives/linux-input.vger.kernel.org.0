Return-Path: <linux-input+bounces-6087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F12969962
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 11:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFD45B24CD9
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 09:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75911A0BE1;
	Tue,  3 Sep 2024 09:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Au6xXDpf"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8FB1A0BD6
	for <linux-input@vger.kernel.org>; Tue,  3 Sep 2024 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725356399; cv=none; b=oG2z3bN8xI3nE0HtYbEK9W+upZKXvEonbbrWkD/sYsKWLOk3yBTqFCr4LBj/f8nPNkSvtzySuHNO2/0dzPIAW4F+zPUKQarIybmM9SdMrW2CP2dvFQFrqBGcQURsnE9Lp0c7WSE/lY9nQTVxrlMtB+YETP9+r6/A1y5Answl4X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725356399; c=relaxed/simple;
	bh=YmM/1Eehb6jsD664Sl2Rr0CIjdzwq6jIGR9orWtFBBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZtwnZjJ6My+72n2QgdxcVRJLTBq6Qd5MtF6UNYQa1Cws7sT60T4WP0r7PQmWp6vJxkvwKTqYVigoMmD8PNFkITEI1++mIBHvMRAzr4u+t1LtmT1KA7qL0k8BZnZcWDv459eqP+xvbTx8YyM7NTFTmmKgdvluXYaYQI7fyzQUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Au6xXDpf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725356397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rPJ8JR2hsu2+h8AaCAr5yRN3QjhSF/kOuIBdMukfuug=;
	b=Au6xXDpfDdZcsDmgJ1w3MqDvnKqOCoAy6WZkhVJOVH9cgXirJeTD59aNk84INqek034i1E
	Z4+AivIud2m11d2LO9EmH6HFLPu00Cya485u9JzXj0Vketm6BIa+bXqw1nNr54czTJKwg9
	dBbMgrd8oE24rbEdTlgKHjNqpYGCYpE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-eaIs8rhYN5aiGN1mku-A3Q-1; Tue, 03 Sep 2024 05:39:56 -0400
X-MC-Unique: eaIs8rhYN5aiGN1mku-A3Q-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42c7936e4ebso28161515e9.3
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2024 02:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725356395; x=1725961195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPJ8JR2hsu2+h8AaCAr5yRN3QjhSF/kOuIBdMukfuug=;
        b=sGMf0oR8qTOhc2jxjpOjDYaKZTL1f9UWAHlZ9vKmbxYfsxRCeoTCedQmkPM0eEXNm6
         5UYT81YvtunOHgZcN5LG6sKycZBt6hKuU1jEefkmxWY3yv4/sMDMaGopyRrGMi18V5Rg
         2803jkJG1iZZbYjjV54J287So5ZsE6e74XHEUQ3WyieogH5yzBxDcWPrKWVBZopXYefa
         L+gTUp8pFZioLOUR219Ne6lbbF3Yk4PIFwnOMHT+GmnKCk86Z+lMb13FFIExRnHueNYo
         9BK/xH0393Ap/kDotfev5WwGvQpRS18TVSyMVVX85KBpEwcY3UC1RGHtLNOwI225EgDI
         N/NA==
X-Forwarded-Encrypted: i=1; AJvYcCVhKGkWVIoPO+Xzs1Rm8Ipe3upC6/uVrYX+Mwf1Sh1NTW62CeEplgx9KZQObb6EVU/K1SNAuPyHV1LcdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGI37Cf9iNjARTSpHWanxjrvjfjHEQUaiHICFA0M+JnkUy8l+b
	+BHgeroxSIAFW4RItNHtaTSNAlaIlZ5FZEMzi5WELQklsQYoxCFOueOUES3ZnxyjN9pos52s8BB
	LA3h9lwCkC1bBLwNs7eihc43072XyBhbcNnpkYgg810QZo90PgDUcuM1Np5MYepTHCYDe
X-Received: by 2002:a5d:4086:0:b0:368:7583:54c7 with SMTP id ffacd0b85a97d-374bce97f92mr6805204f8f.8.1725356394862;
        Tue, 03 Sep 2024 02:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHopwsF2Or6X59KptCdtP9shvBUqKfSIOsOAprOTS/L+AM2LQoWh0DPR0/BX78uGFil1dVQkw==
X-Received: by 2002:a5d:4086:0:b0:368:7583:54c7 with SMTP id ffacd0b85a97d-374bce97f92mr6805193f8f.8.1725356394362;
        Tue, 03 Sep 2024 02:39:54 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e33d60sm165511655e9.43.2024.09.03.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:39:53 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: remove unneeded file entry in INPUT section
Date: Tue,  3 Sep 2024 11:39:48 +0200
Message-ID: <20240903093948.122957-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit b9401c658d2c ("MAINTAINERS: add gameport.h, serio.h and uinput.h to
INPUT section") adds further header files in ./include/linux/ and
./include/uapi/linux to the INPUT section, but the file
./include/linux/uinput.h does not exist since commit a11bc476b987 ("Input:
uinput - fold header into the driver proper") removed this header file
in 2017.

Fortunately, ./scripts/get_maintainer.pl --self-test=patterns complains
about a broken reference. Remove the file entry referring to the
non-existing header file in the INPUT section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 87108b3fefaa..3b19921eb948 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11195,7 +11195,6 @@ F:	include/linux/input.h
 F:	include/linux/input/
 F:	include/linux/libps2.h
 F:	include/linux/serio.h
-F:	include/linux/uinput.h
 F:	include/uapi/linux/gameport.h
 F:	include/uapi/linux/input-event-codes.h
 F:	include/uapi/linux/input.h
-- 
2.46.0


