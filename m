Return-Path: <linux-input+bounces-7970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16B9C1657
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 07:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA721C2266B
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 06:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D82C8F54;
	Fri,  8 Nov 2024 06:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYYqRoUj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8906E7489
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731046159; cv=none; b=OUeqNiA6xbBj9x9N5A0KYBdtLOeBBxA4vxNUok8tvAqHJIMPcZfHx1MOurNMvw3r3YRczYuA0zZAGxyw+WSTJjaF/uBF68gDBCCJLOddSCfWleLZJ6+YcNGwAK3vR1yvObqry16DRLcLMoAdJPLf02WM0/mLgSFXvEec49GUksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731046159; c=relaxed/simple;
	bh=Li/f0NXYnNkHGOMnm42krXSNpk7dM7ozmWOOocpZrV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRbZgpIDas2pUhPHEp3SkkDC/LvnBR2UOzgVbp05hyAy5PPxSSBwplTqrZicJxYHANIsQ7g1/IAxEMpXq5idn+l900Ni03M6n+4pgUH7b3DGkQMFMyxPg5sT5+HAGzbYFiP+MqAczi4wCelhY73fm/N4ZkxrKLkjAZfhjeh5e88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYYqRoUj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20ca1b6a80aso20385135ad.2
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 22:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731046158; x=1731650958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AtoeQsrMuIdfRLrQMGXI8/XZR5wOL/H5sMF0+Bb05dc=;
        b=hYYqRoUjLJkBLrLVVFLwiFDThjQI9F+vw9H6M5oC4bKs6rhcb9wCnkkH3RZlEU2Lem
         6AsokSxEd/KJP8yTw4V3yrNO9NDwRJHu0qJYHsHCYZALzEcMpQ+OvrYSGaW5x2AtcAGW
         CEPKLKsnf82PADUfcjeuPS5B71/ge9ZvtinyUmTTwjL5JI4ZdRdZG3E1hc5roTi0tnE8
         TQQLXgpQVFlLI1qtvI0rOMl5aRL1RhOdNAv10Lwatt9p20DnczOa1RssAMtBsRWra4go
         r9WKFgHxfSwd3IeL1A8/bSdnQNRo1w8tfZEPvFZ15rbFDGz7jeKLFMtq5MZlfHTg/N4o
         P20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731046158; x=1731650958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtoeQsrMuIdfRLrQMGXI8/XZR5wOL/H5sMF0+Bb05dc=;
        b=FgF5sqoMTzpmN1ZTz4vdbEOzP45aPDqOO6p2NvNtvum1bUhMa9+NRGr31mzA6DVqIk
         OgY/tqhXUW4UpLh74YG/tdAQENVuicqPEnql6plSmi2a0JzyjTOTp+AZHe6BOX8Xb5o3
         Uza8AR1brdlIeydn+B0T+PpAoyNkTb+kC69IVLpKw+Z9SCrxintKT7Kc4iHQzaYJmjjC
         MlU/glRncsINOlLgea36Hq3c9O/JK/6GKgxN9/aCjS/95gNE0FoLhI/S6L4n7pFBLyl/
         G26b9CD2MLLCN7FMIcIb4RWCBDsOBY83WtaJBsM1Zj1wD2Ry3RaBB442sH9txL3c4FfB
         iI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGUCz0QJ2hCwc1ZhyilowyXKoUhTW7jeDTGjujE5XrDslM1PNjK97TmoRNXeNOpzecD8AZZUvq83LjHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZiGG2gdk6WI4I9KPE5/Ejsk/92UbRMzyXm83hSrrsYouTmUJ
	CyP4Uu0+3Hnutzc6+aqDzhEKVD1vwBdBRZeb4zP1d1AX4j3baBf+
X-Google-Smtp-Source: AGHT+IHOf0Ovw+jqO9f36hoi3ayLIhC9Wjj0Cu0N48neqF+dlqDGCw+XARLgDeUWAykOKA+KxOS8yQ==
X-Received: by 2002:a17:903:18b:b0:20c:763e:d9cc with SMTP id d9443c01a7336-21183c7e021mr17499455ad.7.1731046157732;
        Thu, 07 Nov 2024 22:09:17 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9aed:7ea4:c2e6:9e3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6e0acsm22980155ad.257.2024.11.07.22.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 22:09:15 -0800 (PST)
Date: Thu, 7 Nov 2024 22:09:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yuan Can <yuancan@huawei.com>
Cc: jogletre@opensource.cirrus.com, fred.treven@cirrus.com,
	ben.bright@cirrus.com, jeff@labundy.com, lee@kernel.org,
	patches@opensource.cirrus.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: cs40l50 - Fix wrong usage of INIT_WORK()
Message-ID: <Zy2rCf8eAAAHxJ_w@google.com>
References: <20241106013549.78142-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106013549.78142-1-yuancan@huawei.com>

On Wed, Nov 06, 2024 at 09:35:49AM +0800, Yuan Can wrote:
> In cs40l50_add(), the work_data is a local variable and the work_data.work
> should initialize with INIT_WORK_ONSTACK() instead of INIT_WORK().
> Small error in cs40l50_erase() also fixed in this commit.
> 
> Fixes: c38fe1bb5d21 ("Input: cs40l50 - Add support for the CS40L50 haptic driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Applied, thank you.

-- 
Dmitry

