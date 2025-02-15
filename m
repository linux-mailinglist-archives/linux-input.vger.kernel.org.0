Return-Path: <linux-input+bounces-10070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35EA36EC0
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 15:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A88718954A8
	for <lists+linux-input@lfdr.de>; Sat, 15 Feb 2025 14:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6511B532F;
	Sat, 15 Feb 2025 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="g9/uLV/a"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E5219CC06;
	Sat, 15 Feb 2025 14:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739629290; cv=none; b=GKhgX+pxzRTqyYo3fA4qJn5aGrWK/88ETHqlaaTsAIJwoKHf5eMNKPhNTrRx6GA7xLPgd2xyGkQEZohdiLUYR2hLHeQGHVk1gpjOejRyxagfZWMNbwxW7h1EqjSZGvAbjb1QLksjhhH5Reuv8JxjHFisWl4O5GAaPX0wI/jNF14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739629290; c=relaxed/simple;
	bh=P+0MIT/BrvISBCkJBOiR+yD2Qbpe/TVG71OxAmudniU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z5AlwXFYX7YbOG0VhRlqJKWX0h0zoe7+fPGaoXiaXB1BhSjYZb2SvjklbSJlH6udsFysfUG14h8SMU6IMAW/LgP0zIBUnzbz2bo/swjgvEt5aDQj/MkpixANNLrEa1rLPPGm4pgJhDaPNj4aSdcg/WXczU1JOFHUXxRXCtoNMBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=g9/uLV/a; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=m23se
	41y4T9dKZAoN4dvVfDza2f+c99NlCW2C5/N5E8=; b=g9/uLV/ayLlTFJzpdw+iN
	s36XPDicBFlE1+BxQx6sLwxGAp0mpfaXgYQAsTvfMC5OZuoPypcgIkHIiCTKgci5
	XdMcSEKWX0/LfxdjJ29cx0OLvy2IHFX6C1CTKGVL1PV3XLfRfdy93gu7deXOG2uk
	13mX4BpysrJmBNtHPGHouI=
Received: from cc-vm.west-darter.ts.net (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCn7vPiorBnIINAHw--.21730S2;
	Sat, 15 Feb 2025 22:21:23 +0800 (CST)
From: Yunli Liu <ylliu3788@163.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	Yunli Liu <ylliu3788@163.com>
Subject: [PATCH input] input: add BUS_I3C definition to input.h
Date: Sat, 15 Feb 2025 22:20:35 +0800
Message-Id: <20250215142035.1745664-1-ylliu3788@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCn7vPiorBnIINAHw--.21730S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4xAr13KFWfJw47JrWkJFb_yoW3JrbE93
	4xGFWkWr4FkF1xKw4ktFn5JrnYgw4xGFyY93WfJr4vyryvqrs8C3yxGF92qrWDGw17Cry3
	ZF18Wr4Fvw1fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUU1CJ7UUUUU==
X-CM-SenderInfo: 51oox3atxymqqrwthudrp/1tbiKBnzdGevOZlU1QADsc

Add BUS_I3C (0x21) bus type definition to the input subsystem header.
This value is reserved for devices utilizing the I3C bus, which is
increasingly adopted in modern embedded systems due to its enhanced
capabilities over I2C/SPI.

Signed-off-by: Yunli Liu <ylliu3788@163.com>
---
 include/uapi/linux/input.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 2557eb7b0561..c6fbcbad5b7c 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -275,6 +275,7 @@ struct input_mask {
 #define BUS_CEC			0x1E
 #define BUS_INTEL_ISHTP		0x1F
 #define BUS_AMD_SFH		0x20
+#define BUS_I3C			0x21
 
 /*
  * MT_TOOL types
-- 
2.34.1


