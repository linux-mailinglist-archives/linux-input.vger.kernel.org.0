Return-Path: <linux-input+bounces-10278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A2A41812
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 10:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C2253AE7DA
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41AA21D3D0;
	Mon, 24 Feb 2025 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdhUjYEv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D021EDA00;
	Mon, 24 Feb 2025 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387915; cv=none; b=WtNKvK7akvxDL9Ryo+M9VmLyThRB7y8mEKteq0fzuUKWJBu6kAWCU18o4trgpsAFXIaDN+m52Bs1mGOSrlD6NomXrYgfTWhB7leSY2yrjt6SM+4S84u3bbDuALtmYHszLV9VzViYPQpkLHATxLi+G+uOTuGSNgUAJPTM0kKQt4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387915; c=relaxed/simple;
	bh=XKItg2QlUx4XyDSdch36WvmyLwcKtcZtpLrZTfCRZKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Is/EpmaEIu8aBKhATLuzuU0GSlkj3irgt+EnvbXPEQ7cbKmXVwRDSLY4NZ+feYLpx/XoqHZ2WxDYdF5LTb/Nckw5Y0NRcNRvs5PlNLyGVfjbF63m3r2jnuNyWttyckzT+BSoO9eEU+BOFKIPwTN58ZIjpD07HhPfzZjKCDSKy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdhUjYEv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso2066495f8f.3;
        Mon, 24 Feb 2025 01:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740387912; x=1740992712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7M59exBVp1K4bAfL9skHjpr2bs4oRBOILo9T08ve1k4=;
        b=GdhUjYEv9d6eWIl8QRJypRrIWK/eB+xQK85k4csFriIJ7wsaZM7y+ULpYML3XFt4uE
         7iLdZaPQ2nREzaqXXkcqLyGpttUszbVCHC47DapdUUvXcaoZSO2zn7b3Dpsd8k3EvtKx
         hDTTpOLUYaQMaxRsn93I5yJTA/nz0Y6CbRD2nUZ0xhOF7UuHaImLKw8eqhJnBve+0Zb+
         1aDkKEvrIQ8HBmXie0qKtSN/LN2M/uXCdZv20e4xnoIBgxECBWFqOmK5qyciYeJVUEh3
         aVj+uypZSvy6BtVbwuxq9hTuGMu1iNQXza3XP1OmI6i9fmWv14YvdEizJZzTKvTASmFY
         MObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387912; x=1740992712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7M59exBVp1K4bAfL9skHjpr2bs4oRBOILo9T08ve1k4=;
        b=j1bLsuOzL2IBdTTqn3dpVC2v3kLxega2kHJyluNf6dRMw7keRQ6+Sw7C7Y9CPFw9+7
         tlrpeoCq1Szri/8p5ou+/th5JWwB7UVeDZMFnd1kDsAkVZzwee77XCbuK+169W/ZjsqR
         8gb06mX4BIy8AtArSM7BBOSEDMJjcLffYdjAemJw0cOn2YpJKRLOt/5EKXPiNBOCCE3M
         Mn4oEDP+pAnfs0xjnLGSkLii+12mgVEv722kuP3dmjBLhESxtfKRJkPiZhVxXeZSHyxT
         Z2xP5JGs+qkUVDv3bJkjB2R37UFVgfUInIAirOpeL1ZuabFCYxU5Dc8PmufZXQ07Uz5p
         b5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWu3NRX2ORnyf3sDuLuUTmI02dUI3RpI0aID4XWRBT9jzvOvmKO5A1NmKs+xNQgbarEwbcL9tBjbi5/YuyT@vger.kernel.org, AJvYcCXctTXKRAcy5S14hNZQDyzraQNQagcn0Ujb0wcmbQljw8uo2dQ9YkGoPGXssGAP0yZ0v7XPCHl1LO7Unw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK6agVpvAGu+T4wK8+LLLg5KU1TQTylBRl9SKirDTTK/azelB4
	E2jAJNrh3qPhrNN1PUCV+lgsfiGmcBIrOHaSvlDUaVZrhSW4b7cE7CfiiVVHZ9Y=
X-Gm-Gg: ASbGncvPm3G4V3Xno20qrQWeeDjFfMLawkUkden5kB7C5lEO+g1vsOOukjobHV23dIa
	Y16G2xvaxylh7ggRgWgG0/p3nc974tsQ24ndGnAQZdMD/UNKkil4v6IZBonuZb/id8Elz7mTfHy
	uAnDKdrFSSoCtAWNRDZIekbUHpo/q2umKZnsg50i6cChfAr/WubBgbrEeMwkxMeExxvkc4A2Yer
	cF8MBswCryTWWLyzmTVslsmLVLQpXvp2jx3WoDxlXUxp/Rt1vJaFrdBMadbr2VWpLR5cLxTPPti
	25OFgE7XVYJ30EY8oe/p979un+PUxKeypECzGrhEJOoUzFwaSEr0g0HL+kr+NQ==
X-Google-Smtp-Source: AGHT+IHZTYyoyhOAUZ/lJGbOs2xiomtjHCa6Eb/b9UwpC8RdM6DfpfWnAGNmuQNxicqsu/bhnfWEAg==
X-Received: by 2002:a05:6000:18a9:b0:38f:2990:c08d with SMTP id ffacd0b85a97d-38f6e95f339mr12596048f8f.14.1740387912191;
        Mon, 24 Feb 2025 01:05:12 -0800 (PST)
Received: from fedora.. (84-236-81-135.pool.digikabel.hu. [84.236.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4123sm31835674f8f.17.2025.02.24.01.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:05:11 -0800 (PST)
From: Andras Sebok <sebokandris2009@gmail.com>
To: markuss.broks@gmail.com,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	Andras Sebok <sebokandris2009@gmail.com>
Subject: [PATCH 2/2] input/touchscreen: imagis: document ist3038h
Date: Mon, 24 Feb 2025 10:03:56 +0100
Message-ID: <20250224090354.102903-4-sebokandris2009@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224090354.102903-2-sebokandris2009@gmail.com>
References: <20250224090354.102903-2-sebokandris2009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andras Sebok <sebokandris2009@gmail.com>
---
 .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
index e24cbd960993..bd8ede3a4ad8 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
@@ -19,6 +19,7 @@ properties:
       - imagis,ist3038
       - imagis,ist3038b
       - imagis,ist3038c
+      - imagis,ist3038h
 
   reg:
     maxItems: 1
-- 
2.48.1


