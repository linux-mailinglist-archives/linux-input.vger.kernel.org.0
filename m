Return-Path: <linux-input+bounces-14861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3313B85D5F
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 17:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E13564835B2
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 15:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECD5317715;
	Thu, 18 Sep 2025 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="O2fP5ZOV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8F315777
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210771; cv=none; b=baPu0GkgpI2jAotYSHlMhAnhIIdx67jGdSAH4mO3Tw/vEEDJGoQ+GVbHwPliALdZvYqYsnXUCxFB2fHidDx2HiDYQ2ndEkcybvtl4L+Q12nCqeAZ5RIwt1ZzBFaYIofvzEVz5MQsJKth8y/sADRc4x/HNCOmWpA0n1egIYKazJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210771; c=relaxed/simple;
	bh=8mMtSR0zIoDa6Wg3t6T/sqjlCahjaYeUdlrfsHSDYXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDJYKYGZqG3mJpbGzUEtSYp1GUCDS5Sg7u3DPi5mWVfByErf4dvaoCGnaT3PyWhIFUPtt9glhzfeZfd+jz4lY/M2lbwfDwyFOlCThvJHf9UdQMeyNkQpiWPBMp3w9DafiYF1iwjW/LMsL2CzxccM3AOq4R+2CQcbNJXOXfZalRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=O2fP5ZOV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62598fcf41aso1599471a12.3
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210767; x=1758815567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+LIVzIwJpub6PF+1VXdSXGpljd8+6HMYi55fOiXUgs=;
        b=O2fP5ZOVvraMWDob0IyqegXKkV0ZhEJ1OspLVmq+Gf30ys1M0M7g+LaSivVlNNAaAy
         3eMrSzzRXYVWeSBmNMrWeLXDslGtrmWhzoLE2wWlEAsmBaxBTAjM72lXnoYgj7Zzc+jW
         x4WZN6CUFKWe5MJU8S62ehiNMV/qZH68ETUNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210767; x=1758815567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+LIVzIwJpub6PF+1VXdSXGpljd8+6HMYi55fOiXUgs=;
        b=K8MbBcaksDu9tb5gbTXVUq/Jj/kdlX4dNiCD/pHV+cFKH3nmsg1EvhFtf4hjW/gyt1
         cmVuFHepfUvWbtJUAtcvqLbF6QHJAyiqrueKgY/betAx5ZHX8hY8nUbzW7h+/tIo1C5v
         4D4MoegDS0H2OWkEBO1L2IkobAQ9F5L4dxYzMtcfPdWLdVGmXASTCJIpYnQoHJF6LgHb
         fNxyNPohiReHZ3BKIHrK9P377TG2O2EiOui+Vc6hZrRunguyxmfMz7qJOGV/gP9eTpuB
         IePJmdqFvOUlPj10Fw/7fDdVJRmLL9DDS37qmkrojl44ZaRWndeDn8gT7s5o0bpeSFkZ
         3Wlw==
X-Forwarded-Encrypted: i=1; AJvYcCWLNyd5h3+nKHZBzApd9k8pATYEDcMiZsW/5efnixVbrEV0HHvAuT6nwMrEx6+5axBB60yxOGlvLLHgBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6dwvLNNkr22rMi8vr98u1WUyNSSNcEVPyO2/rl/K817VRuWt
	Zb7+aoPoXCZYG+pNBr5ZY1QYfVh+AEQYSGqYqTxOs8iShcY3oojQKvQ1gwUwPGX85wBaEFfTf+v
	/19jm
X-Gm-Gg: ASbGncuJ25MIYcRhrTlX2RuJeVU885BQIVAKLSynhO81EOsKQP4iKSlLMaI/WirxhCD
	C3jeD7z3icwgnbNAm0TOo6LxU8+PmxKDbhf4JWtvoD7WyiKDBXjRAMN216C8wUFccRxE+nWLqof
	kQPkvUX3xPHwMTvx/gQU/BlM+zgymCJp2kY48EldemPVXCTZETiCuqGpZEfUcgthfg5idK9ujDM
	QD+RuMvXFOp+Pc2loJQHEEjKLYHtYqmCIvWQ7P2WwLsnKk9J+5Lq4LXbfOmpp8Sc6LQ5TaYtfCt
	8pS/knRdufRggH+75Cf/BdguA2koBRhoBIKDLQxpty6sMMZWQ9vFcuve0/UJn6MJISbGNauP0xI
	YaC9hbCzYGFYvHut36K/6KdlecMoJecJ45Gc3IuVv1A1rKo98+sqewcDfYba69bRvrKm+2f1QBA
	bqlATW/WX3Vd2RWaAc7RKHM/EWMeAG12HAy/GyJpFR170o6lJvOshH3hTMGYJ54HlM+pyGW82Y4
	7GOEfsbRBE=
X-Google-Smtp-Source: AGHT+IExLNGGOMPxlFZBucMiTx7Li0FQ+LMi3DGtr6XS4648VroCdhrT9sO8/o8KnNnNbpm4wLXwXw==
X-Received: by 2002:a17:907:7e88:b0:b04:97a2:64f8 with SMTP id a640c23a62f3a-b1bb86d78famr689615266b.2.1758210767474;
        Thu, 18 Sep 2025 08:52:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 3/6] dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
Date: Thu, 18 Sep 2025 17:52:31 +0200
Message-ID: <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v5:
- Add Acked-by tag of Conor Dooley

Changes in v2:
- Added in v2.

 .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index 3e3572aa483a..a60b4d08620d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -206,6 +206,10 @@ properties:
 
         unevaluatedProperties: false
 
+  touchscreen-glitch-threshold-ns:
+    description: Minimum duration in nanoseconds a signal must remain stable
+      to be considered valid.
+
 dependencies:
   touchscreen-size-x: [ touchscreen-size-y ]
   touchscreen-size-y: [ touchscreen-size-x ]
-- 
2.43.0


