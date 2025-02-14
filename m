Return-Path: <linux-input+bounces-10041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A271A35C20
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 12:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4CA3A6497
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 11:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B457425A64D;
	Fri, 14 Feb 2025 11:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="AiN7Vw+K"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8422F25A358;
	Fri, 14 Feb 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531119; cv=none; b=qKZgCimHoec9Kyt153NBA2uRRmz+vsReqtKe2Uc6PMo5d3sKU9yY3WKe0N//Iwe6fQ4vb1kKKNawuGgg5lL5h/ais857b3PaMUp5gcZgRaNPYBv5vdtBEv1R6axW+uAi3tyIzOS2KGbvAQ8gjInMEc89Z2u2o70MOza4IJfeW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531119; c=relaxed/simple;
	bh=bfFvQR7b9Eo1y4+Wi3gy1LHrsKMeE2pW8w9ssUoqus8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gp3E6+yNDae5ymjUkGJoyY5r38jZ72+yDSMRQBOCL5mOQY10v/OBn3W6wAdEY2RojWZv+yNT5epYhufhTyknSDAn9qHCO88m/7tCSEtS7cvYlOWTa2FiDv4NRmmxH7M87NU8tJLQoCueXVdXUlmkdHDhHk7loCj8q0MOLoDPQRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=AiN7Vw+K; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739531084;
	bh=7q1XuqsIgd5QB4KaATSp9610UQQvNvpW6b5+d5deU7E=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=AiN7Vw+KxZ5aUjBoXSZMFl9QWHstKV9TFxgiOwy9b5vbRTN4jNuscbId7iOPpg9Ac
	 OrdVbzJSrl684eTiarRHTgRsqbMnXkM8kq6fiG1CQnRFp2aD+8xop0VaTpa60fWdKI
	 JIOY/4ShM1C5oypiKTkwJFQE8/tUBssYQ2mMaVK8=
X-QQ-mid: bizesmtp78t1739531067temjoge9
X-QQ-Originating-IP: yGJJ4u6eJcgJ0RBUkY++t7Lt6A4QNPsaP+onWTsvJZs=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Feb 2025 19:04:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14881646394383815706
From: Wentao Guan <guanwentao@uniontech.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH] HID: i2c-hid: improve i2c_hid_get_report error message
Date: Fri, 14 Feb 2025 19:04:18 +0800
Message-Id: <20250214110418.16000-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-0
X-QQ-XMAILINFO: MELI+WA1+YWQcZWBz7pJwqyge3tHMHZH919bCPhc+/ABH75xkJ1p99uA
	OaX/lZ9XFbdVOix34z/HyzokFjMfvqXKTQN/p4DTVY7c5bpTJnNoUICzUe9JTCfPlN+6r2h
	EQWhXkybYVmd/dhMLEsS9DuZO55ZVXt+ZAhZXUwkJYuhDVvajTIaY21jyIYT9XrOONv+Kg9
	f582nAjqAAN9vZ5B8e8nn032iqrloWilEF2wItxnjQNFW1arQEMT+aRXepCKKOCS92nYUkp
	kU6J/g4LcLp700tpZfA/q3gS7Pxe7GudZZiisZ1aDSYe/XB3GXIqNSzIMb7WtKRzzeciPyg
	rPpZkHcGZQMryCgnaWu0S8tN68syAMzfyKW6Q6RDfw745t0vlJZbOvMXyM/zO/LO8EuzVW9
	zF3ZHnAsmuINKvEbanrAPctpJJc/CFMK7KEKanL2zmUR1M5rRaWW/fObqWMJM5YQDK27xt4
	+G5pniZE8+xdtSUyYLbgRmISvYkFb8O64U4No+NAFu4N/ypWW12n+KEwndjwZlEO068Bw3g
	S+VH7rM4wajeiVrmYZB6wgoXxndHmX+RBI6fbLPUyrVzVUpgwP0SEw6RImLixfb488ytrY2
	tgFWIEjBORLD30GITBh8LSh2R+HEL9S/z0JPERQb8LL6fIHwjZjaG4djCVSNluwBBrtkBsg
	09LHydf8K9IEcyQR7YLLvl0bdlbK4Y+z2twK86ZIY3iYHgEhHsHmGmZ5LB8ErI0f3oo6vBX
	v864q4EsWtD4LbRJ5mpQExPGFWTt845lkly0II8MJWXMWJWHt9IztgroO4oys6qRLDwEorI
	cZxba6upKXw6mJRJJudi88aqfBDES3dLmBwVMRBLWPUVx8WSpX21JvJvwfhM64obJTP/mnF
	g4V1h3bsboyweP/hNfBQ1zKlQKMgd/cZpS7/LitGDCTCkAzFJrbMehSfRieq1cWoRF4ZpBY
	QV/Mip5XYZs91mEH5Bg2K3DVrFPVt+8bS5JvLO11Wzp2OX499PIr8ZHds
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

We have two places to print "failed to set a report to ...",
use "get a report from" instead of "set a report to", it makes
people who knows less about the module to know where the error
happened.

Before:
i2c_hid_acpi i2c-FTSC1000:00: failed to set a report to device: -11

After:
i2c_hid_acpi i2c-FTSC1000:00: failed to get a report from device: -11

Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 75544448c2393..d3912e3f2f13a 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -290,7 +290,7 @@ static int i2c_hid_get_report(struct i2c_hid *ihid,
 			     ihid->rawbuf, recv_len + sizeof(__le16));
 	if (error) {
 		dev_err(&ihid->client->dev,
-			"failed to set a report to device: %d\n", error);
+			"failed to get a report from device: %d\n", error);
 		return error;
 	}
 
-- 
2.20.1


