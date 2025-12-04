Return-Path: <linux-input+bounces-16459-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F1CA39BB
	for <lists+linux-input@lfdr.de>; Thu, 04 Dec 2025 13:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A61D2306FDB6
	for <lists+linux-input@lfdr.de>; Thu,  4 Dec 2025 12:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A662233FE05;
	Thu,  4 Dec 2025 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1ZVr+/oZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4191A3165
	for <linux-input@vger.kernel.org>; Thu,  4 Dec 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851356; cv=none; b=TLSfxFqE1pcPa0bu5Hds/H4vfsmAueH1eLZzw7sU4ELzzOOba9YEsCNcV9RGhlz/ct4OBHxFeyCCSfpweMokDLbX06UPXeKoVmBuCNGZ05RdoMxl4vpgA7yTnBYppuGICZL5HMMiD3sLf0475l1U8JFRRxQegnZu/KQ3tqREGa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851356; c=relaxed/simple;
	bh=QYmrgdDXqT1aWWXJG0G1BjIqfjRA9W45tZLonXGa3jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFnU40YoLsAOvRp5J82VO/rU+/uj2ySA8OERfCCuK76IyzqjIYFmMQzVDm2X68UW/CQ9p/IbLSeXFOBXf1+1Rn79kZiF4OX3QiL45uPcl+qpiJZ58RIvzbvCUSF7zg029rcNtpc90bRTXx4aF+V+7i0XeqtruWHEWA/FlgMJZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1ZVr+/oZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so1231298a12.2
        for <linux-input@vger.kernel.org>; Thu, 04 Dec 2025 04:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1764851352; x=1765456152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iuRvFxHsbSvTzobdKClKZ4UVAG0qRuCMrY56/R0rKA=;
        b=1ZVr+/oZVfXtfyPUT5qh2tJQn6M6ZYlBC+Za2f/Z3YrIC+BrHEROnVTELqP67+Hqp6
         WH6bhNguhy2MDp464F2Dmi9pWJ7rBan5PqPxfXSWPUzQzYQXBmAqtTMrEgjf9YlQotp+
         VIWuqdIhN6Iz4berQcTXD8DjNGC9nvRZQjjdHWwGbPH3a9k62iYuiK2qjCIGBaxdKH1w
         EYxA9SK6qiClO/q2CZWJ4aco2Xf5/7Uh8q6sJZJ7b5dJVqShRitkzVJVvzH75kz4K4/B
         XoIYDUiwB5mizIXCGFmZuKPjp0DTb8KTQV/2MTZg5CDa1fgK37nNv1YLmecCVqSlzCQ/
         d4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851352; x=1765456152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+iuRvFxHsbSvTzobdKClKZ4UVAG0qRuCMrY56/R0rKA=;
        b=HyDhKIA6AaH1QG6OLMG38PRhzUmC6yTfO+H41HCjWuBq6O6qNmsDbIPzSpdzRx9E6N
         d7gM0pbEl+ojJa2D+kd8hQNCUpuOVS8MDONjynGoKh/1g5KMtYyc6XHESZ7fcgbCu/v2
         tLTLUqSDg0hmA0Cut8yqXFGTf+lZcvvOFaBIvi7fb4OQOiMUeujjhuhC0LzR93Hyzfvv
         FJWfEmVMNIyA0j4a3s9mGZf3rFO81vOUP1vnJVBL5gON6T0EPQLYN9t3iY0YxobR/dcO
         OH5hCBwWg0tpobnJySozMpYQzPkUN5bqNBt+iVDx2qrrGwTBU/EXCtPeRvMylbfDGGLl
         8HQg==
X-Gm-Message-State: AOJu0Yz5CZVc7B27Jut72CyXL4yJDA8qsa7lgdrTkDKfjCToAX5b2ih0
	eZHP1SYLMkLfWlRXG/EYIUS9nzxTyp8HnzdWD9hzAmKNofZ4lEqsbjR+RnLojf7SWA0=
X-Gm-Gg: ASbGnctNaCwcaCEJPohUIQRU5osYCh4fyiYd02x6PsgzXdR6myLii+NqMJuN83nPkZZ
	NiqS+RnUSDab+9UKOSwJ0NVXTi9HzHG4ghHbqAx6+hh9+D2HOXgVjhNYzj18feNcKbXqWP1UjJB
	44UMBCuEWS3i2oMAESm+h/FIxyOlFkiiPOYeWXkFa50Y84HrBxZFV6SlYh++l6deJfXP3uzOuSR
	GoeN+Za3T5yQghJBYXNoVi3mHAPYsrX+l9y9c4Q2SJHJ+lvLfgc/Uy1c0QmiIsCx6oM1gMDeKsQ
	fcY8NdmMEmT/BtV0mDO3JKodR9xUSMpWbr0OAm+WOFpxPEgVb+DxTFzKJeGf739UhJG5u9xGzUd
	e5vWzlgshZzE7Py6BdzegWNZ8JQY4qNnhaYnap55JOXEdpse7Y3gx8TLkrMRzFg1msly/pA3dkw
	Zii+FlsGZs+yeh0Z3n3UL0rW6xjHaMkGcRjvAHBAv9a6v2C+HwdVXPPpT41ihvKtb6OgzHGIqsd
	sjjSLU=
X-Google-Smtp-Source: AGHT+IEeLWVpcgpslRVn/NQp2VXf89zJAX9UXM8RzNCcJdJCNhZ/TlipgM2kHb8Q2HjLSF8XiPMNCQ==
X-Received: by 2002:a17:907:9448:b0:b73:7158:d9cd with SMTP id a640c23a62f3a-b79dc77dffdmr685538066b.52.1764851351828;
        Thu, 04 Dec 2025 04:29:11 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4a2f19dsm121351666b.64.2025.12.04.04.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:29:11 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 04 Dec 2025 13:29:00 +0100
Subject: [PATCH 1/3] dt-bindings: input: Add Awinic AW86938
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-aw86938-driver-v1-1-ebd71868df3a@fairphone.com>
References: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
In-Reply-To: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764851350; l=849;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=QYmrgdDXqT1aWWXJG0G1BjIqfjRA9W45tZLonXGa3jQ=;
 b=ZFDj37TSZ3tYnwNR4KtpLow3cMBXaX8FcWGKPELphN/73nUGxmYvtUT3R31yeUttW/CaJN06U
 gU22RcQC5IIAyYZxF8v3tBy2J1LUHme1xxDWwlW4MfssR/YrbyByhlf
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add bindings for the Awinic AW86938 haptic chip which can be found in
smartphones.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index b7252916bd727486c1a98913d4ec3ef12422e4bd..c3dee660422192720da3cf63851cea27db819742 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: awinic,aw86927
+    enum:
+      - awinic,aw86927
+      - awinic,aw86938
 
   reg:
     maxItems: 1

-- 
2.43.0


