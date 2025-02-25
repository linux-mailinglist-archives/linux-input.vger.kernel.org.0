Return-Path: <linux-input+bounces-10336-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A988DA4380E
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 09:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E69216EEAA
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 08:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25436257422;
	Tue, 25 Feb 2025 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SA8RJIjw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74703153803;
	Tue, 25 Feb 2025 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473409; cv=none; b=dcRs8txZmJG+PamXRvpdTqDoXFZIcFBy78syKjSEPp3qaJ9ZbsRvgZDicTT7ODJThW3s2QlMaZ9SNgOL4R5szm1EikKw0W3L+0AjbOV8H7HOJMZi1QoFKjwwk/Ew2hOOP867AK/De6X5J9CgkEEqBHpO4F3YCV3xRlfGuuX+6fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473409; c=relaxed/simple;
	bh=XpUsFaeP/4EuHOSFzpnjeESHSFOoXTew5nmBDmFIWtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqiPzuCnInKFyLyy/PSaOq1CQraTHyjRtv7JTN1Yly6kQBgGUFrLKmFzxCkgej5gYoUtF+j6rFR5YLPTKqiQoiZUd9HbcJC8mulWatpdy/B0pRP5XRA7GWZ3ZjZy9l6pqO7y4OEog9VToUwD2jTg3YxjHMuC61o6snjiO4w7a3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SA8RJIjw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so3079719f8f.1;
        Tue, 25 Feb 2025 00:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740473406; x=1741078206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHXSg8VZ9v5h0G5Tv70nt8LfXIvRNemWc4WVPgwWg+Q=;
        b=SA8RJIjwGaNPUUoYkqRUTfmVD4GZl0Oq94tAKwNMjbcPWDKYu0uwblOqGgS1xE3CaR
         DTqYzgm7YEtL72WQsM6CA9XJUhA7JDxRcAJw1eMwamQ2DU4f9/e4mx1+hNHGazmmH19C
         /nJdSPDk3AAKL4PqNrUBo6cva21vxv6MmfSFnnG8h4kO8HUnOUUw7uN9AD01iB8M+IKB
         EvrBkpdydasIGMCJ44dq4aasLor0067M4p5FdoQ3A2KyOn7AmmPcZPn9GMlDkMQnRe00
         rnulph9B7zPuSSNP/R0AAgFXSACfIQ8XIa8Zn62nN1MWNHdvqx7xb1dfGgsy2LT0TVLK
         zBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740473406; x=1741078206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHXSg8VZ9v5h0G5Tv70nt8LfXIvRNemWc4WVPgwWg+Q=;
        b=Cwr/RiLHFS9vzYl38uTX+0SpLv7eg7BXf3MDkqmQl5fMg+ukKcXej3uV1JqR0d6pg2
         erD5ORtZhnnoCrP4a0RHmYSgawMOHJlm6NhUkQCDZZXk5i5FiqKKZ5PtwFGbxXWk/6gZ
         Gld184hsb3Du0X/QRPw8J5qgUW2ZFutD8rfpYYkS2iKaY9aX24ym1Luwi+7vS2MD0918
         XL16kXZ6RTto2C1+nhHAmMl3WVT32tGOeSdAc9fkHyXAGYYTTfzj7OXWH87jXH09Fxhu
         OiyJH+3yQ+H+U1pkOTxT63MbsAjMVHEPpWU5sfMNUOrKslZ39nHT514THZNAS225Q6f+
         vBuA==
X-Forwarded-Encrypted: i=1; AJvYcCUAfzyK2VAV7r2S85gNCj++II0lsUPkkzW5afi7U6Rqt5hcu43ufTErong2eNtW48L9ivErgFpJX0bJhU0=@vger.kernel.org, AJvYcCUMrTJec+1l2L0DlDzpQ/3mK2fT0liNtnvteWHlQxjTbW3jCZuiG8fdRnz5GS2pyq/zpzsB9TTvAu0f@vger.kernel.org, AJvYcCWCsotHKJ2MDXSQYc6V3zMu1SjpH4QpXjJsC8v8ustBdJMIzLZmvRG7tl14NJLrbEq+VtcdLlhCw1x3UXM3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54HlQ+OcaeEbS6W6Tf6hO//w+Qcgqws4SK8dqaTJfurKiGTuA
	7NahdJk29YdNOzQnTHrVDf7lwddqd5yyCKEDivqoxJOYIFVbsK2gHFCIPG59k5Y=
X-Gm-Gg: ASbGnct3maqeeZWdUzjYXP93R6YCW6VlI0isopq3Xgy1x5GMnpiZHQBrAKZMevzgLj9
	yOMQXbKIFW0PU98tPge7cpwD5/D1YDj1ub2JVJ8xbyaqwpmszko7/bdzsDfgTPwGAkGnBeUGuPF
	f28p/QjmrJDIhvK7N1QUB3s7+7de5xHpVDBX2HpCMC9U01rpsv7wDhziYCbxyKyFUTmJIH/0SOW
	JnyORubV25jmqjfCakJE0g6hZzkJM4nsfgzCUKLB/w95Osf4mE0v+FXwOKyXgbDinPjK1PB4bZv
	6mZQxL0sZO0sVKkbU+evTQ+fuzBQeALZEoX6r3SpIGVtooaJYHWjGAWhk75SjA==
X-Google-Smtp-Source: AGHT+IHhPvYQNhtYLskqMqtvAoq4ChhJsu5DYr2jsTpaPgizulGwceX6XLSoAE7kDyBHTXilzLi8og==
X-Received: by 2002:a5d:64e4:0:b0:38d:a879:4778 with SMTP id ffacd0b85a97d-390cc60aeb6mr2147479f8f.33.1740473405557;
        Tue, 25 Feb 2025 00:50:05 -0800 (PST)
Received: from fedora.. (84-236-81-135.pool.digikabel.hu. [84.236.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fbcabsm1503582f8f.86.2025.02.25.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:50:05 -0800 (PST)
From: Andras Sebok <sebokandris2009@gmail.com>
To: markuss.broks@gmail.com,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	krzk+dt@kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Andras Sebok <sebokandris2009@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: input/touchscreen: imagis: add compatible for ist3038h
Date: Tue, 25 Feb 2025 09:47:00 +0100
Message-ID: <20250225084914.81715-1-sebokandris2009@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IST3038H is a touchscreen IC which seems mostly compatible with IST3038C
except that it reports a different chip ID value.

Signed-off-by: Andras Sebok <sebokandris2009@gmail.com>
Link: https://lore.kernel.org/r/20250224090354.102903-4-sebokandris2009@gmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is the fixed version of the patch, which is already applied to 
Dmitry Torokhov's input tree.
Sorry for not CC-ing the devicetree list and maintainers before.

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


