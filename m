Return-Path: <linux-input+bounces-8425-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410B9E77D0
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 19:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1AAE18881C8
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 18:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A691FFC64;
	Fri,  6 Dec 2024 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hLHz4X1A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E481FD7AF
	for <linux-input@vger.kernel.org>; Fri,  6 Dec 2024 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733508316; cv=none; b=IMZy8SrWmVl0gjkUBH0cZsRK1DjIfvp6sQ9V6pZtmncCLbtycjyaajeYChHvLIIKpX6s6cHEC8R3EhvKjJM2qe+XkDQk3M5FXC3TxZVSBIeVblRaqQxFjrTGZ3cil1J280Z240OZ9LSZ9aoLsSj0LRbvPVJ4aQZI18G1gXHP7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733508316; c=relaxed/simple;
	bh=mUrDS2bhGOV+ED2691ewuzgAYk3tK8Jmo2Es0NnHTY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rviZ8SLgu4RGy+EjkFIkjlM/tDAJcqgqHPO4phA4vP37lZ6EtejJdhRVJXagy+scU7EqRVCQ8fFpiT4t4tl/yEzt1dPX7zyxegQCk+L4NzF15fKfa7qouA5TlSvm0pJtw22jYjlafPNOykGomo7rSix4xjyp+5VhROmj+lv5Yv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hLHz4X1A; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215b9a754fbso23152585ad.1
        for <linux-input@vger.kernel.org>; Fri, 06 Dec 2024 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733508313; x=1734113113; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cNSXOHpFVDvVo7qfkOEInwMhPxiBtaZSe1qpxd+NZEo=;
        b=hLHz4X1AeNnHiFdLcWEZDj/HWW4eS0aaVEiu2O8suERNrIud/iDCqVXS/P0urStCeh
         t3fRJQLVK4yMVsZcnXfoYKe1+ZmEQpGrrYbv6Pl/wIMShXL9+G3A8CjOBsit233sVbYr
         7hHwf6XCFHgEHMaI5pT/dvIQFk9fu1IG5vgkBG2knrEhHLF73zci/x7IBQhojjXibZs2
         zDR/sbYmCB3+vb2RX0BclB/snVpGfnmXmAcdPlcbWhbAo89vuloEQ4487hrc9Fvv5ySP
         BRdlGcgMgsugnosWuFPjbFZmdOhO/nxHx6i9EfnBW2ed0c1gtn+kIOKqYbELFxLqoS/Q
         YNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733508313; x=1734113113;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNSXOHpFVDvVo7qfkOEInwMhPxiBtaZSe1qpxd+NZEo=;
        b=oEloWmT4nTcmBhUGTdOlC/YFzooK2xzNsYDr36++TMGJ5z3y0gFhyraoWPaDpfzPkc
         OYwX4N4Y8PF2kDj05N4/p1sOcJPev8tGDDW2z0yUof1lagksoCYMO9TpAKoR7QxnhLn9
         nBeRzt+BuYoYuOIZLhbEEggFB4u06j0QV29vpdl4wR7oskQ5nhvAf2KNmGZJp1WeyEtU
         yufU++YUVR5cWLWVrjMDEWxi7HGT+BcDmYVi7+7OlzpLBldE6OKRrf1IDtX7Am0PQA1E
         yLAb2rcSElK5ucBmFD/K2SH++32JHlQE8ildszWUY9seOKIsIxf5HHssu4iFowJUvZaQ
         z3vw==
X-Gm-Message-State: AOJu0Yx9VhglStw4UVc0JQcB30Gqyi9t27v/OS1+TprV1HZzAA0gK6Fl
	UkyJFK2RFPOLu7fArbu/08Zg+KBJrkVJNyRap0BfvvjTpCagsmWlPFyc0kiIUtu2t8KbL3K+g98
	O
X-Gm-Gg: ASbGncsogODBBVkk9Fhsmqx6L88yaM2J4eXf4BPB9VzXOV9pwzdNB41dGOY6H1xHizt
	/SwcspCWkiznjIooyaVgEoDv3YhOk0pK9d5bqi57bYa/omP2a2lTb9h4VnYPkAu9AYCIydzeSD6
	pjy5wI28GdWK800Im6zVl/i1ws8eVH4zrwbqt2II8dWz0fkzG/mhJ3kOQ6rMgCGeK8iwE60HTAM
	rv4HDBbbkOt65sQo3Haljcmlx4M2qea09hEqJu8S1FJVSSEoiANK2RPPmMrICUMzQ==
X-Google-Smtp-Source: AGHT+IH6K3vxjoHAACo1uwn/G9I0Nj6IP5ZDAZwjsVYIfZAvGf/tBjJZAN9zL2L3pU94t4FY59unIQ==
X-Received: by 2002:a17:902:d4c5:b0:215:5437:e9b4 with SMTP id d9443c01a7336-21614db9f54mr41598485ad.54.1733508313507;
        Fri, 06 Dec 2024 10:05:13 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161e6d1042sm10977125ad.2.2024.12.06.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 10:05:12 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 06 Dec 2024 10:05:06 -0800
Subject: [PATCH] selftests/hid: Add host-tools to .gitignore
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-host_tools_gitignore-v1-1-e75e963456dc@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIANE8U2cC/x3MQQqAIBBA0avErBNUIqyrRITUZAPhhCMRSHdPW
 r7F/wUEE6HA2BRIeJMQxwrTNrAePgZUtFWD1bYzVvfqYMlLZj5lCZQpRE6onHfD7pzVvjdQ0yv
 hTs+/neb3/QC+B72vZgAAAA==
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=726; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=mUrDS2bhGOV+ED2691ewuzgAYk3tK8Jmo2Es0NnHTY8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qwzSXB2zyn6rQaTi5VrXHfFvuq7V926Zfu13cZVNfIs
 wXW8Md3lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJHM2Qz/vdW9+Y3dw0z+nXWf
 U6sy9XxEoahRvN/uzD/nxbcs8nb/x8jwt5WJ69mbDTkH16almv99v32agHTW45khS70stJfp2nx
 nBgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

When compiling these selftests the host-tools directory is generated.
Add it to the .gitignore so git doesn't see these files as trackable.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/testing/selftests/hid/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/hid/.gitignore b/tools/testing/selftests/hid/.gitignore
index 746c62361f77..933f483815b2 100644
--- a/tools/testing/selftests/hid/.gitignore
+++ b/tools/testing/selftests/hid/.gitignore
@@ -1,5 +1,6 @@
 bpftool
 *.skel.h
+/host-tools
 /tools
 hid_bpf
 hidraw

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241206-host_tools_gitignore-8a89f8820a61
-- 
- Charlie


