Return-Path: <linux-input+bounces-14093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F8B2AB4E
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355B01BC3107
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 14:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503D832252A;
	Mon, 18 Aug 2025 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dna2+mSN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6D32253D
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527346; cv=none; b=fzHIPxdCGzyXPfd8kUKIk3xnpTrjW/rf3XrCkLdxSO8F0gP/MnL+vqMCqmZGY3TeNj/R5taa2sidj5lAm5QlrOaOH9mHV6OuLbYkqXDUZenH2Szf0OUIleTovp+SqZUd7edRi3qC6xbLdOQljyONkx64LRavfqYsFKTCd9e19cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527346; c=relaxed/simple;
	bh=x/oEAdvTY89TEEY1xHYiXUYgEnx1TSPHrLh5CPsg2H0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HR5awaTAJUQUP+km9W9e7OpXidQXcHMUFjm6k+wBYceozTi7IC3YyBFeB1fuUj1RnOYsY1ef9i+fBUynRBNOTX0f3F0Sf4JmFl5jMrPrhvOW7XoRE5uxDhbw6KsruF3LxIpjtpVpnRwA3K2dvfaW9TNj2pRbgUbiG+3iN4NuOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dna2+mSN; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-88432e1c782so530998139f.2
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 07:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527344; x=1756132144; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3z0lOGnoy2DTiFRtSQ834KWO6kfpYDPrVEHJnQZTKok=;
        b=Dna2+mSNhgWoIoabV72mea5G+en/4hp4KwWb5A/F6j3jTpeTxOBB+UkVX/VupT+Sqm
         IirdhzormGDNtuuuJxpuymvlc8GczjZgkMTwIRsGRamI8Rxktg4+6M8wc4kWemAOaHSO
         tf4Wn3dutHnUhIpUqFDYRjJFhkZ+DKPTywWfg/5aXoRfW2eUGe4i77J4WjYrhhPEfG5n
         mSqa9pBHpzR2ypr/qsP+pglL97lfxe5R45odUNRnL5J3eYZr1Zz8XXjEfA9IKjjjEvgX
         UaV8g778LZCxGIZen2Ppkw4SxyeAd+ryDG+d6/+GsLEccrjE9p5yWkg4s/CH3ndvWhlj
         PaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527344; x=1756132144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3z0lOGnoy2DTiFRtSQ834KWO6kfpYDPrVEHJnQZTKok=;
        b=SuGUAc79OXEExvWN/zAAsWW19K2lERDYYH9uPf6eyY9Lk7/9qTl3Tc9K+ot61oeQoH
         CwB1FnL1kJ8SW4t1fWRTH0+VyDypJHAJWHhIMYlmrNbKHliZEfKaqhAi8r1w4SHgRPMw
         dhB1ug7IrYst94gfP9ReOTIUtL34ujYTjkMA90QR+DnNmBL0GYj8V42H67tHZBkvs6dm
         cXFmPEMTvzk59a63tWOn/h6TXQyeMCPpppcDcJ+THfsy/msbrm6U3HWy9HC61mV4pxRw
         k1eHdSSygXrb7vQF+oNS2GezGtb5FwHZo2Cq1K+gfzC9zJHBojBJmzxFc8ChQn3mMqWz
         Le7Q==
X-Gm-Message-State: AOJu0YxGTJlOL0sERQVBLmNL5bxcVBo4lTFxxgegdlcpfgadFj9RjSPz
	Oa0zEsnGTU6+0Xv6pMYcIexkgu01UfMGztwt7NM0bdsTd4xLuHJFzhaOlVp9TD01flCTSKZyRrk
	gcwYUHDeaew==
X-Google-Smtp-Source: AGHT+IHn1f5s0goJbEhBCAC7DNa7GiAi2gXYe6kZJfpneYr5QGRSUwUzApKz5hpqoRdffdS5McJgcY5ZqlP+
X-Received: from iov15.prod.google.com ([2002:a05:6602:750f:b0:884:4d31:3618])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:640e:b0:881:983d:dd7b
 with SMTP id ca18e2360f4ac-8843e3eba5emr2445335539f.8.1755527344033; Mon, 18
 Aug 2025 07:29:04 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:05 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-5-ca2546e319d5@google.com>
Subject: [PATCH v2 05/11] HID: input: allow mapping of haptic output
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

This change makes it possible to parse output reports by input mapping
functions by HID drivers.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91ebd8d8bdafaac07b5f85693b179cb4..d42c1fbd20a1cc01c04f93cf10f1d1c18043929c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -682,9 +682,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	if (field->report_count < 1)
 		goto ignore;
 
-	/* only LED usages are supported in output fields */
+	/* only LED and HAPTIC usages are supported in output fields */
 	if (field->report_type == HID_OUTPUT_REPORT &&
-			(usage->hid & HID_USAGE_PAGE) != HID_UP_LED) {
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_LED &&
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_HAPTIC) {
 		goto ignore;
 	}
 

-- 
2.51.0.rc1.163.g2494970778-goog


