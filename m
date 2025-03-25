Return-Path: <linux-input+bounces-11257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E30A708AD
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1731189124C
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0B0264FAB;
	Tue, 25 Mar 2025 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVcIQKP5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F7264F9D;
	Tue, 25 Mar 2025 18:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742925720; cv=none; b=ce70pTr6RrFJ/1KelXXL0khxDEdp0gGfULCWkGr15bCBs7B4i6ZERA44Z4pZ/VFY31fkdKz5lnhySEvEyMCQWnli3pjSTZt+INl42zTLfXHAc9ZwvBqWohzge6Ot0iFV33TudxTkIlawXPeYTHhOgKBf9QQT8T0d71wfGtTqiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742925720; c=relaxed/simple;
	bh=DmY887p1WKX5lnaqaaiXL/2vbBdMl1/fAZQXd7c3lm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFCpwNFV2UFDxJ0bxjxvoD5Etaa8IXqDkR0qpBOdhER7GQLX/oOeSknEzSzhKsRFIs+HhwLzDR/CtpEUxpQYtYHk/VbM8fPFFjkGTRJdSLAQZ87amVchB9H20FCAc/dpgkolECNeO7Vdeh6v3sLopTHq0YWLEqRl0/txB+NRMY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVcIQKP5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30185d00446so121923a91.0;
        Tue, 25 Mar 2025 11:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742925718; x=1743530518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuvfQtrxFOajCLHRPepiqXZW8QwhvcCKnYPv4jVs/lA=;
        b=MVcIQKP5cmYkAwnQhZBJIbBobFmVh96r8q+83lhUVaQvIzpGnvRjjEBwqnjo1p4dcw
         F0VJwjQOqOt2WOLzIKOE4OIeZjmSGLJEpf17rTiAms1t/0PereDIWojvNOlWnZZsN3fc
         etfcAEZvtzWy3lKQcPZeVBNIou1g2Ri2eypuyLB8ahZtqDhdVIR7/Qwr/esHreoqOWKH
         pogssuZmsEhryWSx+TVkWzXxIjhCUDfnUplOBJnRyQw9j2iYFSNkWOKFIA8YKjaI2bdN
         eJJe4W8nA39HkIn7o64Yd9YWk6px9fEOqBU0zuBpKYgMYuOBBcPfWPOVZ4VbXU0bfsxh
         LyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925718; x=1743530518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuvfQtrxFOajCLHRPepiqXZW8QwhvcCKnYPv4jVs/lA=;
        b=Z7HLM5Ny/CPHbTP6xefMX9yL+VmsMiKqWdvhb7gB7IdFoZBvL0CcgdHJcBC7fgsf2Y
         c/+GeEx/bSkcvx54/8X8ZjTa0ioCjGEHFMAn50StDKUhXV97vxy9VHX1EAyb3AfHW8Tg
         b7URORPhSBz6mMj1GzhOFEf/PDC5RTlQr9mB2w7Du+2NDxurfCC4pSJkMGrI5bB+AdIs
         7uFW70XMoS3hLuSj0aXq5ej4jV0ISFr2ZxVxR7ak2F9z5DCpyi+IS2ufhuWDIFDjTJRf
         HBQ6PGgz9HTQwMA5uj6dzE62QhlyRrd9jalvTx9WxVcjm2O2evUd4us0zTUQLKUStvup
         focg==
X-Forwarded-Encrypted: i=1; AJvYcCW0aWBpSQaQEjccEZdg9gGUjSwYpTRMiIhaNEueHSRqlnXu4paGmdRNE5dCiv2eZ6wqWBSrTmJHm1h6/AnG@vger.kernel.org, AJvYcCXzt6+pPm8cJ5xB2G17B82S3wZHUhE/KiXz+Bbt4sJrRa5PD19oKXJYJY2RON6KP67qXDN9tsnE88f3Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+HROSDjlYBWWc3V8FvX4b7AEAsqsxpgR5OrKXe3KS5Apyxxd
	LZJG5Hzm7pdGwgG5kuRnKbtM2JQh1+bSgjIPc6Rw73fCEkV14yjS
X-Gm-Gg: ASbGncuts4IKZCJTZoXyJUtId2diUoLETSkCmoirWp+UaPRUuPQjJQ6DiaXnsKDSt8c
	p1KCfAwaNQv9a9dSnsTtkHDnmHFYlOJb6HgAStOlVXGOUkJssmfCnzWSTngYWBuUNr2S5DK+9cU
	WdKDckeHRyQp0mPFH0z+e098I75QJDk153sri75SdZxTnhSv1giJoSASs5NvFduHhUKEB3QIOnf
	7b5lrOULzD+oothzPQ+ynUKd9Ee0VaSuEEcIUjv9rudOnw2pm8hpZNNBNIFis9fOxPffeJaJlcg
	SUkh1ZlyBNRvLDJ51gRqxQVq/ZBZVDaiHYOsVqE/qI2qqL6HoL9XIuMJuwhDPUSxdZy4HzMieDk
	VBS1d/uf4X4xZqtbgHYyeRzlUKnxV6xBGDRrcU9xo4phtCQ==
X-Google-Smtp-Source: AGHT+IFf5nXjfnmXn2SqYHp/xUZQbvpBP7+ddDwzgARvotWn5NWT4T8OttfSGpJskRqAv5RVvH3cwQ==
X-Received: by 2002:a17:90b:3805:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-3037895727amr1079358a91.14.1742925718148;
        Tue, 25 Mar 2025 11:01:58 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d8287sm10683796a91.15.2025.03.25.11.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:01:57 -0700 (PDT)
From: adityagarg1208@gmail.com
X-Google-Original-From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: gargaditya08@live.com,
	kekrby@gmail.com,
	orlandoch.dev@gmail.com,
	admin@kodeit.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] HID: multitouch: take cls->maxcontacts into account for Apple Touch Bar even without a HID_DG_CONTACTMAX field
Date: Tue, 25 Mar 2025 17:57:26 +0000
Message-ID: <20250325180138.15113-4-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325180138.15113-1-gargaditya08@live.com>
References: <20250325180138.15113-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the HID_DG_CONTACTMAX is not present, but the maximum
contact count is still greater than the default. Add quirks for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 70fdd8cf9..f7fe6aab8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1335,6 +1335,13 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	struct input_dev *input = hi->input;
 	int ret;
 
+	/*
+	 * HID_DG_CONTACTMAX field is not present on Apple Touch Bars,
+	 * but the maximum contact count is greater than the default.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR && cls->maxcontacts)
+		td->maxcontacts = cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts = MT_DEFAULT_MAXCONTACT;
 
-- 
2.49.0


