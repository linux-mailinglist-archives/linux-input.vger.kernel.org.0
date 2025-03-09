Return-Path: <linux-input+bounces-10671-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3989AA587F0
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 20:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB0816ACDF
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 19:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7069217654;
	Sun,  9 Mar 2025 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQDqJ1nP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392D216E3A;
	Sun,  9 Mar 2025 19:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741549781; cv=none; b=S7qk0ExSKz2zr9rLzO/doPgfap0Rfe8OehQNrFySUmkdRKCYardspz1FH0k04rnbxpv4Z6OOCxn5+euhjfmt7qAb1kq1yajdX4Jqhbion5SGo8PA5R0q5hZ2t8FVr5Q3s2/57rN8LsL+5bG/XtUeMtJ1HTDTkp7EZi9AuS+/iE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741549781; c=relaxed/simple;
	bh=r56I7HaDUZmNq0/JP6F9FJieMDfuEuOVaXRoNDw06XM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R0m1VOpSEDI27xXitbEVPAru4PhzEzgH5tQTz8aQIfYgbUHtdumIN3UHybWaCmhcpI3DeTQsjw0/UPw1W4oA4xl0KkQbYGmjewDyOQ+RC4TxBl3FVnxquL9u/ANgppAPtjiSSJI2BU/np5mrMyvsfviCHSpDe3tHBfGPpHf75UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQDqJ1nP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso4347145e9.1;
        Sun, 09 Mar 2025 12:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741549778; x=1742154578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqiQtKisRnhXpmZFZwk1xNcziyW49eZC+8aIuCkeFow=;
        b=EQDqJ1nPTH48R5RiE7FtTYEIYBeDFnJXsonPJF6X9Yqty8x+/QankSLu6qbwe/RBBB
         6KUuXGcHRlRs+iCafzIXWO+nvHITdpWwIEhSBBbBHnWu5grhdiRwN/wUTKu4C2ZPmhcr
         ltPMUBrX8wUz8YydnHt/15qihZMD/udtujr6wHHr4bUdnWwWCnIjtMPheTI/WyYCN58Z
         zQSW49p0Fdp4KDGKJ5w2S7eZcOzzr5rJ4kG/jGb/3vI3XXmWHNwm79zBjck3paaWHp2j
         zzLnf6L1e4bX/Jw61JnCXqYMrkWy2jJKNn1WvUl/d5FvxTCm3HYv0zoOnZ/OPMFxGCYu
         xNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741549778; x=1742154578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqiQtKisRnhXpmZFZwk1xNcziyW49eZC+8aIuCkeFow=;
        b=qYcHBfGrDo4rzsqDppXeuF61pJijslVJcYX5bIb+RwtM19+IVDNBj22yjwNGZ9h/4X
         K1+qJ1QDr+TmhD9zJR7ESWm9cdxx+cu+lBLs9k4bu9/miPpQD9P6jFbga6mC3Y5WvP3m
         HNHl4+ufhyz/SgEPIOYJvgl9B1Z3ykIcAXnRhDPIJhROAS4ahlzN4cNA6w3FaTOPvvNF
         u5O3QbdUQcegnczt+QirkTxnY2rQqI+uaIArtZRe6vpEhi6zNPIDvEXc3e7YJzgJgYNd
         4dpVnke/UcNFz1+yxsr2rAu34BYkseK+4iKTLOcSDiyKbiFN9OoDlNCA2eoZ1KcwLGgu
         qN/g==
X-Forwarded-Encrypted: i=1; AJvYcCWpDmqFZEEMDrkTM4n1ndO/38Fk3vRLhnlSjy6b5VcM+iPAMorMz5h20bcjQzpAi0aXfBC1jh00aFWTgQ==@vger.kernel.org, AJvYcCXlkK7m3EsSN109WMDDZDhebUULL9XfTQv8XPshMiwLtUKsZW9ODHZ+B4DYhWUk38eJSL4bjBqu9V8ykrKO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8TaKS9Fj/Sa4o8zePoeacpP8WoxNLnNVQYszeUV8+y6qd/4ux
	BnWhJfeMuPQkx4pd5cFktyhCRDUAh24Vw7Nz0UKbkxVFQNSqQ9c465/FqxaY76s=
X-Gm-Gg: ASbGncuIwnTtiusXaZ3SoeFR/FhvZzNHzj0kOWkx0JeA70zok8QZ7lV8IrtWijvGU1Z
	tRzyAI2EKxSVZiDgX7dOfedElN3KQs5CMmKj7u/TtiAPzQwt8FbL1FlN1KXcHTCkWB8xJ9ksuaF
	viBWM0nYxjMLEe4WgjA67X0rlqqQEKSJW1dY3aim5ifgvS7atA7i5Z/9zMxCcXO6D5nwsbkv5d2
	obDJv2lAERly0huwLiHtuHL43DZOBe1gMuCNABb7eiKUlm/5SRTIWPs5YwRM/QmRsG/xGgKRmcG
	wMHvvzeOudzQdCDFmxgj0/kbV/Go+Y+JBwTh2wqs1hxbg7kbwq9Y9pbC9L7YK71y
X-Google-Smtp-Source: AGHT+IE1b3vTyNHENuuJ7lf3QTYQeTeABe0PT7MOoVhhsfz30ePcubet8/e94gJrTJOb8eSX64gUsg==
X-Received: by 2002:a05:600c:1550:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-43ceeeeba24mr20078675e9.22.1741549778107;
        Sun, 09 Mar 2025 12:49:38 -0700 (PDT)
Received: from localhost.localdomain ([176.206.121.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01567fsm12454968f8f.41.2025.03.09.12.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 12:49:37 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Luke D. Jones" <luke@ljones.dev>,
	Ivan Dovgal <iv.dovg@gmail.com>,
	Adrian Freund <adrian@freund.io>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 0/1] HID: amd_sfh: Add support for tablet mode
Date: Sun,  9 Mar 2025 20:49:33 +0100
Message-ID: <20250309194934.1759953-1-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recently there has been a renewed interest in this patch: ASUS has launched a new z13 model
and many more users requested tablet mode support for previous models.

I have made required adjustments to apply cleanly on top of linux-next:
nothing substantial, a macro has been changed from 5 to 6 upstream as
the previous patch also did and a few line changed their position.

Given there were no functional changes at all I took
the liberty to retain previous tags.

Denis Benato (1):
  HID: amd_sfh: Add support for tablet mode switch sensors

 drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  2 ++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  1 +
 .../hid_descriptor/amd_sfh_hid_desc.c         | 27 +++++++++++++++++++
 .../hid_descriptor/amd_sfh_hid_desc.h         |  8 ++++++
 .../hid_descriptor/amd_sfh_hid_report_desc.h  | 20 ++++++++++++++
 6 files changed, 62 insertions(+)

-- 
2.48.1


