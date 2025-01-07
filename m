Return-Path: <linux-input+bounces-8988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D294A038CC
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 08:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E56BC1880988
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 07:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA0E1E0DCC;
	Tue,  7 Jan 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfKpe06Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D001E1023
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736235106; cv=none; b=rrVdoIfHf0XrP3YF06jnQ8C4E7op2Bz8DxEgVFIRutAoEd8G3yZdiDwjqMY3Wl9k5Xk0BlN+0B4RJHfKzXhLVijn8dJ0CU9F/mGQWi3Bc0LoEwchiIgCZbxiaPEPapKLAqocjp1Yh+oj+sFrCSCWASiwSrNylhOl4O9uwcTvOxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736235106; c=relaxed/simple;
	bh=4bq23vMkAcIJaxdhZfBm4uYHWTbieMo68Um41/hX59o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=me6WD8+f/ZUJGn85X2qrfbr8nbmSYP3X6hwoWXnSge4dCRrSG9kxklMt/8GVTcY5MfqiR8U72pTwqfZMV7nQtrn6W5QJOZRGEvMSVM4FLiGuxslzhCONCNp5q7H/v+IRhqFbK0YDeetBMSSIvxmFKe7pk/EshHCot11eBGF8H8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfKpe06Z; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so3119567a91.0
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 23:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736235103; x=1736839903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bq23vMkAcIJaxdhZfBm4uYHWTbieMo68Um41/hX59o=;
        b=AfKpe06Z4iRvuN7sHI5a734cAz/oEdkK9FnBeGedepJNXyaKweNQY20mAg/0aF6EMN
         X77jyyIfdFMp9v006q4WKiUqNyHl90GYasaL5aB+Zi0tSI3H1+skfqnYub3cm39mSMPw
         bVu2mtgymHyl6oJ22TMllaXCILzWCKRv5gU5EfLeOK1jw4Af0xK2BdATHy86bTr34VoY
         VNKtLgscKN3pHVTlq8mzZDY8SUiUB145edMni+Feldqv1hliUJYiUYwPq4PPc6kRExT+
         dTaP76GH69P5qszHHMepHqWhn/hQZvX8JrM2kxGIJCRa4qvPVzJfE9hs3r6mLs2DyFcE
         iq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736235103; x=1736839903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bq23vMkAcIJaxdhZfBm4uYHWTbieMo68Um41/hX59o=;
        b=b7NvtX6Wei2JMpa55OLrsn5RxybaF4KK/4OE+efDdYLNakRnmv/VCD9rjrN2qd30uR
         o7LE/HLbg5dNHqvk4QZ9FaRU4SvzRekHcc+Xi8GcK58Yl2n0PCW8ex9/b0wPq/Zhray/
         ZCJA7fNo5IvfkWg0htPLOvPnChRCvorRS86qGfITe+zsjMk5J9lzTfQ5JtwbhXsjRm6m
         wL1Bu9y1fD75VHcQVlGIVCWqPGJdW6x8NVrMmuXjSvIQTvkdpWuD/Dm9zvYP+o1fNxnr
         Il2czSFs+MmPVQT22WHxLX7VLVcMB1CCUwPzzERYrRzDUbb8f6uvi0zaY/HKXkFL7BIT
         3Q+A==
X-Forwarded-Encrypted: i=1; AJvYcCV21bU8HjUSDFVGeDh+4x+Vw8ZQ3adc4epZUz2+OUKJcpwdKov+6EDTUU4fNXC5HGLTmAagmyoCUIqSsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpZ/hx/KI9/9mu9wGcuMzcY3FsCezKUtJJzzRvgw3PanYP6eL
	ZyGFmDXgl6x2xJ0Bol1eZt9PI/0+BriGz+yGZR3f8Cq9vFSp2rwvUl+HDIyL
X-Gm-Gg: ASbGnctk/HoRCs0K0IW5aSRVLoLlM8O4LXF+3WvueAnt14akooxLooeDSCn3056OvYO
	2G+sv8u0BP1xO6FUD39pwDpzFry+bJ/WMPl/RNjA6mn7vUP+APiaAthPZQMDIrZgWTkU5IiKRts
	ftInUGc0pqi2F2ognD2JvCrGpXt+1Ly1j/KHgM82L4OITtiQu3kGulcahanjlNyz71uISzWZqlv
	BR2ewsgyQ6Uw0wY1ckAYy79ztE0eD2yPxoZneveZWDj8Cj88eTbrLJ1AzoPFSpHg4UOGoWMmjMY
	nw==
X-Google-Smtp-Source: AGHT+IH3eOG4sf4HIa/YRh3Mm6hQbvW8aDIQcjdCxbDp7lG23qWyzMI+eFVBOJHG25YSuUZhzbpAvw==
X-Received: by 2002:a05:6a00:3e0c:b0:725:f1f2:43eb with SMTP id d2e1a72fcca58-72abdeeed63mr30710875b3a.6.1736235102992;
        Mon, 06 Jan 2025 23:31:42 -0800 (PST)
Received: from localhost.localdomain ([2804:18:104:da62:a0d0:2c3e:4e0f:19d9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm29879999a12.4.2025.01.06.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 23:31:42 -0800 (PST)
From: Nilton Perim Neto <niltonperimneto@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	niltonperimneto@gmail.com,
	rojtberg@gmail.com
Subject: made changes to the commit message of Input: xpad - added unofficial Xbox 360 wireless receiver clone
Date: Tue,  7 Jan 2025 04:31:35 -0300
Message-ID: <20250107073135.56538-1-niltonperimneto@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <2025010720-guidable-profound-c3b9@gregkh>
References: <2025010720-guidable-profound-c3b9@gregkh>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is my first time using git, I apologize. I guess put it like the following

>Added 360 wireless receiver clone that mimics Microsoft's VID
>
>Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>

