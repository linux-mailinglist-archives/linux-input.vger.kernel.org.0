Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA58701D8F
	for <lists+linux-input@lfdr.de>; Sun, 14 May 2023 15:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjENNLg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 May 2023 09:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjENNLd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 May 2023 09:11:33 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CCB212F
        for <linux-input@vger.kernel.org>; Sun, 14 May 2023 06:11:31 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34ED7Dv0005389
        for <linux-input@vger.kernel.org>; Sun, 14 May 2023 13:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=NhPwqiRFpF7Tzz+Ti7FoQubqdF/nJT06yoCSHj7D00M=;
 b=LHo0bU3Dsr+TGgxZTIANpf07fn7BjP9/5ICgO3wHzuatqL4qE+RZEBscd8BV4kIWoCIn
 obC0a9OVy+olT0TjX4xzbP8GZHaULlYbXIhCFQMDZWpU8A5s3s79IEK9DRDUwtb+Veu/
 qBNZHmAsM9ddnLt+L8tCz2MEDF89mH00wea+OwWA8UMKwguchP1sT0vMvjmp2A4dWUKG
 lJVaNlPZabig5JrK7Rlzpn4fIMjGhKWcWGs1ZjVXwh4Lpe3VFfUQWFylrqPkVL6tspjE
 uOjg8lqNzUaNImqXPGF6T4x0mnIvTxjm1bJpyGAph4Wz5yHBIFXgdNMcpp7jGbNBZFoi pg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qj3udhqut-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-input@vger.kernel.org>; Sun, 14 May 2023 13:11:30 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34EDBUep027644
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-input@vger.kernel.org>; Sun, 14 May 2023 13:11:30 GMT
Received: from jianguos-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Sun, 14 May 2023 06:11:29 -0700
From:   Jianguo Sun <quic_jianguos@quicinc.com>
To:     <linux-input@vger.kernel.org>
CC:     Jianguo Sun <quic_jianguos@quicinc.com>
Subject: [PATCH] virtio-input: add flat device config data support
Date:   Sun, 14 May 2023 21:10:52 +0800
Message-ID: <20230514131052.4374-1-quic_jianguos@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Teel5Nf0uRzh0wbrNxQ1Yh66EZeWTtaS
X-Proofpoint-ORIG-GUID: Teel5Nf0uRzh0wbrNxQ1Yh66EZeWTtaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-14_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1011 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305140121
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The virtio-input takes stack device config data by default, which needs hypervisor
to bank the config data in stack mode as well, now add flat device config support
in case hypervisor don't support stack mode or there is no hypervisor at all, that
is, hypervisor-less virtio in AMP Multi-OS systems.

Change-Id: I803b90836196cc11fec1dad5e2aebb988d7e3558
Signed-off-by: Jianguo Sun <quic_jianguos@quicinc.com>
---
 drivers/virtio/virtio_input.c     | 223 +++++++++++++++++++++++++-----
 include/uapi/linux/virtio_input.h |  54 ++++++++
 2 files changed, 242 insertions(+), 35 deletions(-)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index 3aa46703872d..05a26dac8471 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -135,6 +135,38 @@ static u8 virtinput_cfg_select(struct virtio_input *vi,
 	return size;
 }
 
+static void virtinput_plat_cfg_bits(struct virtio_input *vi, u8 bytes,
+					u16 offset, int subsel,
+					unsigned long *bits, u32 bitcount, bool is_evbits)
+{
+	unsigned int bit;
+	u8 *virtio_bits;
+
+	if (!bytes)
+		return;
+	if (bitcount > bytes * 8)
+		bitcount = bytes * 8;
+
+	/*
+	 * Bitmap in virtio config space is a simple stream of bytes,
+	 * with the first byte carrying bits 0-7, second bits 8-15 and
+	 * so on.
+	 */
+	virtio_bits = kzalloc(bytes, GFP_KERNEL);
+	if (!virtio_bits)
+		return;
+	virtio_cread_bytes(vi->vdev, offset,
+			   virtio_bits, bytes);
+	for (bit = 0; bit < bitcount; bit++) {
+		if (virtio_bits[bit / 8] & (1 << (bit % 8)))
+			__set_bit(bit, bits);
+	}
+	kfree(virtio_bits);
+
+	if (is_evbits)
+		__set_bit(subsel, vi->idev->evbit);
+}
+
 static void virtinput_cfg_bits(struct virtio_input *vi, int select, int subsel,
 			       unsigned long *bits, unsigned int bitcount)
 {
@@ -169,6 +201,20 @@ static void virtinput_cfg_bits(struct virtio_input *vi, int select, int subsel,
 		__set_bit(subsel, vi->idev->evbit);
 }
 
+static void virtinput_flat_cfg_abs(struct virtio_input *vi, unsigned int offset,
+									int abs)
+{
+	u32 mi, ma, re, fu, fl;
+
+	virtio_cread_bytes(vi->vdev, offset, &mi, sizeof(mi));
+	virtio_cread_bytes(vi->vdev, offset + sizeof(mi), &ma, sizeof(ma));
+	virtio_cread_bytes(vi->vdev, offset + sizeof(ma), &re, sizeof(re));
+	virtio_cread_bytes(vi->vdev, offset + sizeof(re), &fu, sizeof(fu));
+	virtio_cread_bytes(vi->vdev, offset + sizeof(fu), &fl, sizeof(fl));
+	input_set_abs_params(vi->idev, abs, mi, ma, fu, fl);
+	input_abs_set_res(vi->idev, abs, re);
+}
+
 static void virtinput_cfg_abs(struct virtio_input *vi, int abs)
 {
 	u32 mi, ma, re, fu, fl;
@@ -215,34 +261,10 @@ static void virtinput_fill_evt(struct virtio_input *vi)
 	spin_unlock_irqrestore(&vi->lock, flags);
 }
 
-static int virtinput_probe(struct virtio_device *vdev)
+static void virtinput_get_config(struct virtio_input *vi)
 {
-	struct virtio_input *vi;
-	unsigned long flags;
 	size_t size;
-	int abs, err, nslots;
-
-	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
-		return -ENODEV;
-
-	vi = kzalloc(sizeof(*vi), GFP_KERNEL);
-	if (!vi)
-		return -ENOMEM;
-
-	vdev->priv = vi;
-	vi->vdev = vdev;
-	spin_lock_init(&vi->lock);
-
-	err = virtinput_init_vqs(vi);
-	if (err)
-		goto err_init_vq;
-
-	vi->idev = input_allocate_device();
-	if (!vi->idev) {
-		err = -ENOMEM;
-		goto err_input_alloc;
-	}
-	input_set_drvdata(vi->idev, vi);
+	int abs;
 
 	size = virtinput_cfg_select(vi, VIRTIO_INPUT_CFG_ID_NAME, 0);
 	virtio_cread_bytes(vi->vdev, offsetof(struct virtio_input_config,
@@ -252,11 +274,6 @@ static int virtinput_probe(struct virtio_device *vdev)
 	virtio_cread_bytes(vi->vdev, offsetof(struct virtio_input_config,
 					      u.string),
 			   vi->serial, min(size, sizeof(vi->serial)));
-	snprintf(vi->phys, sizeof(vi->phys),
-		 "virtio%d/input0", vdev->index);
-	vi->idev->name = vi->name;
-	vi->idev->phys = vi->phys;
-	vi->idev->uniq = vi->serial;
 
 	size = virtinput_cfg_select(vi, VIRTIO_INPUT_CFG_ID_DEVIDS, 0);
 	if (size >= sizeof(struct virtio_input_devids)) {
@@ -278,9 +295,6 @@ static int virtinput_probe(struct virtio_device *vdev)
 	if (size)
 		__set_bit(EV_REP, vi->idev->evbit);
 
-	vi->idev->dev.parent = &vdev->dev;
-	vi->idev->event = virtinput_status;
-
 	/* device -> kernel */
 	virtinput_cfg_bits(vi, VIRTIO_INPUT_CFG_EV_BITS, EV_KEY,
 			   vi->idev->keybit, KEY_CNT);
@@ -305,7 +319,146 @@ static int virtinput_probe(struct virtio_device *vdev)
 				continue;
 			virtinput_cfg_abs(vi, abs);
 		}
+	}
+}
+
+static void virtinput_get_flat_config(struct virtio_input *vi)
+{
+	u32 sum_size;
+	u8 size[VIRTIO_INPUT_FLAT_CFG_MAX];
+	u16 offset[VIRTIO_INPUT_FLAT_CFG_MAX];
+	int abs;
+	u8 index;
+	unsigned int head_size = sizeof(sum_size) + sizeof(size) + sizeof(offset);
+	unsigned int cell_offset;
+
+	virtio_cread_bytes(vi->vdev,
+			offsetof(struct virtio_input_flat_config, sum_size),
+			&sum_size, sizeof(size));
+	pr_info("config data size %d bytes.\n", sum_size);
+	virtio_cread_bytes(vi->vdev,
+			offsetof(struct virtio_input_flat_config, size),
+			size, sizeof(size));
+	virtio_cread_bytes(vi->vdev,
+			offsetof(struct virtio_input_flat_config, offset),
+			offset, sizeof(offset));
+
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_ID_NAME];
+	virtio_cread_bytes(vi->vdev, cell_offset, vi->name,
+		min((size_t)size[VIRTIO_INPUT_FLAT_CFG_ID_NAME], sizeof(vi->name)));
+
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_ID_SERIAL];
+	virtio_cread_bytes(vi->vdev, cell_offset, vi->serial,
+		min((size_t)size[VIRTIO_INPUT_FLAT_CFG_ID_SERIAL],
+			sizeof(vi->serial)));
+
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_ID_DEVIDS];
+	virtio_cread_bytes(vi->vdev, cell_offset, &vi->idev->id.bustype,
+			sizeof(vi->idev->id.bustype));
+	cell_offset += sizeof(vi->idev->id.bustype);
+	virtio_cread_bytes(vi->vdev, cell_offset, &vi->idev->id.vendor,
+			sizeof(vi->idev->id.vendor));
+	cell_offset += sizeof(vi->idev->id.vendor);
+	virtio_cread_bytes(vi->vdev, cell_offset, &vi->idev->id.product,
+			sizeof(vi->idev->id.product));
+	cell_offset += sizeof(vi->idev->id.product);
+	virtio_cread_bytes(vi->vdev, cell_offset, &vi->idev->id.version,
+			sizeof(vi->idev->id.version));
+
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_PROP_BITS];
+	virtinput_plat_cfg_bits(vi, size[VIRTIO_INPUT_FLAT_CFG_PROP_BITS],
+			cell_offset, 0,
+			vi->idev->propbit, INPUT_PROP_CNT, false);
+
+	if (size[VIRTIO_INPUT_FLAT_CFG_EV_REP])
+		__set_bit(EV_REP, vi->idev->evbit);
+
+	/* device -> kernel */
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_EV_KEY];
+	virtinput_plat_cfg_bits(vi, size[VIRTIO_INPUT_FLAT_CFG_EV_KEY],
+			cell_offset, EV_KEY,
+			vi->idev->keybit, KEY_CNT, true);
+
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_EV_REL];
+	virtinput_plat_cfg_bits(vi, size[VIRTIO_INPUT_FLAT_CFG_EV_REL],
+			cell_offset, EV_REL,
+			vi->idev->relbit, REL_CNT, true);
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_EV_ABS];
+	virtinput_plat_cfg_bits(vi, size[VIRTIO_INPUT_FLAT_CFG_EV_ABS],
+			cell_offset, EV_ABS,
+			vi->idev->absbit, ABS_CNT, true);
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_EV_MSC];
+	virtinput_plat_cfg_bits(vi, size[VIRTIO_INPUT_FLAT_CFG_EV_MSC],
+			cell_offset, EV_MSC,
+			vi->idev->mscbit, MSC_CNT, true);
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_EV_SW];
+	virtinput_plat_cfg_bits(vi, size[VIRTIO_INPUT_FLAT_CFG_EV_SW],
+			cell_offset, EV_SW,
+			vi->idev->swbit, SW_CNT, true);
+
+	/* kernel -> device */
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_EV_LED];
+	virtinput_plat_cfg_bits(vi, size[VIRTIO_INPUT_FLAT_CFG_EV_LED],
+			cell_offset, EV_LED,
+			vi->idev->ledbit, LED_CNT, true);
+	cell_offset = head_size + offset[VIRTIO_INPUT_FLAT_CFG_EV_SND];
+	virtinput_plat_cfg_bits(vi, size[VIRTIO_INPUT_FLAT_CFG_EV_SND],
+			cell_offset, EV_SND,
+			vi->idev->sndbit, SND_CNT, true);
+
+	if (test_bit(EV_ABS, vi->idev->evbit)) {
+		index = VIRTIO_INPUT_FLAT_CFG_ABS;
+		for (abs = 0; abs < ABS_CNT; abs++) {
+			if (!test_bit(abs, vi->idev->absbit))
+				continue;
+			index += 1;
+			cell_offset = head_size + offset[index];
+			virtinput_flat_cfg_abs(vi, cell_offset, abs);
+		}
+	}
+}
 
+static int virtinput_probe(struct virtio_device *vdev)
+{
+	struct virtio_input *vi;
+	unsigned long flags;
+	int err, nslots;
+
+	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
+		return -ENODEV;
+
+	vi = kzalloc(sizeof(*vi), GFP_KERNEL);
+	if (!vi)
+		return -ENOMEM;
+
+	vdev->priv = vi;
+	vi->vdev = vdev;
+	spin_lock_init(&vi->lock);
+
+	err = virtinput_init_vqs(vi);
+	if (err)
+		goto err_init_vq;
+
+	vi->idev = input_allocate_device();
+	if (!vi->idev) {
+		err = -ENOMEM;
+		goto err_input_alloc;
+	}
+	input_set_drvdata(vi->idev, vi);
+
+	if (virtio_has_feature(vdev, VIRTIO_INPUT_F_FLAT_CFG)) {
+		virtinput_get_flat_config(vi);
+	} else {
+		virtinput_get_config(vi);
+	}
+	snprintf(vi->phys, sizeof(vi->phys), "virtio%d/input0", vdev->index);
+	vi->idev->phys = vi->phys;
+	vi->idev->name = vi->name;
+	vi->idev->uniq = vi->serial;
+	vi->idev->dev.parent = &vdev->dev;
+	vi->idev->event = virtinput_status;
+
+	if (test_bit(EV_ABS, vi->idev->evbit)) {
 		if (test_bit(ABS_MT_SLOT, vi->idev->absbit)) {
 			nslots = input_abs_get_max(vi->idev, ABS_MT_SLOT) + 1;
 			err = input_mt_init_slots(vi->idev, nslots, 0);
@@ -385,7 +538,7 @@ static int virtinput_restore(struct virtio_device *vdev)
 #endif
 
 static unsigned int features[] = {
-	/* none */
+	VIRTIO_INPUT_F_FLAT_CFG,
 };
 static const struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_INPUT, VIRTIO_DEV_ANY_ID },
diff --git a/include/uapi/linux/virtio_input.h b/include/uapi/linux/virtio_input.h
index 52084b1fb965..ed0ee740ebc4 100644
--- a/include/uapi/linux/virtio_input.h
+++ b/include/uapi/linux/virtio_input.h
@@ -28,6 +28,11 @@
  * SUCH DAMAGE. */
 
 #include <linux/types.h>
+#include "input-event-codes.h"
+
+#define VIRTIO_INPUT_CFG_UNIT_SIZE 128
+/* Feature bits */
+#define VIRTIO_INPUT_F_FLAT_CFG	0	/* Indicates flat config space */
 
 enum virtio_input_config_select {
 	VIRTIO_INPUT_CFG_UNSET      = 0x00,
@@ -39,6 +44,25 @@ enum virtio_input_config_select {
 	VIRTIO_INPUT_CFG_ABS_INFO   = 0x12,
 };
 
+#define VIRTIO_INPUT_CFG_UNIT_SIZE 128
+
+enum virtio_input_plat_config_select {
+	VIRTIO_INPUT_FLAT_CFG_ID_NAME     = 0,
+	VIRTIO_INPUT_FLAT_CFG_ID_SERIAL   = 1,
+	VIRTIO_INPUT_FLAT_CFG_ID_DEVIDS   = 2,
+	VIRTIO_INPUT_FLAT_CFG_PROP_BITS   = 3,
+	VIRTIO_INPUT_FLAT_CFG_EV          = 4,
+	VIRTIO_INPUT_FLAT_CFG_EV_KEY      = 5,
+	VIRTIO_INPUT_FLAT_CFG_EV_REL      = 6,
+	VIRTIO_INPUT_FLAT_CFG_EV_ABS      = 7,
+	VIRTIO_INPUT_FLAT_CFG_EV_MSC      = 8,
+	VIRTIO_INPUT_FLAT_CFG_EV_SW       = 9,
+	VIRTIO_INPUT_FLAT_CFG_EV_LED      = 10,
+	VIRTIO_INPUT_FLAT_CFG_EV_SND      = 11,
+	VIRTIO_INPUT_FLAT_CFG_EV_REP      = 12,
+	VIRTIO_INPUT_FLAT_CFG_ABS         = VIRTIO_INPUT_FLAT_CFG_EV + EV_CNT,
+	VIRTIO_INPUT_FLAT_CFG_MAX         = VIRTIO_INPUT_FLAT_CFG_ABS + ABS_CNT,
+};
 struct virtio_input_absinfo {
 	__le32 min;
 	__le32 max;
@@ -67,10 +91,40 @@ struct virtio_input_config {
 	} u;
 };
 
+struct virtio_input_flat_config {
+	__le32 sum_size;
+	__u8 size[VIRTIO_INPUT_FLAT_CFG_MAX];
+	__le16 offset[VIRTIO_INPUT_FLAT_CFG_MAX];
+	char payload[VIRTIO_INPUT_CFG_UNIT_SIZE * VIRTIO_INPUT_FLAT_CFG_MAX];
+};
 struct virtio_input_event {
 	__le16 type;
 	__le16 code;
 	__le32 value;
 };
 
+enum virtio_input_plat_config_select {
+	VIRTIO_INPUT_FLAT_CFG_ID_NAME     = 0,
+	VIRTIO_INPUT_FLAT_CFG_ID_SERIAL   = 1,
+	VIRTIO_INPUT_FLAT_CFG_ID_DEVIDS   = 2,
+	VIRTIO_INPUT_FLAT_CFG_PROP_BITS   = 3,
+	VIRTIO_INPUT_FLAT_CFG_EV          = 4,
+	VIRTIO_INPUT_FLAT_CFG_EV_KEY      = 5,
+	VIRTIO_INPUT_FLAT_CFG_EV_REL      = 6,
+	VIRTIO_INPUT_FLAT_CFG_EV_ABS      = 7,
+	VIRTIO_INPUT_FLAT_CFG_EV_MSC      = 8,
+	VIRTIO_INPUT_FLAT_CFG_EV_SW       = 9,
+	VIRTIO_INPUT_FLAT_CFG_EV_LED      = 10,
+	VIRTIO_INPUT_FLAT_CFG_EV_SND      = 11,
+	VIRTIO_INPUT_FLAT_CFG_EV_REP      = 12,
+	VIRTIO_INPUT_FLAT_CFG_ABS         = VIRTIO_INPUT_FLAT_CFG_EV + EV_CNT,
+	VIRTIO_INPUT_FLAT_CFG_MAX         = VIRTIO_INPUT_FLAT_CFG_ABS + ABS_CNT,
+};
+
+struct virtio_input_flat_config {
+	__le32 sum_size;
+	__u8 size[VIRTIO_INPUT_FLAT_CFG_MAX];
+	__le16 offset[VIRTIO_INPUT_FLAT_CFG_MAX];
+	char payload[VIRTIO_INPUT_CFG_UNIT_SIZE * VIRTIO_INPUT_FLAT_CFG_MAX];
+};
 #endif /* _LINUX_VIRTIO_INPUT_H */
-- 
2.17.1

