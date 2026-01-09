Return-Path: <linux-input+bounces-16891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1E3D08C31
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 11:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E84EC3019B4B
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8F733B6D1;
	Fri,  9 Jan 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fBEd2Nh1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56033AD9F
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956343; cv=none; b=aQozpvbxeDZrRxm+L6zMRrk15dl2Y3DXj6zclij0UF1Ev1rFF/LsdDhXseSMIY7l6aHi/N1FQoXJwzh5BlzT/4J6RH0yQvCJ1pM3JWaQOSAFl7LGmRvx3dtqvs6lzdR0AD+W6yvZ1XpEBlwHizmp2Z7C6GB2aIINCPpOtgbnTpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956343; c=relaxed/simple;
	bh=FsB/UShQenj2IHUWQWTEz5tm6M0LQG9gXNTm4Gzpoe0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kXEl6RS+5Wheq8bsi3sDcJtqSwBEpUxJR1seFgST/7AEhpjNtMAoC4kVISTK1g8kVlalyyXj7dHGYWAdt29p9ra5fIWUV5EczSFxJkZ3G/yLLRB8eqMmX69ZOfv3PoS95sU3+c7mf1joSkoTJYR9Ky8AVYJI6OMGQFPa1Dk0Paw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fBEd2Nh1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477563e531cso30280865e9.1
        for <linux-input@vger.kernel.org>; Fri, 09 Jan 2026 02:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767956339; x=1768561139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPfvCSrnVo5Qo9I5d2+17ibegJrSwKckNw0me69pYEM=;
        b=fBEd2Nh1apJLI/RaI4uX0QYOAc7Ec9a21ZiPVGp6FKR0KFzklQ4IRDz8PeDxWzVHE0
         LQSKelZiqVPnf2TN+KfWhp5Q3oYyMl1a8VR0Hsa57vv+LRrSCCSUeQxYjgRpnCrXTslS
         +ZeyGoVFJbwq0CJ+Ya/1pZhg7MS06Xf6kD6PWCgm3CQGuHVCu0vWrkR67kwPI81nbaXK
         0Ogg3dquBLy40d47SUGZ2aFfuLrzsjbNzWzvvNMUPPL+hpUn4Xwdra4WvDfTf663jgrH
         l1fvyu66HG7O87C+gMXcj+xpRdxRFZqCjr7XHelIB8ckYO/5ExlfiRxqtdO9QzmWuffw
         gqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956339; x=1768561139;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPfvCSrnVo5Qo9I5d2+17ibegJrSwKckNw0me69pYEM=;
        b=XRoePfUVhLfXzSTfv/G7t2mKuiAFXEB70G+QpbF1C/q9f9HNZ/slmcVH3zYQL72U3R
         EJHtkPOsCAqtHLTBBQpA/ggz0wvy+AoxK1N9vHY5yRCqu2ccXW1KxqnefMY6dqwekQJv
         ssJxnGEV/Jb1w26n77k1xcd7/3JwuJympKpTvQTI7JQ/1MDBeBSiQ5YvYr3vI4URWN2T
         gzdvE6Gw39yWYxUyiiBKKsjLfZXXcwTudwjT6JwjvrKGfVyx6NUDa+3xdYyrXC9dj4wo
         szHZaBq+w+7pfNFLp2ZU2A5jasp1HyJw5cUTNl42Pzg4VF2ij9GY1LlUCPMHTI4C8k5B
         qKiA==
X-Forwarded-Encrypted: i=1; AJvYcCUMwsJkWZWe/jUKOsJvb5VB49dm8SeCVKCzlcoTbupVqnVTMgAAX96XceziLJEHi/lcVFx608IgvjvGFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMpTIboBW+oBsiRXW0807Wpv1M9Yo/xr6MZgLCpYhRbDDZLdiQ
	T30B1jLMlKuzUQY/MaTfxKS9Dc4sfHC2cnkZyMs1nvWVbduB1NGG6hQ2E5djSr21ZBGrJJ0eucq
	z6xwAjw==
X-Google-Smtp-Source: AGHT+IGSYpvKO504qucf1dr1WtcYvp93s7OznpFe+3OdHebT+0JCTByeUwx/tII4lBfL6OEG2ecsRR+hu7E=
X-Received: from wrbew8.prod.google.com ([2002:a05:6000:2408:b0:432:db31:e53c])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c4a5:b0:477:1ae1:fa5d
 with SMTP id 5b1f17b1804b1-47d84b32f5amr96596325e9.20.1767956339253; Fri, 09
 Jan 2026 02:58:59 -0800 (PST)
Date: Fri,  9 Jan 2026 11:58:08 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109105807.3141618-2-gnoack@google.com>
Subject: [PATCH] HID: prodikeys: Check presence of pm->input_ep82
From: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, stable@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fake USB devices can send their own report descriptors for which the
input_mapping() hook does not get called.  In this case, pm->input_ep82 sta=
ys
NULL, which leads to a crash later.

This does not happen with the real device, but can be provoked by imposing =
as
one.

Cc: stable@vger.kernel.org
Signed-off-by: G=C3=BCnther Noack <gnoack@google.com>
---
 drivers/hid/hid-prodikeys.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 74bddb2c3e82..6e413df38358 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -378,6 +378,10 @@ static int pcmidi_handle_report4(struct pcmidi_snd *pm=
, u8 *data)
 	bit_mask =3D (bit_mask << 8) | data[2];
 	bit_mask =3D (bit_mask << 8) | data[3];
=20
+	/* robustness in case input_mapping hook does not get called */
+	if (!pm->input_ep82)
+		return 0;
+
 	/* break keys */
 	for (bit_index =3D 0; bit_index < 24; bit_index++) {
 		if (!((0x01 << bit_index) & bit_mask)) {
--=20
2.52.0.457.g6b5491de43-goog


