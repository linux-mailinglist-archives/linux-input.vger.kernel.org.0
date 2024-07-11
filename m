Return-Path: <linux-input+bounces-4981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 733EF92EDBF
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 19:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1AC1F224F1
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 17:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E454916E88E;
	Thu, 11 Jul 2024 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsGpIvJD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9BC16DECA;
	Thu, 11 Jul 2024 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720718855; cv=none; b=GN5sIOPrpLIHcgDXtBiWFY+b2zRJ22JpidOHB9l4/TXW1PwA52rj4/yd6CoQndYZbeWhX2doZl7WckY3MmbjufXjBN8uYBOsmhqyRue6LGQr42u1gIc8Ua39S0L/rKgovKcquJBJjTLtpcEbjpzxoBO4Krs6MwKrU46kc/6innM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720718855; c=relaxed/simple;
	bh=S0B2HbygtW78j59qAIn8nvGwDPiM05kQbGtLwRcc+Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQA1IGGSFfb9CdZK6syNFJ3I+hsiKvGQC1fkRYVBG7hbEL/28UPvorNc0EC5xq4+N6UrbStM9JRRgfr119tXEXj8n8mfOm2Rqsl8Cfl0WzgKl+g7MH+/BJeCnUBkORoKfr4njWFgb71DrfQCz+tWriavzXQAMzhgcvKjRJjyyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsGpIvJD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fb222a8eaeso8535545ad.3;
        Thu, 11 Jul 2024 10:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720718854; x=1721323654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rA2/faQDE8NDG1pdgSxWKLM3H2RgF90oPqOM5cxk59Q=;
        b=QsGpIvJDzD6k6pUkIvRGc8+xE53w+m2JcSzFe/qXtAd/ZUvx1aHAgAnxZP0xfgqflo
         Mbc/rDBoIbrpJd9FyPrgB46o5fEvEIR+Boh0ySF4/XTvlFFsgQ9Ciq6Vwg4QGOYfrrBZ
         +D/xGuHG64LmJdTurAR18tcTGTkOWhJzjOi4E2KDq/yCg++iiIh7jKWr9hY5jJhjm69E
         UMaFnFdW7H9JdR9LSWg+uPG2NS7J7VhNNZIEojDQnfbbd7GPM4sLlqqBjRy8SuZcnFWp
         bHUEcnU1Ap6qRPaMFgO8KVyAP8pO75XHXAB3AbmMz2lR5fKsA7LQCyTg0H7oQI4tML6E
         +4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720718854; x=1721323654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rA2/faQDE8NDG1pdgSxWKLM3H2RgF90oPqOM5cxk59Q=;
        b=STJlVIVmtGOdmUFnpionX480ghZJiDw6U2tjpBXydZcfCSaR/MYH9UH9dDQ5K3j8da
         uZRECdxnptKe1CJJ4vA+yCwUstjZz7I6LWgsJ7E8t/GkIRUS9p2Z6pHBAvV+csqKSTxB
         XaDHBpGSYihvm8bHpupXIhj1YJclJ0ZkANAofLlbHBD6pRYpsbbRSlxMdZBa4A7jtfYd
         oCvSr6HlQo0RwKOGzcY9mS23LztJn15pSFEV++XmpHT/OFskJKD+UPhMl34RWOyZqzyU
         JgMDNK2EeVrIKbv9zhrWKnKLNjoowBIRBaCywmyuj/73MG9WCE8b9b+/l8DgkCYm4eMS
         ga/A==
X-Gm-Message-State: AOJu0YyDSJCo8XBNE0WTaDXrV4ucnNRND9e2JCXCaeOduTDmMDvjByH2
	74mFHPiB5XfnI1ZZEskjz0XODAhbIyPEWS6i0eTaivFEtduoYfm61Tp74w==
X-Google-Smtp-Source: AGHT+IFRFDfW48GcKZ8xYZ6jsK4EZZDrETjnpEkIBvBlDJ2oUJIgQLdk1hl7yqY6SIyVrozQokZZ7A==
X-Received: by 2002:a17:903:1249:b0:1fb:9115:bb4a with SMTP id d9443c01a7336-1fbb6d03e81mr83917075ad.25.1720718853671;
        Thu, 11 Jul 2024 10:27:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac0c47sm52976845ad.192.2024.07.11.10.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 10:27:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] Input: tsc2004/5 - respect "wakeup-source" property
Date: Thu, 11 Jul 2024 10:27:16 -0700
Message-ID: <20240711172719.1248373-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
References: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not mark the device as wakeup-enabled by default, respect the
standard "wakeup-source" property.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc200x-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index cd60bba11c56..90a4ace22395 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -562,7 +562,8 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 		return error;
 	}
 
-	device_init_wakeup(dev, true);
+	device_init_wakeup(dev,
+			   device_property_read_bool(dev, "wakeup-source"));
 
 	return 0;
 }
-- 
2.45.2.993.g49e7a77208-goog


