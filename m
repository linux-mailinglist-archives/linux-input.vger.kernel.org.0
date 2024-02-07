Return-Path: <linux-input+bounces-1716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F414084C168
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 01:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D6E7286D33
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 00:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2601AB818;
	Wed,  7 Feb 2024 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RKHlu0GC"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7E53A0;
	Wed,  7 Feb 2024 00:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707266222; cv=none; b=u7VGO7ofzafZa5kSV1tqMbAb1Tk6+GYgSSDTNloEN0sDKJRAzxhWsuzfnuSyzpviLtRw4xgkTOeoRHuqE8UFFy2a0Swy2x5iohOwuXggOaX38L7rsN7pO5BIbueRGo77uMdw8n0wBtGdH6YCKAxBrJYwXG2LZgeuR2LS5XYF9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707266222; c=relaxed/simple;
	bh=vXVEHro+kh+YU7oYUQETQGKSqdh5tFmUoTsCCOespAA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oG5JnLeJ5dQO67MtBWmu3qsyqP6qTMjOJZdvqYXygAbztvnFpkoc8fx/EXlrBOoFcp5R+RLCFbVZRBaAV1rGSUkGMVHhxkaXUcbp6CfJNfNTpl8VXNLRLcMh3t/jFWKs1dYV606b7LR+r216XmRkml/1xA+/vRignnDgsoQ6eTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RKHlu0GC; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4166x9cg021815;
	Tue, 6 Feb 2024 18:36:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=bgXhbPQ0oVIzVPug/8JX+JbGbjZVzrHLQ1/b0crdZ48=; b=
	RKHlu0GCNN9+nicvfRsAWS8c1oBi4gWo74QqAe1g3uLM8AZoEvvyW31VVFW0Z7Nm
	Y3AvWKakHBS01mCb7Ji6MCIkn9RH9gMv3IUf7+fjKTmwNMLrWNRC9zlKYkvtpEYC
	dfg8WNclntbqAcIs6T0Ya+s7GoFSXDbENzMAgii4eP8stmAKrdtLjqywyQC064wR
	mauiw8SH2kgKQnDYclSfauokcEH8M10lGb9pQxtW4esq5e1fr2Z3+W6NPdI861m5
	hlb8Aj/S2b1Jpjj9bAc+VQknz9pPvzFZcqpv45lTghmd0W2nVVm030HlIc9PXo0Q
	t6gc5QCSk6fFXkOhHwKdzw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2cbg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 18:36:45 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 00:36:42 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 7 Feb 2024 00:36:42 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 353FC820246;
	Wed,  7 Feb 2024 00:36:41 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v6 1/5] firmware: cs_dsp: Add write sequencer interface
Date: Wed, 7 Feb 2024 00:36:08 +0000
Message-ID: <20240207003612.4187370-2-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
References: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LSdHx7hfL6XUvv3S9TNWJwa4S7TkRjmA
X-Proofpoint-ORIG-GUID: LSdHx7hfL6XUvv3S9TNWJwa4S7TkRjmA
X-Proofpoint-Spam-Reason: safe

A write sequencer is a sequence of register addresses
and values executed by some Cirrus DSPs following
power state transitions.

Add support for Cirrus drivers to update or add to a
write sequencer present in firmware.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 263 +++++++++++++++++++++++++
 include/linux/firmware/cirrus/cs_dsp.h |  29 +++
 2 files changed, 292 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 79d4254d1f9b..bf6aab16ddc4 100644
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
@@ -3339,6 +3345,263 @@ int cs_dsp_chunk_read(struct cs_dsp_chunk *ch, int nbits)
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
+static int cs_dsp_populate_wseq(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq)
+{
+	struct cs_dsp_wseq_op *op = NULL;
+	struct cs_dsp_chunk ch;
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
+		cs_dsp_err(dsp, "Failed to read %s: %d\n", wseq->name, ret);
+		goto err_free;
+	}
+
+	INIT_LIST_HEAD(&wseq->ops);
+
+	ch = cs_dsp_chunk(words, wseq->ctl->len);
+
+	while (!cs_dsp_chunk_end(&ch)) {
+		op = devm_kzalloc(dsp->dev, sizeof(*op), GFP_KERNEL);
+		if (!op) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
+
+		op->offset = cs_dsp_chunk_bytes(&ch);
+		op->operation = cs_dsp_chunk_read(&ch, 8);
+
+		switch (op->operation) {
+		case CS_DSP_WSEQ_END:
+			op->data = WSEQ_END_OF_SCRIPT;
+			break;
+		case CS_DSP_WSEQ_UNLOCK:
+			op->data = cs_dsp_chunk_read(&ch, 16);
+			break;
+		case CS_DSP_WSEQ_ADDR8:
+			op->address = cs_dsp_chunk_read(&ch, 8);
+			op->data = cs_dsp_chunk_read(&ch, 32);
+			break;
+		case CS_DSP_WSEQ_H16:
+		case CS_DSP_WSEQ_L16:
+			op->address = cs_dsp_chunk_read(&ch, 24);
+			op->data = cs_dsp_chunk_read(&ch, 16);
+			break;
+		case CS_DSP_WSEQ_FULL:
+			op->address = cs_dsp_chunk_read(&ch, 32);
+			op->data = cs_dsp_chunk_read(&ch, 32);
+			break;
+		default:
+			ret = -EINVAL;
+			cs_dsp_err(dsp, "Unsupported op: %X\n", op->operation);
+			goto err_free;
+		}
+
+		list_add(&op->list, &wseq->ops);
+
+		if (op->operation == CS_DSP_WSEQ_END)
+			break;
+	}
+
+	if (op && op->operation != CS_DSP_WSEQ_END) {
+		cs_dsp_err(dsp, "Write sequence missing end terminator\n");
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
+	int i, ret = 0;
+
+	mutex_lock(&dsp->pwr_lock);
+
+	for (i = 0; i < num_wseqs; i++) {
+		ret = cs_dsp_populate_wseq(dsp, &wseqs[i]);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&dsp->pwr_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cs_dsp_wseq_init);
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
+ * at the tail.
+ *
+ * This function formats register address and value pairs into the format
+ * required for write sequence entries, and either updates or adds the
+ * new entry into the write sequence.
+ *
+ * Return: Zero for success, a negative number on error.
+ */
+int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
+		      u32 addr, u32 data, u8 op_code, bool update)
+{
+	struct cs_dsp_wseq_op *op_end, *op_new = NULL;
+	u32 words[WSEQ_OP_MAX_WORDS];
+	struct cs_dsp_chunk ch;
+	int new_op_size, ret;
+
+	if (update)
+		op_new = cs_dsp_wseq_find_op(addr, op_code, &wseq->ops);
+
+	/* If entry to update is not found, treat it as a new operation */
+	if (!op_new) {
+		op_end = cs_dsp_wseq_find_op(0, CS_DSP_WSEQ_END, &wseq->ops);
+		if (!op_end) {
+			cs_dsp_err(dsp, "Missing write sequence list terminator\n");
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
+	ch = cs_dsp_chunk(words, sizeof(words));
+	cs_dsp_chunk_write(&ch, 8, op_new->operation);
+	switch (op_code) {
+	case CS_DSP_WSEQ_FULL:
+		cs_dsp_chunk_write(&ch, 32, op_new->address);
+		cs_dsp_chunk_write(&ch, 32, op_new->data);
+		break;
+	case CS_DSP_WSEQ_L16:
+	case CS_DSP_WSEQ_H16:
+		cs_dsp_chunk_write(&ch, 24, op_new->address);
+		cs_dsp_chunk_write(&ch, 16, op_new->data);
+		break;
+	default:
+		ret = -EINVAL;
+		cs_dsp_err(dsp, "Op code not supported: %X\n", op_code);
+		goto op_new_free;
+	}
+
+	new_op_size = cs_dsp_chunk_bytes(&ch);
+
+	if (!update) {
+		if (wseq->ctl->len - op_end->offset < new_op_size) {
+			cs_dsp_err(dsp, "Not enough memory in write sequence for entry\n");
+			ret = -ENOMEM;
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
+		list_add(&op_new->list, &wseq->ops);
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
+EXPORT_SYMBOL_GPL(cs_dsp_wseq_write);
+
+/**
+ * cs_dsp_wseq_multi_write() - Add or update multiple entries in the write sequence
+ * @dsp: Pointer to a DSP structure
+ * @wseq: Write sequence to write to
+ * @reg_seq: List of address-data pairs
+ * @num_regs: Number of address-data pairs
+ * @op_code: The types of operations of the new entries
+ * @update: If true, searches for the first entry in the write sequence with the same
+ * address and op code, and replaces it. If false, creates a new entry at the tail.
+ *
+ * This function calls cs_dsp_wseq_write() for multiple address-data pairs.
+ *
+ * Return: Zero for success, a negative number on error.
+ */
+int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
+			    const struct reg_sequence *reg_seq, int num_regs,
+			    u8 op_code, bool update)
+{
+	int ret, i;
+
+	for (i = 0; i < num_regs; i++) {
+		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
+					reg_seq[i].def, update, op_code);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs_dsp_wseq_multi_write);
+
 MODULE_DESCRIPTION("Cirrus Logic DSP Support");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 29cd11d5a3cf..8190f12d3620 100644
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
@@ -255,6 +265,25 @@ struct cs_dsp_alg_region *cs_dsp_find_alg_region(struct cs_dsp *dsp,
 
 const char *cs_dsp_mem_region_name(unsigned int type);
 
+/**
+ * struct cs_dsp_wseq - Describes a write sequence
+ * @name:	Name of cs_dsp control
+ * @ctl:	Write sequence cs_dsp control
+ * @ops:	Operations contained within this write sequence
+ */
+struct cs_dsp_wseq {
+	const char *name;
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


