Return-Path: <linux-input+bounces-11307-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BA4A72A28
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 07:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C49141764C3
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 06:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B101B040B;
	Thu, 27 Mar 2025 06:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Slx1x+X7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675771AAA10
	for <linux-input@vger.kernel.org>; Thu, 27 Mar 2025 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056860; cv=none; b=XvO5alBAV05ruUwERRZnbIBpxQCuhksM2gDyF/0phsXbAQHzixYhZbl8WBwtrhriARuM0gXc8LL2wjEm2EfU45wETaundUKQp1PJtDFTpnNGG5WShl8sICIDInuEzi2dOtvPcUt5j48tshu/rjkzJxzu+LtovX2ZTtu6F7oELP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056860; c=relaxed/simple;
	bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7cgWfO+cSDF7gkMfDTX/x4HH7IKfvyTh7my7ZnsEMV4bs9i6AwRFzJ36fOi+L3/cxWKbaPhqiXs2xaD2hLFiRSEVKcdVVFx/6pMlo2r9RdAY/ASP0FYY/GTSUo5c++IZy+bJJ4k2FBnSmXvrfoWIImwt42bAVc0TyDBnNFG4pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Slx1x+X7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3011737dda0so726417a91.1
        for <linux-input@vger.kernel.org>; Wed, 26 Mar 2025 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743056859; x=1743661659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=Slx1x+X77vv+lBm/QSo/JzDCg5zL3cE+6cCBpC5Bc8vE4vLaS8UZxH/mGc5tkh7PHD
         u8OaFfYX9eRqGiffN9GCxXgfXv3AUdb6YhuceWvYWMWAfUt6nKLoOAiAHzF5ZlxT845B
         qwnwdrqf8oL+k+bliBKFqj3oxl2rynksEqTdl6Px2APq5Et5xjnLFHHFO4XU1QnJRXQ2
         Y5GJie3APj8wN8RVlAeO4TRALaqhGjrUS1LA8UknXJ9RnOlTexp+YPIuOHpXEiqCyJlV
         7yubMZZX1d24EaVRZlQ+ZKl+7EVD3maOJobMB+YDq7kRunvauKf8rfQxALyKVJul8zsf
         z2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743056859; x=1743661659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=S98qsqeXwzTGa+z9BwxC4AKuATh841bTgBw1V9FAlJP7SNEulfYxVK/gLo4dXKYO4L
         u+a1Tj9ppzu5hCKjvln1iVsjFUd7NL7g1j22y1Y+oM6oo/N3ujKVopQ87tGjYP2fcPFj
         tCOxS9oJ1QJFkKyOOiIsfBNrXzxrpbowh9Fn0Vgn2VSIKY5TVKedzNz2Fm90Ah/pg/eA
         G9OZk7rTIzlqXPqW3JbdIBXEquLF5lJWnagKhtHbyc6pY3MxG3eV73D/suZnP0QntVRP
         ymdEbYIm8Bp6xAzK1epBOHMuBdMAkltmjwNInBfVcsfbeUCzb88W0x5yObbLg1ph+otX
         NZwg==
X-Forwarded-Encrypted: i=1; AJvYcCU+c+VRu5DHQmN/UosfRoIFv2jwYOZ324XZs1e7PvIaK8iChmPWVeiALJcFFNzGIAf8iFwFARgBt5iuvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt5PZYxrFP1jRZ8KJ5Gm9BORoQ0R2N+O20o8qWixf6CqpvG/sA
	cQplUvanf9YE6aiVpUKIA20rzyry/MiHbgcqwe8C6CfGveUIXgstC4cUZQS2Ks4VbA9eKedNSPB
	nO9X2J7JTTLa44AC5ynPSqsS55XIoeJFPgsT+
X-Gm-Gg: ASbGncuqZb/i6PI53VV8f3RwusBiYGRp12WzXGeNRdS+dZww99+C+vbZKf1cfLOUnPC
	56rhS81hyPIdF/z9z/F85AvNo//g/vy4oRU5p9g0FEvTNCRo2+fks8Fdm/urzaNanomSyBNsIIB
	QYH0lJEiVbWrICfVSjffa6JQhhCmyQdv+lhdvnr9o2XPKH+xJEDkU0aaNc
X-Google-Smtp-Source: AGHT+IFt7Uet3UwCNOAH8meYB2W9ViJLDi7wcmCNPw9mSbfJ0sSbyamjROCSnSFkmO0FUw183zFiWc7Rnl9Qc4okr5s=
X-Received: by 2002:a17:90b:354e:b0:304:ec28:4437 with SMTP id
 98e67ed59e1d1-304ec284935mr218399a91.22.1743056858259; Wed, 26 Mar 2025
 23:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-2-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-2-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 27 Mar 2025 14:27:00 +0800
X-Gm-Features: AQ5f1JoUEAB76GccOuQU5OR51PoZ29U3C8QHFwNl_oTL2dvwjiuuxHuLDi3FutQ
Message-ID: <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

We have implemented and verified the USB audio offloading feature with
the xhci sideband driver on our Google Pixel products. We would
appreciate it if this solution can be accepted. Thank you all for the
work!

