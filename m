Return-Path: <linux-input+bounces-2571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21788D7AA
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 08:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB4EB29ADF3
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 07:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE31B38395;
	Wed, 27 Mar 2024 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w30IMaEp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6CB381CB
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525511; cv=none; b=K+Iejk3DtQwunjowdzNlETfAsa5CatL/s+KvEXHS4qaK3weui9BPYZueCAAew/59rGmaXc6+/ntfWrbowXGQ4IojUyZTj0uRYj7fUxeEiI9EkXvU2mYeDjjGLMTVtFRcBXX28orJ1wYyYX2g65Q60O/4Aa02ltm+Qg+njfahNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525511; c=relaxed/simple;
	bh=4icp/wvd/fjEray5B1/3YlXzzTUAdRig+Gb04+Lw4sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOXvyrITjp8k02uc0s7Im8o3WImf2sM3LH+ge16nGl6Y3WSwQa8bVnb7Q4GUc7lYY3VT5ecTLtf9WOnkCjB4G9iFDqr+gHYubbOcFyLhK/rSPzQL3ouwRu/Wnpqo8sLidQF4yAxYYR6zVPGesEBcFe4tTxRa4YcCgDxIUQ/9uC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w30IMaEp; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a46d0a8399aso95628166b.1
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525508; x=1712130308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hd27sV9Cq/PUsPevWdVtGWA5/5nRhufdhobvGmInTo=;
        b=w30IMaEpu9YDcVj1mzTDxy095QeS6v0xsrVsAMiFCJMdmpzPgGb2Cw3Uhw1E4GCoMl
         9yHyIEWi+cg32Pg2MyyBztWSr5vaIXSQRqj23DF+gKybzDaG9z5WOUbOJfhuFW0i14FV
         FuM7WyKMSknBuR3XF1EDA+aln9XrQK7L2a2dB4zaezl3tBLZL3gwYv9d+J5XXiAHNZvO
         Vp7SyQraGLsXJzdichRP2zydfh27h/R7X9yk9P4CfmO/cbZT28G8xwxX1Vnv+uPcvsiM
         fi/JjpCgLnxDff+V8tZ4k3XdjWNqeRQCieQBTtPcNBQVsD5sCNUVQdRJnFnyhH94gTWs
         B6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525508; x=1712130308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hd27sV9Cq/PUsPevWdVtGWA5/5nRhufdhobvGmInTo=;
        b=qOkWMqHpyudW99fDfzxf81WBl2LD4J6DLfrW45mh8/w6ND4mRqr2Y8EV10ipoUxc5l
         MKJfkps+D6/am5DFUKbvS+loBxJbfjPDW+WwMok3LodEr9LMGTqfvjrGHpv0jQHZgFoV
         kCEmNg9HmC21VO9OO2r2i6AbhCQq6anBrLrXSVpgg0683ZZTL5cfm1WFISXuBeJ4Qg3x
         z0QVkphtgdnv9hizFw55yLpDDoahJvJrkFNhTyHD6fnDwTo2DCc90PvA3PlTrz16ZGVD
         CsdNsd3ME3WMtxGIdbF67NEvDsbwv9AvhRfVqIVML8D1ZqM1VH7tWcuTVE/valNyzOAN
         yb8w==
X-Forwarded-Encrypted: i=1; AJvYcCVZdr9Ehx6scPtalHgck2hRcQ6PY1xOnQymjAXxzk1aZP+3gBTEdzssyBwwbloz/FCt5ZjT2t68N91irjk862BzCdlFeHNhVgbH5j0=
X-Gm-Message-State: AOJu0YzcaSfr7acQ2tVqi0E42uBTYxgr4advqVNYw4xhdxRSyCgLTO/m
	Sv+0gdFrXxhPCjpbJR7dd07hs53R8mrd7EXKWlMHlu9bl7N1RBVYNRz1HLo/Zrg=
X-Google-Smtp-Source: AGHT+IF5Vmj6eTyDBK1fEXaF+vjY69cFdRk1hmkzgjV+20lhxomGlD3ZVF+CyF41sRnpLluZYT0dNQ==
X-Received: by 2002:a17:907:970a:b0:a46:d759:d531 with SMTP id jg10-20020a170907970a00b00a46d759d531mr3840452ejc.34.1711525508119;
        Wed, 27 Mar 2024 00:45:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:52 +0100
Subject: [PATCH 05/19] platform: asus-laptop: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-5-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=768;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4icp/wvd/fjEray5B1/3YlXzzTUAdRig+Gb04+Lw4sw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85PAnzGtbUajfFNHmhOq2+9nktaOOh/LAtXL
 bMT1S6F6y6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOTwAKCRDBN2bmhouD
 14vfD/0U+qsam3B01jMhQjU7MHwc7lkh6KqJUj8kIkPKUTlilSmzTtqi/YPPO25PNvZih7ChIV4
 0FUVQLtz1FzDFpbzhZC+Ff8hXstpTGbxOFmwN+uQoRl7DqDN6nBL4fwD/MwHFVg1FbHWWKuAV4h
 wivgLsyDHVrp27oR/YeG+2jMkcUGVgD3Bcw8ugJK4Zrw5T2NoPzgO0+pvp7SJ5Wpga2HTmT+rzV
 Z1spbCkt6iW5AkIMgOYNt3wWhDu4lntluDpmvOyAwZQmVT1/AOUGdQOJvPDOC9lY8IHENX/+man
 7GOciwpHpbMTtdMGri5Q+jjm33DuyZqJqQ8U5cUUzNmsRND4NqIDRIidpul/EwDFID6gcEkxlZu
 8/LXVcbuP3z/2vmJimjK15dCTrybmwnHZR12op0/WkEKoTjSN0SqXBAoElpNXi0tP4k6jXGf8jo
 CAZeFps5EXzUvZiJeG24MqgyL7vuN4DLwSFqWlaOxqLPO+bX8tmOIbfoYz3yYS6Hgr7PI3vSkDZ
 reXjPE0xC201KOokJbB0evZtiGyU70ieFbaD5xG+EJS56k97D7HkCJhfTBzv0W9MecrG3l7n0kE
 YANG9mPwlPFO3aJ52nCjlD7oVmbR7+wYVR4oLAdZeG72QSp36DxAuch2nnTp2oGUoQk8peJbZpP
 7Wo0/UrvVk+xQaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/platform/x86/asus-laptop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index bf03ea1b1274..78c42767295a 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1925,7 +1925,6 @@ MODULE_DEVICE_TABLE(acpi, asus_device_ids);
 static struct acpi_driver asus_acpi_driver = {
 	.name = ASUS_LAPTOP_NAME,
 	.class = ASUS_LAPTOP_CLASS,
-	.owner = THIS_MODULE,
 	.ids = asus_device_ids,
 	.flags = ACPI_DRIVER_ALL_NOTIFY_EVENTS,
 	.ops = {

-- 
2.34.1


