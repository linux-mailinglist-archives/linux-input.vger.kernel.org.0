Return-Path: <linux-input+bounces-9775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C40A27F8F
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F50F3A1E4E
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 23:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7878B21C9FA;
	Tue,  4 Feb 2025 23:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U/Lbx5t5"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9162163BA;
	Tue,  4 Feb 2025 23:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738711535; cv=none; b=ffOu+WCEFC4YukALYGY1O5zmOOIJlIkLIDtD/leAuiHj3IVj4AWZOFwF5WjylVNvGz+gqG74J04IONCoI682bIUXtvC/YR2Wo9o4WPSg9QGn6OKnkSHRd8JSx40aJdBSvAfyxc5usTeSYTM69rm2DTcZoD0HxZ/UaDz2kZhI8jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738711535; c=relaxed/simple;
	bh=ww5lwq80YlcASZ3YG6eNRBG2H6zs9+reQUjR4d3hVtM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzEPiRXt45iFTHG6mb/dIayAW37Ncl9L8cZsM5LypyUtrdXJ+w070PutPdPmToDxRvVYU2f9UsEtk8xzgRURMBWqD9PiA0Q9gzvTwxllRDTqIS9lfaH+CopaQdrZBvCmIN7TO3n7JPA/ahqznXptPihp41CmyzqtKzsngIeVwsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U/Lbx5t5; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514FmAYt022131;
	Tue, 4 Feb 2025 17:19:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yTyJHpwhqETQXxe7Ynl0sgZnYO0w/sB7CjGflqNdOyw=; b=
	U/Lbx5t5Tx/HlP7OXVyXJcfxtft5pkyuAMybAwYClkug1tXsvQgIU+//F9yNGxuq
	hnsWvbLXwt1DYW2LfhkMCTH6vBBuqUAP9/XFHQQPDcpFcWFx3mY9xMBEL6LN2Nso
	2/SCqQOmfsfWr+DAyFuWSgaICXS5x/ZkHbOMpS8HP8twNEPwBx1fqyfk2iyteOYF
	cuNhrKIJ1JEUQKHVIb6cxrpa5jZ4wa9FJllsCCo58fX3NCAKF50E/xRxVH3VEBxv
	uYcbDCSYblqo8NgKCiHEmxC85T8Df0CVMYew4JHZOy2SaXamj5U3NRLOG4k4tUKk
	4a+n9K+JlfR5yibN0LT8yQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm3sq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 17:19:52 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 23:19:51 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 23:19:46 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BA64D820270;
	Tue,  4 Feb 2025 23:19:41 +0000 (UTC)
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
Subject: [PATCH RESEND 3/7] firmware: cs_dsp: Add ability to load multiple coefficient files
Date: Tue, 4 Feb 2025 17:18:32 -0600
Message-ID: <20250204231835.2000457-4-ftreven@opensource.cirrus.com>
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
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a2a098 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=MbgxawBnhQrWfd7Trs8A:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: 9_dhfxmiASLxP9Y926m-CR9JRVBGU0yo
X-Proofpoint-GUID: 9_dhfxmiASLxP9Y926m-CR9JRVBGU0yo
X-Proofpoint-Spam-Reason: safe

Add cs_dsp_power_up_multiple() which accepts an array of
cs_dsp_coeff_desc firmware-filename pairs to load.

This enables the user to load more than one tuning file
along with the associated firmware.

Change cs_dsp_power_up() to make use of the new function
with a single coefficient file.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 61 ++++++++++++++++++++------
 include/linux/firmware/cirrus/cs_dsp.h | 14 ++++++
 2 files changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index aacf6960d1ea..68563186637e 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2695,28 +2695,29 @@ static void cs_dsp_halo_stop_watchdog(struct cs_dsp *dsp)
 }
 
 /**
- * cs_dsp_power_up() - Downloads firmware to the DSP
- * @dsp: pointer to DSP structure
+ * cs_dsp_power_up_multiple() - Downloads firmware and multiple coefficient files to the DSP
+ * @dsp: pointer to the DSP structure
  * @wmfw_firmware: the firmware to be sent
  * @wmfw_filename: file name of firmware to be sent
- * @coeff_firmware: the coefficient data to be sent
- * @coeff_filename: file name of coefficient to data be sent
+ * @coeffs: coefficient data and filename pairs to be sent
+ * @num_coeffs: number of coefficient files to be sent
  * @fw_name: the user-friendly firmware name
  *
  * This function is used on ADSP2 and Halo DSP cores, it powers-up the DSP core
  * and downloads the firmware but does not start the firmware running. The
  * cs_dsp booted flag will be set once completed and if the core has a low-power
  * memory retention mode it will be put into this state after the firmware is
- * downloaded.
+ * downloaded. Differs from cs_dsp_power_up() in that it allows for multiple
+ * coefficient files to be downloaded.
  *
  * Return: Zero for success, a negative number on error.
  */
-int cs_dsp_power_up(struct cs_dsp *dsp,
-		    const struct firmware *wmfw_firmware, const char *wmfw_filename,
-		    const struct firmware *coeff_firmware, const char *coeff_filename,
-		    const char *fw_name)
+int cs_dsp_power_up_multiple(struct cs_dsp *dsp,
+			     const struct firmware *wmfw_firmware, const char *wmfw_filename,
+			     struct cs_dsp_coeff_desc *coeffs, int num_coeffs,
+			     const char *fw_name)
 {
-	int ret;
+	int i, ret;
 
 	mutex_lock(&dsp->pwr_lock);
 
@@ -2742,9 +2743,12 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
 	if (ret != 0)
 		goto err_ena;
 
-	ret = cs_dsp_load_coeff(dsp, coeff_firmware, coeff_filename);
-	if (ret != 0)
-		goto err_ena;
+	for (i = 0; i < num_coeffs; i++) {
+		ret = cs_dsp_load_coeff(dsp, coeffs[i].coeff_firmware,
+					coeffs[i].coeff_filename);
+		if (ret != 0)
+			goto err_ena;
+	}
 
 	/* Initialize caches for enabled and unset controls */
 	ret = cs_dsp_coeff_init_control_caches(dsp);
@@ -2770,6 +2774,37 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(cs_dsp_power_up_multiple, "FW_CS_DSP");
+
+/**
+ * cs_dsp_power_up() - Downloads firmware to the DSP
+ * @dsp: pointer to DSP structure
+ * @wmfw_firmware: the firmware to be sent
+ * @wmfw_filename: file name of firmware to be sent
+ * @coeff_firmware: the coefficient data to be sent
+ * @coeff_filename: file name of coefficient to data be sent
+ * @fw_name: the user-friendly firmware name
+ *
+ * This function is used on ADSP2 and Halo DSP cores, it powers-up the DSP core
+ * and downloads the firmware but does not start the firmware running. The
+ * cs_dsp booted flag will be set once completed and if the core has a low-power
+ * memory retention mode it will be put into this state after the firmware is
+ * downloaded.
+ *
+ * Return: Zero for success, a negative number on error.
+ */
+int cs_dsp_power_up(struct cs_dsp *dsp,
+		    const struct firmware *wmfw_firmware, const char *wmfw_filename,
+		    const struct firmware *coeff_firmware, const char *coeff_filename,
+		    const char *fw_name)
+{
+	struct cs_dsp_coeff_desc coeff_desc;
+
+	coeff_desc.coeff_firmware = coeff_firmware;
+	coeff_desc.coeff_filename = coeff_filename;
+
+	return cs_dsp_power_up_multiple(dsp, wmfw_firmware, wmfw_filename, &coeff_desc, 1, fw_name);
+}
 EXPORT_SYMBOL_NS_GPL(cs_dsp_power_up, "FW_CS_DSP");
 
 /**
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 7cae703b3137..4c4e746be6fa 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -52,6 +52,16 @@
 #define CS_DSP_WSEQ_UNLOCK	0xFD
 #define CS_DSP_WSEQ_END		0xFF
 
+/**
+ * struct cs_dsp_coeff_desc - Describes a coeff. file + filename pair
+ * @coeff_firmware:	Firmware struct to populate with coeff. data
+ * @coeff_filename:	File from which coeff. data is loaded
+ */
+struct cs_dsp_coeff_desc {
+	const struct firmware *coeff_firmware;
+	const char *coeff_filename;
+};
+
 /**
  * struct cs_dsp_region - Describes a logical memory region in DSP address space
  * @type:	Memory region type
@@ -227,6 +237,10 @@ int cs_dsp_adsp1_power_up(struct cs_dsp *dsp,
 			  const struct firmware *coeff_firmware, const char *coeff_filename,
 			  const char *fw_name);
 void cs_dsp_adsp1_power_down(struct cs_dsp *dsp);
+int cs_dsp_power_up_multiple(struct cs_dsp *dsp,
+			     const struct firmware *wmfw_firmware, const char *wmfw_filename,
+			     struct cs_dsp_coeff_desc *coeffs, int num_coeffs,
+			     const char *fw_name);
 int cs_dsp_power_up(struct cs_dsp *dsp,
 		    const struct firmware *wmfw_firmware, const char *wmfw_filename,
 		    const struct firmware *coeff_firmware, const char *coeff_filename,
-- 
2.34.1


