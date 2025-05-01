Return-Path: <linux-input+bounces-12098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAB5AA5E2F
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 14:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433513B5A59
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 12:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C980E19A297;
	Thu,  1 May 2025 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhnFY0HT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4356F1A38E1;
	Thu,  1 May 2025 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746101795; cv=none; b=UQ5gpUoxCkXyVzUlJR0Foa8jE0dP9PcooYq7mLh0npYNqlJRphm/LTQz428PlG8+TBcTwYGsIFoWf8Jv1c9oK4b1+ZVjpyyKVcnojiOAHm7no6Edx8016R7Lzit8C/hEdFA5i+Zf1zovpmpzR9owFJ1wIfF5CQz/eS6RJlnWhh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746101795; c=relaxed/simple;
	bh=nOeBrM8FmttskUBqLj5xGML9i1vcyPvUiiaVhZiRmRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eqAdqVSi+8MLaLXoAMB8AvuS/54nBd0NN5wceGoGuMJDz3nacAKaLxu6u/Xveov7JntCO/ukA9WuN4Mc1mcRC6oIXWeQ/PC2oQpxuMUtZy/fF3CzRvghT70EPib3TiScsnBaqBjjgEL0Q4JwUIwufFhRf+is+XxwZ2lShh64Fsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhnFY0HT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e033a3a07so7967725ad.0;
        Thu, 01 May 2025 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746101793; x=1746706593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXOGQ5mao4U1U8Oq+MKZTKTuI5WoBPPajlDwPtE7mdw=;
        b=AhnFY0HTNHRZQwhUZ+PGX4acGR3uUvvtmPMH4Txj/sH3o9c2NUwsDvMjff2q6UYQN2
         USfVQfGV5dspM1rF+Dk3xeS7CLvoUkisdNXbl1OByak75yVEyyq3viBsJIMnwd4ivuOo
         xWjYrAQp/VxJM4EWzHFwGVmXwKibXMJGmpI1V7OJR8TBKbcZepOtjh0VkMvDNmY0gwLm
         bIsTftVjEyyoOPbrYgcUNr6hrrHp7d+sVO/UPeWpVaWSblecy+qLay5zrQzUODP6on6W
         4Cwl/YMAqzXUTKk517I550hZJxtp6odJKeYNyVNJo7hB3LAfIhGgmCQ7usUYLEVM4IWy
         VpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746101793; x=1746706593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXOGQ5mao4U1U8Oq+MKZTKTuI5WoBPPajlDwPtE7mdw=;
        b=ZApT6v+AP34T9k3dgF/PYK5IYWnase4LeHFznwBThK1DYZ92vv7Vwz4bIyVAwbsbXe
         v435YWj1NtGFkT1zRlGn8H77mcB6eH6kW/5myJZS8Z3Fl7DE7yDBeuTOrxJ+Mtvj1rXZ
         /6s5PhYrxxjmnsH8WKGGkKGjmmpi5EWt3ZwcN5ZCoxqDH+xxbyPff4Eh7uhBKAplX0un
         xytKUvMQeQ671MGVBtg5MlxIs4Nu2nkF5MAkj+S7Y3d2dA/99m5fvLASrGIcfMimz/3v
         JCPFv60e4fhiCFHlh3rKtYJU6U0mfKK9xIGb3MDMHpm5NAN0Zsf0x5JaWjOSgoiQsti9
         oP/A==
X-Forwarded-Encrypted: i=1; AJvYcCUS92eu0HxeEI82lPR2j1JpndBnJNcvrEXmdxVkYrlTWqz8hNpSecL54tRgRNSztRxkqnoaJV8s0k8=@vger.kernel.org, AJvYcCWT5uDxALJCp92i4YLX9g91qoat6dvqqt8A5mLW4LfRycBly/bLjJTHTTRYBHM0dntWAHaycbap42XWt+Q=@vger.kernel.org, AJvYcCWqrM7I7o1rPfB6u6YLs77fu43rTgZhUMumygsGIOxNcck0GXwSHxGjMI7+/6ZSAd7gHr5+4lSNumKNCtZa@vger.kernel.org
X-Gm-Message-State: AOJu0YwJaF64cMwf2ESitKQvw9wpRt36HUJYRXFLHNHKdHnuJPKotMDc
	DVEvRiXv4/yPpKjnodSu5VcugV2xEH2Slz9/O3wvv4ipi57BObAj8KFOjunGwKk=
X-Gm-Gg: ASbGncsTVutkmJBa6SpZ0FQs1mOrDTNwFep3Nvmj/iYLDjIuXWPfqV59RxOeC/6OppC
	UCaprz1Pz44LmZV3QK/aVqrVrkSxYxVnOI1kQOnwnQcWcMAC+/4Ighii40GAtJomc+Y6010DWi1
	s9Cs+a7Vrjp6Gn7VjhNu2OhO6IkScmK8GYDMsfMHnMaf4N3b+ZUJHNgTn4KZf6xPljsMWsIcOU7
	u6qYxngQCykPEtAYz1BdiVSFef4Zv4mpq2LYHG+X76MtncuF4u+vaH4R6b5z02rXVFrDKmIaIs7
	oBNTxUpIQ7yDRNaEqOyNpP/yOQYAhpvAkn85QXlR9GZOxTJCnKZMs5NXXd4AD1UppRDJ6A==
X-Google-Smtp-Source: AGHT+IHVFJcUukBU7XlZBWMyMG2pgWT90EdhHWZsX3L93Yi9JAbCmmkasjMLmCVV4UzjIa/Ixi2+Cw==
X-Received: by 2002:a17:903:198d:b0:227:e980:919d with SMTP id d9443c01a7336-22df35bf45amr100956735ad.47.1746101793257;
        Thu, 01 May 2025 05:16:33 -0700 (PDT)
Received: from localhost.localdomain ([103.77.0.13])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22e0bc6d44dsm5082965ad.153.2025.05.01.05.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:16:32 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: corbet@lwn.net,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Subject: [PATCH v2] docs: fix spelling mistakes in HID documentation
Date: Thu,  1 May 2025 17:46:25 +0530
Message-Id: <20250501121625.224659-1-ankitchauhan2065@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistakes in the HID documentation:

- 'triggerred' is corrected to 'triggered' in multiple places.

Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
Changes in v2:
 - Corrected change log to use imperative mood as per review feedback.

 Documentation/hid/intel-thc-hid.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/intel-thc-hid.rst
index 6c417205ac6a..5e0dc51c8d20 100644
--- a/Documentation/hid/intel-thc-hid.rst
+++ b/Documentation/hid/intel-thc-hid.rst
@@ -182,7 +182,7 @@ value and use PIO write (by setting SubIP write opcode) to do a write operation.
 
 THC also includes two GPIO pins, one for interrupt and the other for device reset control.
 
-Interrupt line can be configured to either level triggerred or edge triggerred by setting MMIO
+Interrupt line can be configured to either level triggered or edge triggered by setting MMIO
 Control register.
 
 Reset line is controlled by BIOS (or EFI) through ACPI _RST method, driver needs to call this
@@ -302,9 +302,9 @@ waiting for interrupt ready then read out the data from system memory.
 3.3.2 Software DMA channel
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-THC supports a software triggerred RxDMA mode to read the touch data from touch IC. This SW RxDMA
+THC supports a software triggered RxDMA mode to read the touch data from touch IC. This SW RxDMA
 is the 3rd THC RxDMA engine with the similar functionalities as the existing two RxDMAs, the only
-difference is this SW RxDMA is triggerred by software, and RxDMA2 is triggerred by external Touch IC
+difference is this SW RxDMA is triggered by software, and RxDMA2 is triggered by external Touch IC
 interrupt. It gives a flexiblity to software driver to use RxDMA read Touch IC data in any time.
 
 Before software starts a SW RxDMA, it shall stop the 1st and 2nd RxDMA, clear PRD read/write pointer
-- 
2.34.1


