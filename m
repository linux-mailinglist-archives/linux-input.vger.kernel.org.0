Return-Path: <linux-input+bounces-5917-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E19D96213C
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDFFD1F26D63
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095AA15B57C;
	Wed, 28 Aug 2024 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ot+5zf5w"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B415AD83;
	Wed, 28 Aug 2024 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830479; cv=none; b=Ehuuxv4xIlK1v17tQexzsRBDHUfj21ZArTGhxs6PNfmOYHkcZg3J+8fFk2J3z63zu2KkQxXLZuXdFt0jbl9oH6aCRGdmYyfbXgPrTMQLIaezLFPyf0p7dc4op/Sge+mYXtSWqbdPLfW1FelvJoUYXhfhC6bYJjp58B4cYntRCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830479; c=relaxed/simple;
	bh=e/CzaqOCn6vLq4J5Gt6W7N3vGp/tnZEhdpG89PXCqno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DA5Wqs2ngmDwiOwX6NxazaXEq9hl2rmeNE+R+T0Wsz2Y4E4+6oVZ2FTWdj5DkNjg8fMGPDq/xR3U3WVNWWLc/Qa6/ExneoQp60aHYPJCa2oivk7VjdpDswvSAO/LbtZrMcyffD4fEKeLVU0pl00gkosw/d4jePIH3QBOWyZthaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ot+5zf5w; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830475;
	bh=e/CzaqOCn6vLq4J5Gt6W7N3vGp/tnZEhdpG89PXCqno=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ot+5zf5wno9VbgtzI61WdKnH3QhN0FGbnYee85ysZFfg7UK5NPDRFxvx+t7x6ud4O
	 kswhdUWcXtdnPR73AAen9GvBBTYD1QhZguK/Wd2srVaY1iPyjR3EvhkdySz1SX9MVW
	 pzq7f5DQEtEJ0ghPXNwY/fvp0Iv2XOnglT+patDc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:33 +0200
Subject: [PATCH 14/14] HID: uclogic: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-14-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=11652;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=e/CzaqOCn6vLq4J5Gt6W7N3vGp/tnZEhdpG89PXCqno=;
 b=WVg2ycGqqKbO/ITpfOlBiW4EMAPi+rb9narnIPAfou9LhrFtZZgCLdQUrH/bx2J4iYXH9fOl8
 A24bVLNPZDkBayb2DPT+yyoHb7F8JpiHBf5Z1LhLoQjKQfKukG/2WlA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-uclogic-core.c   |  2 +-
 drivers/hid/hid-uclogic-params.c |  4 ++--
 drivers/hid/hid-uclogic-params.h | 10 +++++-----
 drivers/hid/hid-uclogic-rdesc.c  | 20 ++++++++++----------
 drivers/hid/hid-uclogic-rdesc.h  | 20 ++++++++++----------
 5 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index f6a1572b3728..d8008933c052 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -56,8 +56,8 @@ static const __u8 *uclogic_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	struct uclogic_drvdata *drvdata = hid_get_drvdata(hdev);
 
 	if (drvdata->desc_ptr != NULL) {
-		rdesc = drvdata->desc_ptr;
 		*rsize = drvdata->desc_size;
+		return drvdata->desc_ptr;
 	}
 	return rdesc;
 }
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index 5bab006ec165..87fd4eb76c70 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -681,7 +681,7 @@ void uclogic_params_cleanup(struct uclogic_params *params)
  *	-ENOMEM, if failed to allocate memory.
  */
 int uclogic_params_get_desc(const struct uclogic_params *params,
-				__u8 **pdesc,
+				const __u8 **pdesc,
 				unsigned int *psize)
 {
 	int rc = -ENOMEM;
@@ -769,7 +769,7 @@ static void uclogic_params_init_invalid(struct uclogic_params *params)
 static int uclogic_params_init_with_opt_desc(struct uclogic_params *params,
 					     struct hid_device *hdev,
 					     unsigned int orig_desc_size,
-					     __u8 *desc_ptr,
+					     const __u8 *desc_ptr,
 					     unsigned int desc_size)
 {
 	__u8 *desc_copy_ptr = NULL;
diff --git a/drivers/hid/hid-uclogic-params.h b/drivers/hid/hid-uclogic-params.h
index d6ffadb2f601..35ff062d09b5 100644
--- a/drivers/hid/hid-uclogic-params.h
+++ b/drivers/hid/hid-uclogic-params.h
@@ -79,7 +79,7 @@ struct uclogic_params_pen {
 	 * Pointer to report descriptor part describing the pen inputs.
 	 * Allocated with kmalloc. NULL if the part is not specified.
 	 */
-	__u8 *desc_ptr;
+	const __u8 *desc_ptr;
 	/*
 	 * Size of the report descriptor.
 	 * Only valid, if "desc_ptr" is not NULL.
@@ -118,7 +118,7 @@ struct uclogic_params_frame {
 	 * Pointer to report descriptor part describing the frame inputs.
 	 * Allocated with kmalloc. NULL if the part is not specified.
 	 */
-	__u8 *desc_ptr;
+	const __u8 *desc_ptr;
 	/*
 	 * Size of the report descriptor.
 	 * Only valid, if "desc_ptr" is not NULL.
@@ -212,7 +212,7 @@ struct uclogic_params {
 	 * allocated with kmalloc. NULL if no common part is needed.
 	 * Only valid, if "invalid" is false.
 	 */
-	__u8 *desc_ptr;
+	const __u8 *desc_ptr;
 	/*
 	 * Size of the common part of the replacement report descriptor.
 	 * Only valid, if "desc_ptr" is valid and not NULL.
@@ -239,7 +239,7 @@ struct uclogic_drvdata {
 	/* Interface parameters */
 	struct uclogic_params params;
 	/* Pointer to the replacement report descriptor. NULL if none. */
-	__u8 *desc_ptr;
+	const __u8 *desc_ptr;
 	/*
 	 * Size of the replacement report descriptor.
 	 * Only valid if desc_ptr is not NULL
@@ -261,7 +261,7 @@ extern int uclogic_params_init(struct uclogic_params *params,
 
 /* Get a replacement report descriptor for a tablet's interface. */
 extern int uclogic_params_get_desc(const struct uclogic_params *params,
-					__u8 **pdesc,
+					const __u8 **pdesc,
 					unsigned int *psize);
 
 /* Free resources used by tablet interface's parameters */
diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index acfa591ab52f..964d17e08f26 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -20,7 +20,7 @@
 #include <kunit/visibility.h>
 
 /* Fixed WP4030U report descriptor */
-__u8 uclogic_rdesc_wp4030u_fixed_arr[] = {
+const __u8 uclogic_rdesc_wp4030u_fixed_arr[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x01,         /*  Usage (Digitizer),                  */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -65,7 +65,7 @@ const size_t uclogic_rdesc_wp4030u_fixed_size =
 			sizeof(uclogic_rdesc_wp4030u_fixed_arr);
 
 /* Fixed WP5540U report descriptor */
-__u8 uclogic_rdesc_wp5540u_fixed_arr[] = {
+const __u8 uclogic_rdesc_wp5540u_fixed_arr[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x01,         /*  Usage (Digitizer),                  */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -142,7 +142,7 @@ const size_t uclogic_rdesc_wp5540u_fixed_size =
 			sizeof(uclogic_rdesc_wp5540u_fixed_arr);
 
 /* Fixed WP8060U report descriptor */
-__u8 uclogic_rdesc_wp8060u_fixed_arr[] = {
+const __u8 uclogic_rdesc_wp8060u_fixed_arr[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x01,         /*  Usage (Digitizer),                  */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -219,7 +219,7 @@ const size_t uclogic_rdesc_wp8060u_fixed_size =
 			sizeof(uclogic_rdesc_wp8060u_fixed_arr);
 
 /* Fixed WP1062 report descriptor */
-__u8 uclogic_rdesc_wp1062_fixed_arr[] = {
+const __u8 uclogic_rdesc_wp1062_fixed_arr[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x01,         /*  Usage (Digitizer),                  */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -267,7 +267,7 @@ const size_t uclogic_rdesc_wp1062_fixed_size =
 			sizeof(uclogic_rdesc_wp1062_fixed_arr);
 
 /* Fixed PF1209 report descriptor */
-__u8 uclogic_rdesc_pf1209_fixed_arr[] = {
+const __u8 uclogic_rdesc_pf1209_fixed_arr[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x01,         /*  Usage (Digitizer),                  */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -344,7 +344,7 @@ const size_t uclogic_rdesc_pf1209_fixed_size =
 			sizeof(uclogic_rdesc_pf1209_fixed_arr);
 
 /* Fixed PID 0522 tablet report descriptor, interface 0 (stylus) */
-__u8 uclogic_rdesc_twhl850_fixed0_arr[] = {
+const __u8 uclogic_rdesc_twhl850_fixed0_arr[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x01,         /*  Usage (Digitizer),                  */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -390,7 +390,7 @@ const size_t uclogic_rdesc_twhl850_fixed0_size =
 			sizeof(uclogic_rdesc_twhl850_fixed0_arr);
 
 /* Fixed PID 0522 tablet report descriptor, interface 1 (mouse) */
-__u8 uclogic_rdesc_twhl850_fixed1_arr[] = {
+const __u8 uclogic_rdesc_twhl850_fixed1_arr[] = {
 	0x05, 0x01,         /*  Usage Page (Desktop),               */
 	0x09, 0x02,         /*  Usage (Mouse),                      */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -430,7 +430,7 @@ const size_t uclogic_rdesc_twhl850_fixed1_size =
 			sizeof(uclogic_rdesc_twhl850_fixed1_arr);
 
 /* Fixed PID 0522 tablet report descriptor, interface 2 (frame buttons) */
-__u8 uclogic_rdesc_twhl850_fixed2_arr[] = {
+const __u8 uclogic_rdesc_twhl850_fixed2_arr[] = {
 	0x05, 0x01,         /*  Usage Page (Desktop),               */
 	0x09, 0x06,         /*  Usage (Keyboard),                   */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -456,7 +456,7 @@ const size_t uclogic_rdesc_twhl850_fixed2_size =
 			sizeof(uclogic_rdesc_twhl850_fixed2_arr);
 
 /* Fixed TWHA60 report descriptor, interface 0 (stylus) */
-__u8 uclogic_rdesc_twha60_fixed0_arr[] = {
+const __u8 uclogic_rdesc_twha60_fixed0_arr[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x01,         /*  Usage (Digitizer),                  */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -505,7 +505,7 @@ const size_t uclogic_rdesc_twha60_fixed0_size =
 			sizeof(uclogic_rdesc_twha60_fixed0_arr);
 
 /* Fixed TWHA60 report descriptor, interface 1 (frame buttons) */
-__u8 uclogic_rdesc_twha60_fixed1_arr[] = {
+const __u8 uclogic_rdesc_twha60_fixed1_arr[] = {
 	0x05, 0x01, /*  Usage Page (Desktop),       */
 	0x09, 0x06, /*  Usage (Keyboard),           */
 	0xA1, 0x01, /*  Collection (Application),   */
diff --git a/drivers/hid/hid-uclogic-rdesc.h b/drivers/hid/hid-uclogic-rdesc.h
index 906d068f50a9..3878a0e8c464 100644
--- a/drivers/hid/hid-uclogic-rdesc.h
+++ b/drivers/hid/hid-uclogic-rdesc.h
@@ -23,15 +23,15 @@
 #define UCLOGIC_RDESC_WPXXXXU_ORIG_SIZE		212
 
 /* Fixed WP4030U report descriptor */
-extern __u8 uclogic_rdesc_wp4030u_fixed_arr[];
+extern const __u8 uclogic_rdesc_wp4030u_fixed_arr[];
 extern const size_t uclogic_rdesc_wp4030u_fixed_size;
 
 /* Fixed WP5540U report descriptor */
-extern __u8 uclogic_rdesc_wp5540u_fixed_arr[];
+extern const __u8 uclogic_rdesc_wp5540u_fixed_arr[];
 extern const size_t uclogic_rdesc_wp5540u_fixed_size;
 
 /* Fixed WP8060U report descriptor */
-extern __u8 uclogic_rdesc_wp8060u_fixed_arr[];
+extern const __u8 uclogic_rdesc_wp8060u_fixed_arr[];
 extern const size_t uclogic_rdesc_wp8060u_fixed_size;
 
 /* Size of the original descriptor of the new WP5540U tablet */
@@ -41,14 +41,14 @@ extern const size_t uclogic_rdesc_wp8060u_fixed_size;
 #define UCLOGIC_RDESC_WP1062_ORIG_SIZE		254
 
 /* Fixed WP1062 report descriptor */
-extern __u8 uclogic_rdesc_wp1062_fixed_arr[];
+extern const __u8 uclogic_rdesc_wp1062_fixed_arr[];
 extern const size_t uclogic_rdesc_wp1062_fixed_size;
 
 /* Size of the original descriptor of PF1209 tablet */
 #define UCLOGIC_RDESC_PF1209_ORIG_SIZE		234
 
 /* Fixed PF1209 report descriptor */
-extern __u8 uclogic_rdesc_pf1209_fixed_arr[];
+extern const __u8 uclogic_rdesc_pf1209_fixed_arr[];
 extern const size_t uclogic_rdesc_pf1209_fixed_size;
 
 /* Size of the original descriptors of TWHL850 tablet */
@@ -57,15 +57,15 @@ extern const size_t uclogic_rdesc_pf1209_fixed_size;
 #define UCLOGIC_RDESC_TWHL850_ORIG2_SIZE	92
 
 /* Fixed PID 0522 tablet report descriptor, interface 0 (stylus) */
-extern __u8 uclogic_rdesc_twhl850_fixed0_arr[];
+extern const __u8 uclogic_rdesc_twhl850_fixed0_arr[];
 extern const size_t uclogic_rdesc_twhl850_fixed0_size;
 
 /* Fixed PID 0522 tablet report descriptor, interface 1 (mouse) */
-extern __u8 uclogic_rdesc_twhl850_fixed1_arr[];
+extern const __u8 uclogic_rdesc_twhl850_fixed1_arr[];
 extern const size_t uclogic_rdesc_twhl850_fixed1_size;
 
 /* Fixed PID 0522 tablet report descriptor, interface 2 (frame buttons) */
-extern __u8 uclogic_rdesc_twhl850_fixed2_arr[];
+extern const __u8 uclogic_rdesc_twhl850_fixed2_arr[];
 extern const size_t uclogic_rdesc_twhl850_fixed2_size;
 
 /* Size of the original descriptors of TWHA60 tablet */
@@ -73,11 +73,11 @@ extern const size_t uclogic_rdesc_twhl850_fixed2_size;
 #define UCLOGIC_RDESC_TWHA60_ORIG1_SIZE		139
 
 /* Fixed TWHA60 report descriptor, interface 0 (stylus) */
-extern __u8 uclogic_rdesc_twha60_fixed0_arr[];
+extern const __u8 uclogic_rdesc_twha60_fixed0_arr[];
 extern const size_t uclogic_rdesc_twha60_fixed0_size;
 
 /* Fixed TWHA60 report descriptor, interface 1 (frame buttons) */
-extern __u8 uclogic_rdesc_twha60_fixed1_arr[];
+extern const __u8 uclogic_rdesc_twha60_fixed1_arr[];
 extern const size_t uclogic_rdesc_twha60_fixed1_size;
 
 /* Report descriptor template placeholder head */

-- 
2.46.0


