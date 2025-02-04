Return-Path: <linux-input+bounces-9776-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43257A27F93
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B59F18864A4
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 23:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F63221CA0A;
	Tue,  4 Feb 2025 23:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fXsSkeXF"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689932163BA;
	Tue,  4 Feb 2025 23:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711634; cv=none; b=j4q8SRJ+oXbCsGeexbFAGVYgcEI4To7Q/GV3RqaxwKU+d9BAUgkiyJxWfr3ApucnaYopaTDBK4n1HvZK/CIvkTeAmHHBpEVRgNZ5/HqfZZJAVm+1l3Y+WF6mqP1VNo3fv/L3o7ICQ5K7Mni7mcYH58nDFtsBdsCwySrBrW+/a70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711634; c=relaxed/simple;
	bh=1Ndbk2BaIajsSq6LVjOKCXHTVo6NfBh3Ifl5W7zU9q4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UoV8VaXnPplX6tp8nCGnXl/X1LAjAvva+8dfW1FbC6ZQBGDJ6kqeiauRAWyFCxfCuER+T3VDi4FVxQsaIJGZc0XudmDk9LFBgknNrDKO3AKBk8tXyth7chYZiL42NOM4HCRIQ6zKv9FE6w0KvIalfcoeFnmMCj7HEN0nkVd8C04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fXsSkeXF; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Klioc016339;
	Tue, 4 Feb 2025 17:19:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4rk84s04nJmPDhNfVK0qQcCyoF1+d6Q1J1vzsSv4K4c=; b=
	fXsSkeXFyA3zFwkflPotTk/AvJWBN7rwXu9+spJWWZf3DFgttkG+ZQ16iGddrTJ2
	c9A5rzMb7mh9d6Fg3Bozyr6W4IZ46E1tIuVgmtNOjfTXKLmBCihoYq0xg77UhqrQ
	cbL/8BZ0XOimg6VoGFExUUqYfuLjCpthTjksSa7T8+Lr4x39P2EsJlYVrZSDWe6C
	qhKlBajk1ZgrRO4JBMx40u1aQ4dRhjWXnUQH8tXW6eUugXZL7hWvQqUjQk0+2pup
	5/sz7ahhHNe5KvSyXrA02UCrgP2L6El8Tozj3SfdWuKg/dJolP+3a8y+RU8nhVTJ
	7Mzx1Yk1lWKPXnnPRLAXzw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm3spw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:19:43 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:19:41 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:19:36 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5020F820248;
	Tue,  4 Feb 2025 23:19:32 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Ben Bright
	<ben.bright@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Jeff LaBundy
	<jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
        Karel Balej
	<balejk@matfyz.cz>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Binbin Zhou
	<zhoubinbin@loongson.cn>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        "Paul
 Handrigan" <paulha@opensource.cirrus.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
        Fred Treven
	<ftreven@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH RESEND 2/7] firmware: cs_dsp: Check for valid num_regs in cs_dsp_wseq_multi_write()
Date: Tue, 4 Feb 2025 17:18:31 -0600
Message-ID: <20250204231835.2000457-3-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a2a08f cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=pYzt1GAZzx6qoJfKPqoA:9 a=zZCYzV9kfG8A:10 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: QwIhPN2wXpUWh2VjXVyow-eG4EN6tgsG
X-Proofpoint-GUID: QwIhPN2wXpUWh2VjXVyow-eG4EN6tgsG
X-Proofpoint-Spam-Reason: safe

If a value of 0 or below is passed into cs_dsp_wseq_multi_write()
the function will never enter its for loop.

Verify that num_regs passed into the function is valid
and throw a user-visible error if not.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 56315b0b5583..aacf6960d1ea 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -3743,6 +3743,11 @@ int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 {
 	int i, ret;
 
+	if (num_regs <= 0) {
+		cs_dsp_err(dsp, "Invalid number of regs: %d\n", num_regs);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < num_regs; i++) {
 		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
 					reg_seq[i].def, op_code, update);
-- 
2.34.1


