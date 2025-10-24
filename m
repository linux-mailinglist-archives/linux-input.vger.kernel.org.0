Return-Path: <linux-input+bounces-15695-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B02C05A34
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 12:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 953A6565FAB
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 10:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A013126C7;
	Fri, 24 Oct 2025 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMXydhC+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D210E311C07
	for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302387; cv=none; b=qUiIC+2Vrr+Gh4dlRrD/w1q495DqdKdT5WW1wVduyxY+0y2DYpvDDz7J0G3KgZaDK7EIxzMp4nfzO80XsFhPq6fuAjJ60vFlfgz+Wupx+7k4CYCG8MFJDZ1icOPb9YS3nuO4fBteYcDmkjYLb3E4lpQvlFVZBxxwgrJBiYBQ0L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302387; c=relaxed/simple;
	bh=ihqHHh8OwZRzTv3PuAINRB9Afj/GqQ8V0nU3GCwr6d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbLNYS1753aqssotwDR/sq3C71NY9AlkMGq2L7vT2zIGerrTqQtmZiHwTFh6twxjNJ6rjDGmpqQ1Paq1WoFNQc6WjtxoZ5vIXBWrAT5pUMFiYmidHQsvoOuLfO04w42+JgLME77m+SawncWg4hw3MwC7+Q939FzvLfjZHtQ9R4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMXydhC+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-290aaff555eso18895095ad.2
        for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761302385; x=1761907185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOQO5XhSta2OZ/LTSNvp9XgOSuMjTdgxONSnBp+ZzJ0=;
        b=dMXydhC+bv7DFf5dETUmhQvD/myNbj47qgrI80BgNU+vFwKathWKIZQkk/FPi768sB
         BTLEbaTeaCKzvrkgAZ9e02nV0HO5eCtf9mqfnSmEMe1UdUW9VkyorEkhdVhLeFbt9FV5
         Vq/Hro3iLW2+0gUU5x+Xgv/k8u03W62jetQY4Ux1fL/ELeWcXQOxS0LGYiH6vvHLGSWS
         V1e0mKnfqyi/4KCOlkgsBZ6nOK/MtVnP+2cR7KCJTsWUy6iaR0b1sX/XAKCmlXqU19+N
         JM0FapwrumV5Df3YFwKr4igylvDc5lpjf0PVlXc7i+ZyQwBj3D7sSx/IVACNLafIDMGz
         WFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302385; x=1761907185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOQO5XhSta2OZ/LTSNvp9XgOSuMjTdgxONSnBp+ZzJ0=;
        b=NEs8CnXGsGjYd9qH6qJYv33J5iu/XSlFBvXErvJH/4EQIZrF4q1vxA2Ut03yzHu6k6
         gEw4yK+3qh0j0vYzfKLfvY52Quncg3zJsXFQs471RP7QMiIf/ql8effaKb6r/6BywJ3s
         T9mAt9QvJ4Hc7nr1fOWd2VyplVNzhtOzjWnNK2FVIWEMFH7jcMKFb0orJgtlH+pQgHd+
         8egopWf9Kxxd3Stnq3iezJpj0hL/mgwam9pD90gpCRDQSUVL10eDxkrUUS3sYTVZVSlS
         n/7i67ZE8lI6OdyJwbx5IY5OX7avfnxSvVB/GzHGqFwTp0UBWMNmYXNZadxVallkuNjX
         E5MA==
X-Forwarded-Encrypted: i=1; AJvYcCWPKMBg0ZMm6w8qSQ0ZoLdqbdAYzKnL75LDn3u0JjbDi2bv6WGVE04Cyarm+/SvdD+UnJLPO1ReFEIn5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKXT4Nozs4aWeZy50TUY6uKCPV2dK47bXv5NOdi7g2WgK13bBt
	m/DD4CivMaWJnVKJZCyw6QN06aTRa1Ea5Css07nEPySHhy+K8Kwc8Q3O
X-Gm-Gg: ASbGncv+sfzOjxjfVpzSKaw2xFhzNB3/XEFJZPSqD+M/ns1LN+EjG0POlSHg35JOere
	cLF4up7raoeTwDnfZUG+jmpm0Yt3ZRvDBYnnJZr36ZuUjJiIHJr5DZKhrDaxtg+d3zz2x5jAjep
	k8vggRccZP+IMMY8Drp91cxgpKXC4iqP5kMsiFUerS/EKpTLxS8FIpXyBxwlVp5mQ+xUZ5dlOBO
	mFxYbVVzikEwsk/Q1zeiRP5eojEqu3f2ZQmJIRurotIvVxm1H2Q0PDSRUYjOSVYa6sUAEXIZFhD
	Rjw93p9j3PZBnwlxQvfhKYAFjeZyk0edRRH/oEKwjE0oynjoDRig5dznpAU07X2emQxOf3RhSPe
	HpasXLTn9/rDTyunJW6gfU4TXGs+EIJi0uioPddEtejgriSzdJGZqYseK+8PoEqBVNIq1deJcHb
	SgaFo0ugPpa4Q=
X-Google-Smtp-Source: AGHT+IEVkwqrjTWCnBpVreVh6mTv++RFn66C5H23Cshuzgm7R8r/2peZvlKSHirNuI9LIOVlcF6vLQ==
X-Received: by 2002:a17:902:d544:b0:261:6d61:f28d with SMTP id d9443c01a7336-290cc9bf243mr346647515ad.50.1761302384865;
        Fri, 24 Oct 2025 03:39:44 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dddbfd8sm52919845ad.2.2025.10.24.03.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:39:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C38CD4209E90; Fri, 24 Oct 2025 17:39:36 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Masaki Ota <masaki.ota@jp.alps.com>,
	George Anthony Vernon <contact@gvernon.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 2/2] Documentation: hid-alps: Format DataByte* subsection headings
Date: Fri, 24 Oct 2025 17:39:34 +0700
Message-ID: <20251024103934.20019-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251024103934.20019-1-bagasdotme@gmail.com>
References: <20251024103934.20019-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=bagasdotme@gmail.com; h=from:subject; bh=ihqHHh8OwZRzTv3PuAINRB9Afj/GqQ8V0nU3GCwr6d8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBm/w04emqpwcP39tt3WXpUym62CzyVwXJ9Q2lZuwN+sU dZ78K9NRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACainc/IMNFqr62r5c8U9oQz 7910RFb83Hhz/ldDFjPeh3sWm6uw3WNkmNLhdTWuwENx5/Qrpy8ceLj1jeeV7KSbe997TJDR1J0 pyQYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

"Command Read/Write" section has two DataByte* subsections describing
command bytes format. Add markup to these subsection heading texts.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/hid/hid-alps.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/hid/hid-alps.rst b/Documentation/hid/hid-alps.rst
index 3a22254e43464f..4a22a357f00c02 100644
--- a/Documentation/hid/hid-alps.rst
+++ b/Documentation/hid/hid-alps.rst
@@ -69,6 +69,7 @@ To read/write to RAM, need to send a command to the device.
 The command format is as below.
 
 DataByte(SET_REPORT)
+~~~~~~~~~~~~~~~~~~~~
 
 =====	======================
 Byte1	Command Byte
@@ -89,6 +90,7 @@ Value Byte is writing data when you send the write commands.
 When you read RAM, there is no meaning.
 
 DataByte(GET_REPORT)
+~~~~~~~~~~~~~~~~~~~~
 
 =====	======================
 Byte1	Response Byte
-- 
An old man doll... just what I always wanted! - Clara


