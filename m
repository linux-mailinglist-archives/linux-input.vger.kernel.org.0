Return-Path: <linux-input+bounces-16693-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC1ACDECE5
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 17:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF1D33005B90
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 16:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE79A937;
	Fri, 26 Dec 2025 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iM6HRVb9"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8653A1E66;
	Fri, 26 Dec 2025 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766764966; cv=none; b=HjTau+JEOsJig4tsTkdbbllYqucjphxJJH7UhWrCCwq7SUgzHoNGU8DyXS5WFCFP8Iz5zT0yQ1W6oQ3Gzu0ANBFztjRjaZ/+US/7IhmQV7EhKwvtiivZ3S23tjEBr3egwyHnJnXy2E7vWIUvQNve1hwi8UTVAeJJQV0QJPwFkFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766764966; c=relaxed/simple;
	bh=WHk+1aPid2PPbd8cOOvJTF7fa2uUaPJZQnhqwmoIOic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ik0Qg6DbRgJpeq9nrhBXGDaGNaTZsxF4zxXppG6nOYsjGLlz+igLY3/8CO2sG71bzQFwxCjFwLlE6fB3ui4biill25WZ8b7WPL0TqSMQpRUS1c/lq91i21pgjVyrh5zBUAJN7AMCawUQVsbUg5LYeu1/pZ14usAoRSGmVKpltVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iM6HRVb9; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=CI
	81sI9qT88GowAiIzB9GXlfHd2ImOkVCScZ8Twx+3o=; b=iM6HRVb9BFND5rEqei
	2W3GnBUagHtQsbyCfQwtn6aEa04au72QJo/STyAuMXOenDg4JnXNP55lX9jFwUl+
	a4I92gBrn9EaqpEd0CnAPuJwmjOBS8p/qLjAHhcV13AOSahInGb3OM9nCHdZVvig
	5Wz66GrckLFoKboaXwUeQUujQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBH5+SOsU5pEQvwCQ--.53869S2;
	Sat, 27 Dec 2025 00:02:23 +0800 (CST)
From: Wu Canhong <canhong12@163.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net
Cc: linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	canhong12@163.com
Subject: [PATCH] doc: input: fix typos in input.rst
Date: Sat, 27 Dec 2025 00:02:19 +0800
Message-ID: <20251226160219.64818-1-canhong12@163.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBH5+SOsU5pEQvwCQ--.53869S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryfXF1xtF4UGFy5JFyxKrg_yoW3Crc_Z3
	98Xa95Jr4jqw1xtr4DAF15KFn7Aw4xuryF9w1DAr4UAry8trZ3C3WqkrZ7AFyjqr4xurn8
	Kan7WayFq3WxXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKrcT7UUUUU==
X-CM-SenderInfo: xfdqx0dqjrjqqrwthudrp/xtbC3g99omlOsY+ldQAA3H

'even codes' should be 'event codes' at the end of input.rst

Signed-off-by: Wu Canhong <canhong12@163.com>
---
 Documentation/input/input.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/input/input.rst b/Documentation/input/input.rst
index d9a6de87d02d..7bbda39d8ac2 100644
--- a/Documentation/input/input.rst
+++ b/Documentation/input/input.rst
@@ -278,4 +278,4 @@ list is in include/uapi/linux/input-event-codes.h.
 EV_REL, absolute new value for EV_ABS (joysticks ...), or 0 for EV_KEY for
 release, 1 for keypress and 2 for autorepeat.
 
-See :ref:`input-event-codes` for more information about various even codes.
+See :ref:`input-event-codes` for more information about various event codes.
-- 
2.47.2


