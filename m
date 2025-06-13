Return-Path: <linux-input+bounces-12872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723ACAD806E
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 03:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E59DC3A4F08
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 01:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F261DE4C2;
	Fri, 13 Jun 2025 01:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQl/YBRe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1D155725;
	Fri, 13 Jun 2025 01:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779020; cv=none; b=Qt1ForpnxIr4CxibHylYRfDI2GQK8VFS2m6xqXeYeE1C2j8nuPXPFO6otCD+63eVcxjuDWWcEeFIuA8FbtWqmnt1mpZmNyp+NsXDuHOxYQ2DRCRdJ5TgyF0mwliwsCvLHF4XBq4upZ7uE5AGSZRXfrDclJomTGbxYNb+keN9ywQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779020; c=relaxed/simple;
	bh=2SLwzx0bWQvqoMV0uD1JLkL5ZdxoSzjaZlReV/H3F0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KodQLQTDdywiiaLx9zY/UhwrD4zvJUBsrhpq7x4TK5qb12gGw3fLQSryRspTVdk0RPzGT6ocbpDtW75Lq1u06zq4lC6zj533MJ/3rUoXZ2MB+AfkQnKuaktwaN1dz15cV8bvS5tvtrVclmQYU4OY3+T7EbQ925lY0AJKz9/eXT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQl/YBRe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235f9ea8d08so16030955ad.1;
        Thu, 12 Jun 2025 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749779016; x=1750383816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh5c7g6WbYJHSFHK2AxmEKyJNy5OpKeCmaZt4d/GJyk=;
        b=RQl/YBRe5RcOl/VLaouh/gni5dEhwJDo8xVFdCCAtVPO3mKTN7OqDrz0z1wS/Fdr7Q
         +Rqb8ikBfYMNvVXi2jnT4r0nANghiEeoR9m/9UF8W0o1DIriKKUUgoiH+cptLAc5im1f
         dySHFcWlsZ8sfE06yoiF74bkUrKb+FSBqiuNTvdqxfFOpXFj8jb3KaDxwAZt2doOZs4c
         pjbmFVTL/iQUGfLp5+8sOldO43wiH9gvoNb5fSpcoXxuRwXycZbYFdw4qZQGSaTbmjAw
         vavf+C2/jOx7lrqVhYG3Nm3ltcB0tEhhUlrXf29VnqhgLBdZxL41GeHc00RkQGU4vTMI
         oWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749779016; x=1750383816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wh5c7g6WbYJHSFHK2AxmEKyJNy5OpKeCmaZt4d/GJyk=;
        b=L5abRsIBd/g5U0IWNiDwyk6zUAioxw/Q5liDSNAe2aMGAKfoU+BY1nRJATJ5ibCClp
         Quii2w6lZPzwl8bmH5RjnDYByGaIRurKbQydaV6PxgHXZxlA7SW+7j4l34HBKh3aPclO
         jTOOetFBFujiAcqQkVtpcqZ3r16L4x12c/BULYEyBBMQBZNkEpvEO1Ncgf4Lok3hr0GV
         vG2wzhaIQ1gjsnu3Et8KIZrLR9YMmrbC2D/9mAUyxS6eXd0sSv+zFnkjtC1aRTh7fwzf
         yw/eKyYD1a2OgAFXV6DPM752/nBAC85bsLS4FmrxTz08FCIU3ZvjXkPtwAcPeB5v/dKC
         T+aA==
X-Forwarded-Encrypted: i=1; AJvYcCUB0iy6LO4Nw3teilxDl7TjYMZskSmsX6kCOFUq/jrhmqHdhTPVyuFZVq9uLI+ItNm120hTILivLOg=@vger.kernel.org, AJvYcCVe69o7dhvcuUCGU0ZBCLGMXH/hu13QsMcOaeE12o8LICJsR20nIM/VejastK8/yKed3mftbDlvY3MT+24=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8hzQ6nY/2HZmo3Qq2TBCnlZjF/9MWurr4bt4Mo73gc42WBR9+
	4pQN/Dfm6J9Hy075HiSdvFBu9V1p5Y9cTCu2mMwY7/0sjsGCuX4xG1b/
X-Gm-Gg: ASbGncu1H+amUeBKZkwHV72bSLwpTYFQYDb9hbIgMAZ8Oull3EJpjvSe6ZTkGH9mlvT
	ZqoZFZvv6Gxqof5m6zsn1YloEvSAmin1xs5UCbTL7eYWn6nHCK98vlLPUakwhClfHOXc31JvTya
	Xg6xAJmEbhl9tdYy7FskmJ5vzhZyFrsLwFUqrjx/EL7rPJZz1vjfNjCqnlUmtG6MDZWZ8OFwFlF
	OqAG7zGVo2wgP3+SVmzkHP8NsCYpU2rMUJoO8Db2DEHm7q/z4kOCqJZy3RgFlLVtY7ChdTm6ZQa
	Nfo0XSgmaYn1m4xWKHAFE1zIijTW+QA2wfm5THPmo1G4XBTHUyG0JUZmB4+5uWBjyaKxDLDv
X-Google-Smtp-Source: AGHT+IHinEDiv1sleoeZ9JFY+Z7q8b4xq+cXmtA9YdKmIHs0akX6IFB7eVtLjoy9wQYOjxr976N2vw==
X-Received: by 2002:a17:902:ecc9:b0:235:c973:ba20 with SMTP id d9443c01a7336-2365de3fff6mr16972405ad.49.1749779016179;
        Thu, 12 Jun 2025 18:43:36 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d0b12sm3770575ad.253.2025.06.12.18.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:43:35 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C9A6A4209E8D; Fri, 13 Jun 2025 08:43:30 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Even Xu <even.xu@intel.com>,
	Chong Han <chong.han@intel.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] HID: intel-thc-hid: Separate max input size control conditional list
Date: Fri, 13 Jun 2025 08:43:27 +0700
Message-ID: <20250613014327.11514-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=bagasdotme@gmail.com; h=from:subject; bh=2SLwzx0bWQvqoMV0uD1JLkL5ZdxoSzjaZlReV/H3F0U=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnejdcTHWYuux4tXfgq3TItZYHzghfvnNgObHHbu8LOa s/Hf51NHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjIrqeMDPPPOhwOMv3yfvLl N+snvlgdZvuxvzD/8JKzFyqWLvdhPGTJyNB63rMr8u8dt9CF9l46X8P5562WnnePf5n9FUPj6IM KexgB
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports htmldocs warning:

Documentation/hid/intel-thc-hid.rst:200: ERROR: Unexpected indentation. [docutils]

Separate conditional list for max input size control by a blank line
to fix the warning.

Fixes: 45e92a093099 ("HID: Intel-thc-hid: Intel-thc: Introduce max input size control")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250611142409.7d4683b0@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/hid/intel-thc-hid.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/intel-thc-hid.rst
index 23d5110cb8710a..8b378c57b5aac0 100644
--- a/Documentation/hid/intel-thc-hid.rst
+++ b/Documentation/hid/intel-thc-hid.rst
@@ -195,6 +195,7 @@ This is a new feature introduced in Panther Lake platform, THC hardware allows d
 a max input size for RxDMA. After this max size gets set and enabled, for every input report
 packet reading, THC hardware sequencer will first read incoming input packet size, then compare
 input packet size with the given max size:
+
 - if input packet size <= max size, THC continues using input packet size to finish the reading
 - if input packet size > max size, there is potential input data crash risk during
   transferring, THC will use max size instead of input packet size for reading

base-commit: da04eb7791c461bc0f113ce96af4ed59bcc12555
-- 
An old man doll... just what I always wanted! - Clara


