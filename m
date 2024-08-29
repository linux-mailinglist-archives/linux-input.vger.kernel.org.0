Return-Path: <linux-input+bounces-5952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF7964DAE
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 20:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFF11F21D91
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 18:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5891AE87D;
	Thu, 29 Aug 2024 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNUbByXI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270281B86E8;
	Thu, 29 Aug 2024 18:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724956267; cv=none; b=bcQDc5rpD28LddHUNMbQk+y/Z1VIQgXDDgi1/QR2jIEHEQ9Sg4tJD8I6HV6ENxKduYaR3/OMHl3HgGO7m0k5/1INId4SK5qt2QBwQQ4sH20X4TPVsdwqFCOwgDOv/WmaUT1DMmVGWf9d9vGm8/n5ubGElC3fScUjNqg0ie5LzgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724956267; c=relaxed/simple;
	bh=HCnThirrnCTL5u5kIMiTPSS6iluwyP3BmzvFylk1Sjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Reo2B9CYLnse3HxYk9FzUY2mcKu+MMD/WaVTU/vkMD7gL4HaaNsAV/Azgp2dv68z7ASZFB9Yd+IVoMf67O10DZfAXGRMftYmMJK1sn8mapfhAZtQqA40vOIjt394roFqh0aamG8+DYSLJnH8ETCw9IEwI5FfW3mk9Go+vkYtwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNUbByXI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so604226b3a.2;
        Thu, 29 Aug 2024 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724956264; x=1725561064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXXsLBbCuAUdcW6hMIQCpy+3FpxzM3x9bBAewi8hEEk=;
        b=QNUbByXI/WbPQz50k9H8WWs18cppiNn0SiZSgWFQarlvFkWF7q3RXJct/pJ1hnJo6h
         oOLmaywsZbjMutHC5Zu+GPJftVHEoRywACcuUQJbnKgRZ/i/vSeJdrcDAYXLwwd4udAo
         MLIKiWGSzjZ+wO7cdvuYVKOMdul0rEkrdvQn0UFvHev9n3uieGhlIeX+UX9NtDt7dA0R
         3X+SYa1CprovWKu/0HXzdZjyPjhAv4OeyWU/ecJOplxC8bLjXIcCyfUrqRJsR3AQJEEx
         BDNvLuqoFiswvMeb4Cd33CBELp6EnSjgvyookplbD+OR8iDiaZxVWsn2rN89kS3XrynG
         kk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724956264; x=1725561064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXXsLBbCuAUdcW6hMIQCpy+3FpxzM3x9bBAewi8hEEk=;
        b=KcdVzU0urLbb4P1RgnXjLvAbHw2yWcSIiBTwZm57eIyB5hxcYsUWENIFkB26I+zpBG
         OUrkTJTBHSkPE7kiIWv7Q8Pp3khq13iPHhFHsVgHcUaY16N5/98VsucqXoGqa5T8MXd3
         ThqbKjX0zkZTBVFqO+rW7XhGua6btgwLa5AV13dbby1zycRg3ZLT+I/SifjiVamUvXtO
         6pReKcq1bW6O7IgqcKxBauFzBuCUVc68+mxkzedc4MMKxprb9jqnbjen0W69E++kpLIm
         dRVn3MEnToktpb0FfSQeY5N35E5qZLjzism93lN83tMAqRm29j0bOXkFjRctRKLTINwO
         Xbmg==
X-Forwarded-Encrypted: i=1; AJvYcCU2pG6SDjMM+Ddfqh0y5OmIy3l8UztqpN1aoda+Jkk11BeujEHzMRc3tZ+IYyxSmpCoK2llmYrDjhnF@vger.kernel.org, AJvYcCWIOFEsq5P9jrYASoRDsm5y96UyGIeUZSEpbONh7AOnChdjYzCAWJ8rjexzoSZ9x49l9wxjrqWp2z98JyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDABpa/ZnrB/m/WuJ4trEzo4jR2dS/uPuXMYESYVZi1yrRW4hi
	pj23rHHJCriU22GPN7AdFZz/UUvm5DBT5HKDUPxwLXFswspIE74i
X-Google-Smtp-Source: AGHT+IHSp4JGdLl5wlGaYivhFLZFqXVUgQbecLz/fZ1j5f0jZoTUJVo0+jKkoUutEAw1tE2vWwGRTg==
X-Received: by 2002:a05:6a20:6f05:b0:1c6:fa64:e5bc with SMTP id adf61e73a8af0-1cce10ab0e1mr3628583637.34.1724956264305;
        Thu, 29 Aug 2024 11:31:04 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:adb0:3b7e:78c6:e307])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d78e4sm1431515b3a.163.2024.08.29.11.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 11:31:03 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] dt-bindings: input: touchscreen: goodix: Use generic node name
Date: Thu, 29 Aug 2024 15:30:51 -0300
Message-Id: <20240829183051.3392443-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829183051.3392443-1-festevam@gmail.com>
References: <20240829183051.3392443-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Node names should be generic.

Improve the binding example by using 'touchscreen' as the node name.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index 2a2d86cfd104..eb4992f708b7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -69,7 +69,7 @@ examples:
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
-      gt928@5d {
+      touchscreen@5d {
         compatible = "goodix,gt928";
         reg = <0x5d>;
         interrupt-parent = <&gpio>;
-- 
2.34.1


