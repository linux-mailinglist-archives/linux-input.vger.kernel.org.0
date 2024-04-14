Return-Path: <linux-input+bounces-2861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2789C858
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 17:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A722B24BB8
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 15:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23081411C8;
	Mon,  8 Apr 2024 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="btj2/YUe"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BD140E4F;
	Mon,  8 Apr 2024 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590360; cv=none; b=RDAToOKgeEcBjHDDJViRAzTrx14j9Q0dgEjqm29Ei37e8B2IKpcZ4jn/nRn6x+Se05Ub5Ca1CHPppsIWri5udaVTgVNd2REvScmD1BxQpQri3n7dLlrZhE9BP8K3/HISIuCRafil7W57IZe+qzMJguJ6FH+3Ddbv06z8cr2L8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590360; c=relaxed/simple;
	bh=eQoYdTipkil60G9LHeKY6pzFgsjc4Q7V3HgdCN0Ecww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5fG+7mhEhKf757z10q07YlUxt8Ng3KoSBCF1ffCLzpGocZ/LmRZEj70/Wp/9fVrLSZJtnO/pvpwYEorwzmn1dxoK+zo6ot+bVeuMf7EE1W79o6w2uV+xyMoB5nvIOuur7DZIxWVWozldqNaPba9OMhLal32LxdXwEhyHRmAyeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=btj2/YUe; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4385hvTq026412;
	Mon, 8 Apr 2024 10:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=flBovG7A7Ricx9lHP7KmTyHpg1bDMCW7j1wx8ms1+Hg=; b=
	btj2/YUejoR8QgnyhgnVHstS3niPIw375ssU/089X9LNcvfqraHs6L0pRjTzBSFg
	ryqPdxkLa+NOoIH2kq5hvCN5BWGvuyCf2TDgppT2QCqrgl1+gm6FAUsb7iuQhgi0
	hE080TVPQT5dvRkiBMAe6QrFGv5iEmH+W/it4+UoXTsRSfsU4pMvMWZ84XmAUKZW
	ql6cgSda7/SC9llRb1Zn+Bk17J64cWtiEiU8WmHkZH4Mxgv2D6zERGM3OU2/McQ5
	2iq/1yHKUjKyqRccB0wxfMFTTEJOJNll5/lKmm4s1YWh8fr+K8EQz0iqC5/QlIuj
	H2tolmLWfikfcezOxJo+Jw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxhm7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 10:32:28 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Apr 2024
 16:32:26 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 8 Apr 2024 16:32:26 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 823B7820242;
	Mon,  8 Apr 2024 15:32:24 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>
Subject: [PATCH RESEND v10 1/5] firmware: cs_dsp: Add write sequence interface
Date: Mon, 8 Apr 2024 15:32:10 +0000
Message-ID: <20240408153214.42368-2-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GtHoPSl5MGi-9o26P1h6q0Pt1WboQWSX
X-Proofpoint-GUID: GtHoPSl5MGi-9o26P1h6q0Pt1WboQWSX
X-Proofpoint-Spam-Reason: safe

A write sequence is a sequence of register addresses
and values executed by some Cirrus DSPs following
certain power state transitions.

Add support for Cirrus drivers to update or add to a
write sequence present in firmware.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 278 +++++++++++++++++++++++++
 include/linux/firmware/cirrus/cs_dsp.h |  27 +++
 2 files changed, 305 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 79d4254d1f9b..6d886ffea10f 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -275,6 +275,12 @@
 #define HALO_MPU_VIO_ERR_SRC_MASK           0x00007fff
 #define HALO_MPU_VIO_ERR_SRC_SHIFT                   0
 
+/*
+ * Write Sequence
+ */
+#define WSEQ_OP_MAX_WORDS	3
+#define WSEQ_END_OF_SCRIPT	0xFFFFFF
+
 struct cs_dsp_ops {
 	bool (*validate_version)(struct cs_dsp *dsp, unsigned int version);
 	unsigned int (*parse_sizes)(struct cs_dsp *dsp,
@@ -3339,6 +3345,278 @@ int cs_dsp_chunk_read(struct cs_dsp_chunk *ch, int nbits)
 }
 EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_read, FW_CS_DSP);
 
+
+struct cs_dsp_wseq_op {
+	struct list_head list;
+	u32 address;
+	u32 data;
+	u16 offset;
+	u8 operation;
+};
+
+static void cs_dsp_wseq_clear(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq)
+{
+	struct cs_dsp_wseq_op *op, *op_tmp;
+
+	list_for_each_entry_safe(op, op_tmp, &wseq->ops, list) {
+		list_del(&op->list);
+		devm_kfree(dsp->dev, op);
+	}
+}
+
+static int cs_dsp_populate_wseq(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq)
+{
+	struct cs_dsp_wseq_op *op = NULL;
+	struct cs_dsp_chunk chunk;
+	u8 *words;
+	int ret;
+
+	if (!wseq->ctl) {
+		cs_dsp_err(dsp, "No control for write sequence\n");
+		return -EINVAL;
+	}
+
+	words = kzalloc(wseq->ctl->len, GFP_KERNEL);
+	if (!words)
+		return -ENOMEM;
+
+	ret = cs_dsp_coeff_read_ctrl(wseq->ctl, 0, words, wseq->ctl->len);
+	if (ret) {
+		cs_dsp_err(dsp, "Failed to read %s: %d\n", wseq->ctl->subname, ret);
+		goto err_free;
+	}
+
+	INIT_LIST_HEAD(&wseq->ops);
+
+	chunk = cs_dsp_chunk(words, wseq->ctl->len);
+
+	while (!cs_dsp_chunk_end(&chunk)) {
+		op = devm_kzalloc(dsp->dev, sizeof(*op), GFP_KERNEL);
+		if (!op) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
+
+		op->offset = cs_dsp_chunk_bytes(&chunk);
+		op->operation = cs_dsp_chunk_read(&chunk, 8);
+
+		switch (op->operation) {
+		case CS_DSP_WSEQ_END:
+			op->data = WSEQ_END_OF_SCRIPT;
+			break;
+		case CS_DSP_WSEQ_UNLOCK:
+			op->data = cs_dsp_chunk_read(&chunk, 16);
+			break;
+		case CS_DSP_WSEQ_ADDR8:
+			op->address = cs_dsp_chunk_read(&chunk, 8);
+			op->data = cs_dsp_chunk_read(&chunk, 32);
+			break;
+		case CS_DSP_WSEQ_H16:
+		case CS_DSP_WSEQ_L16:
+			op->address = cs_dsp_chunk_read(&chunk, 24);
+			op->data = cs_dsp_chunk_read(&chunk, 16);
+			break;
+		case CS_DSP_WSEQ_FULL:
+			op->address = cs_dsp_chunk_read(&chunk, 32);
+			op->data = cs_dsp_chunk_read(&chunk, 32);
+			break;
+		default:
+			ret = -EINVAL;
+			cs_dsp_err(dsp, "Unsupported op: %X\n", op->operation);
+			devm_kfree(dsp->dev, op);
+			goto err_free;
+		}
+
+		list_add_tail(&op->list, &wseq->ops);
+
+		if (op->operation == CS_DSP_WSEQ_END)
+			break;
+	}
+
+	if (op && op->operation != CS_DSP_WSEQ_END) {
+		cs_dsp_err(dsp, "%s missing end terminator\n", wseq->ctl->subname);
+		ret = -ENOENT;
+	}
+
+err_free:
+	kfree(words);
+
+	return ret;
+}
+
+/**
+ * cs_dsp_wseq_init() - Initialize write sequences contained within the loaded DSP firmware
+ * @dsp: Pointer to DSP structure
+ * @wseqs: List of write sequences to initialize
+ * @num_wseqs: Number of write sequences to initialize
+ *
+ * Return: Zero for success, a negative number on error.
+ */
+int cs_dsp_wseq_init(struct cs_dsp *dsp, struct cs_dsp_wseq *wseqs, unsigned int num_wseqs)
+{
+	int i, ret;
+
+	lockdep_assert_held(&dsp->pwr_lock);
+
+	for (i = 0; i < num_wseqs; i++) {
+		ret = cs_dsp_populate_wseq(dsp, &wseqs[i]);
+		if (ret) {
+			cs_dsp_wseq_clear(dsp, &wseqs[i]);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_init, FW_CS_DSP);
+
+static struct cs_dsp_wseq_op *cs_dsp_wseq_find_op(u32 addr, u8 op_code,
+						  struct list_head *wseq_ops)
+{
+	struct cs_dsp_wseq_op *op;
+
+	list_for_each_entry(op, wseq_ops, list) {
+		if (op->operation == op_code && op->address == addr)
+			return op;
+	}
+
+	return NULL;
+}
+
+/**
+ * cs_dsp_wseq_write() - Add or update an entry in a write sequence
+ * @dsp: Pointer to a DSP structure
+ * @wseq: Write sequence to write to
+ * @addr: Address of the register to be written to
+ * @data: Data to be written
+ * @op_code: The type of operation of the new entry
+ * @update: If true, searches for the first entry in the write sequence with
+ * the same address and op_code, and replaces it. If false, creates a new entry
+ * at the tail
+ *
+ * This function formats register address and value pairs into the format
+ * required for write sequence entries, and either updates or adds the
+ * new entry into the write sequence.
+ *
+ * If update is set to true and no matching entry is found, it will add a new entry.
+ *
+ * Return: Zero for success, a negative number on error.
+ */
+int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
+		      u32 addr, u32 data, u8 op_code, bool update)
+{
+	struct cs_dsp_wseq_op *op_end, *op_new = NULL;
+	u32 words[WSEQ_OP_MAX_WORDS];
+	struct cs_dsp_chunk chunk;
+	int new_op_size, ret;
+
+	if (update)
+		op_new = cs_dsp_wseq_find_op(addr, op_code, &wseq->ops);
+
+	/* If entry to update is not found, treat it as a new operation */
+	if (!op_new) {
+		op_end = cs_dsp_wseq_find_op(0, CS_DSP_WSEQ_END, &wseq->ops);
+		if (!op_end) {
+			cs_dsp_err(dsp, "Missing terminator for %s\n", wseq->ctl->subname);
+			return -EINVAL;
+		}
+
+		op_new = devm_kzalloc(dsp->dev, sizeof(*op_new), GFP_KERNEL);
+		if (!op_new)
+			return -ENOMEM;
+
+		op_new->operation = op_code;
+		op_new->address = addr;
+		op_new->offset = op_end->offset;
+		update = false;
+	}
+
+	op_new->data = data;
+
+	chunk = cs_dsp_chunk(words, sizeof(words));
+	cs_dsp_chunk_write(&chunk, 8, op_new->operation);
+
+	switch (op_code) {
+	case CS_DSP_WSEQ_FULL:
+		cs_dsp_chunk_write(&chunk, 32, op_new->address);
+		cs_dsp_chunk_write(&chunk, 32, op_new->data);
+		break;
+	case CS_DSP_WSEQ_L16:
+	case CS_DSP_WSEQ_H16:
+		cs_dsp_chunk_write(&chunk, 24, op_new->address);
+		cs_dsp_chunk_write(&chunk, 16, op_new->data);
+		break;
+	default:
+		ret = -EINVAL;
+		cs_dsp_err(dsp, "Operation %X not supported\n", op_code);
+		goto op_new_free;
+	}
+
+	new_op_size = cs_dsp_chunk_bytes(&chunk);
+
+	if (!update) {
+		if (wseq->ctl->len - op_end->offset < new_op_size) {
+			cs_dsp_err(dsp, "Not enough memory in %s for entry\n", wseq->ctl->subname);
+			ret = -E2BIG;
+			goto op_new_free;
+		}
+
+		op_end->offset += new_op_size;
+
+		ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_end->offset / sizeof(u32),
+					      &op_end->data, sizeof(u32));
+		if (ret)
+			goto op_new_free;
+
+		list_add_tail(&op_new->list, &op_end->list);
+	}
+
+	ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_new->offset / sizeof(u32),
+				      words, new_op_size);
+	if (ret)
+		goto op_new_free;
+
+	return 0;
+
+op_new_free:
+	devm_kfree(dsp->dev, op_new);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_write, FW_CS_DSP);
+
+/**
+ * cs_dsp_wseq_multi_write() - Add or update multiple entries in a write sequence
+ * @dsp: Pointer to a DSP structure
+ * @wseq: Write sequence to write to
+ * @reg_seq: List of address-data pairs
+ * @num_regs: Number of address-data pairs
+ * @op_code: The types of operations of the new entries
+ * @update: If true, searches for the first entry in the write sequence with
+ * the same address and op_code, and replaces it. If false, creates a new entry
+ * at the tail
+ *
+ * This function calls cs_dsp_wseq_write() for multiple address-data pairs.
+ *
+ * Return: Zero for success, a negative number on error.
+ */
+int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
+			    const struct reg_sequence *reg_seq, int num_regs,
+			    u8 op_code, bool update)
+{
+	int i, ret;
+
+	for (i = 0; i < num_regs; i++) {
+		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
+					reg_seq[i].def, op_code, update);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_multi_write, FW_CS_DSP);
+
 MODULE_DESCRIPTION("Cirrus Logic DSP Support");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 29cd11d5a3cf..4cef6fafa1d8 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -42,6 +42,16 @@
 #define CS_DSP_ACKED_CTL_MIN_VALUE           0
 #define CS_DSP_ACKED_CTL_MAX_VALUE           0xFFFFFF
 
+/*
+ * Write sequence operation codes
+ */
+#define CS_DSP_WSEQ_FULL	0x00
+#define CS_DSP_WSEQ_ADDR8	0x02
+#define CS_DSP_WSEQ_L16		0x04
+#define CS_DSP_WSEQ_H16		0x05
+#define CS_DSP_WSEQ_UNLOCK	0xFD
+#define CS_DSP_WSEQ_END		0xFF
+
 /**
  * struct cs_dsp_region - Describes a logical memory region in DSP address space
  * @type:	Memory region type
@@ -255,6 +265,23 @@ struct cs_dsp_alg_region *cs_dsp_find_alg_region(struct cs_dsp *dsp,
 
 const char *cs_dsp_mem_region_name(unsigned int type);
 
+/**
+ * struct cs_dsp_wseq - Describes a write sequence
+ * @ctl:	Write sequence cs_dsp control
+ * @ops:	Operations contained within
+ */
+struct cs_dsp_wseq {
+	struct cs_dsp_coeff_ctl *ctl;
+	struct list_head ops;
+};
+
+int cs_dsp_wseq_init(struct cs_dsp *dsp, struct cs_dsp_wseq *wseqs, unsigned int num_wseqs);
+int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq, u32 addr, u32 data,
+		      u8 op_code, bool update);
+int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
+			    const struct reg_sequence *reg_seq, int num_regs,
+			    u8 op_code, bool update);
+
 /**
  * struct cs_dsp_chunk - Describes a buffer holding data formatted for the DSP
  * @data:	Pointer to underlying buffer memory
-- 
2.25.1


