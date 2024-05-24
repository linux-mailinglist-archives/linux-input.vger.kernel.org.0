Return-Path: <linux-input+bounces-3817-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DF8CE4D6
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 13:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B3628153B
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 11:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4986A86629;
	Fri, 24 May 2024 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QA5ndkVR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB72886256;
	Fri, 24 May 2024 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716549974; cv=none; b=fLjTHACCuD9Dx7fvOpvXzdVGUxJaB35iTHuwMhu2cCZ09mj7e//X5CthWIzdq2WcuSeJXd/dAbHSBYTWPOMFZiMx5pbTkt+4MGjHTmau9EVthRBhIEuh3wtnuopC0tYvqiazi+bZErF114sU5M8Cl/lp67nF2KyNekS7xP/qhQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716549974; c=relaxed/simple;
	bh=rVcJOAuVTTsN0S1Mw/DD2ndJe2PvZtARmsDMYZCX+1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SM8+1q/0f/Rz4j8Z4FUNH3dbxMiY6bz2/khKjIHRzXr4TQSGCvAHoTSk/YHNaoJvBkE6W/o6AEQIPDD00pFv/686reLNT9nDgBocRKrGlqUudphgq3qRD4pTex7Laqka8fw4/5zfV8yA+xqaAcYB33YED7ynPmJJr9Aas49PtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QA5ndkVR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35507fc2600so703615f8f.0;
        Fri, 24 May 2024 04:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716549971; x=1717154771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F71HeAiS0n7OunXO1S9h5SbnNhlmYJtMncX8oz/1y3M=;
        b=QA5ndkVRqEbVtArzk56OxyF5dpXyqA+pxXu4fCG+PR3hRCU6NFao9kKdZOUFFpdzNJ
         5bsT1bfODto/OfLwhIrPb0ZFBD4Kkucz2xI09RdAXtj84UhWh8MpyK5wyxRRfBKiU8PZ
         ThemqtFuROWcPuvdtDGoQvbM2Mf1Li5WcnSi8O9/I/O+t0tWFT+5YafEy0OI+siKe85H
         tgrcgA+p4zVwkIWSRKwBBiUsHq7k+YGylbjHj/x7rg2x7Rj3cX5DKAlJs8pkJp5ZDlBi
         mpwa22xKy1O+iQbjuyIGKnpMDYZcxUxG7k5w7ZlhJ8rHg3kCsaC14oXPTJLLaaExMW4S
         iD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716549971; x=1717154771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F71HeAiS0n7OunXO1S9h5SbnNhlmYJtMncX8oz/1y3M=;
        b=pV2tDrQ+bSooXTyOhKFHtAZkrbU6Kp50Lz0FX891DWcjxluGP31EC2r/WWvnlFhsgW
         pfYlM16AeFedVSpLen39nTlnim3e3qC+LMJm71EcyMooYB3k7q7F5dmkITxkxOgwgbDl
         wSH5TLTtC8Ybt/aprtcv0leUSJUn+oYhi9nqKxY4gVfQbDQmRKHyELcFC6c1qeSXMhgu
         y5rIeKnMXteQfZf9oNSSec2DVHXzxJQWFJ0dLSnFjAbRLr1BPO1G3HuCUnQM4bg2NfBd
         R62wsRR8vFYbib+fY7ZQSiTyT/r4p/MXJTrVn1XayYRrftjYg2FyZHGhPKFNKViuEyBE
         KqQA==
X-Forwarded-Encrypted: i=1; AJvYcCU4thZLV6StoY4OBiA+8X5zM1L7S6QAonLXq8+jq335KCtMri4u+a+n0JtfEBKM5bbgTCsTCUsvvcAMV6YO+A7WqpRJmveE/F7gsqVET21ogPWjt3bgkn8wd9V61qA0QJcI0ES17+l0il4=
X-Gm-Message-State: AOJu0YwouLm7/0xVVg8IMcpgUDDnTJwoHFoCcIlOKCRQXXg0D33GviDS
	3t6vjr3/Eh2oFV2UOOAa1YJg09iN77iM3A1VlPH5TKUgot9uh6v3
X-Google-Smtp-Source: AGHT+IGqZcitUO5Gi+PO0ih2/A+4NCsX0ZbPD1Aif6JNz34kIb38WvQZqJoFXXgKoCMmwzyL0/2cDA==
X-Received: by 2002:a5d:58c4:0:b0:355:2ae:d88d with SMTP id ffacd0b85a97d-3552883172amr1238150f8f.34.1716549971164;
        Fri, 24 May 2024 04:26:11 -0700 (PDT)
Received: from fedora.. ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c936esm1369907f8f.83.2024.05.24.04.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 04:26:09 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] HID: uclogic: Use Rx and Ry for touch strips
Date: Fri, 24 May 2024 13:21:36 +0200
Message-ID: <20240524112554.166746-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524112554.166746-1-jose.exposito89@gmail.com>
References: <20240524112554.166746-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, HUION devices use ABS_WHEEL as the usage for touch strips.

There are 2 main issues with this approach:

The first one is that the descriptor for touch rings
(uclogic_rdesc_v2_frame_touch_ring_arr) also uses ABS_WHEEL.
From user-space it is impossible to know which device sends the events.

The second one is that Wacom uses ABS_RX/ABS_RY to notify events from
touch strips and user-space was designed to handle those axes.

Change the usage of touch strips to Rx/Ry to fix both issues.

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/989
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-uclogic-rdesc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
index 7cbd673747a5..dfd74a043b39 100644
--- a/drivers/hid/hid-uclogic-rdesc.c
+++ b/drivers/hid/hid-uclogic-rdesc.c
@@ -789,7 +789,8 @@ const __u8 uclogic_rdesc_v2_frame_touch_strip_arr[] = {
 	0x95, 0x01,         /*          Report Count (1),           */
 	0x81, 0x02,         /*          Input (Variable),           */
 	0x05, 0x01,         /*          Usage Page (Desktop),       */
-	0x09, 0x38,         /*          Usage (Wheel),              */
+	0x09, 0x33,         /*          Usage (Rx),                 */
+	0x09, 0x34,         /*          Usage (Ry),                 */
 	0x95, 0x01,         /*          Report Count (1),           */
 	0x15, 0x00,         /*          Logical Minimum (0),        */
 	0x25, 0x07,         /*          Logical Maximum (7),        */
-- 
2.45.1


