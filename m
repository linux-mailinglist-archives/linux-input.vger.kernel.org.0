Return-Path: <linux-input+bounces-10609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD07DA5644B
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 10:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 843711886475
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 09:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA8520C029;
	Fri,  7 Mar 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Cjg1Mi9T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FC61E5B85;
	Fri,  7 Mar 2025 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741340916; cv=none; b=sKG+S4emSGv9n0FI1Lv41+GwSfxujsnQbzm226tuJp64W+dN/VTNsfDZJcDbYTxqw2Tb7ku5nJuR9iKLuqtYQcrvoeQmantZrQIbMygjrtRghJu3ZWxYjVrc5Z5TlCeCJetMdpEtic26Lg+1Mf0YjOsNRICeFwES1TMafQx/UFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741340916; c=relaxed/simple;
	bh=7AfEAjVueD4CSg0GKlBjrHHbSydJfkmiSzoJ3cmfrYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPJNwImNs2COQsz0e+S5XqoEc6i/w9hjDG98fhUi0mPaOf2II86vxrUtvmK71iX1hVK1r4wgnxMFFPcttp6rbFbApsW6T9ax2Ek+omjasdQ09lPFVx/ctLrw5AZkgXaNJb/nE+kCfVw31TyzrHJu4n39K08lPTuL1OnQXwIYjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Cjg1Mi9T; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from karma.space.aachen.ccc.de (xdsl-78-35-222-202.nc.de [78.35.222.202])
	by mail.mainlining.org (Postfix) with ESMTPSA id DBEF8BBAD2;
	Fri,  7 Mar 2025 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741340906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iTh8al/QMgkOMLb604e8GnqZSp6qAfMwJFpoZXijTOg=;
	b=Cjg1Mi9Tl0zymWucLxgcL8x4QIghekxHyneTSSi5cjpaY6F7BWw0Par+YtRzcHyGNHxKYJ
	bvqnFZ3COJAo7S3RhivhAFTxEsaHXZAxmZHRIuR57ydBeye0y8ElFxBRHZzndfqXsni9cw
	HPmYNHdfil+CgRQptLf7p9ywC0ItHL1bFlZYQt87As1krt4Za//1xI1OMjC7noFwGrnyjy
	hztoeJQQDyYECFq3F/WmlpiotFF7s5SugJh0p+Fx7Jfqvg0337fdiPssDY1BdydaGXXh3Q
	NCglVBznPw+bG0qI+3bb9BKY45XnrGv1eK69HtMFgTZsgl2Ykx4XZ9GTincFHQ==
From: Jens Reidel <adrian@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: [PATCH v3 1/2] dt-bindings: input: goodix,gt9916: Document gt9897 compatible
Date: Fri,  7 Mar 2025 10:48:22 +0100
Message-ID: <20250307094823.478152-2-adrian@mainlining.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307094823.478152-1-adrian@mainlining.org>
References: <20250307094823.478152-1-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Goodix GT9897 which is a Berlin-A series touchscreen
controller IC by Goodix.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 .../devicetree/bindings/input/touchscreen/goodix,gt9916.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
index d90f045ac06c..c40d92b7f4af 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - goodix,gt9897
       - goodix,gt9916
 
   reg:
-- 
2.48.1


