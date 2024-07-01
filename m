Return-Path: <linux-input+bounces-4785-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D191E988
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 22:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E18D31F22139
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 20:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD5616FF47;
	Mon,  1 Jul 2024 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jlnf9vLl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF72AD0C;
	Mon,  1 Jul 2024 20:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865483; cv=none; b=ll1QOrdkuf2KEVc96XF4sm7cGVko4HMWVKckE/T9DDtDzUU+tGgsVSAydbq6Zl+xj/rfoMzg7wAgXj2HAwcmnMAUCeGcjRHeUPvd68vbwEQwQWheZx4Ic06WK8JfIRmSwIHs9yTpzTEAaYANdiWAR7unzGt5ITOqKXGXWh1jDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865483; c=relaxed/simple;
	bh=pGfaDfTJ5hPA7m11uaaAQQ/rQyky9p+P/xcFhvAol3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGEP0n53WN2XozgR/nPWcoUaNrfGgX2LNWb9seVOGFZs+BbETf/Ng1x0dgoCinXJZINqSs/u56gvHyupXD3itYe71lhuVmLiDPumWXxKtPXAFwtKTGJws4aRYVf2/y+9JsRZ1n7/b7QdFobUR9gmZoyRlrZ16Um02k4vt9BTurw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jlnf9vLl; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-24c9f6338a4so1838602fac.1;
        Mon, 01 Jul 2024 13:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719865481; x=1720470281; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WWnJps2aStz9/uNjnenQ1aJAawo2zrYswcpaa1TUHM0=;
        b=Jlnf9vLlXjPv3CtLibQlkmV29oQX9W7X+/O3N5vq5Kr/6lkc7TCOt29RdKQmnT2z4W
         JcqRFVVFrhpqxqNcIm6ERwOC/5cmxPsbP/6qN1mpXj2ZkTC9FAYQbm1hQVBuxKMnj1pU
         dG03j5aCoGP055xovbk+HK+GjiqNcn23S56DSHu1ilgGJ9XpTLNcPf8cFtIWFgXvEGzZ
         CKjghGgl2JB+yoi6tnWxxqrWvFXzRpEISld3kMZqf7wmrGxSDkUMFYtRs909XLMTvjf6
         34Q88riWR7bLmJps3CQu2o7ec79nVMygziGHFkgFbu5/VHNhKlBrmefUeNqm6Z8s8W+W
         9nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719865481; x=1720470281;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWnJps2aStz9/uNjnenQ1aJAawo2zrYswcpaa1TUHM0=;
        b=mGIHeUvxEtsWZMSUkL3UDXWqDVXHWoOZG+47FbixY6n5umF/eDHMTy+a0h3gaTDOvk
         5+GGvDKcFGh/DuPK2sFGyullh6yB1tyjFmGRcGx7AMcsHfRvuS23blAO+vjH0C7xf5KQ
         RQ1BLqAeEsm4RS6kN7TuODjJBJuPRbeTliawbLt4LL3Y9A4V4McdRmw4wCx/d54lBma5
         yG1JFfkHY/d2Dv06fjKaMQStHDuzaKJMoYxKr738p1H3ovtzww/t8Fi33TLBUw6Mbf4u
         C3fkJnvqSZhXC8xeAU/IUUZmVEhKvzlG2/5F/vbkXwv5w9IszrIlxH3Kxs7JUF3R/8Qp
         h3AA==
X-Forwarded-Encrypted: i=1; AJvYcCWgvOcU1uTCEHdf8aQ/NduR7jycX/B9JDFCCX++lXKhKqEPfXXJOtv9KV6Tm7fCIERq/2+0uTxD7/BxqZipFBDIUVztKPtljF2UGwmWk4O5WHoB+MegjFcyctA1o9ilM0/xrk2G+0/h5sY=
X-Gm-Message-State: AOJu0YymIAwPa1mIoCpY0PWc378/rFsS2fgFssaTAXF6uUdQYuqjgfN0
	KYEUZP2kpp1IYT7GsNp+H13lWNfNkeOpdbB5569FEgO2sjlG002z4I8oRA==
X-Google-Smtp-Source: AGHT+IGNAh+bc7jtGPW2BxKgKJ8OPoZNCzHZoG8a6hMvGNkezBpUEISwkjTJToazvgm3V7QRv17YIQ==
X-Received: by 2002:a05:6870:d6a5:b0:255:26da:54f3 with SMTP id 586e51a60fabf-25db340e4ffmr6120891fac.4.1719865481035;
        Mon, 01 Jul 2024 13:24:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:97a3:bdcc:1a3b:f207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e635aasm7194611b3a.17.2024.07.01.13.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:24:40 -0700 (PDT)
Date: Mon, 1 Jul 2024 13:24:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH] Add libps2 to the input section of driver-api
Message-ID: <ZoMQhkyUQYi1Bx4t@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

libps2 has been using kerneldoc to document its methods, but was not
actually plugged into driver-api.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/driver-api/input.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/driver-api/input.rst b/Documentation/driver-api/input.rst
index 4bbb26ae2a89..bd7a3578ade7 100644
--- a/Documentation/driver-api/input.rst
+++ b/Documentation/driver-api/input.rst
@@ -40,3 +40,10 @@ Sparse keymap support
 .. kernel-doc:: drivers/input/sparse-keymap.c
    :export:
 
+PS/2 protocol support
+---------------------
+.. kernel-doc:: include/linux/libps2.h
+   :internal:
+
+.. kernel-doc:: drivers/input/serio/libps2.c
+   :export:
-- 
2.45.2.803.g4e1b14247a-goog


-- 
Dmitry

