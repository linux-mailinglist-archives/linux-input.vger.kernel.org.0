Return-Path: <linux-input+bounces-1859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F6851B7B
	for <lists+linux-input@lfdr.de>; Mon, 12 Feb 2024 18:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34EDCB27B01
	for <lists+linux-input@lfdr.de>; Mon, 12 Feb 2024 17:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114E13EA77;
	Mon, 12 Feb 2024 17:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kyQ4eyPB"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEDA3E49B;
	Mon, 12 Feb 2024 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707759102; cv=none; b=WkO2HCXCeUta5vgTZR80u5wbSxAAdd4yFGth9BXx0diCdK3LwwlfY2ktqmH9wYQR82HYDyNO7lsoewEWuFS2gyoh5d8QXwu5wYS68c7MimhoFEbZmZ/S6klginxO6npCZfPVLIEbBd7ohZuYCQtPkOqHy4GNKT+pLz6Cwq1RxXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707759102; c=relaxed/simple;
	bh=uZVnMAlSFnhCbJQrkUZZQlL8AyCiltV9+5I66A/UbBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xpwfh5PdDbj5caD6qqVKVuaVMdL00hAQNqrNBhSwBrdnD6SSSj1vNXC6gQkQSdeRZ4ZdnGNwcQOhBS8DboWAqBrdJPshoZl/NH2KbN9mU97vG19p1dyO6N3x+OiltVXMEIfTeXbSQLaueX5G9Cf+n5qB1wpDsNaFFQqTj1irNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kyQ4eyPB; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CHUwes002183;
	Mon, 12 Feb 2024 11:31:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=+2VcnyCY0Z86MmANPR3fnGBmoXSvwdSP9cna6XRhhMM=; b=
	kyQ4eyPBOK4bwHtSg6ugd2XQtXXOm3HYVXzC1UyzFCPExXCGfIxj88f5I05S6x9P
	a4V44HocbMDDgziHzCGo/fcU/8I1R47fBYusrt8YYKU6fDzfYUx3qKClEl61b0aO
	rnXfBAI0KAgrLQWQFEmG6tdCKfxpJF6PorlZGNV4MXd5anM1md/1haBg/SIt/RZj
	9gEP/CQMJxOIH6Bf1/gRZQU/rM0kk7aqwygtUubvlu8YAEqN8xHqB2i0MVc+CppG
	lM8W5WOwV06p1FaZ2edDQLATiPdNzAjWiHezkSNyt4FY96nVtTnjS82nJKaAqW+H
	bc2qCqBG6lFK8Xp+a1Pryw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w66ep25rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 11:31:22 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 17:31:20 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 12 Feb 2024 17:31:20 +0000
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id EFA55820243;
	Mon, 12 Feb 2024 17:31:18 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v7 1/5] firmware: cs_dsp: Add write sequencer interface
Date: Mon, 12 Feb 2024 17:31:07 +0000
Message-ID: <20240212173111.771107-2-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212173111.771107-1-jogletre@opensource.cirrus.com>
References: <20240212173111.771107-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cHD14TMp0iJr_wnwumY_G2h-dMKFHjN_
X-Proofpoint-GUID: cHD14TMp0iJr_wnwumY_G2h-dMKFHjN_
X-Proofpoint-Spam-Reason: safe

A write sequencer is a sequence of register addresses
and values executed by some Cirrus DSPs following
power state transitions.

Add support for Cirrus drivers to update or add to a
write sequencer present in firmware.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 265 +++++++++++++++++++++++++
 include/linux/firmware/cirrus/cs_dsp.h |  28 +++
 2 files changed, 293 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 79d4254d1f9b..2c754e7c5da1 100644
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
@@ -3339,6 +3345,265 @@ int cs_dsp_chunk_read(struct cs_dsp_chunk *ch, int nbits)
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
+		cs_dsp_err(dsp, "Failed to read %s: %d\n", wseq->ctl->subname, ret);
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
+		list_add_tail(&op->list, &wseq->ops);
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
+ * at the tail.
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
+		list_add_tail(&op_new->list, &wseq->ops);
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
+EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_multi_write, FW_CS_DSP);
+
 MODULE_DESCRIPTION("Cirrus Logic DSP Support");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 29cd11d5a3cf..cfeab75772f6 100644
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
@@ -255,6 +265,24 @@ struct cs_dsp_alg_region *cs_dsp_find_alg_region(struct cs_dsp *dsp,
 
 const char *cs_dsp_mem_region_name(unsigned int type);
 
+/**
+ * struct cs_dsp_wseq - Describes a write sequence
+ * @name:	Name of cs_dsp control
+ * @ctl:	Write sequence cs_dsp control
+ * @ops:	Operations contained within this write sequence
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


