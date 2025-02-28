Return-Path: <linux-input+bounces-10427-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B04A48DA1
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 02:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 475D316E5EF
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 01:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAAB17741;
	Fri, 28 Feb 2025 01:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ftf9AWD4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9CE224D6;
	Fri, 28 Feb 2025 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740704809; cv=none; b=lOEwYOGI9p+OGiIlNNlM2Jwn55vCloWVBhG5esDm5wOQKPdD4hejG0LhxFZhhbmOiGi80vtmbAFKWQnzMyFMr2FMk4rqsEkBYknR3aQSv4CUzR6pUqgJtp6n6jEn3UvQO6CvNdIZLJG0NJuQZQYue6Aky49umZY3oqq9iPYq8wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740704809; c=relaxed/simple;
	bh=CWxCWNQVtyMpHnHOhHMe+nNImxOeMjY7WzUZotGHo28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EeP+NblOhSRQbHzriyRU5xXJClvPQVudZxZwG083ga1b5yyoRMEJSsEY9mkq6brQxDpnIB5Jx1mkh+rdq084BITNSVfKwfVXN9eOn/PcC79T3Nd9H303GpQK+gSoTh/WYpW0FTxmpHe8atrLynQtz+Bf2n+NyXC6mmiev/tY2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ftf9AWD4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22359001f1aso29985635ad.3;
        Thu, 27 Feb 2025 17:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740704807; x=1741309607; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uq2rZxEkjFUo4QgyaS7BsaFsWHlPYAlTrAuuGWuK4to=;
        b=Ftf9AWD40JEczR24pAUI1VntOjH+nmI9PK+XaedB/DrwGzqRzc5amejKnw/RZid7ua
         rwG0EGd5C3flV2FjeEqHuzydFNMcl47pQLFqnVmKq3CESkAd7/ZZMv9bcXelMta1YSB2
         wjkuoyZrqpwY/nNdCkh4Rvu3qGmaEVccl4igYMuNRkzFdkrPLXMiVfC3vouKV0uI2IM2
         b0TUvz38foP8YQsTy1aeQIi3HQ0bhz4Ev7Y4SabUEnd3/drFpv0igOMjlsZU3ezXbO+5
         W+7immoih7CosKhnXbUVF7rJVldbIPJLa+6p/bYc/PBW0g2hrY7lKjcvGpn0CXTGRkqx
         cCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740704807; x=1741309607;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq2rZxEkjFUo4QgyaS7BsaFsWHlPYAlTrAuuGWuK4to=;
        b=nOYEf/ZxTXDUB4PZimlnJDXT8apVMdAPxQm1HRVElg2xc73K6QmbW/UjQEt1PUi2Jc
         lQylJtz2XZ15FtkD58PxF3aVjWaytUlBBSOIZFj1KLN5BW+7w4YvE+c/6maKl/QQG4nT
         OXm7kn9NpMbjnOuSHAKPtruaf2QacGDU4S6de87OLSoW9At2Pu8MaJAx4OmYuGj+L6zI
         v6PNwMlpe7zQapikNkRrInJEBoCm9CSX8FDyKfNecL0Tb87ZYp0gF1BHttNzSW4YdFLn
         PHq0r0YzgIKOAkGFSf42ojigR0+MTkyNqUXQr9AloyLbj1EPJguJxjSPhfkcK9sGDFHQ
         9oDg==
X-Forwarded-Encrypted: i=1; AJvYcCUp+RxxWHhUpL4clXrmq1VZipawsJ2Z2AtpKOv/aIlqmLGNJ0GhfmQPLxLmAmC4sOsz/xI4Q3WVbNAK@vger.kernel.org, AJvYcCVuo3JQfez8yrNgq24/TaNMFMM7mK/AvU53fzBQM/QXR3jyacDPPlD6brNAynhgKcQ61+M3Wlcruds52czx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3vP2XUfMC7tJN0gPTbVjk2DFAxd2xONkvm5W6eLyChTPNs8y
	PRBJOTrblblfLiAmB6a/s7hCptnM+P6669y9xhT4udaV1XpsWMdq
X-Gm-Gg: ASbGncttStUlinCP83LVZdXDJkskd8KGprCA/iU41C/4YcfncdPLVUb+gapkPppswVT
	yE5Tz/Wl9y27hlLme/WD+9tLuM3rXA/guk8sUusLoxmYrst/0hL5xnoRQScGKOPUWQSYv5cQ8Pp
	hzev51Z++8cTqviK2oIK9YkevDyRd/6N/QLZ0zqXH/f1urzp8xzlZT4w/9pxDnNF3themamFYVX
	uYZ4Q+hxAVI6NNAedQaiKVZfkBT+A5RU3qM35GoT7pN21ja2go75///G42jo4D8K38hUeTzeEmE
	ls+l/O0MPOYditaIies6fv/ip2I=
X-Google-Smtp-Source: AGHT+IEY05DqcD7d/d/hx9lZw2rM1pWqCfuxgEXYDyFsBY8iXGRTCJJhKypPN8GGyJgBtsPN3whXjg==
X-Received: by 2002:a05:6a20:3d87:b0:1f0:ee68:aab4 with SMTP id adf61e73a8af0-1f2f4d224cemr2207366637.23.1740704806777;
        Thu, 27 Feb 2025 17:06:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:c0e7:f2be:7020:c4a6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf23b6sm2198967a12.15.2025.02.27.17.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 17:06:46 -0800 (PST)
Date: Thu, 27 Feb 2025 17:06:43 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Markus Burri <markus.burri@mt.com>,
	Manuel Traut <manuel.traut@mt.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: input: matrix_keypad - add wakeup-source
 property
Message-ID: <Z8EMI9ALqYY72VBV@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver recognizes standard "wakeup-source" property and there are
DTS files using it. Add the property to the binding.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502280105.REZ29MVg-lkp@intel.com/
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 73bb153ed241..ebfff9e42a36 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -68,6 +68,8 @@ properties:
       Drive inactive columns during scan,
       default is to turn inactive columns into inputs.
 
+  wakeup-source: true
+
 required:
   - compatible
   - row-gpios
@@ -96,4 +98,6 @@ examples:
                         0x0001006A
                         0x0101001C
                         0x0201006C>;
+
+        wakeup-source;
     };
-- 
2.48.1.711.g2feabab25a-goog


-- 
Dmitry

